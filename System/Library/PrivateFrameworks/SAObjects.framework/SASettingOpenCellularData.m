@interface SASettingOpenCellularData
+ (id)openCellularData;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SASettingOpenCellularData

- (id)groupIdentifier
{
  return @"com.apple.ace.setting";
}

- (id)encodedClassName
{
  return @"OpenCellularData";
}

+ (id)openCellularData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 0;
}

@end