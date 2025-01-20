@interface WLKDeepReplacement
@end

@implementation WLKDeepReplacement

void ___WLKDeepReplacement_block_invoke(void *a1, void *a2, uint64_t a3)
{
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v7 = a2;
  _WLKDeepReplacement(a3, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v8 forKey:v7];
}

@end