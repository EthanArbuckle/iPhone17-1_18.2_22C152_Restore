@interface WFLSMResult
+ (id)LSMResultWithLSMResultRef:(__LSMResult *)a3 threshold:(id)a4;
+ (id)extractScoresFromLSMResults:(__LSMResult *)a3;
- (BOOL)isRestricted;
- (NSNumber)threshold;
- (WFLSMResult)initWithLSMResultRef:(__LSMResult *)a3 threshold:(id)a4;
- (float)scoreForCategory:(int64_t)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)bestMatchingCategory;
- (int64_t)numberOfCategories;
- (void)dealloc;
- (void)setScore:(float)a3 forCategory:(int64_t)a4;
- (void)setThreshold:(id)a3;
@end

@implementation WFLSMResult

+ (id)extractScoresFromLSMResults:(__LSMResult *)a3
{
  v4 = objc_opt_new();
  CFIndex Count = LSMResultGetCount(a3);
  if (Count >= 1)
  {
    CFIndex v6 = Count;
    for (CFIndex i = 0; i != v6; ++i)
    {
      uint64_t Category = LSMResultGetCategory(a3, i);
      *(float *)&double v9 = LSMResultGetScore(a3, i);
      objc_msgSend(v4, "addObject:", +[WFCategoryJudgement categoryJudgementWithCategory:score:](WFCategoryJudgement, "categoryJudgementWithCategory:score:", Category, v9));
    }
  }
  return v4;
}

+ (id)LSMResultWithLSMResultRef:(__LSMResult *)a3 threshold:(id)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithLSMResultRef:a3 threshold:a4];
  return v4;
}

- (WFLSMResult)initWithLSMResultRef:(__LSMResult *)a3 threshold:(id)a4
{
  if (!a3) {
    return 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)WFLSMResult;
  CFIndex v6 = [(WFLSMResult *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableArray *)[(id)objc_opt_class() extractScoresFromLSMResults:a3];
    v6->categoryJudgements = v7;
    [(NSMutableArray *)v7 sortUsingSelector:sel_compareByCategory_];
    v8 = v6->categoryJudgements;
    [(WFLSMResult *)v6 setThreshold:a4];
  }
  return v6;
}

- (int64_t)numberOfCategories
{
  return [(NSMutableArray *)self->categoryJudgements count];
}

- (int64_t)bestMatchingCategory
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  categoryJudgements = self->categoryJudgements;
  uint64_t v3 = [(NSMutableArray *)categoryJudgements countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v3) {
    return -1;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v14;
  float v6 = -1.0;
  int64_t v7 = -1;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v14 != v5) {
        objc_enumerationMutation(categoryJudgements);
      }
      double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      [v9 score];
      if (v10 > v6)
      {
        float v11 = v10;
        int64_t v7 = [v9 category];
        float v6 = v11;
      }
    }
    uint64_t v4 = [(NSMutableArray *)categoryJudgements countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v4);
  return v7;
}

- (float)scoreForCategory:(int64_t)a3
{
  uint64_t v3 = (void *)[(NSMutableArray *)self->categoryJudgements objectAtIndex:a3 - 1];
  [v3 score];
  return result;
}

- (void)setScore:(float)a3 forCategory:(int64_t)a4
{
  uint64_t v5 = (void *)[(NSMutableArray *)self->categoryJudgements objectAtIndex:a4 - 1];
  *(float *)&double v6 = a3;
  [v5 setScore:v6];
}

- (id)debugDescription
{
  uint64_t v3 = (void *)[MEMORY[0x263F089D8] stringWithString:&stru_26C7AC028];
  int64_t v4 = [(WFLSMResult *)self bestMatchingCategory];
  uint64_t v5 = [(WFLSMResult *)self numberOfCategories];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 1; i <= v6; ++i)
    {
      [(WFLSMResult *)self scoreForCategory:i];
      double v9 = v8;
      if (v4 == i) {
        uint64_t v10 = [NSString stringWithFormat:@"[ %d:%.2f ]", v4, *(void *)&v9];
      }
      else {
        uint64_t v10 = [NSString stringWithFormat:@"%d:%.2f", i, *(void *)&v9];
      }
      [v3 appendString:v10];
      if (v6 != i) {
        [v3 appendString:@"    "];
      }
    }
  }
  return v3;
}

- (BOOL)isRestricted
{
  int64_t v3 = [(WFLSMResult *)self numberOfCategories];
  int64_t v4 = [(WFLSMResult *)self bestMatchingCategory];
  [(WFLSMResult *)self scoreForCategory:v4];
  if (v4 != v3) {
    return 0;
  }
  float v6 = v5;
  [(NSNumber *)[(WFLSMResult *)self threshold] floatValue];
  return v6 > v7;
}

- (id)description
{
  int64_t v3 = (void *)[MEMORY[0x263EFF980] arrayWithArray:self->categoryJudgements];
  return (id)[NSString stringWithFormat:@"<%@:%d categoryJudgements:%@>", objc_msgSend((id)objc_opt_class(), "description"), self, objc_msgSend(v3, "description")];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WFLSMResult;
  [(WFLSMResult *)&v3 dealloc];
}

- (NSNumber)threshold
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setThreshold:(id)a3
{
}

@end