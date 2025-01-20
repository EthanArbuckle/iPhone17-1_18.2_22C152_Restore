@interface SEMDatabaseDelete
+ (id)builderWithTableName:(id)a3;
@end

@implementation SEMDatabaseDelete

+ (id)builderWithTableName:(id)a3
{
  id v3 = a3;
  v4 = [SEMDatabaseDeleteBuilder alloc];
  v7 = objc_msgSend_initWithTableName_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

@end