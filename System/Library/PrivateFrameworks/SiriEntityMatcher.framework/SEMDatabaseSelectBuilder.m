@interface SEMDatabaseSelectBuilder
- (SEMDatabaseSelectBuilder)initWithTableName:(id)a3;
- (id)build;
- (void)setColumns:(id)a3;
- (void)setColumns:(id)a3 withTablePrefixes:(id)a4;
- (void)setCommandCriterion:(id)a3;
- (void)setCommandOrder:(id)a3;
- (void)setCount:(BOOL)a3;
- (void)setJoinWithTable:(id)a3 joinCriterion:(id)a4;
- (void)setLimit:(id)a3;
- (void)setOffset:(id)a3;
@end

@implementation SEMDatabaseSelectBuilder

- (SEMDatabaseSelectBuilder)initWithTableName:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SEMDatabaseSelectBuilder;
  v3 = [(SEMDatabaseCommandBuilder *)&v10 initWithTableName:a3];
  v4 = v3;
  if (v3)
  {
    join = v3->_join;
    v3->_join = 0;

    order = v4->_order;
    v4->_order = 0;

    v4->_count = 0;
    limit = v4->_limit;
    v4->_limit = 0;

    offset = v4->_offset;
    v4->_offset = 0;
  }
  return v4;
}

- (id)build
{
  v5 = objc_msgSend_tableName(self, a2, v2, v3);
  columns = self->_columns;
  BOOL count = self->_count;
  join = self->_join;
  v12 = objc_msgSend_criterion(self, v9, v10, v11);
  v14 = objc_msgSend_selectFromTableWithName_columns_count_join_criterion_order_limit_offset_(SEMSQLCommandGenerator, v13, (uint64_t)v5, (uint64_t)columns, count, join, v12, self->_order, self->_limit, self->_offset);

  return v14;
}

- (void)setCommandCriterion:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SEMDatabaseSelectBuilder;
  [(SEMDatabaseCommandBuilder *)&v3 setCommandCriterion:a3];
}

- (void)setJoinWithTable:(id)a3 joinCriterion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [SEMSQLCommandJoin alloc];
  uint64_t v10 = (SEMSQLCommandJoin *)objc_msgSend_initWithTable_joinCriterion_(v8, v9, (uint64_t)v7, (uint64_t)v6);

  join = self->_join;
  self->_join = v10;
}

- (void)setCommandOrder:(id)a3
{
  self->_order = (SEMSQLCommandOrder *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  MEMORY[0x270F9A758]();
}

- (void)setColumns:(id)a3
{
  self->_columns = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  MEMORY[0x270F9A758]();
}

- (void)setColumns:(id)a3 withTablePrefixes:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v11 = objc_msgSend_count(v35, v8, v9, v10);
  v14 = objc_msgSend_initWithCapacity_(v7, v12, v11, v13);
  if (objc_msgSend_count(v35, v15, v16, v17))
  {
    unint64_t v20 = 0;
    do
    {
      v21 = objc_msgSend_objectAtIndex_(v35, v18, v20, v19);
      if (objc_msgSend_count(v6, v22, v23, v24) <= v20)
      {
        v27 = 0;
        objc_msgSend_prefixColumnName_withTableName_(SEMSQLCommandGenerator, v25, (uint64_t)v21, 0);
      }
      else
      {
        v27 = objc_msgSend_objectAtIndex_(v6, v25, v20, v26);
        objc_msgSend_prefixColumnName_withTableName_(SEMSQLCommandGenerator, v28, (uint64_t)v21, (uint64_t)v27);
      v29 = };
      objc_msgSend_addObject_(v14, v30, (uint64_t)v29, v31);

      ++v20;
    }
    while (v20 < objc_msgSend_count(v35, v32, v33, v34));
  }
  objc_msgSend_setColumns_(self, v18, (uint64_t)v14, v19);
}

- (void)setCount:(BOOL)a3
{
  self->_BOOL count = a3;
}

- (void)setLimit:(id)a3
{
}

- (void)setOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_order, 0);
  objc_storeStrong((id *)&self->_join, 0);
}

@end