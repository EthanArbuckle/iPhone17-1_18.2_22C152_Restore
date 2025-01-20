@interface NROSLogStateProvider
- (NROSLogStateProvider)initWithName:(id)a3 maxStringLength:(int64_t)a4 block:(id)a5;
- (void)registerOSLogStateHandlerName:(id)a3 block:(id)a4;
@end

@implementation NROSLogStateProvider

- (NROSLogStateProvider)initWithName:(id)a3 maxStringLength:(int64_t)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(NROSLogStateProvider *)self init];
  if (v10)
  {
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.nanoregistryd.statedump", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    v10->_cachedStateDumpHistoryIndex = 0;
    if (a4 >= 1)
    {
      int64_t v13 = 0;
      uint64_t v14 = 0;
      do
      {
        v15 = +[NSString stringWithFormat:@"%@.%ld", v8, v14];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100060674;
        v17[3] = &unk_100167B48;
        id v19 = v9;
        v18 = v10;
        uint64_t v20 = v14;
        [(NROSLogStateProvider *)v18 registerOSLogStateHandlerName:v15 block:v17];

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

  objc_storeStrong((id *)&self->_cachedStateDumpString, 0);
}

@end