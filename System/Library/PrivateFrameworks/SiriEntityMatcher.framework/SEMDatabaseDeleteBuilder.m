@interface SEMDatabaseDeleteBuilder
- (id)build;
- (void)setCommandCriterion:(id)a3;
- (void)setReturningColumns:(id)a3;
@end

@implementation SEMDatabaseDeleteBuilder

- (id)build
{
  v5 = objc_msgSend_tableName(self, a2, v2, v3);
  v9 = objc_msgSend_criterion(self, v6, v7, v8);
  v11 = objc_msgSend_deleteFromTableWithName_criterion_returningColumns_(SEMSQLCommandGenerator, v10, (uint64_t)v5, (uint64_t)v9, self->_returningColumns);

  return v11;
}

- (void)setCommandCriterion:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SEMDatabaseDeleteBuilder;
  [(SEMDatabaseCommandBuilder *)&v3 setCommandCriterion:a3];
}

- (void)setReturningColumns:(id)a3
{
  self->_returningColumns = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  MEMORY[0x270F9A758]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_returningColumns, 0);
}

@end