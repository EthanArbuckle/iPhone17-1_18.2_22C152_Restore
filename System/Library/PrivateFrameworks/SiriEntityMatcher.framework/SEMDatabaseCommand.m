@interface SEMDatabaseCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCommand:(id)a3;
- (BOOL)updateCommandString:(id)a3;
- (BOOL)updateParameters:(id)a3;
- (NSArray)parameters;
- (NSString)commandString;
- (SEMDatabaseCommand)init;
- (SEMDatabaseCommand)initWithCommandString:(id)a3 parameters:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)replaceParameters:(id)a3;
@end

@implementation SEMDatabaseCommand

- (SEMDatabaseCommand)initWithCommandString:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SEMDatabaseCommand;
  v11 = [(SEMDatabaseCommand *)&v20 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    commandString = v11->_commandString;
    v11->_commandString = (NSString *)v12;

    uint64_t v17 = objc_msgSend_copy(v7, v14, v15, v16);
    parameters = v11->_parameters;
    v11->_parameters = (NSArray *)v17;
  }
  return v11;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SEMDatabaseCommand;
  v3 = [(SEMDatabaseCommand *)&v8 description];
  id v6 = objc_msgSend_stringByAppendingFormat_(v3, v4, @" commandString: %@, parameters: %@", v5, self->_commandString, self->_parameters);

  return v6;
}

- (SEMDatabaseCommand)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use +builderWithTableName", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SEMDatabaseCommand *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToCommand = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToCommand = objc_msgSend_isEqualToCommand_(self, v6, (uint64_t)v5, v7);
  }
  else
  {
    char isEqualToCommand = 0;
  }

  return isEqualToCommand;
}

- (BOOL)isEqualToCommand:(id)a3
{
  id v6 = a3;
  uint64_t v10 = v6;
  if (!v6)
  {
    char isEqual = 0;
    goto LABEL_18;
  }
  commandString = self->_commandString;
  uint64_t v12 = commandString;
  if (!commandString)
  {
    v3 = objc_msgSend_commandString(v6, v7, v8, v9);
    if (!v3)
    {
      int v15 = 0;
      goto LABEL_10;
    }
    uint64_t v12 = self->_commandString;
  }
  v4 = objc_msgSend_commandString(v10, v7, v8, v9);
  if ((objc_msgSend_isEqual_(v12, v13, (uint64_t)v4, v14) & 1) == 0)
  {

    char isEqual = 0;
    goto LABEL_16;
  }
  int v15 = 1;
LABEL_10:
  parameters = self->_parameters;
  v18 = parameters;
  if (!parameters)
  {
    uint64_t v12 = objc_msgSend_parameters(v10, v7, v8, v9);
    if (!v12)
    {
      char isEqual = 1;
      goto LABEL_20;
    }
    v18 = self->_parameters;
  }
  v19 = objc_msgSend_parameters(v10, v7, v8, v9);
  char isEqual = objc_msgSend_isEqual_(v18, v20, (uint64_t)v19, v21);

  if (parameters)
  {
    if (!v15) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_20:

  if (v15) {
LABEL_15:
  }

LABEL_16:
  if (!commandString) {

  }
LABEL_18:
  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_commandString, a2, v2, v3);
  uint64_t v9 = objc_msgSend_description(self->_parameters, v6, v7, v8);
  unint64_t v13 = objc_msgSend_hash(v9, v10, v11, v12) ^ v5;

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_copyWithZone_(self->_commandString, v9, (uint64_t)a3, v10);
  uint64_t v12 = (void *)v8[1];
  v8[1] = v11;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_parameters, v13, (uint64_t)a3, v14);
  uint64_t v16 = (void *)v8[2];
  v8[2] = v15;

  return v8;
}

- (void)replaceParameters:(id)a3
{
  self->_parameters = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  MEMORY[0x270F9A758]();
}

- (BOOL)updateParameters:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_count(self->_parameters, v5, v6, v7);
  uint64_t v15 = objc_msgSend_count(v4, v9, v10, v11);
  if (v8 == v15)
  {
    uint64_t v16 = (NSArray *)objc_msgSend_copy(v4, v12, v13, v14);
    parameters = self->_parameters;
    self->_parameters = v16;
  }
  return v8 == v15;
}

- (BOOL)updateCommandString:(id)a3
{
  uint64_t v5 = (NSString *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
  commandString = self->_commandString;
  self->_commandString = v5;

  return 1;
}

- (NSString)commandString
{
  return self->_commandString;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_commandString, 0);
}

@end