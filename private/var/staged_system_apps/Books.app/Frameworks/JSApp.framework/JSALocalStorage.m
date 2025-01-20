@interface JSALocalStorage
+ (id)sharedInstance;
- (JSALocalStorage)init;
- (NSMutableDictionary)values;
- (NSUserDefaults)scriptingUserDefaults;
- (id)getItem:(id)a3;
- (unint64_t)length;
- (void)clear;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeItem:(id)a3;
- (void)setItem:(id)a3 value:(id)a4;
- (void)setScriptingUserDefaults:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation JSALocalStorage

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E7B4;
  block[3] = &unk_B2510;
  block[4] = a1;
  if (qword_CE310 != -1) {
    dispatch_once(&qword_CE310, block);
  }
  v2 = (void *)qword_CE318;

  return v2;
}

- (JSALocalStorage)init
{
  v17.receiver = self;
  v17.super_class = (Class)JSALocalStorage;
  v2 = [(JSALocalStorage *)&v17 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)NSUserDefaults);
    v4 = +[BUAppGroup books];
    v5 = [v4 containerURL];
    v6 = (NSUserDefaults *)[v3 _initWithSuiteName:@"com.apple.iBooks.JSALocalStorage" container:v5];
    scriptingUserDefaults = v2->_scriptingUserDefaults;
    v2->_scriptingUserDefaults = v6;

    if (v2->_scriptingUserDefaults)
    {
      sub_E984((uint64_t)v2);
    }
    else
    {
      v8 = JSALog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        sub_84AD8(v8);
      }
    }
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    values = v2->_values;
    v2->_values = v9;

    objc_opt_class();
    v11 = [(NSUserDefaults *)v2->_scriptingUserDefaults objectForKey:@"ScriptingLocalStorage"];
    uint64_t v12 = BUDynamicCast();
    v13 = (void *)v12;
    v14 = &__NSDictionary0__struct;
    if (v12) {
      v14 = (void *)v12;
    }
    id v15 = v14;

    sub_EB18((uint64_t)v2, v15);
    [(NSUserDefaults *)v2->_scriptingUserDefaults addObserver:v2 forKeyPath:@"ScriptingLocalStorage" options:1 context:off_CB9F0];
  }
  return v2;
}

- (void)dealloc
{
  [(NSUserDefaults *)self->_scriptingUserDefaults removeObserver:self forKeyPath:@"ScriptingLocalStorage" context:off_CB9F0];
  v3.receiver = self;
  v3.super_class = (Class)JSALocalStorage;
  [(JSALocalStorage *)&v3 dealloc];
}

- (unint64_t)length
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v4 = [(NSMutableDictionary *)self->_values count];
  os_unfair_lock_unlock(p_accessLock);
  return (unint64_t)v4;
}

- (id)getItem:(id)a3
{
  if (a3)
  {
    p_accessLock = &self->_accessLock;
    id v5 = a3;
    os_unfair_lock_lock(p_accessLock);
    v6 = [(NSMutableDictionary *)self->_values objectForKeyedSubscript:v5];

    os_unfair_lock_unlock(p_accessLock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setItem:(id)a3 value:(id)a4
{
  if (a3 && a4)
  {
    p_accessLock = &self->_accessLock;
    id v7 = a4;
    id v8 = a3;
    os_unfair_lock_lock(p_accessLock);
    [(NSMutableDictionary *)self->_values setObject:v7 forKeyedSubscript:v8];

    os_unfair_lock_unlock(p_accessLock);
    sub_ED44((uint64_t)self);
  }
}

- (void)removeItem:(id)a3
{
  if (a3)
  {
    p_accessLock = &self->_accessLock;
    id v5 = a3;
    os_unfair_lock_lock(p_accessLock);
    [(NSMutableDictionary *)self->_values removeObjectForKey:v5];

    os_unfair_lock_unlock(p_accessLock);
    sub_ED44((uint64_t)self);
  }
}

- (void)clear
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  [(NSMutableDictionary *)self->_values removeAllObjects];
  os_unfair_lock_unlock(p_accessLock);

  sub_ED44((uint64_t)self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_CB9F0 == a6)
  {
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_F070;
    v18[3] = &unk_B26A8;
    id v19 = v12;
    objc_copyWeak(&v20, &location);
    v13 = objc_retainBlock(v18);
    v14 = objc_retainBlock(v13);
    if (v14)
    {
      if (+[NSThread isMainThread])
      {
        v14[2](v14);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_F12C;
        block[3] = &unk_B2028;
        objc_super v17 = v14;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)JSALocalStorage;
    [(JSALocalStorage *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (NSUserDefaults)scriptingUserDefaults
{
  return self->_scriptingUserDefaults;
}

- (void)setScriptingUserDefaults:(id)a3
{
}

- (NSMutableDictionary)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);

  objc_storeStrong((id *)&self->_scriptingUserDefaults, 0);
}

@end