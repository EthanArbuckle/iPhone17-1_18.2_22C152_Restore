@interface TIKeyboardInteractionProtocolEventLayoutDidChange
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (TIKeyboardInteractionProtocolEventLayoutDidChange)initWithCoder:(id)a3;
- (TIKeyboardInteractionProtocolEventLayoutDidChange)initWithLayout:(id)a3 keyboardState:(id)a4;
- (TIKeyboardLayout)keyLayout;
- (void)encodeWithCoder:(id)a3;
- (void)sendTo:(id)a3;
@end

@implementation TIKeyboardInteractionProtocolEventLayoutDidChange

- (void).cxx_destruct
{
}

- (TIKeyboardLayout)keyLayout
{
  return self->_keyLayout;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<LayoutDidChange=%@>", self->_keyLayout];
}

- (void)sendTo:(id)a3
{
  keyLayout = self->_keyLayout;
  id v5 = a3;
  id v6 = [(TIKeyboardInteractionProtocolBase *)self keyboardState];
  [v5 layoutDidChange:keyLayout keyboardState:v6];
}

- (TIKeyboardInteractionProtocolEventLayoutDidChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventLayoutDidChange;
  id v5 = [(TIKeyboardInteractionProtocolBase *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyLayout"];
    keyLayout = v5->_keyLayout;
    v5->_keyLayout = (TIKeyboardLayout *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInteractionProtocolEventLayoutDidChange;
  id v4 = a3;
  [(TIKeyboardInteractionProtocolBase *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyLayout, @"keyLayout", v5.receiver, v5.super_class);
}

- (TIKeyboardInteractionProtocolEventLayoutDidChange)initWithLayout:(id)a3 keyboardState:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInteractionProtocolEventLayoutDidChange;
  v8 = [(TIKeyboardInteractionProtocolBase *)&v11 initWithKeyboardState:a4];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_keyLayout, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end