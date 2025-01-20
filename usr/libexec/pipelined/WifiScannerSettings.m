@interface WifiScannerSettings
- (BOOL)includeOffChannelResults;
- (BOOL)lowPriorityScan;
- (NSArray)channels;
- (WifiScannerSettings)init;
- (WifiScannerSettings)initWithChannels:(id)a3 dwell:(duration<long)long scanType:()std:(1000>>)a4 :(int)a5 ratio<1 includingOffChannelResults:(BOOL)a6 atDutyCycle:(float)a7 asLowPriority:(BOOL)a8;
- (double)dwellTimeInterval;
- (duration<long)dwell;
- (duration<long)estimatedScanTime;
- (float)dutyCycle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)scanType;
- (void)setChannels:(id)a3;
- (void)setDutyCycle:(float)a3;
- (void)setDwell:(duration<long)long;
- (void)setDwellTimeInterval:(double)a3;
- (void)setIncludeOffChannelResults:(BOOL)a3;
- (void)setLowPriorityScan:(BOOL)a3;
- (void)setScanType:(int)a3;
- (void)updateFrom:(id)a3;
@end

@implementation WifiScannerSettings

- (id)description
{
  v3 = [(NSArray *)self->_channels componentsJoinedByString:@","];
  id v4 = objc_alloc((Class)NSString);
  v5 = "true";
  if (self->_includeOffChannelResults) {
    v6 = "true";
  }
  else {
    v6 = "false";
  }
  if (!self->_lowPriorityScan) {
    v5 = "false";
  }
  id v7 = [v4 initWithFormat:@"{channels:[%@], dwell:\"%lld ms\", scanType: %d, offchannel: %s, dutyCycle: %f, lowPriority: %s}", v3, self->_dwell.__rep_, self->_scanType, v6, self->_dutyCycle, v5];

  return v7;
}

- (void)updateFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 channels];
    id v7 = (NSArray *)[v6 copy];
    channels = self->_channels;
    self->_channels = v7;

    self->_dwell.__rep_ = (int64_t)[v5 dwell];
    self->_scanType = [v5 scanType];
    self->_includeOffChannelResults = [v5 includeOffChannelResults];
    [v5 dutyCycle];
    self->_dutyCycle = v9;
    self->_lowPriorityScan = [v5 lowPriorityScan];
LABEL_3:

    return;
  }
  if (qword_10047BED8 == -1)
  {
    v10 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_10047BED8, &stru_100468160);
    v10 = qword_10047BEE0;
    if (!os_log_type_enabled((os_log_t)qword_10047BEE0, OS_LOG_TYPE_INFO)) {
      goto LABEL_3;
    }
  }
  *(_WORD *)v11 = 0;
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Invalid settings to update from - cannot be nil", v11, 2u);
}

- (WifiScannerSettings)initWithChannels:(id)a3 dwell:(duration<long)long scanType:()std:(1000>>)a4 :(int)a5 ratio<1 includingOffChannelResults:(BOOL)a6 atDutyCycle:(float)a7 asLowPriority:(BOOL)a8
{
  id v14 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WifiScannerSettings;
  v15 = [(WifiScannerSettings *)&v20 init];
  if (v15)
  {
    v16 = (NSArray *)[v14 copy];
    channels = v15->_channels;
    v15->_channels = v16;

    v15->_dwell = a4;
    v15->_scanType = a5;
    v15->_includeOffChannelResults = a6;
    v15->_dutyCycle = a7;
    v15->_lowPriorityScan = a8;
    v18 = v15;
  }

  return v15;
}

- (NSArray)channels
{
  return self->_channels;
}

- (int)scanType
{
  return self->_scanType;
}

- (BOOL)lowPriorityScan
{
  return self->_lowPriorityScan;
}

- (WifiScannerSettings)init
{
  LODWORD(v2) = 0.5;
  return [(WifiScannerSettings *)self initWithChannels:&off_10046F1D8 dwell:110 scanType:2 includingOffChannelResults:0 atDutyCycle:0 asLowPriority:v2];
}

- (BOOL)includeOffChannelResults
{
  return self->_includeOffChannelResults;
}

- (duration<long)dwell
{
  return self->_dwell;
}

- (float)dutyCycle
{
  return self->_dutyCycle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[WifiScannerSettings allocWithZone:a3];
  channels = self->_channels;
  int64_t rep = self->_dwell.__rep_;
  uint64_t scanType = self->_scanType;
  BOOL includeOffChannelResults = self->_includeOffChannelResults;
  *(float *)&double v9 = self->_dutyCycle;
  BOOL lowPriorityScan = self->_lowPriorityScan;

  return [(WifiScannerSettings *)v4 initWithChannels:channels dwell:rep scanType:scanType includingOffChannelResults:includeOffChannelResults atDutyCycle:lowPriorityScan asLowPriority:v9];
}

- (duration<long)estimatedScanTime
{
  return (duration<long long, std::ratio<1, 1000>>)(self->_dwell.__rep_ * [(NSArray *)self->_channels count]);
}

- (double)dwellTimeInterval
{
  return (double)self->_dwell.__rep_ / 1000.0;
}

- (void)setDwellTimeInterval:(double)a3
{
  self->_dwell.__rep_ = (uint64_t)(a3 * 1000.0);
}

- (void)setChannels:(id)a3
{
}

- (void)setDwell:(duration<long)long
{
  self->_dwell = a3;
}

- (void)setScanType:(int)a3
{
  self->_uint64_t scanType = a3;
}

- (void)setIncludeOffChannelResults:(BOOL)a3
{
  self->_BOOL includeOffChannelResults = a3;
}

- (void)setDutyCycle:(float)a3
{
  self->_dutyCycle = a3;
}

- (void)setLowPriorityScan:(BOOL)a3
{
  self->_BOOL lowPriorityScan = a3;
}

- (void).cxx_destruct
{
}

@end