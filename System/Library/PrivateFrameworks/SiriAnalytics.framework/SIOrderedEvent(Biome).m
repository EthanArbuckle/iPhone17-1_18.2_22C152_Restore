@interface SIOrderedEvent(Biome)
+ (id)eventWithData:()Biome dataVersion:;
- (uint64_t)dataVersion;
@end

@implementation SIOrderedEvent(Biome)

- (uint64_t)dataVersion
{
  return 2;
}

+ (id)eventWithData:()Biome dataVersion:
{
  v5 = (void *)MEMORY[0x1E4FA1220];
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v7 = [v5 deserializeFromData:v6];
  }
  else
  {
    uint64_t v7 = [objc_alloc((Class)v5) initWithData:v6];
  }
  v8 = (void *)v7;

  return v8;
}

@end