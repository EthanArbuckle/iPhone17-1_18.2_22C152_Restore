@interface NSDictionary
@end

@implementation NSDictionary

void __56__NSDictionary_MRAdditions__MR_isEqualToNowPlayingInfo___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = a3;
  if (([*(id *)(a1 + 32) containsObject:v9] & 1) == 0)
  {
    v8 = [*(id *)(a1 + 40) objectForKey:v9];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = _MRNowPlayingValuesAreEqual(v7, v8);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *a4 = 1;
    }
  }
}

@end