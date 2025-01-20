@interface TITypologyStatistic
+ (id)statistic;
- (NSDictionary)aggregateReport;
- (NSDictionary)structuredReport;
- (void)visitTypologyLog:(id)a3;
@end

@implementation TITypologyStatistic

+ (id)statistic
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (NSDictionary)aggregateReport
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (NSDictionary)structuredReport
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (void)visitTypologyLog:(id)a3
{
  id v4 = a3;
  [(TITypologyStatistic *)self prepareForComputation];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__TITypologyStatistic_visitTypologyLog___block_invoke;
  v5[3] = &unk_1E5559078;
  v5[4] = self;
  [v4 enumerateRecordsWithBlock:v5];

  [(TITypologyStatistic *)self finalizeComputation];
}

uint64_t __40__TITypologyStatistic_visitTypologyLog___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applyToStatistic:*(void *)(a1 + 32)];
}

@end