@interface BMSyncDatabaseCustomFunctionMigration
- (BMSyncDatabaseCustomFunctionMigration)initWithCustomFunctionName:(id)a3;
- (NSString)customFunctionName;
@end

@implementation BMSyncDatabaseCustomFunctionMigration

- (BMSyncDatabaseCustomFunctionMigration)initWithCustomFunctionName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMSyncDatabaseCustomFunctionMigration;
  v6 = [(BMSyncDatabaseCustomFunctionMigration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_customFunctionName, a3);
  }

  return v7;
}

- (NSString)customFunctionName
{
  return self->_customFunctionName;
}

- (void).cxx_destruct
{
}

@end