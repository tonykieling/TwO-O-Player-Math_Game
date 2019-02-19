# this class is responsable to create questions to the game

class Questions
  def generate_question
    a = rand(20)
    b = rand(20)

    ["What does #{a} plus #{b} equal?", (a + b)]
  end
end

