@interface ICIndexerStateHandler
+ (id)stateDictionary;
+ (void)logMethodCall:(unint64_t)a3;
+ (void)registerStateHandler;
+ (void)setStateDictionary:(id)a3;
@end

@implementation ICIndexerStateHandler

+ (void)registerStateHandler
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __45__ICIndexerStateHandler_registerStateHandler__block_invoke;
  v2[3] = &__block_descriptor_40_e19___NSDictionary_8__0l;
  v2[4] = a1;
  +[ICStateHandler addStateHandlerWithName:"Notes Indexer" sysdiagnoseOnly:1 stateBlock:v2];
}

uint64_t __45__ICIndexerStateHandler_registerStateHandler__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stateDictionary];
}

+ (id)stateDictionary
{
  v2 = +[ICAppGroupDefaults sharedAppGroupDefaults];
  v3 = [v2 dictionaryForKey:@"kICIndexerStateUserDefaultsKey"];
  v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x263EFFA78];
  }
  id v5 = v3;

  return v5;
}

+ (void)setStateDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[ICAppGroupDefaults sharedAppGroupDefaults];
  [v4 setObject:v3 forKey:@"kICIndexerStateUserDefaultsKey"];
}

+ (void)logMethodCall:(unint64_t)a3
{
  id v16 = [MEMORY[0x263EFF910] date];
  id v5 = [a1 stateDictionary];
  v6 = (void *)[v5 mutableCopy];
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  v8 = (void *)MEMORY[0x263EFF980];
  uint64_t v9 = [v6 objectForKeyedSubscript:v7];
  v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = MEMORY[0x263EFFA68];
  }
  v12 = [v8 arrayWithArray:v11];

  if ((unint64_t)[v12 count] >= 0xA)
  {
    do
      [v12 removeObjectAtIndex:0];
    while ((unint64_t)[v12 count] > 9);
  }
  v13 = NSNumber;
  [v16 timeIntervalSinceReferenceDate];
  v14 = objc_msgSend(v13, "numberWithDouble:");
  [v12 addObject:v14];

  [v6 setObject:v12 forKeyedSubscript:v7];
  v15 = [NSDictionary dictionaryWithDictionary:v6];
  [a1 setStateDictionary:v15];
}

@end