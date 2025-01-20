@interface NTKComplicationLayout
+ (id)layoutWithDefaultRule:(id)a3;
- (NTKComplicationLayout)init;
- (id)_layoutForState:(int64_t)a3;
- (id)defaultLayoutRuleForState:(int64_t)a3;
- (id)layoutRuleForComplicationState:(int64_t)a3 layoutOverride:(int64_t)a4;
- (void)setDefaultLayoutRule:(id)a3 forState:(int64_t)a4;
- (void)setOverrideLayoutRule:(id)a3 forState:(int64_t)a4 layoutOverride:(int64_t)a5;
@end

@implementation NTKComplicationLayout

+ (id)layoutWithDefaultRule:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setDefaultLayoutRule:v4 forState:0];

  return v5;
}

- (NTKComplicationLayout)init
{
  v8.receiver = self;
  v8.super_class = (Class)NTKComplicationLayout;
  v2 = [(NTKComplicationLayout *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    stateLayouts = v2->_stateLayouts;
    v2->_stateLayouts = (NSMutableArray *)v3;

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__NTKComplicationLayout_init__block_invoke;
    v6[3] = &unk_1E62C3620;
    v7 = v2;
    NTKEnumerateComplicationStates(v6);
  }
  return v2;
}

void __29__NTKComplicationLayout_init__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v2 = objc_alloc_init(_NTKComplicationStateLayout);
  [v1 addObject:v2];
}

- (void)setDefaultLayoutRule:(id)a3 forState:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(NTKComplicationLayout *)self _layoutForState:a4];
  [v7 setDefaultRule:v6];
}

- (void)setOverrideLayoutRule:(id)a3 forState:(int64_t)a4 layoutOverride:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(NTKComplicationLayout *)self _layoutForState:a4];
  [v9 setRule:v8 forLayoutOverride:a5];
}

- (id)layoutRuleForComplicationState:(int64_t)a3 layoutOverride:(int64_t)a4
{
  if (a3 < 0)
  {
LABEL_6:
    id v8 = 0;
  }
  else
  {
    int64_t v5 = a3;
    while (1)
    {
      id v7 = [(NTKComplicationLayout *)self _layoutForState:v5];
      id v8 = [v7 ruleForLayoutOverride:a4];

      if (v8) {
        break;
      }
      if (v5-- < 1) {
        goto LABEL_6;
      }
    }
  }
  return v8;
}

- (id)defaultLayoutRuleForState:(int64_t)a3
{
  if (a3 < 0)
  {
LABEL_6:
    id v6 = 0;
  }
  else
  {
    int64_t v3 = a3;
    while (1)
    {
      int64_t v5 = [(NTKComplicationLayout *)self _layoutForState:v3];
      id v6 = [v5 defaultRule];

      if (v6) {
        break;
      }
      if (v3-- < 1) {
        goto LABEL_6;
      }
    }
  }
  return v6;
}

- (id)_layoutForState:(int64_t)a3
{
  return (id)[(NSMutableArray *)self->_stateLayouts objectAtIndexedSubscript:a3];
}

- (void).cxx_destruct
{
}

@end