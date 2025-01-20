@interface NSObject(PQLResultSetInitializer)
- (uint64_t)initFromPQLResultSet:()PQLResultSetInitializer error:;
@end

@implementation NSObject(PQLResultSetInitializer)

- (uint64_t)initFromPQLResultSet:()PQLResultSetInitializer error:
{
  id v6 = a3;
  if ([v6 columns] == 1)
  {
    uint64_t v7 = [v6 unarchivedObjectOfClass:objc_opt_class() atIndex:0];
  }
  else
  {
    if (a4)
    {
      *a4 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:20 andMessage:@"This result set has more than one column"];
    }
    a1 = (void *)[a1 init];
    uint64_t v7 = 0;
  }

  return v7;
}

@end