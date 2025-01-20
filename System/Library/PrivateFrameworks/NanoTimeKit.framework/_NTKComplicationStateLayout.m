@interface _NTKComplicationStateLayout
- (NTKComplicationLayoutRule)defaultRule;
- (id)ruleForLayoutOverride:(int64_t)a3;
- (void)setDefaultRule:(id)a3;
- (void)setRule:(id)a3 forLayoutOverride:(int64_t)a4;
@end

@implementation _NTKComplicationStateLayout

- (void)setRule:(id)a3 forLayoutOverride:(int64_t)a4
{
  id v10 = a3;
  overrideRules = self->_overrideRules;
  if (!overrideRules)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8 = self->_overrideRules;
    self->_overrideRules = v7;

    overrideRules = self->_overrideRules;
  }
  v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)overrideRules setObject:v10 forKey:v9];
}

- (id)ruleForLayoutOverride:(int64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__19;
  v13 = __Block_byref_object_dispose__19;
  v14 = self->_defaultRule;
  overrideRules = self->_overrideRules;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53___NTKComplicationStateLayout_ruleForLayoutOverride___block_invoke;
  v8[3] = &unk_1E62C3C78;
  v8[4] = &v9;
  v8[5] = a3;
  [(NSMutableDictionary *)overrideRules enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (NTKComplicationLayoutRule)defaultRule
{
  return self->_defaultRule;
}

- (void)setDefaultRule:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultRule, 0);
  objc_storeStrong((id *)&self->_overrideRules, 0);
}

@end