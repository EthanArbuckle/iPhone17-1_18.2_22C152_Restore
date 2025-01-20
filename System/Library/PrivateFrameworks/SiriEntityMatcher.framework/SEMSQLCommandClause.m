@interface SEMSQLCommandClause
- (NSArray)parameters;
- (NSString)clause;
- (SEMSQLCommandClause)init;
- (SEMSQLCommandClause)initWithClause:(id)a3 parameters:(id)a4;
- (id)description;
@end

@implementation SEMSQLCommandClause

- (SEMSQLCommandClause)initWithClause:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SEMSQLCommandClause;
  v11 = [(SEMSQLCommandClause *)&v20 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    clause = v11->_clause;
    v11->_clause = (NSString *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    parameters = v11->_parameters;
    v11->_parameters = (NSArray *)v17;
  }
  return v11;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SEMSQLCommandClause;
  v3 = [(SEMSQLCommandClause *)&v8 description];
  id v6 = objc_msgSend_stringByAppendingFormat_(v3, v4, @" clause: %@, parameters: %@", v5, self->_clause, self->_parameters);

  return v6;
}

- (SEMSQLCommandClause)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use -initWithClause:parameters", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (NSString)clause
{
  return self->_clause;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_clause, 0);
}

@end