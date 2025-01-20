@interface EPPairer
- (BOOL)isClassicDevice;
- (EPDevice)device;
- (EPPairer)initWithDevice:(id)a3 withDelegate:(id)a4 pairerList:(id)a5;
- (EPPairerDelegate)delegate;
- (EPPairerList)pairerList;
- (id)initBase;
- (id)pairer:(id)a3 newEndpointWithDelegate:(id)a4;
- (int64_t)btPairingRetryCount;
- (void)dealloc;
- (void)invalidateWithError:(id)a3;
- (void)pairer:(id)a3 completedWithError:(id)a4;
- (void)pairer:(id)a3 requestWithType:(int64_t)a4 passkey:(id)a5;
- (void)pairerDidBeginToPair:(id)a3;
- (void)reset;
- (void)respondWithType:(int64_t)a3 accept:(BOOL)a4 data:(id)a5;
- (void)setBtPairingRetryCount:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setPairerList:(id)a3;
- (void)update;
@end

@implementation EPPairer

- (id)initBase
{
  v9.receiver = self;
  v9.super_class = (Class)EPPairer;
  v2 = [(EPPairer *)&v9 init];
  if (v2)
  {
    v3 = sub_1000A3C58();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      v5 = sub_1000A3C58();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = (objc_class *)objc_opt_class();
        v7 = NSStringFromClass(v6);
        *(_DWORD *)buf = 138412546;
        v11 = v7;
        __int16 v12 = 2048;
        v13 = v2;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "init %@[%p]", buf, 0x16u);
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_1000A3C58();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = sub_1000A3C58();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      __int16 v11 = 2048;
      __int16 v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dealloc %@[%p]", buf, 0x16u);
    }
  }
  [(EPPairerList *)self->_pairerList removePairer:self];
  v8.receiver = self;
  v8.super_class = (Class)EPPairer;
  [(EPPairer *)&v8 dealloc];
}

- (EPPairer)initWithDevice:(id)a3 withDelegate:(id)a4 pairerList:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = [(EPPairer *)self initBase];
  v13 = (EPPairer *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 6, a3);
    objc_storeStrong((id *)&v13->_delegate, a4);
    objc_storeStrong((id *)&v13->_pairerList, a5);
    v14 = +[EPFactory sharedFactory];
    v15 = [v14 agentManager];
    v16 = (EPPairingAgent *)[v15 newAgentWithDelegate:v13 fromCentral:objc_msgSend(v9, "isPeripheral")];
    agent = v13->_agent;
    v13->_agent = v16;

    if ([v9 isPeripheral] & 1) == 0 && (objc_opt_respondsToSelector())
    {
      v18 = +[EPFactory queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005E160;
      block[3] = &unk_1001655F8;
      v21 = v13;
      dispatch_async(v18, block);
    }
  }

  return v13;
}

- (BOOL)isClassicDevice
{
  v3 = [(EPDevice *)self->_device info];
  if ([v3 hasClassicDevice]) {
    BOOL v4 = self->_type == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)respondWithType:(int64_t)a3 accept:(BOOL)a4 data:(id)a5
{
  objc_super v8 = (NSDictionary *)a5;
  id v9 = sub_1000A3BC0();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = sub_1000A3BC0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ExtensiblePair EPPairer respondWithType:accept:data: called", v13, 2u);
    }
  }
  self->_shouldRespond = 1;
  self->_type = a3;
  self->_accept = a4;
  data = self->_data;
  self->_data = v8;

  [(EPPairer *)self update];
}

- (void)update
{
  if (self->_shouldRespond)
  {
    if ([(EPPairer *)self isClassicDevice])
    {
      self->_shouldRespond = 0;
      v3 = +[EPFactory queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10005E590;
      block[3] = &unk_1001655F8;
      void block[4] = self;
      dispatch_async(v3, block);
LABEL_4:

      return;
    }
    if ((id)[(EPResource *)self->_agent availability] == (id)1)
    {
      id v20 = [(EPDevice *)self->_device pairingConnector];
      if ([v20 availability] == (id)1)
      {
        BOOL v4 = [(EPDevice *)self->_device pipe];
        if ([v4 availability] == (id)1)
        {
          unint64_t v5 = [(EPDevice *)self->_device pairingPhase];

          if (v5 == 3)
          {
            self->_shouldRespond = 0;
            v6 = sub_1000A3BC0();
            BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

            if (v7)
            {
              objc_super v8 = sub_1000A3BC0();
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                id v9 = [(EPDevice *)self->_device info];
                BOOL v10 = [v9 peer];
                id v11 = [v10 identifier];
                __int16 v12 = [v11 UUIDString];
                uint64_t v13 = +[EPDevice stringFromCBPairingType:self->_type];
                v14 = (void *)v13;
                CFStringRef v15 = @"YES";
                BOOL v16 = !self->_accept;
                data = self->_data;
                *(_DWORD *)buf = 138413058;
                if (v16) {
                  CFStringRef v15 = @"NO";
                }
                v23 = v12;
                __int16 v24 = 2112;
                uint64_t v25 = v13;
                __int16 v26 = 2112;
                CFStringRef v27 = v15;
                __int16 v28 = 2112;
                v29 = data;
                _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Calling CoreBluetooth CBPairingAgent respondToPairingRequest:%@ type:%@ accept:%@ data:%@", buf, 0x2Au);
              }
            }
            v3 = [(EPPairingAgent *)self->_agent agent];
            v18 = [(EPDevice *)self->_device info];
            v19 = [v18 peer];
            [v3 respondToPairingRequest:v19 type:self->_type accept:self->_accept data:self->_data];

            goto LABEL_4;
          }
          return;
        }
      }
    }
  }
}

- (void)reset
{
  self->_shouldRespond = 0;
}

- (void)invalidateWithError:(id)a3
{
  id v4 = a3;
  unint64_t v5 = sub_1000A3BC0();
  v6 = v5;
  if (v4)
  {
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v7)
    {
      objc_super v8 = sub_1000A3BC0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000F9468((uint64_t)v4, v8);
      }
LABEL_8:
    }
  }
  else
  {
    BOOL v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      objc_super v8 = sub_1000A3BC0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ExtensiblePair EPPairer invalidateWithError: called with no error", v10, 2u);
      }
      goto LABEL_8;
    }
  }
  [(EPDevice *)self->_device cancelPairingWithError:v4];
}

- (id)pairer:(id)a3 newEndpointWithDelegate:(id)a4
{
  id v5 = a4;
  v6 = sub_1000A3BC0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    objc_super v8 = sub_1000A3BC0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v9 = (objc_class *)objc_opt_class();
      BOOL v10 = NSStringFromClass(v9);
      delegate = self->_delegate;
      int v14 = 138412802;
      CFStringRef v15 = self;
      __int16 v16 = 2112;
      v17 = v10;
      __int16 v18 = 2048;
      v19 = delegate;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Calling pairer:newEndpointWithDelegate: with pairer %@ on %@[%p]", (uint8_t *)&v14, 0x20u);
    }
  }
  __int16 v12 = [(EPPairerDelegate *)self->_delegate pairer:self newEndpointWithDelegate:v5];

  return v12;
}

- (void)pairer:(id)a3 completedWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = sub_1000A3BC0();
  BOOL v9 = v8;
  if (v7)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      id v11 = sub_1000A3BC0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1000F94E0((uint64_t)self, (uint64_t)v7, v11);
      }
LABEL_8:
    }
  }
  else
  {
    BOOL v12 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      id v11 = sub_1000A3BC0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = (objc_class *)objc_opt_class();
        int v14 = NSStringFromClass(v13);
        delegate = self->_delegate;
        int v17 = 138412802;
        __int16 v18 = self;
        __int16 v19 = 2112;
        id v20 = v14;
        __int16 v21 = 2048;
        v22 = delegate;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling pairer:completedWithError: with pairer %@ on %@[%p] with no error", (uint8_t *)&v17, 0x20u);
      }
      goto LABEL_8;
    }
  }
  [(EPPairerDelegate *)self->_delegate pairer:self completedWithError:v7];
  __int16 v16 = self->_delegate;
  self->_delegate = 0;
}

- (void)pairer:(id)a3 requestWithType:(int64_t)a4 passkey:(id)a5
{
  id v7 = a5;
  objc_super v8 = sub_1000A3BC0();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = sub_1000A3BC0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (objc_class *)objc_opt_class();
      BOOL v12 = NSStringFromClass(v11);
      delegate = self->_delegate;
      int v14 = +[EPDevice stringFromCBPairingType:a4];
      int v15 = 138413314;
      __int16 v16 = self;
      __int16 v17 = 2112;
      __int16 v18 = v12;
      __int16 v19 = 2048;
      id v20 = delegate;
      __int16 v21 = 2112;
      v22 = v14;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling pairer:requestWithType: with pairer %@ on %@[%p] with type %@ passkey %@", (uint8_t *)&v15, 0x34u);
    }
  }
  [(EPPairerDelegate *)self->_delegate pairer:self requestWithType:a4 passkey:v7];
}

- (void)pairerDidBeginToPair:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    id v4 = sub_1000A3BC0();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      id v6 = sub_1000A3BC0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = (objc_class *)objc_opt_class();
        objc_super v8 = NSStringFromClass(v7);
        delegate = self->_delegate;
        int v10 = 138412802;
        id v11 = self;
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        __int16 v14 = 2048;
        int v15 = delegate;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calling pairerDidBeginToPair: with pairer %@ on %@[%p]", (uint8_t *)&v10, 0x20u);
      }
    }
    [(EPPairerDelegate *)self->_delegate pairerDidBeginToPair:self];
  }
}

- (EPDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (int64_t)btPairingRetryCount
{
  return self->_btPairingRetryCount;
}

- (void)setBtPairingRetryCount:(int64_t)a3
{
  self->_btPairingRetryCount = a3;
}

- (EPPairerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (EPPairerList)pairerList
{
  return self->_pairerList;
}

- (void)setPairerList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairerList, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_agent, 0);
}

@end