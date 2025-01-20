@interface PPKVOObserver
+ (PPKVOObserver)observerWithName:(id)a3 object:(id)a4 key:(id)a5 handler:(id)a6;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation PPKVOObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong(&self->_observee, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_observee == a4)
  {
    if ([a3 isEqualToString:self->_key])
    {
      id handler = self->_handler;
      if (handler)
      {
        v8 = (void (*)(void))*((void *)handler + 2);
        v8();
      }
    }
  }
}

- (void)dealloc
{
  [self->_observee removeObserver:self forKeyPath:self->_key];
  v3.receiver = self;
  v3.super_class = (Class)PPKVOObserver;
  [(PPKVOObserver *)&v3 dealloc];
}

+ (PPKVOObserver)observerWithName:(id)a3 object:(id)a4 key:(id)a5 handler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [PPKVOObserver alloc];
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  id v17 = v9;
  if (v13)
  {
    v31.receiver = v13;
    v31.super_class = (Class)PPKVOObserver;
    v18 = objc_msgSendSuper2(&v31, sel_init);
    v13 = (PPKVOObserver *)v18;
    if (v18)
    {
      objc_storeStrong(v18 + 1, a3);
      objc_storeStrong((id *)&v13->_key, a5);
      objc_storeStrong(&v13->_observee, a4);
      v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UTILITY, 0);

      id v21 = (id) [[NSString alloc] initWithFormat:@"com.apple.proactive.PPKVOObserver.%@", v14];
      dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], v20);
      queue = v13->_queue;
      v13->_queue = (OS_dispatch_queue *)v22;

      id location = 0;
      objc_initWeak(&location, v13);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __51__PPKVOObserver_initWithName_key_observee_handler___block_invoke;
      aBlock[3] = &unk_1E65D76F0;
      objc_copyWeak(&v29, &location);
      id v28 = v17;
      v24 = _Block_copy(aBlock);
      id handler = v13->_handler;
      v13->_id handler = v24;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }

  [v16 addObserver:v13 forKeyPath:v15 options:0 context:0];
  return v13;
}

void __51__PPKVOObserver_initWithName_key_observee_handler___block_invoke(uint64_t a1)
{
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained;
    dispatch_async(WeakRetained[5], *(dispatch_block_t *)(a1 + 32));
    WeakRetained = v3;
  }
}

@end