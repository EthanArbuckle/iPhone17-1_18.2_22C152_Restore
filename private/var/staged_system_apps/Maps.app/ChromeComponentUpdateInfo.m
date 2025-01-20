@interface ChromeComponentUpdateInfo
+ (BOOL)supportsCallstackSymbols;
- (ChromeComponentUpdateInfo)init;
- (ChromeComponentUpdateInfo)initWithCompletionHandler:(id)a3;
- (NSArray)callStackSymbols;
- (id)completionHandler;
@end

@implementation ChromeComponentUpdateInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callStackSymbols, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

+ (BOOL)supportsCallstackSymbols
{
  v2 = sub_1000C2498();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  return v3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (ChromeComponentUpdateInfo)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ChromeComponentUpdateInfo;
  v5 = [(ChromeComponentUpdateInfo *)&v11 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id completionHandler = v5->_completionHandler;
    v5->_id completionHandler = v6;

    if (+[ChromeComponentUpdateInfo supportsCallstackSymbols])
    {
      uint64_t v8 = +[NSThread callStackSymbols];
      callStackSymbols = v5->_callStackSymbols;
      v5->_callStackSymbols = (NSArray *)v8;
    }
  }

  return v5;
}

- (ChromeComponentUpdateInfo)init
{
  return [(ChromeComponentUpdateInfo *)self initWithCompletionHandler:0];
}

- (NSArray)callStackSymbols
{
  return self->_callStackSymbols;
}

@end