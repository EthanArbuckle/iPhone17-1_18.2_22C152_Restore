@interface MIBUSMCHelper
- (BOOL)isKeySupported:(id)a3;
- (MIBUSMCHelper)init;
- (id)readSMCKey:(id)a3 error:(id *)a4;
- (unsigned)_openAppleSMC:(id *)a3;
- (unsigned)_smcKeyFromString:(id)a3;
- (unsigned)connection;
- (void)_closeAppleSMC:(id *)a3;
- (void)dealloc;
- (void)openAppleSMC:(id *)a3;
- (void)setConnection:(unsigned int)a3;
- (void)writeSMCKey:(id)a3 data:(id)a4 error:(id *)a5;
@end

@implementation MIBUSMCHelper

- (MIBUSMCHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUSMCHelper;
  v2 = [(MIBUSMCHelper *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MIBUSMCHelper *)v2 setConnection:0];
  }
  return v3;
}

- (void)dealloc
{
  if ([(MIBUSMCHelper *)self connection])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000595F0);
    }
    v3 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Closing SMC connection...", buf, 2u);
    }
    id v7 = 0;
    [(MIBUSMCHelper *)self _closeAppleSMC:&v7];
    id v4 = v7;
    if (!v4)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059610);
      }
      objc_super v5 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully closed SMC connection", buf, 2u);
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)MIBUSMCHelper;
  [(MIBUSMCHelper *)&v6 dealloc];
}

- (void)openAppleSMC:(id *)a3
{
  if (![(MIBUSMCHelper *)self connection])
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059630);
    }
    objc_super v5 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Opening io connection to SMC ...", buf, 2u);
    }
    id v4 = 0;
    int v6 = 1;
    while (1)
    {
      id v7 = v4;
      id v12 = v4;
      uint64_t v8 = [(MIBUSMCHelper *)self _openAppleSMC:&v12];
      id v4 = v12;

      [(MIBUSMCHelper *)self setConnection:v8];
      if ([(MIBUSMCHelper *)self connection])
      {
        if (!v4) {
          break;
        }
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059670);
      }
      v9 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        int v14 = v6;
        __int16 v15 = 1024;
        int v16 = 3;
        __int16 v17 = 1024;
        int v18 = 1;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to open SMC, attempt %d/%d, retrying in %ds...", buf, 0x14u);
      }
      sleep(1u);
      if (++v6 == 4) {
        goto LABEL_3;
      }
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059650);
    }
    v10 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Successfully opened io connection to SMC", buf, 2u);
    }
  }
  id v4 = 0;
LABEL_3:
  if (a3) {
    *a3 = v4;
  }
}

- (BOOL)isKeySupported:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  objc_super v5 = [(MIBUSMCHelper *)self readSMCKey:v4 error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = [v6 code] != (id)2684354561;
  }
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_100059690);
  }
  v9 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v13 = v4;
    __int16 v14 = 1024;
    BOOL v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ SMC Key is supported: %{BOOL}d", buf, 0x12u);
  }

  return v8;
}

- (id)readSMCKey:(id)a3 error:(id *)a4
{
  kern_return_t v8;
  uint64_t v9;
  kern_return_t v10;
  id v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id *v23;
  NSObject *v24;
  uint64_t v25;
  size_t outputStructCnt;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  kern_return_t v30;
  __int16 v31;
  int v32;
  long long outputStruct;
  long long v34;
  long long v35;
  long long v36;
  long long v37;
  long long v38;
  long long v39;
  long long v40;
  long long v41;
  long long v42;
  uint64_t v43;
  void inputStruct[21];
  uint64_t vars8;

  id v6 = a3;
  outputStructCnt = 168;
  memset(inputStruct, 0, sizeof(inputStruct));
  v43 = 0;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  outputStruct = 0u;
  v34 = 0u;
  unsigned int v7 = [(MIBUSMCHelper *)self _smcKeyFromString:v6];
  if ([(MIBUSMCHelper *)self connection])
  {
    memset((char *)inputStruct + 4, 0, 164);
    outputStruct = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0;
    LODWORD(inputStruct[0]) = v7;
    BYTE2(inputStruct[5]) = 9;
    BOOL v8 = IOConnectCallStructMethod([(MIBUSMCHelper *)self connection], 2u, inputStruct, 0xA8uLL, &outputStruct, &outputStructCnt);
    if (v8 || BYTE8(v35))
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_1000596D0);
      }
      v20 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v28 = v6;
        v29 = 1024;
        v30 = v8;
        v31 = 1024;
        v32 = BYTE8(v35);
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to read info for key: %{public}@; ret: 0x%X; smc ret: 0x%X",
          buf,
          0x18u);
      }
      int v18 = 2684354561;
      v25 = (uint64_t)v6;
      v19 = @"Failed to read info for key: %@; ret: 0x%X; smc ret: 0x%X";
    }
    else
    {
      v9 = HIDWORD(v34);
      if (HIDWORD(v34) >= 0x79)
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_1000596F0);
        }
        v21 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003E4E4((uint64_t)v6, v9, v21);
        }
        v25 = (uint64_t)v6;
        v19 = @"Key %@ has size %d which exceeds maximum expected size of %d";
LABEL_38:
        v23 = a4;
        int v18 = 2684354562;
        goto LABEL_39;
      }
      memset((char *)inputStruct + 4, 0, 164);
      outputStruct = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0;
      LODWORD(inputStruct[0]) = v7;
      HIDWORD(inputStruct[3]) = v9;
      BYTE2(inputStruct[5]) = 5;
      v10 = IOConnectCallStructMethod([(MIBUSMCHelper *)self connection], 2u, inputStruct, 0xA8uLL, &outputStruct, &outputStructCnt);
      if (!v10 && !BYTE8(v35))
      {
        if (HIDWORD(v34) <= v9)
        {
          id v11 = [objc_alloc((Class)NSData) initWithBytes:&v36 length:v9];
          goto LABEL_9;
        }
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100059730);
        }
        v24 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v28 = v6;
          v29 = 1024;
          v30 = HIDWORD(v34);
          v31 = 1024;
          v32 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Key %{public}@ has size %d which exceeds expected size of %d", buf, 0x18u);
        }
        v25 = (uint64_t)v6;
        v19 = @"Key %@ has size %d which exceeds expected size of %d";
        goto LABEL_38;
      }
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059710);
      }
      v22 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v28 = v6;
        v29 = 1024;
        v30 = v10;
        v31 = 1024;
        v32 = BYTE8(v35);
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to read key: %{public}@; ret: 0x%X; smc ret: 0x%X",
          buf,
          0x18u);
      }
      int v18 = 2684354563;
      v25 = (uint64_t)v6;
      v19 = @"Failed to read key: %@; ret: 0x%X; smc ret: 0x%X";
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000596B0);
    }
    id v13 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E46C((uint64_t)v6, v13);
    }
    int v18 = 2684354563;
    v25 = (uint64_t)v6;
    v19 = @"Failed to read SMC key: %@; no open SMC connection";
  }
  v23 = a4;
LABEL_39:
  sub_1000102B8(v23, v18, 0, v19, v14, v15, v16, v17, v25);
  id v11 = 0;
LABEL_9:

  return v11;
}

- (void)writeSMCKey:(id)a3 data:(id)a4 error:(id *)a5
{
  kern_return_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  size_t outputStructCnt;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void v29[2];
  _OWORD outputStruct[2];
  long long v31;
  long long v32;
  long long v33;
  unsigned int inputStruct;
  long long v35;
  long long v36;
  _DWORD v37[11];

  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = [(MIBUSMCHelper *)self _smcKeyFromString:v8];
  outputStructCnt = 80;
  if ((unint64_t)[v9 length] >= 0x21)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059750);
    }
    BOOL v15 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E578((uint64_t)v8, (uint64_t)v9, v15);
    }
    sub_1000102B8(a5, 2684354564, 0, @"Failed to write key: %@; data %@ exceeds maximum allowed length: %d",
      v16,
      v17,
      v18,
      v19,
      (uint64_t)v8);
  }
  else
  {
    memset(v37, 0, sizeof(v37));
    v36 = 0u;
    v35 = 0u;
    memset(outputStruct, 0, sizeof(outputStruct));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    inputStruct = v10;
    BYTE2(v37[1]) = 6;
    DWORD2(v36) = [v9 length];
    if ([v9 length])
    {
      unint64_t v11 = 0;
      do
      {
        id v12 = v9;
        *((unsigned char *)&v37[3] + v11) = *((unsigned char *)[v12 bytes] + v11);
        ++v11;
      }
      while (v11 < (unint64_t)[v12 length]);
    }
    id v13 = IOConnectCallStructMethod([(MIBUSMCHelper *)self connection], 2u, &inputStruct, 0x50uLL, outputStruct, &outputStructCnt);
    if (v13 || BYTE8(v31))
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059770);
      }
      v20 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v27 = v8;
        v28 = 1024;
        LODWORD(v29[0]) = v13;
        WORD2(v29[0]) = 1024;
        *(_DWORD *)((char *)v29 + 6) = BYTE8(v31);
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to write key: %{public}@; ret: 0x%X; smc ret: 0x%X",
          buf,
          0x18u);
      }
      sub_1000102B8(a5, 2684354564, 0, @"Failed to write key: %@; ret: 0x%X; smc ret: 0x%X",
        v21,
        v22,
        v23,
        v24,
        (uint64_t)v8);
    }
    else
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059790);
      }
      __int16 v14 = qword_10006C950;
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v27 = v8;
        v28 = 2114;
        v29[0] = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Successfully written key %{public}@ with data: %{public}@", buf, 0x16u);
      }
    }
  }
}

- (unsigned)_openAppleSMC:(id *)a3
{
  io_connect_t connect = 0;
  CFDictionaryRef v4 = IOServiceMatching("AppleSMC");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
  if (MatchingService)
  {
    io_object_t v6 = MatchingService;
    uint64_t v7 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    IOObjectRelease(v6);
    if (v7) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = connect == 0;
    }
    if (v8)
    {
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_1000597D0);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003E694();
      }
      sub_1000102B8(a3, 2684354560, 0, @"Failed to open service port to SMC; ret: %d", v16, v17, v18, v19, v7);
    }
    else
    {
      uint64_t v9 = IOConnectCallScalarMethod(connect, 0, 0, 0, 0, 0);
      if (v9)
      {
        uint64_t v20 = v9;
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_1000597F0);
        }
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003E6FC();
        }
        sub_1000102B8(a3, 2684354560, 0, @"Failed to send user client open command to SMC; ret: %d",
          v21,
          v22,
          v23,
          v24,
          v20);
      }
    }
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000597B0);
    }
    unint64_t v11 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E610(v11);
    }
    sub_1000102B8(a3, 2684354560, 0, @"Failed to find matching io service to %s", v12, v13, v14, v15, (uint64_t)"AppleSMC");
  }
  return connect;
}

- (void)_closeAppleSMC:(id *)a3
{
  uint64_t v5 = IOConnectCallScalarMethod([(MIBUSMCHelper *)self connection], 1u, 0, 0, 0, 0);
  if (v5)
  {
    uint64_t v7 = v5;
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_100059810);
    }
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E7CC();
    }
    sub_1000102B8(a3, 2684354565, 0, @"Failed to send user client close command to SMC; ret: %d",
      v8,
      v9,
      v10,
      v11,
      v7);
  }
  else
  {
    uint64_t v6 = IOServiceClose([(MIBUSMCHelper *)self connection]);
    if (v6)
    {
      uint64_t v12 = v6;
      if (qword_10006C958 != -1) {
        dispatch_once(&qword_10006C958, &stru_100059830);
      }
      if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
        sub_10003E764();
      }
      sub_1000102B8(a3, 2684354565, 0, @"Failed to close service port to SMC; ret: %d",
        v13,
        v14,
        v15,
        v16,
        v12);
    }
  }
}

- (unsigned)_smcKeyFromString:(id)a3
{
  uint64_t v4 = 0;
  unsigned int v5 = 0;
  do
    unsigned int v5 = [a3 characterAtIndex:v4++] | (v5 << 8);
  while (v4 != 4);
  return v5;
}

- (unsigned)connection
{
  return self->_connection;
}

- (void)setConnection:(unsigned int)a3
{
  self->_connection = a3;
}

@end