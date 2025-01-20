@interface TIDiagnosticHelper
+ (id)sharedInstance;
- (TIDiagnosticHelper)init;
- (id)registerForSignal:(int)a3 withBlock:(id)a4;
- (void)dealloc;
- (void)handleMachMessage:(void *)a3;
- (void)unregisterSignalHandler:(id)a3;
@end

@implementation TIDiagnosticHelper

+ (id)sharedInstance
{
  if (qword_100026DD0 != -1) {
    dispatch_once(&qword_100026DD0, &stru_10001C7C8);
  }
  v2 = (void *)qword_100026DC8;
  return v2;
}

- (TIDiagnosticHelper)init
{
  v9.receiver = self;
  v9.super_class = (Class)TIDiagnosticHelper;
  v2 = [(TIDiagnosticHelper *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMachPort port];
    port = v2->_port;
    v2->_port = (NSMachPort *)v5;

    dword_100026DD8 = [(NSMachPort *)v2->_port machPort];
    [(NSMachPort *)v2->_port setDelegate:v2];
    v7 = +[NSRunLoop mainRunLoop];
    [v7 addPort:v2->_port forMode:NSDefaultRunLoopMode];
  }
  return v2;
}

- (void)dealloc
{
  dword_100026DD8 = 0;
  uint64_t v3 = +[NSRunLoop mainRunLoop];
  [v3 removePort:self->_port forMode:NSDefaultRunLoopMode];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(NSMutableDictionary *)self->_handlers allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        signal((int)[*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) intValue], 0);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)TIDiagnosticHelper;
  [(TIDiagnosticHelper *)&v9 dealloc];
}

- (void)handleMachMessage:(void *)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  handlers = self->_handlers;
  v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)a3 + 5), 0);
  id v5 = [(NSMutableDictionary *)handlers objectForKey:v4];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      objc_super v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))();
        objc_super v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)registerForSignal:(int)a3 withBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = +[NSNumber numberWithInt:v4];
  uint64_t v8 = [(NSMutableDictionary *)self->_handlers objectForKey:v7];
  if (!v8)
  {
    uint64_t v8 = +[NSMutableArray array];
    [(NSMutableDictionary *)self->_handlers setObject:v8 forKey:v7];
    signal(v4, (void (__cdecl *)(int))sub_1000070FC);
  }
  id v9 = [v6 copy];
  id v10 = objc_retainBlock(v9);
  [v8 addObject:v10];

  v14[0] = v7;
  id v11 = objc_retainBlock(v9);
  v14[1] = v11;
  long long v12 = +[NSArray arrayWithObjects:v14 count:2];

  return v12;
}

- (void)unregisterSignalHandler:(id)a3
{
  id v4 = a3;
  id v7 = [v4 objectAtIndex:0];
  id v5 = -[NSMutableDictionary objectForKey:](self->_handlers, "objectForKey:");
  id v6 = [v4 objectAtIndex:1];

  [v5 removeObject:v6];
  if (![v5 count])
  {
    [(NSMutableDictionary *)self->_handlers removeObjectForKey:v7];
    signal((int)[v7 intValue], 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

@end