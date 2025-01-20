@interface RMAuthenticationCredential
+ (BOOL)supportsSecureCoding;
@end

@implementation RMAuthenticationCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end