@interface NSPredicate(RelativeRanks)
+ (id)_predicateForItemsWithAttribute:()RelativeRanks;
@end

@implementation NSPredicate(RelativeRanks)

+ (id)_predicateForItemsWithAttribute:()RelativeRanks
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__NSPredicate_RelativeRanks___predicateForItemsWithAttribute___block_invoke;
  v5[3] = &__block_descriptor_36_e41_B24__0__PRSRankingItem_8__NSDictionary_16l;
  int v6 = a3;
  v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:v5];
  return v3;
}

@end