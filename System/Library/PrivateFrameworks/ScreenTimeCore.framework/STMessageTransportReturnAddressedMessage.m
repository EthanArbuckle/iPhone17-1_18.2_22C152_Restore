@interface STMessageTransportReturnAddressedMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessage:(id)a3;
- (STMessageTransportMessage)message;
- (STMessageTransportMessageAddress)returnAddress;
- (STMessageTransportReturnAddressedMessage)initWithCoder:(id)a3;
- (STMessageTransportReturnAddressedMessage)initWithMessage:(id)a3 returnAddress:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STMessageTransportReturnAddressedMessage

- (STMessageTransportReturnAddressedMessage)initWithMessage:(id)a3 returnAddress:(id)a4
{
  STMessageTransportMessageAddress *returnAddress;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STMessageTransportReturnAddressedMessage;
  id v5 = a4;
  id v6 = a3;
  v7 = [(STMessageTransportReturnAddressedMessage *)&v13 init];
  v8 = (STMessageTransportMessage *)objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  message = v7->_message;
  v7->_message = v8;

  v10 = (STMessageTransportMessageAddress *)[v5 copy];
  returnAddress = v7->_returnAddress;
  v7->_returnAddress = v10;

  return v7;
}

- (STMessageTransportReturnAddressedMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"returnAddress"];

  v7 = [(STMessageTransportReturnAddressedMessage *)self initWithMessage:v5 returnAddress:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  message = self->_message;
  id v5 = a3;
  [v5 encodeObject:message forKey:@"message"];
  [v5 encodeObject:self->_returnAddress forKey:@"returnAddress"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STMessageTransportReturnAddressedMessage *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STMessageTransportReturnAddressedMessage *)self isEqualToMessage:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToMessage:(id)a3
{
  id v4 = (STMessageTransportReturnAddressedMessage *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    id v6 = [(STMessageTransportReturnAddressedMessage *)v4 message];
    v7 = [(STMessageTransportReturnAddressedMessage *)self message];
    if ([v6 isEqualToMessage:v7])
    {
      v8 = [(STMessageTransportReturnAddressedMessage *)v5 returnAddress];
      v9 = [(STMessageTransportReturnAddressedMessage *)self returnAddress];
      unsigned __int8 v10 = [v8 isEqualToMessageAddress:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  v3 = [(STMessageTransportReturnAddressedMessage *)self message];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(STMessageTransportReturnAddressedMessage *)self returnAddress];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (STMessageTransportMessage)message
{
  return (STMessageTransportMessage *)objc_getProperty(self, a2, 8, 1);
}

- (STMessageTransportMessageAddress)returnAddress
{
  return (STMessageTransportMessageAddress *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returnAddress, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end