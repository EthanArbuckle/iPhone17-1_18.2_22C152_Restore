@interface SASportsEntityGroup(SiriUI)
- (uint64_t)siriui_containsAthletes;
- (uint64_t)siriui_containsTeams;
- (void)siriui_enumerateEntitiesWithGroupHandler:()SiriUI teamHandler:athleteHandler:;
@end

@implementation SASportsEntityGroup(SiriUI)

- (void)siriui_enumerateEntitiesWithGroupHandler:()SiriUI teamHandler:athleteHandler:
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8) {
    v8[2](v8, a1);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = objc_msgSend(a1, "entities", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "siriui_enumerateEntitiesWithGroupHandler:teamHandler:athleteHandler:", v8, v9, v10);
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (uint64_t)siriui_containsTeams
{
  v1 = [a1 entities];
  v2 = [v1 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (uint64_t)siriui_containsAthletes
{
  v1 = [a1 entities];
  v2 = [v1 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end