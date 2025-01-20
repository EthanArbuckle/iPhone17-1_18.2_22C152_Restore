@interface STSetupContent
+ (BOOL)supportsSecureCoding;
+ (int64_t)contentType;
- (BOOL)isEqual:(id)a3;
- (STSetupContent)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation STSetupContent

+ (int64_t)contentType
{
  return 5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(id)objc_opt_class() allocWithZone:a3];
  return _[v3 init];
}

- (STSetupContent)initWithCoder:(id)a3
{
  return [(STSetupContent *)self init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return (unint64_t)[&off_10030FBC8 hash];
}

@end