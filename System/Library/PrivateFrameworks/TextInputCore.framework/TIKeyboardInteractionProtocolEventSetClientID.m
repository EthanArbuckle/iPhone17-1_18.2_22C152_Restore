@interface TIKeyboardInteractionProtocolEventSetClientID
+ (BOOL)supportsSecureCoding;
- (NSString)clientID;
- (NSString)description;
- (TIKeyboardInteractionProtocolEventSetClientID)initWithClientID:(id)a3 keyboardState:(id)a4;
- (TIKeyboardInteractionProtocolEventSetClientID)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)sendTo:(id)a3;
@end

@implementation TIKeyboardInteractionProtocolEventSetClientID

- (void).cxx_destruct
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<SetClientID: %@>", self->_clientID];
}

- (void)sendTo:(id)a3
{
  clientID = self->_clientID;
  id v5 = a3;
  id v6 = [(TIKeyboardInteractionProtocolBase *)self keyboardState];
  [v5 setClientID:clientID keyboardState:v6];
}

- (TIKeyboardInteractionProtocolEventSetClientID)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInteractionProtocolEventSetClientID;
  id v5 = [(TIKeyboardInteractionProtocolBase *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientID"];
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInteractionProtocolEventSetClientID;
  id v4 = a3;
  [(TIKeyboardInteractionProtocolBase *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientID, @"clientID", v5.receiver, v5.super_class);
}

- (TIKeyboardInteractionProtocolEventSetClientID)initWithClientID:(id)a3 keyboardState:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInteractionProtocolEventSetClientID;
  v8 = [(TIKeyboardInteractionProtocolBase *)&v11 initWithKeyboardState:a4];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_clientID, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end