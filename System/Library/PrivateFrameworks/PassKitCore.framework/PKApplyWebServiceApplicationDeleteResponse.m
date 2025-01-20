@interface PKApplyWebServiceApplicationDeleteResponse
+ (BOOL)jsonDataOptional;
+ (BOOL)supportsSecureCoding;
@end

@implementation PKApplyWebServiceApplicationDeleteResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

@end