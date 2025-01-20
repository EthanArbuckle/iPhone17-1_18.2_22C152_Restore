@interface WCM_BTConnectedDevicesMetrics
- (BOOL)isEqualTo:(WCM_BTConnections *)a3;
- (BOOL)isSubsetOf:(WCM_BTConnections *)a3;
- (BOOL)isTimerActive;
- (WCM_BTConnectedDevicesMetrics)initWithBTConnections:(WCM_BTConnections *)a3 at:(double)a4;
- (double)getDuration;
- (double)getDurationInWiFi2G;
- (id)getEnumerationString;
- (unint64_t)numConnections;
- (void)dealloc;
- (void)startTimer:(double)a3;
- (void)stopTimer:(double)a3 wifi2GStartTime:(double)a4;
- (void)stopWiFi2GTimer:(double)a3 wifi2GStartTime:(double)mTimestamp;
@end

@implementation WCM_BTConnectedDevicesMetrics

- (WCM_BTConnectedDevicesMetrics)initWithBTConnections:(WCM_BTConnections *)a3 at:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WCM_BTConnectedDevicesMetrics;
  result = [(WCM_BTConnectedDevicesMetrics *)&v10 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&a3->numA2DP;
    long long v8 = *(_OWORD *)&a3->numeSCO;
    unint64_t numLEA = a3->numLEA;
    *(_OWORD *)&result->mBTConnections.numHID = *(_OWORD *)&a3->numHID;
    *(_OWORD *)&result->mBTConnections.numeSCO = v8;
    *(_OWORD *)&result->mBTConnections.numA2DP = v7;
    result->mTimestamp = a4;
    result->mBTConnections.unint64_t numLEA = numLEA;
    result->mDuration = 0.0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WCM_BTConnectedDevicesMetrics;
  [(WCM_BTConnectedDevicesMetrics *)&v2 dealloc];
}

- (unint64_t)numConnections
{
  return vaddvq_s64(vaddq_s64(*(int64x2_t *)&self->mBTConnections.numA2DP, *(int64x2_t *)&self->mBTConnections.numHID))
       + self->mBTConnections.numeSCO
       + self->mBTConnections.numLE
       + self->mBTConnections.numLEA;
}

- (BOOL)isEqualTo:(WCM_BTConnections *)a3
{
  return self->mBTConnections.numA2DP == a3->numA2DP
      && self->mBTConnections.numLLA == a3->numLLA
      && self->mBTConnections.numHID == a3->numHID
      && self->mBTConnections.numSCO == a3->numSCO
      && self->mBTConnections.numeSCO == a3->numeSCO
      && self->mBTConnections.numLE == a3->numLE
      && self->mBTConnections.numLEA == a3->numLEA;
}

- (BOOL)isSubsetOf:(WCM_BTConnections *)a3
{
  return self->mBTConnections.numA2DP <= a3->numA2DP
      && self->mBTConnections.numLLA <= a3->numLLA
      && self->mBTConnections.numHID <= a3->numHID
      && self->mBTConnections.numSCO <= a3->numSCO
      && self->mBTConnections.numeSCO <= a3->numeSCO
      && self->mBTConnections.numLE <= a3->numLE
      && self->mBTConnections.numLEA <= a3->numLEA;
}

- (BOOL)isTimerActive
{
  return self->mTimestamp != 0.0;
}

- (void)stopWiFi2GTimer:(double)a3 wifi2GStartTime:(double)mTimestamp
{
  if (mTimestamp != 0.0)
  {
    if (self->mTimestamp >= mTimestamp) {
      mTimestamp = self->mTimestamp;
    }
    self->mDurInWiFi2G = a3 - mTimestamp + self->mDurInWiFi2G;
  }
}

- (void)stopTimer:(double)a3 wifi2GStartTime:(double)a4
{
  double mTimestamp = self->mTimestamp;
  if (mTimestamp != 0.0)
  {
    self->mDuration = a3 - mTimestamp + self->mDuration;
    -[WCM_BTConnectedDevicesMetrics stopWiFi2GTimer:wifi2GStartTime:](self, "stopWiFi2GTimer:wifi2GStartTime:");
    self->double mTimestamp = 0.0;
  }
}

- (void)startTimer:(double)a3
{
  if (self->mTimestamp == 0.0) {
    self->double mTimestamp = a3;
  }
}

- (id)getEnumerationString
{
  if (self->mBTConnections.numA2DP)
  {
    if ([&stru_100226328 length]) {
      CFStringRef v3 = @",";
    }
    else {
      CFStringRef v3 = &stru_100226328;
    }
    v4 = +[NSString stringWithFormat:@"%@%@%luA2DP", &stru_100226328, v3, self->mBTConnections.numA2DP];
  }
  else
  {
    v4 = &stru_100226328;
  }
  if (self->mBTConnections.numLLA)
  {
    if ([(__CFString *)v4 length]) {
      CFStringRef v5 = @",";
    }
    else {
      CFStringRef v5 = &stru_100226328;
    }
    v4 = +[NSString stringWithFormat:@"%@%@%luLLA", v4, v5, self->mBTConnections.numLLA];
  }
  if (self->mBTConnections.numHID)
  {
    if ([(__CFString *)v4 length]) {
      CFStringRef v6 = @",";
    }
    else {
      CFStringRef v6 = &stru_100226328;
    }
    v4 = +[NSString stringWithFormat:@"%@%@%luHID", v4, v6, self->mBTConnections.numHID];
  }
  if (self->mBTConnections.numSCO)
  {
    if ([(__CFString *)v4 length]) {
      CFStringRef v7 = @",";
    }
    else {
      CFStringRef v7 = &stru_100226328;
    }
    v4 = +[NSString stringWithFormat:@"%@%@%luSCO", v4, v7, self->mBTConnections.numSCO];
  }
  if (self->mBTConnections.numeSCO)
  {
    if ([(__CFString *)v4 length]) {
      CFStringRef v8 = @",";
    }
    else {
      CFStringRef v8 = &stru_100226328;
    }
    v4 = +[NSString stringWithFormat:@"%@%@%lueSCO", v4, v8, self->mBTConnections.numeSCO];
  }
  if (self->mBTConnections.numLE)
  {
    if ([(__CFString *)v4 length]) {
      CFStringRef v9 = @",";
    }
    else {
      CFStringRef v9 = &stru_100226328;
    }
    v4 = +[NSString stringWithFormat:@"%@%@%luLE", v4, v9, self->mBTConnections.numLE];
  }
  if (!self->mBTConnections.numLEA) {
    return v4;
  }
  if ([(__CFString *)v4 length]) {
    CFStringRef v10 = @",";
  }
  else {
    CFStringRef v10 = &stru_100226328;
  }
  return +[NSString stringWithFormat:@"%@%@%luLEA", v4, v10, self->mBTConnections.numLEA];
}

- (double)getDuration
{
  return self->mDuration;
}

- (double)getDurationInWiFi2G
{
  return self->mDurInWiFi2G;
}

@end