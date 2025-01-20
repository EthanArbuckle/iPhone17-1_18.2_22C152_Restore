@interface NSDictionary(NPKRelevancy)
+ (id)npkRelevancyTupleWithUniqueID:()NPKRelevancy relevantText:;
- (uint64_t)npkRelevancyRelevantText;
- (uint64_t)npkRelevancyUniqueID;
@end

@implementation NSDictionary(NPKRelevancy)

+ (id)npkRelevancyTupleWithUniqueID:()NPKRelevancy relevantText:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  v8 = v7;
  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:*MEMORY[0x263F5C678]];
  }
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:*MEMORY[0x263F5C670]];
  }
  v9 = [NSDictionary dictionaryWithDictionary:v8];

  return v9;
}

- (uint64_t)npkRelevancyUniqueID
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x263F5C678]];
}

- (uint64_t)npkRelevancyRelevantText
{
  return [a1 objectForKeyedSubscript:*MEMORY[0x263F5C670]];
}

@end