@interface NFTNEPHandler
- (void)startTNEPDeviceWithServices:(id)a3 optionalRecords:(id)a4 callback:(id)a5;
- (void)startTNEPReaderWithCallback:(id)a3;
- (void)tnepReaderDeselectWithCallback:(id)a3;
- (void)tnepReaderRestartPollingWithCallback:(id)a3;
- (void)tnepReaderSelectService:(id)a3 callback:(id)a4;
- (void)tnepReaderSend:(id)a3 callback:(id)a4;
- (void)tnepServiceInvalidate;
- (void)tnepTagDeviceSendNDEFMessage:(id)a3 callback:(id)a4;
@end

@implementation NFTNEPHandler

- (void)startTNEPDeviceWithServices:(id)a3 optionalRecords:(id)a4 callback:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = NFSharedSignpostLog();
  v13 = v12;
  if (self)
  {
    os_signpost_id_t signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, signpostId, "TNEP_TagDevice_Start", (const char *)&unk_100286819, buf, 2u);
    }
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v16 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v20 = 45;
    if (isMetaClass) {
      uint64_t v20 = 43;
    }
    v16(6, "%c[%{public}s %{public}s]:%i ", v20, ClassName, Name, 152);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v33 = v23;
    __int16 v34 = 2082;
    v35 = v24;
    __int16 v36 = 2082;
    v37 = v25;
    __int16 v38 = 1024;
    int v39 = 152;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  sub_100254EE0((uint64_t)self, 0);
  id v26 = [objc_alloc((Class)NSMutableArray) initWithArray:v11];

  sub_100254EE0((uint64_t)self, v26);
  sub_100254EF0((uint64_t)self, 0);
  id v27 = [objc_alloc((Class)NSArray) initWithArray:v10];

  sub_100254EF0((uint64_t)self, v27);
  if (self) {
    self = (NFTNEPHandler *)self->_workQueue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100254F00;
  block[3] = &unk_1003046C8;
  id v31 = v9;
  id v28 = v9;
  dispatch_async(&self->super, block);
}

- (void)tnepTagDeviceSendNDEFMessage:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self && self->_isServiceSelected)
  {
    if (sub_1002554A0((uint64_t)self, v7))
    {
      id v9 = 0;
    }
    else
    {
      id v21 = objc_alloc((Class)NSError);
      v22 = +[NSString stringWithUTF8String:"nfcd"];
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      int v23 = +[NSString stringWithUTF8String:"Invalid Parameter"];
      v54 = v23;
      v24 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      id v9 = [v21 initWithDomain:v22 code:10 userInfo:v24];

      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t Logger = NFLogGetLogger();
      if (Logger)
      {
        id v26 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        BOOL isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        uint64_t v29 = 45;
        if (isMetaClass) {
          uint64_t v29 = 43;
        }
        v26(3, "%c[%{public}s %{public}s]:%i Error sending message=%{public}@", v29, ClassName, Name, 178, v7);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v30 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v31 = object_getClass(self);
        if (class_isMetaClass(v31)) {
          int v32 = 43;
        }
        else {
          int v32 = 45;
        }
        *(_DWORD *)buf = 67110146;
        int v44 = v32;
        __int16 v45 = 2082;
        v46 = object_getClassName(self);
        __int16 v47 = 2082;
        v48 = sel_getName(a2);
        __int16 v49 = 1024;
        int v50 = 178;
        __int16 v51 = 2114;
        id v52 = v7;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error sending message=%{public}@", buf, 0x2Cu);
      }
    }
    workQueue = self->_workQueue;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100255608;
    v38[3] = &unk_1003045D8;
    id v39 = v9;
    id v40 = v8;
    id v20 = v9;
    id v34 = v8;
    dispatch_async(workQueue, v38);
  }
  else
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v10 = NFLogGetLogger();
    if (v10)
    {
      id v11 = (void (*)(uint64_t, const char *, ...))v10;
      v12 = object_getClass(self);
      BOOL v13 = class_isMetaClass(v12);
      v14 = object_getClassName(self);
      __int16 v36 = sel_getName(a2);
      uint64_t v15 = 45;
      if (v13) {
        uint64_t v15 = 43;
      }
      v11(6, "%c[%{public}s %{public}s]:%i TNEP reader not in selected state", v15, v14, v36, 168);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v16 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17)) {
        int v18 = 43;
      }
      else {
        int v18 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v44 = v18;
      __int16 v45 = 2082;
      v46 = object_getClassName(self);
      __int16 v47 = 2082;
      v48 = sel_getName(a2);
      __int16 v49 = 1024;
      int v50 = 168;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i TNEP reader not in selected state", buf, 0x22u);
    }

    if (self) {
      self = (NFTNEPHandler *)self->_workQueue;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100255388;
    block[3] = &unk_1003046C8;
    id v42 = v8;
    id v19 = v8;
    dispatch_async(&self->super, block);
    id v20 = v42;
  }
}

- (void)startTNEPReaderWithCallback:(id)a3
{
  id v4 = a3;
  v5 = NFSharedSignpostLog();
  v6 = v5;
  if (self)
  {
    os_signpost_id_t signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, signpostId, "TNEP_Reader_Start", (const char *)&unk_100286819, buf, 2u);
    }

    objc_storeStrong((id *)&self->_tagDeviceServices, 0);
    id v8 = objc_opt_new();
    objc_storeStrong((id *)&self->_tagDeviceServices, v8);

    self = (NFTNEPHandler *)self->_workQueue;
  }
  else
  {
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10025576C;
  block[3] = &unk_1003046C8;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(&self->super, block);
}

- (void)tnepReaderSelectService:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v35 = a4;
  unsigned __int8 v33 = [v6 length];
  id v7 = v6;
  if (self)
  {
    id v8 = self;
    objc_sync_enter(v8);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v9 = v8->_tagDeviceServices;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v43 objects:buf count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v44;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v44 != v11) {
            objc_enumerationMutation(v9);
          }
          BOOL v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          v14 = [v13 uri];
          unsigned int v15 = [v14 isEqualToString:v7];

          if (v15)
          {
            id v10 = v13;
            goto LABEL_12;
          }
        }
        id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v43 objects:buf count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v8);
  }
  else
  {
    id v10 = 0;
  }

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v17 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v20 = 45;
    if (isMetaClass) {
      uint64_t v20 = 43;
    }
    v17(6, "%c[%{public}s %{public}s]:%i %{public}@", v20, ClassName, Name, 202, v7);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    v24 = object_getClassName(self);
    v25 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v48 = v23;
    *(_WORD *)&v48[4] = 2082;
    *(void *)&v48[6] = v24;
    __int16 v49 = 2082;
    int v50 = v25;
    __int16 v51 = 1024;
    int v52 = 202;
    __int16 v53 = 2114;
    id v54 = v7;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  if (v33 && v10)
  {
    id v26 = NFSharedSignpostLog();
    id v27 = v26;
    if (self)
    {
      os_signpost_id_t signpostId = self->_signpostId;
      if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v48 = v7;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "TNEP_Reader_Select", "service=%@", buf, 0xCu);
      }
    }

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100255D10;
    v36[3] = &unk_100308730;
    v36[4] = self;
    id v39 = v35;
    SEL v40 = a2;
    id v37 = v7;
    id v38 = v10;
    id v29 = v35;
    sub_1002562C0((uint64_t)self, v38, 1u, v36);
  }
  else
  {
    if (self) {
      self = (NFTNEPHandler *)self->_workQueue;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100255BF8;
    block[3] = &unk_1003046C8;
    id v42 = v35;
    id v30 = v35;
    dispatch_async(&self->super, block);
  }
}

- (void)tnepReaderDeselectWithCallback:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 249);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v24 = v14;
    __int16 v25 = 2082;
    id v26 = object_getClassName(self);
    __int16 v27 = 2082;
    id v28 = sel_getName(a2);
    __int16 v29 = 1024;
    int v30 = 249;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  unsigned int v15 = NFSharedSignpostLog();
  v16 = v15;
  if (self)
  {
    os_signpost_id_t signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "TNEP_Reader_Deselect", (const char *)&unk_100286819, buf, 2u);
    }
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100256BEC;
  v20[3] = &unk_100302340;
  id v21 = v5;
  SEL v22 = a2;
  v20[4] = self;
  id v18 = v5;
  sub_1002562C0((uint64_t)self, 0, 0, v20);
}

- (void)tnepReaderSend:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NFSharedSignpostLog();
  id v10 = v9;
  if (self)
  {
    os_signpost_id_t signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "TNEP_Reader_Send", (const char *)&unk_100286819, buf, 2u);
    }

    readerSelectedService = self->_readerSelectedService;
  }
  else
  {

    readerSelectedService = 0;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100256FEC;
  v15[3] = &unk_100308758;
  v15[4] = self;
  id v16 = v7;
  id v17 = v8;
  SEL v18 = a2;
  id v13 = v8;
  id v14 = v7;
  sub_10025723C(self, v14, readerSelectedService, v15);
}

- (void)tnepReaderRestartPollingWithCallback:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  sub_100257670((uint64_t)self, 0);
  v4[2](v4, 0);
}

- (void)tnepServiceInvalidate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readPurpose, 0);
  objc_storeStrong((id *)&self->_connectedTag, 0);
  objc_storeStrong((id *)&self->_driverWrapper, 0);
  objc_storeStrong((id *)&self->_tagMemory, 0);
  objc_storeStrong((id *)&self->_tagDeviceServices, 0);
  objc_storeStrong((id *)&self->_initialRecords, 0);
  objc_storeStrong((id *)&self->_remoteDev, 0);
  objc_destroyWeak((id *)&self->_remoteProxy);
  objc_storeStrong((id *)&self->_readerSelectedService, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end