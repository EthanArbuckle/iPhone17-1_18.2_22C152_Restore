@interface RTIDataPayload
+ (BOOL)supportsSecureCoding;
+ (RTIDataPayload)payloadWithData:(id)a3;
+ (RTIDataPayload)payloadWithData:(id)a3 version:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (RTIDataPayload)init;
- (RTIDataPayload)initWithCoder:(id)a3;
- (RTIDataPayload)initWithData:(id)a3 version:(unint64_t)a4;
- (id)description;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation RTIDataPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (([v6 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v6 encodeInt32:LODWORD(self->_version) forKey:@"payloadVersion"];
  v4 = [(RTIDataPayload *)self data];

  if (v4)
  {
    v5 = [(RTIDataPayload *)self data];
    [v6 encodeObject:v5 forKey:@"payloadData"];
  }
}

- (RTIDataPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v9.receiver = self;
  v9.super_class = (Class)RTIDataPayload;
  v5 = [(RTIDataPayload *)&v9 init];
  if (v5)
  {
    v5->_version = (int)[v4 decodeInt32ForKey:@"payloadVersion"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payloadData"];
    data = v5->_data;
    v5->_data = (NSData *)v6;
  }
  return v5;
}

+ (RTIDataPayload)payloadWithData:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithData:v4 version:1];

  return (RTIDataPayload *)v5;
}

+ (RTIDataPayload)payloadWithData:(id)a3 version:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithData:v6 version:a4];

  return (RTIDataPayload *)v7;
}

- (RTIDataPayload)initWithData:(id)a3 version:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTIDataPayload;
  v8 = [(RTIDataPayload *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_version = a4;
    objc_storeStrong((id *)&v8->_data, a3);
  }

  return v9;
}

- (RTIDataPayload)init
{
  return [(RTIDataPayload *)self initWithData:0 version:1];
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"; version = %lul", -[RTIDataPayload version](self, "version"));
  if (self->_data)
  {
    id v4 = [(RTIDataPayload *)self data];
    objc_msgSend(v3, "appendFormat:", @"; data length = %lul", objc_msgSend(v4, "length"));
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTIDataPayload *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(RTIDataPayload *)self version];
      if (v6 == [(RTIDataPayload *)v5 version])
      {
        id v7 = [(RTIDataPayload *)self data];
        v8 = [(RTIDataPayload *)v5 data];
        if (v7 == v8)
        {
          char v11 = 1;
        }
        else
        {
          objc_super v9 = [(RTIDataPayload *)self data];
          v10 = [(RTIDataPayload *)v5 data];
          char v11 = [v9 isEqual:v10];
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end