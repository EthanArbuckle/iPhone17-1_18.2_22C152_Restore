@interface EPDiscoverer
- (EPDiscoverer)initWithManager:(id)a3 withDelegate:(id)a4;
- (NSDictionary)devices;
- (NSMutableSet)displayableDevices;
- (NSMutableSet)proximateDevices;
- (id)initBase;
- (void)clear;
- (void)collection:(id)a3 deviceDidAppear:(id)a4;
- (void)collection:(id)a3 deviceDidBecomeDisplayable:(id)a4;
- (void)collection:(id)a3 deviceDidBecomeProximate:(id)a4;
- (void)collection:(id)a3 deviceDidBecomeUndisplayable:(id)a4;
- (void)collection:(id)a3 deviceDidBecomeUnproximate:(id)a4;
- (void)collection:(id)a3 deviceDidDisappear:(id)a4;
- (void)collection:(id)a3 deviceDidUpdate:(id)a4;
- (void)dealloc;
- (void)discovererBluetoothIsWorking:(id)a3;
- (void)discovererBluetoothMayHaveFailed:(id)a3;
@end

@implementation EPDiscoverer

- (id)initBase
{
  v3.receiver = self;
  v3.super_class = (Class)EPDiscoverer;
  return [(EPDiscoverer *)&v3 init];
}

- (void)dealloc
{
  [(EPDiscovererManager *)self->_manager removeDiscoverer:self];
  v3.receiver = self;
  v3.super_class = (Class)EPDiscoverer;
  [(EPDiscoverer *)&v3 dealloc];
}

- (EPDiscoverer)initWithManager:(id)a3 withDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(EPDiscoverer *)self initBase];
  v10 = (EPDiscoverer *)v9;
  if (v9)
  {
    objc_storeWeak(v9 + 2, v8);
    objc_storeStrong((id *)&v10->_manager, a3);
  }

  return v10;
}

- (NSDictionary)devices
{
  v2 = [(EPDiscovererManager *)self->_manager deviceCollection];
  objc_super v3 = [v2 devicesDictionary];
  id v4 = [v3 copy];

  return (NSDictionary *)v4;
}

- (NSMutableSet)displayableDevices
{
  v2 = [(EPDiscovererManager *)self->_manager deviceCollection];
  objc_super v3 = [v2 displayableDevices];
  id v4 = [v3 copy];

  return (NSMutableSet *)v4;
}

- (NSMutableSet)proximateDevices
{
  v2 = [(EPDiscovererManager *)self->_manager deviceCollection];
  objc_super v3 = [v2 proximateDevices];
  id v4 = [v3 copy];

  return (NSMutableSet *)v4;
}

- (void)clear
{
}

- (void)collection:(id)a3 deviceDidAppear:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 discoverer:self deviceDidAppear:v8];
  }
}

- (void)collection:(id)a3 deviceDidBecomeDisplayable:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = sub_1000A3BC0();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = sub_1000A3BC0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_loadWeakRetained((id *)&self->_delegate);
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        id v14 = objc_loadWeakRetained((id *)&self->_delegate);
        int v16 = 138412802;
        id v17 = v5;
        __int16 v18 = 2112;
        v19 = v13;
        __int16 v20 = 2048;
        id v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling discoverer:deviceDidBecomeDisplayable: with device %@ on object %@[%p]", (uint8_t *)&v16, 0x20u);
      }
    }
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 discoverer:self deviceDidBecomeDisplayable:v5];
  }
}

- (void)collection:(id)a3 deviceDidBecomeProximate:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = sub_1000A3BC0();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = sub_1000A3BC0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_loadWeakRetained((id *)&self->_delegate);
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        id v14 = objc_loadWeakRetained((id *)&self->_delegate);
        int v16 = 138412802;
        id v17 = v5;
        __int16 v18 = 2112;
        v19 = v13;
        __int16 v20 = 2048;
        id v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling discoverer:deviceDidBecomeProximate: with device %@ on object %@[%p]", (uint8_t *)&v16, 0x20u);
      }
    }
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 discoverer:self deviceDidBecomeProximate:v5];
  }
}

- (void)collection:(id)a3 deviceDidUpdate:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = sub_1000A3BC0();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = sub_1000A3BC0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_loadWeakRetained((id *)&self->_delegate);
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        id v14 = objc_loadWeakRetained((id *)&self->_delegate);
        int v16 = 138412802;
        id v17 = v5;
        __int16 v18 = 2112;
        v19 = v13;
        __int16 v20 = 2048;
        id v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling discoverer:deviceDidUpdate: with device %@ on object %@[%p]", (uint8_t *)&v16, 0x20u);
      }
    }
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 discoverer:self deviceDidUpdate:v5];
  }
}

- (void)collection:(id)a3 deviceDidDisappear:(id)a4
{
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 discoverer:self deviceDidDisappear:v8];
  }
}

- (void)collection:(id)a3 deviceDidBecomeUndisplayable:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = sub_1000A3BC0();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = sub_1000A3BC0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_loadWeakRetained((id *)&self->_delegate);
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        id v14 = objc_loadWeakRetained((id *)&self->_delegate);
        int v16 = 138412802;
        id v17 = v5;
        __int16 v18 = 2112;
        v19 = v13;
        __int16 v20 = 2048;
        id v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling discoverer:deviceDidBecomeUndisplayable: with device %@ on object %@[%p]", (uint8_t *)&v16, 0x20u);
      }
    }
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 discoverer:self deviceDidBecomeUndisplayable:v5];
  }
}

- (void)collection:(id)a3 deviceDidBecomeUnproximate:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = sub_1000A3BC0();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      v10 = sub_1000A3BC0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = objc_loadWeakRetained((id *)&self->_delegate);
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        id v14 = objc_loadWeakRetained((id *)&self->_delegate);
        int v16 = 138412802;
        id v17 = v5;
        __int16 v18 = 2112;
        v19 = v13;
        __int16 v20 = 2048;
        id v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling discoverer:deviceDidBecomeUnproximate: with device %@ on object %@[%p]", (uint8_t *)&v16, 0x20u);
      }
    }
    id v15 = objc_loadWeakRetained((id *)&self->_delegate);
    [v15 discoverer:self deviceDidBecomeUnproximate:v5];
  }
}

- (void)discovererBluetoothMayHaveFailed:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = sub_1000A3BC0();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      BOOL v9 = sub_1000A3BC0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = objc_loadWeakRetained((id *)p_delegate);
        id v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        id v13 = objc_loadWeakRetained((id *)p_delegate);
        int v15 = 138412546;
        int v16 = v12;
        __int16 v17 = 2048;
        id v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling discovererBluetoothMayHaveFailed: on object %@[%p]", (uint8_t *)&v15, 0x16u);
      }
    }
    id v14 = objc_loadWeakRetained((id *)p_delegate);
    [v14 discovererBluetoothMayHaveFailed:self];
  }
}

- (void)discovererBluetoothIsWorking:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = sub_1000A3BC0();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      BOOL v9 = sub_1000A3BC0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = objc_loadWeakRetained((id *)p_delegate);
        id v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        id v13 = objc_loadWeakRetained((id *)p_delegate);
        int v15 = 138412546;
        int v16 = v12;
        __int16 v17 = 2048;
        id v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling discovererBluetoothIsWorking: on object %@[%p]", (uint8_t *)&v15, 0x16u);
      }
    }
    id v14 = objc_loadWeakRetained((id *)p_delegate);
    [v14 discovererBluetoothIsWorking:self];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end