@interface BTIdentityDaemon
+ (id)sharedBTIdentityDaemon;
- (BOOL)diagnosticControl:(id)a3 completion:(id)a4;
- (BTIdentityDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (void)_idsDevicesChanged:(id)a3;
- (void)_idsScheduleUpdateIdentities;
- (void)_idsUpdateIdentities;
- (void)activate;
- (void)invalidate;
@end

@implementation BTIdentityDaemon

+ (id)sharedBTIdentityDaemon
{
  if (qword_100263F38 != -1) {
    dispatch_once(&qword_100263F38, &stru_1002359A0);
  }
  v2 = (void *)qword_100263F30;

  return v2;
}

- (BTIdentityDaemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)BTIdentityDaemon;
  v2 = [(BTIdentityDaemon *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("BTIdentityDaemon", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v2->_cbDaemonNotifyToken = -1;
    v6 = v2;
  }

  return v2;
}

- (id)descriptionWithLevel:(int)a3
{
  [(NSArray *)self->_idsDevices count];
  [(NSMutableDictionary *)self->_identityMap count];
  NSAppendPrintF();
  id v4 = 0;

  return v4;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096024;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009642C;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (BOOL)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CFStringGetTypeID();
  objc_super v8 = CFDictionaryGetTypedValue();

  if (!v8
    || [v8 caseInsensitiveCompare:@"idsUp"]
    && [v8 caseInsensitiveCompare:@"idsUpForce"])
  {
    BOOL v9 = 0;
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009664C;
    block[3] = &unk_1002328D8;
    block[4] = v8;
    void block[5] = self;
    id v13 = v6;
    dispatch_async((dispatch_queue_t)dispatchQueue, block);

    BOOL v9 = 1;
  }

  return v9;
}

- (void)_idsDevicesChanged:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000967A0;
  v7[3] = &unk_100232A10;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);
}

- (void)_idsScheduleUpdateIdentities
{
  p_idsDeviceCoalescer = &self->_idsDeviceCoalescer;
  id v4 = self->_idsDeviceCoalescer;
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)CUCoalescer);
    objc_storeStrong((id *)p_idsDeviceCoalescer, v5);
    [v5 setDispatchQueue:self->_dispatchQueue];
    [v5 setMinDelay:2.0];
    [v5 setMaxDelay:5.0];
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    id v8 = sub_100096988;
    BOOL v9 = &unk_100232A10;
    id v4 = (CUCoalescer *)v5;
    v10 = v4;
    v11 = self;
    [(CUCoalescer *)v4 setActionHandler:&v6];
  }
  [(CUCoalescer *)v4 trigger];
}

- (void)_idsUpdateIdentities
{
  v2 = self;
  [(NSMutableDictionary *)self->_identityMap enumerateKeysAndObjectsUsingBlock:&stru_1002359E0];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obj = v2->_idsDevices;
  v56 = v2;
  id v54 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (!v54)
  {
    unint64_t v50 = 0;
    uint64_t v51 = 0;
    goto LABEL_61;
  }
  unint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v53 = *(void *)v63;
  do
  {
    v3 = 0;
    do
    {
      if (*(void *)v63 != v53) {
        objc_enumerationMutation(obj);
      }
      id v4 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v3);
      id v5 = [v4 uniqueIDOverride:v46];
      if (v5)
      {
        uint64_t v6 = [(NSMutableDictionary *)v2->_identityMap objectForKeyedSubscript:v5];
        id v7 = (id)v6;
        if (!v6)
        {
          id v7 = objc_alloc_init((Class)CBDeviceIdentity);
          [v7 setIdentifier:v5];
          [v7 setIdsDeviceID:v5];
          identityMap = v2->_identityMap;
          if (!identityMap)
          {
            BOOL v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            v10 = v2->_identityMap;
            v2->_identityMap = v9;

            identityMap = v2->_identityMap;
          }
          [(NSMutableDictionary *)identityMap setObject:v7 forKeyedSubscript:v5];
        }
        [v7 setType:2];
        uint64_t v11 = [v4 nsuuid];
        v55 = (void *)v11;
        if (v11)
        {
          v12 = (void *)v11;
          id v13 = [v7 bluetoothIdentifier];
          id v14 = v12;
          id v15 = v13;
          if (v14 == v15)
          {
          }
          else
          {
            v16 = v15;
            if (!v15)
            {

              goto LABEL_19;
            }
            unsigned __int8 v17 = [v14 isEqual:v15];

            if ((v17 & 1) == 0)
            {
LABEL_19:
              [v7 setBluetoothIdentifier:v14];
              int v18 = 1;
LABEL_20:
              v19 = [v4 modelIdentifier];
              if (v19)
              {
                v20 = [v7 model];
                id v21 = v19;
                id v22 = v20;
                if (v21 == v22)
                {

                  goto LABEL_28;
                }
                v23 = v22;
                if (v22)
                {
                  unsigned __int8 v24 = [v21 isEqual:v22];

                  if (v24) {
                    goto LABEL_28;
                  }
                }
                else
                {
                }
                [v7 setModel:v21];
                int v18 = 1;
              }
LABEL_28:
              v25 = [v4 name];
              if (v25)
              {
                v26 = [v7 name];
                id v27 = v25;
                id v28 = v26;
                if (v27 != v28)
                {
                  v29 = v28;
                  if (v28)
                  {
                    unsigned __int8 v30 = [v27 isEqual:v28];

                    if (v30) {
                      goto LABEL_32;
                    }
                  }
                  else
                  {
                  }
                  [v7 setName:v27];
                  if (v6)
                  {
LABEL_41:
                    uint64_t v51 = (v51 + 1);
                    if (dword_1002614F8 <= 20)
                    {
                      v31 = v55;
                      v2 = v56;
                      if (dword_1002614F8 != -1 || _LogCategory_Initialize())
                      {
                        id v46 = v7;
                        goto LABEL_47;
                      }
                      goto LABEL_49;
                    }
                    goto LABEL_48;
                  }
LABEL_44:
                  unint64_t v50 = (v50 + 1);
                  if (dword_1002614F8 <= 20)
                  {
                    v31 = v55;
                    v2 = v56;
                    if (dword_1002614F8 != -1 || _LogCategory_Initialize())
                    {
                      id v46 = v7;
LABEL_47:
                      LogPrintF();
                    }
LABEL_49:

                    goto LABEL_50;
                  }
LABEL_48:
                  v31 = v55;
                  v2 = v56;
                  goto LABEL_49;
                }

                if (!v6) {
                  goto LABEL_44;
                }
              }
              else
              {
LABEL_32:
                if (!v6) {
                  goto LABEL_44;
                }
              }
              if (v18) {
                goto LABEL_41;
              }
              if (dword_1002614F8 <= 10)
              {
                v31 = v55;
                v2 = v56;
                if (dword_1002614F8 != -1 || _LogCategory_Initialize())
                {
                  id v46 = v7;
                  goto LABEL_47;
                }
                goto LABEL_49;
              }
              goto LABEL_48;
            }
          }
        }
        int v18 = 0;
        goto LABEL_20;
      }
LABEL_50:

      v3 = (char *)v3 + 1;
    }
    while (v54 != v3);
    id v32 = [(NSArray *)obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    id v54 = v32;
  }
  while (v32);
LABEL_61:

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v33 = [(NSMutableDictionary *)v2->_identityMap allKeys];
  id v34 = [v33 countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = 0;
    uint64_t v37 = *(void *)v59;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v59 != v37) {
          objc_enumerationMutation(v33);
        }
        uint64_t v39 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        v40 = -[NSMutableDictionary objectForKeyedSubscript:](v56->_identityMap, "objectForKeyedSubscript:", v39, v46);
        if (![v40 type])
        {
          [(NSMutableDictionary *)v56->_identityMap setObject:0 forKeyedSubscript:v39];
          uint64_t v36 = (v36 + 1);
          if (dword_1002614F8 <= 20 && (dword_1002614F8 != -1 || _LogCategory_Initialize()))
          {
            id v46 = v40;
            LogPrintF();
          }
        }
      }
      id v35 = [v33 countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v35);
  }
  else
  {
    uint64_t v36 = 0;
  }

  if (dword_1002614F8 <= 30 && (dword_1002614F8 != -1 || _LogCategory_Initialize()))
  {
    if (v56->_cbDaemonUpdated) {
      v41 = "yes";
    }
    else {
      v41 = "no";
    }
    uint64_t v48 = v51;
    v49 = v41;
    id v46 = (id)v50;
    uint64_t v47 = v36;
    LogPrintF();
  }
  if (v50 || v36 || v51 || !v56->_cbDaemonUpdated)
  {
    id v42 = objc_alloc_init((Class)CBController);
    [v42 setDispatchQueue:v56->_dispatchQueue];
    uint64_t v43 = [(NSMutableDictionary *)v56->_identityMap allValues];
    v44 = (void *)v43;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100097124;
    v57[3] = &unk_100232A38;
    if (v43) {
      v45 = (void *)v43;
    }
    else {
      v45 = &__NSArray0__struct;
    }
    v57[4] = v42;
    v57[5] = v56;
    [v42 updateIdentities:v45 completion:v57];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityMap, 0);
  objc_storeStrong((id *)&self->_idsDevices, 0);
  objc_storeStrong((id *)&self->_idsDeviceCoalescer, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end