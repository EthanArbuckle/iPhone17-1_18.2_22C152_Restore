@interface STUnifiedTransportPayloadDestination
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateWithDictionaryRepresentation:(id)a3;
- (NSString)address;
- (NSString)description;
- (NSString)type;
- (STUnifiedTransportPayloadDestination)initWithAddress:(id)a3 type:(id)a4;
- (STUnifiedTransportPayloadDestination)initWithAddress:(id)a3 type:(id)a4 state:(unint64_t)a5;
- (STUnifiedTransportPayloadDestination)initWithCoder:(id)a3;
- (STUnifiedTransportPayloadDestination)initWithDSID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation STUnifiedTransportPayloadDestination

- (STUnifiedTransportPayloadDestination)initWithDSID:(id)a3
{
  v4 = [a3 stringValue];
  v5 = [(STUnifiedTransportPayloadDestination *)self initWithAddress:v4 type:@"User"];

  return v5;
}

- (STUnifiedTransportPayloadDestination)initWithAddress:(id)a3 type:(id)a4
{
  return [(STUnifiedTransportPayloadDestination *)self initWithAddress:a3 type:a4 state:1];
}

- (STUnifiedTransportPayloadDestination)initWithAddress:(id)a3 type:(id)a4 state:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STUnifiedTransportPayloadDestination;
  v10 = [(STUnifiedTransportPayloadDestination *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    address = v10->_address;
    v10->_address = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    type = v10->_type;
    v10->_type = (NSString *)v13;

    v10->_state = a5;
  }

  return v10;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  v4 = [(STUnifiedTransportPayloadDestination *)self address];
  [v3 setObject:v4 forKeyedSubscript:@"address"];

  v5 = [(STUnifiedTransportPayloadDestination *)self type];
  [v3 setObject:v5 forKeyedSubscript:@"type"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[STUnifiedTransportPayloadDestination state](self, "state"));
  [v3 setObject:v6 forKeyedSubscript:@"state"];

  v7 = (void *)[v3 copy];
  return v7;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"address"];
  address = self->_address;
  self->_address = v5;

  v7 = [v4 objectForKeyedSubscript:@"type"];
  type = self->_type;
  self->_type = v7;

  id v9 = [v4 objectForKeyedSubscript:@"state"];

  -[STUnifiedTransportPayloadDestination setState:](self, "setState:", [v9 unsignedIntegerValue]);
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STUnifiedTransportPayloadDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STUnifiedTransportPayloadDestination;
  v5 = [(STUnifiedTransportPayloadDestination *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
    address = v5->_address;
    v5->_address = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v8;

    v5->_state = [v4 decodeIntegerForKey:@"state"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  address = self->_address;
  id v5 = a3;
  [v5 encodeObject:address forKey:@"address"];
  [v5 encodeObject:self->_type forKey:@"type"];
  [v5 encodeInteger:self->_state forKey:@"state"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  address = self->_address;
  type = self->_type;
  unint64_t state = self->_state;
  return (id)[v4 initWithAddress:address type:type state:state];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(STUnifiedTransportPayloadDestination *)self address];
  id v5 = [(STUnifiedTransportPayloadDestination *)self type];
  uint64_t v6 = [v3 stringWithFormat:@"%p:{\n Address: %@\n Type:%@\n State:%lu\n}", self, v4, v5, -[STUnifiedTransportPayloadDestination state](self, "state")];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STUnifiedTransportPayloadDestination *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(STUnifiedTransportPayloadDestination *)self address];
      if (v6)
      {
        v7 = [(STUnifiedTransportPayloadDestination *)v5 address];
        if (v7)
        {
          uint64_t v8 = [(STUnifiedTransportPayloadDestination *)self address];
          id v9 = [(STUnifiedTransportPayloadDestination *)v5 address];
          if ([v8 isEqualToString:v9])
          {
            v10 = [(STUnifiedTransportPayloadDestination *)self type];
            objc_super v11 = [(STUnifiedTransportPayloadDestination *)v5 type];
            char v12 = [v10 isEqualToString:v11];
          }
          else
          {
            char v12 = 0;
          }
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(STUnifiedTransportPayloadDestination *)self address];
  uint64_t v4 = [v3 hash];
  id v5 = [(STUnifiedTransportPayloadDestination *)self type];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)address
{
  return self->_address;
}

- (NSString)type
{
  return self->_type;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end