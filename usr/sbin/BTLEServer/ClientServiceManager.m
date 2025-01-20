@interface ClientServiceManager
+ (void)initialize;
- (CBPeripheral)peripheral;
- (ClientServiceManager)initWithPeripheral:(id)a3;
- (NSMapTable)clientServiceMap;
- (NSMutableSet)startingClientServices;
- (id)clientServiceForUUID:(id)a3;
- (unint64_t)startPriority;
- (void)analyzeError:(id)a3;
- (void)clientService:(id)a3 desiresConnectionParameters:(id)a4;
- (void)clientServiceDidStart:(id)a3;
- (void)dealloc;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setClientServiceMap:(id)a3;
- (void)setPeripheral:(id)a3;
- (void)setStartPriority:(unint64_t)a3;
- (void)setStartingClientServices:(id)a3;
- (void)startClientServices;
@end

@implementation ClientServiceManager

- (ClientServiceManager)initWithPeripheral:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ClientServiceManager;
  v6 = [(ClientServiceManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_peripheral, a3);
    uint64_t v8 = +[NSMapTable strongToStrongObjectsMapTable];
    clientServiceMap = v7->_clientServiceMap;
    v7->_clientServiceMap = (NSMapTable *)v8;

    v7->_startPriority = 0;
    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    startingClientServices = v7->_startingClientServices;
    v7->_startingClientServices = v10;

    [(CBPeripheral *)v7->_peripheral discoverServices:0];
  }

  return v7;
}

- (id)clientServiceForUUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10003A49C;
  v16 = sub_10003A4AC;
  id v17 = 0;
  id v5 = [(ClientServiceManager *)self clientServiceMap];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003A4B4;
  v9[3] = &unk_1000B1D28;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)clientServiceDidStart:(id)a3
{
  id v4 = a3;
  id v5 = [(ClientServiceManager *)self startingClientServices];
  [v5 removeObject:v4];

  [(ClientServiceManager *)self startClientServices];
}

- (void)clientService:(id)a3 desiresConnectionParameters:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v7 = +[BTLEXpcServer instance];
    id v6 = [(ClientServiceManager *)self peripheral];
    [v7 sendSetConnectionParametersMsg:v5 forPeer:v6];
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)qword_1000CD0A8;
    qword_1000CD0A8 = (uint64_t)&off_1000B7BC8;
  }
}

- (void)dealloc
{
  v3 = [(ClientServiceManager *)self clientServiceMap];
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_1000B1D68];

  v4.receiver = self;
  v4.super_class = (Class)ClientServiceManager;
  [(ClientServiceManager *)&v4 dealloc];
}

- (void)startClientServices
{
  v3 = [(ClientServiceManager *)self startingClientServices];
  id v4 = [v3 count];

  if (!v4)
  {
    while (1)
    {
      uint64_t v9 = 0;
      id v10 = &v9;
      uint64_t v11 = 0x2020000000;
      char v12 = 0;
      id v5 = [(ClientServiceManager *)self clientServiceMap];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10003A86C;
      v8[3] = &unk_1000B1D28;
      v8[4] = self;
      v8[5] = &v9;
      [v5 enumerateKeysAndObjectsUsingBlock:v8];

      if (!*((unsigned char *)v10 + 24)) {
        break;
      }
      [(ClientServiceManager *)self setStartPriority:(char *)[(ClientServiceManager *)self startPriority] + 1];
      _Block_object_dispose(&v9, 8);
      id v6 = [(ClientServiceManager *)self startingClientServices];
      id v7 = [v6 count];

      if (v7) {
        return;
      }
    }
    _Block_object_dispose(&v9, 8);
  }
}

- (void)analyzeError:(id)a3
{
  id v8 = a3;
  id v4 = [v8 domain];
  unsigned int v5 = [v4 isEqualToString:CBATTErrorDomain];

  if (v5 && [v8 code] == (id)15)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    id v7 = [(ClientServiceManager *)self peripheral];
    [v6 postNotificationName:@"PeripheralPairingDidFailNotification" object:v7];
  }
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  id v27 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = a4;
  id v6 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v30;
    *(void *)&long long v7 = 138412546;
    long long v26 = v7;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v10);
        char v12 = [(ClientServiceManager *)self clientServiceMap];
        objc_super v13 = [v12 objectForKey:v11];

        if (v13)
        {
          uint64_t v14 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
          {
            v15 = v14;
            v16 = [v27 name];
            id v17 = [v11 UUID];
            *(_DWORD *)buf = v26;
            v34 = v16;
            __int16 v35 = 2112;
            v36 = v17;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" invalidated service \"%@\"", buf, 0x16u);
          }
          v18 = [v11 UUID];
          v19 = +[CBUUID UUIDWithString:@"8341F2B4-C013-4F04-8197-C4CDB42E26DC"];
          unsigned int v20 = [v18 isEqual:v19];

          if (v20)
          {
            v21 = [(ClientServiceManager *)self clientServiceMap];
            [v21 enumerateKeysAndObjectsUsingBlock:&stru_1000B1D88];

            v22 = [(ClientServiceManager *)self startingClientServices];
            [v22 removeAllObjects];

            v23 = [(ClientServiceManager *)self clientServiceMap];
            [v23 removeAllObjects];
          }
          else
          {
            [v13 stop];
            v24 = [(ClientServiceManager *)self startingClientServices];
            [v24 removeObject:v13];

            v23 = [(ClientServiceManager *)self clientServiceMap];
            [v23 removeObjectForKey:v11];
          }
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v8);
  }
  v25 = [(ClientServiceManager *)self peripheral];
  [v25 discoverServices:0];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v39 = a3;
  id v34 = a4;
  id v6 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    long long v7 = v6;
    id v8 = [v39 name];
    uint64_t v9 = [v39 services];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "didDiscoverServices for \"%@\", %@...", buf, 0x16u);
  }
  if (v34)
  {
    id v10 = (void *)qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100070FC0(v10, v39, (uint64_t)v34);
    }
    [(ClientServiceManager *)self analyzeError:v34];
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = [v39 services];
    id v37 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v37)
    {
      uint64_t v36 = *(void *)v46;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v46 != v36)
          {
            uint64_t v12 = v11;
            objc_enumerationMutation(obj);
            uint64_t v11 = v12;
          }
          uint64_t v38 = v11;
          objc_super v13 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
          uint64_t v14 = [(ClientServiceManager *)self clientServiceMap];
          v15 = [v14 objectForKey:v13];
          BOOL v16 = v15 == 0;

          if (v16)
          {
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            id v17 = (id)qword_1000CD0A8;
            id v18 = [v17 countByEnumeratingWithState:&v41 objects:v53 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v42;
              do
              {
                for (i = 0; i != v18; i = (char *)i + 1)
                {
                  if (*(void *)v42 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  Class v21 = NSClassFromString(*(NSString **)(*((void *)&v41 + 1) + 8 * i));
                  if (v21)
                  {
                    v22 = [v13 UUID];
                    v23 = [(objc_class *)v21 UUID];
                    unsigned int v24 = [v22 isEqual:v23];

                    if (v24)
                    {
                      id v25 = [[v21 alloc] initWithManager:self peripheral:v39 service:v13];
                      long long v26 = (void *)qword_1000CD178;
                      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
                      {
                        id v27 = v26;
                        v28 = [v39 name];
                        long long v29 = [v13 UUID];
                        *(_DWORD *)buf = 138412546;
                        *(void *)&uint8_t buf[4] = v28;
                        *(_WORD *)&buf[12] = 2114;
                        *(void *)&buf[14] = v29;
                        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Peripheral \"%@\" supports service \"%{public}@\"", buf, 0x16u);
                      }
                      long long v30 = [(ClientServiceManager *)self clientServiceMap];
                      [v30 setObject:v25 forKey:v13];
                    }
                  }
                }
                id v18 = [v17 countByEnumeratingWithState:&v41 objects:v53 count:16];
              }
              while (v18);
            }
          }
          uint64_t v11 = v38 + 1;
        }
        while ((id)(v38 + 1) != v37);
        id v37 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v37);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v52 = 0;
    long long v31 = [(ClientServiceManager *)self clientServiceMap];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10003B2EC;
    v40[3] = &unk_1000B1DB0;
    v40[4] = buf;
    [v31 enumerateKeysAndObjectsUsingBlock:v40];

    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      [(ClientServiceManager *)self setStartPriority:0];
      [(ClientServiceManager *)self startClientServices];
    }
    else
    {
      long long v32 = (id)qword_1000CD178;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [v39 name];
        *(_DWORD *)v49 = 138412290;
        v50 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Didn't find any primary service on peripheral \"%@\"", v49, 0xCu);
      }
    }
    _Block_object_dispose(buf, 8);
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ClientServiceManager *)self clientServiceMap];
  uint64_t v12 = [v11 objectForKey:v9];

  if (v12)
  {
    if (v10)
    {
      objc_super v13 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = v13;
        v15 = [v9 UUID];
        BOOL v16 = [v8 name];
        int v17 = 138412802;
        id v18 = v15;
        __int16 v19 = 2112;
        unsigned int v20 = v16;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error discovering characteristics for service \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v17, 0x20u);
      }
      [(ClientServiceManager *)self analyzeError:v10];
    }
    if (objc_opt_respondsToSelector()) {
      [v12 peripheral:v8 didDiscoverCharacteristicsForService:v9 error:v10];
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ClientServiceManager *)self clientServiceMap];
  uint64_t v12 = [v9 service];
  objc_super v13 = [v11 objectForKey:v12];

  if (v13)
  {
    if (v10)
    {
      uint64_t v14 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        BOOL v16 = [v9 UUID];
        int v17 = [v8 name];
        int v18 = 138412802;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        __int16 v21 = v17;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error updating value for characteristic \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v18, 0x20u);
      }
      [(ClientServiceManager *)self analyzeError:v10];
    }
    if (objc_opt_respondsToSelector()) {
      [v13 peripheral:v8 didUpdateValueForCharacteristic:v9 error:v10];
    }
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ClientServiceManager *)self clientServiceMap];
  uint64_t v12 = [v9 service];
  objc_super v13 = [v11 objectForKey:v12];

  if (v13)
  {
    if (v10)
    {
      uint64_t v14 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        BOOL v16 = [v9 UUID];
        int v17 = [v8 name];
        int v18 = 138412802;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        __int16 v21 = v17;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error writing value for characteristic \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v18, 0x20u);
      }
      [(ClientServiceManager *)self analyzeError:v10];
    }
    if (objc_opt_respondsToSelector()) {
      [v13 peripheral:v8 didWriteValueForCharacteristic:v9 error:v10];
    }
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ClientServiceManager *)self clientServiceMap];
  uint64_t v12 = [v9 service];
  objc_super v13 = [v11 objectForKey:v12];

  if (v13)
  {
    if (v10)
    {
      uint64_t v14 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        BOOL v16 = [v9 UUID];
        int v17 = [v8 name];
        int v18 = 138412802;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        __int16 v21 = v17;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error updating notifications for characteristic \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v18, 0x20u);
      }
      [(ClientServiceManager *)self analyzeError:v10];
    }
    if (objc_opt_respondsToSelector()) {
      [v13 peripheral:v8 didUpdateNotificationStateForCharacteristic:v9 error:v10];
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ClientServiceManager *)self clientServiceMap];
  uint64_t v12 = [v9 service];
  objc_super v13 = [v11 objectForKey:v12];

  if (v13)
  {
    if (v10)
    {
      uint64_t v14 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        v15 = v14;
        BOOL v16 = [v9 UUID];
        int v17 = [v8 name];
        int v18 = 138412802;
        __int16 v19 = v16;
        __int16 v20 = 2112;
        __int16 v21 = v17;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error discovering descriptors for characteristic \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v18, 0x20u);
      }
      [(ClientServiceManager *)self analyzeError:v10];
    }
    if (objc_opt_respondsToSelector()) {
      [v13 peripheral:v8 didDiscoverDescriptorsForCharacteristic:v9 error:v10];
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ClientServiceManager *)self clientServiceMap];
  uint64_t v12 = [v9 characteristic];
  objc_super v13 = [v12 service];
  uint64_t v14 = [v11 objectForKey:v13];

  if (v14)
  {
    if (v10)
    {
      v15 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        BOOL v16 = v15;
        int v17 = [v9 UUID];
        int v18 = [v8 name];
        int v19 = 138412802;
        __int16 v20 = v17;
        __int16 v21 = 2112;
        __int16 v22 = v18;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error updating value for descriptor \"%@\" on peripheral \"%@\": %@", (uint8_t *)&v19, 0x20u);
      }
      [(ClientServiceManager *)self analyzeError:v10];
    }
    if (objc_opt_respondsToSelector()) {
      [v14 peripheral:v8 didUpdateValueForDescriptor:v9 error:v10];
    }
  }
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (NSMapTable)clientServiceMap
{
  return self->_clientServiceMap;
}

- (void)setClientServiceMap:(id)a3
{
}

- (unint64_t)startPriority
{
  return self->_startPriority;
}

- (void)setStartPriority:(unint64_t)a3
{
  self->_startPriority = a3;
}

- (NSMutableSet)startingClientServices
{
  return self->_startingClientServices;
}

- (void)setStartingClientServices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingClientServices, 0);
  objc_storeStrong((id *)&self->_clientServiceMap, 0);

  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end