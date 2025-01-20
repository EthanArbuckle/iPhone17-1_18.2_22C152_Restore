@interface TPSSubscriptionListController
- (id)specifiers;
@end

@implementation TPSSubscriptionListController

- (id)specifiers
{
  v2 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(TPSListController *)v2 subscriptions];
    if ([v5 count])
    {
      uint64_t v22 = v3;
      v26 = v2;
      v6 = [(TPSSubscriptionListController *)v2 specifier];
      id v7 = (id)[v6 propertyForKey:@"TPSSpecifierSubscriptionDetailControllerKey"];

      v25 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id obj = v5;
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v24 = *(void *)v28;
        uint64_t v10 = *MEMORY[0x1E4F93210];
        uint64_t v11 = *MEMORY[0x1E4F930A8];
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v28 != v24) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            v14 = (void *)MEMORY[0x1E4F92E70];
            v15 = objc_msgSend(v13, "tps_localizedLabel");
            v16 = [v14 preferenceSpecifierNamed:v15 target:0 set:0 get:0 detail:v7 cell:2 edit:0];

            [v16 setProperty:v13 forKey:v10];
            v17 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:&stru_1F40BEF98 target:v26 set:0 get:0 detail:v7 cell:2 edit:0];

            [v17 setProperty:v13 forKey:v10];
            [v17 setProperty:objc_opt_class() forKey:v11];
            v18 = [v13 userDefaultVoice];
            LODWORD(v16) = [v18 BOOLValue];

            if (v16) {
              [v25 insertObject:v17 atIndex:0];
            }
            else {
              [v25 addObject:v17];
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v9);
      }

      uint64_t v19 = [v25 copy];
      v2 = v26;
      uint64_t v3 = v22;
      v20 = *(Class *)((char *)&v26->super.super.super.super.super.super.isa + v22);
      *(Class *)((char *)&v26->super.super.super.super.super.super.isa + v22) = (Class)v19;
    }
    v4 = *(Class *)((char *)&v2->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

@end