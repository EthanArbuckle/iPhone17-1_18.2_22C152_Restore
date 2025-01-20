@interface EDConditionalFormatting
+ (id)conditionalFormatting;
- (BOOL)isApplyToDate;
- (EDConditionalFormatting)init;
- (id)description;
- (id)rangeAtIndex:(unint64_t)a3;
- (id)ruleAtIndex:(unint64_t)a3;
- (id)rules;
- (unint64_t)rangeCount;
- (unint64_t)ruleCount;
- (void)addRange:(id)a3;
- (void)addRule:(id)a3;
@end

@implementation EDConditionalFormatting

- (EDConditionalFormatting)init
{
  v8.receiver = self;
  v8.super_class = (Class)EDConditionalFormatting;
  v2 = [(EDConditionalFormatting *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mRules = v2->mRules;
    v2->mRules = v3;

    v5 = objc_alloc_init(EDReferenceCollection);
    mRanges = v2->mRanges;
    v2->mRanges = v5;

    v2->mApplyToDate = 0;
  }
  return v2;
}

- (void)addRange:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(EDReferenceCollection *)self->mRanges addObject:v4];
  }
}

- (void)addRule:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v6 = v4;
    [(NSMutableArray *)self->mRules addObject:v4];
    int v5 = [v6 appliesToDateOnly];
    id v4 = v6;
    if (v5) {
      self->mApplyToDate = 1;
    }
  }
}

+ (id)conditionalFormatting
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (unint64_t)ruleCount
{
  return [(NSMutableArray *)self->mRules count];
}

- (id)ruleAtIndex:(unint64_t)a3
{
  if ([(EDConditionalFormatting *)self ruleCount] <= a3)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(NSMutableArray *)self->mRules objectAtIndex:a3];
  }
  return v5;
}

- (id)rules
{
  return self->mRules;
}

- (unint64_t)rangeCount
{
  return [(EDCollection *)self->mRanges count];
}

- (id)rangeAtIndex:(unint64_t)a3
{
  if ([(EDConditionalFormatting *)self rangeCount] <= a3)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [(EDCollection *)self->mRanges objectAtIndex:a3];
  }
  return v5;
}

- (BOOL)isApplyToDate
{
  return self->mApplyToDate;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDConditionalFormatting;
  id v2 = [(EDConditionalFormatting *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRanges, 0);
  objc_storeStrong((id *)&self->mRules, 0);
}

@end