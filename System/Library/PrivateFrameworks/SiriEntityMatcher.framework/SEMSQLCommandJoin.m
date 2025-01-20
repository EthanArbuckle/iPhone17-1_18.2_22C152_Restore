@interface SEMSQLCommandJoin
- (NSString)table;
- (SEMSQLCommandJoin)init;
- (SEMSQLCommandJoin)initWithTable:(id)a3 joinCriterion:(id)a4;
- (SEMSQLCommandJoinCriterion)joinCriterion;
- (id)description;
@end

@implementation SEMSQLCommandJoin

- (SEMSQLCommandJoin)initWithTable:(id)a3 joinCriterion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SEMSQLCommandJoin;
  v11 = [(SEMSQLCommandJoin *)&v20 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    table = v11->_table;
    v11->_table = (NSString *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    joinCriterion = v11->_joinCriterion;
    v11->_joinCriterion = (SEMSQLCommandJoinCriterion *)v17;
  }
  return v11;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SEMSQLCommandJoin;
  v3 = [(SEMSQLCommandJoin *)&v8 description];
  id v6 = objc_msgSend_stringByAppendingFormat_(v3, v4, @" table: %@, criterion: %@", v5, self->_table, self->_joinCriterion);

  return v6;
}

- (SEMSQLCommandJoin)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use -initWithClause:parameters", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)table
{
  return self->_table;
}

- (SEMSQLCommandJoinCriterion)joinCriterion
{
  return self->_joinCriterion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinCriterion, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end