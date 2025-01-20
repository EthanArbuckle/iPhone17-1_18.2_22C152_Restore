@interface EDConditionalFormattingRule
+ (id)conditionalFormattingRuleWithResources:(id)a3;
- (BOOL)aboveAverage;
- (BOOL)appliesToDateOnly;
- (BOOL)bottom;
- (BOOL)equalAverage;
- (BOOL)percent;
- (BOOL)stopIfTrue;
- (EDConditionalFormattingRule)initWithResources:(id)a3;
- (id)description;
- (id)differentialStyle;
- (id)formulaAtIndex:(unint64_t)a3;
- (id)text;
- (int)operatorEnum;
- (int)timePeriod;
- (int)type;
- (int64_t)compareToOtherRuleUsingPriority:(id)a3;
- (int64_t)priority;
- (int64_t)stdDev;
- (unint64_t)differentialStyleIndex;
- (unint64_t)formulaCount;
- (unint64_t)rank;
- (void)addFormula:(id)a3 worksheet:(id)a4;
- (void)setAboveAverage:(BOOL)a3;
- (void)setAppliesToDateOnly:(BOOL)a3;
- (void)setBottom:(BOOL)a3;
- (void)setDifferentialStyle:(id)a3;
- (void)setDifferentialStyleIndex:(unint64_t)a3;
- (void)setEqualAverage:(BOOL)a3;
- (void)setOperatorEnum:(int)a3;
- (void)setPercent:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setRank:(unint64_t)a3;
- (void)setStdDev:(int64_t)a3;
- (void)setStopIfTrue:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTimePeriod:(int)a3;
- (void)setType:(int)a3;
@end

@implementation EDConditionalFormattingRule

- (EDConditionalFormattingRule)initWithResources:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EDConditionalFormattingRule;
  v5 = [(EDConditionalFormattingRule *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mFormulas = v6->mFormulas;
    v6->mFormulas = v7;

    *(void *)&v6->mType = 0;
    *(_WORD *)&v6->mStopIfTrue = 0;
    v6->mPriority = 1;
    v6->mDifferentialStyleIndex = -1;
    *(_DWORD *)&v6->mAboveAverage = 1;
    v6->mTimePeriod = 0;
    v6->mRank = 0;
    v6->mStdDev = 0;
  }

  return v6;
}

- (void)setStopIfTrue:(BOOL)a3
{
  self->mStopIfTrue = a3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setOperatorEnum:(int)a3
{
  self->mOperator = a3;
}

- (void)addFormula:(id)a3 worksheet:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    -[NSMutableArray addObject:](self->mFormulas, "addObject:");
    v7 = [v6 processors];
    [v7 markObject:v8 processor:objc_opt_class()];
  }
}

- (void)setDifferentialStyle:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained differentialStyles];

  self->mDifferentialStyleIndex = [v5 addObject:v6];
}

+ (id)conditionalFormattingRuleWithResources:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return v4;
}

- (int64_t)compareToOtherRuleUsingPriority:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 priority];
    int64_t mPriority = self->mPriority;
    BOOL v7 = mPriority < v5;
    BOOL v8 = mPriority > v5;
    if (v7) {
      int64_t v9 = -1;
    }
    else {
      int64_t v9 = v8;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int)type
{
  return self->mType;
}

- (int)operatorEnum
{
  return self->mOperator;
}

- (unint64_t)formulaCount
{
  return [(NSMutableArray *)self->mFormulas count];
}

- (id)formulaAtIndex:(unint64_t)a3
{
  if ([(EDConditionalFormattingRule *)self formulaCount] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->mFormulas objectAtIndex:a3];
  }
  return v5;
}

- (id)differentialStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained differentialStyles];

  uint64_t v5 = [v4 objectAtIndex:self->mDifferentialStyleIndex];

  return v5;
}

- (BOOL)stopIfTrue
{
  return self->mStopIfTrue;
}

- (int64_t)priority
{
  return self->mPriority;
}

- (void)setPriority:(int64_t)a3
{
  self->int64_t mPriority = a3;
}

- (BOOL)aboveAverage
{
  return self->mAboveAverage;
}

- (void)setAboveAverage:(BOOL)a3
{
  self->mAboveAverage = a3;
}

- (BOOL)bottom
{
  return self->mBottom;
}

- (void)setBottom:(BOOL)a3
{
  self->mBottom = a3;
}

- (BOOL)equalAverage
{
  return self->mEqualAverage;
}

- (void)setEqualAverage:(BOOL)a3
{
  self->mEqualAverage = a3;
}

- (BOOL)percent
{
  return self->mPercent;
}

- (void)setPercent:(BOOL)a3
{
  self->mPercent = a3;
}

- (unint64_t)rank
{
  return self->mRank;
}

- (void)setRank:(unint64_t)a3
{
  self->mRank = a3;
}

- (int64_t)stdDev
{
  return self->mStdDev;
}

- (void)setStdDev:(int64_t)a3
{
  self->mStdDev = a3;
}

- (id)text
{
  return self->mText;
}

- (void)setText:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  mText = self->mText;
  p_mText = &self->mText;
  if (mText != v5)
  {
    BOOL v8 = v5;
    objc_storeStrong((id *)p_mText, a3);
    uint64_t v5 = v8;
  }
}

- (int)timePeriod
{
  return self->mTimePeriod;
}

- (void)setTimePeriod:(int)a3
{
  self->mTimePeriod = a3;
}

- (BOOL)appliesToDateOnly
{
  return self->mAppliesToDateOnly;
}

- (void)setAppliesToDateOnly:(BOOL)a3
{
  self->mAppliesToDateOnly = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDConditionalFormattingRule;
  v2 = [(EDConditionalFormattingRule *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mText, 0);
  objc_storeStrong((id *)&self->mFormulas, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)differentialStyleIndex
{
  return self->mDifferentialStyleIndex;
}

- (void)setDifferentialStyleIndex:(unint64_t)a3
{
  self->mDifferentialStyleIndex = a3;
}

@end