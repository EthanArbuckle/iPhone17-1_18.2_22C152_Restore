@interface SCDAFParticipation
+ (BOOL)supportsSecureCoding;
- (NSArray)boosts;
- (NSArray)nearbyDevices;
- (NSArray)seenAdvertisements;
- (NSArray)trumpReasons;
- (NSDate)requestStartDate;
- (NSDate)voiceTriggerDate;
- (NSNumber)alarmState;
- (NSNumber)mediaState;
- (NSNumber)timeSinceLastWinInMilliseconds;
- (NSNumber)timeSinceTriggerInMilliseconds;
- (NSNumber)timerState;
- (NSNumber)triggerType;
- (NSString)cdaId;
- (NSString)requestId;
- (NSString)userRequestText;
- (SCDAFAdvertisement)advertisement;
- (SCDAFAdvertisement)winnerAdvertisement;
- (SCDAFDevice)device;
- (SCDAFParticipation)initWithAdvertisement:(id)a3 alarmState:(id)a4 boosts:(id)a5 cdaId:(id)a6 device:(id)a7 mediaState:(id)a8 nearbyDevices:(id)a9 rawGoodnessScore:(double)a10 requestId:(id)a11 requestStartDate:(id)a12 result:(unint64_t)a13 seenAdvertisements:(id)a14 timeSinceLastTriggerInMilliseconds:(id)a15 timeSinceLastWinInMilliseconds:(id)a16 timerState:(id)a17 triggerType:(id)a18 trumpReasons:(id)a19 userRequestText:(id)a20 voiceTriggerDate:(id)a21 winnerAdvertisement:(id)a22;
- (SCDAFParticipation)initWithAdvertisement:(id)a3 boosts:(id)a4 cdaId:(id)a5 rawGoodnessScore:(double)a6 requestStartDate:(id)a7 result:(unint64_t)a8 seenAdvertisements:(id)a9 timeSinceLastTriggerInMilliseconds:(id)a10 timeSinceLastWinInMilliseconds:(id)a11 triggerType:(id)a12 trumpReasons:(id)a13 voiceTriggerDate:(id)a14 winnerAdvertisement:(id)a15;
- (SCDAFParticipation)initWithCoder:(id)a3;
- (SCDAFParticipation)initWithDictionaryRepresentation:(id)a3;
- (double)rawGoodnessScore;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initNearMiss;
- (unint64_t)result;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertisement:(id)a3;
- (void)setAlarmState:(id)a3;
- (void)setBoosts:(id)a3;
- (void)setCdaId:(id)a3;
- (void)setDevice:(id)a3;
- (void)setMediaState:(id)a3;
- (void)setNearbyDevices:(id)a3;
- (void)setRawGoodnessScore:(double)a3;
- (void)setRequestId:(id)a3;
- (void)setRequestStartDate:(id)a3;
- (void)setResult:(unint64_t)a3;
- (void)setSeenAdvertisements:(id)a3;
- (void)setTimeSinceLastWinInMilliseconds:(id)a3;
- (void)setTimeSinceTriggerInMilliseconds:(id)a3;
- (void)setTimerState:(id)a3;
- (void)setTriggerType:(id)a3;
- (void)setTrumpReasons:(id)a3;
- (void)setUserRequestText:(id)a3;
- (void)setVoiceTriggerDate:(id)a3;
- (void)setWinnerAdvertisement:(id)a3;
@end

@implementation SCDAFParticipation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->_userRequestText, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_timerState, 0);
  objc_storeStrong((id *)&self->_mediaState, 0);
  objc_storeStrong((id *)&self->_alarmState, 0);
  objc_storeStrong((id *)&self->_winnerAdvertisement, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
  objc_storeStrong((id *)&self->_voiceTriggerDate, 0);
  objc_storeStrong((id *)&self->_requestStartDate, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_boosts, 0);
  objc_storeStrong((id *)&self->_seenAdvertisements, 0);
  objc_storeStrong((id *)&self->_trumpReasons, 0);
  objc_storeStrong((id *)&self->_cdaId, 0);
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_timeSinceTriggerInMilliseconds, 0);

  objc_storeStrong((id *)&self->_timeSinceLastWinInMilliseconds, 0);
}

- (void)setNearbyDevices:(id)a3
{
}

- (NSArray)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setUserRequestText:(id)a3
{
}

- (NSString)userRequestText
{
  return self->_userRequestText;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setTimerState:(id)a3
{
}

- (NSNumber)timerState
{
  return self->_timerState;
}

- (void)setMediaState:(id)a3
{
}

- (NSNumber)mediaState
{
  return self->_mediaState;
}

- (void)setAlarmState:(id)a3
{
}

- (NSNumber)alarmState
{
  return self->_alarmState;
}

- (void)setWinnerAdvertisement:(id)a3
{
}

- (SCDAFAdvertisement)winnerAdvertisement
{
  return self->_winnerAdvertisement;
}

- (void)setAdvertisement:(id)a3
{
}

- (SCDAFAdvertisement)advertisement
{
  return self->_advertisement;
}

- (void)setVoiceTriggerDate:(id)a3
{
}

- (NSDate)voiceTriggerDate
{
  return self->_voiceTriggerDate;
}

- (void)setRequestStartDate:(id)a3
{
}

- (NSDate)requestStartDate
{
  return self->_requestStartDate;
}

- (void)setDevice:(id)a3
{
}

- (SCDAFDevice)device
{
  return self->_device;
}

- (void)setBoosts:(id)a3
{
}

- (NSArray)boosts
{
  return self->_boosts;
}

- (void)setSeenAdvertisements:(id)a3
{
}

- (NSArray)seenAdvertisements
{
  return self->_seenAdvertisements;
}

- (void)setTrumpReasons:(id)a3
{
}

- (NSArray)trumpReasons
{
  return self->_trumpReasons;
}

- (void)setCdaId:(id)a3
{
}

- (NSString)cdaId
{
  return self->_cdaId;
}

- (void)setTriggerType:(id)a3
{
}

- (NSNumber)triggerType
{
  return self->_triggerType;
}

- (void)setTimeSinceTriggerInMilliseconds:(id)a3
{
}

- (NSNumber)timeSinceTriggerInMilliseconds
{
  return self->_timeSinceTriggerInMilliseconds;
}

- (void)setTimeSinceLastWinInMilliseconds:(id)a3
{
}

- (NSNumber)timeSinceLastWinInMilliseconds
{
  return self->_timeSinceLastWinInMilliseconds;
}

- (void)setResult:(unint64_t)a3
{
  self->_result = a3;
}

- (unint64_t)result
{
  return self->_result;
}

- (void)setRawGoodnessScore:(double)a3
{
  self->_rawGoodnessScore = a3;
}

- (double)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (SCDAFParticipation)initWithCoder:(id)a3
{
  id v3 = a3;
  v27 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"rawGoodnessScore"];
  v28 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"requestStartDate"];
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"voiceTriggerDate"];
  v26 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"userRequestText"];
  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"device"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"advertisement"];
  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"winnerAdvertisement"];
  v25 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"seenAdvertisements"];
  v14 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"trumpReasons"];
  v18 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"boosts"];
  v13 = [v3 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"nearbyDevices"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"requestId"];
  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"cdaId"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"alarmState"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"timerState"];
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"mediaState"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"triggerType"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"timeSinceLastWinInMilliseconds"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"timeSinceTriggerInMilliseconds"];

  v9 = [SCDAFParticipation alloc];
  [v27 floatValue];
  v15 = -[SCDAFParticipation initWithAdvertisement:alarmState:boosts:cdaId:device:mediaState:nearbyDevices:rawGoodnessScore:requestId:requestStartDate:result:seenAdvertisements:timeSinceLastTriggerInMilliseconds:timeSinceLastWinInMilliseconds:timerState:triggerType:trumpReasons:userRequestText:voiceTriggerDate:winnerAdvertisement:](v9, "initWithAdvertisement:alarmState:boosts:cdaId:device:mediaState:nearbyDevices:rawGoodnessScore:requestId:requestStartDate:result:seenAdvertisements:timeSinceLastTriggerInMilliseconds:timeSinceLastWinInMilliseconds:timerState:triggerType:trumpReasons:userRequestText:voiceTriggerDate:winnerAdvertisement:", v19, v5, v18, v17, v20, v16, v10, v13, v4, v28, [v22 integerValue], v25, v8, v7, v12,
          v6,
          v14,
          v26,
          v23,
          v24);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  double rawGoodnessScore = self->_rawGoodnessScore;
  id v8 = a3;
  v6 = [v4 numberWithDouble:rawGoodnessScore];
  [v8 encodeObject:v6 forKey:@"rawGoodnessScore"];

  [v8 encodeObject:self->_requestStartDate forKey:@"requestStartDate"];
  [v8 encodeObject:self->_voiceTriggerDate forKey:@"voiceTriggerDate"];
  [v8 encodeObject:self->_userRequestText forKey:@"userRequestText"];
  v7 = [NSNumber numberWithUnsignedInteger:self->_result];
  [v8 encodeObject:v7 forKey:@"result"];

  [v8 encodeObject:self->_device forKey:@"device"];
  [v8 encodeObject:self->_advertisement forKey:@"advertisement"];
  [v8 encodeObject:self->_winnerAdvertisement forKey:@"winnerAdvertisement"];
  [v8 encodeObject:self->_seenAdvertisements forKey:@"seenAdvertisements"];
  [v8 encodeObject:self->_boosts forKey:@"boosts"];
  [v8 encodeObject:self->_trumpReasons forKey:@"trumpReasons"];
  [v8 encodeObject:self->_nearbyDevices forKey:@"nearbyDevices"];
  [v8 encodeObject:self->_requestId forKey:@"requestId"];
  [v8 encodeObject:self->_cdaId forKey:@"cdaId"];
  [v8 encodeObject:self->_alarmState forKey:@"alarmState"];
  [v8 encodeObject:self->_timerState forKey:@"timerState"];
  [v8 encodeObject:self->_mediaState forKey:@"mediaState"];
  [v8 encodeObject:self->_triggerType forKey:@"triggerType"];
  [v8 encodeObject:self->_timeSinceLastWinInMilliseconds forKey:@"timeSinceLastWinInMilliseconds"];
  [v8 encodeObject:self->_timeSinceTriggerInMilliseconds forKey:@"timeSinceTriggerInMilliseconds"];
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(SCDAFParticipation *)self advertisement];

  if (v4)
  {
    v5 = [(SCDAFParticipation *)self advertisement];
    v6 = [v5 dictionaryRepresentation];
    [v3 setObject:v6 forKeyedSubscript:@"advertisement"];
  }
  v7 = [(SCDAFParticipation *)self winnerAdvertisement];

  if (v7)
  {
    id v8 = [(SCDAFParticipation *)self winnerAdvertisement];
    v9 = [v8 dictionaryRepresentation];
    [v3 setObject:v9 forKeyedSubscript:@"winnerAdvertisement"];
  }
  float v10 = [(SCDAFParticipation *)self seenAdvertisements];

  if (v10)
  {
    v11 = [(SCDAFParticipation *)self seenAdvertisements];
    v12 = +[SCDAFAdvertisement arrayDictionaryRepresentation:v11];
    [v3 setObject:v12 forKeyedSubscript:@"seenAdvertisements"];
  }
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SCDAFParticipation result](self, "result"));
  [v3 setObject:v13 forKeyedSubscript:@"result"];

  v14 = NSNumber;
  [(SCDAFParticipation *)self rawGoodnessScore];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  [v3 setObject:v15 forKeyedSubscript:@"rawGoodnessScore"];

  v16 = [(SCDAFParticipation *)self device];

  if (v16)
  {
    v17 = [(SCDAFParticipation *)self device];
    v18 = [v17 dictionaryRepresentation];
    [v3 setObject:v18 forKeyedSubscript:@"device"];
  }
  v19 = [(SCDAFParticipation *)self requestStartDate];

  if (v19)
  {
    v20 = [(SCDAFParticipation *)self requestStartDate];
    [v3 setObject:v20 forKeyedSubscript:@"requestStartDate"];
  }
  v21 = [(SCDAFParticipation *)self voiceTriggerDate];

  if (v21)
  {
    v22 = [(SCDAFParticipation *)self voiceTriggerDate];
    [v3 setObject:v22 forKeyedSubscript:@"voiceTriggerDate"];
  }
  v23 = [(SCDAFParticipation *)self userRequestText];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    v25 = [(SCDAFParticipation *)self userRequestText];
    [v3 setObject:v25 forKeyedSubscript:@"userRequestText"];
  }
  v26 = [(SCDAFParticipation *)self trumpReasons];
  uint64_t v27 = [v26 count];

  if (v27)
  {
    v28 = [(SCDAFParticipation *)self trumpReasons];
    [v3 setObject:v28 forKeyedSubscript:@"trumpReasons"];
  }
  v29 = [(SCDAFParticipation *)self nearbyDevices];
  uint64_t v30 = [v29 count];

  if (v30)
  {
    v31 = [(SCDAFParticipation *)self nearbyDevices];
    v32 = +[SCDAFDevice arrayDictionaryRepresentation:v31];
    [v3 setObject:v32 forKeyedSubscript:@"nearbyDevices"];
  }
  v33 = [(SCDAFParticipation *)self boosts];
  uint64_t v34 = [v33 count];

  if (v34)
  {
    v35 = [(SCDAFParticipation *)self boosts];
    v36 = +[SCDAFBoost arrayDictionaryRepresentation:v35];
    [v3 setObject:v36 forKeyedSubscript:@"boosts"];
  }
  v37 = [(SCDAFParticipation *)self requestId];
  uint64_t v38 = [v37 length];

  if (v38)
  {
    v39 = [(SCDAFParticipation *)self requestId];
    [v3 setObject:v39 forKeyedSubscript:@"requestId"];
  }
  v40 = [(SCDAFParticipation *)self cdaId];
  uint64_t v41 = [v40 length];

  if (v41)
  {
    v42 = [(SCDAFParticipation *)self cdaId];
    [v3 setObject:v42 forKeyedSubscript:@"cdaId"];
  }
  v43 = [(SCDAFParticipation *)self alarmState];
  [v3 setObject:v43 forKeyedSubscript:@"alarmState"];

  v44 = [(SCDAFParticipation *)self timerState];
  [v3 setObject:v44 forKeyedSubscript:@"timerState"];

  v45 = [(SCDAFParticipation *)self mediaState];
  [v3 setObject:v45 forKeyedSubscript:@"mediaState"];

  v46 = [(SCDAFParticipation *)self triggerType];
  [v3 setObject:v46 forKeyedSubscript:@"triggerType"];

  v47 = [(SCDAFParticipation *)self timeSinceLastWinInMilliseconds];
  [v3 setObject:v47 forKeyedSubscript:@"timeSinceLastWinInMilliseconds"];

  v48 = [(SCDAFParticipation *)self timeSinceTriggerInMilliseconds];
  [v3 setObject:v48 forKeyedSubscript:@"timeSinceTriggerInMilliseconds"];

  v49 = [NSDictionary dictionaryWithDictionary:v3];

  return v49;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(SCDAFParticipation *)self dictionaryRepresentation];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (SCDAFParticipation)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)SCDAFParticipation;
  v5 = [(SCDAFParticipation *)&v86 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"winnerAdvertisement"];

    if (v6)
    {
      v7 = [SCDAFAdvertisement alloc];
      id v8 = [v4 objectForKeyedSubscript:@"advertisement"];
      uint64_t v9 = [(SCDAFAdvertisement *)v7 initWithDictionaryRepresentation:v8];
      advertisement = v5->_advertisement;
      v5->_advertisement = (SCDAFAdvertisement *)v9;
    }
    v11 = [v4 objectForKeyedSubscript:@"result"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v13 = [v4 objectForKeyedSubscript:@"result"];
      v5->_result = [v13 integerValue];
    }
    v14 = [v4 objectForKeyedSubscript:@"boosts"];

    if (v14)
    {
      v15 = [v4 objectForKeyedSubscript:@"boosts"];
      uint64_t v16 = +[SCDAFBoost boostsArrayWithDictionaryRepresentation:v15];
      boosts = v5->_boosts;
      v5->_boosts = (NSArray *)v16;
    }
    v18 = [v4 objectForKeyedSubscript:@"rawGoodnessScore"];
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if (v19)
    {
      v20 = [v4 objectForKeyedSubscript:@"rawGoodnessScore"];
      v5->_double rawGoodnessScore = (double)[v20 integerValue];
    }
    v21 = [SCDAFDevice alloc];
    uint64_t v22 = [v4 objectForKeyedSubscript:@"device"];
    uint64_t v23 = [(SCDAFDevice *)v21 initWithDictionaryRepresentation:v22];
    device = v5->_device;
    v5->_device = (SCDAFDevice *)v23;

    v25 = [v4 objectForKeyedSubscript:@"requestStartDate"];
    objc_opt_class();
    LOBYTE(v22) = objc_opt_isKindOfClass();

    if (v22)
    {
      uint64_t v26 = [v4 objectForKeyedSubscript:@"requestStartDate"];
      requestStartDate = v5->_requestStartDate;
      v5->_requestStartDate = (NSDate *)v26;
    }
    v28 = [v4 objectForKeyedSubscript:@"requestStartDate"];
    objc_opt_class();
    char v29 = objc_opt_isKindOfClass();

    if (v29)
    {
      uint64_t v30 = [v4 objectForKeyedSubscript:@"voiceTriggerDate"];
      voiceTriggerDate = v5->_voiceTriggerDate;
      v5->_voiceTriggerDate = (NSDate *)v30;
    }
    v32 = [v4 objectForKeyedSubscript:@"seenAdvertisements"];
    uint64_t v33 = +[SCDAFAdvertisement advertisementsArrayWithDictionaryRepresentation:v32];
    seenAdvertisements = v5->_seenAdvertisements;
    v5->_seenAdvertisements = (NSArray *)v33;

    v35 = [MEMORY[0x263EFF980] array];
    v36 = [v4 objectForKeyedSubscript:@"trumpReasons"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v84[0] = MEMORY[0x263EF8330];
      v84[1] = 3221225472;
      v84[2] = __55__SCDAFParticipation_initWithDictionaryRepresentation___block_invoke;
      v84[3] = &unk_2654BA8D8;
      id v85 = v35;
      [v36 enumerateObjectsUsingBlock:v84];
    }
    objc_storeStrong((id *)&v5->_trumpReasons, v35);
    uint64_t v37 = [v4 objectForKeyedSubscript:@"nearbyDevices"];
    uint64_t v38 = +[SCDAFDevice devicesArrayWithDictionaryRepresentation:v37];
    nearbyDevices = v5->_nearbyDevices;
    v5->_nearbyDevices = (NSArray *)v38;

    v40 = [v4 objectForKeyedSubscript:@"userRequestText"];
    objc_opt_class();
    LOBYTE(v37) = objc_opt_isKindOfClass();

    if (v37)
    {
      uint64_t v41 = [v4 objectForKeyedSubscript:@"userRequestText"];
      uint64_t v42 = [v41 copy];
      userRequestText = v5->_userRequestText;
      v5->_userRequestText = (NSString *)v42;
    }
    v44 = [v4 objectForKeyedSubscript:@"winnerAdvertisement"];

    if (v44)
    {
      v45 = [SCDAFAdvertisement alloc];
      v46 = [v4 objectForKeyedSubscript:@"winnerAdvertisement"];
      uint64_t v47 = [(SCDAFAdvertisement *)v45 initWithDictionaryRepresentation:v46];
      winnerAdvertisement = v5->_winnerAdvertisement;
      v5->_winnerAdvertisement = (SCDAFAdvertisement *)v47;
    }
    v49 = [v4 objectForKeyedSubscript:@"requestId"];
    objc_opt_class();
    char v50 = objc_opt_isKindOfClass();

    if (v50)
    {
      v51 = [v4 objectForKeyedSubscript:@"requestId"];
      uint64_t v52 = [v51 copy];
      requestId = v5->_requestId;
      v5->_requestId = (NSString *)v52;
    }
    v54 = [v4 objectForKeyedSubscript:@"cdaId"];
    objc_opt_class();
    char v55 = objc_opt_isKindOfClass();

    if (v55)
    {
      v56 = [v4 objectForKeyedSubscript:@"cdaId"];
      uint64_t v57 = [v56 copy];
      cdaId = v5->_cdaId;
      v5->_cdaId = (NSString *)v57;
    }
    v59 = [v4 objectForKeyedSubscript:@"alarmState"];
    objc_opt_class();
    char v60 = objc_opt_isKindOfClass();

    if (v60)
    {
      uint64_t v61 = [v4 objectForKeyedSubscript:@"alarmState"];
      alarmState = v5->_alarmState;
      v5->_alarmState = (NSNumber *)v61;
    }
    v63 = [v4 objectForKeyedSubscript:@"timerState"];
    objc_opt_class();
    char v64 = objc_opt_isKindOfClass();

    if (v64)
    {
      uint64_t v65 = [v4 objectForKeyedSubscript:@"timerState"];
      timerState = v5->_timerState;
      v5->_timerState = (NSNumber *)v65;
    }
    v67 = [v4 objectForKeyedSubscript:@"mediaState"];
    objc_opt_class();
    char v68 = objc_opt_isKindOfClass();

    if (v68)
    {
      uint64_t v69 = [v4 objectForKeyedSubscript:@"mediaState"];
      mediaState = v5->_mediaState;
      v5->_mediaState = (NSNumber *)v69;
    }
    v71 = [v4 objectForKeyedSubscript:@"triggerType"];
    objc_opt_class();
    char v72 = objc_opt_isKindOfClass();

    if (v72)
    {
      uint64_t v73 = [v4 objectForKeyedSubscript:@"triggerType"];
      triggerType = v5->_triggerType;
      v5->_triggerType = (NSNumber *)v73;
    }
    v75 = [v4 objectForKeyedSubscript:@"timeSinceLastWinInMilliseconds"];
    objc_opt_class();
    char v76 = objc_opt_isKindOfClass();

    if (v76)
    {
      uint64_t v77 = [v4 objectForKeyedSubscript:@"timeSinceLastWinInMilliseconds"];
      timeSinceLastWinInMilliseconds = v5->_timeSinceLastWinInMilliseconds;
      v5->_timeSinceLastWinInMilliseconds = (NSNumber *)v77;
    }
    v79 = [v4 objectForKeyedSubscript:@"timeSinceTriggerInMilliseconds"];
    objc_opt_class();
    char v80 = objc_opt_isKindOfClass();

    if (v80)
    {
      uint64_t v81 = [v4 objectForKeyedSubscript:@"timeSinceTriggerInMilliseconds"];
      timeSinceTriggerInMilliseconds = v5->_timeSinceTriggerInMilliseconds;
      v5->_timeSinceTriggerInMilliseconds = (NSNumber *)v81;
    }
  }

  return v5;
}

void __55__SCDAFParticipation_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v6 integerValue];
    id v4 = *(void **)(a1 + 32);
    v5 = [NSNumber numberWithUnsignedInteger:v3];
    [v4 addObject:v5];
  }
}

- (SCDAFParticipation)initWithAdvertisement:(id)a3 alarmState:(id)a4 boosts:(id)a5 cdaId:(id)a6 device:(id)a7 mediaState:(id)a8 nearbyDevices:(id)a9 rawGoodnessScore:(double)a10 requestId:(id)a11 requestStartDate:(id)a12 result:(unint64_t)a13 seenAdvertisements:(id)a14 timeSinceLastTriggerInMilliseconds:(id)a15 timeSinceLastWinInMilliseconds:(id)a16 timerState:(id)a17 triggerType:(id)a18 trumpReasons:(id)a19 userRequestText:(id)a20 voiceTriggerDate:(id)a21 winnerAdvertisement:(id)a22
{
  id v52 = a3;
  id v40 = a4;
  id v51 = a4;
  id v41 = a5;
  id v49 = a5;
  id v47 = a6;
  id v45 = a7;
  id v43 = a8;
  id v54 = a9;
  id v53 = a11;
  id v50 = a12;
  id v48 = a14;
  id v46 = a15;
  id v44 = a16;
  id v28 = a17;
  id v29 = a18;
  id v30 = a19;
  id v31 = a20;
  id v32 = a21;
  id v33 = a22;
  v55.receiver = self;
  v55.super_class = (Class)SCDAFParticipation;
  uint64_t v34 = [(SCDAFParticipation *)&v55 init];
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_advertisement, a3);
    objc_storeStrong((id *)&v35->_alarmState, v40);
    objc_storeStrong((id *)&v35->_boosts, v41);
    objc_storeStrong((id *)&v35->_cdaId, a6);
    objc_storeStrong((id *)&v35->_device, a7);
    objc_storeStrong((id *)&v35->_mediaState, a8);
    objc_storeStrong((id *)&v35->_nearbyDevices, a9);
    v35->_double rawGoodnessScore = a10;
    objc_storeStrong((id *)&v35->_requestId, a11);
    objc_storeStrong((id *)&v35->_requestStartDate, a12);
    v35->_result = a13;
    objc_storeStrong((id *)&v35->_seenAdvertisements, a14);
    objc_storeStrong((id *)&v35->_timeSinceTriggerInMilliseconds, a15);
    objc_storeStrong((id *)&v35->_timeSinceLastWinInMilliseconds, a16);
    objc_storeStrong((id *)&v35->_timerState, a17);
    objc_storeStrong((id *)&v35->_triggerType, a18);
    objc_storeStrong((id *)&v35->_trumpReasons, a19);
    objc_storeStrong((id *)&v35->_voiceTriggerDate, a21);
    objc_storeStrong((id *)&v35->_userRequestText, a20);
    objc_storeStrong((id *)&v35->_winnerAdvertisement, a22);
    v36 = objc_alloc_init(SCDAFDevice);
    device = v35->_device;
    v35->_device = v36;
  }
  return v35;
}

- (SCDAFParticipation)initWithAdvertisement:(id)a3 boosts:(id)a4 cdaId:(id)a5 rawGoodnessScore:(double)a6 requestStartDate:(id)a7 result:(unint64_t)a8 seenAdvertisements:(id)a9 timeSinceLastTriggerInMilliseconds:(id)a10 timeSinceLastWinInMilliseconds:(id)a11 triggerType:(id)a12 trumpReasons:(id)a13 voiceTriggerDate:(id)a14 winnerAdvertisement:(id)a15
{
  id v37 = a3;
  id v36 = a4;
  id v28 = a5;
  id v35 = a5;
  id v34 = a7;
  id v33 = a9;
  id v32 = a10;
  id v31 = a11;
  id v20 = a12;
  id v21 = a13;
  id v22 = a14;
  id v23 = a15;
  v38.receiver = self;
  v38.super_class = (Class)SCDAFParticipation;
  uint64_t v24 = [(SCDAFParticipation *)&v38 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_advertisement, a3);
    objc_storeStrong((id *)&v25->_boosts, a4);
    objc_storeStrong((id *)&v25->_cdaId, v28);
    v25->_double rawGoodnessScore = a6;
    objc_storeStrong((id *)&v25->_requestStartDate, a7);
    v25->_result = a8;
    objc_storeStrong((id *)&v25->_seenAdvertisements, a9);
    objc_storeStrong((id *)&v25->_timeSinceTriggerInMilliseconds, a10);
    objc_storeStrong((id *)&v25->_timeSinceLastWinInMilliseconds, a11);
    objc_storeStrong((id *)&v25->_triggerType, a12);
    objc_storeStrong((id *)&v25->_trumpReasons, a13);
    objc_storeStrong((id *)&v25->_voiceTriggerDate, a14);
    objc_storeStrong((id *)&v25->_winnerAdvertisement, a15);
  }

  return v25;
}

- (id)initNearMiss
{
  v7.receiver = self;
  v7.super_class = (Class)SCDAFParticipation;
  v2 = [(SCDAFParticipation *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_result = 1;
    id v4 = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
    requestStartDate = v3->_requestStartDate;
    v3->_requestStartDate = v4;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end