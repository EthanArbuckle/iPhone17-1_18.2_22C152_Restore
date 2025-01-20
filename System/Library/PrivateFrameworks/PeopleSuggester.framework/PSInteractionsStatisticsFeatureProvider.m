@interface PSInteractionsStatisticsFeatureProvider
@end

@implementation PSInteractionsStatisticsFeatureProvider

uint64_t __75___PSInteractionsStatisticsFeatureProvider_initWithInteractionsStatistics___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setString:a3 forFeature:a2];
}

uint64_t __75___PSInteractionsStatisticsFeatureProvider_initWithInteractionsStatistics___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setNumber:a3 forFeature:a2];
}

@end