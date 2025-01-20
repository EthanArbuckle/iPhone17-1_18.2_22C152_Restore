@interface NSDictionary
@end

@implementation NSDictionary

void __61__NSDictionary_SAObjects_Map___sa_mappedDictionaryWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKey:v4];
  }
}

@end