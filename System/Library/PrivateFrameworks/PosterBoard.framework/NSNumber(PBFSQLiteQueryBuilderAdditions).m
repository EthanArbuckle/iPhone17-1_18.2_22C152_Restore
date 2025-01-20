@interface NSNumber(PBFSQLiteQueryBuilderAdditions)
- (uint64_t)pbf_valueForSQLiteQuery;
@end

@implementation NSNumber(PBFSQLiteQueryBuilderAdditions)

- (uint64_t)pbf_valueForSQLiteQuery
{
  if (pbf_valueForSQLiteQuery___once != -1) {
    dispatch_once(&pbf_valueForSQLiteQuery___once, &__block_literal_global_373);
  }
  v2 = (void *)pbf_valueForSQLiteQuery_numberFormatter;
  return [v2 stringFromNumber:a1];
}

@end