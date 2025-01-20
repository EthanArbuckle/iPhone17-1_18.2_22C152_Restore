@interface SL_IntlPreferences
+ (id)addLikelySubtagsForLocaleIdentifier:(id)a3;
@end

@implementation SL_IntlPreferences

+ (id)addLikelySubtagsForLocaleIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)getNSLocaleClass_softClass;
  uint64_t v12 = getNSLocaleClass_softClass;
  if (!getNSLocaleClass_softClass)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getNSLocaleClass_block_invoke;
    v8[3] = &unk_265582688;
    v8[4] = &v9;
    __getNSLocaleClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v9, 8);
  v6 = [v5 addLikelySubtagsForLocaleIdentifier:v3];

  return v6;
}

@end