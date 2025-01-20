@interface SCDARecord
- (BOOL)advertisementDataIsDirty;
- (BOOL)hasEqualAdvertismentData:(id)a3;
- (BOOL)isAContinuation;
- (BOOL)isALateSupressionTrumpFor:(id)a3;
- (BOOL)isATrump;
- (BOOL)isAnEmergency;
- (BOOL)isAnEmergencyHandled;
- (BOOL)isCarplayTrump;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInEarTrump;
- (BOOL)isMe;
- (BOOL)isSane;
- (BOOL)isSlowdown;
- (NSData)advertisementData;
- (NSUUID)deviceID;
- (NSUUID)electionParticipantId;
- (SCDARecord)init;
- (SCDARecord)initWithAudioData:(id)a3;
- (SCDARecord)initWithDeviceID:(id)a3 data:(id)a4 electionParticipantId:(id)a5;
- (id)asAdvertisementData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)slowdownDelay;
- (unint64_t)hash;
- (unsigned)bump;
- (unsigned)deviceClass;
- (unsigned)deviceGroup;
- (unsigned)goodness;
- (unsigned)isCollectedFromContextCollector;
- (unsigned)pHash;
- (unsigned)productType;
- (unsigned)rawAudioGoodnessScore;
- (unsigned)tieBreaker;
- (unsigned)userConfidence;
- (void)adjustByMultiplier:(float)a3 adding:(int)a4;
- (void)generateRandomConfidence;
- (void)generateTiebreaker;
- (void)setAdvertisementData:(id)a3;
- (void)setAdvertisementDataIsDirty:(BOOL)a3;
- (void)setBump:(unsigned __int8)a3;
- (void)setDeviceClass:(unsigned __int8)a3;
- (void)setDeviceGroup:(unsigned __int8)a3;
- (void)setDeviceID:(id)a3;
- (void)setElectionParticipantId:(id)a3;
- (void)setGoodness:(unsigned __int8)a3;
- (void)setIsCollectedFromContextCollector:(unsigned __int8)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setPHash:(unsigned __int16)a3;
- (void)setProductType:(unsigned __int8)a3;
- (void)setRawAudioGoodnessScore:(unsigned __int8)a3;
- (void)setRawAudioGoodnessScore:(unsigned __int8)a3 withBump:(unsigned __int8)a4;
- (void)setTieBreaker:(unsigned __int8)a3;
- (void)setUserConfidence:(unsigned __int8)a3;
@end

@implementation SCDARecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electionParticipantId, 0);
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (void)setElectionParticipantId:(id)a3
{
}

- (NSUUID)electionParticipantId
{
  return self->_electionParticipantId;
}

- (void)setAdvertisementDataIsDirty:(BOOL)a3
{
  self->_advertisementDataIsDirty = a3;
}

- (BOOL)advertisementDataIsDirty
{
  return self->_advertisementDataIsDirty;
}

- (void)setAdvertisementData:(id)a3
{
}

- (NSData)advertisementData
{
  return self->_advertisementData;
}

- (void)setIsCollectedFromContextCollector:(unsigned __int8)a3
{
  self->_isCollectedFromContextCollector = a3;
}

- (unsigned)isCollectedFromContextCollector
{
  return self->_isCollectedFromContextCollector;
}

- (void)setBump:(unsigned __int8)a3
{
  self->_bump = a3;
}

- (unsigned)bump
{
  return self->_bump;
}

- (void)setRawAudioGoodnessScore:(unsigned __int8)a3
{
  self->_rawAudioGoodnessScore = a3;
}

- (unsigned)rawAudioGoodnessScore
{
  return self->_rawAudioGoodnessScore;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (unsigned)tieBreaker
{
  return self->_tieBreaker;
}

- (unsigned)productType
{
  return self->_productType;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceID:(id)a3
{
}

- (NSUUID)deviceID
{
  return self->_deviceID;
}

- (unsigned)deviceGroup
{
  return self->_deviceGroup;
}

- (unsigned)pHash
{
  return self->_pHash;
}

- (unsigned)userConfidence
{
  return self->_userConfidence;
}

- (void)setGoodness:(unsigned __int8)a3
{
  self->_goodness = a3;
}

- (unsigned)goodness
{
  return self->_goodness;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    deviceID = self->_deviceID;
    v7 = [v5 deviceID];
    if (![(NSUUID *)deviceID isEqual:v7]) {
      goto LABEL_16;
    }
    int pHash = self->_pHash;
    if (pHash != [v5 pHash]) {
      goto LABEL_16;
    }
    int goodness = self->_goodness;
    if (goodness != [v5 goodness]) {
      goto LABEL_16;
    }
    int rawAudioGoodnessScore = self->_rawAudioGoodnessScore;
    if (rawAudioGoodnessScore != [v5 rawAudioGoodnessScore]) {
      goto LABEL_16;
    }
    int bump = self->_bump;
    if (bump == [v5 bump]
      && (int userConfidence = self->_userConfidence, userConfidence == [v5 userConfidence])
      && (int deviceGroup = self->_deviceGroup, deviceGroup == [v5 deviceGroup])
      && (int deviceClass = self->_deviceClass, deviceClass == [v5 deviceClass])
      && (int tieBreaker = self->_tieBreaker, tieBreaker == [v5 tieBreaker])
      && (int productType = self->_productType, productType == [v5 productType])
      && (int isMe = self->_isMe, isMe == [v5 isMe]))
    {
      int isCollectedFromContextCollector = self->_isCollectedFromContextCollector;
      BOOL v19 = isCollectedFromContextCollector == [v5 isCollectedFromContextCollector];
    }
    else
    {
LABEL_16:
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_deviceID hash];
  id v4 = [(SCDARecord *)self asAdvertisementData];
  unint64_t v5 = [v4 hash] ^ self->_isMe ^ v3 ^ self->_isCollectedFromContextCollector ^ (unint64_t)self->_rawAudioGoodnessScore ^ self->_bump;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[SCDARecord allocWithZone:a3] init];
  [(SCDARecord *)v4 setDeviceID:self->_deviceID];
  [(SCDARecord *)v4 setPHash:self->_pHash];
  [(SCDARecord *)v4 setGoodness:self->_goodness];
  [(SCDARecord *)v4 setRawAudioGoodnessScore:self->_rawAudioGoodnessScore];
  [(SCDARecord *)v4 setBump:self->_bump];
  [(SCDARecord *)v4 setUserConfidence:self->_userConfidence];
  [(SCDARecord *)v4 setDeviceGroup:self->_deviceGroup];
  [(SCDARecord *)v4 setDeviceClass:self->_deviceClass];
  [(SCDARecord *)v4 setTieBreaker:self->_tieBreaker];
  [(SCDARecord *)v4 setProductType:self->_productType];
  [(SCDARecord *)v4 setIsMe:self->_isMe];
  [(SCDARecord *)v4 setElectionParticipantId:self->_electionParticipantId];
  [(SCDARecord *)v4 setIsCollectedFromContextCollector:self->_isCollectedFromContextCollector];
  return v4;
}

- (id)description
{
  if (self->_isMe) {
    v2 = @"TRUE";
  }
  else {
    v2 = @"FALSE";
  }
  return (id)[NSString stringWithFormat:@"cc=%d epId=%@ MyriadRecord: hash=%#04x,good=%d,conf=%d,dc=%d,pt=%d,tb=%d,isMe=%@,g=%d", self->_isCollectedFromContextCollector, self->_electionParticipantId, self->_pHash, self->_goodness, self->_userConfidence, self->_deviceClass, self->_productType, self->_tieBreaker, v2, self->_deviceGroup];
}

- (BOOL)hasEqualAdvertismentData:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    int pHash = self->_pHash;
    BOOL v13 = 0;
    if (pHash == [v5 pHash])
    {
      int goodness = self->_goodness;
      if (goodness == [v5 goodness])
      {
        int userConfidence = self->_userConfidence;
        if (userConfidence == [v5 userConfidence])
        {
          int deviceGroup = self->_deviceGroup;
          if (deviceGroup == [v5 deviceGroup])
          {
            int deviceClass = self->_deviceClass;
            if (deviceClass == [v5 deviceClass])
            {
              int tieBreaker = self->_tieBreaker;
              if (tieBreaker == [v5 tieBreaker])
              {
                int productType = self->_productType;
                if (productType == [v5 productType]) {
                  BOOL v13 = 1;
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)asAdvertisementData
{
  if (self->_advertisementDataIsDirty || (uint64_t v3 = self->_advertisementData) == 0)
  {
    id v4 = [MEMORY[0x263EFF990] dataWithCapacity:7];
    [v4 appendBytes:&self->_pHash length:2];
    [v4 appendBytes:&self->_goodness length:1];
    [v4 appendBytes:&self->_userConfidence length:1];
    [v4 appendBytes:&self->_deviceGroup length:1];
    [v4 appendBytes:&self->_deviceClass length:1];
    [v4 appendBytes:&self->_tieBreaker length:1];
    [v4 appendBytes:&self->_productType length:1];
    id v5 = (NSData *)[v4 copy];
    advertisementData = self->_advertisementData;
    self->_advertisementData = v5;

    self->_advertisementDataIsDirty = 0;
    uint64_t v3 = self->_advertisementData;
  }
  v7 = (void *)[(NSData *)v3 copy];
  return v7;
}

- (int)slowdownDelay
{
  int result = [(SCDARecord *)self isSlowdown];
  if (result) {
    return 8 * self->_userConfidence;
  }
  return result;
}

- (BOOL)isSlowdown
{
  return self->_goodness == 208 && self->_pHash == 0;
}

- (BOOL)isSane
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int goodness = self->_goodness;
  BOOL v6 = (char)goodness > -17 || goodness == 224 || goodness == 208;
  unsigned int deviceClass = self->_deviceClass;
  if (deviceClass > 0x1F || !v6)
  {
    v8 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[SCDARecord isSane]";
      __int16 v12 = 2112;
      BOOL v13 = self;
      _os_log_error_impl(&dword_25C707000, v8, OS_LOG_TYPE_ERROR, "%s SCDARecord %@ sanity: NO", (uint8_t *)&v10, 0x16u);
      unsigned int deviceClass = self->_deviceClass;
    }
  }
  return deviceClass < 0x20 && v6;
}

- (BOOL)isAnEmergencyHandled
{
  return self->_goodness == 224 && self->_pHash == 0;
}

- (BOOL)isAnEmergency
{
  return self->_goodness == 239 && self->_pHash == 0;
}

- (BOOL)isAContinuation
{
  return !self->_goodness && (__int16)self->_pHash == -1;
}

- (BOOL)isALateSupressionTrumpFor:(id)a3
{
  id v4 = a3;
  int pHash = self->_pHash;
  BOOL v6 = pHash == [v4 pHash]
    && ![(SCDARecord *)self isAContinuation]
    && ![(SCDARecord *)self isATrump]
    && self->_goodness == 255
    && [v4 goodness] != 255;

  return v6;
}

- (BOOL)isCarplayTrump
{
  return self->_goodness == 244 && (__int16)self->_pHash == -1;
}

- (BOOL)isInEarTrump
{
  return self->_goodness == 248 && (__int16)self->_pHash == -1;
}

- (BOOL)isATrump
{
  return self->_goodness >= 0xF0u && (__int16)self->_pHash == -1;
}

- (void)generateTiebreaker
{
  unsigned __int8 v3 = arc4random_uniform(0x100u);
  self->_int tieBreaker = v3;
  while (_lastRandomTieBreakerGenerated == v3)
  {
    unsigned __int8 v3 = arc4random_uniform(0x100u);
    self->_int tieBreaker = v3;
  }
  _lastRandomTieBreakerGenerated = v3;
  self->_advertisementDataIsDirty = 1;
}

- (void)setTieBreaker:(unsigned __int8)a3
{
  if (self->_tieBreaker != a3)
  {
    self->_int tieBreaker = a3;
    self->_advertisementDataIsDirty = 1;
  }
}

- (void)setProductType:(unsigned __int8)a3
{
  if (self->_productType != a3)
  {
    self->_int productType = a3;
    self->_advertisementDataIsDirty = 1;
  }
}

- (void)setDeviceClass:(unsigned __int8)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_deviceClass != a3)
  {
    int v3 = a3;
    self->_unsigned int deviceClass = a3;
    if (a3 >= 0x20u)
    {
      int v5 = a3 & 0x1F;
      BOOL v6 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        int v7 = 136315650;
        v8 = "-[SCDARecord setDeviceClass:]";
        __int16 v9 = 1024;
        int v10 = v3;
        __int16 v11 = 1024;
        int v12 = v5;
        _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s #scda Error: Unexpected device class %du masked to: %du", (uint8_t *)&v7, 0x18u);
      }
      self->_unsigned int deviceClass = v5;
    }
    self->_advertisementDataIsDirty = 1;
  }
}

- (void)setDeviceGroup:(unsigned __int8)a3
{
  if (self->_deviceGroup != a3)
  {
    self->_int deviceGroup = a3;
    self->_advertisementDataIsDirty = 1;
  }
}

- (void)generateRandomConfidence
{
  unsigned __int8 v3 = arc4random_uniform(0x100u);
  self->_int userConfidence = v3;
  while (_lastRandomConfidenceGenerated == v3)
  {
    unsigned __int8 v3 = arc4random_uniform(0x100u);
    self->_int userConfidence = v3;
  }
  _lastRandomConfidenceGenerated = v3;
  self->_advertisementDataIsDirty = 1;
}

- (void)setUserConfidence:(unsigned __int8)a3
{
  if (self->_userConfidence != a3)
  {
    self->_int userConfidence = a3;
    self->_advertisementDataIsDirty = 1;
  }
}

- (void)adjustByMultiplier:(float)a3 adding:(int)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  LOBYTE(v4) = self->_goodness;
  int v6 = (int)(float)((float)a4 + (float)((float)v4 * a3));
  int v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    int v10 = "-[SCDARecord adjustByMultiplier:adding:]";
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_impl(&dword_25C707000, v7, OS_LOG_TYPE_INFO, "%s #scda newGoodness: %d", (uint8_t *)&v9, 0x12u);
  }
  unsigned int v8 = v6 & ~(v6 >> 31);
  if (v8 >= 0x7F) {
    LOBYTE(v8) = 127;
  }
  if (v6 > 254) {
    LOBYTE(v8) = -1;
  }
  self->_int bump = v8;
  [(SCDARecord *)self setGoodness:v8];
  self->_advertisementDataIsDirty = 1;
}

- (void)setRawAudioGoodnessScore:(unsigned __int8)a3 withBump:(unsigned __int8)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  self->_int rawAudioGoodnessScore = a3;
  self->_int bump = a4;
  unsigned __int8 v5 = a4 + a3;
  if ((a4 + a3) >= 0x100)
  {
    int v6 = a4;
    int v7 = a3;
    unsigned int v8 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315650;
      uint64_t v14 = "-[SCDARecord setRawAudioGoodnessScore:withBump:]";
      __int16 v15 = 1024;
      int v16 = v7;
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_error_impl(&dword_25C707000, v8, OS_LOG_TYPE_ERROR, "%s [(rawAudioGoodnessScore + bump) overflow] rawAudioGoodnessScore: %d, bump: %d. Overwriting goodness score to 0xff", (uint8_t *)&v13, 0x18u);
    }
    unsigned __int8 v5 = -1;
  }
  [(SCDARecord *)self setGoodness:v5];
  self->_advertisementDataIsDirty = 1;
  int v9 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    int rawAudioGoodnessScore = self->_rawAudioGoodnessScore;
    int bump = self->_bump;
    int goodness = self->_goodness;
    int v13 = 136315906;
    uint64_t v14 = "-[SCDARecord setRawAudioGoodnessScore:withBump:]";
    __int16 v15 = 1024;
    int v16 = rawAudioGoodnessScore;
    __int16 v17 = 1024;
    int v18 = bump;
    __int16 v19 = 1024;
    int v20 = goodness;
    _os_log_impl(&dword_25C707000, v9, OS_LOG_TYPE_INFO, "%s rawAudioGoodnessScore: %d, bump: %d goodness: %d", (uint8_t *)&v13, 0x1Eu);
  }
}

- (void)setPHash:(unsigned __int16)a3
{
  if (self->_pHash != a3)
  {
    self->_int pHash = a3;
    self->_advertisementDataIsDirty = 1;
  }
}

- (SCDARecord)initWithDeviceID:(id)a3 data:(id)a4 electionParticipantId:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)SCDARecord;
  int v12 = [(SCDARecord *)&v29 init];
  int v13 = v12;
  if (v12)
  {
    advertisementData = v12->_advertisementData;
    v12->_advertisementData = 0;

    v13->_int productType = 0;
    objc_storeStrong((id *)&v13->_deviceID, a3);
    unint64_t v15 = [v10 length];
    if (v15 < 7)
    {
      if (v10)
      {
        int v20 = (void *)SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
        {
          v25 = NSNumber;
          v26 = v20;
          v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v10, "length"));
          *(_DWORD *)buf = 136315650;
          v31 = "-[SCDARecord initWithDeviceID:data:electionParticipantId:]";
          __int16 v32 = 2112;
          *(void *)v33 = v27;
          *(_WORD *)&v33[8] = 2112;
          id v34 = v10;
          _os_log_error_impl(&dword_25C707000, v26, OS_LOG_TYPE_ERROR, "%s Bad data of unexpected length %@ : %@", buf, 0x20u);
        }
      }
      v13->_int pHash = 0;
      *(_DWORD *)&v13->_int goodness = 0;
      *(_WORD *)&v13->_int productType = 0;
    }
    else
    {
      unint64_t v16 = v15;
      objc_msgSend(v10, "getBytes:range:", &v13->_pHash, 0, 2);
      objc_msgSend(v10, "getBytes:range:", &v13->_goodness, 2, 1);
      objc_msgSend(v10, "getBytes:range:", &v13->_userConfidence, 3, 1);
      objc_msgSend(v10, "getBytes:range:", &v13->_deviceGroup, 4, 1);
      objc_msgSend(v10, "getBytes:range:", &v13->_deviceClass, 5, 1);
      objc_msgSend(v10, "getBytes:range:", &v13->_tieBreaker, 6, 1);
      unsigned int deviceClass = v13->_deviceClass;
      if (deviceClass >= 0x20)
      {
        id v28 = v9;
        int v18 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v31 = "-[SCDARecord initWithDeviceID:data:electionParticipantId:]";
          __int16 v32 = 1024;
          *(_DWORD *)v33 = deviceClass;
          *(_WORD *)&v33[4] = 1024;
          *(_DWORD *)&v33[6] = deviceClass & 0x1F;
          _os_log_impl(&dword_25C707000, v18, OS_LOG_TYPE_INFO, "%s #scda Error: Unexpected device class %du masked to: %du", buf, 0x18u);
        }
        v13->_unsigned int deviceClass = deviceClass & 0x1F;
        id v9 = v28;
      }
      if (v16 <= 7 || (objc_msgSend(v10, "getBytes:range:", &v13->_productType, 7, 1), v16 == 8))
      {
        uint64_t v19 = [v10 copy];
      }
      else
      {
        id v21 = v10;
        uint64_t v19 = objc_msgSend(v21, "initWithBytes:length:", objc_msgSend(v21, "bytes"), 8);
      }
      v22 = v13->_advertisementData;
      v13->_advertisementData = (NSData *)v19;

      objc_storeStrong((id *)&v13->_electionParticipantId, a5);
    }
    v23 = v13;
  }

  return v13;
}

- (SCDARecord)initWithAudioData:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCDARecord;
  unsigned __int8 v5 = [(SCDARecord *)&v12 init];
  if (v5)
  {
    int v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "-[SCDARecord initWithAudioData:]";
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_25C707000, v6, OS_LOG_TYPE_INFO, "%s SCDARecord initfrom: <THISDEVICE> - %@", buf, 0x16u);
    }
    extractMyriadDataFromAudioContext(v4, &v5->_pHash, &v5->_goodness, &v5->_userConfidence, 0, &v5->_tieBreaker);
    unsigned int goodness = v5->_goodness;
    if (goodness >= 0x7F) {
      LOBYTE(goodness) = 127;
    }
    v5->_unsigned int goodness = goodness;
    v5->_int rawAudioGoodnessScore = goodness;
    v5->_int deviceGroup = 0;
    deviceID = v5->_deviceID;
    v5->_deviceID = 0;

    v5->_unsigned int deviceClass = 0;
    if ([v4 length] == 13) {
      objc_msgSend(v4, "getBytes:range:", &v5->_tieBreaker, 12, 1);
    }
    if (!v5->_tieBreaker) {
      [(SCDARecord *)v5 generateTiebreaker];
    }
    v5->_int isMe = 0;
    advertisementData = v5->_advertisementData;
    v5->_advertisementData = 0;

    id v10 = v5;
  }

  return v5;
}

- (SCDARecord)init
{
  v7.receiver = self;
  v7.super_class = (Class)SCDARecord;
  v2 = [(SCDARecord *)&v7 init];
  unsigned __int8 v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_unsigned int goodness = 0;
    v2->_int pHash = 0;
    deviceID = v2->_deviceID;
    v2->_deviceID = 0;

    *(_DWORD *)&v3->_unsigned int deviceClass = 0;
    unsigned __int8 v5 = v3;
  }

  return v3;
}

@end