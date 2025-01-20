@interface VUIActionPromise
- (NSDictionary)contextDataDictionary;
- (VUIActionPromise)initWithContextData:(id)a3 appContext:(id)a4;
- (VUIAppContext)appContext;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setAppContext:(id)a3;
@end

@implementation VUIActionPromise

- (VUIActionPromise)initWithContextData:(id)a3 appContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIActionPromise;
  v9 = [(VUIActionPromise *)&v12 init];
  v10 = v9;
  if (v7 && v9)
  {
    objc_storeStrong((id *)&v9->_contextDataDictionary, a3);
    objc_storeWeak((id *)&v10->_appContext, v8);
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, uint64_t))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  id v7 = WeakRetained;
  if (self->_contextDataDictionary) {
    BOOL v8 = WeakRetained == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[VUIActionPromise performWithTargetResponder:completionHandler:](v9);
    }

    if (v5) {
      goto LABEL_11;
    }
  }
  else
  {
    v10 = +[VUIInterfaceFactory sharedInstance];
    v11 = [v10 openURLHandler];
    [v11 processEntityWithContextData:self->_contextDataDictionary appContext:v7];

    if (v5) {
LABEL_11:
    }
      v5[2](v5, 1);
  }
}

- (NSDictionary)contextDataDictionary
{
  return self->_contextDataDictionary;
}

- (VUIAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (VUIAppContext *)WeakRetained;
}

- (void)setAppContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_contextDataDictionary, 0);
}

- (void)performWithTargetResponder:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIActionPromise failed", v1, 2u);
}

@end