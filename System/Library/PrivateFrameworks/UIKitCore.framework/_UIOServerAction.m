@interface _UIOServerAction
- (BOOL)isPermitted;
- (_UIOServerAction)initWithOriginContext:(id)a3 info:(id)a4 responder:(id)a5;
- (_UIOServerActionOriginContext)originContext;
- (void)performActionFromConnection:(id)a3;
@end

@implementation _UIOServerAction

- (_UIOServerAction)initWithOriginContext:(id)a3 info:(id)a4 responder:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      id v11 = (id)[v9 mutableCopy];
      goto LABEL_6;
    }
  }
  else
  {
    id v8 = +[_UIOServerActionOriginContext defaultOriginContext];
    if (v9) {
      goto LABEL_3;
    }
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
LABEL_6:
  v12 = v11;
  id v21 = 0;
  v13 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v21];
  id v14 = v21;
  if (v14)
  {
    v15 = UIOLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = [v14 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_error_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Error encoding origin context data: %@", buf, 0xCu);
    }
  }
  else
  {
    [v12 setObject:v13 forSetting:512];
  }
  v20.receiver = self;
  v20.super_class = (Class)_UIOServerAction;
  v16 = [(_UIOServerAction *)&v20 initWithInfo:v12 responder:v10];
  v17 = v16;
  if (v16) {
    objc_storeStrong((id *)&v16->_originContext, v8);
  }

  return v17;
}

- (_UIOServerActionOriginContext)originContext
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  originContext = self->_originContext;
  if (!originContext)
  {
    v4 = [(_UIOServerAction *)self info];
    v5 = [v4 objectForSetting:512];

    id v12 = 0;
    v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v12];
    id v7 = v12;
    id v8 = self->_originContext;
    self->_originContext = v6;

    if (v7)
    {
      id v9 = UIOLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v11 = [v7 localizedDescription];
        *(_DWORD *)buf = 138412290;
        id v14 = v11;
        _os_log_error_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Error decoding origin context data: %@", buf, 0xCu);
      }
    }

    originContext = self->_originContext;
  }
  return originContext;
}

- (void)performActionFromConnection:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v7 handleFailureInMethod:a2, self, @"_UIOServerAction.m", 62, @"_UIOServerAction subclass <%@: %p> did not override -performActionFromConnection:", v6, self object file lineNumber description];
}

- (BOOL)isPermitted
{
  return 0;
}

- (void).cxx_destruct
{
}

@end