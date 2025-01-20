@interface RERuleMLElementComparator
@end

@implementation RERuleMLElementComparator

uint64_t __72___RERuleMLElementComparator_initWithFilteringRules_rankingRules_model___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  [a3 priority];
  v6 = objc_msgSend(v4, "numberWithFloat:");
  v7 = NSNumber;
  [v5 priority];
  int v9 = v8;

  LODWORD(v10) = v9;
  v11 = [v7 numberWithFloat:v10];
  uint64_t v12 = [v6 compare:v11];

  return v12;
}

uint64_t __72___RERuleMLElementComparator_initWithFilteringRules_rankingRules_model___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  [a3 priority];
  v6 = objc_msgSend(v4, "numberWithFloat:");
  v7 = NSNumber;
  [v5 priority];
  int v9 = v8;

  LODWORD(v10) = v9;
  v11 = [v7 numberWithFloat:v10];
  uint64_t v12 = [v6 compare:v11];

  return v12;
}

@end