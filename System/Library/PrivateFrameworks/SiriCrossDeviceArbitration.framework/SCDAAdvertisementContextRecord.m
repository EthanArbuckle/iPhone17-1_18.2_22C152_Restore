@interface SCDAAdvertisementContextRecord
- (BOOL)compareAdvertisementPayload:(id)a3;
- (BOOL)isSaneForVoiceTriggerEndTime:(double)a3 endtimeDistanceThreshold:(double)a4;
- (NSData)advertisementPayload;
- (NSUUID)deviceID;
- (NSUUID)electionParticipantId;
- (SCDAAdvertisementContextRecord)initWithAdvertisementRecordType:(int64_t)a3 voiceTriggerEndTime:(double)a4 advertisementPayload:(id)a5 deviceID:(id)a6 electionParticipantId:(id)a7;
- (SCDAAdvertisementContextRecord)initWithMyriadAdvertisementContextRecordData:(id)a3;
- (char)_getAdvertismentRecordTypeForVersion:(unsigned __int8)a3 data:(id)a4;
- (double)_getVoiceTriggerEndTimeForVersion:(unsigned __int8)a3 data:(id)a4;
- (double)advertisementDispatchTime;
- (double)voiceTriggerEndTime;
- (id)_UUIDFromBytes:(const unsigned __int8 *)(a3;
- (id)_getDeviceIdForVersion:(unsigned __int8)a3 data:(id)a4;
- (id)_getElectionParticipantIdForVersion:(unsigned __int8)a3 data:(id)a4;
- (id)_getMyriadAdvertisementDataForVersion:(unsigned __int8)a3 data:(id)a4;
- (id)description;
- (id)myriadAdvertisementContextAsData;
- (id)recordForDeviceId:(id)a3;
- (int64_t)advertisementRecordType;
- (unint64_t)_advertismentPayloadSizeForVersion:(unsigned __int8)a3;
- (unsigned)advertisementContextVersion;
- (void)_initializeMyriadAdvertisementContextRecordFromData:(id)a3;
- (void)setAdvertisementDispatchTime:(double)a3;
@end

@implementation SCDAAdvertisementContextRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electionParticipantId, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_advertisementPayload, 0);
}

- (void)setAdvertisementDispatchTime:(double)a3
{
  self->_advertisementDispatchTime = a3;
}

- (double)advertisementDispatchTime
{
  return self->_advertisementDispatchTime;
}

- (NSUUID)electionParticipantId
{
  return self->_electionParticipantId;
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (NSData)advertisementPayload
{
  return self->_advertisementPayload;
}

- (double)voiceTriggerEndTime
{
  return self->_voiceTriggerEndTime;
}

- (int64_t)advertisementRecordType
{
  return self->_advertisementRecordType;
}

- (unsigned)advertisementContextVersion
{
  return self->_advertisementContextVersion;
}

- (id)_UUIDFromBytes:(const unsigned __int8 *)(a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (uuid_is_null((const unsigned __int8 *)a3)) {
    goto LABEL_2;
  }
  memset(out, 0, 37);
  uuid_unparse_upper((const unsigned __int8 *)a3, out);
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", out);
  if (![v5 length])
  {

LABEL_2:
    v4 = 0;
    goto LABEL_5;
  }
  v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];

LABEL_5:
  return v4;
}

- (BOOL)compareAdvertisementPayload:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4
    && self->_advertisementPayload
    && (uint64_t v6 = [v4 length], v6 == -[NSData length](self->_advertisementPayload, "length")))
  {
    char v7 = [v5 isEqual:self->_advertisementPayload];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)recordForDeviceId:(id)a3
{
  id v4 = a3;
  if (v4 && self->_advertisementPayload)
  {
    v5 = [[SCDARecord alloc] initWithDeviceID:v4 data:self->_advertisementPayload electionParticipantId:self->_electionParticipantId];
    [(SCDARecord *)v5 setIsCollectedFromContextCollector:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_initializeMyriadAdvertisementContextRecordFromData:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  if (v4 && v5)
  {
    objc_msgSend(v4, "getBytes:range:", &self->_advertisementContextVersion, 0, 1);
    uint64_t v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int advertisementContextVersion = self->_advertisementContextVersion;
      int v16 = 136315394;
      v17 = "-[SCDAAdvertisementContextRecord _initializeMyriadAdvertisementContextRecordFromData:]";
      __int16 v18 = 1024;
      LODWORD(v19) = advertisementContextVersion;
      _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s Initializing Myriad advertisement context (version: %d)", (uint8_t *)&v16, 0x12u);
    }
    self->_advertisementRecordType = [(SCDAAdvertisementContextRecord *)self _getAdvertismentRecordTypeForVersion:self->_advertisementContextVersion data:v4];
    [(SCDAAdvertisementContextRecord *)self _getVoiceTriggerEndTimeForVersion:self->_advertisementContextVersion data:v4];
    self->_voiceTriggerEndTime = v8;
    v9 = [(SCDAAdvertisementContextRecord *)self _getMyriadAdvertisementDataForVersion:self->_advertisementContextVersion data:v4];
    advertisementPayload = self->_advertisementPayload;
    self->_advertisementPayload = v9;

    v11 = [(SCDAAdvertisementContextRecord *)self _getDeviceIdForVersion:self->_advertisementContextVersion data:v4];
    deviceID = self->_deviceID;
    self->_deviceID = v11;

    v13 = [(SCDAAdvertisementContextRecord *)self _getElectionParticipantIdForVersion:self->_advertisementContextVersion data:v4];
    electionParticipantId = self->_electionParticipantId;
    self->_electionParticipantId = v13;
  }
  else
  {
    v15 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      v17 = "-[SCDAAdvertisementContextRecord _initializeMyriadAdvertisementContextRecordFromData:]";
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_error_impl(&dword_25C707000, v15, OS_LOG_TYPE_ERROR, "%s #scda-advertisementcontext: Received wedged Myriad advertisement context record %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (id)_getElectionParticipantIdForVersion:(unsigned __int8)a3 data:(id)a4
{
  int v4 = a3;
  v11[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  char v7 = v6;
  double v8 = 0;
  v11[0] = 0;
  v11[1] = 0;
  if ((v4 - 1) >= 3)
  {
    if ((unint64_t)[v6 length] < 0x32)
    {
      double v8 = 0;
    }
    else
    {
      objc_msgSend(v7, "getBytes:range:", v11, 34, 16);
      double v8 = [(SCDAAdvertisementContextRecord *)self _UUIDFromBytes:v11];
    }
  }
  v9 = (void *)[v8 copy];

  return v9;
}

- (id)_getDeviceIdForVersion:(unsigned __int8)a3 data:(id)a4
{
  int v4 = a3;
  v12[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v12[0] = 0;
  v12[1] = 0;
  unint64_t v7 = [v6 length];
  if ((v4 - 1) > 1)
  {
    if (v7 >= 0x22)
    {
      uint64_t v8 = 18;
      goto LABEL_6;
    }
  }
  else if (v7 > 0x20)
  {
    uint64_t v8 = 17;
LABEL_6:
    objc_msgSend(v6, "getBytes:range:", v12, v8, 16);
    v9 = [(SCDAAdvertisementContextRecord *)self _UUIDFromBytes:v12];
    goto LABEL_8;
  }
  v9 = 0;
LABEL_8:
  v10 = (void *)[v9 copy];

  return v10;
}

- (id)_getMyriadAdvertisementDataForVersion:(unsigned __int8)a3 data:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  size_t v6 = [(SCDAAdvertisementContextRecord *)self _advertismentPayloadSizeForVersion:self->_advertisementContextVersion];
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)v11 - v7;
  bzero((char *)v11 - v7, v6);
  if ([v5 length] >= v6 + 10) {
    objc_msgSend(v5, "getBytes:range:", v8, 10, v6);
  }
  v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:v6];

  return v9;
}

- (double)_getVoiceTriggerEndTimeForVersion:(unsigned __int8)a3 data:(id)a4
{
  id v4 = a4;
  double v7 = 0.0;
  double v5 = 0.0;
  if ((unint64_t)[v4 length] >= 0xA)
  {
    objc_msgSend(v4, "getBytes:range:", &v7, 2, 8);
    double v5 = v7;
  }

  return v5;
}

- (char)_getAdvertismentRecordTypeForVersion:(unsigned __int8)a3 data:(id)a4
{
  id v4 = a4;
  char v5 = 7;
  uint64_t v7 = 7;
  if ((unint64_t)[v4 length] >= 2)
  {
    objc_msgSend(v4, "getBytes:range:", &v7, 1, 1);
    char v5 = v7;
  }

  return v5;
}

- (unint64_t)_advertismentPayloadSizeForVersion:(unsigned __int8)a3
{
  if ((a3 - 1) < 2) {
    return 7;
  }
  else {
    return 8;
  }
}

- (BOOL)isSaneForVoiceTriggerEndTime:(double)a3 endtimeDistanceThreshold:(double)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3 <= 0.0)
  {
    v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      v15 = "-[SCDAAdvertisementContextRecord isSaneForVoiceTriggerEndTime:endtimeDistanceThreshold:]";
      __int16 v16 = 2048;
      *(double *)v17 = a3;
      _os_log_impl(&dword_25C707000, v12, OS_LOG_TYPE_INFO, "%s Invalid Voicetrigger endtime: %f", (uint8_t *)&v14, 0x16u);
    }
    return 0;
  }
  else
  {
    double v6 = fmin(a4, 0.5);
    double voiceTriggerEndTime = self->_voiceTriggerEndTime;
    if (voiceTriggerEndTime - a3 >= 0.0) {
      double v8 = voiceTriggerEndTime - a3;
    }
    else {
      double v8 = -(voiceTriggerEndTime - a3);
    }
    BOOL v9 = v8 <= v6;
    v10 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      advertisementPayload = self->_advertisementPayload;
      int v14 = 136316674;
      v15 = "-[SCDAAdvertisementContextRecord isSaneForVoiceTriggerEndTime:endtimeDistanceThreshold:]";
      __int16 v16 = 1024;
      *(_DWORD *)v17 = v8 <= v6;
      *(_WORD *)&v17[4] = 2048;
      *(double *)&v17[6] = v6;
      __int16 v18 = 2048;
      double v19 = a3;
      __int16 v20 = 2048;
      double v21 = voiceTriggerEndTime;
      __int16 v22 = 2048;
      double v23 = v8;
      __int16 v24 = 2112;
      v25 = advertisementPayload;
      _os_log_impl(&dword_25C707000, v10, OS_LOG_TYPE_INFO, "%s VoicetriggerEndtime isSane: %d (threshold: %f, me: %f, other: %f, abs-diff: %f adv: %@)", (uint8_t *)&v14, 0x44u);
    }
  }
  return v9;
}

- (id)myriadAdvertisementContextAsData
{
  v17[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF990] data];
  size_t v4 = [(SCDAAdvertisementContextRecord *)self _advertismentPayloadSizeForVersion:self->_advertisementContextVersion];
  char v5 = &buf[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  bzero(v5, v4);
  advertisementPayload = self->_advertisementPayload;
  if (advertisementPayload && [(NSData *)advertisementPayload length] == v4) {
    [(NSData *)self->_advertisementPayload getBytes:v5 length:v4];
  }
  v17[0] = 0;
  v17[1] = 0;
  deviceID = self->_deviceID;
  if (deviceID) {
    [(NSUUID *)deviceID getUUIDBytes:v17];
  }
  v16[0] = 0;
  v16[1] = 0;
  [(NSUUID *)self->_electionParticipantId getUUIDBytes:v16];
  [v3 appendBytes:&self->_advertisementContextVersion length:1];
  [v3 appendBytes:&self->_advertisementRecordType length:1];
  [v3 appendBytes:&self->_voiceTriggerEndTime length:8];
  [v3 appendBytes:v5 length:v4];
  [v3 appendBytes:v17 length:16];
  [v3 appendBytes:v16 length:16];
  double v8 = (void *)SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = v8;
    uint64_t v10 = [v3 length];
    *(_DWORD *)buf = 136315394;
    v13 = "-[SCDAAdvertisementContextRecord myriadAdvertisementContextAsData]";
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    _os_log_impl(&dword_25C707000, v9, OS_LOG_TYPE_INFO, "%s Generated Myriad advertisement context data: %lu bytes", buf, 0x16u);
  }
  return v3;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  if ([(NSData *)self->_advertisementPayload length])
  {
    size_t v4 = [(NSData *)self->_advertisementPayload bytes];
    if ([(NSData *)self->_advertisementPayload length])
    {
      unint64_t v5 = 0;
      do
        objc_msgSend(v3, "appendFormat:", @"%02x", v4[v5++]);
      while (v5 < [(NSData *)self->_advertisementPayload length]);
    }
  }
  double v6 = NSString;
  uint64_t advertisementContextVersion = self->_advertisementContextVersion;
  double voiceTriggerEndTime = self->_voiceTriggerEndTime;
  int64_t advertisementRecordType = self->_advertisementRecordType;
  deviceID = self->_deviceID;
  v11 = [(NSUUID *)self->_electionParticipantId UUIDString];
  v12 = [v6 stringWithFormat:@"SCDAAdvertisementContextRecord: contextVersion=%ld vtEndTime=%f advRecordType=%ld advPayload=0x%@ deviceID=%@ electionParticipantId=%@", advertisementContextVersion, *(void *)&voiceTriggerEndTime, advertisementRecordType, v3, deviceID, v11];

  return v12;
}

- (SCDAAdvertisementContextRecord)initWithMyriadAdvertisementContextRecordData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCDAAdvertisementContextRecord;
  unint64_t v5 = [(SCDAAdvertisementContextRecord *)&v8 init];
  double v6 = v5;
  if (v5) {
    [(SCDAAdvertisementContextRecord *)v5 _initializeMyriadAdvertisementContextRecordFromData:v4];
  }

  return v6;
}

- (SCDAAdvertisementContextRecord)initWithAdvertisementRecordType:(int64_t)a3 voiceTriggerEndTime:(double)a4 advertisementPayload:(id)a5 deviceID:(id)a6 electionParticipantId:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)SCDAAdvertisementContextRecord;
  uint64_t v15 = [(SCDAAdvertisementContextRecord *)&v24 init];
  __int16 v16 = v15;
  if (v15)
  {
    v15->_uint64_t advertisementContextVersion = kSCDAAdvertisementContextRecordVersion;
    v15->_int64_t advertisementRecordType = a3;
    v15->_double voiceTriggerEndTime = a4;
    uint64_t v17 = [v12 copy];
    advertisementPayload = v16->_advertisementPayload;
    v16->_advertisementPayload = (NSData *)v17;

    uint64_t v19 = [v13 copy];
    deviceID = v16->_deviceID;
    v16->_deviceID = (NSUUID *)v19;

    uint64_t v21 = [v14 copy];
    electionParticipantId = v16->_electionParticipantId;
    v16->_electionParticipantId = (NSUUID *)v21;
  }
  return v16;
}

@end