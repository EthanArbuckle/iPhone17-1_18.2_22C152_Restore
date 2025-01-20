@interface WBSPasswordBreachConfiguration
+ (WBSPasswordBreachConfiguration)standardConfiguration;
- (BOOL)isVerboseSensitiveLoggingEnabled;
- (BOOL)shouldRefillBagWhenEmpty;
- (BOOL)verboseSensitiveLoggingEnabled;
- (NSString)highFrequencyBucketHashSalt;
- (NSString)lowFrequencyBucketHashSalt;
- (NSURL)highFrequencyBucketURL;
- (NSURL)lowFrequencyBucketURL;
- (NSURLSessionConfiguration)urlSessionConfiguration;
- (WBSPasswordBreachConfiguration)initWithDictionary:(id)a3;
- (WBSPasswordBreachConfiguration)initWithDictionary:(id)a3 protocolClasses:(id)a4 allowValuesForTesting:(BOOL)a5;
- (double)minimumDelayBetweenSessions;
- (unint64_t)fakePasswordLengthBytes;
- (unint64_t)highFrequencyBucketHashWorkFactor;
- (unint64_t)highFrequencyBucketScryptBlockSizeR;
- (unint64_t)highFrequencyBucketScryptParallelismFactorP;
- (unint64_t)lowFrequencyBucketFetchTimeout;
- (unint64_t)lowFrequencyBucketHashWorkFactor;
- (unint64_t)lowFrequencyBucketIdentifierBitCount;
- (unint64_t)lowFrequencyBucketScryptBlockSizeR;
- (unint64_t)lowFrequencyBucketScryptParallelismFactorP;
- (unint64_t)numberOfBatchesPerSession;
- (unint64_t)passwordCheckBatchSize;
@end

@implementation WBSPasswordBreachConfiguration

- (WBSPasswordBreachConfiguration)initWithDictionary:(id)a3
{
  return [(WBSPasswordBreachConfiguration *)self initWithDictionary:a3 protocolClasses:MEMORY[0x1E4F1CBF0] allowValuesForTesting:0];
}

- (WBSPasswordBreachConfiguration)initWithDictionary:(id)a3 protocolClasses:(id)a4 allowValuesForTesting:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)WBSPasswordBreachConfiguration;
  v10 = [(WBSPasswordBreachConfiguration *)&v34 init];
  if (!v10)
  {
    v30 = 0;
    goto LABEL_34;
  }
  char v11 = os_variant_allows_internal_security_policies();
  v10->_isInternalBuild = v11;
  if ((v11 & 1) == 0 && v5)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachConfiguration initWithDictionary:protocolClasses:allowValuesForTesting:](v12);
    }
    BOOL v5 = 0;
  }
  v13 = [[WBSPasswordBreachConfigurationDictionaryUnpacker alloc] initWithDictionary:v8];
  uint64_t v14 = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 stringForKey:@"HighFrequencyBucketHashSalt" minimumLength:8];
  highFrequencyBucketHashSalt = v10->_highFrequencyBucketHashSalt;
  v10->_highFrequencyBucketHashSalt = (NSString *)v14;

  uint64_t v16 = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 stringForKey:@"LowFrequencyBucketHashSalt" minimumLength:8];
  lowFrequencyBucketHashSalt = v10->_lowFrequencyBucketHashSalt;
  v10->_lowFrequencyBucketHashSalt = (NSString *)v16;

  if (v5) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = 2048;
  }
  if (v5) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = 15;
  }
  v10->_highFrequencyBucketHashWorkFactor = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"HighFrequencyBucketHashWorkFactor" minimumValue:v18 maximumValue:-1];
  v10->_lowFrequencyBucketHashWorkFactor = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"HighFrequencyBucketHashWorkFactor" minimumValue:v18 maximumValue:-1];
  v10->_lowFrequencyBucketIdentifierBitCount = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"LowFrequencyBucketIdentifierBitCount" minimumValue:v19 maximumValue:26];
  v10->_highFrequencyBucketScryptBlockSizeR = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"HighFrequencyBucketScryptBlockSizeR" minimumValue:1 maximumValue:100];
  v10->_highFrequencyBucketScryptParallelismFactorP = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"HighFrequencyBucketScryptParallelismFactorP" minimumValue:1 maximumValue:100];
  v10->_lowFrequencyBucketScryptBlockSizeR = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"LowFrequencyBucketScryptBlockSizeR" minimumValue:1 maximumValue:100];
  v10->_lowFrequencyBucketScryptParallelismFactorP = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"LowFrequencyBucketScryptParallelismFactorP" minimumValue:1 maximumValue:100];
  uint64_t v20 = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 URLForKey:@"HighFrequencyBucketURL"];
  highFrequencyBucketURL = v10->_highFrequencyBucketURL;
  v10->_highFrequencyBucketURL = (NSURL *)v20;

  uint64_t v22 = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 URLForKey:@"LowFrequencyBucketURL"];
  lowFrequencyBucketURL = v10->_lowFrequencyBucketURL;
  v10->_lowFrequencyBucketURL = (NSURL *)v22;

  if (v5) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = 86400;
  }
  if (v5) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = 5;
  }
  if (v5) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = 3;
  }
  if (v5) {
    uint64_t v27 = 1;
  }
  else {
    uint64_t v27 = 10;
  }
  v10->_minimumDelayBetweenSessions = (double)[(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"MinimumDelayBetweenSessions" minimumValue:v24 maximumValue:2592000];
  v10->_passwordCheckBatchSize = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"PasswordCheckBatchSize" minimumValue:v25 maximumValue:50];
  v10->_numberOfBatchesPerSession = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"NumberOfBatchesPerSession" minimumValue:v26 maximumValue:10];
  v10->_fakePasswordLengthBytes = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"FakePasswordLengthBytes" minimumValue:v27 maximumValue:30];
  v10->_lowFrequencyBucketFetchTimeout = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 unsignedIntegerForKey:@"LowFrequencyBucketFetchTimeout" minimumValue:v25 maximumValue:120];
  if (+[WBSPasswordBreachCryptographicOperations isValidScryptHashWorkFactor:blockSizeR:parallelismFactorP:](WBSPasswordBreachCryptographicOperations, "isValidScryptHashWorkFactor:blockSizeR:parallelismFactorP:", v10->_lowFrequencyBucketHashWorkFactor, v10->_lowFrequencyBucketScryptBlockSizeR, v10->_lowFrequencyBucketScryptParallelismFactorP)&& +[WBSPasswordBreachCryptographicOperations isValidScryptHashWorkFactor:v10->_highFrequencyBucketHashWorkFactor blockSizeR:v10->_highFrequencyBucketScryptBlockSizeR parallelismFactorP:v10->_highFrequencyBucketScryptParallelismFactorP])
  {
    if (v5)
    {
      v10->_shouldRefillBagWhenEmpty = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 optionalBoolForKey:@"ShouldRefillBagWhenEmptyInternalOnly" defaultValue:1];
      BOOL v28 = [(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 optionalBoolForKey:@"VerboseSensitiveLoggingInternalOnly" defaultValue:0];
    }
    else
    {
      BOOL v28 = 0;
      v10->_shouldRefillBagWhenEmpty = 1;
    }
    v10->_verboseSensitiveLoggingEnabled = v28;
    if (![(WBSPasswordBreachConfigurationDictionaryUnpacker *)v13 errorOccurred])
    {
      uint64_t v32 = objc_msgSend(MEMORY[0x1E4F18DD0], "safari_ephemeralSessionConfiguration");
      urlSessionConfiguration = v10->_urlSessionConfiguration;
      v10->_urlSessionConfiguration = (NSURLSessionConfiguration *)v32;

      if (v9) {
        [(NSURLSessionConfiguration *)v10->_urlSessionConfiguration setProtocolClasses:v9];
      }
      v30 = v10;
      goto LABEL_32;
    }
  }
  else
  {
    v29 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordBreachConfiguration initWithDictionary:protocolClasses:allowValuesForTesting:](v29);
    }
  }
  v30 = 0;
LABEL_32:

LABEL_34:
  return v30;
}

+ (WBSPasswordBreachConfiguration)standardConfiguration
{
  if (standardConfiguration_onceToken != -1) {
    dispatch_once(&standardConfiguration_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)standardConfiguration_configuration;
  return (WBSPasswordBreachConfiguration *)v2;
}

void __55__WBSPasswordBreachConfiguration_standardConfiguration__block_invoke()
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v3[0] = @"LowFrequencyBucketIdentifierBitCount";
  v3[1] = @"HighFrequencyBucketURL";
  v4[0] = &unk_1F1086380;
  v4[1] = @"https://pbs-service-idem-dev.usnkq03.app.apple.com/pbs/api/v1/bucket/";
  v3[2] = @"LowFrequencyBucketURL";
  v3[3] = @"PasswordCheckBatchSize";
  v4[2] = @"https://pbs-service-idem-dev.usnkq03.app.apple.com/pbs/api/v1/bucket/";
  v4[3] = &unk_1F1086398;
  v3[4] = @"NumberOfBatchesPerSession";
  v3[5] = @"FakePasswordLengthBytes";
  v4[4] = &unk_1F10863B0;
  v4[5] = &unk_1F10863C8;
  v3[6] = @"LowFrequencyBucketFetchTimeout";
  v4[6] = &unk_1F10863C8;
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:7];
  v1 = [[WBSPasswordBreachConfiguration alloc] initWithDictionary:v0];
  v2 = (void *)standardConfiguration_configuration;
  standardConfiguration_configuration = (uint64_t)v1;
}

- (BOOL)shouldRefillBagWhenEmpty
{
  return !self->_isInternalBuild || self->_shouldRefillBagWhenEmpty;
}

- (BOOL)isVerboseSensitiveLoggingEnabled
{
  return self->_isInternalBuild && self->_verboseSensitiveLoggingEnabled;
}

- (NSString)highFrequencyBucketHashSalt
{
  return self->_highFrequencyBucketHashSalt;
}

- (NSString)lowFrequencyBucketHashSalt
{
  return self->_lowFrequencyBucketHashSalt;
}

- (unint64_t)highFrequencyBucketHashWorkFactor
{
  return self->_highFrequencyBucketHashWorkFactor;
}

- (unint64_t)lowFrequencyBucketHashWorkFactor
{
  return self->_lowFrequencyBucketHashWorkFactor;
}

- (unint64_t)highFrequencyBucketScryptBlockSizeR
{
  return self->_highFrequencyBucketScryptBlockSizeR;
}

- (unint64_t)lowFrequencyBucketScryptBlockSizeR
{
  return self->_lowFrequencyBucketScryptBlockSizeR;
}

- (unint64_t)highFrequencyBucketScryptParallelismFactorP
{
  return self->_highFrequencyBucketScryptParallelismFactorP;
}

- (unint64_t)lowFrequencyBucketScryptParallelismFactorP
{
  return self->_lowFrequencyBucketScryptParallelismFactorP;
}

- (unint64_t)lowFrequencyBucketIdentifierBitCount
{
  return self->_lowFrequencyBucketIdentifierBitCount;
}

- (NSURL)highFrequencyBucketURL
{
  return self->_highFrequencyBucketURL;
}

- (NSURL)lowFrequencyBucketURL
{
  return self->_lowFrequencyBucketURL;
}

- (NSURLSessionConfiguration)urlSessionConfiguration
{
  return self->_urlSessionConfiguration;
}

- (double)minimumDelayBetweenSessions
{
  return self->_minimumDelayBetweenSessions;
}

- (unint64_t)passwordCheckBatchSize
{
  return self->_passwordCheckBatchSize;
}

- (unint64_t)numberOfBatchesPerSession
{
  return self->_numberOfBatchesPerSession;
}

- (unint64_t)fakePasswordLengthBytes
{
  return self->_fakePasswordLengthBytes;
}

- (unint64_t)lowFrequencyBucketFetchTimeout
{
  return self->_lowFrequencyBucketFetchTimeout;
}

- (BOOL)verboseSensitiveLoggingEnabled
{
  return self->_verboseSensitiveLoggingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlSessionConfiguration, 0);
  objc_storeStrong((id *)&self->_lowFrequencyBucketURL, 0);
  objc_storeStrong((id *)&self->_highFrequencyBucketURL, 0);
  objc_storeStrong((id *)&self->_lowFrequencyBucketHashSalt, 0);
  objc_storeStrong((id *)&self->_highFrequencyBucketHashSalt, 0);
}

- (void)initWithDictionary:(os_log_t)log protocolClasses:allowValuesForTesting:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Invalid scrypt parameters.", v1, 2u);
}

- (void)initWithDictionary:(os_log_t)log protocolClasses:allowValuesForTesting:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "Configuration allowValuesForTesting set to YES on non-internal device.", v1, 2u);
}

@end