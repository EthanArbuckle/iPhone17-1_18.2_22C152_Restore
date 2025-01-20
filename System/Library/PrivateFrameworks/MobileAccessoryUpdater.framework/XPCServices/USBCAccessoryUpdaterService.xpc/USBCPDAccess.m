@interface USBCPDAccess
- (BOOL)attemptErrorRecovery:(id)a3 lastAttempt:(BOOL)a4;
- (BOOL)didFailErrorRecovery:(id)a3;
- (PDController)pdController;
- (USBCPDAccess)initWithPDController:(id)a3;
- (id)DeviceInAlternateMode:(BOOL *)a3;
- (id)EnterUpdateMode:(id)a3;
- (id)ExitUpdateMode:(id)a3 remoteReset:(BOOL)a4;
- (id)IECSReadReg:(BOOL)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 returnedBufferLength:(unsigned int *)a7;
- (id)IECSReadReg:(BOOL)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 returnedBufferLength:(unsigned int *)a7 canRetry:(BOOL)a8 canRecover:(BOOL)a9;
- (id)IECSWriteReg:(BOOL)a3 buffer:(const void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6;
- (id)IECSWriteReg:(BOOL)a3 buffer:(const void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 canRetry:(BOOL)a7 canRecover:(BOOL)a8;
- (id)LocalExecuteCommand:(unsigned int)a3;
- (id)LocalExecuteCommand:(unsigned int)a3 withDelay:(unsigned int)a4 canRetry:(BOOL)a5 canRecover:(BOOL)a6;
- (id)LocalIECSReadReg:(void *)a3 bufferLength:(unsigned int)a4 registerAddress:(unsigned int)a5 returnedBufferLength:(unsigned int *)a6;
- (id)LocalIECSWriteReg:(const void *)a3 bufferLength:(unsigned int)a4 registerAddress:(unsigned int)a5;
- (id)RemoteExecuteCommand:(unsigned int)a3;
- (id)RemoteExecuteCommand:(unsigned int)a3 withDelay:(unsigned int)a4;
- (id)RemoteExecuteCommand:(unsigned int)a3 withDelay:(unsigned int)a4 canRetry:(BOOL)a5 canRecover:(BOOL)a6;
- (id)RemoteIECSReadReg:(void *)a3 bufferLength:(unsigned int)a4 registerAddress:(unsigned int)a5 returnedBufferLength:(unsigned int *)a6;
- (id)RemoteIECSWriteReg:(const void *)a3 bufferLength:(unsigned int)a4 registerAddress:(unsigned int)a5;
- (id)VerifyEmptyPortAndReset:(id)a3;
- (id)VerifyEmptyPortAndReset:(id)a3 blessCallback:(id)a4;
- (id)VerifyPowerRole;
- (id)localPollForIdle;
- (id)remotePollForIdle;
- (void)setPdController:(id)a3;
@end

@implementation USBCPDAccess

- (USBCPDAccess)initWithPDController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)USBCPDAccess;
  v6 = [(USBCPDAccess *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pdController, a3);
  }

  return v7;
}

- (BOOL)didFailErrorRecovery:(id)a3
{
  id v3 = a3;
  v4 = v3;
  char v5 = 0;
  if (v3)
  {
    v6 = v3;
    do
    {
      v7 = [v6 userInfo];
      v5 |= (unint64_t)(((uint64_t)[v6 code] >> 8) - 51) < 2;
      uint64_t v8 = [v7 objectForKeyedSubscript:@"Previous Error Response"];

      v6 = (void *)v8;
    }
    while (v8);
  }

  return v5 & 1;
}

- (BOOL)attemptErrorRecovery:(id)a3 lastAttempt:(BOOL)a4
{
  return 1;
}

- (id)LocalIECSReadReg:(void *)a3 bufferLength:(unsigned int)a4 registerAddress:(unsigned int)a5 returnedBufferLength:(unsigned int *)a6
{
  return [(USBCPDAccess *)self IECSReadReg:1 buffer:a3 bufferLength:*(void *)&a4 registerAddress:*(void *)&a5 returnedBufferLength:a6];
}

- (id)LocalIECSWriteReg:(const void *)a3 bufferLength:(unsigned int)a4 registerAddress:(unsigned int)a5
{
  return [(USBCPDAccess *)self IECSWriteReg:1 buffer:a3 bufferLength:*(void *)&a4 registerAddress:*(void *)&a5];
}

- (id)RemoteIECSReadReg:(void *)a3 bufferLength:(unsigned int)a4 registerAddress:(unsigned int)a5 returnedBufferLength:(unsigned int *)a6
{
  return [(USBCPDAccess *)self IECSReadReg:0 buffer:a3 bufferLength:*(void *)&a4 registerAddress:*(void *)&a5 returnedBufferLength:a6];
}

- (id)RemoteIECSWriteReg:(const void *)a3 bufferLength:(unsigned int)a4 registerAddress:(unsigned int)a5
{
  return [(USBCPDAccess *)self IECSWriteReg:0 buffer:a3 bufferLength:*(void *)&a4 registerAddress:*(void *)&a5];
}

- (id)EnterUpdateMode:(id)a3
{
  [(USBCPDAccess *)self doesNotRecognizeSelector:a2];
  return +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:3840 userInfo:0];
}

- (id)ExitUpdateMode:(id)a3 remoteReset:(BOOL)a4
{
  -[USBCPDAccess doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:3840 userInfo:0];
}

- (id)DeviceInAlternateMode:(BOOL *)a3
{
  [(USBCPDAccess *)self doesNotRecognizeSelector:a2];
  return +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:3840 userInfo:0];
}

- (id)IECSReadReg:(BOOL)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 returnedBufferLength:(unsigned int *)a7 canRetry:(BOOL)a8 canRecover:(BOOL)a9
{
  -[USBCPDAccess doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, *(void *)&a5, *(void *)&a6, a7, a8);
  return +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:3840 userInfo:0];
}

- (id)IECSReadReg:(BOOL)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 returnedBufferLength:(unsigned int *)a7
{
  LOBYTE(v8) = 1;
  return [(USBCPDAccess *)self IECSReadReg:a3 buffer:a4 bufferLength:*(void *)&a5 registerAddress:*(void *)&a6 returnedBufferLength:a7 canRetry:1 canRecover:v8];
}

- (id)IECSWriteReg:(BOOL)a3 buffer:(const void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 canRetry:(BOOL)a7 canRecover:(BOOL)a8
{
  -[USBCPDAccess doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, *(void *)&a5, *(void *)&a6, a7, a8);
  return +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:3840 userInfo:0];
}

- (id)IECSWriteReg:(BOOL)a3 buffer:(const void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6
{
  return [(USBCPDAccess *)self IECSWriteReg:a3 buffer:a4 bufferLength:*(void *)&a5 registerAddress:*(void *)&a6 canRetry:1 canRecover:1];
}

- (id)localPollForIdle
{
  HIDWORD(v14) = 4;
  LOBYTE(v14) = 0;
  uint64_t v3 = [(USBCPDAccess *)self IECSReadReg:1 buffer:v15 bufferLength:4 registerAddress:8 returnedBufferLength:(char *)&v14 + 4 canRetry:0 canRecover:v14];
  if (v3)
  {
    v4 = (void *)v3;
    unsigned int v5 = 0;
LABEL_3:
    if (v5 <= 0x31)
    {
      v6 = +[NSMutableDictionary dictionary];
      [v6 setObject:v4 forKeyedSubscript:@"Previous Error Response"];
      uint64_t v7 = 5632;
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  unsigned int v5 = 0;
  while (1)
  {
    if (HIDWORD(v14) == 4)
    {
      if (!v15[0])
      {
        v4 = 0;
        goto LABEL_6;
      }
      if (v15[0] == 1145914145)
      {
        v11 = +[NSMutableDictionary dictionary];
        [v11 setObject:@"got nCMD" forKeyedSubscript:@"Notes"];
        uint64_t v12 = 5633;
LABEL_26:
        v4 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:v12 userInfo:v11];

        goto LABEL_6;
      }
      if (v5 >= 0x10) {
        break;
      }
    }
    if (v5 < 0xA)
    {
      usleep(0x3E8u);
      v4 = 0;
      ++v5;
      goto LABEL_20;
    }
    v4 = 0;
LABEL_19:
    usleep(0x2710u);
    if (++v5 == 51)
    {
      if (v4) {
        goto LABEL_6;
      }
      v11 = +[NSMutableDictionary dictionary];
      [v11 setObject:0 forKeyedSubscript:@"Previous Error Response"];
      uint64_t v12 = 5634;
      goto LABEL_26;
    }
LABEL_20:

    HIDWORD(v14) = 4;
    LOBYTE(v14) = 0;
    uint64_t v10 = [(USBCPDAccess *)self IECSReadReg:1 buffer:v15 bufferLength:4 registerAddress:8 returnedBufferLength:(char *)&v14 + 4 canRetry:0 canRecover:v14];
    if (v10)
    {
      v4 = (void *)v10;
      goto LABEL_3;
    }
  }
  BYTE3(v14) = 1;
  v4 = [(USBCPDAccess *)self DeviceInAlternateMode:(char *)&v14 + 3];
  if (BYTE3(v14)) {
    goto LABEL_19;
  }
  v13 = +[NSMutableDictionary dictionary];
  v6 = v13;
  if (v4) {
    [v13 setObject:v4 forKeyedSubscript:@"Previous Error Response"];
  }
  [v6 setObject:@"Not in alternate mode" forKeyedSubscript:@"Notes"];
  uint64_t v7 = 6913;
LABEL_5:
  uint64_t v8 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:v7 userInfo:v6];

  v4 = (void *)v8;
LABEL_6:
  return v4;
}

- (id)remotePollForIdle
{
  unsigned int v3 = 0;
  v4 = 0;
  memset(v15, 0, sizeof(v15));
  do
  {
    unsigned int v5 = v4;
    int v14 = 4;
    LOBYTE(v12) = 0;
    v4 = [(USBCPDAccess *)self IECSReadReg:0 buffer:v15 bufferLength:4 registerAddress:8 returnedBufferLength:&v14 canRetry:0 canRecover:v12];

    if (!v4 && v14 == 4)
    {
      if (!LODWORD(v15[0])) {
        goto LABEL_19;
      }
      if (LODWORD(v15[0]) == 1145914145)
      {
        uint64_t v7 = +[NSMutableDictionary dictionary];
        [v7 setObject:@"got nCMD" forKeyedSubscript:@"Notes"];
        uint64_t v8 = 5889;
        goto LABEL_15;
      }
    }
    if (v3 >= 6)
    {
      char v13 = 0;
      v6 = [(USBCPDAccess *)self DeviceInAlternateMode:&v13];

      if (v6) {
        goto LABEL_16;
      }
      if (!v13)
      {
        v6 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6912 userInfo:0];
        if (!v6) {
          goto LABEL_19;
        }
LABEL_17:
        objc_super v9 = +[NSMutableDictionary dictionary];
        [v9 setObject:v6 forKeyedSubscript:@"Previous Error Response"];
        uint64_t v10 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:5888 userInfo:v9];

        goto LABEL_20;
      }
      v4 = 0;
    }
    usleep(0x2710u);
    usleep(0x3E8u);
    ++v3;
  }
  while (v3 != 51);
  v6 = [(USBCPDAccess *)self LocalExecuteCommand:1414677057];

  usleep(0x4C4B40u);
  if (v6) {
    goto LABEL_17;
  }
  uint64_t v7 = +[NSMutableDictionary dictionary];
  uint64_t v8 = 5890;
LABEL_15:
  v6 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:v8 userInfo:v7];

LABEL_16:
  if (v6) {
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v10 = 0;
LABEL_20:
  return v10;
}

- (id)LocalExecuteCommand:(unsigned int)a3
{
  return [(USBCPDAccess *)self LocalExecuteCommand:*(void *)&a3 withDelay:0 canRetry:1 canRecover:a3 != 1414677057];
}

- (id)LocalExecuteCommand:(unsigned int)a3 withDelay:(unsigned int)a4 canRetry:(BOOL)a5 canRecover:(BOOL)a6
{
  BOOL v6 = a6;
  int v9 = 0;
  uint64_t v10 = 0;
  uint64_t v26 = HIBYTE(a3);
  memset(v30, 0, sizeof(v30));
  long long v29 = 0u;
  long long v28 = 0u;
  uint64_t v25 = BYTE2(a3);
  uint64_t v11 = BYTE1(a3);
  uint64_t v12 = a3;
  unsigned int v13 = a3 & 0xFF000000 | (BYTE2(a3) << 16) | (BYTE1(a3) << 8) | a3;
  do
  {
    unsigned int v27 = v13;
    int v14 = [(USBCPDAccess *)self IECSWriteReg:1 buffer:&v27 bufferLength:4 registerAddress:8 canRetry:a5 canRecover:v6];

    if (v14)
    {
      v15 = +[NSMutableDictionary dictionary];
      [v15 setObject:v14 forKeyedSubscript:@"Previous Error Response"];
      v16 = +[NSString stringWithFormat:@"%c%c%c%c (register write)", v12, v11, v25, v26];
      [v15 setObject:v16 forKeyedSubscript:@"Command Attempted"];

      uint64_t v10 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:5123 userInfo:v15];

      usleep(0x2710u);
      if (!v10) {
        goto LABEL_17;
      }
    }
    else
    {
      usleep(a4);
      uint64_t v17 = [(USBCPDAccess *)self localPollForIdle];
      if (!v17)
      {
        uint64_t v10 = 0;
        goto LABEL_17;
      }
      v18 = (void *)v17;
      v19 = +[NSMutableDictionary dictionary];
      [v19 setObject:v18 forKeyedSubscript:@"Previous Error Response"];
      v20 = +[NSString stringWithFormat:@"%c%c%c%c (idle after)", v12, v11, v25, v26];
      [v19 setObject:v20 forKeyedSubscript:@"Command Attempted"];

      uint64_t v10 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:5122 userInfo:v19];

      if (!v10) {
        goto LABEL_17;
      }
    }
    if (v6 && ![(USBCPDAccess *)self didFailErrorRecovery:v10])
    {
      if (![(USBCPDAccess *)self attemptErrorRecovery:v10 lastAttempt:v9 == 3]) {
        break;
      }
    }
    else if (!a5)
    {
      break;
    }
    if (v9 == 3) {
      goto LABEL_17;
    }
    ++v9;
    a5 = 1;
  }
  while (![(USBCPDAccess *)self didFailErrorRecovery:v10]);
  if (v9 == 3)
  {
    v21 = +[NSMutableDictionary dictionary];
    [v21 setObject:v10 forKeyedSubscript:@"Previous Error Response"];
    uint64_t v22 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13064 userInfo:v21];

    uint64_t v10 = (void *)v22;
  }
LABEL_17:
  return v10;
}

- (id)RemoteExecuteCommand:(unsigned int)a3
{
  return [(USBCPDAccess *)self RemoteExecuteCommand:*(void *)&a3 withDelay:0 canRetry:1 canRecover:1];
}

- (id)RemoteExecuteCommand:(unsigned int)a3 withDelay:(unsigned int)a4
{
  return [(USBCPDAccess *)self RemoteExecuteCommand:*(void *)&a3 withDelay:*(void *)&a4 canRetry:1 canRecover:1];
}

- (id)RemoteExecuteCommand:(unsigned int)a3 withDelay:(unsigned int)a4 canRetry:(BOOL)a5 canRecover:(BOOL)a6
{
  BOOL v6 = a6;
  int v9 = 0;
  uint64_t v10 = 0;
  uint64_t v27 = HIBYTE(a3);
  memset(v31, 0, sizeof(v31));
  long long v30 = 0u;
  long long v29 = 0u;
  unsigned int v11 = a4 - 1;
  if (!a4) {
    unsigned int v11 = 0;
  }
  useconds_t v25 = v11;
  uint64_t v26 = BYTE2(a3);
  uint64_t v12 = BYTE1(a3);
  uint64_t v13 = a3;
  unsigned int v14 = a3 & 0xFF000000 | (BYTE2(a3) << 16) | (BYTE1(a3) << 8) | a3;
  while (1)
  {
    unsigned int v28 = v14;
    v15 = [(USBCPDAccess *)self IECSWriteReg:0 buffer:&v28 bufferLength:4 registerAddress:8 canRetry:a5 canRecover:v6];

    if (!v15) {
      break;
    }
    v16 = +[NSMutableDictionary dictionary];
    [v16 setObject:v15 forKeyedSubscript:@"Previous Error Response"];
    uint64_t v17 = +[NSString stringWithFormat:@"%c%c%c%c (register write)", v13, v12, v26, v27];
    [v16 setObject:v17 forKeyedSubscript:@"Command Attempted"];

    uint64_t v10 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:5379 userInfo:v16];

    usleep(0);
    if (!v10) {
      goto LABEL_19;
    }
    if (v6 && ![(USBCPDAccess *)self didFailErrorRecovery:v10])
    {
      if (![(USBCPDAccess *)self attemptErrorRecovery:v10 lastAttempt:v9 == 3]) {
        goto LABEL_16;
      }
    }
    else if (!a5)
    {
      goto LABEL_16;
    }
    if (v9 == 3) {
      goto LABEL_19;
    }
    ++v9;
    a5 = 1;
    if ([(USBCPDAccess *)self didFailErrorRecovery:v10]) {
      goto LABEL_16;
    }
  }
  usleep(v25);
  uint64_t v18 = [(USBCPDAccess *)self remotePollForIdle];
  if (!v18)
  {
    uint64_t v10 = 0;
    goto LABEL_19;
  }
  v19 = (void *)v18;
  v20 = +[NSMutableDictionary dictionary];
  [v20 setObject:v19 forKeyedSubscript:@"Previous Error Response"];
  v21 = +[NSString stringWithFormat:@"%c%c%c%c (idle after)", v13, v12, v26, v27];
  [v20 setObject:v21 forKeyedSubscript:@"Command Attempted"];

  uint64_t v10 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:5378 userInfo:v20];

  if (!v10) {
    goto LABEL_19;
  }
LABEL_16:
  if (v9 == 3)
  {
    uint64_t v22 = +[NSMutableDictionary dictionary];
    [v22 setObject:v10 forKeyedSubscript:@"Previous Error Response"];
    uint64_t v23 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13065 userInfo:v22];

    uint64_t v10 = (void *)v23;
  }
LABEL_19:
  return v10;
}

- (id)VerifyPowerRole
{
  return 0;
}

- (id)VerifyEmptyPortAndReset:(id)a3 blessCallback:(id)a4
{
  return 0;
}

- (id)VerifyEmptyPortAndReset:(id)a3
{
  return [(USBCPDAccess *)self VerifyEmptyPortAndReset:a3 blessCallback:0];
}

- (PDController)pdController
{
  return self->_pdController;
}

- (void)setPdController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end