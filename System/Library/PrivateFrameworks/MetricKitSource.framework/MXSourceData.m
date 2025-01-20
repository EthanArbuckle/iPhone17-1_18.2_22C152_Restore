@interface MXSourceData
+ (BOOL)supportsSecureCoding;
- (MXSourceData)init;
- (MXSourceData)initWithCoder:(id)a3;
@end

@implementation MXSourceData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MXSourceData)init
{
  v3.receiver = self;
  v3.super_class = (Class)MXSourceData;
  return [(MXSourceData *)&v3 init];
}

- (MXSourceData)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MXSourceData;
  return [(MXSourceData *)&v4 init];
}

@end