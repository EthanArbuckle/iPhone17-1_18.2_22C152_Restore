@interface NSArray
@end

@implementation NSArray

uint64_t __62__NSArray_ICSWriter___ICSStringWithOptions_appendingToString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v4 compare:v5];
  }
  else
  {
    NSLog(&cfstr_AttemptedToSor.isa, v4);
    uint64_t v7 = -1;
    if (v4 >= v5) {
      uint64_t v7 = 1;
    }
    if (v4 == v5) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v7;
    }
  }

  return v6;
}

uint64_t __36__NSArray_VCSUtilities__VCS_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end