@interface APDataAdaptor
+ (NSString)identifier;
+ (id)dispatchQueue;
- (BOOL)_checkClassType:(id)a3 name:(id)a4 expectedClass:(Class)a5 error:(id *)a6;
- (BOOL)_requireClassType:(id)a3 name:(id)a4 expectedClass:(Class)a5 error:(id *)a6;
- (BOOL)_validateParameters:(id *)a3;
- (BOOL)addData:(id)a3;
- (BOOL)allowEmptyParameters;
- (NSDictionary)parameters;
- (NSString)identifier;
- (void)_run:(id)a3;
- (void)clearAllData;
- (void)clearDataWithPredicate:(id)a3;
- (void)runWithParameters:(id)a3 handler:(id)a4;
- (void)runWithParametersSync:(id)a3 handler:(id)a4;
- (void)setIdentifier:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation APDataAdaptor

+ (id)dispatchQueue
{
  if (qword_1002888D0 != -1) {
    dispatch_once(&qword_1002888D0, &stru_100233E18);
  }
  v2 = (void *)qword_1002888C8;

  return v2;
}

+ (NSString)identifier
{
  return (NSString *)&stru_1002392C0;
}

- (BOOL)allowEmptyParameters
{
  return 0;
}

- (void)runWithParametersSync:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v27 = (id)objc_opt_class();
    __int16 v28 = 2114;
    id v29 = v6;
    id v9 = v27;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Running data source %{public}@ synchronously with parameters %{public}@", buf, 0x16u);
  }
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_10005BDB4;
  v21 = &unk_100233E40;
  v10 = dispatch_semaphore_create(0);
  v22 = v10;
  id v11 = v7;
  id v23 = v11;
  [(APDataAdaptor *)self runWithParameters:v6 handler:&v18];
  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v10, v12))
  {
    v13 = [(APDataAdaptor *)self identifier];
    v14 = [(APDataAdaptor *)self parameters];
    v15 = +[NSString stringWithFormat:@"Adaptor '%@' timed out (parameters %@)", v13, v14, v18, v19, v20, v21, v22];

    NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
    v25 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    v17 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5205 userInfo:v16];

    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v17);
  }
}

- (void)runWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2114;
    id v16 = v6;
    id v9 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Running data source %{public}@ with parameters %{public}@", buf, 0x16u);
  }
  [(APDataAdaptor *)self setParameters:v6];
  id v12 = 0;
  unsigned __int8 v10 = [(APDataAdaptor *)self _validateParameters:&v12];
  id v11 = v12;
  if (v10) {
    [(APDataAdaptor *)self _run:v7];
  }
  else {
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v11);
  }
}

- (BOOL)addData:(id)a3
{
  v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "DataAdaptor %@ does not support addition.", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (void)clearAllData
{
  v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "DataAdaptor %@ does not support deletion.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)clearDataWithPredicate:(id)a3
{
  v3 = APLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    int v6 = 138412290;
    int v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "DataAdaptor %@ does not support deletion.", (uint8_t *)&v6, 0xCu);
  }
}

- (BOOL)_checkClassType:(id)a3 name:(id)a4 expectedClass:(Class)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a6)
    {
      id v12 = [(APDataAdaptor *)self identifier];
      v13 = NSStringFromClass(a5);
      id v14 = +[NSString stringWithFormat:@"%@: parameter '%@' must be of type %@.", v12, v11, v13];

      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      v18 = v14;
      __int16 v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a6 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5201 userInfo:v15];

      LOBYTE(a6) = 0;
    }
  }
  else
  {
    LOBYTE(a6) = 1;
  }

  return (char)a6;
}

- (BOOL)_requireClassType:(id)a3 name:(id)a4 expectedClass:(Class)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v10)
  {
    LOBYTE(a6) = [(APDataAdaptor *)self _checkClassType:v10 name:v11 expectedClass:a5 error:a6];
  }
  else if (a6)
  {
    id v12 = [(APDataAdaptor *)self identifier];
    v13 = +[NSString stringWithFormat:@"%@: missing required parameter '%@'.", v12, v11];

    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v17 = v13;
    id v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    *a6 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5202 userInfo:v14];

    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

- (void)_run:(id)a3
{
  id v4 = a3;
  int v5 = [(APDataAdaptor *)self identifier];
  int v6 = +[NSString stringWithFormat:@"Adaptor '%@' does not override _run method.", v5];

  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v6;
  int v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v8 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5206 userInfo:v7];

  (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v8);
}

- (BOOL)_validateParameters:(id *)a3
{
  if ([(APDataAdaptor *)self allowEmptyParameters]) {
    return 1;
  }
  int v5 = [(APDataAdaptor *)self parameters];
  id v6 = [v5 count];

  if (v6) {
    return 1;
  }
  v8 = [(APDataAdaptor *)self identifier];
  NSErrorUserInfoKey v9 = +[NSString stringWithFormat:@"Adaptor '%@' requires at least one parameter", v8];

  if (a3)
  {
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    id v12 = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    *a3 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5202 userInfo:v10];
  }
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end