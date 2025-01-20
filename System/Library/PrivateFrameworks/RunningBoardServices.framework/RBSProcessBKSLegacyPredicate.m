@interface RBSProcessBKSLegacyPredicate
+ (id)legacyPredicate;
+ (id)legacyPredicateMatchingBundleIdentifier:(id)a3;
+ (id)legacyPredicateMatchingProcessIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessBKSLegacyPredicate

- (BOOL)matchesProcess:(id)a3
{
  return [a3 isReported];
}

+ (id)legacyPredicateMatchingBundleIdentifier:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[RBSProcessBKSLegacyPredicate legacyPredicate];
  v9[0] = v4;
  v5 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v3];

  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  v7 = +[RBSProcessPredicate predicateMatchingPredicates:v6];

  return v7;
}

+ (id)legacyPredicate
{
  if (legacyPredicate_onceToken != -1) {
    dispatch_once(&legacyPredicate_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)legacyPredicate___LegacyPredicate;
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();

  return v4 == v5;
}

void __47__RBSProcessBKSLegacyPredicate_legacyPredicate__block_invoke()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v0 = objc_alloc_init(RBSProcessBKSLegacyPredicate);
  v1 = +[RBSProcessPredicate predicateMatching:v0];

  v2 = +[RBSProcessPredicate predicateMatchingEuid:geteuid()];
  v6[0] = v1;
  v6[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v4 = +[RBSProcessPredicate predicateMatchingPredicates:v3];
  uint64_t v5 = (void *)legacyPredicate___LegacyPredicate;
  legacyPredicate___LegacyPredicate = v4;
}

+ (id)legacyPredicateMatchingProcessIdentifier:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[RBSProcessBKSLegacyPredicate legacyPredicate];
  v9[0] = v4;
  uint64_t v5 = +[RBSProcessPredicate predicateMatchingIdentifier:v3];

  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  v7 = +[RBSProcessPredicate predicateMatchingPredicates:v6];

  return v7;
}

@end