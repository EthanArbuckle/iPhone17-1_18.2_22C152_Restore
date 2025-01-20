@interface NSNull(PBFSQLiteQueryBuilderAdditions)
- (__CFString)pbf_valueForSQLiteQuery;
@end

@implementation NSNull(PBFSQLiteQueryBuilderAdditions)

- (__CFString)pbf_valueForSQLiteQuery
{
  return @"NULL";
}

@end