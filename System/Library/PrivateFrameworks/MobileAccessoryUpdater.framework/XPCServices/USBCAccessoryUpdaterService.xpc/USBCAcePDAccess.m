@interface USBCAcePDAccess
- (BOOL)attemptErrorRecovery:(id)a3 lastAttempt:(BOOL)a4;
- (USBCAcePDAccess)initWithPDController:(id)a3;
- (id)DeviceInAlternateMode:(BOOL *)a3;
- (id)EnterUpdateMode:(id)a3;
- (id)ExitUpdateMode:(id)a3 remoteReset:(BOOL)a4;
- (id)IECSReadReg:(BOOL)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 returnedBufferLength:(unsigned int *)a7 canRetry:(BOOL)a8 canRecover:(BOOL)a9;
- (id)IECSWriteReg:(BOOL)a3 buffer:(const void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 canRetry:(BOOL)a7 canRecover:(BOOL)a8;
- (id)VerifyEmptyPortAndReset:(id)a3 blessCallback:(id)a4;
- (id)VerifyLastTraffic:(BOOL *)a3 shouldIssueReset:(BOOL *)a4;
- (id)VerifyPowerRole;
@end

@implementation USBCAcePDAccess

- (USBCAcePDAccess)initWithPDController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)USBCAcePDAccess;
  result = [(USBCPDAccess *)&v4 initWithPDController:a3];
  if (result) {
    result->CurrentPowerRole = -1;
  }
  return result;
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

- (BOOL)attemptErrorRecovery:(id)a3 lastAttempt:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = 0;
  int v8 = 0;
  BOOL v9 = 0;
  int v53 = 0;
  HIDWORD(v49) = 0;
  char v50 = 0;
  v10 = 0;
  char v58 = 0;
  char v54 = 1;
  int v11 = 2;
  v52 = v6;
  while (1)
  {
    if (!v11) {
      goto LABEL_77;
    }
    char v12 = v7 | v4;
    int v55 = v4 | v8;
    char v13 = v9 || v4;
    --v11;
    uint64_t v14 = [(USBCAcePDAccess *)self DeviceInAlternateMode:&v58];

    char v15 = v9 || v4;
    if (v14) {
      goto LABEL_4;
    }
    if (!v58)
    {
      memset(v59, 0, sizeof(v59));
      int v57 = 64;
      LOBYTE(v49) = 0;
      uint64_t v25 = [(USBCAcePDAccess *)self IECSReadReg:1 buffer:v59 bufferLength:64 registerAddress:26 returnedBufferLength:&v57 canRetry:1 canRecover:v49];
      if (v25)
      {
        v16 = (void *)v25;
        char v54 = 0;
        if ((v13 & 1) == 0) {
          goto LABEL_38;
        }
        char v15 = 1;
        goto LABEL_37;
      }
      if ((~LOBYTE(v59[0]) & 0xD) != 0)
      {
        if (!v58)
        {
          char v15 = 1;
LABEL_4:
          char v54 = 0;
          v16 = (void *)v14;
          if ((v13 & 1) == 0) {
            goto LABEL_5;
          }
          goto LABEL_37;
        }
        char v54 = 0;
      }
      else
      {
        int v55 = 1;
        char v58 = 1;
        v12 |= v11 == 0;
      }
    }
    v17 = [(USBCAcePDAccess *)self VerifyPowerRole];
    BOOL v51 = v17 != 0;

    char v18 = v13;
    if (v6)
    {
      while (2)
      {
        v19 = [v6 userInfo];
        uint64_t v20 = (uint64_t)[v6 code];
        if (![(USBCPDAccess *)self didFailErrorRecovery:v52])
        {
          uint64_t v21 = v20 >> 8;
          switch(v20 >> 8)
          {
            case 20:
              char v50 = 1;
              goto LABEL_28;
            case 21:
              char v54 = 1;
              goto LABEL_28;
            case 22:
            case 23:
              int v53 = 1;
              goto LABEL_28;
            case 24:
            case 25:
              v22 = [v19 objectForKeyedSubscript:@"Error Code"];
              v23 = v22;
              if (v22)
              {
                switch([v22 unsignedLongValue])
                {
                  case 0u:
                    break;
                  case 2u:
                    goto LABEL_23;
                  case 3u:
                    char v18 = 1;
                    int v55 = 1;
                    break;
                  case 4u:
                    char v54 = 0;
                    break;
                  case 5u:
                    v18 &= v4;
                    goto LABEL_26;
                  default:
                    v12 |= v11 == 0;
                    char v18 = 1;
LABEL_23:
                    int v55 = 1;
LABEL_26:
                    char v13 = 1;
                    break;
                }
              }

              goto LABEL_28;
            case 26:
              goto LABEL_28;
            case 27:
              HIDWORD(v49) = 1;
              goto LABEL_28;
            default:
              if (v21 == 55)
              {
                BOOL v51 = 1;
              }
              else if ((unint64_t)(v21 - 51) < 2)
              {
                break;
              }
LABEL_28:
              uint64_t v24 = [v19 objectForKeyedSubscript:@"Previous Error Response"];

              id v6 = (id)v24;
              if (!v24) {
                goto LABEL_29;
              }
              continue;
          }
        }
        break;
      }

      v10 = 0;
LABEL_77:
      char v54 = 0;
      goto LABEL_82;
    }
LABEL_29:
    char v15 = v50 & (v53 ^ 1) | v18;
    if (v51)
    {
      id v6 = 0;
      v16 = 0;
LABEL_36:
      int v55 = 1;
      goto LABEL_37;
    }
    if ((v49 & 0x100000000) != 0)
    {
      id v6 = 0;
      v16 = 0;
      v15 &= v4;
      HIDWORD(v49) = 1;
      goto LABEL_36;
    }
    id v6 = 0;
    v16 = 0;
    HIDWORD(v49) = 0;
    v15 |= v53;
    v55 |= v53;
    if ((v13 & 1) == 0)
    {
LABEL_5:
      if ((v15 & 1) == 0) {
        goto LABEL_38;
      }
      goto LABEL_39;
    }
LABEL_37:
    usleep(0x3D0900u);
    if ((v15 & 1) == 0)
    {
LABEL_38:
      if ((v12 & 1) == 0) {
        goto LABEL_44;
      }
    }
LABEL_39:
    v26 = [(USBCPDAccess *)self LocalExecuteCommand:1414677057];
    if (v26)
    {
      v27 = +[NSMutableDictionary dictionary];
      [v27 setObject:v26 forKeyedSubscript:@"Recovery Error Response"];
      if (v16) {
        [v27 setObject:v16 forKeyedSubscript:@"Previous Error Response"];
      }
      uint64_t v28 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13057 userInfo:v27];

      v16 = (void *)v28;
    }

LABEL_44:
    if ((v12 & 1) == 0)
    {
      v35 = v16;
      goto LABEL_79;
    }
    int v57 = 0x20000;
    unsigned int v29 = [(PDController *)self->super._pdController registerWrite:&v57 ofLength:4 atAddress:19];
    if (v29)
    {
      signed int v30 = v29;
      v31 = +[NSMutableDictionary dictionary];
      v32 = v31;
      if (v16) {
        [v31 setObject:v16 forKeyedSubscript:@"Previous Error Response"];
      }
      v33 = +[NSNumber numberWithUnsignedLong:v30];
      [v32 setObject:v33 forKeyedSubscript:@"IOReturn result"];

      uint64_t v34 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13058 userInfo:v32];

      v16 = (void *)v34;
    }
    v35 = [(USBCAcePDAccess *)self VerifyPowerRole];

    if (v35)
    {
      unsigned int v36 = 0;
      do
      {
        v37 = v35;
        usleep(0x3D0900u);
        v35 = [(USBCAcePDAccess *)self VerifyPowerRole];

        BOOL v38 = v35 != 0;
        if (v36 > 3) {
          break;
        }
        ++v36;
      }
      while (v35);
    }
    else
    {
      BOOL v38 = 0;
    }
    v39 = [(USBCPDAccess *)self LocalExecuteCommand:1632978499 withDelay:0 canRetry:1 canRecover:0];
    if (v39)
    {
      v40 = +[NSMutableDictionary dictionary];
      [v40 setObject:v39 forKeyedSubscript:@"Recovery Error Response"];
      if (v38) {
        [v40 setObject:v35 forKeyedSubscript:@"Previous Error Response"];
      }
      v10 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13059 userInfo:v40];

      char v54 = 0;
      BOOL v9 = 1;
      int v41 = 2;
      goto LABEL_66;
    }
    int v56 = 0;
    *(void *)&v59[0] = 4;
    unsigned int v42 = [(PDController *)self->super._pdController registerRead:&v56 ofLength:4 atAddress:19 andOutReadLength:v59];
    BOOL v9 = v42 == 0;
    if (v42)
    {
      signed int v43 = v42;
      v44 = +[NSMutableDictionary dictionary];
      v45 = v44;
      if (v38) {
        [v44 setObject:v35 forKeyedSubscript:@"Previous Error Response"];
      }
      v46 = +[NSNumber numberWithUnsignedLong:v43];
      [v45 setObject:v46 forKeyedSubscript:@"IOReturn result"];

      uint64_t v47 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6148 userInfo:v45];

      int v41 = 3;
      v35 = (void *)v47;
      goto LABEL_65;
    }
    if ((~BYTE2(v56) & 0xC) != 0) {
      break;
    }
    char v54 = 0;
    int v41 = 2;
LABEL_65:
    v10 = v35;
LABEL_66:

    char v7 = 1;
    int v8 = v55;
    if (v41 != 2) {
      goto LABEL_82;
    }
  }
  usleep(0x3D0900u);
LABEL_79:
  if (v55) {
    usleep(0x3D0900u);
  }
  char v54 = 1;
  v10 = v35;
LABEL_82:

  return v54 & 1;
}

- (id)VerifyPowerRole
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned int v17 = 64;
  uint64_t v3 = [(USBCPDAccess *)self LocalIECSReadReg:&v18 bufferLength:64 registerAddress:26 returnedBufferLength:&v17];
  if (v3) {
    goto LABEL_19;
  }
  if ((~v18 & 0xD) != 0)
  {
    char v7 = +[NSMutableDictionary dictionary];
    int v8 = +[NSNumber numberWithChar:(char)v18];
    [v7 setObject:v8 forKeyedSubscript:@"Error Code"];

    uint64_t v9 = 14082;
    goto LABEL_13;
  }
  int CurrentPowerRole = self->CurrentPowerRole;
  int v5 = v18 & 0x20;
  if (CurrentPowerRole == 255)
  {
    id v6 = 0;
    self->int CurrentPowerRole = v5;
    goto LABEL_16;
  }
  if (CurrentPowerRole != v5)
  {
    v10 = +[NSMutableDictionary dictionary];
    int v11 = +[NSNumber numberWithChar:(char)v18];
    [v10 setObject:v11 forKeyedSubscript:@"Error Code"];

    [v10 setObject:@"Power Role Changed" forKeyedSubscript:@"Notes"];
    char v12 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:14083 userInfo:v10];
    self->int CurrentPowerRole = v18 & 0x20;
  }
  LOBYTE(v16) = 0;
  uint64_t v3 = [(USBCAcePDAccess *)self IECSReadReg:1 buffer:&v18 bufferLength:64 registerAddress:94 returnedBufferLength:&v17 canRetry:0 canRecover:v16];
  if (v3)
  {
LABEL_19:
    char v13 = (void *)v3;
    goto LABEL_14;
  }
  if (v17 > 0x11)
  {
    if (BYTE1(v19)) {
      goto LABEL_15;
    }
    char v7 = +[NSMutableDictionary dictionary];
    uint64_t v9 = 14085;
  }
  else
  {
    char v7 = +[NSMutableDictionary dictionary];
    uint64_t v9 = 14084;
  }
LABEL_13:
  char v13 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:v9 userInfo:v7];

  if (v13)
  {
LABEL_14:
    uint64_t v14 = +[NSMutableDictionary dictionary];
    [v14 setObject:v13 forKeyedSubscript:@"Previous Error Response"];
    id v6 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:14081 userInfo:v14];

    goto LABEL_16;
  }
LABEL_15:
  id v6 = 0;
LABEL_16:
  return v6;
}

- (id)VerifyEmptyPortAndReset:(id)a3 blessCallback:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(void))a4;
  memset(v41, 0, sizeof(v41));
  int v39 = 64;
  uint64_t v8 = [(USBCPDAccess *)self LocalIECSReadReg:v41 bufferLength:64 registerAddress:26 returnedBufferLength:&v39];
  if (v8) {
    goto LABEL_43;
  }
  if ((((v41[0] & 0xF) - 13) & 0xFFFFFFFD) == 0)
  {
    BOOL v9 = 1;
    goto LABEL_6;
  }
  int v39 = 64;
  uint64_t v8 = [(USBCPDAccess *)self LocalIECSReadReg:v41 bufferLength:64 registerAddress:95 returnedBufferLength:&v39];
  if (v8)
  {
LABEL_43:
    v32 = (void *)v8;
    goto LABEL_40;
  }
  BOOL v9 = LODWORD(v41[0]) != 0;
LABEL_6:
  BOOL v10 = !v9;
  id v11 = v6;
  if (v11)
  {
    char v12 = v11;
    uint64_t v34 = v7;
    id v13 = v6;
    do
    {
      uint64_t v14 = v12;
      char v15 = [v12 userInfo];
      uint64_t v16 = (uint64_t)[v12 code] >> 8;
      BOOL v17 = v16 == 38 || v16 == 11;
      int v18 = v17;
      if (v17) {
        BOOL v9 = 0;
      }
      if (v17) {
        BOOL v10 = 0;
      }
      char v12 = [v15 objectForKeyedSubscript:@"Previous Error Response"];
    }
    while (v12 && !v18);

    id v6 = v13;
    char v7 = v34;
  }
  if (v10) {
    id v19 = [(USBCPDAccess *)self LocalExecuteCommand:1414677057];
  }
  if (v7 != 0 && v9)
  {
    long long v20 = v7[2](v7);
    id v21 = objc_alloc_init((Class)NSMutableString);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v22 = v20;
    id v23 = [v22 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v36;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v36 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(__CFString **)(*((void *)&v35 + 1) + 8 * i);
          if ([v21 length]) {
            [v21 appendString:@" "];
          }
          [(__CFString *)v27 rangeOfString:@" "];
          uint64_t v28 = v21;
          if (v29)
          {
            [v21 appendString:@"\""];
            [v21 appendString:v27];
            uint64_t v28 = v21;
            CFStringRef v30 = @"\"";
          }
          else
          {
            CFStringRef v30 = v27;
          }
          [v28 appendString:v30];
        }
        id v24 = [v22 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v24);
    }

    id v31 = v21;
    system((const char *)[v31 UTF8String]);
  }
  v32 = 0;
LABEL_40:

  return v32;
}

- (id)DeviceInAlternateMode:(BOOL *)a3
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  HIDWORD(v13) = 64;
  int v14 = 4;
  int v15 = 0;
  LOBYTE(v13) = 0;
  uint64_t v5 = [(USBCAcePDAccess *)self IECSReadReg:1 buffer:&v15 bufferLength:4 registerAddress:26 returnedBufferLength:&v14 canRetry:0 canRecover:v13];
  if (v5) {
    goto LABEL_2;
  }
  if ((((v15 & 0xF) - 13) & 0xFFFFFFFD) != 0)
  {
LABEL_4:
    char v7 = +[NSMutableDictionary dictionary];
    [v7 setObject:@"RemoteAttached == NO" forKeyedSubscript:@"Notes"];
    id v6 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6656 userInfo:v7];

    goto LABEL_5;
  }
  HIDWORD(v13) = 64;
  int v14 = 64;
  uint64_t v12 = [(USBCPDAccess *)self LocalIECSReadReg:&v16 bufferLength:64 registerAddress:95 returnedBufferLength:(char *)&v13 + 4];
  if (v12)
  {
    id v6 = (void *)v12;
    BOOL v8 = 1;
  }
  else
  {
    if (!v16) {
      goto LABEL_4;
    }
    HIDWORD(v13) = 64;
    int v14 = 64;
    LOBYTE(v13) = 0;
    uint64_t v5 = [(USBCAcePDAccess *)self IECSReadReg:1 buffer:&v16 bufferLength:64 registerAddress:94 returnedBufferLength:(char *)&v13 + 4 canRetry:0 canRecover:v13];
    if (v5)
    {
LABEL_2:
      id v6 = (void *)v5;
LABEL_5:
      BOOL v8 = 0;
      goto LABEL_6;
    }
    if (HIDWORD(v13) >= 0x12)
    {
      id v6 = 0;
      BOOL v8 = BYTE1(v17) & 1;
    }
    else
    {
      BOOL v8 = 0;
      id v6 = 0;
    }
  }
LABEL_6:
  if (a3) {
    *a3 = v8;
  }
  if (v6)
  {
    BOOL v9 = +[NSMutableDictionary dictionary];
    [v9 setObject:v6 forKeyedSubscript:@"Previous Error Response"];
    BOOL v10 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:6656 userInfo:v9];
  }
  else
  {
    BOOL v10 = 0;
  }
  return v10;
}

- (id)VerifyLastTraffic:(BOOL *)a3 shouldIssueReset:(BOOL *)a4
{
  return 0;
}

- (id)IECSReadReg:(BOOL)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 returnedBufferLength:(unsigned int *)a7 canRetry:(BOOL)a8 canRecover:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = a4;
  BOOL v58 = a3;
  if (a8) {
    int v14 = 3;
  }
  else {
    int v14 = 0;
  }
  size_t v15 = a5;
  CFStringRef v16 = @"USBCAccessoryFirmwareUpdater Domain";
  long long v17 = &CFRelease_ptr;
  long long v18 = &CFRelease_ptr;
  size_t v56 = a5;
  while (1)
  {
    bzero(v12, v15);
    if (v58)
    {
      unint64_t v61 = *v10;
      unsigned int v19 = [(PDController *)self->super._pdController registerRead:v12 ofLength:v15 atAddress:v11 andOutReadLength:&v61];
      if (v19)
      {
        signed int v20 = v19;
        id v21 = [v17[106] dictionary];
        id v22 = +[NSNumber numberWithUnsignedLong:v20];
        [v21 setObject:v22 forKeyedSubscript:@"IOReturn result"];

        id v23 = v18[102];
        CFStringRef v24 = v16;
        uint64_t v25 = 6145;
LABEL_10:
        uint64_t v29 = [v23 errorWithDomain:v24 code:v25 userInfo:v21];

        goto LABEL_19;
      }
      uint64_t v29 = 0;
      unsigned int v30 = v61;
LABEL_12:
      unsigned int *v10 = v30;
      goto LABEL_19;
    }
    v60[0] = 0;
    v60[1] = v11;
    v60[2] = 1;
    v60[3] = a5;
    unsigned int v26 = [(PDController *)self->super._pdController registerWrite:v60 ofLength:4 atAddress:19];
    if (v26)
    {
      signed int v27 = v26;
      id v21 = [v17[106] dictionary];
      uint64_t v28 = +[NSNumber numberWithUnsignedLong:v27];
      [v21 setObject:v28 forKeyedSubscript:@"IOReturn result"];

      id v23 = v18[102];
      CFStringRef v24 = v16;
      uint64_t v25 = 6147;
      goto LABEL_10;
    }
    uint64_t v31 = [(USBCAcePDAccess *)self VerifyPowerRole];
    if (v31)
    {
      v32 = (void *)v31;
      v33 = v17;
      BOOL v34 = v9;
      long long v35 = v18;
      CFStringRef v36 = v16;
      unsigned int v37 = 0;
      do
      {
        long long v38 = v32;
        usleep(0x3D0900u);
        v32 = [(USBCAcePDAccess *)self VerifyPowerRole];

        if (v37 > 0x30) {
          break;
        }
        ++v37;
      }
      while (v32);

      CFStringRef v16 = v36;
      long long v18 = v35;
      BOOL v9 = v34;
      long long v17 = v33;
      BOOL v10 = a7;
      uint64_t v11 = a6;
    }
    uint64_t v29 = [(USBCPDAccess *)self LocalExecuteCommand:1396917577 withDelay:1 canRetry:v9 canRecover:a9];
    if (!v29)
    {
      int v59 = 0;
      unint64_t v61 = 4;
      unsigned int v40 = [(PDController *)self->super._pdController registerRead:&v59 ofLength:4 atAddress:19 andOutReadLength:&v61];
      if (v40)
      {
        signed int v41 = v40;
        id v21 = [v17[106] dictionary];
        unsigned int v42 = +[NSNumber numberWithUnsignedLong:v41];
        [v21 setObject:v42 forKeyedSubscript:@"IOReturn result"];

        id v23 = v18[102];
        CFStringRef v24 = v16;
        uint64_t v25 = 6148;
        goto LABEL_10;
      }
      if (SBYTE2(v59) < 0)
      {
        id v21 = [v17[106] dictionary];
        v48 = +[NSNumber numberWithUnsignedLong:((unint64_t)BYTE2(v59) >> 2) & 0x1F];
        [v21 setObject:v48 forKeyedSubscript:@"Error Code"];

        uint64_t v49 = +[NSString stringWithFormat:@"IECSResults[] = 0x%02X 0x%02X 0x%02X 0x%02X", v59, BYTE1(v59), BYTE2(v59), HIBYTE(v59)];
        [v21 setObject:v49 forKeyedSubscript:@"Notes"];

        id v23 = v18[102];
        CFStringRef v24 = v16;
        uint64_t v25 = 6149;
        goto LABEL_10;
      }
      if ((HIBYTE(v59) & 0x7Fu) >= a5) {
        unint64_t v43 = a5;
      }
      else {
        unint64_t v43 = HIBYTE(v59) & 0x7F;
      }
      unint64_t v44 = v43;
      unsigned int v45 = [(PDController *)self->super._pdController registerRead:a4 ofLength:v43 atAddress:9 andOutReadLength:&v61];
      if (v45)
      {
        signed int v46 = v45;
        id v21 = [v17[106] dictionary];
        uint64_t v47 = +[NSNumber numberWithUnsignedLong:v46];
        [v21 setObject:v47 forKeyedSubscript:@"IOReturn result"];

        id v23 = v18[102];
        CFStringRef v24 = v16;
        uint64_t v25 = 6150;
        goto LABEL_10;
      }
      uint64_t v29 = 0;
      unsigned int v30 = v61;
      if (v61 >= v44) {
        unsigned int v30 = v44;
      }
      goto LABEL_12;
    }
LABEL_19:
    BOOL v39 = v29 != 0;
    if (!v29 || v14 < 1) {
      goto LABEL_37;
    }
    if (!a9
      || ![(USBCAcePDAccess *)self attemptErrorRecovery:v29 lastAttempt:v14 == 1])
    {
      break;
    }

    --v14;
    size_t v15 = v56;
    uint64_t v12 = a4;
  }
  BOOL v39 = 1;
  --v14;
LABEL_37:
  if (v39 && !v14)
  {
    char v50 = [v17[106] dictionary];
    [v50 setObject:v29 forKeyedSubscript:@"Previous Error Response"];
    uint64_t v51 = [v18[102] errorWithDomain:v16 code:13060 userInfo:v50];

    uint64_t v29 = (void *)v51;
  }
  return v29;
}

- (id)IECSWriteReg:(BOOL)a3 buffer:(const void *)a4 bufferLength:(unsigned int)a5 registerAddress:(unsigned int)a6 canRetry:(BOOL)a7 canRecover:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a6;
  BOOL v10 = a3;
  if (a7) {
    int v12 = 3;
  }
  else {
    int v12 = 0;
  }
  char v42 = a5;
  uint64_t v43 = a5;
  if (!a3) {
    goto LABEL_7;
  }
LABEL_5:
  unsigned int v13 = [(PDController *)self->super._pdController registerWrite:a4 ofLength:v43 atAddress:v9];
  if (v13)
  {
    signed int v14 = v13;
    size_t v15 = +[NSMutableDictionary dictionary];
    CFStringRef v16 = +[NSNumber numberWithUnsignedLong:v14];
    [v15 setObject:v16 forKeyedSubscript:@"IOReturn result"];

    uint64_t v17 = 6400;
LABEL_11:
    CFStringRef v24 = v15;
LABEL_12:
    uint64_t v25 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:v17 userInfo:v24];

    while (1)
    {
      BOOL v26 = v25 != 0;
      if (!v25 || v12 < 1) {
        goto LABEL_32;
      }
      if (!v8
        || ![(USBCAcePDAccess *)self attemptErrorRecovery:v25 lastAttempt:v12 == 1])
      {
        break;
      }

      --v12;
      if (v10) {
        goto LABEL_5;
      }
LABEL_7:
      v49[0] = 0;
      v49[1] = v9;
      v49[2] = 0;
      v49[3] = v42;
      unsigned int v18 = [(PDController *)self->super._pdController registerWrite:v49 ofLength:4 atAddress:19];
      if (v18)
      {
        signed int v19 = v18;
        size_t v15 = +[NSMutableDictionary dictionary];
        signed int v20 = +[NSNumber numberWithUnsignedLong:v19];
        [v15 setObject:v20 forKeyedSubscript:@"IOReturn result"];

        uint64_t v17 = 6402;
        goto LABEL_11;
      }
      unsigned int v21 = [(PDController *)self->super._pdController registerWrite:a4 ofLength:v43 atAddress:9];
      if (v21)
      {
        signed int v22 = v21;
        size_t v15 = +[NSMutableDictionary dictionary];
        id v23 = +[NSNumber numberWithUnsignedLong:v22];
        [v15 setObject:v23 forKeyedSubscript:@"IOReturn result"];

        uint64_t v17 = 6403;
        goto LABEL_11;
      }
      uint64_t v27 = [(USBCAcePDAccess *)self VerifyPowerRole];
      if (v27)
      {
        uint64_t v28 = (void *)v27;
        unsigned int v29 = 0;
        do
        {
          unsigned int v30 = v28;
          usleep(0x3D0900u);
          uint64_t v28 = [(USBCAcePDAccess *)self VerifyPowerRole];

          if (v29 > 3) {
            break;
          }
          ++v29;
        }
        while (v28);
      }
      uint64_t v25 = [(USBCPDAccess *)self LocalExecuteCommand:1396917577];
      if (!v25)
      {
        uint64_t v45 = 4;
        unsigned int v31 = [(PDController *)self->super._pdController registerRead:v46 ofLength:4 atAddress:19 andOutReadLength:&v45];
        if (v31)
        {
          signed int v32 = v31;
          signed int v41 = +[NSMutableDictionary dictionary];
          v33 = +[NSNumber numberWithUnsignedLong:v32];
          BOOL v34 = v41;
          [v41 setObject:v33 forKeyedSubscript:@"IOReturn result"];

          size_t v15 = v41;
          uint64_t v17 = 6404;
LABEL_27:
          CFStringRef v24 = v34;
          goto LABEL_12;
        }
        if ((char)v47 < 0)
        {
          BOOL v34 = +[NSMutableDictionary dictionary];
          long long v35 = +[NSNumber numberWithUnsignedLong:((unint64_t)v47 >> 2) & 0x1F];
          [v34 setObject:v35 forKeyedSubscript:@"Error Code"];

          CFStringRef v36 = +[NSString stringWithFormat:@"IECSResults[] = 0x%02X 0x%02X 0x%02X 0x%02X", v46[0], v46[1], v47, v48];
          [v34 setObject:v36 forKeyedSubscript:@"Notes"];

          size_t v15 = v34;
          uint64_t v17 = 6405;
          goto LABEL_27;
        }
        uint64_t v25 = 0;
      }
    }
    BOOL v26 = 1;
    --v12;
LABEL_32:
    if (v26 && v12 == 0)
    {
      long long v38 = +[NSMutableDictionary dictionary];
      [v38 setObject:v25 forKeyedSubscript:@"Previous Error Response"];
      uint64_t v39 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:13061 userInfo:v38];

      uint64_t v25 = (void *)v39;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }
  return v25;
}

@end