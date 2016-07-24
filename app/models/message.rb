class Message < ActiveRecord::Base
    #名前は必須かつ２０文字以内
    validates :name, length:{maximum: 20}, presence: true
    #内容は必須かつ２文字以上３０文字以内
    validates :body, length: {minimum: 2,maximum: 30},presence: true
    #数値入力必須かつ0以上１００未満
    validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 100 }, presence: true
end
