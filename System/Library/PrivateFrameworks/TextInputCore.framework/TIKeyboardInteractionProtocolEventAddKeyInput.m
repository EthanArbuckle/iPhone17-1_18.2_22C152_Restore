@interface TIKeyboardInteractionProtocolEventAddKeyInput
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (TIKeyboardInput)keyboardInput;
- (TIKeyboardInteractionProtocolEventAddKeyInput)initWithCoder:(id)a3;
- (TIKeyboardInteractionProtocolEventAddKeyInput)initWithKeyInput:(id)a3 keyboardState:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)sendTo:(id)a3;
@end

@implementation TIKeyboardInteractionProtocolEventAddKeyInput

- (void).cxx_destruct
{
}

- (TIKeyboardInput)keyboardInput
{
  return self->_keyboardInput;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<AddKeyInput: %@>", self->_keyboardInput];
}

- (void)sendTo:(id)a3
{
  keyboardInput = self->_keyboardInput;
  id v5 = a3;
  id v6 = [(TIKeyboardInteractionProtocolBase *)self keyboardState];
  [v5 addKeyInput:keyboardInput keyboardState:v6];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInteractionProtocolEventAddKeyInput;
  id v4 = a3;
  [(TIKeyboardInteractionProtocolBase *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyboardInput, @"keyboardInput", v5.receiver, v5.super_class);
}

- (TIKeyboardInteractionProtocolEventAddKeyInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventAddKeyInput;
  objc_super v5 = [(TIKeyboardInteractionProtocolBase *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardInput"];
    keyboardInput = v5->_keyboardInput;
    v5->_keyboardInput = (TIKeyboardInput *)v6;
  }
  return v5;
}

- (TIKeyboardInteractionProtocolEventAddKeyInput)initWithKeyInput:(id)a3 keyboardState:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInteractionProtocolEventAddKeyInput;
  v8 = [(TIKeyboardInteractionProtocolBase *)&v11 initWithKeyboardState:a4];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_keyboardInput, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end