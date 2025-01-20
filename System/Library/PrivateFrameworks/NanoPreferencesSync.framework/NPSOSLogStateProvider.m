@interface NPSOSLogStateProvider
- (NPSOSLogStateProvider)initWithName:(id)a3 maxStringLength:(int64_t)a4 block:(id)a5;
- (void)registerOSLogStateHandlerName:(id)a3 block:(id)a4;
@end

@implementation NPSOSLogStateProvider

- (NPSOSLogStateProvider)initWithName:(id)a3 maxStringLength:(int64_t)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(NPSOSLogStateProvider *)self init];
  if (v10)
  {
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.nanoprefsyncd.dump", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    if (a4 >= 1)
    {
      int64_t v13 = 0;
      uint64_t v14 = 0;
      do
      {
        v15 = +[NSString stringWithFormat:@"%@.%ld", v8, v14];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1000257DC;
        v19[3] = &unk_10003D4D8;
        v16 = v10;
        v20 = v16;
        id v21 = v15;
        id v22 = v9;
        uint64_t v23 = v14;
        id v17 = v15;
        [(NPSOSLogStateProvider *)v16 registerOSLogStateHandlerName:v17 block:v19];

        ++v14;
        v13 += 15872;
      }
      while (v13 < a4);
    }
  }

  return v10;
}

- (void)registerOSLogStateHandlerName:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v7;
  id v6 = v8;
  os_state_add_handler();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastDumpString, 0);
}

@end