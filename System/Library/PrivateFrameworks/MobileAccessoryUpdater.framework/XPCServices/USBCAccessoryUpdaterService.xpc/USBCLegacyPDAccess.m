@interface USBCLegacyPDAccess
- (BOOL)attemptErrorRecovery:(id)a3 lastAttempt:(BOOL)a4;
- (USBCLegacyPDAccess)initWithPDController:(id)a3;
- (id)DeviceAttached:(BOOL *)a3;
- (id)DeviceInAlternateMode:(BOOL *)a3;
- (id)EnterUpdateMode:(id)a3;
- (id)ExitUpdateMode:(id)a3 remoteReset:(BOOL)a4;
- (id)IECSReadReg:(BOOL)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 returnedBufferLength:(unsigned int *)a7 canRetry:(BOOL)a8 canRecover:(BOOL)a9;
- (id)IECSWriteReg:(BOOL)a3 buffer:(const void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 canRetry:(BOOL)a7 canRecover:(BOOL)a8;
- (id)VerifyEmptyPortAndReset:(id)a3 blessCallback:(id)a4;
- (id)getVDM:(unsigned int *)a3 ofLength:(unsigned int *)a4;
- (id)readIECSRegister:(void *)a3 ofLength:(unsigned int)a4 atRegister:(unsigned int)a5 andOutReadLength:(unsigned int *)a6;
- (id)sendVDM:(unsigned int *)a3 ofLength:(unsigned int)a4;
- (id)waitForVDMAck:(unsigned int *)a3 count:(unsigned int)a4 retry:(BOOL *)a5 command:(unsigned __int8)a6 checkLength:(BOOL)a7;
- (id)writeIECSRegister:(const void *)a3 ofLength:(unsigned int)a4 atRegister:(unsigned int)a5;
- (unsigned)cached_sequence_num;
- (unsigned)streamSequenceNumber;
- (void)setCached_sequence_num:(unsigned __int8)a3;
- (void)setStreamSequenceNumber:(unsigned __int8)a3;
@end

@implementation USBCLegacyPDAccess

- (USBCLegacyPDAccess)initWithPDController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)USBCLegacyPDAccess;
  v3 = [(USBCPDAccess *)&v6 initWithPDController:a3];
  v4 = v3;
  if (v3)
  {
    [(USBCLegacyPDAccess *)v3 setCached_sequence_num:255];
    [(USBCLegacyPDAccess *)v4 setStreamSequenceNumber:0];
  }
  return v4;
}

- (id)EnterUpdateMode:(id)a3
{
  return 0;
}

- (id)ExitUpdateMode:(id)a3 remoteReset:(BOOL)a4
{
  if (a3) {
    (*((void (**)(id, uint64_t, const __CFString *, BOOL))a3 + 2))(a3, 7, @"NOT issuing 'Gaid'... intentionally disabled for now (policy decision)", a4);
  }
  return 0;
}

- (id)DeviceAttached:(BOOL *)a3
{
  int v10 = 4;
  int v11 = 0;
  uint64_t v4 = [(USBCPDAccess *)self LocalIECSReadReg:&v11 bufferLength:4 registerAddress:126 returnedBufferLength:&v10];
  v5 = (void *)v4;
  LOBYTE(v6) = 0;
  if (v4)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unsigned int v6 = (0x3001u >> (v11 - 109)) & 1;
  if ((v11 - 109) > 0xD) {
    LOBYTE(v6) = 0;
  }
  if (a3) {
LABEL_3:
  }
    *a3 = v6;
LABEL_4:
  if (v4)
  {
    v7 = +[NSMutableDictionary dictionary];
    [v7 setObject:v5 forKeyedSubscript:@"Previous Error Response"];
    v8 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6656 userInfo:v7];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)DeviceInAlternateMode:(BOOL *)a3
{
  int v13 = 4;
  int v14 = 0;
  LOBYTE(v12) = 0;
  uint64_t v5 = [(USBCLegacyPDAccess *)self IECSReadReg:1 buffer:&v14 bufferLength:4 registerAddress:126 returnedBufferLength:&v13 canRetry:0 canRecover:v12];
  if (v5) {
    goto LABEL_8;
  }
  if ((v14 - 109) > 0xD || ((1 << (v14 - 109)) & 0x3001) == 0)
  {
    BOOL v8 = 0;
    v7 = 0;
    if (!a3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  HIDWORD(v12) = 1;
  int v13 = 4;
  uint64_t v5 = [(USBCLegacyPDAccess *)self IECSWriteReg:1 buffer:(char *)&v12 + 4 bufferLength:4 registerAddress:9 canRetry:0 canRecover:0];
  if (v5
    || ([(USBCPDAccess *)self LocalExecuteCommand:1835292245 withDelay:0 canRetry:0 canRecover:0], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
LABEL_8:
    v7 = (void *)v5;
    goto LABEL_9;
  }
  int v13 = 4;
  LOBYTE(v12) = 0;
  v7 = [(USBCLegacyPDAccess *)self IECSReadReg:1 buffer:(char *)&v12 + 4 bufferLength:4 registerAddress:9 returnedBufferLength:&v13 canRetry:0 canRecover:v12];
  if (v7)
  {
LABEL_9:
    BOOL v8 = 0;
    if (!a3) {
      goto LABEL_13;
    }
LABEL_12:
    *a3 = v8;
    goto LABEL_13;
  }
  BOOL v8 = BYTE5(v12) == 0;
  if (a3) {
    goto LABEL_12;
  }
LABEL_13:
  if (v7)
  {
    v9 = +[NSMutableDictionary dictionary];
    [v9 setObject:v7 forKeyedSubscript:@"Previous Error Response"];
    int v10 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6656 userInfo:v9];
  }
  else
  {
    int v10 = 0;
  }
  return v10;
}

- (BOOL)attemptErrorRecovery:(id)a3 lastAttempt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v41 = 0;
  v7 = [(USBCLegacyPDAccess *)self DeviceInAlternateMode:&v41];
  if (v7)
  {
    int v15 = 0;
    char v16 = 1;
    int v18 = v4;
    char v17 = v4;
    int v10 = v6;
    goto LABEL_49;
  }
  BOOL v8 = v41 != 0;
  if (!v41)
  {
    if (v6)
    {
      BYTE4(v39) = v41 != 0;
      BOOL v11 = v4;
      id v40 = v6;
      char v12 = 0;
      do
      {
        int v13 = [v6 userInfo];
        v12 |= (unint64_t)[v6 code] >> 8 == 30;
        uint64_t v14 = [v13 objectForKeyedSubscript:@"Previous Error Response"];

        id v6 = (id)v14;
      }
      while (v14);
      if ((v12 & 1) == 0)
      {
        int v15 = 0;
        char v16 = 0;
        int v10 = 0;
        char v17 = 1;
        BOOL v4 = v11;
        int v18 = v11;
        v7 = 0;
        id v6 = v40;
        goto LABEL_49;
      }
      goto LABEL_55;
    }
    int v15 = 0;
    char v16 = 0;
    int v10 = 0;
    char v17 = 1;
    int v18 = v4;
LABEL_49:
    int v36 = v15 | v18;
    char v37 = v15 | v17;
    if (v4)
    {
      usleep(0x4C4B40u);
      char v9 = v16 & (v37 ^ 1);
      if ((v36 & 1) == 0) {
        goto LABEL_57;
      }
    }
    else
    {
      char v9 = v16 & (v37 ^ 1);
      if (!v36) {
        goto LABEL_57;
      }
    }
    goto LABEL_56;
  }
  if (![(USBCPDAccess *)self didFailErrorRecovery:v6])
  {
    unint64_t v39 = __PAIR64__(v8, v4);
    id v40 = v6;
    int v19 = 0;
    if (!v6)
    {
      LOBYTE(v21) = 0;
      char v20 = 0;
      LOBYTE(v23) = v4;
      LOBYTE(v22) = v4;
LABEL_46:
      v7 = 0;
      id v6 = v40;
      if ((v21 & 1) == 0)
      {
        int v10 = 0;
        int v18 = v23;
        int v15 = v20 & 1;
        char v17 = v22;
        char v16 = 1;
        BOOL v4 = v39;
        goto LABEL_49;
      }
      usleep(0x4C4B40u);
      char v9 = 0;
      int v10 = 0;
      if (!v23) {
        goto LABEL_57;
      }
LABEL_56:
      usleep(0x4C4B40u);
      goto LABEL_57;
    }
    char v20 = 0;
    int v21 = 0;
    BOOL v22 = v4;
    BOOL v23 = v4;
    do
    {
      v24 = objc_msgSend(v6, "userInfo", v39);
      uint64_t v25 = (uint64_t)[v6 code];
      if ((unint64_t)(v25 >> 8) <= 0x1E)
      {
        uint64_t v26 = 1 << SBYTE1(v25);
        int v27 = v25 == 3 || v23;
        int v28 = v25 == 3 || v22;
        if (v25 == 3) {
          int v29 = v19;
        }
        else {
          int v29 = 1;
        }
        if (((1 << SBYTE1(v25)) & 0x48000000) != 0) {
          int v30 = v27;
        }
        else {
          int v30 = v23;
        }
        if (((1 << SBYTE1(v25)) & 0x48000000) != 0) {
          int v31 = v28;
        }
        else {
          int v31 = v22;
        }
        if (((1 << SBYTE1(v25)) & 0x48000000) != 0) {
          int v32 = v29;
        }
        else {
          int v32 = v19;
        }
        if (((1 << SBYTE1(v25)) & 0x3000000) != 0)
        {
          int v30 = v23;
          int v33 = v22;
        }
        else
        {
          int v33 = v31;
        }
        if (((1 << SBYTE1(v25)) & 0x3000000) != 0) {
          int v34 = 1;
        }
        else {
          int v34 = v21;
        }
        if (((1 << SBYTE1(v25)) & 0x3000000) != 0) {
          int v32 = v19;
        }
        if ((v26 & 0xC00000) != 0)
        {
          char v20 = 1;
        }
        else
        {
          BOOL v23 = v30;
          BOOL v22 = v33;
          int v21 = v34;
        }
        if ((v26 & 0xC00000) == 0) {
          int v19 = v32;
        }
      }
      uint64_t v35 = [v24 objectForKeyedSubscript:@"Previous Error Response"];

      id v6 = (id)v35;
    }
    while (v35);
    if ((v19 & 1) == 0) {
      goto LABEL_46;
    }
LABEL_55:
    usleep(0x4C4B40u);
    int v10 = 0;
    v7 = 0;
    id v6 = v40;
    char v9 = BYTE4(v39);
    goto LABEL_56;
  }
  char v9 = 0;
  int v10 = v6;
LABEL_57:

  return v9;
}

- (id)VerifyEmptyPortAndReset:(id)a3 blessCallback:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  char v34 = 0;
  BOOL v8 = [(USBCLegacyPDAccess *)self DeviceAttached:&v34];
  int v9 = v34 != 0;
  id v10 = v6;
  BOOL v11 = v10;
  if (v10)
  {
    char v12 = v10;
    do
    {
      int v13 = v12;
      uint64_t v14 = [v12 userInfo];
      unint64_t v15 = (unint64_t)[v12 code] & 0xFFFFFFFFFFFFFF00;
      int v9 = (v15 != 2816) & v9;
      char v12 = [v14 objectForKeyedSubscript:@"Previous Error Response"];
    }
    while (v12 && v15 != 2816);
  }
  if (v7 && v9)
  {
    int v29 = v8;
    char v16 = v7[2](v7);
    id v17 = objc_alloc_init((Class)NSMutableString);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v18 = v16;
    id v19 = [v18 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          BOOL v23 = *(__CFString **)(*((void *)&v30 + 1) + 8 * i);
          if ([v17 length]) {
            [v17 appendString:@" "];
          }
          [(__CFString *)v23 rangeOfString:@" "];
          v24 = v17;
          if (v25)
          {
            [v17 appendString:@"\""];
            [v17 appendString:v23];
            v24 = v17;
            CFStringRef v26 = @"\"";
          }
          else
          {
            CFStringRef v26 = v23;
          }
          [v24 appendString:v26];
        }
        id v20 = [v18 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v20);
    }

    id v27 = v17;
    system((const char *)[v27 UTF8String]);

    BOOL v8 = v29;
  }

  return v8;
}

- (id)sendVDM:(unsigned int *)a3 ofLength:(unsigned int)a4
{
  uint64_t v12 = 0;
  uint64_t v11 = 0;
  int v14 = 0;
  uint64_t v13 = 0;
  if (a4 >= 7) {
    unsigned int v5 = 7;
  }
  else {
    unsigned int v5 = a4;
  }
  char v10 = v5;
  __memcpy_chk();
  id v6 = [(USBCPDAccess *)self LocalIECSWriteReg:&v10 bufferLength:(4 * v5) | 1 registerAddress:9];
  if (v6
    || ([(USBCPDAccess *)self LocalExecuteCommand:1934443606],
        (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = +[NSMutableDictionary dictionary];
    [v7 setObject:v6 forKeyedSubscript:@"Previous Error Response"];
    BOOL v8 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:7168 userInfo:v7];
  }
  else
  {
    BOOL v8 = 0;
  }
  return v8;
}

- (id)getVDM:(unsigned int *)a3 ofLength:(unsigned int *)a4
{
  char v17 = 0;
  memset(v16, 0, sizeof(v16));
  int v15 = 65;
  unsigned int v7 = *a4;
  if (*a4 >= 8)
  {
    unsigned int v7 = 7;
    *a4 = 7;
  }
  uint64_t v8 = [(USBCPDAccess *)self LocalIECSReadReg:v16 bufferLength:(4 * v7) | 1 registerAddress:79 returnedBufferLength:&v15];
  if (v8)
  {
    int v9 = (void *)v8;
    char v10 = +[NSMutableDictionary dictionary];
    [v10 setObject:v9 forKeyedSubscript:@"Previous Error Response"];
    uint64_t v11 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:7424 userInfo:v10];
  }
  else
  {
    uint64_t v12 = LOBYTE(v16[0]) >> 5;
    if (v12 == [(USBCLegacyPDAccess *)self cached_sequence_num])
    {
      bzero(a3, 4 * *a4);
      uint64_t v11 = 0;
      *a4 = 0;
    }
    else
    {
      [(USBCLegacyPDAccess *)self setCached_sequence_num:v12];
      uint64_t v13 = v16[0] & 7;
      *a4 = v13;
      memcpy(a3, (char *)v16 + 1, 4 * v13);
      uint64_t v11 = 0;
    }
  }
  return v11;
}

- (id)waitForVDMAck:(unsigned int *)a3 count:(unsigned int)a4 retry:(BOOL *)a5 command:(unsigned __int8)a6 checkLength:(BOOL)a7
{
  BOOL v27 = a7;
  int v7 = a6;
  bzero(a3, 4 * a4);
  int v11 = 500;
  do
  {
    unsigned int v12 = v11;
    unsigned int v29 = a4;
    uint64_t v13 = [(USBCLegacyPDAccess *)self getVDM:a3 ofLength:&v29];
    unsigned int v14 = v29;
    if (!v13 && v29)
    {
      BOOL v15 = (*a3 & 0xF) != v7 || (*a3 & 0x30) == 0;
      if (v15 || (*a3 & 0x7C0) == 0 && v27)
      {
        unsigned int v14 = 0;
        self->_cached_sequence_num = -1;
        unsigned int v29 = 0;
      }
    }
    if (v12 <= 0x31)
    {
      char v28 = 0;
      char v16 = [(USBCLegacyPDAccess *)self DeviceInAlternateMode:&v28];
      if (v16)
      {
        char v17 = +[NSMutableDictionary dictionary];
        id v18 = v17;
        if (v13) {
          [v17 setObject:v16 forKeyedSubscript:@"Previous Error Response"];
        }
        [v18 setObject:@"Alternate mode check failed" forKeyedSubscript:@"Notes"];
        uint64_t v19 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:7681 userInfo:v18];

        uint64_t v13 = (void *)v19;
      }
      if (v28)
      {
        usleep(0x2710u);
      }
      else
      {
        id v20 = +[NSMutableDictionary dictionary];
        uint64_t v21 = v20;
        if (v13) {
          [v20 setObject:v13 forKeyedSubscript:@"Previous Error Response"];
        }
        [v21 setObject:@"Not in alternate mode as required" forKeyedSubscript:@"Notes"];
        uint64_t v22 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:7682 userInfo:v21];

        uint64_t v13 = (void *)v22;
      }

      unsigned int v14 = v29;
    }
    if (v13) {
      break;
    }
    if (v14) {
      break;
    }
    int v11 = v12 - 1;
  }
  while (v12 != 1);
  if (v12 == 1)
  {
    BOOL v23 = +[NSMutableDictionary dictionary];
    v24 = v23;
    if (v13) {
      [v23 setObject:v13 forKeyedSubscript:@"Previous Error Response"];
    }
    [v24 setObject:@"Retry counter expired" forKeyedSubscript:@"Notes"];
    uint64_t v25 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:7683 userInfo:v24];

    uint64_t v13 = (void *)v25;
  }
  return v13;
}

- (id)readIECSRegister:(void *)a3 ofLength:(unsigned int)a4 atRegister:(unsigned int)a5 andOutReadLength:(unsigned int *)a6
{
  v38 = a6;
  int v9 = 0;
  unint64_t v40 = 0;
  uint64_t v41 = 0;
  int v43 = 0;
  uint64_t v42 = 0;
  if (a4 >= 0x40) {
    unsigned int v10 = 64;
  }
  else {
    unsigned int v10 = a4;
  }
  unsigned __int8 v39 = 1;
  int v11 = 25;
  do
  {
    if (!v11)
    {
      int v11 = -1;
LABEL_20:
      char v17 = v38;
      goto LABEL_21;
    }
    unsigned __int8 v39 = 0;
    LODWORD(v40) = 95158787;
    HIDWORD(v40) = v10 | 0x1000000;
    LODWORD(v41) = a5;
    uint64_t v12 = [(USBCLegacyPDAccess *)self sendVDM:&v40 ofLength:3];

    int v9 = (void *)v12;
    if (v12) {
      goto LABEL_13;
    }
    do
    {
      uint64_t v13 = -[USBCLegacyPDAccess waitForVDMAck:count:retry:command:checkLength:](self, "waitForVDMAck:count:retry:command:checkLength:", &v40, 7, &v39, 3, 0, v38);
      if (v13)
      {
        int v9 = (void *)v13;
        goto LABEL_13;
      }
    }
    while (v40 >> 15 != 2904);
    unsigned int v14 = (v40 >> 4) & 3;
    if (v14 == 1)
    {
      int v9 = 0;
LABEL_13:
      int v16 = v39;
      goto LABEL_14;
    }
    if (v14 == 2)
    {
      BOOL v15 = +[NSMutableDictionary dictionary];
      [v15 setObject:@"Got NAK'd" forKeyedSubscript:@"Notes"];
      int v9 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6155 userInfo:v15];

      goto LABEL_13;
    }
    int v9 = 0;
    int v16 = 1;
    unsigned __int8 v39 = 1;
LABEL_14:
    --v11;
  }
  while (v16);
  if (v11) {
    goto LABEL_20;
  }
  char v34 = +[NSMutableDictionary dictionary];
  uint64_t v35 = v34;
  char v17 = v38;
  if (v9) {
    [v34 setObject:v9 forKeyedSubscript:@"Previous Error Response"];
  }
  objc_msgSend(v35, "setObject:forKeyedSubscript:", @"Retry counter expired", @"Notes", v38);
  uint64_t v36 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6159 userInfo:v35];

  int v11 = 0;
  int v9 = (void *)v36;
LABEL_21:
  unsigned int v18 = 0;
  if (v9) {
    goto LABEL_41;
  }
  unsigned __int8 v39 = 1;
  while (2)
  {
    while (2)
    {
      if (!v11)
      {
        int v11 = -1;
        goto LABEL_45;
      }
      --v11;
      unsigned __int8 v39 = 0;
      if (v9 || v18 >= v10) {
        goto LABEL_41;
      }
LABEL_26:
      int v19 = ((((_BYTE)v10 - (_BYTE)v18) & 0x1F) << 6) | 0x5AC0001;
      if ((v10 - v18) > 0x18u) {
        int v19 = 95159809;
      }
      LODWORD(v40) = v19;
      uint64_t v20 = -[USBCLegacyPDAccess sendVDM:ofLength:](self, "sendVDM:ofLength:", &v40, 1, v38);
      if (v20
        || (unint64_t v40 = 0xAA00AA00FF00FF00,
            [(USBCLegacyPDAccess *)self waitForVDMAck:&v40 count:7 retry:&v39 command:1 checkLength:1], (uint64_t v20 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        int v9 = (void *)v20;
LABEL_36:
        if (v39) {
          continue;
        }
        goto LABEL_41;
      }
      break;
    }
    if (v40 >> 15 != 2904)
    {
LABEL_33:
      if (v18 >= v10)
      {
        int v9 = 0;
        goto LABEL_36;
      }
      goto LABEL_26;
    }
    unsigned int v21 = (v40 >> 4) & 3;
    if (v21 == 1)
    {
      size_t v22 = ((unint64_t)v40 >> 6) & 0x1F;
      memcpy((char *)a3 + v18, (char *)&v40 + 4, v22);
      v18 += v22;
      *char v17 = v18;
      goto LABEL_33;
    }
    if (v21 != 2)
    {
      int v9 = 0;
      unsigned __int8 v39 = 1;
      continue;
    }
    break;
  }
  int v9 = 0;
  unsigned __int8 v39 = 0;
LABEL_41:
  if (!v11)
  {
    BOOL v23 = +[NSMutableDictionary dictionary];
    v24 = v23;
    if (v9) {
      [v23 setObject:v9 forKeyedSubscript:@"Previous Error Response"];
    }
    objc_msgSend(v24, "setObject:forKeyedSubscript:", @"Retry counter expired", @"Notes", v38);
    uint64_t v25 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6159 userInfo:v24];

    int v11 = 0;
    int v9 = (void *)v25;
  }
LABEL_45:
  id v26 = 0;
  if (!v9)
  {
    unsigned __int8 v39 = 1;
    while (1)
    {
      long long v30 = v26;
      if (!v11) {
        goto LABEL_68;
      }
      --v11;
      unsigned __int8 v39 = 0;
      if (v18 >= v10) {
        break;
      }
      id v26 = v9;

      LODWORD(v40) = 95158276;
      int v9 = [(USBCLegacyPDAccess *)self sendVDM:&v40 ofLength:1];

      if (v9) {
        goto LABEL_61;
      }
      do
      {
        -[USBCLegacyPDAccess waitForVDMAck:count:retry:command:checkLength:](self, "waitForVDMAck:count:retry:command:checkLength:", &v40, 7, &v39, 4, 0, v38);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        if (v31) {
          goto LABEL_60;
        }
      }
      while (v40 >> 15 != 2904);
      unsigned int v32 = (v40 >> 4) & 3;
      switch(v32)
      {
        case 3u:
LABEL_63:
          int v9 = 0;
          unsigned __int8 v39 = 1;
          break;
        case 2u:
          long long v33 = +[NSMutableDictionary dictionary];
          [v33 setObject:@"Got NAK'd" forKeyedSubscript:@"Notes"];
          int v9 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6156 userInfo:v33];

LABEL_61:
          if (!v39) {
            goto LABEL_46;
          }
          break;
        case 1u:
          id v31 = v26;
LABEL_60:
          int v9 = v31;
          goto LABEL_61;
        default:
          goto LABEL_63;
      }
    }
  }
LABEL_46:
  if (!v11)
  {
    BOOL v27 = +[NSMutableDictionary dictionary];
    char v28 = v27;
    if (v9) {
      [v27 setObject:v9 forKeyedSubscript:@"Previous Error Response"];
    }
    objc_msgSend(v28, "setObject:forKeyedSubscript:", @"Retry counter expired", @"Notes", v38);
    uint64_t v29 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6159 userInfo:v28];

    int v9 = (void *)v29;
  }
LABEL_68:

  return v9;
}

- (id)writeIECSRegister:(const void *)a3 ofLength:(unsigned int)a4 atRegister:(unsigned int)a5
{
  int v7 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  int v37 = 0;
  uint64_t v36 = 0;
  if (a4 >= 0x40) {
    unsigned int v8 = 64;
  }
  else {
    unsigned int v8 = a4;
  }
  unsigned __int8 v33 = 1;
  int v9 = 25;
  do
  {
    if (!v9)
    {
      int v9 = -1;
      goto LABEL_23;
    }
    unsigned __int8 v33 = 0;
    LODWORD(v34) = 95158787;
    HIDWORD(v34) = v8 | 0x1800000;
    LODWORD(v35) = a5;
    uint64_t v10 = [(USBCLegacyPDAccess *)self sendVDM:&v34 ofLength:3];

    int v7 = (void *)v10;
    if (v10) {
      goto LABEL_13;
    }
    do
    {
      uint64_t v11 = [(USBCLegacyPDAccess *)self waitForVDMAck:&v34 count:7 retry:&v33 command:3 checkLength:0];
      if (v11)
      {
        int v7 = (void *)v11;
        goto LABEL_13;
      }
    }
    while (v34 >> 15 != 2904);
    unsigned int v12 = (v34 >> 4) & 3;
    if (v12 == 1)
    {
      int v7 = 0;
LABEL_13:
      int v14 = v33;
      goto LABEL_14;
    }
    if (v12 == 2)
    {
      uint64_t v13 = +[NSMutableDictionary dictionary];
      [v13 setObject:@"Got NAK'd" forKeyedSubscript:@"Notes"];
      int v7 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6401 userInfo:v13];
      unsigned __int8 v33 = 1;

      goto LABEL_13;
    }
    int v7 = 0;
    int v14 = 1;
    unsigned __int8 v33 = 1;
LABEL_14:
    --v9;
  }
  while (v14);
  if (!v9)
  {
    BOOL v15 = +[NSMutableDictionary dictionary];
    int v16 = v15;
    if (v7) {
      [v15 setObject:v7 forKeyedSubscript:@"Previous Error Response"];
    }
    [v16 setObject:@"Retry counter expired" forKeyedSubscript:@"Notes"];
    uint64_t v17 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6402 userInfo:v16];

    int v9 = 0;
    int v7 = (void *)v17;
  }
LABEL_23:
  unsigned int v18 = 0;
  if (v7) {
    goto LABEL_24;
  }
  unsigned __int8 v33 = 1;
  while (2)
  {
    if (!v9)
    {
      int v9 = -1;
      if (v7) {
        goto LABEL_66;
      }
LABEL_26:
      unsigned __int8 v33 = 0;
      if (v18 >= v8) {
        goto LABEL_61;
      }
      LODWORD(v34) = 95158276;
      int v7 = [(USBCLegacyPDAccess *)self sendVDM:&v34 ofLength:1];
      if (v7) {
        goto LABEL_62;
      }
      do
      {
        uint64_t v19 = [(USBCLegacyPDAccess *)self waitForVDMAck:&v34 count:7 retry:&v33 command:4 checkLength:0];
        if (v19)
        {
          int v7 = (void *)v19;
          goto LABEL_62;
        }
      }
      while (v34 >> 15 != 2904);
      unsigned int v27 = (v34 >> 4) & 3;
      if (v27 == 1)
      {
LABEL_61:
        int v7 = 0;
      }
      else if (v27 == 2)
      {
        char v28 = +[NSMutableDictionary dictionary];
        [v28 setObject:@"Got NAK'd" forKeyedSubscript:@"Notes"];
        int v7 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6405 userInfo:v28];
      }
      else
      {
        int v7 = 0;
        unsigned __int8 v33 = 1;
      }
LABEL_62:
      if (v9 != 1) {
        goto LABEL_66;
      }
      goto LABEL_63;
    }
    --v9;
    unsigned __int8 v33 = 0;
    if (v7 || v18 >= v8) {
      break;
    }
    while (2)
    {
      if ((v8 - v18) <= 0x18u) {
        unsigned __int8 v20 = v8 - v18;
      }
      else {
        unsigned __int8 v20 = 24;
      }
      __memcpy_chk();
      LODWORD(v34) = ((v20 & 0x1F) << 6) | 0x5AC0002;
      uint64_t v21 = [(USBCLegacyPDAccess *)self sendVDM:&v34 ofLength:((v20 + 3) >> 2) + 1];
      if (v21
        || ([(USBCLegacyPDAccess *)self waitForVDMAck:&v34 count:7 retry:&v33 command:2 checkLength:0], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        int v7 = (void *)v21;
        goto LABEL_49;
      }
      if (v34 >> 15 != 2904)
      {
LABEL_46:
        if (v18 >= v8)
        {
          int v7 = 0;
          goto LABEL_49;
        }
        continue;
      }
      break;
    }
    unsigned int v22 = (v34 >> 4) & 3;
    if (v22 == 1)
    {
      v18 += v20;
      goto LABEL_46;
    }
    if (v22 != 2)
    {
      unsigned __int8 v33 = 1;
      goto LABEL_46;
    }
    BOOL v23 = +[NSMutableDictionary dictionary];
    [v23 setObject:@"Got NAK'd" forKeyedSubscript:@"Notes"];
    int v7 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6403 userInfo:v23];

LABEL_49:
    if (v33) {
      continue;
    }
    break;
  }
LABEL_24:
  if (!v9)
  {
    v24 = +[NSMutableDictionary dictionary];
    uint64_t v25 = v24;
    if (v7) {
      [v24 setObject:v7 forKeyedSubscript:@"Previous Error Response"];
    }
    [v25 setObject:@"Retry counter expired" forKeyedSubscript:@"Notes"];
    uint64_t v26 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6404 userInfo:v25];

    int v7 = (void *)v26;
    if (!v26)
    {
      unsigned __int8 v33 = 1;
      goto LABEL_66;
    }
LABEL_63:
    uint64_t v29 = +[NSMutableDictionary dictionary];
    long long v30 = v29;
    if (v7) {
      [v29 setObject:v7 forKeyedSubscript:@"Previous Error Response"];
    }
    [v30 setObject:@"Retry counter expired" forKeyedSubscript:@"Notes"];
    uint64_t v31 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6406 userInfo:v30];

    int v7 = (void *)v31;
    goto LABEL_66;
  }
  if (!v7) {
    goto LABEL_26;
  }
LABEL_66:
  return v7;
}

- (id)IECSReadReg:(BOOL)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 returnedBufferLength:(unsigned int *)a7 canRetry:(BOOL)a8 canRecover:(BOOL)a9
{
  uint64_t v10 = *(void *)&a6;
  BOOL v12 = a3;
  if (a8) {
    int v14 = 2;
  }
  else {
    int v14 = -1;
  }
  uint64_t v15 = a5;
  if (!a3) {
    goto LABEL_8;
  }
LABEL_5:
  uint64_t v27 = *a7;
  int v16 = [(USBCPDAccess *)self pdController];
  signed int v17 = [v16 registerRead:a4 ofLength:v15 atAddress:v10 andOutReadLength:&v27];

  if (v17)
  {
    unsigned int v18 = +[NSMutableDictionary dictionary];
    [v18 setObject:@"YES" forKeyedSubscript:@"Is local operation"];
    uint64_t v19 = +[NSNumber numberWithUnsignedLong:v17];
    [v18 setObject:v19 forKeyedSubscript:@"IOReturn result"];

    unsigned __int8 v20 = +[NSNumber numberWithUnsignedLong:v15];
    [v18 setObject:v20 forKeyedSubscript:@"Requested xfer length"];

    uint64_t v21 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6157 userInfo:v18];

    if (v21)
    {
      while (1)
      {
        unsigned __int8 v22 = [(USBCPDAccess *)self didFailErrorRecovery:v21];
        if (v14 + 1 < 1 || (v22 & 1) != 0) {
          break;
        }
        if (![(USBCLegacyPDAccess *)self attemptErrorRecovery:v21 lastAttempt:v14 == 0])goto LABEL_17; {

        }
        --v14;
        if (v12) {
          goto LABEL_5;
        }
LABEL_8:
        uint64_t v21 = [(USBCLegacyPDAccess *)self readIECSRegister:a4 ofLength:a5 atRegister:v10 andOutReadLength:a7];
        if (!v21) {
          goto LABEL_19;
        }
      }
      ++v14;
LABEL_17:
      if (!v14)
      {
        BOOL v23 = +[NSMutableDictionary dictionary];
        [v23 setObject:v21 forKeyedSubscript:@"Previous Error Response"];
        uint64_t v24 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13062 userInfo:v23];

        uint64_t v21 = (void *)v24;
      }
    }
  }
  else
  {
    uint64_t v21 = 0;
    *a7 = v27;
  }
LABEL_19:
  return v21;
}

- (id)IECSWriteReg:(BOOL)a3 buffer:(const void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 canRetry:(BOOL)a7 canRecover:(BOOL)a8
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  BOOL v11 = a3;
  if (a7) {
    int v13 = 2;
  }
  else {
    int v13 = -1;
  }
  uint64_t v14 = a5;
  while (1)
  {
    if (v11)
    {
      uint64_t v15 = [(USBCPDAccess *)self pdController];
      signed int v16 = [v15 registerWrite:a4 ofLength:v14 atAddress:v8];

      if (!v16)
      {
        unsigned __int8 v20 = 0;
        goto LABEL_18;
      }
      signed int v17 = +[NSMutableDictionary dictionary];
      [v17 setObject:@"YES" forKeyedSubscript:@"Is local operation"];
      unsigned int v18 = +[NSNumber numberWithUnsignedLong:v16];
      [v17 setObject:v18 forKeyedSubscript:@"IOReturn result"];

      uint64_t v19 = +[NSNumber numberWithUnsignedLong:v14];
      [v17 setObject:v19 forKeyedSubscript:@"Requested xfer length"];

      unsigned __int8 v20 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6413 userInfo:v17];

      if (!v20) {
        goto LABEL_18;
      }
    }
    else
    {
      unsigned __int8 v20 = [(USBCLegacyPDAccess *)self writeIECSRegister:a4 ofLength:v9 atRegister:v8];
      if (!v20) {
        goto LABEL_18;
      }
    }
    unsigned __int8 v21 = [(USBCPDAccess *)self didFailErrorRecovery:v20];
    if (v13 + 1 < 1 || (v21 & 1) != 0) {
      break;
    }
    if (![(USBCLegacyPDAccess *)self attemptErrorRecovery:v20 lastAttempt:v13 == 0])goto LABEL_15; {

    }
    --v13;
  }
  ++v13;
LABEL_15:
  if (!v13)
  {
    unsigned __int8 v22 = +[NSMutableDictionary dictionary];
    [v22 setObject:v20 forKeyedSubscript:@"Previous Error Response"];
    uint64_t v23 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13063 userInfo:v22];

    unsigned __int8 v20 = (void *)v23;
  }
LABEL_18:
  return v20;
}

- (unsigned)cached_sequence_num
{
  return self->_cached_sequence_num;
}

- (void)setCached_sequence_num:(unsigned __int8)a3
{
  self->_cached_sequence_num = a3;
}

- (unsigned)streamSequenceNumber
{
  return self->_streamSequenceNumber;
}

- (void)setStreamSequenceNumber:(unsigned __int8)a3
{
  self->_streamSequenceNumber = a3;
}

@end