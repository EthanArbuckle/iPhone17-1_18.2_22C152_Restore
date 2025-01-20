@interface NFNdefTagSession
+ (id)generateBluetoothLESecureNdefPayloadWithOOBData:(id)a3;
- (BOOL)enableWrite:(BOOL)a3;
- (BOOL)enableWrite:(BOOL)a3 error:(id *)a4;
- (BOOL)setTagData:(id)a3;
- (BOOL)setTagData:(id)a3 error:(id *)a4;
- (BOOL)setTagMessage:(id)a3;
- (BOOL)setTagMessage:(id)a3 error:(id *)a4;
- (BOOL)startBluetoothLEPairingWithDeviceAddress:(id)a3 role:(unsigned __int8)a4 optionalOOBData:(id)a5;
- (BOOL)startBluetoothLESecureConnectionWithDeviceAddress:(id)a3 optionalOOBData:(id)a4;
- (BOOL)startBluetoothLESecureConnectionWithOOBData:(id)a3;
- (BOOL)startEmulation:(id)a3;
- (BOOL)startEmulation:(id)a3 error:(id *)a4;
- (BOOL)startEmulation:(id)a3 withMessageType:(unsigned int)a4;
- (BOOL)startEmulation:(id)a3 withMessageType:(unsigned int)a4 error:(id *)a5;
- (BOOL)startEmulationWithNdefMessage:(id)a3;
- (BOOL)startEmulationWithNdefMessage:(id)a3 error:(id *)a4;
- (BOOL)startEmulationWithNdefMessage:(id)a3 withMessageType:(unsigned int)a4;
- (BOOL)startEmulationWithNdefMessage:(id)a3 withMessageType:(unsigned int)a4 error:(id *)a5;
- (BOOL)stopEmulation;
- (BOOL)stopEmulationWithError:(id *)a3;
- (NFNdefTagSessionDelegate)delegate;
- (id)getTagData;
- (id)getTagDataWithError:(id *)a3;
- (id)getTagMessage;
- (id)getTagMessageWithError:(id *)a3;
- (void)didEndUnexpectedly;
- (void)didTagStateChange:(unsigned int)a3;
- (void)endSession;
- (void)setDelegate:(id)a3;
@end

@implementation NFNdefTagSession

- (BOOL)startBluetoothLEPairingWithDeviceAddress:(id)a3 role:(unsigned __int8)a4 optionalOOBData:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = +[NFNdefRecord emptyRecord];
  [v10 setTypeNameFormat:2];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:"application/vnd.bluetooth.le.oob" length:32];
  [v10 setType:v11];

  [v10 setMessageBegin:1];
  [v10 setMessageEnd:1];
  __int16 v64 = 7170;
  unsigned __int8 v65 = a4;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v64 length:3];
  if (!v8) {
    goto LABEL_4;
  }
  if ([v8 length] == 7)
  {
    *(_WORD *)buf = 6920;
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:buf length:2];
    [v13 appendData:v8];
    [v12 appendData:v13];

LABEL_4:
    id v57 = v9;
    id v58 = v8;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v14 = v9;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v61 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v19;
            uint64_t v21 = *(unsigned __int8 *)[v20 bytes];
            if ([v20 length] - 1 == v21) {
              [v12 appendData:v20];
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v16);
    }

    [v10 setPayload:v12];
    objc_msgSend(v10, "setShortRecord:", (unint64_t)objc_msgSend(v12, "length") < 0x100);
    v22 = objc_opt_new();
    [v22 addRecord:v10];
    v23 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v25 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v30 = [v10 asData];
      uint64_t v31 = 45;
      if (isMetaClass) {
        uint64_t v31 = 43;
      }
      v25(6, "%c[%{public}s %{public}s]:%i %{public}@", v31, ClassName, Name, 62, v30);
    }
    dispatch_get_specific(*v23);
    v32 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = object_getClass(self);
      if (class_isMetaClass(v33)) {
        int v34 = 43;
      }
      else {
        int v34 = 45;
      }
      v35 = object_getClassName(self);
      v36 = sel_getName(a2);
      v37 = [v10 asData];
      *(_DWORD *)buf = 67110146;
      int v68 = v34;
      __int16 v69 = 2082;
      v70 = v35;
      __int16 v71 = 2082;
      v72 = v36;
      __int16 v73 = 1024;
      int v74 = 62;
      __int16 v75 = 2114;
      uint64_t v76 = (uint64_t)v37;
      _os_log_impl(&dword_19D636000, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
    BOOL v38 = [(NFNdefTagSession *)self startEmulationWithNdefMessage:v22 withMessageType:0 error:0];
    id v9 = v57;
    id v8 = v58;
    goto LABEL_34;
  }
  v39 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t v40 = NFLogGetLogger();
  if (v40)
  {
    v41 = (void (*)(uint64_t, const char *, ...))v40;
    v42 = object_getClass(self);
    id v43 = v9;
    BOOL v44 = class_isMetaClass(v42);
    v45 = object_getClassName(self);
    v46 = sel_getName(a2);
    uint64_t v56 = [v8 length];
    BOOL v47 = !v44;
    id v9 = v43;
    uint64_t v48 = 45;
    if (!v47) {
      uint64_t v48 = 43;
    }
    v41(3, "%c[%{public}s %{public}s]:%i Invalid deviceAddress length: %lu", v48, v45, v46, 37, v56);
  }
  dispatch_get_specific(*v39);
  v22 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v49 = object_getClass(self);
    if (class_isMetaClass(v49)) {
      int v50 = 43;
    }
    else {
      int v50 = 45;
    }
    v51 = object_getClassName(self);
    v52 = v8;
    v53 = sel_getName(a2);
    uint64_t v54 = [v52 length];
    *(_DWORD *)buf = 67110146;
    int v68 = v50;
    __int16 v69 = 2082;
    v70 = v51;
    __int16 v71 = 2082;
    v72 = v53;
    id v8 = v52;
    __int16 v73 = 1024;
    int v74 = 37;
    __int16 v75 = 2048;
    uint64_t v76 = v54;
    _os_log_impl(&dword_19D636000, v22, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid deviceAddress length: %lu", buf, 0x2Cu);
  }
  BOOL v38 = 0;
LABEL_34:

  return v38;
}

- (BOOL)startBluetoothLESecureConnectionWithDeviceAddress:(id)a3 optionalOOBData:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[NFNdefRecord emptyRecord];
  [v7 setTypeNameFormat:2];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:"application/vnd.bluetooth.secure.le.oob" length:39];
  [v7 setType:v8];

  [v7 setMessageBegin:1];
  [v7 setMessageEnd:1];
  id v9 = objc_opt_new();
  long long v62 = v5;
  if (v5 && [v5 length] != 6)
  {
    v22 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v24 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      v28 = v9;
      Name = sel_getName(a2);
      uint64_t v58 = [v62 length];
      id v57 = Name;
      id v9 = v28;
      uint64_t v30 = 45;
      if (isMetaClass) {
        uint64_t v30 = 43;
      }
      v24(3, "%c[%{public}s %{public}s]:%i Invalid deviceAddress length: %lu", v30, ClassName, v57, 80, v58);
    }
    dispatch_get_specific(*v22);
    v10 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = object_getClass(self);
      if (class_isMetaClass(v31)) {
        int v32 = 43;
      }
      else {
        int v32 = 45;
      }
      v33 = object_getClassName(self);
      id v34 = v6;
      v35 = sel_getName(a2);
      id v20 = v62;
      uint64_t v36 = [v62 length];
      int buf = 67110146;
      int v71 = v32;
      __int16 v72 = 2082;
      __int16 v73 = v33;
      __int16 v74 = 2082;
      __int16 v75 = v35;
      id v6 = v34;
      __int16 v76 = 1024;
      int v77 = 80;
      __int16 v78 = 2048;
      uint64_t v79 = v36;
      _os_log_impl(&dword_19D636000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid deviceAddress length: %lu", (uint8_t *)&buf, 0x2Cu);
      BOOL v37 = 0;
    }
    else
    {
      BOOL v37 = 0;
      id v20 = v62;
    }
  }
  else
  {
    long long v60 = v9;
    v10 = objc_opt_new();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v59 = v6;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v66 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v16;
            uint64_t v18 = *(unsigned __int8 *)[v17 bytes];
            if ([v17 length] - 1 == v18) {
              [v10 appendData:v17];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v65 objects:v69 count:16];
      }
      while (v13);
    }

    __int16 v19 = [v10 length] + 2;
    id v20 = v62;
    if (v62)
    {
      __int16 v64 = v19 + [v62 length];
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v64 length:2];
      id v9 = v60;
      [v60 appendData:v21];

      [v60 appendData:v62];
    }
    else
    {
      __int16 v64 = v19;
      BOOL v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v64 length:2];
      id v9 = v60;
      [v60 appendData:v38];
    }
    [v9 appendData:v10];
    [v7 setPayload:v9];
    objc_msgSend(v7, "setShortRecord:", (unint64_t)objc_msgSend(v9, "length") < 0x100);
    v39 = objc_opt_new();
    [v39 addRecord:v7];
    uint64_t v40 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v41 = NFLogGetLogger();
    if (v41)
    {
      v42 = (void (*)(uint64_t, const char *, ...))v41;
      id v43 = object_getClass(self);
      BOOL v44 = class_isMetaClass(v43);
      v45 = object_getClassName(self);
      v46 = sel_getName(a2);
      BOOL v47 = [v7 asData];
      BOOL v48 = !v44;
      id v9 = v60;
      id v20 = v62;
      uint64_t v49 = 45;
      if (!v48) {
        uint64_t v49 = 43;
      }
      v42(6, "%c[%{public}s %{public}s]:%i %{public}@", v49, v45, v46, 112, v47);
    }
    dispatch_get_specific(*v40);
    int v50 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = object_getClass(self);
      if (class_isMetaClass(v51)) {
        int v52 = 43;
      }
      else {
        int v52 = 45;
      }
      v53 = object_getClassName(self);
      uint64_t v54 = sel_getName(a2);
      v55 = [v7 asData];
      int buf = 67110146;
      int v71 = v52;
      __int16 v72 = 2082;
      __int16 v73 = v53;
      __int16 v74 = 2082;
      __int16 v75 = v54;
      __int16 v76 = 1024;
      int v77 = 112;
      __int16 v78 = 2114;
      uint64_t v79 = (uint64_t)v55;
      _os_log_impl(&dword_19D636000, v50, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", (uint8_t *)&buf, 0x2Cu);
    }
    BOOL v37 = [(NFNdefTagSession *)self startEmulationWithNdefMessage:v39 withMessageType:1 error:0];

    id v6 = v59;
  }

  return v37;
}

- (BOOL)startBluetoothLESecureConnectionWithOOBData:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[NFNdefRecord emptyRecord];
  [v4 setTypeNameFormat:2];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:"application/vnd.bluetooth.secure.le.oob" length:39];
  [v4 setType:v5];

  [v4 setMessageBegin:1];
  [v4 setMessageEnd:1];
  v35 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          uint64_t v14 = *(unsigned __int8 *)[v13 bytes];
          if ([v13 length] - 1 == v14) {
            [v6 appendData:v13];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v9);
  }

  __int16 v37 = [v6 length] + 2;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:&v37 length:2];
  [v35 appendData:v15];

  [v35 appendData:v6];
  [v4 setPayload:v35];
  objc_msgSend(v4, "setShortRecord:", (unint64_t)objc_msgSend(v35, "length") < 0x100);
  uint64_t v16 = objc_opt_new();
  [v16 addRecord:v4];
  id v17 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    __int16 v19 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v24 = [v4 asData];
    uint64_t v25 = 45;
    if (isMetaClass) {
      uint64_t v25 = 43;
    }
    v19(6, "%c[%{public}s %{public}s]:%i %{public}@", v25, ClassName, Name, 150, v24);
  }
  dispatch_get_specific(*v17);
  v26 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = object_getClass(self);
    if (class_isMetaClass(v27)) {
      int v28 = 43;
    }
    else {
      int v28 = 45;
    }
    v29 = object_getClassName(self);
    uint64_t v30 = sel_getName(a2);
    uint64_t v31 = [v4 asData];
    *(_DWORD *)int buf = 67110146;
    int v43 = v28;
    __int16 v44 = 2082;
    v45 = v29;
    __int16 v46 = 2082;
    BOOL v47 = v30;
    __int16 v48 = 1024;
    int v49 = 150;
    __int16 v50 = 2114;
    v51 = v31;
    _os_log_impl(&dword_19D636000, v26, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  BOOL v32 = [(NFNdefTagSession *)self startEmulationWithNdefMessage:v16 withMessageType:1];

  return v32;
}

+ (id)generateBluetoothLESecureNdefPayloadWithOOBData:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[NFNdefRecord emptyRecord];
  [v4 setTypeNameFormat:2];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:"application/vnd.bluetooth.secure.le.oob" length:39];
  [v4 setType:v5];

  [v4 setMessageBegin:1];
  [v4 setMessageEnd:1];
  v35 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          __int16 v19 = (const void **)MEMORY[0x1E4FBA898];
          dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
          uint64_t Logger = NFLogGetLogger();
          if (Logger)
          {
            uint64_t v21 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(a1);
            BOOL isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(a1);
            Name = sel_getName(a2);
            uint64_t v25 = 45;
            if (isMetaClass) {
              uint64_t v25 = 43;
            }
            v21(3, "%c[%{public}s %{public}s]:%i Wrong data type in oobdata", v25, ClassName, Name, 176);
          }
          dispatch_get_specific(*v19);
          v26 = NFSharedLogGetLogger();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v27 = object_getClass(a1);
            if (class_isMetaClass(v27)) {
              int v28 = 43;
            }
            else {
              int v28 = 45;
            }
            v29 = object_getClassName(a1);
            uint64_t v30 = sel_getName(a2);
            *(_DWORD *)int buf = 67109890;
            int v41 = v28;
            __int16 v42 = 2082;
            int v43 = v29;
            __int16 v44 = 2082;
            v45 = v30;
            __int16 v46 = 1024;
            int v47 = 176;
            _os_log_impl(&dword_19D636000, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Wrong data type in oobdata", buf, 0x22u);
          }

          uint64_t v18 = objc_opt_new();
          uint64_t v16 = v35;
          goto LABEL_22;
        }
        id v13 = v12;
        uint64_t v14 = *(unsigned __int8 *)[v13 bytes];
        if ([v13 length] - 1 == v14) {
          [v6 appendData:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v48 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  *(_WORD *)int buf = [v6 length] + 2;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:buf length:2];
  uint64_t v16 = v35;
  [v35 appendData:v15];

  [v35 appendData:v6];
  [v4 setPayload:v35];
  objc_msgSend(v4, "setShortRecord:", (unint64_t)objc_msgSend(v35, "length") < 0x100);
  id v17 = objc_opt_new();
  [v17 addRecord:v4];
  uint64_t v18 = [v17 asData];

LABEL_22:
  return v18;
}

- (void)setDelegate:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak((id *)&obj->_delegate, v4);

  objc_sync_exit(obj);
}

- (NFNdefTagSessionDelegate)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  objc_sync_exit(v2);

  return (NFNdefTagSessionDelegate *)WeakRetained;
}

- (void)endSession
{
  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)NFNdefTagSession;
  [(NFSession *)&v3 endSession];
}

- (void)didEndUnexpectedly
{
  v5.receiver = self;
  v5.super_class = (Class)NFNdefTagSession;
  objc_super v3 = [(NFSession *)&v5 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__NFNdefTagSession_didEndUnexpectedly__block_invoke;
  block[3] = &unk_1E595CC98;
  block[4] = self;
  dispatch_async(v3, block);
}

id __38__NFNdefTagSession_didEndUnexpectedly__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 ndefTagSessionDidEndUnexpectedly:*(void *)(a1 + 32)];
  }
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)NFNdefTagSession;
  return objc_msgSendSuper2(&v6, sel_didEndUnexpectedly);
}

- (void)didTagStateChange:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NFNdefTagSession;
  objc_super v5 = [(NFSession *)&v8 callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__NFNdefTagSession_didTagStateChange___block_invoke;
  v6[3] = &unk_1E595E570;
  v6[4] = self;
  unsigned int v7 = a3;
  dispatch_async(v5, v6);
}

void __38__NFNdefTagSession_didTagStateChange___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 ndefTagSession:*(void *)(a1 + 32) didTagStateChange:*(unsigned int *)(a1 + 40)];
  }
}

- (BOOL)startEmulationWithNdefMessage:(id)a3
{
  id v4 = [a3 asData];
  LOBYTE(self) = [(NFNdefTagSession *)self startEmulation:v4 withMessageType:0 error:0];

  return (char)self;
}

- (BOOL)startEmulationWithNdefMessage:(id)a3 error:(id *)a4
{
  objc_super v6 = [a3 asData];
  LOBYTE(a4) = [(NFNdefTagSession *)self startEmulation:v6 withMessageType:0 error:a4];

  return (char)a4;
}

- (BOOL)startEmulationWithNdefMessage:(id)a3 withMessageType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  objc_super v6 = [a3 asData];
  LOBYTE(v4) = [(NFNdefTagSession *)self startEmulation:v6 withMessageType:v4 error:0];

  return v4;
}

- (BOOL)startEmulationWithNdefMessage:(id)a3 withMessageType:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  objc_super v8 = [a3 asData];
  LOBYTE(a5) = [(NFNdefTagSession *)self startEmulation:v8 withMessageType:v6 error:a5];

  return (char)a5;
}

- (BOOL)startEmulation:(id)a3
{
  return [(NFNdefTagSession *)self startEmulation:a3 withMessageType:0 error:0];
}

- (BOOL)startEmulation:(id)a3 error:(id *)a4
{
  return [(NFNdefTagSession *)self startEmulation:a3 withMessageType:0 error:a4];
}

- (BOOL)startEmulation:(id)a3 withMessageType:(unsigned int)a4
{
  return [(NFNdefTagSession *)self startEmulation:a3 withMessageType:*(void *)&a4 error:0];
}

- (BOOL)startEmulation:(id)a3 withMessageType:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  uint64_t v10 = _os_activity_create(&dword_19D636000, "startEmulation:withMessageType:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v18 = 0x3032000000;
  __int16 v19 = __Block_byref_object_copy__15;
  id v20 = __Block_byref_object_dispose__15;
  id v21 = 0;
  id v11 = [(NFSession *)self proxy];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__NFNdefTagSession_startEmulation_withMessageType_error___block_invoke;
  v16[3] = &unk_1E595C6C0;
  v16[4] = self;
  v16[5] = &state;
  v16[6] = a2;
  uint64_t v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__NFNdefTagSession_startEmulation_withMessageType_error___block_invoke_21;
  v15[3] = &unk_1E595CA18;
  v15[4] = self;
  v15[5] = &state;
  v15[6] = &v22;
  v15[7] = a2;
  [v12 startEmulation:v9 withMessageType:v6 completion:v15];

  if (a5) {
    *a5 = *(id *)(state.opaque[1] + 40);
  }
  char v13 = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __57__NFNdefTagSession_startEmulation_withMessageType_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  objc_super v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    unsigned int v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 105, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)int buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    id v21 = v14;
    __int16 v22 = 2082;
    v23 = v15;
    __int16 v24 = 1024;
    int v25 = 105;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __57__NFNdefTagSession_startEmulation_withMessageType_error___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    objc_super v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unsigned int v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 109, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)int buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      id v21 = v14;
      __int16 v22 = 2082;
      v23 = v15;
      __int16 v24 = 1024;
      int v25 = 109;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)stopEmulation
{
  return [(NFNdefTagSession *)self stopEmulationWithError:0];
}

- (BOOL)stopEmulationWithError:(id *)a3
{
  uint64_t v6 = _os_activity_create(&dword_19D636000, "stopEmulationWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__15;
  uint64_t v16 = __Block_byref_object_dispose__15;
  id v17 = 0;
  unsigned int v7 = [(NFSession *)self proxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__NFNdefTagSession_stopEmulationWithError___block_invoke;
  v12[3] = &unk_1E595C6C0;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = a2;
  objc_super v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__NFNdefTagSession_stopEmulationWithError___block_invoke_22;
  v11[3] = &unk_1E595CA18;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = &v18;
  v11[7] = a2;
  [v8 stopEmulationWithCompletion:v11];

  if (a3) {
    *a3 = *(id *)(state.opaque[1] + 40);
  }
  char v9 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __43__NFNdefTagSession_stopEmulationWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  objc_super v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    unsigned int v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 136, v4);
  }
  dispatch_get_specific(*v5);
  id v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)int buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    char v21 = v14;
    __int16 v22 = 2082;
    v23 = v15;
    __int16 v24 = 1024;
    int v25 = 136;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __43__NFNdefTagSession_stopEmulationWithError___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    objc_super v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      unsigned int v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 140, v4);
    }
    dispatch_get_specific(*v5);
    id v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)int buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      char v21 = v14;
      __int16 v22 = 2082;
      v23 = v15;
      __int16 v24 = 1024;
      int v25 = 140;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)setTagMessage:(id)a3
{
  id v4 = [a3 asData];
  LOBYTE(self) = [(NFNdefTagSession *)self setTagData:v4 error:0];

  return (char)self;
}

- (BOOL)setTagMessage:(id)a3 error:(id *)a4
{
  uint64_t v6 = [a3 asData];
  LOBYTE(a4) = [(NFNdefTagSession *)self setTagData:v6 error:a4];

  return (char)a4;
}

- (BOOL)setTagData:(id)a3
{
  return [(NFNdefTagSession *)self setTagData:a3 error:0];
}

- (BOOL)setTagData:(id)a3 error:(id *)a4
{
  id v7 = a3;
  objc_super v8 = _os_activity_create(&dword_19D636000, "setTagData:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__15;
  uint64_t v18 = __Block_byref_object_dispose__15;
  id v19 = 0;
  char v9 = [(NFSession *)self proxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__NFNdefTagSession_setTagData_error___block_invoke;
  v14[3] = &unk_1E595C6C0;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = a2;
  uint64_t v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__NFNdefTagSession_setTagData_error___block_invoke_23;
  v13[3] = &unk_1E595CA18;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = &v20;
  v13[7] = a2;
  [v10 setTagContent:v7 completion:v13];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v11 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __37__NFNdefTagSession_setTagData_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  objc_super v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 177, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)int buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    char v21 = v14;
    __int16 v22 = 2082;
    char v23 = v15;
    __int16 v24 = 1024;
    int v25 = 177;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __37__NFNdefTagSession_setTagData_error___block_invoke_23(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    objc_super v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 181, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)int buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      char v21 = v14;
      __int16 v22 = 2082;
      char v23 = v15;
      __int16 v24 = 1024;
      int v25 = 181;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (id)getTagData
{
  return [(NFNdefTagSession *)self getTagDataWithError:0];
}

- (id)getTagDataWithError:(id *)a3
{
  uint64_t v6 = _os_activity_create(&dword_19D636000, "getTagDataWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__15;
  __int16 v22 = __Block_byref_object_dispose__15;
  id v23 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__15;
  id v17 = __Block_byref_object_dispose__15;
  id v18 = 0;
  id v7 = [(NFSession *)self proxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__NFNdefTagSession_getTagDataWithError___block_invoke;
  v12[3] = &unk_1E595C6C0;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a2;
  objc_super v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__NFNdefTagSession_getTagDataWithError___block_invoke_24;
  v11[3] = &unk_1E595CA68;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &state;
  v11[7] = a2;
  [v8 getTagContentWithCompletion:v11];

  if (a3) {
    *a3 = (id) v14[5];
  }
  id v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&state, 8);
  return v9;
}

void __40__NFNdefTagSession_getTagDataWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  objc_super v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 207, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)int buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    char v21 = v14;
    __int16 v22 = 2082;
    id v23 = v15;
    __int16 v24 = 1024;
    int v25 = 207;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __40__NFNdefTagSession_getTagDataWithError___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    objc_super v8 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      uint64_t v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v13 = 45;
      if (isMetaClass) {
        uint64_t v13 = 43;
      }
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 211, v7);
    }
    dispatch_get_specific(*v8);
    uint64_t v14 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15)) {
        int v16 = 43;
      }
      else {
        int v16 = 45;
      }
      id v17 = object_getClassName(*(id *)(a1 + 32));
      id v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)int buf = 67110146;
      int v22 = v16;
      __int16 v23 = 2082;
      __int16 v24 = v17;
      __int16 v25 = 2082;
      __int16 v26 = v18;
      __int16 v27 = 1024;
      int v28 = 211;
      __int16 v29 = 2114;
      id v30 = v7;
      _os_log_impl(&dword_19D636000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

- (id)getTagMessage
{
  return [(NFNdefTagSession *)self getTagMessageWithError:0];
}

- (id)getTagMessageWithError:(id *)a3
{
  char v3 = [(NFNdefTagSession *)self getTagDataWithError:a3];
  if (v3)
  {
    id v4 = [NFNdefMessage alloc];
    id v5 = v3;
    id v6 = -[NFNdefMessage initWithBytes:length:](v4, "initWithBytes:length:", [v5 bytes], objc_msgSend(v5, "length"));
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)enableWrite:(BOOL)a3
{
  return [(NFNdefTagSession *)self enableWrite:a3 error:0];
}

- (BOOL)enableWrite:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  objc_super v8 = _os_activity_create(&dword_19D636000, "enableWrite:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__15;
  id v18 = __Block_byref_object_dispose__15;
  id v19 = 0;
  id v9 = [(NFSession *)self proxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__NFNdefTagSession_enableWrite_error___block_invoke;
  v14[3] = &unk_1E595C6C0;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = a2;
  uint64_t v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__NFNdefTagSession_enableWrite_error___block_invoke_26;
  v13[3] = &unk_1E595CA18;
  v13[4] = self;
  v13[5] = &state;
  v13[6] = &v20;
  v13[7] = a2;
  [v10 enableWrite:v5 completion:v13];

  if (a4) {
    *a4 = *(id *)(state.opaque[1] + 40);
  }
  char v11 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __38__NFNdefTagSession_enableWrite_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
  dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 250, v4);
  }
  dispatch_get_specific(*v5);
  char v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
    uint64_t v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)int buf = 67110146;
    int v19 = v13;
    __int16 v20 = 2082;
    char v21 = v14;
    __int16 v22 = 2082;
    char v23 = v15;
    __int16 v24 = 1024;
    int v25 = 250;
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
}

void __38__NFNdefTagSession_enableWrite_error___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    BOOL v5 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      id v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      uint64_t v10 = 45;
      if (isMetaClass) {
        uint64_t v10 = 43;
      }
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 254, v4);
    }
    dispatch_get_specific(*v5);
    char v11 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v12)) {
        int v13 = 43;
      }
      else {
        int v13 = 45;
      }
      uint64_t v14 = object_getClassName(*(id *)(a1 + 32));
      uint64_t v15 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)int buf = 67110146;
      int v19 = v13;
      __int16 v20 = 2082;
      char v21 = v14;
      __int16 v22 = 2082;
      char v23 = v15;
      __int16 v24 = 1024;
      int v25 = 254;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_impl(&dword_19D636000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void).cxx_destruct
{
}

@end