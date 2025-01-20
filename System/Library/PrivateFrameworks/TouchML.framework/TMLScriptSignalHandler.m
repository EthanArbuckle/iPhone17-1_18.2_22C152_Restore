@interface TMLScriptSignalHandler
- (TMLScriptSignalHandler)initWithFunctionName:(id)a3 returnType:(unint64_t)a4 target:(id)a5 context:(id)a6;
- (id)callWithArguments:(id)a3;
@end

@implementation TMLScriptSignalHandler

- (TMLScriptSignalHandler)initWithFunctionName:(id)a3 returnType:(unint64_t)a4 target:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)TMLScriptSignalHandler;
  v13 = [(TMLScriptSignalHandler *)&v20 init];
  v16 = v13;
  if (v13)
  {
    v13->_returnType = a4;
    uint64_t v17 = objc_msgSend_copy(v10, v14, v15);
    functionName = v16->_functionName;
    v16->_functionName = (NSString *)v17;

    objc_storeWeak(&v16->_target, v11);
    objc_storeWeak((id *)&v16->_context, v12);
  }

  return v16;
}

- (id)callWithArguments:(id)a3
{
  id v5 = a3;
  if ((atomic_fetch_or((atomic_uchar *volatile)&self->_flags, 0x40u) & 0x40) != 0)
  {
    double v15 = (void *)MEMORY[0x263EFF940];
    id v10 = objc_msgSend_stringWithFormat_(NSString, v4, v6, @"Nested signal triggered '%@'", self->_functionName);
    v18 = objc_msgSend_exceptionWithName_reason_userInfo_(v15, v16, v17, @"TMLRuntimeException", v10, 0);
    objc_msgSend_raiseException_(TMLExceptionHandler, v19, v20, v18);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    id v10 = objc_msgSend_callFunction_arguments_returnType_(WeakRetained, v8, v9, self->_functionName, v5, self->_returnType);

    atomic_fetch_and_explicit((atomic_uchar *volatile)&self->_flags, 0xBFu, memory_order_relaxed);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

      id v10 = 0;
    }
    if (self->_returnType != 1)
    {
      id v11 = [TMLValue alloc];
      v14 = objc_msgSend_initWithValue_valueType_(v11, v12, v13, v10, self->_returnType);
      goto LABEL_8;
    }
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_destroyWeak(&self->_target);
  objc_destroyWeak((id *)&self->_context);
}

@end