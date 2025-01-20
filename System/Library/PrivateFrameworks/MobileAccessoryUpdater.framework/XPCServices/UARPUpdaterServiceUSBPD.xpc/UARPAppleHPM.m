@interface UARPAppleHPM
- (AppleHPMLibInterfaceStructV3)deviceInterface;
- (BOOL)accMode7AddressSpaceRead:(unsigned int)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 lengthRead:(unsigned int *)a6 error:(id *)a7;
- (BOOL)accMode7AddressSpaceWrite:(unsigned int)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 error:(id *)a6;
- (BOOL)accMode7ClearLogs:(id *)a3;
- (BOOL)accMode7FirmwareApply:(id *)a3;
- (BOOL)accMode7FirmwareHasStagedAssets:(id *)a3;
- (BOOL)accMode7FirmwareRescind:(id *)a3;
- (BOOL)accMode7FirmwareUpdateAllowed:(id *)a3;
- (BOOL)accMode7FirmwareUpdateCleanup:(id *)a3;
- (BOOL)accMode7FirmwareUpdateGetState:(accMode7FirmwareUpdateState2 *)a3 error:(id *)a4;
- (BOOL)accMode7FirmwareUpdateInitialize:(id *)a3;
- (BOOL)accMode7FirmwareUpdateSendCommand:(unsigned int)a3 error:(id *)a4;
- (BOOL)accMode7FirmwareUpdateWriteData:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (BOOL)accMode7FirmwareVerifyStagedAsset:(id *)a3;
- (BOOL)accMode7SetLogLevel:(unint64_t)a3 error:(id *)a4;
- (BOOL)accMode7SolicitAnalytics:(id)a3 error:(id *)a4;
- (BOOL)accMode7SolicitLogs:(id)a3 modelName:(id)a4 serialNumber:(id)a5 error:(id *)a6;
- (BOOL)checkConnection:(id *)a3;
- (BOOL)connected;
- (BOOL)doAtomic4CC:(unsigned int)a3 data:(char *)a4 dataLength:(unsigned int)a5 extData:(unsigned int)a6 dataOut:(char *)a7 dataOutLength:(unsigned int)a8 dataOutLengthRead:(unsigned int *)a9 extDataOut:(unsigned int *)a10 error:(id *)a11;
- (BOOL)enabledCFUp;
- (BOOL)hasChargePassthru;
- (BOOL)hasMagSafe;
- (BOOL)iecsCommand:(unsigned int)a3 flags:(unsigned int)a4 error:(id *)a5;
- (BOOL)iecsRead:(unsigned int)a3 buffer:(char *)a4 length:(unsigned __int8)a5 lengthRead:(unint64_t *)a6 error:(id *)a7;
- (BOOL)iecsWrite:(unsigned int)a3 buffer:(char *)a4 length:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)isConnnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)legacyPAFirmwareUpdateCleanup:(id *)a3;
- (BOOL)legacyPAFirmwareUpdateInitialize:(id *)a3;
- (BOOL)legacyPAFirmwareUpdateWriteData:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (BOOL)legacyPAFirmwareVerifyStagedAsset:(id *)a3;
- (BOOL)probeVDOs:(id *)a3;
- (BOOL)processAppleVDO:(unsigned int)a3 error:(id *)a4;
- (BOOL)processAppleVDOs:(id *)a3;
- (BOOL)processCapabilityVDO:(id *)a3;
- (BOOL)processEndpointVDO:(id *)a3;
- (BOOL)processIOService:(unsigned int)a3;
- (BOOL)processVDOs:(id *)a3;
- (BOOL)readCFUa:(unsigned int)a3 remoteEndpoint:(unsigned int)a4 offset:(unsigned __int16)a5 buffer:(char *)a6 bufferLength:(unsigned int)a7 lengthRead:(unsigned int *)a8 error:(id *)a9;
- (BOOL)receiveVDM:(int *)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6 sequence:(char *)a7 checkSequence:(BOOL)a8 maxRetries:(unsigned int)a9 lengthReceived:(unint64_t *)a10 error:(id *)a11;
- (BOOL)receiveVDM:(int *)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6 sequence:(char *)a7 lengthReceived:(unint64_t *)a8 error:(id *)a9;
- (BOOL)sendVDM:(int)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6 error:(id *)a7;
- (BOOL)setCFUp:(BOOL)a3 error:(id *)a4;
- (BOOL)writeCFUa:(unsigned int)a3 remoteEndpoint:(unsigned int)a4 offset:(unsigned __int16)a5 buffer:(char *)a6 bufferLength:(unsigned int)a7 lengthWritten:(unsigned int *)a8 error:(id *)a9;
- (BOOL)writeCFUs:(unsigned int)a3 remoteEndpoint:(unsigned int)a4 protocol:(unsigned int)a5 buffer:(char *)a6 bufferLength:(unsigned int)a7 lengthWritten:(unsigned int *)a8 error:(id *)a9;
- (IOCFPlugInInterfaceStruct)pluginInterface;
- (NSString)firmwareVersionVDO;
- (NSString)hardwareVersionVDO;
- (NSString)manufacturerVDO;
- (NSString)modelStringVDO;
- (NSString)productNameVDO;
- (NSString)serialNumberVDO;
- (NSString)userStringVDO;
- (NSString)vendorNameVDO;
- (UARPAppleHPM)initWithIOService:(unsigned int)a3;
- (UARPHPMProtocol)sopDelegate;
- (UARPHPMProtocol)sopPrimeDelegate;
- (double)rxVdmRetryAverage;
- (id)accMode7StagedFwVersion:(id *)a3;
- (id)description;
- (int)sopType;
- (unint64_t)rxVdmNoRetryPacketCount;
- (unint64_t)rxVdmRetryMax;
- (unint64_t)rxVdmRetryMin;
- (unint64_t)rxVdmRetryPacketCount;
- (unsigned)rid;
- (void)checkForPassthroughCharging:(unsigned int)a3;
- (void)checkForPassthroughChargingOnAppleHPMDevice:(unsigned int)a3;
- (void)checkIfMagSafe:(unsigned int)a3;
- (void)clearVDOs;
- (void)dealloc;
- (void)handleNotConnected;
- (void)logBuffer:(int)a3 buffer:(char *)a4 length:(unsigned int)a5 desc:(id)a6;
- (void)setSopDelegate:(id)a3;
- (void)setSopPrimeDelegate:(id)a3;
- (void)setSopType:(int)a3;
- (void)updateRetryMetric:(unint64_t)a3;
@end

@implementation UARPAppleHPM

- (id)accMode7StagedFwVersion:(id *)a3
{
  unsigned int v12 = 0;
  uint64_t v11 = 0;
  unsigned int v4 = [(UARPAppleHPM *)self accMode7FirmwareUpdateGetState:&v11 error:a3];
  int v5 = v11;
  log = self->_log;
  BOOL v7 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO);
  if (v4 && v5 == 5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[UARPAppleHPM(AccMode7) accMode7StagedFwVersion:]";
      __int16 v15 = 1024;
      unsigned int v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: reporting staged fw version from accessory of %u", buf, 0x12u);
    }
    unsigned int v8 = v12;
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[UARPAppleHPM(AccMode7) accMode7StagedFwVersion:]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: could not report staged fw version from accessory", buf, 0xCu);
    }
    unsigned int v8 = 0;
  }
  id v9 = [objc_alloc((Class)UARPAssetVersion) initWithMajorVersion:HIBYTE(v8) & 0x7F minorVersion:BYTE2(v8) releaseVersion:BYTE1(v8) buildVersion:v8 & 0x80000000];
  return v9;
}

- (BOOL)accMode7FirmwareUpdateAllowed:(id *)a3
{
  int v16 = 0;
  uint64_t v15 = 0;
  if (![(UARPAppleHPM *)self accMode7FirmwareUpdateGetState:&v15 error:a3])
  {
    log = self->_log;
    BOOL v5 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v5) {
      return v5;
    }
    sub_100020AA4(log, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_5;
  }
  if (v15 != 7)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  unsigned int v4 = self->_log;
  BOOL v5 = os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO);
  if (v5)
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[UARPAppleHPM(AccMode7) accMode7FirmwareUpdateAllowed:]";
    __int16 v19 = 1024;
    int v20 = HIDWORD(v15);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_INFO, "%s: Firmware udpate is BLOCKED, (error %u)", buf, 0x12u);
LABEL_5:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)accMode7FirmwareUpdateInitialize:(id *)a3
{
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100020EB0();
  }
  int v38 = 0;
  uint64_t v37 = 0;
  if (![(UARPAppleHPM *)self accMode7FirmwareUpdateGetState:&v37 error:a3])
  {
    log = self->_log;
    BOOL v6 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v6) {
      return v6;
    }
    goto LABEL_9;
  }
  if (v37 == 1)
  {
LABEL_19:
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_100020D90();
    }
    unsigned __int8 v17 = [(UARPAppleHPM *)self accMode7FirmwareUpdateSendCommand:2 error:a3];
    v18 = self->_log;
    if ((v17 & 1) == 0)
    {
      BOOL v6 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      sub_100020D18(v18, v20, v21, v22, v23, v24, v25, v26);
      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_100020CE4();
    }
    int v19 = 300;
    while (1)
    {
      if (![(UARPAppleHPM *)self accMode7FirmwareUpdateGetState:&v37 error:a3])
      {
        log = self->_log;
        BOOL v6 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
        if (!v6) {
          return v6;
        }
        goto LABEL_9;
      }
      if (v37 != 2) {
        break;
      }
      sleepMS(100);
      if (!--v19) {
        goto LABEL_37;
      }
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100020C70();
    }
LABEL_37:
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_100020C3C();
    }
    if ([(UARPAppleHPM *)self accMode7FirmwareUpdateGetState:&v37 error:a3])
    {
      v35 = self->_log;
      if (v37 == 3)
      {
        if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEBUG)) {
          sub_100020B1C();
        }
        LOBYTE(v6) = 1;
        return v6;
      }
      BOOL v6 = os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      sub_100020B50();
      goto LABEL_10;
    }
    log = self->_log;
    BOOL v6 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v6) {
      return v6;
    }
LABEL_9:
    sub_100020BC4(log, v8, v9, v10, v11, v12, v13, v14);
LABEL_10:
    LOBYTE(v6) = 0;
    return v6;
  }
  if (v37 == 7)
  {
    BOOL v5 = self->_log;
    BOOL v6 = os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_INFO);
    if (!v6) {
      return v6;
    }
    *(_DWORD *)buf = 136315394;
    v40 = "-[UARPAppleHPM(AccMode7) accMode7FirmwareUpdateInitialize:]";
    __int16 v41 = 1024;
    int v42 = HIDWORD(v37);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_INFO, "%s: Firmware udpate is BLOCKED, (error %d)", buf, 0x12u);
    goto LABEL_10;
  }
  uint64_t v15 = self->_log;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[UARPAppleHPM(AccMode7) accMode7FirmwareUpdateInitialize:]";
    __int16 v41 = 1024;
    int v42 = v37;
    __int16 v43 = 1024;
    int v44 = HIDWORD(v37);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_INFO, "%s: Expected Idle, but in state %d (error %d). Attempting to recover.", buf, 0x18u);
  }
  if (![(UARPAppleHPM *)self accMode7FirmwareUpdateSendCommand:1 error:a3])
  {
    v27 = self->_log;
    BOOL v6 = os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR);
    if (!v6) {
      return v6;
    }
    sub_100020E38(v27, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_10;
  }
  int v16 = 300;
  do
  {
    if (![(UARPAppleHPM *)self accMode7FirmwareUpdateGetState:&v37 error:a3])
    {
      log = self->_log;
      BOOL v6 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
      if (!v6) {
        return v6;
      }
      goto LABEL_9;
    }
    if (v37 == 1) {
      goto LABEL_19;
    }
    sleepMS(100);
    --v16;
  }
  while (v16);
  if (v37 == 1) {
    goto LABEL_19;
  }
  BOOL v6 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    sub_100020DC4();
    goto LABEL_10;
  }
  return v6;
}

- (BOOL)accMode7FirmwareUpdateWriteData:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  __int16 v6 = a4;
  id v8 = a3;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100020EE4();
  }
  if ([v8 length])
  {
    unint64_t v9 = 0;
    while (1)
    {
      int v20 = v6 & 0x3FF | 0x800;
      id v10 = objc_alloc_init((Class)NSMutableData);
      [v10 appendBytes:&v20 length:4];
      uint64_t v11 = (char *)[v8 length];
      uint64_t v12 = (unint64_t)&v11[-v9] >= 0x3C ? 60 : (uint64_t)&v11[-v9];
      uint64_t v13 = objc_msgSend(v8, "subdataWithRange:", v9, v12);
      [v10 appendData:v13];
      unsigned int v19 = 0;
      id v14 = v10;
      if (!-[UARPAppleHPM writeCFUs:remoteEndpoint:protocol:buffer:bufferLength:lengthWritten:error:](self, "writeCFUs:remoteEndpoint:protocol:buffer:bufferLength:lengthWritten:error:", 0, 1, 4, [v14 mutableBytes], objc_msgSend(v14, "length"), &v19, a5))break; {
      uint64_t v15 = v19;
      }
      if (v12 != v19)
      {
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          int v22 = v12;
          __int16 v23 = 1024;
          unsigned int v24 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "write mismatch! expected %u actual %u", buf, 0xEu);
        }
        uint64_t v15 = v19;
      }
      v6 += v15;
      v9 += v15;

      if (v9 >= (unint64_t)[v8 length]) {
        goto LABEL_14;
      }
    }

    BOOL v17 = 0;
  }
  else
  {
LABEL_14:
    BOOL v17 = 1;
  }

  return v17;
}

- (BOOL)accMode7FirmwareVerifyStagedAsset:(id *)a3
{
  if (![(UARPAppleHPM *)self accMode7FirmwareUpdateSendCommand:3 error:a3])
  {
    log = self->_log;
    BOOL v7 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    sub_1000210AC(log, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_22;
  }
  int v5 = 300;
  while (1)
  {
    int v25 = 0;
    uint64_t v24 = 0;
    if (![(UARPAppleHPM *)self accMode7FirmwareUpdateGetState:&v24 error:a3])
    {
      uint64_t v15 = self->_log;
      if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      goto LABEL_10;
    }
    if (v24 != 4) {
      break;
    }
    sleepMS(100);
    if (!--v5) {
      goto LABEL_13;
    }
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_100021038();
  }
LABEL_13:
  int v25 = 0;
  uint64_t v24 = 0;
  if (![(UARPAppleHPM *)self accMode7FirmwareUpdateGetState:&v24 error:a3])
  {
    uint64_t v15 = self->_log;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
LABEL_10:
    }
      sub_100020FC0(v15, v16, v17, v18, v19, v20, v21, v22);
LABEL_22:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (v24 != 5)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100020F4C();
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100020F18();
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)accMode7FirmwareUpdateCleanup:(id *)a3
{
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100021124();
  }
  return 1;
}

- (BOOL)accMode7FirmwareApply:(id *)a3
{
  BOOL v4 = [(UARPAppleHPM *)self accMode7FirmwareUpdateSendCommand:4 error:a3];
  log = self->_log;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
      sub_100021158();
    }
  }
  else if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
  {
    sub_10002118C(log, v6, v7, v8, v9, v10, v11, v12);
  }
  return v4;
}

- (BOOL)accMode7FirmwareHasStagedAssets:(id *)a3
{
  int v15 = 0;
  uint64_t v14 = 0;
  if (![(UARPAppleHPM *)self accMode7FirmwareUpdateGetState:&v14 error:a3])
  {
    log = self->_log;
    BOOL v4 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v4) {
      return v4;
    }
    sub_100021278(log, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_9;
  }
  if (v14 != 5)
  {
    BOOL v4 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v4) {
      return v4;
    }
    sub_100021204();
LABEL_9:
    LOBYTE(v4) = 0;
    return v4;
  }
  LOBYTE(v4) = 1;
  return v4;
}

- (BOOL)accMode7FirmwareRescind:(id *)a3
{
  BOOL v4 = [(UARPAppleHPM *)self accMode7FirmwareUpdateSendCommand:1 error:a3];
  log = self->_log;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
      sub_1000212F0();
    }
  }
  else if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
  {
    sub_100021324(log, v6, v7, v8, v9, v10, v11, v12);
  }
  return v4;
}

- (BOOL)accMode7SolicitLogs:(id)a3 modelName:(id)a4 serialNumber:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (char *)uarpAssetTagStructLogs();
  id v14 = [objc_alloc((Class)UARPAssetTag) initWithChar1:*v13 char2:v13[1] char3:v13[2] char4:v13[3]];
  int v15 = uarpDynamicAssetComponentURL();
  v58 = +[NSFileHandle fileHandleForWritingToURL:v15 error:a6];
  if (!v58)
  {
    BOOL v28 = 0;
    goto LABEL_55;
  }
  v56 = v15;
  id v57 = v14;
  uint64_t v55 = (uint64_t)v10;
  unsigned int v16 = 0;
  while (1)
  {
    unsigned int v17 = v16 & 0x3FF;
    if ((v16 & 0x3FF) == 0)
    {
      *(_DWORD *)buf = v16 >> 10;
      LODWORD(v67[0]) = 0;
      if (![(UARPAppleHPM *)self writeCFUa:0 remoteEndpoint:1 offset:28672 buffer:buf bufferLength:4 lengthWritten:v67 error:a6])break; {
    }
      }
    memset(v67, 0, sizeof(v67));
    if (v17 <= 0x3E8) {
      uint64_t v18 = 24;
    }
    else {
      uint64_t v18 = 1024 - v17;
    }
    unsigned int v60 = 0;
    if (![(UARPAppleHPM *)self readCFUa:0 remoteEndpoint:1 offset:v17 | 0x7000 buffer:v67 bufferLength:v18 lengthRead:&v60 error:a6])
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_100021594(log, v31, v32, v33, v34, v35, v36, v37);
      }
      goto LABEL_41;
    }
    if (!v60) {
      goto LABEL_30;
    }
    v16 += v60;
    if (*((unsigned __int8 *)v67 + v60 - 1) == 255)
    {
      uint64_t v20 = self->_log;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "-[UARPAppleHPM(AccMode7) accMode7SolicitLogs:modelName:serialNumber:error:]";
        __int16 v63 = 1024;
        unsigned int v64 = v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_INFO, "%s: EOF reached at %u", buf, 0x12u);
      }
      unsigned int v21 = v60 - 1;
    }
    else
    {
      if (v60 < 2 || *((unsigned __int8 *)v67 + v60 - 2) != 255 || *((unsigned char *)v67 + v60 - 3))
      {
        char v19 = 1;
        goto LABEL_20;
      }
      v27 = self->_log;
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v62 = "-[UARPAppleHPM(AccMode7) accMode7SolicitLogs:modelName:serialNumber:error:]";
        __int16 v63 = 1024;
        unsigned int v64 = v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_INFO, "%s: EOF reached at %u", buf, 0x12u);
      }
      unsigned int v21 = v60 - 2;
    }
    unsigned int v60 = v21;
    if (!v21)
    {
LABEL_30:
      uint64_t v29 = self->_log;
      if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v62 = "-[UARPAppleHPM(AccMode7) accMode7SolicitLogs:modelName:serialNumber:error:]";
        __int16 v63 = 1024;
        unsigned int v64 = v18;
        __int16 v65 = 1024;
        LODWORD(v66) = v60;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v29, OS_LOG_TYPE_INFO, "%s: Requested %ul bytes, got %u bytes", buf, 0x18u);
      }
      goto LABEL_41;
    }
    char v19 = 0;
LABEL_20:
    if (v16 > 0x10000)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_10002147C();
      }
      goto LABEL_41;
    }
    __int16 v23 = +[NSData dataWithBytes:v67 length:v60];
    uint64_t v24 = self->_log;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v62 = "-[UARPAppleHPM(AccMode7) accMode7SolicitLogs:modelName:serialNumber:error:]";
      __int16 v63 = 1024;
      unsigned int v64 = v16 - v60;
      __int16 v65 = 2112;
      v66 = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_INFO, "%s: read logs offset %u %@", buf, 0x1Cu);
    }
    id v59 = 0;
    unsigned __int8 v25 = [v58 uarpWriteData:v23 error:&v59];
    id v26 = v59;
    if ((v25 & 1) == 0)
    {
      int v38 = self->_log;
      if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_ERROR)) {
        sub_1000214FC((uint64_t)v23, v55, (os_log_t)v38);
      }

      goto LABEL_41;
    }

    if ((v19 & 1) == 0) {
      goto LABEL_41;
    }
  }
  v39 = self->_log;
  if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR)) {
    sub_10002160C(v39, v40, v41, v42, v43, v44, v45, v46);
  }
LABEL_41:
  [v58 uarpCloseAndReturnError:0];
  id v47 = [objc_alloc((Class)UARPAssetVersion) initWithMajorVersion:0 minorVersion:0 releaseVersion:0 buildVersion:0];
  id v48 = [objc_alloc((Class)UARPSuperBinaryAsset) initWithFormatVersion:3 assetVersion:v47];
  id v49 = [objc_alloc((Class)UARPSuperBinaryAssetTLV) initWithType:272691969 stringValue:v11];
  [v48 addMetaDataTLV:v49];

  id v50 = [objc_alloc((Class)UARPSuperBinaryAssetTLV) initWithType:272691970 stringValue:v12];
  [v48 addMetaDataTLV:v50];

  id v51 = [objc_alloc((Class)UARPSuperBinaryAssetPayload) initWithPayloadTag:v57 assetVersion:v47];
  if ([v51 setPayloadToContentsOfURL:v56 friendlyName:@"Logs"])
  {
    id v52 = [objc_alloc((Class)UARPSuperBinaryAssetTLV) initWithType:272691968 stringValue:@"MagSafe.logs"];
    [v51 addMetaDataTLV:v52];
    [v48 addPayload:v51];
    id v10 = (id)v55;
    if ([v48 writeToURL:v55 error:a6])
    {
      if ([(UARPAppleHPM *)self accMode7ClearLogs:a6])
      {
        BOOL v28 = 1;
        goto LABEL_53;
      }
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_10002139C();
      }
    }
    else
    {
      v53 = self->_log;
      if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_ERROR)) {
        sub_1000213D0(v55, (uint64_t)v48, v53);
      }
    }
    BOOL v28 = 0;
LABEL_53:
  }
  else
  {
    id v10 = (id)v55;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100021448();
    }
    BOOL v28 = 0;
  }

  int v15 = v56;
  id v14 = v57;
LABEL_55:

  return v28;
}

- (BOOL)accMode7SetLogLevel:(unint64_t)a3 error:(id *)a4
{
  int v9 = 0;
  int v10 = a3;
  BOOL v6 = [(UARPAppleHPM *)self writeCFUa:0 remoteEndpoint:1 offset:28676 buffer:&v10 bufferLength:4 lengthWritten:&v9 error:a4];
  if (!v6)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100021684(a3, log);
    }
  }
  return v6;
}

- (BOOL)accMode7ClearLogs:(id *)a3
{
  int v14 = 0;
  int v15 = 1816356684;
  BOOL v4 = [(UARPAppleHPM *)self writeCFUa:0 remoteEndpoint:1 offset:28680 buffer:&v15 bufferLength:4 lengthWritten:&v14 error:a3];
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100021710(log, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  return v4;
}

- (BOOL)accMode7SolicitAnalytics:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (char *)uarpAssetTagStructAnalytics();
  id v8 = [objc_alloc((Class)UARPAssetTag) initWithChar1:*v7 char2:v7[1] char3:v7[2] char4:v7[3]];
  uint64_t v9 = uarpDynamicAssetComponentURL();
  uint64_t v44 = +[NSFileHandle fileHandleForWritingToURL:v9 error:a4];
  if (v44)
  {
    id v41 = v8;
    uint64_t v42 = (uint64_t)v6;
    uint64_t v43 = self;
    unsigned int v10 = 0;
    while (1)
    {
      unsigned int v46 = 0;
      if (![(UARPAppleHPM *)self readCFUa:0 remoteEndpoint:1 offset:(unsigned __int16)(v10 - 24576) buffer:v51 bufferLength:24 lengthRead:&v46 error:a4]&& !v46)
      {
        break;
      }
      if (!v46) {
        goto LABEL_19;
      }
      id v12 = objc_alloc((Class)NSString);
      id v13 = objc_msgSend(v12, "initWithFormat:", @"%.*s", v46, v51);
      int v14 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v13 UTF8String], objc_msgSend(v13, "lengthOfBytesUsingEncoding:", 4));
      id v45 = 0;
      unsigned __int8 v15 = [v44 uarpWriteData:v14 error:&v45];
      id v16 = v45;
      if ((v15 & 1) == 0)
      {
        log = v43->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v48 = v13;
          __int16 v49 = 2112;
          uint64_t v50 = v42;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Error writing analytics string %@ to %@", buf, 0x16u);
        }

        self = v43;
        goto LABEL_19;
      }

      v10 += v46;
      if (v10 >= 0x401)
      {
        self = v43;
        if (os_log_type_enabled((os_log_t)v43->_log, OS_LOG_TYPE_ERROR)) {
          sub_1000218AC();
        }
LABEL_19:
        [v44 uarpCloseAndReturnError:0];
        id v27 = [objc_alloc((Class)UARPAssetVersion) initWithMajorVersion:0 minorVersion:0 releaseVersion:0 buildVersion:0];
        id v28 = [objc_alloc((Class)UARPSuperBinaryAsset) initWithFormatVersion:3 assetVersion:v27];
        id v8 = v41;
        id v29 = [objc_alloc((Class)UARPSuperBinaryAssetPayload) initWithPayloadTag:v41 assetVersion:v27];
        if ([v29 setPayloadToContentsOfURL:v9 friendlyName:0])
        {
          id v30 = [objc_alloc((Class)UARPSuperBinaryAssetTLV) initWithType:1483412481 unsignedInt32:0];
          [v29 addMetaDataTLV:v30];
          [v28 addPayload:v29];
          id v6 = (id)v42;
          if ([v28 writeToURL:v42 error:a4])
          {
            v51[0] = 1816357953;
            *(_DWORD *)buf = 0;
            unsigned __int8 v17 = [(UARPAppleHPM *)v43 writeCFUa:0 remoteEndpoint:1 offset:40960 buffer:v51 bufferLength:4 lengthWritten:buf error:a4];
            if ((v17 & 1) == 0)
            {
              uint64_t v31 = v43->_log;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                sub_100021788(v31, v32, v33, v34, v35, v36, v37, v38);
              }
            }
          }
          else
          {
            v39 = v43->_log;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              sub_100021800((uint64_t)v28, v42, v39);
            }
            unsigned __int8 v17 = 0;
          }
        }
        else
        {
          id v6 = (id)v42;
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            sub_100021878();
          }
          unsigned __int8 v17 = 0;
        }

        goto LABEL_32;
      }
      self = v43;
      if (!v46) {
        goto LABEL_19;
      }
    }
    uint64_t v18 = self->_log;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
      sub_10002192C(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    unsigned __int8 v17 = 0;
    id v8 = v41;
    id v6 = (id)v42;
  }
  else
  {
    unsigned __int8 v17 = 0;
  }
LABEL_32:

  return v17;
}

- (BOOL)accMode7FirmwareUpdateGetState:(accMode7FirmwareUpdateState2 *)a3 error:(id *)a4
{
  int v17 = 0;
  if ([(UARPAppleHPM *)self accMode7AddressSpaceRead:1 buffer:a3 bufferLength:12 lengthRead:&v17 error:a4])
  {
    if (v17 == 8)
    {
      a3->var1 = -1;
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        sub_100021AE4();
      }
      goto LABEL_10;
    }
    if (v17 == 12)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        sub_100021A44();
      }
LABEL_10:
      LOBYTE(v7) = 1;
      return v7;
    }
    log = self->_log;
    BOOL v7 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    sub_1000219A4(&v17, log);
LABEL_13:
    LOBYTE(v7) = 0;
    return v7;
  }
  id v6 = self->_log;
  BOOL v7 = os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    sub_100021B64(v6, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_13;
  }
  return v7;
}

- (BOOL)accMode7FirmwareUpdateSendCommand:(unsigned int)a3 error:(id *)a4
{
  unsigned int v15 = a3;
  BOOL v5 = [(UARPAppleHPM *)self accMode7AddressSpaceWrite:1 buffer:&v15 bufferLength:4 error:a4];
  if (!v5)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100021BDC(log, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return v5;
}

- (BOOL)accMode7AddressSpaceRead:(unsigned int)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 lengthRead:(unsigned int *)a6 error:(id *)a7
{
  if (a5)
  {
    unsigned int v12 = 0;
    __int16 v13 = (_WORD)a3 << 10;
    while (1)
    {
      unsigned int v24 = 0;
      uint64_t v14 = v12 + 24 <= a5 ? 24 : a5 - v12;
      if (![(UARPAppleHPM *)self readCFUa:0 remoteEndpoint:1 offset:(unsigned __int16)(v12 + v13) buffer:(char *)a4 + v12 bufferLength:v14 lengthRead:&v24 error:a7])break; {
      v12 += v24;
      }
      if (v24 < 0x18 || v12 >= a5) {
        goto LABEL_11;
      }
    }
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100021C54(log, v17, v18, v19, v20, v21, v22, v23);
    }
    return 0;
  }
  else
  {
    unsigned int v12 = 0;
LABEL_11:
    if (a6) {
      *a6 = v12;
    }
    return 1;
  }
}

- (BOOL)accMode7AddressSpaceWrite:(unsigned int)a3 buffer:(void *)a4 bufferLength:(unsigned int)a5 error:(id *)a6
{
  if (!a5) {
    return 1;
  }
  unsigned int v10 = 0;
  __int16 v11 = (_WORD)a3 << 10;
  while (1)
  {
    unsigned int v22 = 0;
    uint64_t v12 = v10 + 20 <= a5 ? 20 : a5 - v10;
    if (![(UARPAppleHPM *)self writeCFUa:0 remoteEndpoint:1 offset:(unsigned __int16)(v10 + v11) buffer:(char *)a4 + v10 bufferLength:v12 lengthWritten:&v22 error:a6])break; {
    if (v22 > 0x13)
    }
    {
      v10 += v22;
      if (v10 < a5) {
        continue;
      }
    }
    return 1;
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
    sub_100021CCC(log, v15, v16, v17, v18, v19, v20, v21);
  }
  return 0;
}

- (BOOL)legacyPAFirmwareUpdateInitialize:(id *)a3
{
  unsigned __int8 v5 = [(UARPAppleHPM *)self setCFUp:1 error:a3];
  log = self->_log;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[UARPAppleHPM(LegacyPA) legacyPAFirmwareUpdateInitialize:]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Enabled CFUp", buf, 0xCu);
    }
    *(void *)buf = 0x5AC000305AC8006;
    *(_DWORD *)&buf[8] = 276854784;
    if ([(UARPAppleHPM *)self sendVDM:0 buffer:buf length:12 flags:0 error:a3])
    {
      uint64_t v7 = 0;
      while (1)
      {
        char v52 = 0;
        int sopType = self->_sopType;
        uint64_t v50 = 0;
        LODWORD(v49) = 100;
        if (![(UARPAppleHPM *)self receiveVDM:&sopType buffer:v53 length:28 flags:0 sequence:&v52 checkSequence:1 maxRetries:v49 lengthReceived:&v50 error:a3])break; {
        if (v53[0] == 95158275)
        }
        {
          [(UARPAppleHPM *)self updateRetryMetric:v7];
          v53[0] = 95158275;
          BOOL v39 = [(UARPAppleHPM *)self sendVDM:0 buffer:v53 length:4 flags:0 error:a3];
          id v41 = self->_log;
          if (v39)
          {
            if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEBUG)) {
              sub_100020B1C();
            }
          }
          else if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_ERROR))
          {
            sub_100023278(v41, v42, v43, v44, v45, v46, v47, v48);
          }
          return v39;
        }
        if (++v7 == 100)
        {
          uint64_t v8 = self->_log;
          if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
            sub_1000232F0(v8, v9, v10, v11, v12, v13, v14, v15);
          }
          return 0;
        }
      }
      uint64_t v31 = self->_log;
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR)) {
        sub_100023368(v31, v32, v33, v34, v35, v36, v37, v38);
      }
    }
    else
    {
      uint64_t v23 = self->_log;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
        sub_100023278(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000233E0(log, v16, v17, v18, v19, v20, v21, v22);
  }
  return 0;
}

- (BOOL)legacyPAFirmwareUpdateWriteData:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100020EE4();
  }
  if ([v7 length])
  {
    uint64_t v8 = 0;
    while (2)
    {
      uint64_t v37 = v8;
      uint64_t v9 = 0;
      while (1)
      {
        char v40 = 0;
        int sopType = self->_sopType;
        v47[0] = 0;
        uint64_t v38 = 0;
        LODWORD(v34) = 100;
        if (![(UARPAppleHPM *)self receiveVDM:&sopType buffer:v47 length:28 flags:0 sequence:&v40 checkSequence:1 maxRetries:v34 lengthReceived:&v38 error:a5])
        {
          log = self->_log;
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
            sub_100023550(log, v17, v18, v19, v20, v21, v22, v23);
          }
          goto LABEL_23;
        }
        if (v47[0] == 95159809) {
          break;
        }
        uint64_t v10 = self->_log;
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v42 = "-[UARPAppleHPM(LegacyPA) legacyPAFirmwareUpdateWriteData:offset:error:]";
          __int16 v43 = 1024;
          int v44 = 95159809;
          __int16 v45 = 1024;
          int v46 = v47[0];
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEBUG, "%s: RX VDM Expected 0x%08x, got 0x%08x", buf, 0x18u);
        }
        sleepMS(5);
        if (++v9 == 100)
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            sub_1000234D0();
          }
LABEL_23:
          BOOL v15 = 0;
          goto LABEL_24;
        }
      }
      [(UARPAppleHPM *)self updateRetryMetric:v9];
      sleepMS(10);
      id v11 = objc_alloc_init((Class)NSMutableData);
      uint64_t v12 = (char *)[v7 length];
      if ((unint64_t)&v12[-v37] >= 0x18) {
        uint64_t v13 = 24;
      }
      else {
        uint64_t v13 = (uint64_t)&v12[-v37];
      }
      v47[0] = (v13 << 6) | 0x5AC0011;
      [v11 appendBytes:v47 length:4];
      uint64_t v36 = v7;
      uint64_t v35 = objc_msgSend(v7, "subdataWithRange:", v37, v13);
      objc_msgSend(v11, "appendData:");
      id v14 = v11;
      if (-[UARPAppleHPM sendVDM:buffer:length:flags:error:](self, "sendVDM:buffer:length:flags:error:", 0, [v14 bytes], objc_msgSend(v14, "length"), 0, a5))
      {
        uint64_t v8 = v13 + v37;

        id v7 = v36;
        BOOL v15 = 1;
        if (v13 + v37 < (unint64_t)[v36 length]) {
          continue;
        }
      }
      else
      {
        uint64_t v26 = self->_log;
        if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR)) {
          sub_100023458(v26, v27, v28, v29, v30, v31, v32, v33);
        }

        BOOL v15 = 0;
        id v7 = v36;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 1;
  }
LABEL_24:

  return v15;
}

- (BOOL)legacyPAFirmwareVerifyStagedAsset:(id *)a3
{
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_10002391C();
  }
  v19[0] = 0x5AC000405AC8006;
  BOOL v5 = [(UARPAppleHPM *)self sendVDM:0 buffer:v19 length:8 flags:0 error:a3];
  log = self->_log;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_100023814(log);
    }
    id v7 = self->_log;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100023784(v7);
    }
    uint64_t v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000236E8(v8);
    }
    uint64_t v9 = self->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100023658(v9);
    }
    uint64_t v10 = self->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000235C8(v10);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000238A4(log, v11, v12, v13, v14, v15, v16, v17);
  }
  return v5;
}

- (BOOL)legacyPAFirmwareUpdateCleanup:(id *)a3
{
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100021124();
  }
  BOOL v5 = [(UARPAppleHPM *)self setCFUp:0 error:a3];
  log = self->_log;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315138;
      uint64_t v16 = "-[UARPAppleHPM(LegacyPA) legacyPAFirmwareUpdateCleanup:]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Disabled CFUp", (uint8_t *)&v15, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
  {
    sub_100023950(log, v7, v8, v9, v10, v11, v12, v13);
  }
  return v5;
}

- (UARPAppleHPM)initWithIOService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)UARPAppleHPM;
  BOOL v4 = [(UARPAppleHPM *)&v12 init];
  if (v4)
  {
    os_log_t v5 = os_log_create("com.apple.accessoryupdater.uarp", "hpm");
    log = v4->_log;
    v4->_log = (OS_os_log *)v5;

    v4->_rid = -1;
    v4->_int sopType = 3;
    v4->_lastRxSequence = -1;
    uint64_t v7 = +[NSUUID UUID];
    uuid = v4->_uuid;
    v4->_uuid = (NSUUID *)v7;

    if (![(UARPAppleHPM *)v4 processIOService:v3])
    {
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    uint64_t v9 = v4->_log;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Initialized HPM %@", buf, 0xCu);
    }
  }
  uint64_t v10 = v4;
LABEL_7:

  return v10;
}

- (BOOL)processIOService:(unsigned int)a3
{
  kern_return_t v34;
  IOCFPlugInInterfaceStruct **pluginInterface;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v37;
  CFUUIDBytes v38;
  int valuePtr;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;

  uint64_t v3 = *(void *)&a3;
  CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a3, @"RID", kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    CFNumberRef v6 = CFProperty;
    CFTypeID v7 = CFGetTypeID(CFProperty);
    if (v7 == CFNumberGetTypeID()) {
      CFNumberGetValue(v6, kCFNumberShortType, &self->_rid);
    }
    CFRelease(v6);
    uint64_t v8 = (char *)MGCopyAnswer();
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Internal/External HPM: cpu type is %@", buf, 0xCu);
    }
    unsigned int v10 = [v8 intValue] & 0xC;
    if (v10)
    {
      uint64_t v11 = self->_log;
      if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      int rid = self->_rid;
      *(_DWORD *)buf = 67109120;
      LODWORD(v42) = rid;
      uint64_t v13 = "Internal/External HPM: Apple Silicon for RID %d";
    }
    else
    {
      if (((unint64_t)[v8 unsignedIntegerValue] & 7) == 0
        || (uint64_t v11 = self->_log, !os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO)))
      {
LABEL_14:
        CFTypeRef v16 = IORegistryEntryCreateCFProperty(v3, @"Route String", kCFAllocatorDefault, 0);
        if (v16)
        {
          uint64_t v17 = v16;
          CFTypeID v18 = CFGetTypeID(v16);
          if (v18 != CFNumberGetTypeID()
            || (valuePtr = 0, CFNumberGetValue((CFNumberRef)v17, kCFNumberSInt32Type, &valuePtr), valuePtr))
          {
            CFRelease(v17);
LABEL_23:
            uint64_t v23 = self->_log;
            if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
            {
              int v24 = self->_rid;
              *(_DWORD *)buf = 67109120;
              LODWORD(v42) = v24;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_INFO, "External HPM: RID %d", buf, 8u);
            }
            BOOL v14 = 0;
LABEL_38:

            return v14;
          }
          uint64_t v25 = self->_log;
          if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_INFO))
          {
            int v26 = self->_rid;
            *(_DWORD *)buf = 67109120;
            LODWORD(v42) = v26;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_INFO, "Internal HPM: RID %d, Route String is zero", buf, 8u);
          }
          CFRelease(v17);
        }
        else
        {
          uint64_t v19 = self->_log;
          if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_INFO))
          {
            int v20 = self->_rid;
            *(_DWORD *)buf = 67109120;
            LODWORD(v42) = v20;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_INFO, "Internal/External HPM: No Route String on RID %d", buf, 8u);
          }
          if (!v10) {
            goto LABEL_23;
          }
          uint64_t v21 = self->_log;
          if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
          {
            int v22 = self->_rid;
            *(_DWORD *)buf = 67109120;
            LODWORD(v42) = v22;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_INFO, "Internal HPM: RID %d on Apple Silicon", buf, 8u);
          }
        }
        uint64_t v27 = self->_log;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_INFO))
        {
          int v28 = self->_rid;
          *(_DWORD *)buf = 67109120;
          LODWORD(v42) = v28;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_INFO, "Internal HPM: RID %d", buf, 8u);
        }
        [(UARPAppleHPM *)self checkForPassthroughCharging:v3];
        uint64_t v29 = self->_log;
        if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_INFO))
        {
          int v30 = self->_rid;
          if (self->_hasChargePassthru) {
            uint64_t v31 = "may";
          }
          else {
            uint64_t v31 = "may NOT";
          }
          *(_DWORD *)buf = 136315394;
          uint64_t v42 = v31;
          __int16 v43 = 1024;
          int v44 = v30;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v29, OS_LOG_TYPE_INFO, "Power Adapter %s be behind a passthru dongle on RID %u", buf, 0x12u);
        }
        *(_DWORD *)buf = 0;
        CFUUIDRef v32 = CFUUIDGetConstantUUIDWithBytes(0, 0x12u, 0xA1u, 0xDCu, 0xCFu, 0xCFu, 0x7Au, 0x47u, 0x75u, 0xBEu, 0xE5u, 0x9Cu, 0x43u, 0x19u, 0xF4u, 0xCDu, 0x2Bu);
        CFUUIDRef v33 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
        uint64_t v34 = IOCreatePlugInInterfaceForService(v3, v32, v33, &self->_pluginInterface, (SInt32 *)buf);
        BOOL v14 = 0;
        if (!v34)
        {
          pluginInterface = self->_pluginInterface;
          QueryInterface = (*pluginInterface)->QueryInterface;
          uint64_t v37 = CFUUIDGetConstantUUIDWithBytes(0, 0xC1u, 0x3Au, 0xCDu, 0xD9u, 0x20u, 0x9Eu, 0x4Bu, 1u, 0xB7u, 0xBEu, 0xE0u, 0x5Cu, 0xD8u, 0x83u, 0xC7u, 0xB1u);
          uint64_t v38 = CFUUIDGetUUIDBytes(v37);
          BOOL v14 = ((unsigned int (*)(IOCFPlugInInterfaceStruct **, void, void, AppleHPMLibInterfaceStructV3 ***))QueryInterface)(pluginInterface, *(void *)&v38.byte0, *(void *)&v38.byte8, &self->_deviceInterface) == 0;
        }
        goto LABEL_38;
      }
      int v15 = self->_rid;
      *(_DWORD *)buf = 67109120;
      LODWORD(v42) = v15;
      uint64_t v13 = "Internal/External HPM: Intel Silicon for RID %d";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, v13, buf, 8u);
    goto LABEL_14;
  }
  return 0;
}

- (void)dealloc
{
  deviceInterface = self->_deviceInterface;
  if (deviceInterface && *deviceInterface) {
    (*((void (**)(void))*deviceInterface + 3))();
  }
  pluginInterface = self->_pluginInterface;
  if (pluginInterface) {
    IODestroyPlugInInterface(pluginInterface);
  }
  v5.receiver = self;
  v5.super_class = (Class)UARPAppleHPM;
  [(UARPAppleHPM *)&v5 dealloc];
}

- (void)checkIfMagSafe:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int16 v5 = (unsigned __int16)+[UARPMagSafeCable rid:](UARPMagSafeCable, "rid:");
  if (self->_rid == v5)
  {
    self->_hasMagSafe = 1;
    if (!+[UARPMagSafeCable isActive:v3])
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        v9[0] = self;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Identifying MagSafe (disconnected) on %@", (uint8_t *)&v8, 0xCu);
      }
      [(UARPAppleHPM *)self handleNotConnected];
    }
  }
  else
  {
    CFTypeID v7 = self->_log;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 67109378;
      LODWORD(v9[0]) = v5;
      WORD2(v9[0]) = 2112;
      *(void *)((char *)v9 + 6) = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_INFO, "RID Mismatch %d identifying MagSafe on %@", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (void)checkForPassthroughCharging:(unsigned int)a3
{
  io_iterator_t iterator = 0;
  if (IORegistryEntryGetChildIterator(a3, "IOService", &iterator)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = iterator == 0;
  }
  if (!v4)
  {
    do
    {
      uint64_t v5 = IOIteratorNext(iterator);
      if (!v5) {
        break;
      }
      uint64_t v6 = v5;
      if (IOObjectConformsTo(v5, "AppleHPMDevice")) {
        [(UARPAppleHPM *)self checkForPassthroughChargingOnAppleHPMDevice:v6];
      }
      IOObjectRelease(v6);
    }
    while (!self->_hasChargePassthru);
    IOObjectRelease(iterator);
  }
}

- (void)checkForPassthroughChargingOnAppleHPMDevice:(unsigned int)a3
{
  io_iterator_t iterator = 0;
  if (IORegistryEntryGetChildIterator(a3, "IOService", &iterator)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = iterator == 0;
  }
  if (!v4)
  {
    uint64_t v5 = IOIteratorNext(iterator);
    if (v5)
    {
      uint64_t v6 = v5;
      do
      {
        if (IOObjectConformsTo(v6, "IOPortTransportStateCC"))
        {
          HIDWORD(v13) = 0;
          CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v6, @"Vendor ID (SOP)", kCFAllocatorDefault, 0);
          if (CFProperty)
          {
            CFNumberRef v8 = CFProperty;
            CFTypeID v9 = CFGetTypeID(CFProperty);
            if (v9 == CFNumberGetTypeID()) {
              CFNumberGetValue(v8, kCFNumberIntType, (char *)&v13 + 4);
            }
            CFRelease(v8);
          }
          LODWORD(v13) = 0;
          CFNumberRef v10 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v6, @"Product ID (SOP)", kCFAllocatorDefault, 0);
          if (v10)
          {
            CFNumberRef v11 = v10;
            CFTypeID v12 = CFGetTypeID(v10);
            if (v12 == CFNumberGetTypeID()) {
              CFNumberGetValue(v11, kCFNumberIntType, &v13);
            }
            CFRelease(v11);
          }
          if (v13) {
            self->_hasChargePassthru = 1;
          }
        }
        if (!self->_hasChargePassthru) {
          [(UARPAppleHPM *)self checkForPassthroughChargingOnAppleHPMDevice:v6];
        }
        IOObjectRelease(v6);
        uint64_t v6 = IOIteratorNext(iterator);
      }
      while (v6);
    }
    IOObjectRelease(iterator);
  }
}

- (void)updateRetryMetric:(unint64_t)a3
{
  if (a3)
  {
    unint64_t rxVdmRetryPacketCount = self->_rxVdmRetryPacketCount;
    double v4 = (double)a3 + (double)rxVdmRetryPacketCount++ * self->_rxVdmRetryAverage;
    self->_unint64_t rxVdmRetryPacketCount = rxVdmRetryPacketCount;
    self->_rxVdmRetryAverage = v4 / (double)rxVdmRetryPacketCount;
    if (self->_rxVdmRetryMax < a3) {
      self->_rxVdmRetryMax = a3;
    }
    if (self->_rxVdmRetryMin > a3) {
      self->_rxVdmRetryMin = a3;
    }
  }
  else
  {
    ++self->_rxVdmNoRetryPacketCount;
  }
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", @"RID = <%d>", self->_rid);
  [v3 appendFormat:@", MagSafe = <%d>", self->_hasMagSafe];
  [v3 appendFormat:@", Connected = <%d>", self->_connected];
  [v3 appendFormat:@", SOP Type = <%d>", self->_sopType];
  [v3 appendFormat:@", UUID = <%@>", self->_uuid];
  [v3 appendFormat:@", SOP Delegate = <%@>", self->_sopDelegate];
  [v3 appendFormat:@", SOP Prime Delegate = <%@>", self->_sopPrimeDelegate];
  double v4 = +[NSString stringWithString:v3];

  return v4;
}

- (void)logBuffer:(int)a3 buffer:(char *)a4 length:(unsigned int)a5 desc:(id)a6
{
  id v9 = a6;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v11 = 138413058;
    id v12 = v9;
    __int16 v13 = 1024;
    unsigned int v14 = a5;
    __int16 v15 = 1024;
    int v16 = a3;
    __int16 v17 = 2112;
    CFTypeID v18 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%@ %d bytes on SOP %d for %@", (uint8_t *)&v11, 0x22u);
  }
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (UARPAppleHPM *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unsigned int v6 = [(UARPAppleHPM *)self rid];
      if (v6 == [(UARPAppleHPM *)v5 rid]
        && (CFTypeID v7 = [(UARPAppleHPM *)self pluginInterface],
            v7 == [(UARPAppleHPM *)v5 pluginInterface]))
      {
        CFNumberRef v10 = [(UARPAppleHPM *)self deviceInterface];
        BOOL v8 = v10 == [(UARPAppleHPM *)v5 deviceInterface];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (IOCFPlugInInterfaceStruct)pluginInterface
{
  return self->_pluginInterface;
}

- (AppleHPMLibInterfaceStructV3)deviceInterface
{
  return self->_deviceInterface;
}

- (BOOL)iecsRead:(unsigned int)a3 buffer:(char *)a4 length:(unsigned __int8)a5 lengthRead:(unint64_t *)a6 error:(id *)a7
{
  int v7 = a5;
  uint64_t v8 = *(void *)&a3;
  uint64_t v23 = 0;
  if (a6) {
    CFNumberRef v10 = a6;
  }
  else {
    CFNumberRef v10 = (unint64_t *)&v23;
  }
  unint64_t v11 = a5;
  if ((*((unsigned int (**)(AppleHPMLibInterfaceStructV3 **, void, void, char *, void, void, unint64_t *))*self->_deviceInterface
        + 5))(self->_deviceInterface, 0, a3, a4, a5, 0, v10))
  {
    log = self->_log;
    BOOL v13 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      sub_100025244(v8, log, v14, v15, v16, v17, v18, v19);
LABEL_10:
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    if (*v10 >= v11)
    {
      LOBYTE(v13) = 1;
      return v13;
    }
    int v20 = self->_log;
    BOOL v13 = os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      unint64_t v21 = *v10;
      *(_DWORD *)buf = 67109632;
      int v25 = v8;
      __int16 v26 = 1024;
      int v27 = v7;
      __int16 v28 = 2048;
      unint64_t v29 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_ERROR, "Read register number 0x%2x, expected %hhu bytes, but read %llu bytes", buf, 0x18u);
      goto LABEL_10;
    }
  }
  return v13;
}

- (BOOL)iecsWrite:(unsigned int)a3 buffer:(char *)a4 length:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v6 = *(void *)&a3;
  int v8 = (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, void, void, char *, void, void))*self->_deviceInterface
        + 6))(self->_deviceInterface, 0, a3, a4, a5, 0);
  if (v8)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000252B0(v6, log, v10, v11, v12, v13, v14, v15);
    }
  }
  return v8 == 0;
}

- (BOOL)iecsCommand:(unsigned int)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v5 = *(void *)&a3;
  int v7 = (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, void, void, void, id *))*self->_deviceInterface
        + 7))(self->_deviceInterface, 0, *(void *)&a3, *(void *)&a4, a5);
  if (v7)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_10002531C(v5, log, v9, v10, v11, v12, v13, v14);
    }
  }
  return v7 == 0;
}

- (BOOL)sendVDM:(int)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6 error:(id *)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v10 = *(void *)&a3;
  if ([(UARPAppleHPM *)self isConnnected])
  {
    if (!(*((unsigned int (**)(AppleHPMLibInterfaceStructV3 **, void, uint64_t, void *, unint64_t, uint64_t))*self->_deviceInterface
           + 8))(self->_deviceInterface, 0, v10, a4, a5, v7))
    {
      LOBYTE(v13) = 1;
      return v13;
    }
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100025388((os_log_t)log);
    }
    [(UARPAppleHPM *)self checkConnection:0];
  }
  else
  {
    BOOL v13 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v13) {
      return v13;
    }
    sub_1000253CC();
  }
  LOBYTE(v13) = 0;
  return v13;
}

- (BOOL)receiveVDM:(int *)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6 sequence:(char *)a7 lengthReceived:(unint64_t *)a8 error:(id *)a9
{
  uint64_t v11 = *(void *)&a6;
  if ([(UARPAppleHPM *)self isConnnected])
  {
    unsigned int sopType = self->_sopType;
    if (sopType >= 2)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000254A8();
      }
      unsigned int sopType = self->_sopType;
    }
    *a3 = sopType;
    if (!(*((unsigned int (**)(AppleHPMLibInterfaceStructV3 **, void, void *, unint64_t, uint64_t, int *, char *, unint64_t *))*self->_deviceInterface
           + 9))(self->_deviceInterface, 0, a4, a5, v11, a3, a7, a8))
    {
      LOBYTE(v17) = 1;
      return v17;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100025440();
    }
    [(UARPAppleHPM *)self checkConnection:0];
  }
  else
  {
    BOOL v17 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v17) {
      return v17;
    }
    sub_100025510();
  }
  LOBYTE(v17) = 0;
  return v17;
}

- (BOOL)receiveVDM:(int *)a3 buffer:(void *)a4 length:(unint64_t)a5 flags:(unsigned int)a6 sequence:(char *)a7 checkSequence:(BOOL)a8 maxRetries:(unsigned int)a9 lengthReceived:(unint64_t *)a10 error:(id *)a11
{
  BOOL v31 = a8;
  if (a9)
  {
    uint64_t v13 = *(void *)&a6;
    uint64_t v17 = 0;
    while (1)
    {
      bzero(a4, a5);
      *a10 = 0;
      *a3 = self->_sopType;
      unsigned int v18 = [(UARPAppleHPM *)self receiveVDM:a3 buffer:a4 length:a5 flags:v13 sequence:a7 lengthReceived:a10 error:a11];
      if (!v18) {
        break;
      }
      if (*a3 == self->_sopType)
      {
        if (!v31) {
          return v18;
        }
        int v19 = *a7;
        if (self->_lastRxSequence != v19)
        {
          self->_lastRxSequence = v19;
          [(UARPAppleHPM *)self updateRetryMetric:v17];
          LOBYTE(v18) = 1;
          return v18;
        }
      }
      else
      {
        +[NSString stringWithFormat:@"RX VDM Unexpected SOP <Seq No=%d> <Last Seq No=%d>", *a7, self->_lastRxSequence];
        v21 = uint64_t v20 = v13;
        [(UARPAppleHPM *)self logBuffer:*a3 buffer:a4 length:a5 desc:v21];

        uint64_t v13 = v20;
      }
      sleepMS(5);
      if (a9 == ++v17) {
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    log = self->_log;
    unsigned int v18 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      sub_100025584(log, v23, v24, v25, v26, v27, v28, v29);
      LOBYTE(v18) = 0;
    }
  }
  return v18;
}

- (BOOL)isConnnected
{
  if (![(UARPAppleHPM *)self checkConnection:0]
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000255FC();
  }
  BOOL connected = self->_connected;
  if (!self->_connected) {
    [(UARPAppleHPM *)self handleNotConnected];
  }
  return connected;
}

- (BOOL)checkConnection:(id *)a3
{
  uint64_t v16 = 0;
  BOOL v4 = [(UARPAppleHPM *)self iecsRead:26 buffer:v17 length:4 lengthRead:&v16 error:a3];
  if (v4)
  {
    if (v17[0])
    {
      if ((v17[0] & 0xE) == 0xC || !self->_sopType)
      {
        self->_BOOL connected = 1;
        return v4;
      }
      log = self->_log;
      if (!os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 138412290;
      int v19 = self;
      uint64_t v6 = "not connected - unknown ra <%@>";
    }
    else
    {
      log = self->_log;
      if (!os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
      {
LABEL_12:
        self->_BOOL connected = 0;
        return v4;
      }
      *(_DWORD *)buf = 138412290;
      int v19 = self;
      uint64_t v6 = "not connected - plug not present <%@>";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, v6, buf, 0xCu);
    goto LABEL_12;
  }
  uint64_t v7 = self->_log;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
    sub_100025664(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  return v4;
}

- (void)handleNotConnected
{
  self->_BOOL connected = 0;
  serialNumberVDO = self->_serialNumberVDO;
  self->_serialNumberVDO = 0;

  vendorNameVDO = self->_vendorNameVDO;
  self->_vendorNameVDO = 0;

  productNameVDO = self->_productNameVDO;
  self->_productNameVDO = 0;

  userStringVDO = self->_userStringVDO;
  self->_userStringVDO = 0;

  modelStringVDO = self->_modelStringVDO;
  self->_modelStringVDO = 0;

  manufacturerVDO = self->_manufacturerVDO;
  self->_manufacturerVDO = 0;

  firmwareVersionVDO = self->_firmwareVersionVDO;
  self->_firmwareVersionVDO = 0;

  hardwareVersionVDO = self->_hardwareVersionVDO;
  self->_hardwareVersionVDO = 0;
}

- (BOOL)probeVDOs:(id *)a3
{
  if (self->_sopType && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_1000258C0();
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_100025858();
  }
  if (![(UARPAppleHPM *)self checkConnection:0])
  {
    BOOL v7 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    sub_1000257F0();
LABEL_20:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (!self->_connected)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    sub_1000256DC();
    goto LABEL_20;
  }
  unsigned __int8 v5 = [(UARPAppleHPM *)self processVDOs:a3];
  log = self->_log;
  if ((v5 & 1) == 0)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    sub_1000257AC((os_log_t)log);
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Processing VDOs", v9, 2u);
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_100025744();
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (void)clearVDOs
{
  *(void *)&self->_vdoEndpoint = 0;
  *(void *)&self->_vdoEndpoints = 0;
  serialNumberVDO = self->_serialNumberVDO;
  self->_serialNumberVDO = 0;

  vendorNameVDO = self->_vendorNameVDO;
  self->_vendorNameVDO = 0;

  productNameVDO = self->_productNameVDO;
  self->_productNameVDO = 0;

  userStringVDO = self->_userStringVDO;
  self->_userStringVDO = 0;

  modelStringVDO = self->_modelStringVDO;
  self->_modelStringVDO = 0;

  manufacturerVDO = self->_manufacturerVDO;
  self->_manufacturerVDO = 0;

  firmwareVersionVDO = self->_firmwareVersionVDO;
  self->_firmwareVersionVDO = 0;

  hardwareVersionVDO = self->_hardwareVersionVDO;
  self->_hardwareVersionVDO = 0;
}

- (BOOL)doAtomic4CC:(unsigned int)a3 data:(char *)a4 dataLength:(unsigned int)a5 extData:(unsigned int)a6 dataOut:(char *)a7 dataOutLength:(unsigned int)a8 dataOutLengthRead:(unsigned int *)a9 extDataOut:(unsigned int *)a10 error:(id *)a11
{
  __int16 v29 = a8;
  unsigned int v15 = 0;
  unsigned int v32 = a6;
  BOOL v16 = 1;
  uint64_t v17 = (unsigned __int16)a5;
  while (1)
  {
    if (![(UARPAppleHPM *)self isConnnected])
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_100025928();
      }
      goto LABEL_21;
    }
    int v31 = 0;
    int v18 = uarpNtohl(a3);
    unsigned int v30 = 0;
    int v31 = v18;
    LOWORD(v28) = v29;
    int v19 = (*((uint64_t (**)(AppleHPMLibInterfaceStructV3 **, uint64_t, int *, char *, unsigned int *, char *, unsigned int *, uint64_t, int, uint64_t, void, _DWORD))*self->_deviceInterface
           + 13))(self->_deviceInterface, 1, &v31, a4, &v32, a7, &v30, v17, v28, 10, 0, 0);
    int v20 = v19;
    if (a10) {
      *a10 = v30;
    }
    if (!v19) {
      break;
    }
    if (v19 == -536870201 || v19 == -536870206)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v34 = "-[UARPAppleHPM doAtomic4CC:data:dataLength:extData:dataOut:dataOutLength:dataOutLengthRead:extDataOut:error:]";
        __int16 v35 = 1024;
        int v36 = v20;
        __int16 v37 = 1024;
        unsigned int v38 = v15;
        __int16 v39 = 2112;
        char v40 = self;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "%s: atomic command failed <0x%08x>, iteration %d. %@", buf, 0x22u);
      }
LABEL_21:
      char v24 = 0;
      return v16 & v24 & 1;
    }
LABEL_15:
    sleepMS(10);
    BOOL v16 = v15++ < 9;
    char v24 = v15;
    if (v15 == 10)
    {
      BOOL v16 = 0;
      return v16 & v24 & 1;
    }
  }
  unsigned int v22 = v30;
  if ((v30 & 0x800000) != 0)
  {
    uint64_t v23 = self->_log;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v34 = "-[UARPAppleHPM doAtomic4CC:data:dataLength:extData:dataOut:dataOutLength:dataOutLengthRead:extDataOut:error:]";
      __int16 v35 = 1024;
      int v36 = (v22 >> 18) & 0x1F;
      __int16 v37 = 1024;
      unsigned int v38 = v15;
      __int16 v39 = 2112;
      char v40 = self;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "%s: 4cc operation failed <0x%02x>, iteration %d. %@", buf, 0x22u);
    }
    goto LABEL_15;
  }
  char v24 = 1;
  return v16 & v24 & 1;
}

- (BOOL)setCFUp:(BOOL)a3 error:(id *)a4
{
  if (self->_enabledCFUp == a3) {
    goto LABEL_5;
  }
  BOOL v25 = a3;
  if (![(UARPAppleHPM *)self iecsWrite:9 buffer:&v25 length:1 error:a4])
  {
    log = self->_log;
    BOOL v7 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    sub_100025A14(log, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_11;
  }
  if (![(UARPAppleHPM *)self iecsCommand:1128682864 flags:0 error:a4])
  {
    BOOL v16 = self->_log;
    BOOL v7 = os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    sub_10002599C(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_11:
    LOBYTE(v7) = 0;
    return v7;
  }
  self->_enabledCFUp = a3;
LABEL_5:
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)writeCFUs:(unsigned int)a3 remoteEndpoint:(unsigned int)a4 protocol:(unsigned int)a5 buffer:(char *)a6 bufferLength:(unsigned int)a7 lengthWritten:(unsigned int *)a8 error:(id *)a9
{
  unsigned int v11 = a7 - a5;
  if (a7 - a5 >= 0x40) {
    unsigned int v11 = 64;
  }
  unsigned int v12 = ((a3 & 7) << 21) | (v11 << 24) | ((a4 & 7) << 18) | ((self->_sopType & 3) << 14);
  if (a5 >= 0x14) {
    unsigned int v13 = 20;
  }
  else {
    unsigned int v13 = a5;
  }
  unsigned int v24 = 0;
  if (![(UARPAppleHPM *)self doAtomic4CC:1934968387 data:a6 dataLength:*(void *)&a7 extData:v12 | (v13 << 8) dataOut:0 dataOutLength:0 dataOutLengthRead:0 extDataOut:&v24 error:a9])
  {
    log = self->_log;
    BOOL v14 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v14) {
      return v14;
    }
    sub_100025B04(log, v16, v17, v18, v19, v20, v21, v22);
LABEL_16:
    LOBYTE(v14) = 0;
    return v14;
  }
  if ((v24 & 0x800000) != 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100025A8C();
    }
    [(UARPAppleHPM *)self checkConnection:0];
    goto LABEL_16;
  }
  if (a8) {
    *a8 = HIBYTE(v24) & 0x3F;
  }
  LOBYTE(v14) = 1;
  return v14;
}

- (BOOL)readCFUa:(unsigned int)a3 remoteEndpoint:(unsigned int)a4 offset:(unsigned __int16)a5 buffer:(char *)a6 bufferLength:(unsigned int)a7 lengthRead:(unsigned int *)a8 error:(id *)a9
{
  int sopType = self->_sopType;
  if (sopType) {
    unsigned int v12 = 24;
  }
  else {
    unsigned int v12 = 20;
  }
  if (v12 >= a7) {
    unsigned int v12 = a7;
  }
  unsigned int v23 = 0;
  if (!-[UARPAppleHPM doAtomic4CC:data:dataLength:extData:dataOut:dataOutLength:dataOutLengthRead:extDataOut:error:](self, "doAtomic4CC:data:dataLength:extData:dataOut:dataOutLength:dataOutLengthRead:extDataOut:error:", 1632978499, 0, 0, ((a4 & 7) << 18) & 0xFE3FFFFF | ((a3 & 7) << 22) | a5 | (v12 << 24) | (sopType << 30) | 0x10000, a6, a8, &v23, a9))
  {
    log = self->_log;
    BOOL v13 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v13) {
      return v13;
    }
    sub_100025BF4(log, v15, v16, v17, v18, v19, v20, v21);
LABEL_16:
    LOBYTE(v13) = 0;
    return v13;
  }
  if ((v23 & 0x800000) != 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100025B7C();
    }
    [(UARPAppleHPM *)self checkConnection:0];
    goto LABEL_16;
  }
  if (a8) {
    *a8 = HIBYTE(v23) & 0x1F;
  }
  LOBYTE(v13) = 1;
  return v13;
}

- (BOOL)writeCFUa:(unsigned int)a3 remoteEndpoint:(unsigned int)a4 offset:(unsigned __int16)a5 buffer:(char *)a6 bufferLength:(unsigned int)a7 lengthWritten:(unsigned int *)a8 error:(id *)a9
{
  int v11 = self->_sopType << 30;
  if (a7 >= 0x18) {
    unsigned int v12 = 24;
  }
  else {
    unsigned int v12 = a7;
  }
  unsigned int v23 = 0;
  if (![(UARPAppleHPM *)self doAtomic4CC:1632978499 data:a6 dataLength:*(void *)&a7 extData:v11 & 0xFF03FFFF | (v12 << 24) | ((a3 & 7) << 21) | ((a4 & 7) << 18) | a5 dataOut:0 dataOutLength:0 dataOutLengthRead:0 extDataOut:&v23 error:a9])
  {
    log = self->_log;
    BOOL v13 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v13) {
      return v13;
    }
    sub_100025CE4(log, v15, v16, v17, v18, v19, v20, v21);
LABEL_14:
    LOBYTE(v13) = 0;
    return v13;
  }
  if ((v23 & 0x800000) != 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100025C6C();
    }
    [(UARPAppleHPM *)self checkConnection:0];
    goto LABEL_14;
  }
  if (a8) {
    *a8 = HIBYTE(v23) & 0x1F;
  }
  LOBYTE(v13) = 1;
  return v13;
}

- (BOOL)processVDOs:(id *)a3
{
  if (!-[UARPAppleHPM processCapabilityVDO:](self, "processCapabilityVDO:"))
  {
    log = self->_log;
    BOOL v5 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v5) {
      return v5;
    }
    sub_100025E4C(log, v7, v8, v9, v10, v11, v12, v13);
LABEL_11:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (![(UARPAppleHPM *)self processEndpointVDO:a3])
  {
    BOOL v14 = self->_log;
    BOOL v5 = os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR);
    if (!v5) {
      return v5;
    }
    sub_100025DD4(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_11;
  }
  if (![(UARPAppleHPM *)self processAppleVDOs:a3])
  {
    uint64_t v22 = self->_log;
    BOOL v5 = os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR);
    if (!v5) {
      return v5;
    }
    sub_100025D5C(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_11;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)processCapabilityVDO:(id *)a3
{
  int v22 = 0;
  if (![(UARPAppleHPM *)self readCFUa:0 remoteEndpoint:0 offset:0 buffer:&self->_vdoCapability bufferLength:4 lengthRead:&v22 error:a3])
  {
    log = self->_log;
    BOOL v4 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v4) {
      return v4;
    }
    sub_100025F3C(log, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_9;
  }
  if (v22 != 4)
  {
    uint64_t v13 = self->_log;
    BOOL v4 = os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR);
    if (!v4) {
      return v4;
    }
    sub_100025EC4(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_9:
    LOBYTE(v4) = 0;
    return v4;
  }
  self->_vdoEndpoints = self->_vdoCapability >> 1;
  LOBYTE(v4) = 1;
  return v4;
}

- (BOOL)processEndpointVDO:(id *)a3
{
  int v22 = 0;
  if (![(UARPAppleHPM *)self readCFUa:0 remoteEndpoint:0 offset:4 buffer:&self->_vdoEndpoint bufferLength:4 lengthRead:&v22 error:a3])
  {
    log = self->_log;
    BOOL v4 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR);
    if (!v4) {
      return v4;
    }
    sub_10002602C(log, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_9;
  }
  if (v22 != 4)
  {
    uint64_t v13 = self->_log;
    BOOL v4 = os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR);
    if (!v4) {
      return v4;
    }
    sub_100025FB4(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_9:
    LOBYTE(v4) = 0;
    return v4;
  }
  self->_numberOfAppleVdos = BYTE2(self->_vdoEndpoint);
  LOBYTE(v4) = 1;
  return v4;
}

- (BOOL)processAppleVDOs:(id *)a3
{
  if (!self->_numberOfAppleVdos) {
    return 1;
  }
  int v5 = 0;
  while (1)
  {
    uint64_t v31 = 0;
    if (![(UARPAppleHPM *)self readCFUa:0 remoteEndpoint:0 offset:(unsigned __int16)(4 * v5 + 8) & 0xFFFC buffer:(char *)&v31 + 4 bufferLength:4 lengthRead:&v31 error:a3])break; {
    if (v31 != 4)
    }
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_10002611C(log, v16, v17, v18, v19, v20, v21, v22);
      }
      return 0;
    }
    if (![(UARPAppleHPM *)self processAppleVDO:HIDWORD(v31) error:a3])
    {
      uint64_t v23 = self->_log;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
        sub_1000260A4(v23, v24, v25, v26, v27, v28, v29, v30);
      }
      return 0;
    }
    if (++v5 >= self->_numberOfAppleVdos) {
      return 1;
    }
  }
  uint64_t v7 = self->_log;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
    sub_100026194(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  return 0;
}

- (BOOL)processAppleVDO:(unsigned int)a3 error:(id *)a4
{
  uint64_t v6 = BYTE2(a3);
  memset(v21, 0, sizeof(v21));
  if (BYTE2(a3))
  {
    unsigned int v8 = 0;
    while (1)
    {
      int v20 = 0;
      if (![(UARPAppleHPM *)self readCFUa:0 remoteEndpoint:0 offset:(unsigned __int16)(v8 + a3) buffer:(char *)v21 + v8 bufferLength:v6 - v8 lengthRead:&v20 error:a4])break; {
      v8 += v20;
      }
      if (v8 >= v6) {
        goto LABEL_5;
      }
    }
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_10002620C(log, v13, v14, v15, v16, v17, v18, v19);
    }
    return 0;
  }
  else
  {
LABEL_5:
    unsigned int v9 = HIBYTE(a3);
    uint64_t v10 = +[NSString stringWithFormat:@"%.*s", a4, v6, v21];
    if ((v9 - 1) <= 7u) {
      objc_storeStrong((id *)&self->_serialNumberVDO + (v9 - 1), v10);
    }

    return 1;
  }
}

- (unsigned)rid
{
  return self->_rid;
}

- (int)sopType
{
  return self->_sopType;
}

- (void)setSopType:(int)a3
{
  self->_int sopType = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)hasMagSafe
{
  return self->_hasMagSafe;
}

- (BOOL)enabledCFUp
{
  return self->_enabledCFUp;
}

- (BOOL)hasChargePassthru
{
  return self->_hasChargePassthru;
}

- (UARPHPMProtocol)sopDelegate
{
  return (UARPHPMProtocol *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSopDelegate:(id)a3
{
}

- (UARPHPMProtocol)sopPrimeDelegate
{
  return (UARPHPMProtocol *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSopPrimeDelegate:(id)a3
{
}

- (NSString)serialNumberVDO
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)vendorNameVDO
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)productNameVDO
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)userStringVDO
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)modelStringVDO
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)manufacturerVDO
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)firmwareVersionVDO
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)hardwareVersionVDO
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (unint64_t)rxVdmNoRetryPacketCount
{
  return self->_rxVdmNoRetryPacketCount;
}

- (unint64_t)rxVdmRetryPacketCount
{
  return self->_rxVdmRetryPacketCount;
}

- (double)rxVdmRetryAverage
{
  return self->_rxVdmRetryAverage;
}

- (unint64_t)rxVdmRetryMax
{
  return self->_rxVdmRetryMax;
}

- (unint64_t)rxVdmRetryMin
{
  return self->_rxVdmRetryMin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareVersionVDO, 0);
  objc_storeStrong((id *)&self->_firmwareVersionVDO, 0);
  objc_storeStrong((id *)&self->_manufacturerVDO, 0);
  objc_storeStrong((id *)&self->_modelStringVDO, 0);
  objc_storeStrong((id *)&self->_userStringVDO, 0);
  objc_storeStrong((id *)&self->_productNameVDO, 0);
  objc_storeStrong((id *)&self->_vendorNameVDO, 0);
  objc_storeStrong((id *)&self->_serialNumberVDO, 0);
  objc_storeStrong((id *)&self->_sopPrimeDelegate, 0);
  objc_storeStrong((id *)&self->_sopDelegate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end