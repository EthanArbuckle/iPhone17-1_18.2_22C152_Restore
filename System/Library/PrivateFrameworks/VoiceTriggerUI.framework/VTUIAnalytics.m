@interface VTUIAnalytics
- (NSString)languageCode;
- (NSString)setupMode;
- (int)aboutViewShown;
- (int)asrError;
- (int)introViewShown;
- (int)skippedFromIntroAOP;
- (int)skippedFromIntroNonAOP;
- (int)turnOnSiriNonAOP;
- (int)voiceTrainingCancelled;
- (int)voiceTrainingCancelledStep;
- (int)voiceTrainingCompleted;
- (int)voiceTrainingStarted;
- (int)vtError;
- (void)logEvent;
- (void)setAboutViewShown:(int)a3;
- (void)setAsrError:(int)a3;
- (void)setIntroViewShown:(int)a3;
- (void)setLanguageCode:(id)a3;
- (void)setSetupMode:(id)a3;
- (void)setSkippedFromIntroAOP:(int)a3;
- (void)setSkippedFromIntroNonAOP:(int)a3;
- (void)setTurnOnSiriNonAOP:(int)a3;
- (void)setVoiceTrainingCancelled:(int)a3;
- (void)setVoiceTrainingCancelledStep:(int)a3;
- (void)setVoiceTrainingCompleted:(int)a3;
- (void)setVoiceTrainingStarted:(int)a3;
- (void)setVtError:(int)a3;
@end

@implementation VTUIAnalytics

- (void)logEvent
{
  v19[11] = *MEMORY[0x263EF8340];
  v18[0] = @"AboutViewShown";
  v17 = objc_msgSend(NSNumber, "numberWithInt:", -[VTUIAnalytics aboutViewShown](self, "aboutViewShown"));
  v19[0] = v17;
  v18[1] = @"IntroViewShown";
  v16 = objc_msgSend(NSNumber, "numberWithInt:", -[VTUIAnalytics introViewShown](self, "introViewShown"));
  v19[1] = v16;
  v18[2] = @"SkippedFromIntroAOP";
  v15 = objc_msgSend(NSNumber, "numberWithInt:", -[VTUIAnalytics skippedFromIntroAOP](self, "skippedFromIntroAOP"));
  v19[2] = v15;
  v18[3] = @"SkippedFromIntroNonAOP";
  v14 = objc_msgSend(NSNumber, "numberWithInt:", -[VTUIAnalytics skippedFromIntroNonAOP](self, "skippedFromIntroNonAOP"));
  v19[3] = v14;
  v18[4] = @"TurnOnSiriNonAOP";
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[VTUIAnalytics turnOnSiriNonAOP](self, "turnOnSiriNonAOP"));
  v19[4] = v3;
  v18[5] = @"VoiceTrainingCancelled";
  v4 = objc_msgSend(NSNumber, "numberWithInt:", -[VTUIAnalytics voiceTrainingCancelled](self, "voiceTrainingCancelled"));
  v19[5] = v4;
  v18[6] = @"VoiceTrainingStep";
  v5 = objc_msgSend(NSNumber, "numberWithInt:", -[VTUIAnalytics voiceTrainingCancelledStep](self, "voiceTrainingCancelledStep"));
  v19[6] = v5;
  v18[7] = @"VoiceTrainingCompleted";
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[VTUIAnalytics voiceTrainingCompleted](self, "voiceTrainingCompleted"));
  v19[7] = v6;
  v18[8] = @"VoiceTrainingStarted";
  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[VTUIAnalytics voiceTrainingStarted](self, "voiceTrainingStarted"));
  v19[8] = v7;
  v18[9] = @"LanguageCode";
  v8 = [(VTUIAnalytics *)self languageCode];
  if (v8)
  {
    v9 = [(VTUIAnalytics *)self languageCode];
  }
  else
  {
    v9 = &stru_26EB8DDE0;
  }
  v19[9] = v9;
  v18[10] = @"SetupMode";
  v10 = [(VTUIAnalytics *)self setupMode];
  if (v10)
  {
    v11 = [(VTUIAnalytics *)self setupMode];
  }
  else
  {
    v11 = &stru_26EB8DDE0;
  }
  v19[10] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:11];
  if (v10) {

  }
  if (v8) {
  id v13 = v12;
  }
  AnalyticsSendEventLazy();
}

id __25__VTUIAnalytics_logEvent__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (int)introViewShown
{
  return self->_introViewShown;
}

- (void)setIntroViewShown:(int)a3
{
  self->_introViewShown = a3;
}

- (int)aboutViewShown
{
  return self->_aboutViewShown;
}

- (void)setAboutViewShown:(int)a3
{
  self->_aboutViewShown = a3;
}

- (int)skippedFromIntroAOP
{
  return self->_skippedFromIntroAOP;
}

- (void)setSkippedFromIntroAOP:(int)a3
{
  self->_skippedFromIntroAOP = a3;
}

- (int)skippedFromIntroNonAOP
{
  return self->_skippedFromIntroNonAOP;
}

- (void)setSkippedFromIntroNonAOP:(int)a3
{
  self->_skippedFromIntroNonAOP = a3;
}

- (int)turnOnSiriNonAOP
{
  return self->_turnOnSiriNonAOP;
}

- (void)setTurnOnSiriNonAOP:(int)a3
{
  self->_turnOnSiriNonAOP = a3;
}

- (int)voiceTrainingCancelled
{
  return self->_voiceTrainingCancelled;
}

- (void)setVoiceTrainingCancelled:(int)a3
{
  self->_voiceTrainingCancelled = a3;
}

- (int)voiceTrainingCancelledStep
{
  return self->_voiceTrainingCancelledStep;
}

- (void)setVoiceTrainingCancelledStep:(int)a3
{
  self->_voiceTrainingCancelledStep = a3;
}

- (int)voiceTrainingCompleted
{
  return self->_voiceTrainingCompleted;
}

- (void)setVoiceTrainingCompleted:(int)a3
{
  self->_voiceTrainingCompleted = a3;
}

- (int)voiceTrainingStarted
{
  return self->_voiceTrainingStarted;
}

- (void)setVoiceTrainingStarted:(int)a3
{
  self->_voiceTrainingStarted = a3;
}

- (int)asrError
{
  return self->_asrError;
}

- (void)setAsrError:(int)a3
{
  self->_asrError = a3;
}

- (int)vtError
{
  return self->_vtError;
}

- (void)setVtError:(int)a3
{
  self->_vtError = a3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)setupMode
{
  return self->_setupMode;
}

- (void)setSetupMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupMode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end