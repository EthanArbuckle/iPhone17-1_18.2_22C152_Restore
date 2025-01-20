@interface EPResource
- (BOOL)invalidated;
- (EPResource)initWithResourceManager:(id)a3 andOwnerDelegate:(id)a4;
- (EPResourceManagerProtocol)resourceManager;
- (EPResourceOwnerDelegate)ownerDelegate;
- (NSError)error;
- (unint64_t)availability;
- (void)dealloc;
- (void)invalidate;
- (void)setAvailability:(unint64_t)a3 withError:(id)a4;
- (void)setOwnerDelegate:(id)a3;
@end

@implementation EPResource

- (EPResource)initWithResourceManager:(id)a3 andOwnerDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)EPResource;
  v9 = [(EPResource *)&v17 init];
  if (v9)
  {
    v10 = sub_1000A3C58();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      v12 = sub_1000A3C58();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        id v15 = [v7 referenceCounter];
        *(_DWORD *)buf = 138412802;
        v19 = v14;
        __int16 v20 = 2048;
        v21 = v9;
        __int16 v22 = 2048;
        id v23 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "init %@[%p] manager refcount = %ld", buf, 0x20u);
      }
    }
    objc_storeStrong((id *)&v9->_resourceManager, a3);
    objc_storeWeak((id *)&v9->_ownerDelegate, v8);
  }

  return v9;
}

- (void)dealloc
{
  if (!self->_invalidated) {
    [(EPResourceManagerProtocol *)self->_resourceManager removeResource:self async:1];
  }
  v3.receiver = self;
  v3.super_class = (Class)EPResource;
  [(EPResource *)&v3 dealloc];
}

- (void)setAvailability:(unint64_t)a3 withError:(id)a4
{
  id v7 = (NSError *)a4;
  if (self->_availability != a3
    || (error = self->_error, error != v7) && ([(NSError *)error isEqual:v7] & 1) == 0)
  {
    self->_availability = a3;
    objc_storeStrong((id *)&self->_error, a4);
    v9 = [(EPResourceManagerProtocol *)self->_resourceManager queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C9C7C;
    block[3] = &unk_1001655F8;
    block[4] = self;
    dispatch_async(v9, block);
  }
}

- (unint64_t)availability
{
  return self->_availability;
}

- (NSError)error
{
  return self->_error;
}

- (void)invalidate
{
  self->_invalidated = 1;
  objc_super v3 = sub_1000A3C58();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = sub_1000A3C58();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v8 = 138412546;
      v9 = v7;
      __int16 v10 = 2048;
      BOOL v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "invalidated %@[%p]", (uint8_t *)&v8, 0x16u);
    }
  }
  [(EPResourceManagerProtocol *)self->_resourceManager removeResource:self async:0];
}

- (EPResourceOwnerDelegate)ownerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ownerDelegate);

  return (EPResourceOwnerDelegate *)WeakRetained;
}

- (void)setOwnerDelegate:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (EPResourceManagerProtocol)resourceManager
{
  return self->_resourceManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_destroyWeak((id *)&self->_ownerDelegate);

  objc_storeStrong((id *)&self->_error, 0);
}

@end