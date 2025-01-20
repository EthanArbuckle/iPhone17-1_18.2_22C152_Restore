@interface VSDownloadMetrics
+ (double)_clockFactor;
- (BOOL)discretionary;
- (BOOL)endMetrics;
- (BOOL)isCellularAllowed;
- (NSNumber)downloadSize;
- (NSString)clientBundleIdentifier;
- (NSString)voiceDownloadKey;
- (VSDownloadMetrics)initWithVoiceName:(id)a3 languageCode:(id)a4 gender:(int64_t)a5;
- (double)downloadDuration;
- (double)setupTimeInterval;
- (float)downloadProgress;
- (id)description;
- (id)dictionaryMetrics;
- (int64_t)downloadBeginTimestamp;
- (int64_t)downloadEndTimestamp;
- (int64_t)errorCode;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadProgress:(float)a3;
- (void)setDownloadSize:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setIsCellularAllowed:(BOOL)a3;
- (void)setSetupTimeInterval:(double)a3;
@end

@implementation VSDownloadMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceDownloadKey, 0);
  objc_storeStrong((id *)&self->_downloadSize, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
}

- (int64_t)downloadEndTimestamp
{
  return self->_downloadEndTimestamp;
}

- (int64_t)downloadBeginTimestamp
{
  return self->_downloadBeginTimestamp;
}

- (NSString)voiceDownloadKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSetupTimeInterval:(double)a3
{
  self->_setupTimeInterval = a3;
}

- (double)setupTimeInterval
{
  return self->_setupTimeInterval;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadSize:(id)a3
{
}

- (NSNumber)downloadSize
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

- (void)setIsCellularAllowed:(BOOL)a3
{
  self->_isCellularAllowed = a3;
}

- (BOOL)isCellularAllowed
{
  return self->_isCellularAllowed;
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)downloadDuration
{
  uint64_t downloadEndTimestamp = self->_downloadEndTimestamp;
  if (!downloadEndTimestamp) {
    uint64_t downloadEndTimestamp = mach_absolute_time();
  }
  double v4 = (double)(downloadEndTimestamp - self->_downloadBeginTimestamp);
  +[VSDownloadMetrics _clockFactor];
  return v5 * v4;
}

- (BOOL)endMetrics
{
  int64_t downloadEndTimestamp = self->_downloadEndTimestamp;
  if (!downloadEndTimestamp) {
    self->_int64_t downloadEndTimestamp = mach_absolute_time();
  }
  return downloadEndTimestamp == 0;
}

- (id)dictionaryMetrics
{
  v18[9] = *MEMORY[0x263EF8340];
  voiceDownloadKey = (__CFString *)self->_voiceDownloadKey;
  if (!voiceDownloadKey) {
    voiceDownloadKey = &stru_26C1B0528;
  }
  v18[0] = voiceDownloadKey;
  v17[0] = @"voice_asset_key";
  v17[1] = @"allowing_cellular";
  double v4 = [NSNumber numberWithBool:self->_isCellularAllowed];
  v18[1] = v4;
  v17[2] = @"discretionary";
  double v5 = [NSNumber numberWithBool:self->_discretionary];
  downloadSize = self->_downloadSize;
  v18[2] = v5;
  v18[3] = downloadSize;
  v17[3] = @"download_size";
  v17[4] = @"download_duration";
  v7 = NSNumber;
  [(VSDownloadMetrics *)self downloadDuration];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v18[4] = v8;
  v17[5] = @"download_progress";
  *(float *)&double v9 = self->_downloadProgress;
  v10 = [NSNumber numberWithFloat:v9];
  v18[5] = v10;
  v17[6] = @"error_code";
  uint64_t v11 = [NSNumber numberWithInteger:self->_errorCode];
  v12 = (void *)v11;
  clientBundleIdentifier = (__CFString *)self->_clientBundleIdentifier;
  if (!clientBundleIdentifier) {
    clientBundleIdentifier = &stru_26C1B0528;
  }
  v18[6] = v11;
  v18[7] = clientBundleIdentifier;
  v17[7] = @"client_bundle_identifier";
  v17[8] = @"setup_duration";
  v14 = [NSNumber numberWithDouble:self->_setupTimeInterval];
  v18[8] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:9];

  return v15;
}

- (id)description
{
  v2 = [(VSDownloadMetrics *)self dictionaryMetrics];
  v3 = [v2 description];

  return v3;
}

- (VSDownloadMetrics)initWithVoiceName:(id)a3 languageCode:(id)a4 gender:(int64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)VSDownloadMetrics;
  id v7 = a4;
  id v8 = a3;
  double v9 = [(VSDownloadMetrics *)&v15 init];
  v9->_downloadBeginTimestamp = mach_absolute_time();
  v10 = NSString;
  uint64_t v11 = +[VSVoiceAsset genderStringFromGender:a5];
  uint64_t v12 = [v10 stringWithFormat:@"%@:%@:%@", v7, v11, v8];

  voiceDownloadKey = v9->_voiceDownloadKey;
  v9->_voiceDownloadKey = (NSString *)v12;

  return v9;
}

+ (double)_clockFactor
{
  if (_clockFactor_onceToken_277 != -1) {
    dispatch_once(&_clockFactor_onceToken_277, &__block_literal_global_278);
  }
  return *(double *)&_clockFactor_clockToSeconds_279;
}

double __33__VSDownloadMetrics__clockFactor__block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 / 1000000000.0;
  _clockFactor_clockToSeconds_279 = *(void *)&result;
  return result;
}

@end