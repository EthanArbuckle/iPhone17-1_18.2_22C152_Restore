@interface PMMContextHelper
+ (id)sharedInstance;
- (PMMContextHelper)init;
- (_CDLocalContext)context;
- (id)fetchContextValueForKeyPath:(id)a3;
- (id)fetchDataDictionaryForKeyPath:(id)a3;
- (void)registerForNotifications:(id)a3;
@end

@implementation PMMContextHelper

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

void __34__PMMContextHelper_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x22A618A50]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

- (PMMContextHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)PMMContextHelper;
  v2 = [(PMMContextHelper *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F351B8] userContext];
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v3;
  }
  return v2;
}

- (void)registerForNotifications:(id)a3
{
}

- (id)fetchContextValueForKeyPath:(id)a3
{
  return (id)[(_CDLocalContext *)self->_context objectForKeyedSubscript:a3];
}

- (id)fetchDataDictionaryForKeyPath:(id)a3
{
  uint64_t v3 = [(PMMContextHelper *)self fetchContextValueForKeyPath:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

@end