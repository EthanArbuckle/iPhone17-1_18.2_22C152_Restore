@interface OTPairingPacketContext
- (NSData)packetData;
- (NSDictionary)message;
- (NSError)error;
- (NSString)fromID;
- (NSString)incomingResponseIdentifier;
- (NSString)outgoingResponseIdentifier;
- (NSString)sessionIdentifier;
- (OTPairingPacketContext)initWithMessage:(id)a3 fromID:(id)a4 context:(id)a5;
- (int)messageType;
- (void)setFromID:(id)a3;
- (void)setIncomingResponseIdentifier:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOutgoingResponseIdentifier:(id)a3;
@end

@implementation OTPairingPacketContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_outgoingResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_incomingResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_fromID, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

- (void)setOutgoingResponseIdentifier:(id)a3
{
}

- (NSString)outgoingResponseIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIncomingResponseIdentifier:(id)a3
{
}

- (NSString)incomingResponseIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFromID:(id)a3
{
}

- (NSString)fromID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessage:(id)a3
{
}

- (NSDictionary)message
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSError)error
{
  if ([(OTPairingPacketContext *)self messageType] == 2)
  {
    error = self->_error;
    if (!error)
    {
      v4 = [(OTPairingPacketContext *)self message];
      v5 = [v4 objectForKeyedSubscript:@"error"];

      v6 = +[NSError errorWithDomain:@"com.apple.security.otpaird" code:4 description:v5];
      v7 = self->_error;
      self->_error = v6;

      error = self->_error;
    }
    v8 = error;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSData)packetData
{
  v2 = [(OTPairingPacketContext *)self message];
  v3 = [v2 objectForKeyedSubscript:@"packet"];

  return (NSData *)v3;
}

- (NSString)sessionIdentifier
{
  v2 = [(OTPairingPacketContext *)self message];
  v3 = [v2 objectForKeyedSubscript:@"session"];

  return (NSString *)v3;
}

- (int)messageType
{
  v3 = [(OTPairingPacketContext *)self message];
  v4 = [v3 objectForKeyedSubscript:@"m"];

  if (v4)
  {
    int v5 = [v4 intValue];
  }
  else
  {
    v6 = [(OTPairingPacketContext *)self packetData];

    if (v6) {
      int v5 = 1;
    }
    else {
      int v5 = 2;
    }
  }

  return v5;
}

- (OTPairingPacketContext)initWithMessage:(id)a3 fromID:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)OTPairingPacketContext;
  v11 = [(OTPairingPacketContext *)&v16 init];
  v12 = v11;
  if (v11)
  {
    [(OTPairingPacketContext *)v11 setMessage:v8];
    [(OTPairingPacketContext *)v12 setFromID:v9];
    v13 = [v10 incomingResponseIdentifier];
    [(OTPairingPacketContext *)v12 setIncomingResponseIdentifier:v13];

    v14 = [v10 outgoingResponseIdentifier];
    [(OTPairingPacketContext *)v12 setOutgoingResponseIdentifier:v14];
  }
  return v12;
}

@end