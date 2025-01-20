@interface SEMDatabaseInsert
+ (id)builderWithTableName:(id)a3 columnNames:(id)a4;
@end

@implementation SEMDatabaseInsert

+ (id)builderWithTableName:(id)a3 columnNames:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [SEMDatabaseInsertBuilder alloc];
  v9 = objc_msgSend_initWithTableName_columnNames_(v7, v8, (uint64_t)v6, (uint64_t)v5);

  return v9;
}

@end