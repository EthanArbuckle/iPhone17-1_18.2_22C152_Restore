@interface NSNumber
@end

@implementation NSNumber

void __67__NSNumber_PBFSQLiteQueryBuilderAdditions__pbf_valueForSQLiteQuery__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)pbf_valueForSQLiteQuery_numberFormatter;
  pbf_valueForSQLiteQuery_numberFormatter = (uint64_t)v0;

  v2 = (void *)pbf_valueForSQLiteQuery_numberFormatter;
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
}

@end