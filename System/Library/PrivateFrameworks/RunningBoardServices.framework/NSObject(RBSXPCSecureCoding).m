@interface NSObject(RBSXPCSecureCoding)
+ (uint64_t)supportsRBSXPCSecureCoding;
- (uint64_t)supportsRBSXPCSecureCoding;
@end

@implementation NSObject(RBSXPCSecureCoding)

- (uint64_t)supportsRBSXPCSecureCoding
{
  v0 = objc_opt_class();
  return [v0 supportsRBSXPCSecureCoding];
}

+ (uint64_t)supportsRBSXPCSecureCoding
{
  return 0;
}

@end