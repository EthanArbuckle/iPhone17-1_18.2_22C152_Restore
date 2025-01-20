@interface ICSpotlightUtilities
+ (id)queryFields;
+ (id)rankingQueryFieldsForGenericHighlighting;
+ (id)rankingQueryFieldsForSorting;
+ (id)rankingQueryFieldsForWordSpecificHighlighting;
+ (id)stringByEscapingSearchString:(id)a3;
+ (id)userActivityPersistentIdentifierForNote:(id)a3;
+ (unint64_t)rankingQueryLimit;
@end

@implementation ICSpotlightUtilities

+ (id)queryFields
{
  if (queryFields_onceTokenForAllQueryFields != -1) {
    dispatch_once(&queryFields_onceTokenForAllQueryFields, &__block_literal_global_19);
  }
  v2 = (void *)queryFields_allQueryFields;
  return v2;
}

void __35__ICSpotlightUtilities_queryFields__block_invoke()
{
  v4[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F01E00];
  v4[0] = @"_ICItemDisplayName";
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F026C8];
  v4[2] = *MEMORY[0x263F028D0];
  v4[3] = v1;
  v4[4] = *MEMORY[0x263F026D8];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  v3 = (void *)queryFields_allQueryFields;
  queryFields_allQueryFields = v2;
}

+ (unint64_t)rankingQueryLimit
{
  return 64;
}

+ (id)rankingQueryFieldsForGenericHighlighting
{
  if (rankingQueryFieldsForGenericHighlighting_onceTokenForAllQueryFields != -1) {
    dispatch_once(&rankingQueryFieldsForGenericHighlighting_onceTokenForAllQueryFields, &__block_literal_global_3_0);
  }
  uint64_t v2 = (void *)rankingQueryFieldsForGenericHighlighting_rankingQueryFields;
  return v2;
}

void __64__ICSpotlightUtilities_rankingQueryFieldsForGenericHighlighting__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F01E00];
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v3 count:1];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  uint64_t v2 = (void *)rankingQueryFieldsForGenericHighlighting_rankingQueryFields;
  rankingQueryFieldsForGenericHighlighting_rankingQueryFields = v1;
}

+ (id)rankingQueryFieldsForWordSpecificHighlighting
{
  if (rankingQueryFieldsForWordSpecificHighlighting_onceTokenForAllQueryFields != -1) {
    dispatch_once(&rankingQueryFieldsForWordSpecificHighlighting_onceTokenForAllQueryFields, &__block_literal_global_5);
  }
  uint64_t v2 = (void *)rankingQueryFieldsForWordSpecificHighlighting_rankingQueryFields;
  return v2;
}

void __69__ICSpotlightUtilities_rankingQueryFieldsForWordSpecificHighlighting__block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F028D0];
  v4[0] = @"_ICItemDisplayName";
  v4[1] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  v5[0] = v1;
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  uint64_t v3 = (void *)rankingQueryFieldsForWordSpecificHighlighting_rankingQueryFields;
  rankingQueryFieldsForWordSpecificHighlighting_rankingQueryFields = v2;
}

+ (id)rankingQueryFieldsForSorting
{
  if (rankingQueryFieldsForSorting_onceTokenForAllQueryFields != -1) {
    dispatch_once(&rankingQueryFieldsForSorting_onceTokenForAllQueryFields, &__block_literal_global_7);
  }
  uint64_t v2 = (void *)rankingQueryFieldsForSorting_rankingQueryFields;
  return v2;
}

void __52__ICSpotlightUtilities_rankingQueryFieldsForSorting__block_invoke()
{
  v8[3] = *MEMORY[0x263EF8340];
  v7 = @"_ICItemDisplayName";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  v8[0] = v0;
  uint64_t v6 = *MEMORY[0x263F01E00];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v6 count:1];
  v8[1] = v1;
  uint64_t v5 = *MEMORY[0x263F028D0];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v5 count:1];
  v8[2] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];
  v4 = (void *)rankingQueryFieldsForSorting_rankingQueryFields;
  rankingQueryFieldsForSorting_rankingQueryFields = v3;
}

+ (id)stringByEscapingSearchString:(id)a3
{
  uint64_t v3 = (void *)[a3 mutableCopy];
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\\", @"\\\\", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\", @"\\\", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"'", @"\\'", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"*", @"\\*", 0, 0, objc_msgSend(v3, "length"));
  return v3;
}

+ (id)userActivityPersistentIdentifierForNote:(id)a3
{
  return (id)[a3 contentIdentifier];
}

@end