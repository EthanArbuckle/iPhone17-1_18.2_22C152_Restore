@interface REMLElementComparator
+ (REMLElementComparator)comparatorWithFilteringRules:(id)a3 rankingRules:(id)a4 model:(id)a5;
- (BOOL)shouldHideElement:(id)a3;
- (NSArray)filteringRules;
- (NSArray)rankingRules;
- (REMLElementComparator)initWithModel:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)model;
- (int64_t)compareElement:(id)a3 toElement:(id)a4 level:(unint64_t)a5;
- (unint64_t)comparisonLevels;
- (void)setFilteringRules:(id)a3;
- (void)setRankingRules:(id)a3;
@end

@implementation REMLElementComparator

- (REMLElementComparator)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMLElementComparator;
  v6 = [(REMLElementComparator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_model, a3);
  }

  return v7;
}

- (id)model
{
  return self->_model;
}

+ (REMLElementComparator)comparatorWithFilteringRules:(id)a3 rankingRules:(id)a4 model:(id)a5
{
  return (REMLElementComparator *)+[_RERuleMLElementComparator comparatorWithFilteringRules:a3 rankingRules:a4 model:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankingRules, 0);
  objc_storeStrong((id *)&self->_filteringRules, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (BOOL)shouldHideElement:(id)a3
{
  return 0;
}

- (unint64_t)comparisonLevels
{
  return 1;
}

- (int64_t)compareElement:(id)a3 toElement:(id)a4 level:(unint64_t)a5
{
  id v6 = a4;
  v7 = [a3 identifier];
  v8 = [v6 identifier];

  uint64_t v9 = [v7 compare:v8];
  if (v9 == 1) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = -1;
  }
  if (v9) {
    return v10;
  }
  else {
    return 0;
  }
}

- (NSArray)filteringRules
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (NSArray)rankingRules
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  model = self->_model;
  return (id)[v4 initWithModel:model];
}

- (void)setFilteringRules:(id)a3
{
}

- (void)setRankingRules:(id)a3
{
}

@end