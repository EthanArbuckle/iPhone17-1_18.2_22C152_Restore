@interface WFEncodedTypedValue
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (WFEncodedTypedValue)initWithBSXPCCoder:(id)a3;
- (WFEncodedTypedValue)initWithCoder:(id)a3;
- (WFEncodedTypedValue)initWithData:(id)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation WFEncodedTypedValue

- (void).cxx_destruct
{
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEncodedTypedValue *)self data];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (WFEncodedTypedValue)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];

  v6 = [(WFEncodedTypedValue *)self initWithData:v5];
  return v6;
}

- (WFEncodedTypedValue)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];

  v6 = [(WFEncodedTypedValue *)self initWithData:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WFEncodedTypedValue *)self data];
  [v4 encodeObject:v5 forKey:@"data"];
}

- (unint64_t)hash
{
  v2 = [(WFEncodedTypedValue *)self data];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFEncodedTypedValue *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(WFEncodedTypedValue *)self data];
      v8 = [(WFEncodedTypedValue *)v6 data];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqual:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (WFEncodedTypedValue)initWithData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFEncodedTypedValue;
  v6 = [(WFEncodedTypedValue *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end