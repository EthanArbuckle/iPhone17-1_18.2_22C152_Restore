@interface STTransportEnvoyMessageEnvelope
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTransportEnvoyMessageEnvelope:(id)a3;
- (NSSet)addresses;
- (STMessageTransportMessage)message;
- (STTransportEnvoyMessageEnvelope)initWithMessage:(id)a3 addresses:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation STTransportEnvoyMessageEnvelope

- (STTransportEnvoyMessageEnvelope)initWithMessage:(id)a3 addresses:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)STTransportEnvoyMessageEnvelope;
  id v5 = a4;
  id v6 = a3;
  v7 = [(STTransportEnvoyMessageEnvelope *)&v13 init];
  v8 = (STMessageTransportMessage *)objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  message = v7->_message;
  v7->_message = v8;

  v10 = (NSSet *)[v5 copy];
  addresses = v7->_addresses;
  v7->_addresses = v10;

  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STTransportEnvoyMessageEnvelope *)self message];
  id v5 = [(STTransportEnvoyMessageEnvelope *)self addresses];
  id v6 = +[NSString stringWithFormat:@"<%@: %p { Message: %@ Addresses: %@ }>", v3, self, v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  message = self->_message;
  addresses = self->_addresses;
  return [v4 initWithMessage:message addresses:addresses];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STTransportEnvoyMessageEnvelope *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STTransportEnvoyMessageEnvelope *)self isEqualToTransportEnvoyMessageEnvelope:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToTransportEnvoyMessageEnvelope:(id)a3
{
  id v4 = (STTransportEnvoyMessageEnvelope *)a3;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    BOOL v5 = [(STTransportEnvoyMessageEnvelope *)self message];
    id v6 = [(STTransportEnvoyMessageEnvelope *)v4 message];
    if ([v5 isEqualToMessage:v6])
    {
      v7 = [(STTransportEnvoyMessageEnvelope *)self addresses];
      v8 = [(STTransportEnvoyMessageEnvelope *)v4 addresses];
      unsigned __int8 v9 = [v7 isEqualToSet:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(STTransportEnvoyMessageEnvelope *)self message];
  unint64_t v4 = (unint64_t)[v3 hash];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v5 = [(STTransportEnvoyMessageEnvelope *)self addresses];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      unsigned __int8 v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v4 ^= (unint64_t)[*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) hash];
        unsigned __int8 v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (STMessageTransportMessage)message
{
  return (STMessageTransportMessage *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)addresses
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end