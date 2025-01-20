@interface SABinaryCreateLoadInfoArrayFromDyldImageInfos
@end

@implementation SABinaryCreateLoadInfoArrayFromDyldImageInfos

uint64_t ___SABinaryCreateLoadInfoArrayFromDyldImageInfos_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 loadAddress];
  if (v6 >= [v5 loadAddress])
  {
    unint64_t v8 = [v4 loadAddress];
    uint64_t v7 = v8 > [v5 loadAddress];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

@end