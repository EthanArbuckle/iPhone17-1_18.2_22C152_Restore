@interface SEMSQLCommandJoinCriterion
+ (SEMSQLCommandJoinCriterion)criterionWithANDSubCriteria:(id)a3;
+ (SEMSQLCommandJoinCriterion)criterionWithColumnName:(id)a3 onTable:(id)a4 EQUALSColumnName:(id)a5 comparingTableName:(id)a6;
- (NSArray)subCriteria;
- (NSString)columnName;
- (NSString)comparingColumnName;
- (NSString)comparingTableName;
- (NSString)tableName;
- (SEMSQLCommandJoinCriterion)initWithColumnName:(id)a3 onTable:(id)a4 comparingColumnName:(id)a5 comparingTableName:(id)a6 sqlOperator:(int64_t)a7;
- (SEMSQLCommandJoinCriterion)initWithSubCriteria:(id)a3 sqlOperator:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)sqlOperator;
@end

@implementation SEMSQLCommandJoinCriterion

- (SEMSQLCommandJoinCriterion)initWithColumnName:(id)a3 onTable:(id)a4 comparingColumnName:(id)a5 comparingTableName:(id)a6 sqlOperator:(int64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SEMSQLCommandJoinCriterion;
  v17 = [(SEMSQLCommandJoinCriterion *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_columnName, a3);
    objc_storeStrong((id *)&v18->_tableName, a4);
    objc_storeStrong((id *)&v18->_comparingColumnName, a5);
    objc_storeStrong((id *)&v18->_comparingTableName, a6);
    v18->_sqlOperator = a7;
  }

  return v18;
}

- (SEMSQLCommandJoinCriterion)initWithSubCriteria:(id)a3 sqlOperator:(int64_t)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SEMSQLCommandJoinCriterion;
  v7 = [(SEMSQLCommandJoinCriterion *)&v19 init];
  v8 = v7;
  if (v7)
  {
    columnName = v7->_columnName;
    v7->_columnName = 0;

    comparingColumnName = v8->_comparingColumnName;
    v8->_comparingColumnName = 0;

    v11 = v8->_comparingColumnName;
    v8->_comparingColumnName = 0;

    comparingTableName = v8->_comparingTableName;
    v8->_comparingTableName = 0;

    v8->_sqlOperator = a4;
    uint64_t v16 = objc_msgSend_copy(v6, v13, v14, v15);
    subCriteria = v8->_subCriteria;
    v8->_subCriteria = (NSArray *)v16;
  }
  return v8;
}

+ (SEMSQLCommandJoinCriterion)criterionWithColumnName:(id)a3 onTable:(id)a4 EQUALSColumnName:(id)a5 comparingTableName:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [SEMSQLCommandJoinCriterion alloc];
  uint64_t v15 = objc_msgSend_initWithColumnName_onTable_comparingColumnName_comparingTableName_sqlOperator_(v13, v14, (uint64_t)v12, (uint64_t)v11, v10, v9, 1);

  return (SEMSQLCommandJoinCriterion *)v15;
}

+ (SEMSQLCommandJoinCriterion)criterionWithANDSubCriteria:(id)a3
{
  id v3 = a3;
  v4 = [SEMSQLCommandJoinCriterion alloc];
  id v6 = objc_msgSend_initWithSubCriteria_sqlOperator_(v4, v5, (uint64_t)v3, 10);

  return (SEMSQLCommandJoinCriterion *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_copyWithZone_(self->_columnName, v9, (uint64_t)a3, v10);
  id v12 = (void *)v8[1];
  v8[1] = v11;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_tableName, v13, (uint64_t)a3, v14);
  uint64_t v16 = (void *)v8[2];
  v8[2] = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_comparingColumnName, v17, (uint64_t)a3, v18);
  objc_super v20 = (void *)v8[3];
  v8[3] = v19;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_comparingTableName, v21, (uint64_t)a3, v22);
  v24 = (void *)v8[4];
  v8[4] = v23;

  v8[5] = self->_sqlOperator;
  uint64_t v27 = objc_msgSend_copyWithZone_(self->_subCriteria, v25, (uint64_t)a3, v26);
  v28 = (void *)v8[6];
  v8[6] = v27;

  return v8;
}

- (NSString)columnName
{
  return self->_columnName;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSString)comparingColumnName
{
  return self->_comparingColumnName;
}

- (NSString)comparingTableName
{
  return self->_comparingTableName;
}

- (int64_t)sqlOperator
{
  return self->_sqlOperator;
}

- (NSArray)subCriteria
{
  return self->_subCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subCriteria, 0);
  objc_storeStrong((id *)&self->_comparingTableName, 0);
  objc_storeStrong((id *)&self->_comparingColumnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_columnName, 0);
}

@end