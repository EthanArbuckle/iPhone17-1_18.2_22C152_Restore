@interface TSDDaemonServiceServerExported
- (TSDDaemonServiceServer)object;
- (int)processID;
- (void)callMethodForDaemonClient:(unsigned int)a3 clientMethodSelector:(unsigned int)a4 scalarInputs:(ScalarArgsArray *)a5 structInput:(id)a6 scalarOutputCount:(unsigned int)a7 reply:(id)a8;
- (void)closeDaemonClient:(unsigned int)a3 reply:(id)a4;
- (void)openDaemonClientWithRegistryEntryID:(unint64_t)a3 clientType:(unsigned int)a4 reply:(id)a5;
- (void)propertiesForRegistryEntryID:(unint64_t)a3 signpostID:(unint64_t)a4 reply:(id)a5;
- (void)propertyForRegistryEntryID:(unint64_t)a3 signpostID:(unint64_t)a4 key:(id)a5 reply:(id)a6;
- (void)setObject:(id)a3;
- (void)setProcessID:(int)a3;
@end

@implementation TSDDaemonServiceServerExported

- (void)openDaemonClientWithRegistryEntryID:(unint64_t)a3 clientType:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v8 = (void (**)(id, id, id))a5;
  if (qword_100047CF0)
  {
    uint64_t processID = self->_processID;
    id v12 = 0;
    id v10 = [(id)qword_100047CF0 openDaemonClient:processID withRegistryEntryID:a3 clientType:v5 error:&v12];
    id v11 = v12;
    v8[2](v8, v10, v11);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open daemon client registryEntryID  %llu", buf, 0xCu);
    }
    id v11 = +[NSError errorWithDomain:@"TSErrorDomain" code:-536870201 userInfo:0];
    v8[2](v8, 0, v11);
  }
}

- (void)closeDaemonClient:(unsigned int)a3 reply:(id)a4
{
  uint64_t v5 = (void *)qword_100047CF0;
  if (qword_100047CF0)
  {
    uint64_t v6 = *(void *)&a3;
    uint64_t processID = self->_processID;
    id v13 = 0;
    v8 = (void (**)(id, id, id))a4;
    id v9 = [v5 closeDaemonClient:processID daemonClientID:v6 error:&v13];
    id v10 = v13;
    v8[2](v8, v9, v10);
  }
  else
  {
    id v11 = a4;
    id v12 = +[NSError errorWithDomain:@"TSErrorDomain" code:-536870201 userInfo:0];
    (*((void (**)(id, void, id))a4 + 2))(v11, 0, v12);
  }
}

- (void)callMethodForDaemonClient:(unsigned int)a3 clientMethodSelector:(unsigned int)a4 scalarInputs:(ScalarArgsArray *)a5 structInput:(id)a6 scalarOutputCount:(unsigned int)a7 reply:(id)a8
{
  uint64_t v11 = *(void *)&a4;
  uint64_t v12 = *(void *)&a3;
  id v13 = a6;
  id v14 = a8;
  v15 = (void *)qword_100047CF0;
  if (!qword_100047CF0)
  {
    v17 = +[NSError errorWithDomain:@"TSErrorDomain" code:-536870201 userInfo:0];
    (*((void (**)(id, void, void, void *))v14 + 2))(v14, 0, 0, v17);

    goto LABEL_26;
  }
  memset(v26, 0, sizeof(v26));
  uint64_t v27 = a7;
  if (a5)
  {
    uint64_t var1 = a5->var1;
    if (!var1) {
      a5 = 0;
    }
  }
  else
  {
    uint64_t var1 = 0;
  }
  if (!v13)
  {
    id v18 = 0;
LABEL_15:
    id v19 = 0;
    goto LABEL_16;
  }
  if ([v13 length]) {
    id v18 = [v13 bytes];
  }
  else {
    id v18 = 0;
  }
  if (![v13 length]) {
    goto LABEL_15;
  }
  id v19 = [v13 length];
LABEL_16:
  if (a7) {
    v20 = v26;
  }
  else {
    v20 = 0;
  }
  if (a7) {
    v21 = &v27;
  }
  else {
    v21 = 0;
  }
  id v25 = 0;
  id v22 = [v15 callMethodForDaemonClient:v12 clientMethodSelector:v11 scalarInputs:a5 scalarInputCount:var1 structInput:v18 structInputSize:v19 scalarOutputs:v20 scalarOutputCount:v21 error:&v25];
  id v23 = v25;
  if ((v22 & (v27 != 0)) != 0) {
    v24 = v26;
  }
  else {
    v24 = 0;
  }
  (*((void (**)(id, id, _OWORD *, id))v14 + 2))(v14, v22, v24, v23);

LABEL_26:
}

- (void)propertyForRegistryEntryID:(unint64_t)a3 signpostID:(unint64_t)a4 key:(id)a5 reply:(id)a6
{
  id v8 = a5;
  id v9 = (void (**)(id, void *))a6;
  id v10 = +[IOKService entryIDMatching:a3];
  uint64_t v11 = +[IOKService matchingService:v10];

  if (v11)
  {
    uint64_t v12 = [v11 propertyForKey:v8];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136316418;
      id v14 = "service != nil";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      v20 = &unk_100030E47;
      __int16 v21 = 2080;
      id v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/XPC/TSDDaemonServiceServer.m";
      __int16 v23 = 1024;
      int v24 = 380;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v13, 0x3Au);
    }
    uint64_t v12 = 0;
  }
  v9[2](v9, v12);
}

- (void)propertiesForRegistryEntryID:(unint64_t)a3 signpostID:(unint64_t)a4 reply:(id)a5
{
  uint64_t v6 = (void (**)(id, void *))a5;
  v7 = +[IOKService entryIDMatching:a3];
  id v8 = +[IOKService matchingService:v7];

  if (v8)
  {
    id v9 = [v8 properties];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316418;
      uint64_t v11 = "service != nil";
      __int16 v12 = 2048;
      uint64_t v13 = 0;
      __int16 v14 = 2048;
      uint64_t v15 = 0;
      __int16 v16 = 2080;
      __int16 v17 = &unk_100030E47;
      __int16 v18 = 2080;
      __int16 v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/XPC/TSDDaemonServiceServer.m";
      __int16 v20 = 1024;
      int v21 = 395;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v10, 0x3Au);
    }
    id v9 = 0;
  }
  v6[2](v6, v9);
}

- (TSDDaemonServiceServer)object
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  return (TSDDaemonServiceServer *)WeakRetained;
}

- (void)setObject:(id)a3
{
}

- (int)processID
{
  return self->_processID;
}

- (void)setProcessID:(int)a3
{
  self->_uint64_t processID = a3;
}

- (void).cxx_destruct
{
}

@end