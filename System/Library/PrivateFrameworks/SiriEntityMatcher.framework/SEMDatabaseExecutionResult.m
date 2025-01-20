@interface SEMDatabaseExecutionResult
- (NSArray)rowValueTuples;
- (NSError)error;
- (SEMDatabaseCommand)command;
- (SEMDatabaseExecutionResult)init;
- (SEMDatabaseExecutionResult)initWithCommand:(id)a3 beginMachTime:(unint64_t)a4 endMachTime:(unint64_t)a5 rowValueTuples:(id)a6 error:(id)a7;
- (id)description;
- (unint64_t)beginMachTime;
- (unint64_t)endMachTime;
@end

@implementation SEMDatabaseExecutionResult

- (SEMDatabaseExecutionResult)initWithCommand:(id)a3 beginMachTime:(unint64_t)a4 endMachTime:(unint64_t)a5 rowValueTuples:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v32.receiver = self;
  v32.super_class = (Class)SEMDatabaseExecutionResult;
  v18 = [(SEMDatabaseExecutionResult *)&v32 init];
  if (v18)
  {
    uint64_t v19 = objc_msgSend_copy(v12, v15, v16, v17);
    command = v18->_command;
    v18->_command = (SEMDatabaseCommand *)v19;

    v18->_beginMachTime = a4;
    v18->_endMachTime = a5;
    uint64_t v24 = objc_msgSend_copy(v13, v21, v22, v23);
    rowValueTuples = v18->_rowValueTuples;
    v18->_rowValueTuples = (NSArray *)v24;

    uint64_t v29 = objc_msgSend_copy(v14, v26, v27, v28);
    error = v18->_error;
    v18->_error = (NSError *)v29;
  }
  return v18;
}

- (SEMDatabaseExecutionResult)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"You must use initWithCommand:", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  v3 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)SEMDatabaseExecutionResult;
  v4 = [(SEMDatabaseExecutionResult *)&v16 description];
  command = self->_command;
  v8 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, self->_beginMachTime, v7);
  v11 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v9, self->_endMachTime, v10);
  id v14 = objc_msgSend_stringWithFormat_(v3, v12, @"%@ {command: %@, beginMachTime: %@, endMachTime: %@, rowValueTuples: %@, error: %@}", v13, v4, command, v8, v11, self->_rowValueTuples, self->_error);

  return v14;
}

- (SEMDatabaseCommand)command
{
  return self->_command;
}

- (unint64_t)beginMachTime
{
  return self->_beginMachTime;
}

- (unint64_t)endMachTime
{
  return self->_endMachTime;
}

- (NSArray)rowValueTuples
{
  return self->_rowValueTuples;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_rowValueTuples, 0);
  objc_storeStrong((id *)&self->_command, 0);
}

@end