@interface RDGizmoSyncService
+ (void)initialize;
- (void)dealloc;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
@end

@implementation RDGizmoSyncService

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EBD8 = (uint64_t)os_log_create("com.apple.SensorKit", "RDGizmoSyncService");
  }
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 56);
    objc_setProperty_nonatomic(self, v3, 0, 24);
    objc_setProperty_nonatomic(self, v4, 0, 32);
    objc_setProperty_nonatomic(self, v5, 0, 48);
    objc_setProperty_nonatomic(self, v6, 0, 40);
  }
  dispatch_release((dispatch_object_t)self->_q);
  v7.receiver = self;
  v7.super_class = (Class)RDGizmoSyncService;
  [(RDGizmoSyncService *)&v7 dealloc];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  if (a7 || !a6)
  {
    BOOL v26 = a6;
    if (!self
      || (long long v31 = 0u,
          long long v32 = 0u,
          long long v29 = 0u,
          long long v30 = 0u,
          listeners = self->_listeners,
          (id v20 = [(NSHashTable *)listeners countByEnumeratingWithState:&v29 objects:buf count:16]) == 0))
    {
LABEL_26:
      v25 = qword_10006EBD8;
      if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544387;
        id v34 = a3;
        __int16 v35 = 2113;
        id v36 = a4;
        __int16 v37 = 2114;
        id v38 = a5;
        __int16 v39 = 1026;
        int v40 = v26;
        __int16 v41 = 2114;
        id v42 = a7;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "IDS send failed. service:%{public}@ account:%{private}@ identifier:%{public}@ didSendWithSuccess:%{public}d error:%{public}@", buf, 0x30u);
      }
      return;
    }
    id v21 = v20;
    uint64_t v22 = *(void *)v30;
LABEL_19:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v30 == v22)
      {
        v24 = *(void **)(*((void *)&v29 + 1) + 8 * v23);
        if (objc_opt_respondsToSelector()) {
          goto LABEL_25;
        }
      }
      else
      {
        objc_enumerationMutation(listeners);
        v24 = *(void **)(*((void *)&v29 + 1) + 8 * v23);
        if (objc_opt_respondsToSelector()) {
LABEL_25:
        }
          [v24 service:self didFailMessageWithIDSIdentifier:a5 error:a7];
      }
      if (v21 == (id)++v23)
      {
        id v21 = [(NSHashTable *)listeners countByEnumeratingWithState:&v29 objects:buf count:16];
        if (!v21) {
          goto LABEL_26;
        }
        goto LABEL_19;
      }
    }
  }
  v12 = qword_10006EBD8;
  if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138544387;
    id v34 = a3;
    __int16 v35 = 2113;
    id v36 = a4;
    __int16 v37 = 2114;
    id v38 = a5;
    __int16 v39 = 1026;
    int v40 = 1;
    __int16 v41 = 2114;
    id v42 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "IDS send success. service:%{public}@ account:%{private}@ identifier:%{public}@ didSendWithSuccess:%{public}d error:%{public}@", buf, 0x30u);
    if (!self) {
      return;
    }
  }
  else if (!self)
  {
    return;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v13 = self->_listeners;
  id v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v29 objects:buf count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 == v16)
        {
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
        }
        else
        {
          objc_enumerationMutation(v13);
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
        }
        [v18 service:self didSendMessageWithIDSIdentifier:a5];
      }
      id v15 = [(NSHashTable *)v13 countByEnumeratingWithState:&v29 objects:buf count:16];
    }
    while (v15);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (self->_keyService == a3)
  {
    v19 = qword_10006EBD8;
    if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_INFO))
    {
      id v20 = sub_100024DD4(self, (uint64_t)a6, [(IDSService *)self->_resourceService devices]);
      *(_DWORD *)buf = 138543875;
      id v71 = a6;
      __int16 v72 = 2114;
      id v73 = v20;
      __int16 v74 = 2113;
      id v75 = a5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "IDS message received key service. fromID: %{public}@, pairedID: %{public}@, message: %{private}@", buf, 0x20u);
    }
    id v51 = [a5 objectForKeyedSubscript:@"RDGizmoSyncSensorIdentifierKey"];
    if (v51)
    {
      id v21 = sub_100024DD4(self, (uint64_t)a6, [(IDSService *)self->_resourceService devices]);
      if (v21)
      {
        v52 = self;
        id v50 = v21;
        uint64_t v22 = sub_100039FA8(v51, v21, self->_fileURLs, self->_defaults);
        v45 = sub_100012F98([RDEncryptingDatastore alloc], v22);
        if (![a5 objectForKeyedSubscript:@"RDGizmoSyncKeysKey"])
        {
          CFStringRef v68 = @"RDGizmoSyncKeysKey";
          id v67 = a5;
          v69 = +[NSArray arrayWithObjects:&v67 count:1];
          a5 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
        }
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id obj = [a5 objectForKeyedSubscript:@"RDGizmoSyncKeysKey"];
        id v48 = [obj countByEnumeratingWithState:&v59 objects:buf count:16];
        if (!v48)
        {
LABEL_45:

          return;
        }
        uint64_t v47 = *(void *)v60;
LABEL_23:
        uint64_t v23 = 0;
        while (1)
        {
          if (*(void *)v60 != v47) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v59 + 1) + 8 * v23);
          id v26 = [v25 objectForKeyedSubscript:@"RDGizmoSyncKeyKey"];
          uint64_t v49 = v23;
          if (v26 && (id v27 = v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v28 = (char *)[v25 objectForKeyedSubscript:@"RDGizmoSyncSnapshotKey"];
            if (v28)
            {
              long long v29 = v28;
              long long v30 = sub_1000132D8((NSString *)v45, v28);
              long long v54 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              listeners = v52->_listeners;
              id v32 = [(NSHashTable *)listeners countByEnumeratingWithState:&v54 objects:&v63 count:16];
              if (v32)
              {
                id v33 = v32;
                uint64_t v34 = *(void *)v55;
                while (1)
                {
                  for (i = 0; i != v33; i = (char *)i + 1)
                  {
                    if (*(void *)v55 == v34)
                    {
                      id v36 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                      if ((objc_opt_respondsToSelector() & 1) == 0) {
                        continue;
                      }
                    }
                    else
                    {
                      objc_enumerationMutation(listeners);
                      id v36 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                      if ((objc_opt_respondsToSelector() & 1) == 0) {
                        continue;
                      }
                    }
                    [v36 service:v52 didReceiveKeyServiceMessage:v25 fromID:a6 key:v27 keyName:v30 sensor:v51 archiveURLPath:v29 deviceID:v50];
                  }
                  id v33 = [(NSHashTable *)listeners countByEnumeratingWithState:&v54 objects:&v63 count:16];
                  if (!v33) {
                    goto LABEL_25;
                  }
                }
              }
              goto LABEL_25;
            }
            uint64_t v37 = qword_10006EBD8;
            if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v58 = 0;
              id v38 = v37;
              __int16 v39 = "Message missing snapshot URL. Dropping.";
LABEL_44:
              _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v39, v58, 2u);
            }
          }
          else
          {
            uint64_t v24 = qword_10006EBD8;
            if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v58 = 0;
              id v38 = v24;
              __int16 v39 = "Message missing key. Dropping";
              goto LABEL_44;
            }
          }
LABEL_25:
          uint64_t v23 = v49 + 1;
          if ((id)(v49 + 1) == v48)
          {
            id v48 = [obj countByEnumeratingWithState:&v59 objects:buf count:16];
            if (!v48) {
              goto LABEL_45;
            }
            goto LABEL_23;
          }
        }
      }
      uint64_t v44 = qword_10006EBD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 138543362;
      id v71 = a6;
      __int16 v41 = "Failed to find a device id from IDS id %{public}@";
      id v42 = v44;
      uint32_t v43 = 12;
    }
    else
    {
      uint64_t v40 = qword_10006EBD8;
      if (!os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_WORD *)buf = 0;
      __int16 v41 = "Message missing sensorIdentifier. Dropping.";
      id v42 = v40;
      uint32_t v43 = 2;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, v41, buf, v43);
    return;
  }
  v10 = qword_10006EBD8;
  if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_INFO))
  {
    id v11 = sub_100024DD4(self, (uint64_t)a6, [(IDSService *)self->_resourceService devices]);
    *(_DWORD *)buf = 138544130;
    id v71 = a6;
    __int16 v72 = 2114;
    id v73 = v11;
    __int16 v74 = 2114;
    id v75 = a7;
    __int16 v76 = 2114;
    id v77 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "IDS message received on resource service. fromID: %{public}@, pairedID: %{public}@, context: %{public}@, message: %{public}@", buf, 0x2Au);
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v12 = self;
  v13 = self->_listeners;
  id v14 = [(NSHashTable *)v13 countByEnumeratingWithState:&v63 objects:buf count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v64;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v64 == v16)
        {
          v18 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
        }
        else
        {
          objc_enumerationMutation(v13);
          v18 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            continue;
          }
        }
        [v18 service:v12 didReceiveResourceServiceMessage:a5 fromID:a6 incomingResponseIdentifier:[a7 incomingResponseIdentifier] outgoingResponseIdentifier:[a7 outgoingResponseIdentifier]];
      }
      id v15 = [(NSHashTable *)v13 countByEnumeratingWithState:&v63 objects:buf count:16];
    }
    while (v15);
  }
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  if (self->_resourceService == a3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    listeners = self->_listeners;
    id v7 = [(NSHashTable *)listeners countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 == v9)
          {
            id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
          }
          else
          {
            objc_enumerationMutation(listeners);
            id v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
          }
          [v11 service:self connectedDevicesChanged:a4];
        }
        id v8 = [(NSHashTable *)listeners countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  long long v13 = qword_10006EBD8;
  if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544643;
    id v35 = a3;
    __int16 v36 = 2114;
    id v37 = a4;
    __int16 v38 = 2113;
    id v39 = a5;
    __int16 v40 = 2114;
    id v41 = a6;
    __int16 v42 = 2114;
    id v43 = a7;
    __int16 v44 = 2114;
    id v45 = a8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "IDS resource received. service: %{public}@ resource: %{public}@ account: %{private}@ metadata: %{public}@ fromID: %{public}@ context: %{public}@", buf, 0x3Eu);
  }
  id v14 = [a6 objectForKeyedSubscript:@"RDGizmoSyncSensorIdentifierKey" a5, a7];
  if (!v14)
  {
    uint64_t v24 = qword_10006EBD8;
    if (!os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 138543362;
    id v35 = a6;
    v25 = "No sensor identifier in message payload %{public}@. Ignoring message";
    goto LABEL_21;
  }
  id v15 = v14;
  id v16 = [a6 objectForKeyedSubscript:@"RDGizmoSyncSamplesURLKey"];
  if (!v16)
  {
    uint64_t v24 = qword_10006EBD8;
    if (!os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 138543362;
    id v35 = a6;
    v25 = "No gizmo sync samples URL in message payload %{public}@. Ignoring message";
LABEL_21:
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);
    return;
  }
  if (self)
  {
    id v17 = v16;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    listeners = self->_listeners;
    id v19 = [(NSHashTable *)listeners countByEnumeratingWithState:&v30 objects:buf count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v31 == v21)
          {
            uint64_t v23 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
          }
          else
          {
            objc_enumerationMutation(listeners);
            uint64_t v23 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
          }
          [v23 service:self didReceiveArchive:v27 sensor:v15 gizmoSnapshotURL:v17 metadata:a6 fromID:v29];
        }
        id v20 = [(NSHashTable *)listeners countByEnumeratingWithState:&v30 objects:buf count:16];
      }
      while (v20);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 fromID:(id)a6 hasBeenDeliveredWithContext:(id)a7
{
  long long v13 = qword_10006EBD8;
  if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544387;
    id v25 = a3;
    __int16 v26 = 2113;
    id v27 = a4;
    __int16 v28 = 2114;
    id v29 = a5;
    __int16 v30 = 2114;
    id v31 = a6;
    __int16 v32 = 2114;
    id v33 = a7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IDS Message delivered. service: %{public}@ account: %{private}@ identifier: %{public}@ fromID: %{public}@ context: %{public}@", buf, 0x34u);
  }
  if (self)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    listeners = self->_listeners;
    id v15 = [(NSHashTable *)listeners countByEnumeratingWithState:&v20 objects:buf count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v21 == v17)
          {
            id v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
          }
          else
          {
            objc_enumerationMutation(listeners);
            id v19 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              continue;
            }
          }
          [v19 service:self didDeliverMessageWithIDSIdentifier:a5];
        }
        id v16 = [(NSHashTable *)listeners countByEnumeratingWithState:&v20 objects:buf count:16];
      }
      while (v16);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v8 = qword_10006EBD8;
  if (os_log_type_enabled((os_log_t)qword_10006EBD8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IDS Incoming data %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

@end