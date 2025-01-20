@interface SXDefaultFontAttributes
- (BOOL)isEqual:(id)a3;
- (NSNumber)grade;
- (NSString)familyName;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (int64_t)weight;
- (int64_t)width;
- (unint64_t)weightLabel;
@end

@implementation SXDefaultFontAttributes

- (NSString)familyName
{
  return (NSString *)@"Helvetica";
}

- (int64_t)weight
{
  return 400;
}

- (int64_t)width
{
  return 7;
}

- (int64_t)style
{
  return 0;
}

- (unint64_t)weightLabel
{
  return 0;
}

- (NSNumber)grade
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(SXDefaultFontAttributes);
}

@end