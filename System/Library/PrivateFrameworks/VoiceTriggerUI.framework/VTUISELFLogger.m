@interface VTUISELFLogger
+ (id)SISchemaLocaleToSISchemaISOLocale:(int)a3;
+ (int)getSiriSetupUIEnrollmentMode:(int64_t)a3;
+ (void)logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:(id)a3 enrollmentMode:(int64_t)a4 locale:(id)a5 trainingOutcome:(int)a6 pageNumber:(int)a7 isRetry:(unsigned __int8)a8 audioHintNeeded:(unsigned __int8)a9 audioHintSpoken:(unsigned __int8)a10;
+ (void)logSiriSetupPHSEnrollmentUICompleted:(id)a3 enrollmentMode:(int64_t)a4 locale:(id)a5 enrollmentSessionOutcome:(int)a6 pageNumber:(int)a7;
+ (void)logSiriSetupPHSEnrollmentUIStarted:(id)a3 enrollmentMode:(int64_t)a4 locale:(id)a5 voiceTriggerType:(int)a6;
@end

@implementation VTUISELFLogger

+ (void)logSiriSetupPHSEnrollmentUIStarted:(id)a3 enrollmentMode:(int64_t)a4 locale:(id)a5 voiceTriggerType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  v10 = (objc_class *)MEMORY[0x263F6ECC8];
  id v11 = a5;
  id v12 = a3;
  id v19 = objc_alloc_init(v10);
  uint64_t v13 = [MEMORY[0x263F6EF10] convertLanguageCodeToSchemaLocale:v11];

  v14 = [a1 SISchemaLocaleToSISchemaISOLocale:v13];
  [v19 setLocale:v14];
  objc_msgSend(v19, "setEnrollmentMode:", objc_msgSend(a1, "getSiriSetupUIEnrollmentMode:", a4));
  [v19 setVoiceTriggerType:v6];
  id v15 = objc_alloc_init(MEMORY[0x263F6ECA0]);
  id v16 = objc_alloc_init(MEMORY[0x263F6ECB8]);
  v17 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:v12];

  [v16 setSiriSetupId:v17];
  [v15 setEventMetadata:v16];
  [v15 setEnrollmentUIStarted:v19];
  v18 = [MEMORY[0x263F6C818] sharedStream];
  [v18 emitMessage:v15];
}

+ (void)logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:(id)a3 enrollmentMode:(int64_t)a4 locale:(id)a5 trainingOutcome:(int)a6 pageNumber:(int)a7 isRetry:(unsigned __int8)a8 audioHintNeeded:(unsigned __int8)a9 audioHintSpoken:(unsigned __int8)a10
{
  int v10 = a8;
  uint64_t v11 = *(void *)&a7;
  uint64_t v12 = *(void *)&a6;
  id v16 = (objc_class *)MEMORY[0x263F6ECD0];
  id v17 = a5;
  id v18 = a3;
  id v25 = objc_alloc_init(v16);
  uint64_t v19 = [MEMORY[0x263F6EF10] convertLanguageCodeToSchemaLocale:v17];

  v20 = [a1 SISchemaLocaleToSISchemaISOLocale:v19];
  [v25 setLocale:v20];
  objc_msgSend(v25, "setEnrollmentMode:", objc_msgSend(a1, "getSiriSetupUIEnrollmentMode:", a4));
  [v25 setTrainingOutcome:v12];
  [v25 setPageNumber:v11];
  [v25 setIsRetry:v10 != 0];
  [v25 setWasAudioHintNeeded:a9 != 0];
  [v25 setWasAudioHintSpokenSuccessfully:a10 != 0];
  id v21 = objc_alloc_init(MEMORY[0x263F6ECA0]);
  id v22 = objc_alloc_init(MEMORY[0x263F6ECB8]);
  v23 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:v18];

  [v22 setSiriSetupId:v23];
  [v21 setEventMetadata:v22];
  [v21 setEnrollmentUIUtteranceTrainingAttempted:v25];
  v24 = [MEMORY[0x263F6C818] sharedStream];
  [v24 emitMessage:v21];
}

+ (void)logSiriSetupPHSEnrollmentUICompleted:(id)a3 enrollmentMode:(int64_t)a4 locale:(id)a5 enrollmentSessionOutcome:(int)a6 pageNumber:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v12 = (objc_class *)MEMORY[0x263F6ECC0];
  id v13 = a5;
  id v14 = a3;
  id v21 = objc_alloc_init(v12);
  uint64_t v15 = [MEMORY[0x263F6EF10] convertLanguageCodeToSchemaLocale:v13];

  id v16 = [a1 SISchemaLocaleToSISchemaISOLocale:v15];
  [v21 setLocale:v16];
  objc_msgSend(v21, "setEnrollmentMode:", objc_msgSend(a1, "getSiriSetupUIEnrollmentMode:", a4));
  [v21 setEnrollmentOutcome:v8];
  [v21 setPageNumber:v7];
  id v17 = objc_alloc_init(MEMORY[0x263F6ECA0]);
  id v18 = objc_alloc_init(MEMORY[0x263F6ECB8]);
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F6EEE0]) initWithNSUUID:v14];

  [v18 setSiriSetupId:v19];
  [v17 setEventMetadata:v18];
  [v17 setEnrollmentUICompleted:v21];
  v20 = [MEMORY[0x263F6C818] sharedStream];
  [v20 emitMessage:v17];
}

+ (id)SISchemaLocaleToSISchemaISOLocale:(int)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F6ED60]);
  v5 = v4;
  if (a3 <= 0x3E)
  {
    uint64_t v6 = dword_2388E50B0[a3];
    uint64_t v7 = dword_2388E51AC[a3];
    [v4 setCountryCode:v6];
    [v5 setLanguageCode:v7];
  }
  return v5;
}

+ (int)getSiriSetupUIEnrollmentMode:(int64_t)a3
{
  if ((unint64_t)a3 < 7) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

@end