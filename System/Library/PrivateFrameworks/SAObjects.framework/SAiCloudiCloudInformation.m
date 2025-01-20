@interface SAiCloudiCloudInformation
+ (id)iCloudInformation;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SAiCloudiCloudInformation

- (id)groupIdentifier
{
  return @"com.apple.ace.iCloud";
}

- (id)encodedClassName
{
  return @"iCloudInformation";
}

+ (id)iCloudInformation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

@end