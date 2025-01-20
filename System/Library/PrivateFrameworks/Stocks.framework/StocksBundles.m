@interface StocksBundles
+ (id)getBundle:(int)a3;
@end

@implementation StocksBundles

+ (id)getBundle:(int)a3
{
  v3 = (void *)getBundle__bundles[a3];
  if (!v3)
  {
    uint64_t v4 = a3;
    uint64_t v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:identifiers[a3]];
    v6 = (void *)getBundle__bundles[v4];
    getBundle__bundles[v4] = v5;

    v3 = (void *)getBundle__bundles[v4];
  }

  return v3;
}

@end