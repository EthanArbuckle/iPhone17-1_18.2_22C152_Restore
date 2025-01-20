@interface SXTextComponentLayoutAttributeDescriptor
+ (void)descriptorWithFromLayoutAttribute:(int)a3 toLayoutAttribute:(char)a4 ignoreMargin:(uint64_t)a5 withRange:(uint64_t)a6;
- (uint64_t)range;
- (uint64_t)resultingExclusionPath;
- (void)setResultingExclusionPath:(uint64_t)a1;
@end

@implementation SXTextComponentLayoutAttributeDescriptor

+ (void)descriptorWithFromLayoutAttribute:(int)a3 toLayoutAttribute:(char)a4 ignoreMargin:(uint64_t)a5 withRange:(uint64_t)a6
{
  self;
  v11 = -[SXComponentLayoutAttributeDescriptor initWithFromLayoutAttribute:toLayoutAttribute:ignoreMargin:]([SXTextComponentLayoutAttributeDescriptor alloc], a2, a3, a4);
  if (v11)
  {
    v11[4] = a5;
    v11[5] = a6;
  }
  return v11;
}

- (uint64_t)range
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)resultingExclusionPath
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setResultingExclusionPath:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void).cxx_destruct
{
}

@end