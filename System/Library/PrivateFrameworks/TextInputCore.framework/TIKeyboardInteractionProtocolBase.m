@interface TIKeyboardInteractionProtocolBase
+ (BOOL)supportsSecureCoding;
- (TIKeyboardInteractionProtocolBase)initWithCoder:(id)a3;
- (TIKeyboardInteractionProtocolBase)initWithKeyboardState:(id)a3;
- (TIKeyboardState)keyboardState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIKeyboardInteractionProtocolBase

- (void).cxx_destruct
{
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)encodeWithCoder:(id)a3
{
}

- (TIKeyboardInteractionProtocolBase)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolBase;
  v5 = [(TIKeyboardInteractionProtocolBase *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;
  }
  return v5;
}

- (TIKeyboardInteractionProtocolBase)initWithKeyboardState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolBase;
  uint64_t v6 = [(TIKeyboardInteractionProtocolBase *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keyboardState, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end