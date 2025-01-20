@interface SEMSQLCommandCriterion
+ (SEMSQLCommandCriterion)criterionWithANDSubCriteria:(id)a3;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 BETWEENLowerColumnValue:(id)a4 ANDUpperColumnValue:(id)a5;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 EQUALSColumnValue:(id)a4;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 GREATERTHANOrEqualColumnValue:(id)a4;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 INColumnValues:(id)a4;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 ISColumnValue:(id)a4;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 ISNOTColumnValue:(id)a4;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 LESSTHANColumnValue:(id)a4;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 LESSTHANOrEqualColumnValue:(id)a4;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 LIKEWildcardPattern:(id)a4;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 MATCHSearchPhrase:(id)a4;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 NOTEQUALSColumnValue:(id)a4;
+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 onTable:(id)a4 EQUALSColumnValue:(id)a5;
+ (SEMSQLCommandCriterion)criterionWithORSubCriteria:(id)a3;
- (NSArray)columnValues;
- (NSArray)subCriteria;
- (NSString)columnName;
- (NSString)comparingColumnName;
- (NSString)tableName;
- (SEMSQLCommandCriterion)init;
- (SEMSQLCommandCriterion)initWithColumnName:(id)a3 columnValue:(id)a4 sqlOperator:(int64_t)a5;
- (SEMSQLCommandCriterion)initWithColumnName:(id)a3 columnValues:(id)a4 sqlOperator:(int64_t)a5;
- (SEMSQLCommandCriterion)initWithColumnName:(id)a3 tableName:(id)a4 columnValue:(id)a5 sqlOperator:(int64_t)a6;
- (SEMSQLCommandCriterion)initWithSubCriteria:(id)a3 sqlOperator:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)sqlOperator;
@end

@implementation SEMSQLCommandCriterion

- (SEMSQLCommandCriterion)initWithColumnName:(id)a3 columnValues:(id)a4 sqlOperator:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SEMSQLCommandCriterion;
  v13 = [(SEMSQLCommandCriterion *)&v23 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v8, v10, v11, v12);
    columnName = v13->_columnName;
    v13->_columnName = (NSString *)v14;

    uint64_t v19 = objc_msgSend_copy(v9, v16, v17, v18);
    columnValues = v13->_columnValues;
    v13->_columnValues = (NSArray *)v19;

    subCriteria = v13->_subCriteria;
    v13->_sqlOperator = a5;
    v13->_subCriteria = 0;
  }
  return v13;
}

- (SEMSQLCommandCriterion)initWithColumnName:(id)a3 columnValue:(id)a4 sqlOperator:(int64_t)a5
{
  return (SEMSQLCommandCriterion *)objc_msgSend_initWithColumnName_tableName_columnValue_sqlOperator_(self, a2, (uint64_t)a3, 0, a4, a5);
}

- (SEMSQLCommandCriterion)initWithColumnName:(id)a3 tableName:(id)a4 columnValue:(id)a5 sqlOperator:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)SEMSQLCommandCriterion;
  v16 = [(SEMSQLCommandCriterion *)&v30 init];
  if (v16)
  {
    uint64_t v17 = objc_msgSend_copy(v10, v13, v14, v15);
    columnName = v16->_columnName;
    v16->_columnName = (NSString *)v17;

    uint64_t v22 = objc_msgSend_copy(v11, v19, v20, v21);
    tableName = v16->_tableName;
    v16->_tableName = (NSString *)v22;

    uint64_t v26 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v24, (uint64_t)v12, v25);
    columnValues = v16->_columnValues;
    v16->_columnValues = (NSArray *)v26;

    subCriteria = v16->_subCriteria;
    v16->_sqlOperator = a6;
    v16->_subCriteria = 0;
  }
  return v16;
}

- (SEMSQLCommandCriterion)initWithSubCriteria:(id)a3 sqlOperator:(int64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SEMSQLCommandCriterion;
  v7 = [(SEMSQLCommandCriterion *)&v17 init];
  id v8 = v7;
  if (v7)
  {
    columnName = v7->_columnName;
    v7->_columnName = 0;

    columnValues = v8->_columnValues;
    v8->_columnValues = 0;

    v8->_sqlOperator = a4;
    uint64_t v14 = objc_msgSend_copy(v6, v11, v12, v13);
    subCriteria = v8->_subCriteria;
    v8->_subCriteria = (NSArray *)v14;
  }
  return v8;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 EQUALSColumnValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  id v9 = objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, (uint64_t)v5, 1);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 ISColumnValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  id v9 = objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, (uint64_t)v5, 12);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 ISNOTColumnValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [SEMSQLCommandCriterion alloc];
  id v9 = objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, (uint64_t)v5, 13);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 onTable:(id)a4 EQUALSColumnValue:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [SEMSQLCommandCriterion alloc];
  uint64_t v12 = objc_msgSend_initWithColumnName_tableName_columnValue_sqlOperator_(v10, v11, (uint64_t)v9, (uint64_t)v8, v7, 1);

  return (SEMSQLCommandCriterion *)v12;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 NOTEQUALSColumnValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SEMSQLCommandCriterion alloc];
  id v9 = objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, (uint64_t)v5, 6);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 LESSTHANColumnValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SEMSQLCommandCriterion alloc];
  id v9 = objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, (uint64_t)v5, 2);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 LESSTHANOrEqualColumnValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SEMSQLCommandCriterion alloc];
  id v9 = objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, (uint64_t)v5, 3);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 GREATERTHANOrEqualColumnValue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SEMSQLCommandCriterion alloc];
  id v9 = objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, (uint64_t)v5, 4);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 MATCHSearchPhrase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SEMSQLCommandCriterion alloc];
  id v9 = objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, (uint64_t)v5, 5);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 LIKEWildcardPattern:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SEMSQLCommandCriterion alloc];
  id v9 = objc_msgSend_initWithColumnName_columnValue_sqlOperator_(v7, v8, (uint64_t)v6, (uint64_t)v5, 9);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 INColumnValues:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [SEMSQLCommandCriterion alloc];
  id v9 = objc_msgSend_initWithColumnName_columnValues_sqlOperator_(v7, v8, (uint64_t)v6, (uint64_t)v5, 8);

  return (SEMSQLCommandCriterion *)v9;
}

+ (SEMSQLCommandCriterion)criterionWithColumnName:(id)a3 BETWEENLowerColumnValue:(id)a4 ANDUpperColumnValue:(id)a5
{
  v16[2] = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [SEMSQLCommandCriterion alloc];
  v16[0] = v8;
  v16[1] = v7;
  uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v11, (uint64_t)v16, 2);

  uint64_t v14 = objc_msgSend_initWithColumnName_columnValues_sqlOperator_(v10, v13, (uint64_t)v9, (uint64_t)v12, 7);
  return (SEMSQLCommandCriterion *)v14;
}

+ (SEMSQLCommandCriterion)criterionWithANDSubCriteria:(id)a3
{
  id v3 = a3;
  v4 = [SEMSQLCommandCriterion alloc];
  id v6 = objc_msgSend_initWithSubCriteria_sqlOperator_(v4, v5, (uint64_t)v3, 10);

  return (SEMSQLCommandCriterion *)v6;
}

+ (SEMSQLCommandCriterion)criterionWithORSubCriteria:(id)a3
{
  id v3 = a3;
  v4 = [SEMSQLCommandCriterion alloc];
  id v6 = objc_msgSend_initWithSubCriteria_sqlOperator_(v4, v5, (uint64_t)v3, 11);

  return (SEMSQLCommandCriterion *)v6;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)SEMSQLCommandCriterion;
  id v3 = [(SEMSQLCommandCriterion *)&v13 description];
  columnName = self->_columnName;
  columnValues = self->_columnValues;
  id v8 = objc_msgSend_numberWithInteger_(NSNumber, v6, self->_sqlOperator, v7);
  id v11 = objc_msgSend_stringByAppendingFormat_(v3, v9, @" columnName: %@, columnValues: %@, sqlOperator: %@, subCriteria: %@", v10, columnName, columnValues, v8, self->_subCriteria);

  return v11;
}

- (SEMSQLCommandCriterion)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use factory methods", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  id v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_copyWithZone_(self->_columnName, v9, (uint64_t)a3, v10);
  uint64_t v12 = (void *)v8[1];
  v8[1] = v11;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_columnValues, v13, (uint64_t)a3, v14);
  v16 = (void *)v8[4];
  v8[4] = v15;

  v8[5] = self->_sqlOperator;
  uint64_t v19 = objc_msgSend_copyWithZone_(self->_subCriteria, v17, (uint64_t)a3, v18);
  uint64_t v20 = (void *)v8[6];
  v8[6] = v19;

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

- (NSArray)columnValues
{
  return self->_columnValues;
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
  objc_storeStrong((id *)&self->_columnValues, 0);
  objc_storeStrong((id *)&self->_comparingColumnName, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_columnName, 0);
}

@end