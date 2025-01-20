@interface SBSACollisionRequest
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SBSACollisionRequest

- (BOOL)isEqual:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F4F738];
  id v4 = a3;
  v5 = [v3 builderWithObject:v4 ofExpectedClass:objc_opt_class()];

  LOBYTE(v3) = [v5 isEqual];
  return (char)v3;
}

- (unint64_t)hash
{
  v2 = [MEMORY[0x1E4F4F758] builder];
  v3 = [v2 appendClass:objc_opt_class()];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();
  return objc_alloc_init(v3);
}

@end