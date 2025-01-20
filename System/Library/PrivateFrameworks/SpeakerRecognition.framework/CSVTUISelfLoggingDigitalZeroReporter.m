@interface CSVTUISelfLoggingDigitalZeroReporter
- (BOOL)digitalZeroDetected;
- (CSVTUISelfLoggingDigitalZeroReporter)initWithSiriSetupID:(id)a3 PageNumber:(int)a4 withPhId:(id)a5 withLocale:(id)a6 withVTAssetConfigVersion:(id)a7 withSessionStatus:(int)a8;
- (int)_getStageStatusFromTrainingManagerSessionStatus:(int)a3;
- (void)logDigitalZeroDetectionComplete;
- (void)reportDigitalZerosWithAudioZeroRun:(float)a3;
@end

@implementation CSVTUISelfLoggingDigitalZeroReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vtAssetConfigVersion, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_phId, 0);

  objc_storeStrong((id *)&self->_siriSetupID, 0);
}

- (int)_getStageStatusFromTrainingManagerSessionStatus:(int)a3
{
  if (a3 < 8) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (void)logDigitalZeroDetectionComplete
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL isMaxNumContinuousZerosOverThreshold = self->_isMaxNumContinuousZerosOverThreshold;
  v4 = *MEMORY[0x263F37FA8];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT);
  if (isMaxNumContinuousZerosOverThreshold)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSVTUISelfLoggingDigitalZeroReporter logDigitalZeroDetectionComplete]";
      v6 = "%s CSVTUI continuousZeros detected.";
LABEL_6:
      _os_log_impl(&dword_21C8A5000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    }
  }
  else if (v5)
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSVTUISelfLoggingDigitalZeroReporter logDigitalZeroDetectionComplete]";
    v6 = "%s CSVTUI continuousZeros not detected.";
    goto LABEL_6;
  }
  v7 = [MEMORY[0x263F380E0] sharedLogger];
  siriSetupID = self->_siriSetupID;
  uint64_t pageNumber = self->_pageNumber;
  phId = self->_phId;
  uint64_t maxNumContinuousZeros = self->_maxNumContinuousZeros;
  uint64_t maxNumAllowedContinuousZeros = self->_maxNumAllowedContinuousZeros;
  BOOL v13 = self->_isMaxNumContinuousZerosOverThreshold;
  locale = self->_locale;
  vtAssetConfigVersion = self->_vtAssetConfigVersion;
  LODWORD(v16) = [(CSVTUISelfLoggingDigitalZeroReporter *)self _getStageStatusFromTrainingManagerSessionStatus:self->_sessionStatus];
  [v7 logSiriSetupPHSEnrollmentDigitalZeroDetectionCompletedWithSiriSetupID:siriSetupID withPageNumber:pageNumber withPhId:phId withMaxNumContinuousZeros:maxNumContinuousZeros withMaxNumAllowedContinuousZeros:maxNumAllowedContinuousZeros withIsMaxNumContinuousZerosOverThreshold:v13 withLocale:locale withVTAssetConfigVersion:vtAssetConfigVersion withStageStatus:v16];
}

- (BOOL)digitalZeroDetected
{
  return self->_isMaxNumContinuousZerosOverThreshold;
}

- (void)reportDigitalZerosWithAudioZeroRun:(float)a3
{
  int maxNumContinuousZeros = self->_maxNumContinuousZeros;
  if ((float)maxNumContinuousZeros < a3)
  {
    int maxNumContinuousZeros = (int)a3;
    self->_int maxNumContinuousZeros = (int)a3;
  }
  if (!self->_isMaxNumContinuousZerosOverThreshold) {
    self->_BOOL isMaxNumContinuousZerosOverThreshold = maxNumContinuousZeros > self->_maxNumAllowedContinuousZeros;
  }
}

- (CSVTUISelfLoggingDigitalZeroReporter)initWithSiriSetupID:(id)a3 PageNumber:(int)a4 withPhId:(id)a5 withLocale:(id)a6 withVTAssetConfigVersion:(id)a7 withSessionStatus:(int)a8
{
  v14 = (NSUUID *)a3;
  v15 = (NSString *)a5;
  uint64_t v16 = (NSString *)a6;
  v17 = (NSString *)a7;
  siriSetupID = self->_siriSetupID;
  self->_siriSetupID = v14;
  uint64_t v19 = v14;

  self->_uint64_t pageNumber = a4;
  phId = self->_phId;
  self->_phId = v15;
  v21 = v15;

  self->_int maxNumContinuousZeros = 0;
  float v22 = (float)(unint64_t)[MEMORY[0x263F38018] zeroFilterWindowSizeInMsForReport] / 1000.0;
  [MEMORY[0x263F38018] inputRecordingSampleRate];
  self->_uint64_t maxNumAllowedContinuousZeros = (int)(float)(v22 * v23);
  self->_BOOL isMaxNumContinuousZerosOverThreshold = 0;
  locale = self->_locale;
  self->_locale = v16;
  v25 = v16;

  vtAssetConfigVersion = self->_vtAssetConfigVersion;
  self->_vtAssetConfigVersion = v17;

  self->_sessionStatus = a8;
  return self;
}

@end