@interface NSUUID
+ (BOOL)isValidUUIDString:(id)a3;
@end

@implementation NSUUID

+ (BOOL)isValidUUIDString:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];

  return v4 != 0;
}

@end