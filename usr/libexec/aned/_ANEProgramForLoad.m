@interface _ANEProgramForLoad
+ (void)dumpProgramInstance:(ANEProgramInstanceStruct *)a3;
- (ANEProgramInstanceStruct)programInstance;
- (BOOL)createProgramInstanceForModel:(id)a3 modelToken:(id)a4 modelFilePath:(id)a5 qos:(unsigned int)a6 isPreCompiled:(BOOL)a7 enablePowerSaving:(BOOL)a8 skipPreparePhase:(BOOL)a9 statsMask:(unsigned int)a10 memoryPoolID:(unint64_t)a11 enableLateLatch:(BOOL)a12 modelIdentityStr:(id)a13 owningPid:(int)a14 cacheUrlIdentifier:(id)a15 aotCacheUrlIdentifier:(id)a16 error:(id *)a17;
- (BOOL)createProgramInstanceWithWeights:(id)a3 modelToken:(id)a4 qos:(unsigned int)a5 baseModelIdentifier:(id)a6 owningPid:(int)a7 numWeightFiles:(unsigned int *)a8 error:(id *)a9;
- (BOOL)destroyProgramInstance;
- (BOOL)isNewInstance;
- (BOOL)prepareChainingRequest:(id)a3 qos:(unsigned int)a4 qIndex:(unint64_t)a5 statsMask:(unsigned int)a6 error:(id *)a7;
- (BOOL)removeCachedReference;
- (OS_dispatch_queue)q;
- (OS_os_transaction)txn;
- (_ANEDeviceController)controller;
- (_ANEProgramForLoad)init;
- (char)queueDepth;
- (id)createSymbolMapping;
- (id)createSymbolMappingForProgram:(ANEProgramInstanceStruct *)a3;
- (id)description;
- (int64_t)refcount;
- (unint64_t)intermediateBufferHandle;
- (unint64_t)programHandle;
- (unint64_t)wiredMemory;
- (unsigned)numInputs;
- (unsigned)numOutputs;
- (void)addCachedReference;
- (void)dealloc;
- (void)setIntermediateBufferHandle:(unint64_t)a3;
- (void)setIsNewInstance:(BOOL)a3;
- (void)setNumInputs:(unsigned __int8)a3;
- (void)setNumOutputs:(unsigned __int8)a3;
- (void)setProgramHandle:(unint64_t)a3;
- (void)setProgramInstance:(ANEProgramInstanceStruct *)a3;
- (void)setQueueDepth:(char)a3;
- (void)setRefcount:(int64_t)a3;
- (void)setTxn:(id)a3;
- (void)setWiredMemory:(unint64_t)a3;
@end

@implementation _ANEProgramForLoad

- (_ANEProgramForLoad)init
{
  v9.receiver = self;
  v9.super_class = (Class)_ANEProgramForLoad;
  v2 = [(_ANEProgramForLoad *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ane.program", v3);
    q = v2->_q;
    v2->_q = (OS_dispatch_queue *)v4;

    v2->_wiredMemory = 0;
    *(_DWORD *)&v2->_queueDepth = 127;
    uint64_t v6 = +[_ANEDeviceController sharedPrivilegedConnection];
    controller = v2->_controller;
    v2->_controller = (_ANEDeviceController *)v6;

    [(_ANEDeviceController *)v2->_controller start];
  }
  return v2;
}

- (void)dealloc
{
  p_programInstance = &self->_programInstance;
  if (self->_programInstance)
  {
    v5 = +[_ANELog daemon];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v15 = NSStringFromSelector(a2);
      programInstance = self->_programInstance;
      int64_t refcount = self->_refcount;
      *(_DWORD *)buf = 138412802;
      v24 = v15;
      __int16 v25 = 2048;
      v26 = programInstance;
      __int16 v27 = 2048;
      int64_t v28 = refcount;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@: Stopping the program=%p : refcount=%lld", buf, 0x20u);
    }
    uint64_t v6 = *p_programInstance;
    if (*p_programInstance && v6->var0)
    {
      uint64_t v7 = (*((uint64_t (**)(void))v6->var0 + 2))();
      if (!v7) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v7 = 2;
    }
    +[_ANEDataReporter reportErrorMsg:0 status:v7];
    v8 = +[_ANELog daemon];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v18 = NSStringFromSelector(a2);
      v19 = *p_programInstance;
      *(_DWORD *)buf = 138412802;
      v24 = v18;
      __int16 v25 = 2048;
      v26 = v19;
      __int16 v27 = 1024;
      LODWORD(v28) = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: Could not stop the program=%p : ret=0x%x", buf, 0x1Cu);
    }
LABEL_12:
    objc_super v9 = +[_ANELog daemon];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue();
      sub_10001B5A8();
    }

    v10 = *p_programInstance;
    if (*p_programInstance && v10->var0)
    {
      uint64_t v11 = (*((uint64_t (**)(void))v10->var0 + 3))();
      if (!v11)
      {
LABEL_22:
        txn = self->_txn;
        self->_programInstance = 0;
        self->_txn = 0;
        self->_int64_t refcount = 0;

        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v11 = 2;
    }
    +[_ANEDataReporter reportErrorMsg:0 status:v11];
    v12 = +[_ANELog daemon];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v20 = NSStringFromSelector(a2);
      v21 = *p_programInstance;
      *(_DWORD *)buf = 138412802;
      v24 = v20;
      __int16 v25 = 2048;
      v26 = v21;
      __int16 v27 = 1024;
      LODWORD(v28) = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: Could not destroy the program=%p : ret=0x%x", buf, 0x1Cu);
    }
    goto LABEL_22;
  }
LABEL_23:
  [(_ANEDeviceController *)self->_controller stop];
  controller = self->_controller;
  self->_controller = 0;

  v22.receiver = self;
  v22.super_class = (Class)_ANEProgramForLoad;
  [(_ANEProgramForLoad *)&v22 dealloc];
}

- (void)addCachedReference
{
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000314C;
  block[3] = &unk_10002C698;
  block[4] = self;
  dispatch_sync(q, block);
}

- (BOOL)removeCachedReference
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  q = self->_q;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003258;
  v5[3] = &unk_10002C670;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(q, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)description
{
  char v3 = (objc_class *)objc_opt_class();
  dispatch_queue_t v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"%@: { programHandle=%llu : intermediateBufferHandle=%llu : refcount=%lld }", v4, [(_ANEProgramForLoad *)self programHandle], [(_ANEProgramForLoad *)self intermediateBufferHandle], [(_ANEProgramForLoad *)self refcount]];

  return v5;
}

- (BOOL)createProgramInstanceForModel:(id)a3 modelToken:(id)a4 modelFilePath:(id)a5 qos:(unsigned int)a6 isPreCompiled:(BOOL)a7 enablePowerSaving:(BOOL)a8 skipPreparePhase:(BOOL)a9 statsMask:(unsigned int)a10 memoryPoolID:(unint64_t)a11 enableLateLatch:(BOOL)a12 modelIdentityStr:(id)a13 owningPid:(int)a14 cacheUrlIdentifier:(id)a15 aotCacheUrlIdentifier:(id)a16 error:(id *)a17
{
  BOOL v53 = a8;
  BOOL v49 = a7;
  id v57 = a3;
  id v44 = a4;
  id v45 = a5;
  id v55 = a13;
  id v56 = a15;
  id v58 = a16;
  v20 = +[_ANELog daemon];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = v57;
    id v23 = [v22 bytes];
    id v24 = [v22 length];
    __int16 v25 = [(_ANEProgramForLoad *)self controller];
    *(_DWORD *)buf = 138416130;
    id v90 = v21;
    __int16 v91 = 2048;
    *(void *)v92 = v23;
    *(_WORD *)&v92[8] = 2048;
    *(void *)&v92[10] = v24;
    *(_WORD *)&v92[18] = 1024;
    *(_DWORD *)&v92[20] = a6;
    __int16 v93 = 1024;
    *(_DWORD *)v94 = v49;
    *(_WORD *)&v94[4] = 1024;
    *(_DWORD *)&v94[6] = v53;
    *(_WORD *)v95 = 2048;
    *(void *)&v95[2] = [v25 device];
    __int16 v96 = 2048;
    *(void *)v97 = [(_ANEProgramForLoad *)self programInstance];
    *(_WORD *)&v97[8] = 2048;
    *(void *)&v97[10] = [(_ANEProgramForLoad *)self refcount];
    *(_WORD *)&v97[18] = 2048;
    *(void *)&v97[20] = [(_ANEProgramForLoad *)self intermediateBufferHandle];
    __int16 v98 = 1024;
    unsigned int v99 = a10;
    __int16 v100 = 2048;
    unint64_t v101 = a11;
    __int16 v102 = 1024;
    BOOL v103 = a12;
    __int16 v104 = 2112;
    id v105 = v55;
    __int16 v106 = 2112;
    id v107 = v56;
    __int16 v108 = 2112;
    id v109 = v58;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@: START : cachedModel.bytes=%p : cachedModel.length=%ld : qos=%d : isPreCompiled=%d : enablePowerSaving=%d : controller.device=%p : programInstance=%p : refcount=%lld : intermediateBufferHandle=%llu : statsMask=%u : memoryPoolId=%llu : enableLateLatch=%d : modelIdentityStr=%@ : cacheUrlIdentifier=%@ : aotCacheUrlIdentifier=%@", buf, 0x8Eu);
  }
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x2020000000;
  char v88 = 1;
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = sub_100003A04;
  v83 = sub_100003A14;
  id v84 = 0;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003A1C;
  block[3] = &unk_10002C6C0;
  block[4] = self;
  id v27 = v57;
  id v62 = v27;
  v68 = &v79;
  v69 = &v85;
  SEL v70 = a2;
  id v28 = v44;
  id v63 = v28;
  id v29 = v45;
  BOOL v75 = v49;
  int v72 = a14;
  unsigned int v73 = a6;
  BOOL v76 = v53;
  unsigned int v74 = a10;
  id v64 = v29;
  unint64_t v71 = a11;
  id v30 = v55;
  id v65 = v30;
  id v54 = v58;
  id v66 = v54;
  id v52 = v56;
  id v67 = v52;
  BOOL v77 = a9;
  BOOL v78 = a12;
  dispatch_sync(q, block);
  v31 = +[_ANELog daemon];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v46 = v30;
    id v47 = v29;
    id v48 = v28;
    id v50 = v27;
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    int v43 = *((unsigned __int8 *)v86 + 24);
    aSelectora = [(_ANEProgramForLoad *)self controller];
    id v42 = [aSelectora device];
    unint64_t v33 = [(_ANEProgramForLoad *)self programHandle];
    unint64_t v34 = [(_ANEProgramForLoad *)self intermediateBufferHandle];
    unsigned int v35 = [(_ANEProgramForLoad *)self queueDepth];
    unsigned int v36 = [(_ANEProgramForLoad *)self numInputs];
    unsigned int v37 = [(_ANEProgramForLoad *)self numOutputs];
    int64_t v38 = [(_ANEProgramForLoad *)self refcount];
    unint64_t v39 = [(_ANEProgramForLoad *)self wiredMemory];
    *(_DWORD *)buf = 138414594;
    id v90 = v32;
    __int16 v91 = 1024;
    *(_DWORD *)v92 = v43;
    *(_WORD *)&v92[4] = 2048;
    *(void *)&v92[6] = v42;
    *(_WORD *)&v92[14] = 2048;
    *(void *)&v92[16] = v33;
    __int16 v93 = 2048;
    *(void *)v94 = v34;
    *(_WORD *)&v94[8] = 1024;
    *(_DWORD *)v95 = v35;
    *(_WORD *)&v95[4] = 1024;
    *(_DWORD *)&v95[6] = v36;
    __int16 v96 = 1024;
    *(_DWORD *)v97 = v37;
    *(_WORD *)&v97[4] = 2048;
    *(void *)&v97[6] = v38;
    *(_WORD *)&v97[14] = 2048;
    *(void *)&v97[16] = v39;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%@: END : ok=%d : controller.device=%p : programHandle=%llu : intermediateBufferHandle=%llu : queueDepth=%d : numInputs=%d : numOutputs=%d : refcount=%lld : wiredMemory=%ld", buf, 0x56u);

    id v28 = v48;
    id v27 = v50;
    id v30 = v46;
    id v29 = v47;
  }
  if (a17) {
    *a17 = (id) v80[5];
  }
  BOOL v40 = *((unsigned char *)v86 + 24) != 0;

  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v85, 8);

  return v40;
}

- (BOOL)createProgramInstanceWithWeights:(id)a3 modelToken:(id)a4 qos:(unsigned int)a5 baseModelIdentifier:(id)a6 owningPid:(int)a7 numWeightFiles:(unsigned int *)a8 error:(id *)a9
{
  id v39 = a3;
  id v40 = a4;
  id v41 = a6;
  v16 = +[_ANELog daemon];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = [(_ANEProgramForLoad *)self controller];
    *(_DWORD *)buf = 138413826;
    id v63 = v17;
    __int16 v64 = 1024;
    unsigned int v65 = a5;
    __int16 v66 = 2048;
    id v67 = [v18 device];
    __int16 v68 = 2048;
    v69 = [(_ANEProgramForLoad *)self programInstance];
    __int16 v70 = 2048;
    int64_t v71 = [(_ANEProgramForLoad *)self refcount];
    __int16 v72 = 2048;
    *(void *)unsigned int v73 = [(_ANEProgramForLoad *)self intermediateBufferHandle];
    *(_WORD *)&v73[8] = 2112;
    id v74 = v41;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@: START : qos=%d : controller.device=%p : programInstance=%p : refcount=%lld : intermediateBufferHandle=%llu : baseModelIdentifier=%@", buf, 0x44u);
  }
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 1;
  uint64_t v52 = 0;
  BOOL v53 = &v52;
  uint64_t v54 = 0x3032000000;
  id v55 = sub_100003A04;
  id v56 = sub_100003A14;
  id v57 = 0;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004D6C;
  block[3] = &unk_10002C6E8;
  block[4] = self;
  id v46 = &v52;
  id v47 = &v58;
  SEL v48 = a2;
  id v20 = v40;
  id v43 = v20;
  int v50 = a7;
  id v21 = v41;
  id v44 = v21;
  id v22 = v39;
  id v45 = v22;
  BOOL v49 = a8;
  unsigned int v51 = a5;
  dispatch_sync(q, block);
  id v23 = +[_ANELog daemon];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v36 = v22;
    id v37 = v20;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v35 = *((unsigned __int8 *)v59 + 24);
    int64_t v38 = [(_ANEProgramForLoad *)self controller];
    id v34 = [v38 device];
    unint64_t v25 = [(_ANEProgramForLoad *)self programHandle];
    unint64_t v26 = [(_ANEProgramForLoad *)self intermediateBufferHandle];
    unsigned int v27 = [(_ANEProgramForLoad *)self queueDepth];
    unsigned int v28 = [(_ANEProgramForLoad *)self numInputs];
    unsigned int v29 = [(_ANEProgramForLoad *)self numOutputs];
    int64_t v30 = [(_ANEProgramForLoad *)self refcount];
    unint64_t v31 = [(_ANEProgramForLoad *)self wiredMemory];
    *(_DWORD *)buf = 138414594;
    id v63 = v24;
    __int16 v64 = 1024;
    unsigned int v65 = v35;
    __int16 v66 = 2048;
    id v67 = v34;
    __int16 v68 = 2048;
    v69 = (ANEProgramInstanceStruct *)v25;
    __int16 v70 = 2048;
    int64_t v71 = v26;
    __int16 v72 = 1024;
    *(_DWORD *)unsigned int v73 = v27;
    *(_WORD *)&v73[4] = 1024;
    *(_DWORD *)&v73[6] = v28;
    LOWORD(v74) = 1024;
    *(_DWORD *)((char *)&v74 + 2) = v29;
    HIWORD(v74) = 2048;
    int64_t v75 = v30;
    __int16 v76 = 2048;
    unint64_t v77 = v31;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%@: END : ok=%d : controller.device=%p : programHandle=%llu : intermediateBufferHandle=%llu : queueDepth=%d : numInputs=%d : numOutputs=%d : refcount=%lld : wiredMemory=%ld", buf, 0x56u);

    id v22 = v36;
    id v20 = v37;
  }
  if (a9) {
    *a9 = (id) v53[5];
  }
  BOOL v32 = *((unsigned char *)v59 + 24) != 0;

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);

  return v32;
}

- (BOOL)destroyProgramInstance
{
  dispatch_queue_t v4 = +[_ANELog daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = [(_ANEProgramForLoad *)self controller];
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v10 device];
    *(_WORD *)&buf[22] = 2048;
    id v23 = [(_ANEProgramForLoad *)self programInstance];
    __int16 v24 = 2048;
    int64_t v25 = [(_ANEProgramForLoad *)self refcount];
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@: START : controller.device=%p : programInstance=%p : refcount=%lld", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v23) = 1;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000066A0;
  block[3] = &unk_10002C710;
  void block[5] = buf;
  block[6] = a2;
  block[4] = self;
  dispatch_sync(q, block);
  uint64_t v6 = +[_ANELog daemon];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    int v12 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
    v13 = [(_ANEProgramForLoad *)self controller];
    id v14 = [v13 device];
    *(_DWORD *)v16 = 138412802;
    id v17 = v11;
    __int16 v18 = 1024;
    int v19 = v12;
    __int16 v20 = 2048;
    id v21 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@: END : ok=%d : controller.device=%p", v16, 0x1Cu);
  }
  char v7 = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v7;
}

- (id)createSymbolMapping
{
  char v3 = [(_ANEProgramForLoad *)self programInstance];

  return [(_ANEProgramForLoad *)self createSymbolMappingForProgram:v3];
}

+ (void)dumpProgramInstance:(ANEProgramInstanceStruct *)a3
{
  dispatch_queue_t v4 = +[_ANELog daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001B9D4();
  }

  v5 = +[_ANELog daemon];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    objc_claimAutoreleasedReturnValue();
    sub_10001B98C();
  }
}

- (id)createSymbolMappingForProgram:(ANEProgramInstanceStruct *)a3
{
  id v47 = [&__NSArray0__struct mutableCopy];
  [(id)objc_opt_class() dumpProgramInstance:a3];
  var5 = a3->var5;
  uint64_t var4 = a3->var4;
  id v50 = [&__NSArray0__struct mutableCopy];
  id v46 = [&__NSArray0__struct mutableCopy];
  if (var4)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 60;
    do
    {
      uint64_t v8 = +[NSString stringWithFormat:@"%s", var5];
      [v50 setObject:v8 atIndexedSubscript:v6];

      if (*(_DWORD *)((char *)a3->var7 + v7)) {
        id v9 = &__kCFBooleanTrue;
      }
      else {
        id v9 = &__kCFBooleanFalse;
      }
      [v46 setObject:v9 atIndexedSubscript:v6++];
      ++var5;
      v7 += 104;
    }
    while (var4 != v6);
  }
  var10 = a3->var10;
  uint64_t var9 = a3->var9;
  id v49 = [&__NSArray0__struct mutableCopy];
  id v45 = [&__NSArray0__struct mutableCopy];
  if (var9)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 64;
    do
    {
      id v14 = +[NSString stringWithFormat:@"%s", var10];
      [v49 setObject:v14 atIndexedSubscript:v12];

      if (*(_DWORD *)((char *)a3->var8 + v13)) {
        v15 = &__kCFBooleanTrue;
      }
      else {
        v15 = &__kCFBooleanFalse;
      }
      [v45 setObject:v15 atIndexedSubscript:v12++];
      ++var10;
      v13 += 104;
    }
    while (var9 != v12);
  }
  uint64_t var12 = a3->var12;
  var13 = a3->var13;
  id v48 = [&__NSDictionary0__struct mutableCopy];
  id v43 = [&__NSDictionary0__struct mutableCopy];
  if (var12)
  {
    for (uint64_t i = 0; i != var12; ++i)
    {
      id v18 = [&__NSDictionary0__struct mutableCopy];
      int v19 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)var13 + 640)];
      [v18 setObject:v19 forKeyedSubscript:off_100032768];
      __int16 v20 = +[NSString stringWithFormat:@"%s", var13];
      [v48 setObject:v19 forKeyedSubscript:v20];
      if (*((_DWORD *)var13 + 641))
      {
        id v21 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
        [v43 setObject:v21 forKeyedSubscript:v20];
      }
      id v22 = +[_ANELog daemon];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        BOOL v32 = NSStringFromSelector(a2);
        int v33 = *((_DWORD *)var13 + 641);
        *(_DWORD *)buf = 138413058;
        id v56 = v32;
        __int16 v57 = 1024;
        int v58 = i;
        __int16 v59 = 2048;
        uint64_t v60 = var13;
        __int16 v61 = 1024;
        int v62 = v33;
        _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@: procedures[%d]=%p, AnalyticsBufferSize=%uBytes", buf, 0x22u);
      }
      id v23 = [&__NSArray0__struct mutableCopy];
      if (*((_DWORD *)var13 + 383))
      {
        unint64_t v24 = 0;
        do
        {
          int64_t v25 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)var13 + v24 + 128)];
          [v23 setObject:v25 atIndexedSubscript:v24];

          ++v24;
        }
        while (v24 < *((unsigned int *)var13 + 383));
      }
      id v26 = [v23 copy];
      [v18 setObject:v26 forKeyedSubscript:off_100032770];

      id v27 = [&__NSArray0__struct mutableCopy];
      if (*((_DWORD *)var13 + 639))
      {
        unint64_t v28 = 0;
        do
        {
          unsigned int v29 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)var13 + v28 + 384)];
          [v27 setObject:v29 atIndexedSubscript:v28];

          ++v28;
        }
        while (v28 < *((unsigned int *)var13 + 639));
      }
      id v30 = [v27 copy];
      [v18 setObject:v30 forKeyedSubscript:off_100032778];

      id v31 = [v18 copy];
      [v47 setObject:v31 atIndexedSubscript:i];

      var13 = (ANEProgramProcedureStruct *)((char *)var13 + 2568);
    }
  }
  if ([v43 count])
  {
    v53[0] = off_100032760;
    id v34 = [v47 copy];
    v54[0] = v34;
    v53[1] = off_100032790;
    id v35 = [v48 copy];
    v54[1] = v35;
    v53[2] = off_100032780;
    id v36 = [v50 copy];
    v54[2] = v36;
    v53[3] = off_100032788;
    id v37 = [v49 copy];
    v54[3] = v37;
    v53[4] = off_100032798;
    id v38 = [v43 copy];
    v54[4] = v38;
    id v39 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:5];
  }
  else
  {
    v51[0] = off_100032760;
    id v34 = [v47 copy];
    v52[0] = v34;
    v51[1] = off_100032790;
    id v35 = [v48 copy];
    v52[1] = v35;
    v51[2] = off_100032780;
    id v36 = [v50 copy];
    v52[2] = v36;
    v51[3] = off_100032788;
    id v37 = [v49 copy];
    v52[3] = v37;
    v51[4] = off_1000327A0;
    id v38 = [v46 copy];
    v52[4] = v38;
    v51[5] = off_1000327A8;
    id v40 = [v45 copy];
    v52[5] = v40;
    id v39 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:6];
  }

  return v39;
}

- (BOOL)prepareChainingRequest:(id)a3 qos:(unsigned int)a4 qIndex:(unint64_t)a5 statsMask:(unsigned int)a6 error:(id *)a7
{
  uint64_t v7 = __chkstk_darwin(self, a2, a3, *(void *)&a4, a5, *(void *)&a6, a7);
  uint64_t v110 = v8;
  v111 = v9;
  int v109 = v10;
  unsigned int v12 = v11;
  aSelector = v13;
  v112 = (void *)v7;
  id v15 = v14;
  v114 = v15;
  unsigned int v17 = [v15 validate];
  unsigned int v18 = v17;
  if ((v17 & 1) == 0)
  {
    BOOL v40 = 0;
    id v41 = 0;
    goto LABEL_46;
  }
  unsigned int v107 = v17;
  int v19 = +[_ANELog common];
  __int16 v106 = v16;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    __int16 v102 = NSStringFromSelector(aSelector);
    *(_DWORD *)v121 = 138413314;
    v122 = v102;
    __int16 v123 = 2048;
    *(void *)v124 = v114;
    *(_WORD *)&v124[8] = 1024;
    unsigned int v125 = v12;
    __int16 v126 = 2048;
    *(void *)v127 = v110;
    *(_WORD *)&v127[8] = 1024;
    int v128 = v109;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%@: prepareChainingRequest : _ANEChainingRequest=%pqos=%x : qIndex=%lu : statsMask=%d", v121, 0x2Cu);
  }
  v113 = v131;
  for (uint64_t i = 56; i != 8248; i += 32)
    *(void *)&v121[i] = 0;
  bzero(v121, 0x160F8uLL);
  id v21 = [v114 inputBuffer];
  v131[2048] = [v21 count];

  for (unsigned int j = 0; ; unsigned int j = v24 + 1)
  {
    id v23 = [v114 inputBuffer];
    uint64_t v24 = j;
    BOOL v25 = (unint64_t)[v23 count] > j;

    if (!v25) {
      break;
    }
    id v26 = [v114 inputBuffer];
    id v27 = [v26 objectAtIndexedSubscript:v24];
    unint64_t v28 = [v27 ioSurfaceObject];
    *(void *)&v131[6 * v24 + 2050] = [v28 ioSurface];

    unsigned int v29 = [v114 inputBuffer];
    id v30 = [v29 objectAtIndexedSubscript:v24];
    id v31 = [v30 symbolIndex];
    v131[6 * v24 + 2052] = [v31 unsignedIntegerValue];

    BOOL v32 = [v114 inputBuffer];
    int v33 = [v32 objectAtIndexedSubscript:v24];
    id v34 = [v33 ioSurfaceObject];
    id v35 = [v34 startOffset];
    v131[6 * v24 + 2055] = [v35 unsignedIntegerValue];

    id v36 = [v114 inputBuffer];
    id v37 = [v36 objectAtIndexedSubscript:v24];
    id v38 = [v37 source];
    if ((unint64_t)v38 >= 5)
    {
      id v39 = +[_ANELog common];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        id v116 = v38;
        __int16 v117 = 2048;
        id v118 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Unknown _ANEChainingBufferSource=%lu using (%lu)", buf, 0x16u);
      }

      LODWORD(v38) = 0;
    }
    v131[6 * v24 + 2053] = v38;
  }
  id v42 = [v114 outputSets];
  v131[3580] = [v42 count];

  for (unsigned int k = 0; ; unsigned int k = v45 + 1)
  {
    id v44 = [v114 outputSets];
    uint64_t v45 = k;
    BOOL v46 = (unint64_t)[v44 count] > k;

    if (!v46) {
      break;
    }
    id v47 = [v114 outputSets];
    id v48 = [v47 objectAtIndexedSubscript:k];
    *(void *)&v131[1540 * k + 3582] = [v48 statsSurRef];

    id v49 = [v114 outputSets];
    id v50 = [v49 objectAtIndexedSubscript:k];
    unsigned int v51 = [v50 outputBuffer];
    uint64_t v52 = &v121[6160 * k];
    *((_DWORD *)v52 + 3598) = [v51 count];

    BOOL v53 = v52 + 14392;
    if (*v53)
    {
      unint64_t v54 = 0;
      id v55 = &v131[1540 * k + 3586];
      do
      {
        id v56 = [v114 outputSets];
        __int16 v57 = [v56 objectAtIndexedSubscript:v45];
        int v58 = [v57 outputBuffer];
        __int16 v59 = [v58 objectAtIndexedSubscript:v54];
        uint64_t v60 = [v59 ioSurfaceObject];
        *(void *)id v55 = [v60 ioSurface];

        __int16 v61 = [v114 outputSets];
        int v62 = [v61 objectAtIndexedSubscript:v45];
        id v63 = [v62 outputBuffer];
        __int16 v64 = [v63 objectAtIndexedSubscript:v54];
        unsigned int v65 = [v64 symbolIndex];
        v55[2] = [v65 unsignedIntegerValue];

        __int16 v66 = [v114 outputSets];
        id v67 = [v66 objectAtIndexedSubscript:v45];
        __int16 v68 = [v67 outputBuffer];
        v69 = [v68 objectAtIndexedSubscript:v54];
        __int16 v70 = [v69 ioSurfaceObject];
        int64_t v71 = [v70 startOffset];
        v55[5] = [v71 unsignedIntegerValue];

        ++v54;
        v55 += 6;
      }
      while (v54 < *v53);
    }
  }
  __int16 v72 = [v114 loopbackInputSymbolIndex];
  unsigned int v73 = [v72 count];

  v131[22062] = v73;
  if (v73)
  {
    uint64_t v74 = 0;
    uint64_t v75 = v73;
    __int16 v76 = &v132;
    do
    {
      unint64_t v77 = [v114 loopbackInputSymbolIndex];
      BOOL v78 = [v77 objectAtIndexedSubscript:v74];
      *((_DWORD *)v76 - 1) = [v78 unsignedIntegerValue];

      uint64_t v79 = [v114 loopbackOutputSymbolIndex];
      v80 = [v79 objectAtIndexedSubscript:v74];
      *(_DWORD *)__int16 v76 = [v80 unsignedIntegerValue];

      ++v74;
      ++v76;
    }
    while (v75 != v74);
  }
  uint64_t v81 = [v114 signalEvents];
  unsigned int v82 = [v81 count];

  unsigned int v130 = v82;
  v83 = [v114 signalEvents];
  BOOL v84 = v83 != 0;

  if (v82) {
    BOOL v85 = v84;
  }
  else {
    BOOL v85 = 0;
  }
  if (v85)
  {
    uint64_t v86 = 0;
    do
    {
      uint64_t v87 = [v114 signalEvents];
      char v88 = [v87 objectAtIndexedSubscript:v86];

      uint64_t v89 = [v88 sharedEvent];
      id v90 = *(void **)v113;
      *(void *)v113 = v89;

      *((void *)v113 + 1) = [v88 value];
      id v91 = [v88 eventType];
      if ((unint64_t)v91 >= 6)
      {
        v92 = +[_ANELog common];
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          id v116 = v91;
          __int16 v117 = 2048;
          id v118 = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "Unknown _ANESignalEventType=%lu using (%lu)", buf, 0x16u);
        }

        LODWORD(v91) = 0;
      }
      v113[4] = v91;
      v113[5] = [v88 symbolIndex];

      ++v86;
      v113 += 8;
    }
    while (v82 != v86);
  }
  int v129 = v110;
  *(void *)&v124[2] = [v112 programHandle];
  __int16 v93 = [v114 procedureIndex];
  unsigned int v125 = [v93 unsignedIntegerValue];

  v94 = [v114 fwEnqueueDelay];
  *(void *)&v127[2] = [v94 unsignedIntegerValue];

  int v128 = v109;
  id v95 = [v112 programInstance];
  if (!v95 || !*(void *)v95)
  {
    int v96 = 2;
    goto LABEL_38;
  }
  int v96 = (*(uint64_t (**)(id, uint8_t *))(*(void *)v95 + 8))(v95, v121);
  if (v96)
  {
LABEL_38:
    v97 = +[_ANELog daemon];
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      id v103 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v104 = [v112 controller];
      id v105 = [v104 device];
      *(_DWORD *)buf = 138412802;
      id v116 = v103;
      __int16 v117 = 2048;
      id v118 = v105;
      __int16 v119 = 1024;
      int v120 = v96;
      _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%@: Could not chaining prepare ANE program=%p : ret=0x%x", buf, 0x1Cu);
    }
    __int16 v98 = +[NSString stringWithFormat:@"ANEProgramChainingPrepare() Failed"];
    unsigned int v99 = +[_ANELog common];
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      sub_10001BA68();
    }

    id v41 = +[_ANEErrors programChainingPrepareErrorForMethod:v98];

    BOOL v40 = 0;
    goto LABEL_43;
  }
  id v41 = 0;
  BOOL v40 = 1;
LABEL_43:
  for (uint64_t m = 8216; m != 24; m -= 32)

  unsigned int v18 = v107;
  v16 = v106;
LABEL_46:
  if (v18)
  {
    if (v111) {
      void *v111 = v41;
    }
  }
  else
  {
    BOOL v40 = 0;
  }

  return v40;
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

- (void)setProgramHandle:(unint64_t)a3
{
  self->_programHandle = a3;
}

- (unint64_t)intermediateBufferHandle
{
  return self->_intermediateBufferHandle;
}

- (void)setIntermediateBufferHandle:(unint64_t)a3
{
  self->_intermediateBufferHandle = a3;
}

- (char)queueDepth
{
  return self->_queueDepth;
}

- (void)setQueueDepth:(char)a3
{
  self->_queueDepth = a3;
}

- (unsigned)numInputs
{
  return self->_numInputs;
}

- (void)setNumInputs:(unsigned __int8)a3
{
  self->_numInputs = a3;
}

- (unsigned)numOutputs
{
  return self->_numOutputs;
}

- (void)setNumOutputs:(unsigned __int8)a3
{
  self->_numOutputs = a3;
}

- (unint64_t)wiredMemory
{
  return self->_wiredMemory;
}

- (void)setWiredMemory:(unint64_t)a3
{
  self->_wiredMemory = a3;
}

- (BOOL)isNewInstance
{
  return self->_isNewInstance;
}

- (void)setIsNewInstance:(BOOL)a3
{
  self->_isNewInstance = a3;
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (_ANEDeviceController)controller
{
  return self->_controller;
}

- (ANEProgramInstanceStruct)programInstance
{
  return self->_programInstance;
}

- (void)setProgramInstance:(ANEProgramInstanceStruct *)a3
{
  self->_programInstance = a3;
}

- (OS_os_transaction)txn
{
  return self->_txn;
}

- (void)setTxn:(id)a3
{
}

- (int64_t)refcount
{
  return self->_refcount;
}

- (void)setRefcount:(int64_t)a3
{
  self->_int64_t refcount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txn, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_q, 0);
}

@end