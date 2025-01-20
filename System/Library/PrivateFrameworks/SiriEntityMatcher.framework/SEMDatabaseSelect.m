@interface SEMDatabaseSelect
+ (id)builderWithTableName:(id)a3;
- (void)addLimit:(unint64_t)a3 offset:(unint64_t)a4;
- (void)replaceOffset:(unint64_t)a3;
@end

@implementation SEMDatabaseSelect

+ (id)builderWithTableName:(id)a3
{
  id v3 = a3;
  v4 = [SEMDatabaseSelectBuilder alloc];
  v7 = objc_msgSend_initWithTableName_(v4, v5, (uint64_t)v3, v6);

  return v7;
}

- (void)addLimit:(unint64_t)a3 offset:(unint64_t)a4
{
  objc_msgSend_numberWithUnsignedLong_(NSNumber, a2, a3, a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v6, a4, v7);
  objc_msgSend_addLimit_offset_forSelect_(SEMSQLCommandGenerator, v9, (uint64_t)v10, (uint64_t)v8, self);
}

- (void)replaceOffset:(unint64_t)a3
{
  objc_msgSend_numberWithUnsignedLong_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_replaceOffset_forSelect_(SEMSQLCommandGenerator, v5, (uint64_t)v6, (uint64_t)self);
}

@end