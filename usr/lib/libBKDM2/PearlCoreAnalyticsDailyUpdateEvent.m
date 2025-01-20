@interface PearlCoreAnalyticsDailyUpdateEvent
- (BOOL)postEvent;
- (NSDate)yogiErrorDate;
- (NSNumber)enrolledTemplateCountType0NoGlasses;
- (NSNumber)enrolledTemplateCountType0Unknown;
- (NSNumber)enrolledTemplateCountType0WithGlasses;
- (NSNumber)enrolledTemplateCountType1NoGlasses;
- (NSNumber)enrolledTemplateCountType1Unknown;
- (NSNumber)enrolledTemplateCountType1WithGlasses;
- (NSNumber)matchAttemptsFaceDetectedFailedType0;
- (NSNumber)matchAttemptsFaceDetectedFailedType0NoGlasses;
- (NSNumber)matchAttemptsFaceDetectedFailedType0WithGlasses;
- (NSNumber)matchAttemptsFaceDetectedFailedType1;
- (NSNumber)matchAttemptsFaceDetectedFailedType1NoGlasses;
- (NSNumber)matchAttemptsFaceDetectedFailedType1WithGlasses;
- (NSNumber)matchAttemptsFaceDetectedSuccessfulType0;
- (NSNumber)matchAttemptsFaceDetectedSuccessfulType0NoGlasses;
- (NSNumber)matchAttemptsFaceDetectedSuccessfulType0WithGlasses;
- (NSNumber)matchAttemptsFaceDetectedSuccessfulType1;
- (NSNumber)matchAttemptsFaceDetectedSuccessfulType1NoGlasses;
- (NSNumber)matchAttemptsFaceDetectedSuccessfulType1WithGlasses;
- (NSNumber)matchAttemptsFaceDetectedType0;
- (NSNumber)matchAttemptsFaceDetectedType0NoGlasses;
- (NSNumber)matchAttemptsFaceDetectedType0WithGlasses;
- (NSNumber)matchAttemptsFaceDetectedType1;
- (NSNumber)matchAttemptsFaceDetectedType1NoGlasses;
- (NSNumber)matchAttemptsFaceDetectedType1WithGlasses;
- (NSNumber)matchAttemptsFailedType0;
- (NSNumber)matchAttemptsFailedType1;
- (NSNumber)matchAttemptsSuccessfulType0;
- (NSNumber)matchAttemptsSuccessfulType1;
- (NSNumber)matchAttemptsType0;
- (NSNumber)matchAttemptsType1;
- (NSNumber)totalFRR;
- (NSNumber)totalFaceDetectedFRR;
- (NSNumber)totalMatchAttempts;
- (NSNumber)totalMatchAttemptsFaceDetected;
- (NSNumber)totalMatchAttemptsFaceDetectedFailed;
- (NSNumber)totalMatchAttemptsFaceDetectedFailedNoGlasses;
- (NSNumber)totalMatchAttemptsFaceDetectedFailedWithGlasses;
- (NSNumber)totalMatchAttemptsFaceDetectedNoGlasses;
- (NSNumber)totalMatchAttemptsFaceDetectedSuccessful;
- (NSNumber)totalMatchAttemptsFaceDetectedSuccessfulNoGlasses;
- (NSNumber)totalMatchAttemptsFaceDetectedSuccessfulWithGlasses;
- (NSNumber)totalMatchAttemptsFaceDetectedWithGlasses;
- (NSNumber)totalMatchAttemptsFailed;
- (NSNumber)totalMatchAttemptsSuccessful;
- (NSNumber)type0FRR;
- (NSNumber)type0FaceDetectedFRR;
- (NSNumber)type0FaceDetectedNoGlassesFRR;
- (NSNumber)type0FaceDetectedWithGlassesFRR;
- (NSNumber)type1FRR;
- (NSNumber)type1FaceDetectedFRR;
- (NSNumber)type1FaceDetectedNoGlassesFRR;
- (NSNumber)type1FaceDetectedWithGlassesFRR;
- (PearlCoreAnalyticsDailyUpdateEvent)initWithDictionary:(id)a3;
- (PearlCoreAnalyticsDailyUpdateEvent)initWithName:(id)a3 dictionary:(id)a4;
- (PearlCoreAnalyticsDailyUpdateEvent)initWithPersistedData;
- (id)dictionaryRepresentationArchiving:(BOOL)a3;
- (void)calculateDailyValues;
- (void)reset;
- (void)setEnrolledTemplateCountType0NoGlasses:(id)a3;
- (void)setEnrolledTemplateCountType0Unknown:(id)a3;
- (void)setEnrolledTemplateCountType0WithGlasses:(id)a3;
- (void)setEnrolledTemplateCountType1NoGlasses:(id)a3;
- (void)setEnrolledTemplateCountType1Unknown:(id)a3;
- (void)setEnrolledTemplateCountType1WithGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedFailedType0:(id)a3;
- (void)setMatchAttemptsFaceDetectedFailedType0NoGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedFailedType0WithGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedFailedType1:(id)a3;
- (void)setMatchAttemptsFaceDetectedFailedType1NoGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedFailedType1WithGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedSuccessfulType0:(id)a3;
- (void)setMatchAttemptsFaceDetectedSuccessfulType0NoGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedSuccessfulType0WithGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedSuccessfulType1:(id)a3;
- (void)setMatchAttemptsFaceDetectedSuccessfulType1NoGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedSuccessfulType1WithGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedType0:(id)a3;
- (void)setMatchAttemptsFaceDetectedType0NoGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedType0WithGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedType1:(id)a3;
- (void)setMatchAttemptsFaceDetectedType1NoGlasses:(id)a3;
- (void)setMatchAttemptsFaceDetectedType1WithGlasses:(id)a3;
- (void)setMatchAttemptsFailedType0:(id)a3;
- (void)setMatchAttemptsFailedType1:(id)a3;
- (void)setMatchAttemptsSuccessfulType0:(id)a3;
- (void)setMatchAttemptsSuccessfulType1:(id)a3;
- (void)setMatchAttemptsType0:(id)a3;
- (void)setMatchAttemptsType1:(id)a3;
- (void)setTotalFRR:(id)a3;
- (void)setTotalFaceDetectedFRR:(id)a3;
- (void)setTotalMatchAttempts:(id)a3;
- (void)setTotalMatchAttemptsFaceDetected:(id)a3;
- (void)setTotalMatchAttemptsFaceDetectedFailed:(id)a3;
- (void)setTotalMatchAttemptsFaceDetectedFailedNoGlasses:(id)a3;
- (void)setTotalMatchAttemptsFaceDetectedFailedWithGlasses:(id)a3;
- (void)setTotalMatchAttemptsFaceDetectedNoGlasses:(id)a3;
- (void)setTotalMatchAttemptsFaceDetectedSuccessful:(id)a3;
- (void)setTotalMatchAttemptsFaceDetectedSuccessfulNoGlasses:(id)a3;
- (void)setTotalMatchAttemptsFaceDetectedSuccessfulWithGlasses:(id)a3;
- (void)setTotalMatchAttemptsFaceDetectedWithGlasses:(id)a3;
- (void)setTotalMatchAttemptsFailed:(id)a3;
- (void)setTotalMatchAttemptsSuccessful:(id)a3;
- (void)setType0FRR:(id)a3;
- (void)setType0FaceDetectedFRR:(id)a3;
- (void)setType0FaceDetectedNoGlassesFRR:(id)a3;
- (void)setType0FaceDetectedWithGlassesFRR:(id)a3;
- (void)setType1FRR:(id)a3;
- (void)setType1FaceDetectedFRR:(id)a3;
- (void)setType1FaceDetectedNoGlassesFRR:(id)a3;
- (void)setType1FaceDetectedWithGlassesFRR:(id)a3;
- (void)setYogiErrorDate:(id)a3;
- (void)updateDailyMatchValues:(id *)a3;
@end

@implementation PearlCoreAnalyticsDailyUpdateEvent

- (PearlCoreAnalyticsDailyUpdateEvent)initWithName:(id)a3 dictionary:(id)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a4];
  v8 = [v7 objectForKey:@"yogiErrorDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    [v7 removeObjectForKey:@"yogiErrorDate"];
  }
  else
  {
    id v9 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)PearlCoreAnalyticsDailyUpdateEvent;
  v10 = [(BiometricKitCoreAnalyticsEvent *)&v17 initWithName:v6 dictionary:v7];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = (int)*MEMORY[0x263F2AAF0];
    v13 = *(Class *)((char *)&v10->super.super.super.isa + v12);
    *(Class *)((char *)&v10->super.super.super.isa + v12) = (Class)&unk_26D5C1038;

    v14 = objc_alloc_init(AWDBiometricKitDailyUpdate);
    awdMetric = v11->super._awdMetric;
    v11->super._awdMetric = &v14->super;

    objc_storeStrong((id *)&v11->_yogiErrorDate, v9);
  }

  return v11;
}

- (PearlCoreAnalyticsDailyUpdateEvent)initWithPersistedData
{
  v3.receiver = self;
  v3.super_class = (Class)PearlCoreAnalyticsDailyUpdateEvent;
  return [(BiometricKitCoreAnalyticsEvent *)&v3 initWithPersistedDataWithName:@"com.apple.biometrickit.pearl.dailyUpdate"];
}

- (PearlCoreAnalyticsDailyUpdateEvent)initWithDictionary:(id)a3
{
  return [(PearlCoreAnalyticsDailyUpdateEvent *)self initWithName:@"com.apple.biometrickit.pearl.dailyUpdate" dictionary:a3];
}

- (id)dictionaryRepresentationArchiving:(BOOL)a3
{
  BOOL v3 = a3;
  if (__osLog) {
    v5 = __osLog;
  }
  else {
    v5 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222D7E000, v5, OS_LOG_TYPE_DEBUG, "PearlCoreAnalyticsDailyUpdateEvent dictionaryRepresentation\n", buf, 2u);
  }
  [(PearlCoreAnalyticsDailyUpdateEvent *)self calculateDailyValues];
  id v6 = NSDictionary;
  v10.receiver = self;
  v10.super_class = (Class)PearlCoreAnalyticsDailyUpdateEvent;
  v7 = [(BiometricKitCoreAnalyticsEvent *)&v10 dictionaryRepresentationArchiving:v3];
  v8 = [v6 dictionaryWithDictionary:v7];

  return v8;
}

- (void)calculateDailyValues
{
  if (__osLog) {
    BOOL v3 = __osLog;
  }
  else {
    BOOL v3 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_222D7E000, v3, OS_LOG_TYPE_DEBUG, "PearlCoreAnalyticsDailyUpdateEvent calculateDailyValues\n", v24, 2u);
  }
  if ([(NSNumber *)self->_totalMatchAttempts unsignedIntValue])
  {
    [NSNumber numberWithUnsignedInt:1000* -[NSNumber unsignedIntValue](self->_totalMatchAttemptsFailed, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_totalMatchAttempts, "unsignedIntValue")];
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    totalFRR = self->_totalFRR;
    self->_totalFRR = v4;
  }
  if ([(NSNumber *)self->_totalMatchAttemptsFaceDetected unsignedIntValue])
  {
    [NSNumber numberWithUnsignedInt:1000*[self->_totalMatchAttemptsFaceDetectedFailed unsignedIntValue]/[self->_totalMatchAttemptsFaceDetected unsignedIntValue]];
    id v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    totalFaceDetectedFRR = self->_totalFaceDetectedFRR;
    self->_totalFaceDetectedFRR = v6;
  }
  if ([(NSNumber *)self->_matchAttemptsType0 unsignedIntValue])
  {
    [NSNumber numberWithUnsignedInt:1000*[self->_matchAttemptsFailedType0 unsignedIntValue]/[self->_matchAttemptsType0 unsignedIntValue]];
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    type0FRR = self->_type0FRR;
    self->_type0FRR = v8;
  }
  if ([(NSNumber *)self->_matchAttemptsFaceDetectedType0 unsignedIntValue])
  {
    [NSNumber numberWithUnsignedInt:1000* -[NSNumber unsignedIntValue](self->_matchAttemptsFaceDetectedFailedType0, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_matchAttemptsFaceDetectedType0, "unsignedIntValue")];
    objc_super v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    type0FaceDetectedFRR = self->_type0FaceDetectedFRR;
    self->_type0FaceDetectedFRR = v10;
  }
  if ([(NSNumber *)self->_matchAttemptsFaceDetectedType0NoGlasses unsignedIntValue])
  {
    [NSNumber numberWithUnsignedInt:1000*[self->_matchAttemptsFaceDetectedFailedType0NoGlasses unsignedIntValue]/[self->_matchAttemptsFaceDetectedType0NoGlasses unsignedIntValue]];
    uint64_t v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    type0FaceDetectedNoGlassesFRR = self->_type0FaceDetectedNoGlassesFRR;
    self->_type0FaceDetectedNoGlassesFRR = v12;
  }
  if ([(NSNumber *)self->_matchAttemptsFaceDetectedType0WithGlasses unsignedIntValue])
  {
    [NSNumber numberWithUnsignedInt:1000*[self->_matchAttemptsFaceDetectedFailedType0WithGlasses unsignedIntValue]/[self->_matchAttemptsFaceDetectedType0WithGlasses unsignedIntValue]];
    v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    type0FaceDetectedWithGlassesFRR = self->_type0FaceDetectedWithGlassesFRR;
    self->_type0FaceDetectedWithGlassesFRR = v14;
  }
  if ([(NSNumber *)self->_matchAttemptsType1 unsignedIntValue])
  {
    [NSNumber numberWithUnsignedInt:1000*[self->_matchAttemptsFailedType1 unsignedIntValue]/[self->_matchAttemptsType1 unsignedIntValue]];
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    type1FRR = self->_type1FRR;
    self->_type1FRR = v16;
  }
  if ([(NSNumber *)self->_matchAttemptsFaceDetectedType1 unsignedIntValue])
  {
    [NSNumber numberWithUnsignedInt:1000* [self->_matchAttemptsFaceDetectedFailedType1 unsignedIntValue]/ [self->_matchAttemptsFaceDetectedType1 unsignedIntValue]];
    v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    type1FaceDetectedFRR = self->_type1FaceDetectedFRR;
    self->_type1FaceDetectedFRR = v18;
  }
  if ([(NSNumber *)self->_matchAttemptsFaceDetectedType1NoGlasses unsignedIntValue])
  {
    [NSNumber numberWithUnsignedInt:1000* -[NSNumber unsignedIntValue](self->_matchAttemptsFaceDetectedFailedType1NoGlasses, "unsignedIntValue")/ -[NSNumber unsignedIntValue](self->_matchAttemptsFaceDetectedType1NoGlasses, "unsignedIntValue")];
    v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    type1FaceDetectedNoGlassesFRR = self->_type1FaceDetectedNoGlassesFRR;
    self->_type1FaceDetectedNoGlassesFRR = v20;
  }
  if ([(NSNumber *)self->_matchAttemptsFaceDetectedType1WithGlasses unsignedIntValue])
  {
    [NSNumber numberWithUnsignedInt:1000* [self->_matchAttemptsFaceDetectedFailedType1WithGlasses unsignedIntValue]/ [self->_matchAttemptsFaceDetectedType1WithGlasses unsignedIntValue]];
    v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    type1FaceDetectedWithGlassesFRR = self->_type1FaceDetectedWithGlassesFRR;
    self->_type1FaceDetectedWithGlassesFRR = v22;
  }
  [(BiometricKitCoreAnalyticsEvent *)self updateBoundedFieldValue];
}

- (BOOL)postEvent
{
  v5.receiver = self;
  v5.super_class = (Class)PearlCoreAnalyticsDailyUpdateEvent;
  BOOL v3 = [(PearlCoreAnalyticsEvent *)&v5 postEvent];
  [(BiometricKitCoreAnalyticsEvent *)self persistData];
  return v3;
}

- (void)reset
{
  BOOL v3 = self->_yogiErrorDate;
  v44.receiver = self;
  v44.super_class = (Class)PearlCoreAnalyticsDailyUpdateEvent;
  [(PearlCoreAnalyticsEvent *)&v44 reset];
  v4 = objc_alloc_init(AWDBiometricKitDailyUpdate);
  awdMetric = self->super._awdMetric;
  self->super._awdMetric = &v4->super;

  yogiErrorDate = self->_yogiErrorDate;
  self->_yogiErrorDate = v3;
  v7 = v3;

  totalMatchAttempts = self->_totalMatchAttempts;
  self->_totalMatchAttempts = (NSNumber *)&unk_26D5C1278;

  totalMatchAttemptsSuccessful = self->_totalMatchAttemptsSuccessful;
  self->_totalMatchAttemptsSuccessful = (NSNumber *)&unk_26D5C1278;

  totalMatchAttemptsFailed = self->_totalMatchAttemptsFailed;
  self->_totalMatchAttemptsFailed = (NSNumber *)&unk_26D5C1278;

  totalMatchAttemptsFaceDetected = self->_totalMatchAttemptsFaceDetected;
  self->_totalMatchAttemptsFaceDetected = (NSNumber *)&unk_26D5C1278;

  totalMatchAttemptsFaceDetectedSuccessful = self->_totalMatchAttemptsFaceDetectedSuccessful;
  self->_totalMatchAttemptsFaceDetectedSuccessful = (NSNumber *)&unk_26D5C1278;

  totalMatchAttemptsFaceDetectedFailed = self->_totalMatchAttemptsFaceDetectedFailed;
  self->_totalMatchAttemptsFaceDetectedFailed = (NSNumber *)&unk_26D5C1278;

  totalMatchAttemptsFaceDetectedNoGlasses = self->_totalMatchAttemptsFaceDetectedNoGlasses;
  self->_totalMatchAttemptsFaceDetectedNoGlasses = (NSNumber *)&unk_26D5C1278;

  totalMatchAttemptsFaceDetectedSuccessfulNoGlasses = self->_totalMatchAttemptsFaceDetectedSuccessfulNoGlasses;
  self->_totalMatchAttemptsFaceDetectedSuccessfulNoGlasses = (NSNumber *)&unk_26D5C1278;

  totalMatchAttemptsFaceDetectedFailedNoGlasses = self->_totalMatchAttemptsFaceDetectedFailedNoGlasses;
  self->_totalMatchAttemptsFaceDetectedFailedNoGlasses = (NSNumber *)&unk_26D5C1278;

  totalMatchAttemptsFaceDetectedWithGlasses = self->_totalMatchAttemptsFaceDetectedWithGlasses;
  self->_totalMatchAttemptsFaceDetectedWithGlasses = (NSNumber *)&unk_26D5C1278;

  totalMatchAttemptsFaceDetectedSuccessfulWithGlasses = self->_totalMatchAttemptsFaceDetectedSuccessfulWithGlasses;
  self->_totalMatchAttemptsFaceDetectedSuccessfulWithGlasses = (NSNumber *)&unk_26D5C1278;

  totalMatchAttemptsFaceDetectedFailedWithGlasses = self->_totalMatchAttemptsFaceDetectedFailedWithGlasses;
  self->_totalMatchAttemptsFaceDetectedFailedWithGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsType0 = self->_matchAttemptsType0;
  self->_matchAttemptsType0 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsSuccessfulType0 = self->_matchAttemptsSuccessfulType0;
  self->_matchAttemptsSuccessfulType0 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFailedType0 = self->_matchAttemptsFailedType0;
  self->_matchAttemptsFailedType0 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedType0 = self->_matchAttemptsFaceDetectedType0;
  self->_matchAttemptsFaceDetectedType0 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedSuccessfulType0 = self->_matchAttemptsFaceDetectedSuccessfulType0;
  self->_matchAttemptsFaceDetectedSuccessfulType0 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedFailedType0 = self->_matchAttemptsFaceDetectedFailedType0;
  self->_matchAttemptsFaceDetectedFailedType0 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedType0NoGlasses = self->_matchAttemptsFaceDetectedType0NoGlasses;
  self->_matchAttemptsFaceDetectedType0NoGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedSuccessfulType0NoGlasses = self->_matchAttemptsFaceDetectedSuccessfulType0NoGlasses;
  self->_matchAttemptsFaceDetectedSuccessfulType0NoGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedFailedType0NoGlasses = self->_matchAttemptsFaceDetectedFailedType0NoGlasses;
  self->_matchAttemptsFaceDetectedFailedType0NoGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedType0WithGlasses = self->_matchAttemptsFaceDetectedType0WithGlasses;
  self->_matchAttemptsFaceDetectedType0WithGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedSuccessfulType0WithGlasses = self->_matchAttemptsFaceDetectedSuccessfulType0WithGlasses;
  self->_matchAttemptsFaceDetectedSuccessfulType0WithGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedFailedType0WithGlasses = self->_matchAttemptsFaceDetectedFailedType0WithGlasses;
  self->_matchAttemptsFaceDetectedFailedType0WithGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsType1 = self->_matchAttemptsType1;
  self->_matchAttemptsType1 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsSuccessfulType1 = self->_matchAttemptsSuccessfulType1;
  self->_matchAttemptsSuccessfulType1 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFailedType1 = self->_matchAttemptsFailedType1;
  self->_matchAttemptsFailedType1 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedType1 = self->_matchAttemptsFaceDetectedType1;
  self->_matchAttemptsFaceDetectedType1 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedSuccessfulType1 = self->_matchAttemptsFaceDetectedSuccessfulType1;
  self->_matchAttemptsFaceDetectedSuccessfulType1 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedFailedType1 = self->_matchAttemptsFaceDetectedFailedType1;
  self->_matchAttemptsFaceDetectedFailedType1 = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedType1NoGlasses = self->_matchAttemptsFaceDetectedType1NoGlasses;
  self->_matchAttemptsFaceDetectedType1NoGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedSuccessfulType1NoGlasses = self->_matchAttemptsFaceDetectedSuccessfulType1NoGlasses;
  self->_matchAttemptsFaceDetectedSuccessfulType1NoGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedFailedType1NoGlasses = self->_matchAttemptsFaceDetectedFailedType1NoGlasses;
  self->_matchAttemptsFaceDetectedFailedType1NoGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedType1WithGlasses = self->_matchAttemptsFaceDetectedType1WithGlasses;
  self->_matchAttemptsFaceDetectedType1WithGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedSuccessfulType1WithGlasses = self->_matchAttemptsFaceDetectedSuccessfulType1WithGlasses;
  self->_matchAttemptsFaceDetectedSuccessfulType1WithGlasses = (NSNumber *)&unk_26D5C1278;

  matchAttemptsFaceDetectedFailedType1WithGlasses = self->_matchAttemptsFaceDetectedFailedType1WithGlasses;
  self->_matchAttemptsFaceDetectedFailedType1WithGlasses = (NSNumber *)&unk_26D5C1278;
}

- (void)updateDailyMatchValues:(id *)a3
{
  [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_totalMatchAttempts, "unsignedIntValue") + 1];
  objc_super v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  totalMatchAttempts = self->_totalMatchAttempts;
  self->_totalMatchAttempts = v5;

  if (BYTE5(a3->var2))
  {
    [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_totalMatchAttemptsSuccessful, "unsignedIntValue") + 1];
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    totalMatchAttemptsSuccessful = self->_totalMatchAttemptsSuccessful;
    self->_totalMatchAttemptsSuccessful = v7;

    if (a3->var39.var10)
    {
      [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_matchAttemptsType1, "unsignedIntValue") + 1];
      id v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      matchAttemptsType1 = self->_matchAttemptsType1;
      self->_matchAttemptsType1 = v9;

      [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_matchAttemptsSuccessfulType1, "unsignedIntValue") + 1];
      v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      matchAttemptsSuccessfulType1 = self->_matchAttemptsSuccessfulType1;
      self->_matchAttemptsSuccessfulType1 = v11;

      if (!*(&a3->var9 + 1))
      {
        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_totalMatchAttemptsFaceDetected, "unsignedIntValue") + 1];
        v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        totalMatchAttemptsFaceDetected = self->_totalMatchAttemptsFaceDetected;
        self->_totalMatchAttemptsFaceDetected = v13;

        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_totalMatchAttemptsFaceDetectedSuccessful, "unsignedIntValue") + 1];
        v15 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        totalMatchAttemptsFaceDetectedSuccessful = self->_totalMatchAttemptsFaceDetectedSuccessful;
        self->_totalMatchAttemptsFaceDetectedSuccessful = v15;

        [NSNumber numberWithUnsignedInt:([self->_matchAttemptsFaceDetectedType1 unsignedIntValue] + 1)];
        objc_super v17 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        matchAttemptsFaceDetectedType1 = self->_matchAttemptsFaceDetectedType1;
        self->_matchAttemptsFaceDetectedType1 = v17;

        [NSNumber numberWithUnsignedInt:(-[NSNumber unsignedIntValue](self->_matchAttemptsFaceDetectedSuccessfulType1, "unsignedIntValue") + 1)];
        v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        matchAttemptsFaceDetectedSuccessfulType1 = self->_matchAttemptsFaceDetectedSuccessfulType1;
        self->_matchAttemptsFaceDetectedSuccessfulType1 = v19;

        v21 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedWithGlasses;
        BOOL var11 = a3->var39.var11;
        v23 = NSNumber;
        BOOL v24 = !var11;
        if (var11)
        {
          v25 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedSuccessfulWithGlasses;
        }
        else
        {
          v21 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedNoGlasses;
          v25 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedSuccessfulNoGlasses;
        }
        if (var11) {
          v26 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedType1WithGlasses;
        }
        else {
          v26 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedType1NoGlasses;
        }
        v27 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedSuccessfulType1WithGlasses;
        v28 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedSuccessfulType1NoGlasses;
LABEL_36:
        if (v24) {
          v70 = v28;
        }
        else {
          v70 = v27;
        }
        uint64_t v71 = *v21;
        [v23 numberWithUnsignedInt:([*(id *)((char *)&self->super.super.super.isa + v71) unsignedIntValue] + 1)];
        v72 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v73 = *(Class *)((char *)&self->super.super.super.isa + v71);
        *(Class *)((char *)&self->super.super.super.isa + v71) = v72;

        uint64_t v74 = *v25;
        [NSNumber numberWithUnsignedInt:[*(id *)((char *)&self->super.super.super.isa + v74) unsignedIntValue] + 1];
        v75 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v76 = *(Class *)((char *)&self->super.super.super.isa + v74);
        *(Class *)((char *)&self->super.super.super.isa + v74) = v75;

        uint64_t v77 = *v26;
        [NSNumber numberWithUnsignedInt:[*(id *)((char *)&self->super.super.super.isa + v77) unsignedIntValue] + 1];
        v78 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v79 = *(Class *)((char *)&self->super.super.super.isa + v77);
        *(Class *)((char *)&self->super.super.super.isa + v77) = v78;

        uint64_t v80 = *v70;
        [NSNumber numberWithUnsignedInt:([*(id *)((char *)&self->super.super.super.isa + v80) unsignedIntValue] + 1)];
        v81 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v82 = *(Class *)((char *)&self->super.super.super.isa + v80);
        *(Class *)((char *)&self->super.super.super.isa + v80) = v81;
      }
    }
    else
    {
      [NSNumber numberWithUnsignedInt:(-[NSNumber unsignedIntValue](self->_matchAttemptsType0, "unsignedIntValue") + 1)];
      objc_super v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      matchAttemptsType0 = self->_matchAttemptsType0;
      self->_matchAttemptsType0 = v44;

      [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_matchAttemptsSuccessfulType0, "unsignedIntValue") + 1];
      v46 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      matchAttemptsSuccessfulType0 = self->_matchAttemptsSuccessfulType0;
      self->_matchAttemptsSuccessfulType0 = v46;

      if (!*(&a3->var9 + 1))
      {
        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_totalMatchAttemptsFaceDetected, "unsignedIntValue") + 1];
        v48 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v49 = self->_totalMatchAttemptsFaceDetected;
        self->_totalMatchAttemptsFaceDetected = v48;

        [NSNumber numberWithUnsignedInt: -[NSNumber unsignedIntValue](self->_totalMatchAttemptsFaceDetectedSuccessful, "unsignedIntValue") + 1];
        v50 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v51 = self->_totalMatchAttemptsFaceDetectedSuccessful;
        self->_totalMatchAttemptsFaceDetectedSuccessful = v50;

        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_matchAttemptsFaceDetectedType0, "unsignedIntValue") + 1];
        v52 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        matchAttemptsFaceDetectedType0 = self->_matchAttemptsFaceDetectedType0;
        self->_matchAttemptsFaceDetectedType0 = v52;

        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_matchAttemptsFaceDetectedSuccessfulType0, "unsignedIntValue") + 1];
        v54 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        matchAttemptsFaceDetectedSuccessfulType0 = self->_matchAttemptsFaceDetectedSuccessfulType0;
        self->_matchAttemptsFaceDetectedSuccessfulType0 = v54;

        v21 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedWithGlasses;
        BOOL v56 = a3->var39.var11;
        v23 = NSNumber;
        BOOL v24 = !v56;
        if (v56)
        {
          v25 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedSuccessfulWithGlasses;
        }
        else
        {
          v21 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedNoGlasses;
          v25 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedSuccessfulNoGlasses;
        }
        if (v56) {
          v26 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedType0WithGlasses;
        }
        else {
          v26 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedType0NoGlasses;
        }
        v27 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedSuccessfulType0WithGlasses;
        v28 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedSuccessfulType0NoGlasses;
        goto LABEL_36;
      }
    }
  }
  else
  {
    [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_totalMatchAttemptsFailed, "unsignedIntValue") + 1];
    v29 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    totalMatchAttemptsFailed = self->_totalMatchAttemptsFailed;
    self->_totalMatchAttemptsFailed = v29;

    if (a3->var39.var10)
    {
      [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_matchAttemptsType1, "unsignedIntValue") + 1];
      v31 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v32 = self->_matchAttemptsType1;
      self->_matchAttemptsType1 = v31;

      [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_matchAttemptsFailedType1, "unsignedIntValue") + 1];
      v33 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      matchAttemptsFailedType1 = self->_matchAttemptsFailedType1;
      self->_matchAttemptsFailedType1 = v33;

      if (!*(&a3->var9 + 1))
      {
        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_totalMatchAttemptsFaceDetected, "unsignedIntValue") + 1];
        v35 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v36 = self->_totalMatchAttemptsFaceDetected;
        self->_totalMatchAttemptsFaceDetected = v35;

        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_totalMatchAttemptsFaceDetectedFailed, "unsignedIntValue") + 1];
        v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        totalMatchAttemptsFaceDetectedFailed = self->_totalMatchAttemptsFaceDetectedFailed;
        self->_totalMatchAttemptsFaceDetectedFailed = v37;

        [NSNumber numberWithUnsignedInt:(-[NSNumber unsignedIntValue](self->_matchAttemptsFaceDetectedType1, "unsignedIntValue") + 1)];
        v39 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v40 = self->_matchAttemptsFaceDetectedType1;
        self->_matchAttemptsFaceDetectedType1 = v39;

        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_matchAttemptsFaceDetectedFailedType1, "unsignedIntValue") + 1];
        v41 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        matchAttemptsFaceDetectedFailedType1 = self->_matchAttemptsFaceDetectedFailedType1;
        self->_matchAttemptsFaceDetectedFailedType1 = v41;

        v21 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedWithGlasses;
        BOOL v43 = a3->var39.var11;
        v23 = NSNumber;
        BOOL v24 = !v43;
        if (v43)
        {
          v25 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedFailedWithGlasses;
        }
        else
        {
          v21 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedNoGlasses;
          v25 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedFailedNoGlasses;
        }
        if (v43) {
          v26 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedType1WithGlasses;
        }
        else {
          v26 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedType1NoGlasses;
        }
        v27 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedFailedType1WithGlasses;
        v28 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedFailedType1NoGlasses;
        goto LABEL_36;
      }
    }
    else
    {
      [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_matchAttemptsType0, "unsignedIntValue") + 1];
      v57 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v58 = self->_matchAttemptsType0;
      self->_matchAttemptsType0 = v57;

      [NSNumber numberWithUnsignedInt:([self->_matchAttemptsFailedType0 unsignedIntValue] + 1)];
      v59 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      matchAttemptsFailedType0 = self->_matchAttemptsFailedType0;
      self->_matchAttemptsFailedType0 = v59;

      if (!*(&a3->var9 + 1))
      {
        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_totalMatchAttemptsFaceDetected, "unsignedIntValue") + 1];
        v61 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v62 = self->_totalMatchAttemptsFaceDetected;
        self->_totalMatchAttemptsFaceDetected = v61;

        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_totalMatchAttemptsFaceDetectedFailed, "unsignedIntValue") + 1];
        v63 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v64 = self->_totalMatchAttemptsFaceDetectedFailed;
        self->_totalMatchAttemptsFaceDetectedFailed = v63;

        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_matchAttemptsFaceDetectedType0, "unsignedIntValue") + 1];
        v65 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v66 = self->_matchAttemptsFaceDetectedType0;
        self->_matchAttemptsFaceDetectedType0 = v65;

        [NSNumber numberWithUnsignedInt:-[NSNumber unsignedIntValue](self->_matchAttemptsFaceDetectedFailedType0, "unsignedIntValue") + 1];
        v67 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        matchAttemptsFaceDetectedFailedType0 = self->_matchAttemptsFaceDetectedFailedType0;
        self->_matchAttemptsFaceDetectedFailedType0 = v67;

        v21 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedWithGlasses;
        BOOL v69 = a3->var39.var11;
        v23 = NSNumber;
        BOOL v24 = !v69;
        if (v69)
        {
          v25 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedFailedWithGlasses;
        }
        else
        {
          v21 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedNoGlasses;
          v25 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__totalMatchAttemptsFaceDetectedFailedNoGlasses;
        }
        if (v69) {
          v26 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedType0WithGlasses;
        }
        else {
          v26 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedType0NoGlasses;
        }
        v27 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedFailedType0WithGlasses;
        v28 = &OBJC_IVAR___PearlCoreAnalyticsDailyUpdateEvent__matchAttemptsFaceDetectedFailedType0NoGlasses;
        goto LABEL_36;
      }
    }
  }

  [(BiometricKitCoreAnalyticsEvent *)self persistData];
}

- (NSDate)yogiErrorDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setYogiErrorDate:(id)a3
{
}

- (NSNumber)totalMatchAttempts
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTotalMatchAttempts:(id)a3
{
}

- (NSNumber)totalMatchAttemptsSuccessful
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTotalMatchAttemptsSuccessful:(id)a3
{
}

- (NSNumber)totalMatchAttemptsFailed
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTotalMatchAttemptsFailed:(id)a3
{
}

- (NSNumber)totalMatchAttemptsFaceDetected
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTotalMatchAttemptsFaceDetected:(id)a3
{
}

- (NSNumber)totalMatchAttemptsFaceDetectedSuccessful
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTotalMatchAttemptsFaceDetectedSuccessful:(id)a3
{
}

- (NSNumber)totalMatchAttemptsFaceDetectedFailed
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setTotalMatchAttemptsFaceDetectedFailed:(id)a3
{
}

- (NSNumber)totalMatchAttemptsFaceDetectedNoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setTotalMatchAttemptsFaceDetectedNoGlasses:(id)a3
{
}

- (NSNumber)totalMatchAttemptsFaceDetectedSuccessfulNoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setTotalMatchAttemptsFaceDetectedSuccessfulNoGlasses:(id)a3
{
}

- (NSNumber)totalMatchAttemptsFaceDetectedFailedNoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setTotalMatchAttemptsFaceDetectedFailedNoGlasses:(id)a3
{
}

- (NSNumber)totalMatchAttemptsFaceDetectedWithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setTotalMatchAttemptsFaceDetectedWithGlasses:(id)a3
{
}

- (NSNumber)totalMatchAttemptsFaceDetectedSuccessfulWithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setTotalMatchAttemptsFaceDetectedSuccessfulWithGlasses:(id)a3
{
}

- (NSNumber)totalMatchAttemptsFaceDetectedFailedWithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setTotalMatchAttemptsFaceDetectedFailedWithGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsType0
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setMatchAttemptsType0:(id)a3
{
}

- (NSNumber)matchAttemptsSuccessfulType0
{
  return (NSNumber *)objc_getProperty(self, a2, 248, 1);
}

- (void)setMatchAttemptsSuccessfulType0:(id)a3
{
}

- (NSNumber)matchAttemptsFailedType0
{
  return (NSNumber *)objc_getProperty(self, a2, 256, 1);
}

- (void)setMatchAttemptsFailedType0:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedType0
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setMatchAttemptsFaceDetectedType0:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedSuccessfulType0
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setMatchAttemptsFaceDetectedSuccessfulType0:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedFailedType0
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setMatchAttemptsFaceDetectedFailedType0:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedType0NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setMatchAttemptsFaceDetectedType0NoGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedSuccessfulType0NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 296, 1);
}

- (void)setMatchAttemptsFaceDetectedSuccessfulType0NoGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedFailedType0NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 304, 1);
}

- (void)setMatchAttemptsFaceDetectedFailedType0NoGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedType0WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setMatchAttemptsFaceDetectedType0WithGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedSuccessfulType0WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setMatchAttemptsFaceDetectedSuccessfulType0WithGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedFailedType0WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setMatchAttemptsFaceDetectedFailedType0WithGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsType1
{
  return (NSNumber *)objc_getProperty(self, a2, 336, 1);
}

- (void)setMatchAttemptsType1:(id)a3
{
}

- (NSNumber)matchAttemptsSuccessfulType1
{
  return (NSNumber *)objc_getProperty(self, a2, 344, 1);
}

- (void)setMatchAttemptsSuccessfulType1:(id)a3
{
}

- (NSNumber)matchAttemptsFailedType1
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setMatchAttemptsFailedType1:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedType1
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setMatchAttemptsFaceDetectedType1:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedSuccessfulType1
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setMatchAttemptsFaceDetectedSuccessfulType1:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedFailedType1
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setMatchAttemptsFaceDetectedFailedType1:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedType1NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setMatchAttemptsFaceDetectedType1NoGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedSuccessfulType1NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setMatchAttemptsFaceDetectedSuccessfulType1NoGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedFailedType1NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setMatchAttemptsFaceDetectedFailedType1NoGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedType1WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setMatchAttemptsFaceDetectedType1WithGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedSuccessfulType1WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 416, 1);
}

- (void)setMatchAttemptsFaceDetectedSuccessfulType1WithGlasses:(id)a3
{
}

- (NSNumber)matchAttemptsFaceDetectedFailedType1WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setMatchAttemptsFaceDetectedFailedType1WithGlasses:(id)a3
{
}

- (NSNumber)totalFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 432, 1);
}

- (void)setTotalFRR:(id)a3
{
}

- (NSNumber)totalFaceDetectedFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setTotalFaceDetectedFRR:(id)a3
{
}

- (NSNumber)type0FRR
{
  return (NSNumber *)objc_getProperty(self, a2, 448, 1);
}

- (void)setType0FRR:(id)a3
{
}

- (NSNumber)type0FaceDetectedFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 456, 1);
}

- (void)setType0FaceDetectedFRR:(id)a3
{
}

- (NSNumber)type0FaceDetectedNoGlassesFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 464, 1);
}

- (void)setType0FaceDetectedNoGlassesFRR:(id)a3
{
}

- (NSNumber)type0FaceDetectedWithGlassesFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 472, 1);
}

- (void)setType0FaceDetectedWithGlassesFRR:(id)a3
{
}

- (NSNumber)type1FRR
{
  return (NSNumber *)objc_getProperty(self, a2, 480, 1);
}

- (void)setType1FRR:(id)a3
{
}

- (NSNumber)type1FaceDetectedFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 488, 1);
}

- (void)setType1FaceDetectedFRR:(id)a3
{
}

- (NSNumber)type1FaceDetectedNoGlassesFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 496, 1);
}

- (void)setType1FaceDetectedNoGlassesFRR:(id)a3
{
}

- (NSNumber)type1FaceDetectedWithGlassesFRR
{
  return (NSNumber *)objc_getProperty(self, a2, 504, 1);
}

- (void)setType1FaceDetectedWithGlassesFRR:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType0NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 512, 1);
}

- (void)setEnrolledTemplateCountType0NoGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType0WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 520, 1);
}

- (void)setEnrolledTemplateCountType0WithGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType0Unknown
{
  return (NSNumber *)objc_getProperty(self, a2, 528, 1);
}

- (void)setEnrolledTemplateCountType0Unknown:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType1NoGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 536, 1);
}

- (void)setEnrolledTemplateCountType1NoGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType1WithGlasses
{
  return (NSNumber *)objc_getProperty(self, a2, 544, 1);
}

- (void)setEnrolledTemplateCountType1WithGlasses:(id)a3
{
}

- (NSNumber)enrolledTemplateCountType1Unknown
{
  return (NSNumber *)objc_getProperty(self, a2, 552, 1);
}

- (void)setEnrolledTemplateCountType1Unknown:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrolledTemplateCountType1Unknown, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType1WithGlasses, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType1NoGlasses, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType0Unknown, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType0WithGlasses, 0);
  objc_storeStrong((id *)&self->_enrolledTemplateCountType0NoGlasses, 0);
  objc_storeStrong((id *)&self->_type1FaceDetectedWithGlassesFRR, 0);
  objc_storeStrong((id *)&self->_type1FaceDetectedNoGlassesFRR, 0);
  objc_storeStrong((id *)&self->_type1FaceDetectedFRR, 0);
  objc_storeStrong((id *)&self->_type1FRR, 0);
  objc_storeStrong((id *)&self->_type0FaceDetectedWithGlassesFRR, 0);
  objc_storeStrong((id *)&self->_type0FaceDetectedNoGlassesFRR, 0);
  objc_storeStrong((id *)&self->_type0FaceDetectedFRR, 0);
  objc_storeStrong((id *)&self->_type0FRR, 0);
  objc_storeStrong((id *)&self->_totalFaceDetectedFRR, 0);
  objc_storeStrong((id *)&self->_totalFRR, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedFailedType1WithGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedSuccessfulType1WithGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedType1WithGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedFailedType1NoGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedSuccessfulType1NoGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedType1NoGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedFailedType1, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedSuccessfulType1, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedType1, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFailedType1, 0);
  objc_storeStrong((id *)&self->_matchAttemptsSuccessfulType1, 0);
  objc_storeStrong((id *)&self->_matchAttemptsType1, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedFailedType0WithGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedSuccessfulType0WithGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedType0WithGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedFailedType0NoGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedSuccessfulType0NoGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedType0NoGlasses, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedFailedType0, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedSuccessfulType0, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFaceDetectedType0, 0);
  objc_storeStrong((id *)&self->_matchAttemptsFailedType0, 0);
  objc_storeStrong((id *)&self->_matchAttemptsSuccessfulType0, 0);
  objc_storeStrong((id *)&self->_matchAttemptsType0, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFaceDetectedFailedWithGlasses, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFaceDetectedSuccessfulWithGlasses, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFaceDetectedWithGlasses, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFaceDetectedFailedNoGlasses, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFaceDetectedSuccessfulNoGlasses, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFaceDetectedNoGlasses, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFaceDetectedFailed, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFaceDetectedSuccessful, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFaceDetected, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsFailed, 0);
  objc_storeStrong((id *)&self->_totalMatchAttemptsSuccessful, 0);
  objc_storeStrong((id *)&self->_totalMatchAttempts, 0);

  objc_storeStrong((id *)&self->_yogiErrorDate, 0);
}

@end