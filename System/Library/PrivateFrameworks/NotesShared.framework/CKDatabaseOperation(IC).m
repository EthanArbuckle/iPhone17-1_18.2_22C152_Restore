@interface CKDatabaseOperation(IC)
- (id)ic_loggingValues;
@end

@implementation CKDatabaseOperation(IC)

- (id)ic_loggingValues
{
  v7.receiver = a1;
  v7.super_class = (Class)&off_1F1F9C250;
  v2 = objc_msgSendSuper2(&v7, sel_ic_loggingValues);
  v3 = (void *)[v2 mutableCopy];

  v4 = [a1 database];
  [v4 databaseScope];
  v5 = CKDatabaseScopeString();
  [v3 setObject:v5 forKeyedSubscript:@"databaseScope"];

  return v3;
}

@end