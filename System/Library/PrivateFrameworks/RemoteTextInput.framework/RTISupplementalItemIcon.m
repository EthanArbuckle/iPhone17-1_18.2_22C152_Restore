@interface RTISupplementalItemIcon
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSString)dataType;
- (RTISupplementalItemIcon)initWithCoder:(id)a3;
- (RTISupplementalItemIcon)initWithDataType:(id)a3 data:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTISupplementalItemIcon

- (RTISupplementalItemIcon)initWithDataType:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RTISupplementalItemIcon;
  v8 = [(RTISupplementalItemIcon *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    dataType = v8->_dataType;
    v8->_dataType = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    data = v8->_data;
    v8->_data = (NSData *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v4 encodeObject:self->_dataType forKey:@"iconDataType"];
  [v4 encodeObject:self->_data forKey:@"iconData"];
}

- (RTISupplementalItemIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  if (self)
  {
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconDataType"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconData"];
    self = [(RTISupplementalItemIcon *)self initWithDataType:v5 data:v6];
  }
  return self;
}

- (unint64_t)hash
{
  return [(NSData *)self->_data hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTISupplementalItemIcon *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(RTISupplementalItemIcon *)self dataType];
      id v6 = [(RTISupplementalItemIcon *)v4 dataType];
      if ([v5 isEqualToString:v6])
      {
        id v7 = [(RTISupplementalItemIcon *)self data];
        v8 = [(RTISupplementalItemIcon *)v4 data];
        char v9 = [v7 isEqualToData:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p;", objc_opt_class(), self];
  id v4 = [(RTISupplementalItemIcon *)self dataType];
  [v3 appendFormat:@", dataType=%@", v4];

  v5 = [(RTISupplementalItemIcon *)self data];
  [v3 appendFormat:@", data=%@>", v5];

  return v3;
}

- (NSString)dataType
{
  return self->_dataType;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_dataType, 0);
}

@end