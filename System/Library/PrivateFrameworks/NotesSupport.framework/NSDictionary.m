@interface NSDictionary
@end

@implementation NSDictionary

void __53__NSDictionary_IC__ic_prettyDescriptionWithTabLevel___block_invoke(void *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = ICDynamicCast(v6, (uint64_t)v5);
  v8 = v7;
  v9 = (void *)a1[4];
  uint64_t v10 = a1[5];
  if (v7)
  {
    v11 = objc_msgSend(v7, "ic_prettyDescriptionWithTabLevel:", a1[6] + 1);
    [v9 appendFormat:@"%@%@ = %@\n", v10, v12, v11];
  }
  else
  {
    [v9 appendFormat:@"%@%@ = %@\n", v10, v12, v5];
  }
}

@end