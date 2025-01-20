@interface SearchUIColorCache
- (SearchUIColorCache)init;
- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4;
@end

@implementation SearchUIColorCache

- (SearchUIColorCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIColorCache;
  v2 = [(TLKAsyncCache *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_clear name:*MEMORY[0x1E4FB2438] object:0];
  }
  return v2;
}

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
}

@end