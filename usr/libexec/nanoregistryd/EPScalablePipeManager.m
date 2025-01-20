@interface EPScalablePipeManager
- (BOOL)isConnected;
- (CBScalablePipeManager)manager;
- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5;
- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4;
- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5;
- (void)scalablePipeManagerDidUpdateState:(id)a3;
- (void)setIsConnected:(BOOL)a3;
@end

@implementation EPScalablePipeManager

- (CBScalablePipeManager)manager
{
  v2 = [(EPScalablePipeManager *)self managerManager];
  v3 = [v2 manager];

  return (CBScalablePipeManager *)v3;
}

- (void)scalablePipeManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = sub_1000A3BC0();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      v8 = sub_1000A3BC0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        v11 = +[EPPairingAgentManager stringFromCBManagerState:](EPPairingAgentManager, "stringFromCBManagerState:", [v4 state]);
        int v12 = 138412802;
        v13 = v10;
        __int16 v14 = 2048;
        v15 = v5;
        __int16 v16 = 2112;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Calling scalablePipeManagerDidUpdateState: on %@[%p] state %@", (uint8_t *)&v12, 0x20u);
      }
    }
    [v5 scalablePipeManagerDidUpdateState:v4];
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidConnect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v9 = sub_1000A3BC0();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = sub_1000A3BC0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        int v14 = 138412546;
        v15 = v13;
        __int16 v16 = 2048;
        v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling scalablePipeManager:pipeDidConnect: on %@[%p]", (uint8_t *)&v14, 0x16u);
      }
    }
    [v8 scalablePipeManager:v6 pipeDidConnect:v7];
  }
}

- (void)scalablePipeManager:(id)a3 didUnregisterEndpoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v9 = sub_1000A3BC0();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      v11 = sub_1000A3BC0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        int v14 = 138412802;
        v15 = v13;
        __int16 v16 = 2048;
        v17 = v8;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling scalablePipeManager:didUnregisterEndpoint: on %@[%p] endpoint %@", (uint8_t *)&v14, 0x20u);
      }
    }
    [v8 scalablePipeManager:v6 didUnregisterEndpoint:v7];
  }
}

- (void)scalablePipeManager:(id)a3 pipeDidDisconnect:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    int v12 = sub_1000A3BC0();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      int v14 = sub_1000A3BC0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        __int16 v16 = NSStringFromClass(v15);
        int v17 = 138412546;
        __int16 v18 = v16;
        __int16 v19 = 2048;
        v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling scalablePipeManager:pipeDidDisconnect: on %@[%p]", (uint8_t *)&v17, 0x16u);
      }
    }
    [v11 scalablePipeManager:v8 pipeDidDisconnect:v9 error:v10];
  }
}

- (void)scalablePipeManager:(id)a3 didRegisterEndpoint:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(EPResource *)self ownerDelegate];
  if (objc_opt_respondsToSelector())
  {
    int v12 = sub_1000A3BC0();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      int v14 = sub_1000A3BC0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        __int16 v16 = NSStringFromClass(v15);
        int v17 = 138412802;
        __int16 v18 = v16;
        __int16 v19 = 2048;
        v20 = v11;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Calling scalablePipeManager:didRegisterEndpoint: on %@[%p] endpoint %@", (uint8_t *)&v17, 0x20u);
      }
    }
    [v11 scalablePipeManager:v8 didRegisterEndpoint:v9 error:v10];
  }
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

@end