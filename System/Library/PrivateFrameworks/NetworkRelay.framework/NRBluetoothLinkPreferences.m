@interface NRBluetoothLinkPreferences
- (BOOL)isEqual:(id)a3;
- (BOOL)isNotEmpty;
- (BOOL)reportedToABC;
- (NRBluetoothLinkPreferences)init;
- (NSNumber)inputBytesPerSecond;
- (NSNumber)outputBytesPerSecond;
- (NSNumber)packetsPerSecond;
- (id)copyEncodedXPCDict;
- (id)copyLongDescription;
- (id)copyShortDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)startTime;
- (void)combinePreferences:(id)a3;
- (void)setInputBytesPerSecond:(id)a3;
- (void)setOutputBytesPerSecond:(id)a3;
- (void)setPacketsPerSecond:(id)a3;
- (void)setReportedToABC:(BOOL)a3;
- (void)setStartTime:(unint64_t)a3;
@end

@implementation NRBluetoothLinkPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputBytesPerSecond, 0);
  objc_storeStrong((id *)&self->_inputBytesPerSecond, 0);
  objc_storeStrong((id *)&self->_reportedToABC, 0);
}

- (void)setReportedToABC:(BOOL)a3
{
  *(&self->super._linkType + 1) = a3;
}

- (BOOL)reportedToABC
{
  return *(&self->super._linkType + 1);
}

- (void)setStartTime:(unint64_t)a3
{
  self->_packetsPerSecond = (NSNumber *)a3;
}

- (unint64_t)startTime
{
  return (unint64_t)self->_packetsPerSecond;
}

- (NSNumber)packetsPerSecond
{
  return self->_outputBytesPerSecond;
}

- (NSNumber)outputBytesPerSecond
{
  return self->_inputBytesPerSecond;
}

- (NSNumber)inputBytesPerSecond
{
  return *(NSNumber **)&self->_reportedToABC;
}

- (void)combinePreferences:(id)a3
{
  id v43 = a3;
  if (![v43 isNotEmpty]) {
    goto LABEL_11;
  }
  uint64_t v4 = [*(id *)&self->_reportedToABC unsignedLongLongValue];
  v5 = [v43 inputBytesPerSecond];
  unint64_t v6 = [v5 unsignedLongLongValue] + v4;

  if (!HIDWORD(v6))
  {
    uint64_t v7 = [NSNumber numberWithUnsignedLongLong:v6];
    id v8 = *(id *)&self->_reportedToABC;
    *(void *)&self->_reportedToABC = v7;
LABEL_4:

    goto LABEL_5;
  }
  v19 = nrCopyLogObj_433();
  if (sNRCopyLogToStdErr)
  {

LABEL_21:
    id v8 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v8, 16, (uint64_t)"%s%.30s:%-4d %llu > UINT32_MAX, capping", v25, v26, v27, v28, v29, (uint64_t)"");
    goto LABEL_4;
  }
  v23 = v19;
  BOOL v24 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

  if (v24) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v9 = [(NSNumber *)self->_inputBytesPerSecond unsignedLongLongValue];
  v10 = [v43 outputBytesPerSecond];
  unint64_t v11 = [v10 unsignedLongLongValue] + v9;

  if (HIDWORD(v11))
  {
    v20 = nrCopyLogObj_433();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      v30 = v20;
      BOOL v31 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);

      if (!v31) {
        goto LABEL_8;
      }
    }
    inputBytesPerSecond = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)inputBytesPerSecond, 16, (uint64_t)"%s%.30s:%-4d %llu > UINT32_MAX, capping", v32, v33, v34, v35, v36, (uint64_t)"");
  }
  else
  {
    v12 = [NSNumber numberWithUnsignedLongLong:v11];
    inputBytesPerSecond = self->_inputBytesPerSecond;
    self->_inputBytesPerSecond = v12;
  }

LABEL_8:
  unint64_t v14 = [(NSNumber *)self->_outputBytesPerSecond unsignedLongLongValue];
  v15 = [v43 packetsPerSecond];
  unint64_t v16 = [v15 unsignedLongLongValue] + v14;

  if (!HIDWORD(v16))
  {
    v17 = [NSNumber numberWithUnsignedLongLong:v16];
    outputBytesPerSecond = self->_outputBytesPerSecond;
    self->_outputBytesPerSecond = v17;
LABEL_10:

    goto LABEL_11;
  }
  v21 = nrCopyLogObj_433();
  v22 = v21;
  if (sNRCopyLogToStdErr)
  {

LABEL_25:
    outputBytesPerSecond = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)outputBytesPerSecond, 16, (uint64_t)"%s%.30s:%-4d %llu > UINT32_MAX, capping", v38, v39, v40, v41, v42, (uint64_t)"");
    goto LABEL_10;
  }
  BOOL v37 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

  if (v37) {
    goto LABEL_25;
  }
LABEL_11:
}

- (void)setPacketsPerSecond:(id)a3
{
  checkAndCapValue(a3);
  uint64_t v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  outputBytesPerSecond = self->_outputBytesPerSecond;
  self->_outputBytesPerSecond = v4;
  MEMORY[0x270F9A758](v4, outputBytesPerSecond);
}

- (void)setOutputBytesPerSecond:(id)a3
{
  checkAndCapValue(a3);
  uint64_t v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  inputBytesPerSecond = self->_inputBytesPerSecond;
  self->_inputBytesPerSecond = v4;
  MEMORY[0x270F9A758](v4, inputBytesPerSecond);
}

- (void)setInputBytesPerSecond:(id)a3
{
  uint64_t v4 = checkAndCapValue(a3);
  uint64_t v5 = *(void *)&self->_reportedToABC;
  *(void *)&self->_reportedToABC = v4;
  MEMORY[0x270F9A758](v4, v5);
}

- (unint64_t)hash
{
  uint64_t v3 = [*(id *)&self->_reportedToABC hash];
  uint64_t v4 = [(NSNumber *)self->_inputBytesPerSecond hash] ^ v3;
  return v4 ^ [(NSNumber *)self->_outputBytesPerSecond hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (NRBluetoothLinkPreferences *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [*(id *)&self->_reportedToABC unsignedLongLongValue];
      uint64_t v7 = [(NRBluetoothLinkPreferences *)v5 inputBytesPerSecond];
      if (v6 == [v7 unsignedLongLongValue])
      {
        unint64_t v8 = [(NSNumber *)self->_inputBytesPerSecond unsignedLongLongValue];
        unint64_t v9 = [(NRBluetoothLinkPreferences *)v5 outputBytesPerSecond];
        if (v8 == [v9 unsignedLongLongValue])
        {
          unint64_t v10 = [(NSNumber *)self->_outputBytesPerSecond unsignedLongLongValue];
          unint64_t v11 = [(NRBluetoothLinkPreferences *)v5 packetsPerSecond];
          BOOL v12 = v10 == [v11 unsignedLongLongValue];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (id)copyShortDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(NRBluetoothLinkPreferences *)self inputBytesPerSecond];
  uint64_t v5 = [v4 unsignedLongLongValue];
  uint64_t v6 = [(NRBluetoothLinkPreferences *)self outputBytesPerSecond];
  uint64_t v7 = [v6 unsignedLongLongValue];
  unint64_t v8 = [(NRBluetoothLinkPreferences *)self packetsPerSecond];
  unint64_t v9 = objc_msgSend(v3, "initWithFormat:", @"LinkPrefBT[%lluibps,%lluobps,%llupps]", v5, v7, objc_msgSend(v8, "unsignedLongLongValue"));

  return v9;
}

- (id)copyLongDescription
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v10.receiver = self;
  v10.super_class = (Class)NRBluetoothLinkPreferences;
  uint64_t v4 = [(NRLinkPreferences *)&v10 description];
  uint64_t v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(NRBluetoothLinkPreferences *)self inputBytesPerSecond];
  objc_msgSend(v5, "appendFormat:", @"\nInput bytes/sec: %llu", objc_msgSend(v6, "unsignedLongLongValue"));

  uint64_t v7 = [(NRBluetoothLinkPreferences *)self outputBytesPerSecond];
  objc_msgSend(v5, "appendFormat:", @"\nOutput bytes/sec: %llu", objc_msgSend(v7, "unsignedLongLongValue"));

  unint64_t v8 = [(NRBluetoothLinkPreferences *)self packetsPerSecond];
  objc_msgSend(v5, "appendFormat:", @"\nPackets/sec: %llu", objc_msgSend(v8, "unsignedLongLongValue"));

  return v5;
}

- (id)copyEncodedXPCDict
{
  v8.receiver = self;
  v8.super_class = (Class)NRBluetoothLinkPreferences;
  id v3 = [(NRLinkPreferences *)&v8 copyEncodedXPCDict];
  uint64_t v4 = [(NRBluetoothLinkPreferences *)self inputBytesPerSecond];
  NRLPAddUint64ToXPCDict(v3, "InputBPS", v4);

  uint64_t v5 = [(NRBluetoothLinkPreferences *)self outputBytesPerSecond];
  NRLPAddUint64ToXPCDict(v3, "OutputBPS", v5);

  uint64_t v6 = [(NRBluetoothLinkPreferences *)self packetsPerSecond];
  NRLPAddUint64ToXPCDict(v3, "PacketsPerSecond", v6);

  return v3;
}

- (BOOL)isNotEmpty
{
  id v3 = [(NRBluetoothLinkPreferences *)self inputBytesPerSecond];
  if ([v3 unsignedLongLongValue])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(NRBluetoothLinkPreferences *)self outputBytesPerSecond];
    if ([v5 unsignedLongLongValue])
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [(NRBluetoothLinkPreferences *)self packetsPerSecond];
      BOOL v4 = [v6 unsignedLongLongValue] != 0;
    }
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NRBluetoothLinkPreferences;
  id v5 = -[NRLinkPreferences copyWithZone:](&v13, sel_copyWithZone_);
  uint64_t v6 = [(NRBluetoothLinkPreferences *)self inputBytesPerSecond];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setInputBytesPerSecond:v7];

  objc_super v8 = [(NRBluetoothLinkPreferences *)self outputBytesPerSecond];
  unint64_t v9 = (void *)[v8 copyWithZone:a3];
  [v5 setOutputBytesPerSecond:v9];

  objc_super v10 = [(NRBluetoothLinkPreferences *)self packetsPerSecond];
  unint64_t v11 = (void *)[v10 copyWithZone:a3];
  [v5 setPacketsPerSecond:v11];

  return v5;
}

- (NRBluetoothLinkPreferences)init
{
  v15.receiver = self;
  v15.super_class = (Class)NRBluetoothLinkPreferences;
  v2 = [(NRLinkPreferences *)&v15 initWithLinkType:1];
  id v3 = v2;
  if (!v2)
  {
    uint64_t v6 = nrCopyLogObj_433();
    if (sNRCopyLogToStdErr)
    {
    }
    else
    {
      uint64_t v7 = v6;
      BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_FAULT);

      if (!v8) {
        goto LABEL_3;
      }
    }
    id v9 = nrCopyLogObj_433();
    _NRLogWithArgs((uint64_t)v9, 17, (uint64_t)"Failed to initialize link preferences object", v10, v11, v12, v13, v14, (uint64_t)v15.receiver);

    goto LABEL_3;
  }
  BOOL v4 = v2;
LABEL_3:

  return v3;
}

@end