@interface SEMDatabaseUpdateBuilder
- (SEMDatabaseUpdateBuilder)initWithTableName:(id)a3;
- (id)build;
- (void)setCommandCriterion:(id)a3;
- (void)setReturningColumns:(id)a3;
- (void)setValue:(id)a3 forColumn:(id)a4;
@end

@implementation SEMDatabaseUpdateBuilder

- (SEMDatabaseUpdateBuilder)initWithTableName:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SEMDatabaseUpdateBuilder;
  v3 = [(SEMDatabaseCommandBuilder *)&v9 initWithTableName:a3];
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    columnNames = v3->_columnNames;
    v3->_columnNames = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    columnValues = v3->_columnValues;
    v3->_columnValues = v6;
  }
  return v3;
}

- (id)build
{
  v5 = objc_msgSend_tableName(self, a2, v2, v3);
  columnNames = self->_columnNames;
  columnValues = self->_columnValues;
  v11 = objc_msgSend_criterion(self, v8, v9, v10);
  v13 = objc_msgSend_updateWithTableName_columnNames_columnValues_criterion_returningColumns_(SEMSQLCommandGenerator, v12, (uint64_t)v5, (uint64_t)columnNames, columnValues, v11, self->_returningColumns);

  return v13;
}

- (void)setCommandCriterion:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SEMDatabaseUpdateBuilder;
  [(SEMDatabaseCommandBuilder *)&v3 setCommandCriterion:a3];
}

- (void)setValue:(id)a3 forColumn:(id)a4
{
  columnNames = self->_columnNames;
  id v11 = a3;
  objc_msgSend_addObject_(columnNames, v7, (uint64_t)a4, v8);
  objc_msgSend_addObject_(self->_columnValues, v9, (uint64_t)v11, v10);
}

- (void)setReturningColumns:(id)a3
{
  self->_returningColumns = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returningColumns, 0);
  objc_storeStrong((id *)&self->_columnValues, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
}

@end