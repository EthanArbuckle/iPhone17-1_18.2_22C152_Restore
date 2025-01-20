@interface TIPathAction
- (TIPathAction)initWithCoder:(id)a3;
- (TIPathAction)initWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4;
- (unint64_t)syllableCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIPathAction

- (unint64_t)syllableCount
{
  return self->_syllableCount;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIPathAction;
  id v4 = a3;
  [(TIUserAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_syllableCount, @"syllableCount", v5.receiver, v5.super_class);
}

- (TIPathAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TIPathAction;
  objc_super v5 = [(TIUserAction *)&v8 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    [(TIUserAction *)v5 setActionType:4];
    v6->_syllableCount = [v4 decodeIntegerForKey:@"syllableCount"];
  }

  return v6;
}

- (TIPathAction)initWithSyllableCount:(unint64_t)a3 keyboardState:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TIPathAction;
  objc_super v5 = [(TIUserAction *)&v8 initWithTIKeyboardState:a4];
  v6 = v5;
  if (v5)
  {
    [(TIUserAction *)v5 setActionType:4];
    v6->_syllableCount = a3;
  }
  return v6;
}

@end