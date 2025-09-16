

defmodule Subject do

  defstruct [:name, :result]
end

defmodule Student do
 
  defstruct [:name, :results]
end

defmodule Calculator do
  def start do
    joao = %Student{
      name: "João Joaquim",
      results: build_subjects([5.2, 3.9, 2.7, 9.8])
    }

    maria = %Student{
      name: "Maria da Silva",
      results: build_subjects([8.4, 7.5, 9.4, 2.8])
    }

    pedro = %Student{
      name: "Pedro Pedrada",
      results: build_subjects([1.3, 8.5, 8.9, 7.6])
    }

    kaua = %Student{
      name: "Kauã Camboinhas",
      results: build_subjects([5.4, 4.9, 2.2, 3.8])
    }

    calculated_results = calculate([joao, maria, pedro, kaua])
    best = best_result(calculated_results)

    {calculated_results, best}
  end

  defp calculate(students) do
    Enum.map(students, fn student ->
   
      [first_name | last_name_parts] = String.split(student.name, " ")

      %{
        first_name: first_name,
        last_name: Enum.join(last_name_parts, " "),
        average: average(student)
      }
    end)
  end

  defp average(student) do

    grades = Enum.map(student.results, &(&1.result))
    total = Enum.count(grades)
    sum_of_grades = Enum.sum(grades)


    if total > 0 do
      Float.round(sum_of_grades / total_grades, 2)
    else
      0.0
    end
  end

  defp best_result(students) do

    melhores = students |> Enum.map(&(&1.average)) |> Enum.max()


    Enum.filter(students, &(&1.average == melhores))
  end

end

Calculator.start()
