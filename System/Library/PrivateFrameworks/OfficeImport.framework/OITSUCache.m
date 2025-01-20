@interface OITSUCache
- (OITSUCache)init;
- (OITSUCache)initWithName:(id)a3;
@end

@implementation OITSUCache

- (OITSUCache)initWithName:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OITSUCache;
  v5 = [(OITSUCache *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(OITSUCache *)v5 setName:v4];
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = *MEMORY[0x263F1D060];
    v9 = [MEMORY[0x263F1C408] sharedApplication];
    [v7 addObserver:v6 selector:sel_p_didReceiveMemoryWarning_ name:v8 object:v9];

    uint64_t v10 = *MEMORY[0x263F1D050];
    v11 = [MEMORY[0x263F1C408] sharedApplication];
    [v7 addObserver:v6 selector:sel_p_didEnterBackground_ name:v10 object:v11];
  }
  return v6;
}

- (OITSUCache)init
{
  return [(OITSUCache *)self initWithName:@"UnnamedCache"];
}

@end