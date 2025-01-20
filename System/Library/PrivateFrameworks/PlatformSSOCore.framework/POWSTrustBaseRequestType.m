@interface POWSTrustBaseRequestType
+ (id)definition;
- (NSString)description;
@end

@implementation POWSTrustBaseRequestType

+ (id)definition
{
  v2 = objc_opt_new();
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:self];
}

@end