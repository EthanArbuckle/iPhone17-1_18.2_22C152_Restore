@interface SCDAArbitrationParticipationContext
+ (id)_convertBoosts:(id)a3;
+ (id)_convertLastActivationTime:(double)a3;
+ (id)_convertTrumpReason:(id)a3;
+ (unint64_t)_convertTriggerType:(int)a3;
- (NSArray)boosts;
- (NSArray)seenAdvertisements;
- (NSArray)trumpReasons;
- (NSDate)requestStartDate;
- (NSDate)voiceTriggerDate;
- (NSNumber)msSinceLastWin;
- (NSNumber)msSinceTrigger;
- (NSString)cdaId;
- (SCDAFAdvertisement)myAdvertisement;
- (SCDAFAdvertisement)winnerAdvertisement;
- (id)initAdvertisements:(id)a3 decision:(BOOL)a4 requestStartDate:(id)a5 session:(id)a6 voiceTriggerTime:(double)a7 winnerAdvertisement:(id)a8;
- (unint64_t)result;
- (unint64_t)triggerType;
- (unsigned)rawGoodnessScore;
- (void)_processAdvertisements:(id)a3 winnerAdvertisement:(id)a4;
- (void)updateBoosts:(id)a3 triggerType:(int)a4 lastWin:(unint64_t)a5 lastDecision:(unint64_t)a6;
@end

@implementation SCDAArbitrationParticipationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_winnerAdvertisement, 0);
  objc_storeStrong((id *)&self->_myAdvertisement, 0);
  objc_storeStrong((id *)&self->_boosts, 0);
  objc_storeStrong((id *)&self->_seenAdvertisements, 0);
  objc_storeStrong((id *)&self->_cdaId, 0);
  objc_storeStrong((id *)&self->_voiceTriggerDate, 0);
  objc_storeStrong((id *)&self->_requestStartDate, 0);
  objc_storeStrong((id *)&self->_trumpReasons, 0);
  objc_storeStrong((id *)&self->_msSinceTrigger, 0);
  objc_storeStrong((id *)&self->_msSinceLastWin, 0);
}

- (SCDAFAdvertisement)winnerAdvertisement
{
  return self->_winnerAdvertisement;
}

- (SCDAFAdvertisement)myAdvertisement
{
  return self->_myAdvertisement;
}

- (NSArray)boosts
{
  return self->_boosts;
}

- (NSArray)seenAdvertisements
{
  return self->_seenAdvertisements;
}

- (NSString)cdaId
{
  return self->_cdaId;
}

- (NSDate)voiceTriggerDate
{
  return self->_voiceTriggerDate;
}

- (NSDate)requestStartDate
{
  return self->_requestStartDate;
}

- (unsigned)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (NSArray)trumpReasons
{
  return self->_trumpReasons;
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (unint64_t)result
{
  return self->_result;
}

- (NSNumber)msSinceTrigger
{
  return self->_msSinceTrigger;
}

- (NSNumber)msSinceLastWin
{
  return self->_msSinceLastWin;
}

- (void)updateBoosts:(id)a3 triggerType:(int)a4 lastWin:(unint64_t)a5 lastDecision:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a4;
  id v22 = a3;
  if (a5)
  {
    v10 = NSNumber;
    uint64_t v11 = mach_absolute_time();
    v12 = [v10 numberWithUnsignedLongLong:SCDAMachAbsoluteTimeGetMilliseconds(v11 - a5)];
    msSinceLastWin = self->_msSinceLastWin;
    self->_msSinceLastWin = v12;
  }
  if (a6)
  {
    v14 = NSNumber;
    uint64_t v15 = mach_absolute_time();
    v16 = [v14 numberWithUnsignedLongLong:SCDAMachAbsoluteTimeGetMilliseconds(v15 - a6)];
    msSinceTrigger = self->_msSinceTrigger;
    self->_msSinceTrigger = v16;
  }
  self->_triggerType = +[SCDAArbitrationParticipationContext _convertTriggerType:v8];
  v18 = +[SCDAArbitrationParticipationContext _convertBoosts:v22];
  boosts = self->_boosts;
  self->_boosts = v18;

  v20 = +[SCDAArbitrationParticipationContext _convertTrumpReason:v22];
  trumpReasons = self->_trumpReasons;
  self->_trumpReasons = v20;
}

- (void)_processAdvertisements:(id)a3 winnerAdvertisement:(id)a4
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x263EFF980];
  id v8 = a3;
  v9 = objc_msgSend([v7 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __82__SCDAArbitrationParticipationContext__processAdvertisements_winnerAdvertisement___block_invoke;
  v14[3] = &unk_2654B7A90;
  v14[4] = self;
  id v15 = v6;
  v10 = v9;
  v16 = v10;
  id v11 = v6;
  [v8 enumerateObjectsUsingBlock:v14];

  seenAdvertisements = self->_seenAdvertisements;
  self->_seenAdvertisements = v10;
  v13 = v10;
}

void __82__SCDAArbitrationParticipationContext__processAdvertisements_winnerAdvertisement___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = objc_alloc_init(MEMORY[0x263F6CF88]);
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v11, "pHash"));
  [v3 setAdvertHash:v4];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v11, "userConfidence"));
  objc_msgSend(v3, "setConfidence:", objc_msgSend(v5, "integerValue"));

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v11, "deviceClass"));
  objc_msgSend(v3, "setDeviceClass:", objc_msgSend(v6, "integerValue"));

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v11, "deviceGroup"));
  objc_msgSend(v3, "setDeviceGroup:", objc_msgSend(v7, "integerValue"));

  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v11, "goodness"));
  objc_msgSend(v3, "setGoodnessScore:", objc_msgSend(v8, "integerValue"));

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v11, "productType"));
  objc_msgSend(v3, "setProductType:", objc_msgSend(v9, "integerValue"));

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v11, "tieBreaker"));
  objc_msgSend(v3, "setTieBreaker:", objc_msgSend(v10, "integerValue"));

  if ([v11 isMe])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = [v11 rawAudioGoodnessScore];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), v3);
  }
  if (*(id *)(a1 + 40) == v11) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), v3);
  }
  [*(id *)(a1 + 48) addObject:v3];
}

- (id)initAdvertisements:(id)a3 decision:(BOOL)a4 requestStartDate:(id)a5 session:(id)a6 voiceTriggerTime:(double)a7 winnerAdvertisement:(id)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SCDAArbitrationParticipationContext;
  v18 = [(SCDAArbitrationParticipationContext *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cdaId, a6);
    objc_storeStrong((id *)&v19->_requestStartDate, a5);
    uint64_t v20 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:a7];
    voiceTriggerDate = v19->_voiceTriggerDate;
    v19->_voiceTriggerDate = (NSDate *)v20;

    uint64_t v22 = 2;
    if (v12) {
      uint64_t v22 = 3;
    }
    v19->_result = v22;
    [(SCDAArbitrationParticipationContext *)v19 _processAdvertisements:v14 winnerAdvertisement:v17];
  }

  return v19;
}

+ (id)_convertBoosts:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  if ([v3 deviceBoost])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F6CF90]);
    [v5 setKind:0];
    [v5 setType:0];
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "deviceBoost"));
    [v6 floatValue];
    [v5 setBoostValue:v7];

    [v4 addObject:v5];
  }
  if ([v3 recentAlarmBoost])
  {
    id v8 = objc_alloc_init(MEMORY[0x263F6CF90]);
    [v8 setKind:6];
    [v8 setType:0];
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "recentAlarmBoost"));
    [v9 floatValue];
    [v8 setBoostValue:v10];

    [v4 addObject:v8];
  }
  if ([v3 recentMotionBoost])
  {
    id v11 = objc_alloc_init(MEMORY[0x263F6CF90]);
    [v11 setKind:4];
    [v11 setType:0];
    BOOL v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "recentMotionBoost"));
    [v12 floatValue];
    [v11 setBoostValue:v13];

    [v4 addObject:v11];
  }
  if ([v3 recentUnlockBoost])
  {
    id v14 = objc_alloc_init(MEMORY[0x263F6CF90]);
    [v14 setKind:1];
    [v14 setType:0];
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "recentUnlockBoost"));
    [v15 floatValue];
    [v14 setBoostValue:v16];

    [v4 addObject:v14];
  }
  if ([v3 recentPlaybackBoost])
  {
    id v17 = objc_alloc_init(MEMORY[0x263F6CF90]);
    [v17 setKind:5];
    [v17 setType:0];
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "recentPlaybackBoost"));
    [v18 floatValue];
    [v17 setBoostValue:v19];

    [v4 addObject:v17];
  }
  if ([v3 recentSiriRequestBoost])
  {
    id v20 = objc_alloc_init(MEMORY[0x263F6CF90]);
    [v20 setKind:3];
    [v20 setType:0];
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "recentSiriRequestBoost"));
    [v21 floatValue];
    [v20 setBoostValue:v22];

    [v4 addObject:v20];
  }
  if ([v3 recentRaiseToWakeBoost])
  {
    id v23 = objc_alloc_init(MEMORY[0x263F6CF90]);
    [v23 setKind:2];
    [v23 setType:0];
    objc_super v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v3, "recentRaiseToWakeBoost"));
    [v24 floatValue];
    [v23 setBoostValue:v25];

    [v4 addObject:v23];
  }

  return v4;
}

+ (id)_convertTrumpReason:(id)a3
{
  id v3 = a3;
  if ([v3 isTrump] && (unsigned int v4 = objc_msgSend(v3, "trumpReason"), v4 <= 8)) {
    id v5 = *(&off_2654B7AB0 + v4);
  }
  else {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

+ (id)_convertLastActivationTime:(double)a3
{
  unsigned int v4 = [MEMORY[0x263F08AB0] processInfo];
  [v4 systemUptime];
  double v6 = v5;

  float v7 = NSNumber;
  return (id)[v7 numberWithDouble:(v6 - a3) * 1000.0];
}

+ (unint64_t)_convertTriggerType:(int)a3
{
  if ((a3 - 1) > 7) {
    return 0;
  }
  else {
    return qword_25C73C6B8[a3 - 1];
  }
}

@end