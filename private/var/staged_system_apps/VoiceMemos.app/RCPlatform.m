@interface RCPlatform
+ (BOOL)isCatalyst;
+ (BOOL)isIPad;
- (RCPlatform)init;
@end

@implementation RCPlatform

+ (BOOL)isCatalyst
{
  return 0;
}

+ (BOOL)isIPad
{
  id v2 = [self currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  return v3 == (id)1;
}

- (RCPlatform)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Platform();
  return [(RCPlatform *)&v3 init];
}

@end