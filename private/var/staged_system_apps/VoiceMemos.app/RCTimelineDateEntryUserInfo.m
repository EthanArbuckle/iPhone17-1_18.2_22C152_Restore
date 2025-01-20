@interface RCTimelineDateEntryUserInfo
- (BOOL)isEqual:(id)a3;
- (RCTimelineDateEntryUserInfo)initWithCurrentTime:(double)a3 recordingDuration:(double)a4;
- (double)currentTime;
- (double)recordingDuration;
- (id)description;
- (unint64_t)hash;
- (void)setCurrentTime:(double)a3;
- (void)setRecordingDuration:(double)a3;
@end

@implementation RCTimelineDateEntryUserInfo

- (RCTimelineDateEntryUserInfo)initWithCurrentTime:(double)a3 recordingDuration:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RCTimelineDateEntryUserInfo;
  result = [(RCTimelineDateEntryUserInfo *)&v7 init];
  if (result)
  {
    result->_currentTime = a3;
    result->_recordingDuration = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (RCTimelineDateEntryUserInfo *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(RCTimelineDateEntryUserInfo *)self currentTime];
      double v7 = v6;
      [(RCTimelineDateEntryUserInfo *)v5 currentTime];
      BOOL v9 = v7 == v8;
      [(RCTimelineDateEntryUserInfo *)self recordingDuration];
      double v11 = v10;
      [(RCTimelineDateEntryUserInfo *)v5 recordingDuration];
      double v13 = v12;

      BOOL v14 = v11 == v13 && v9;
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  [(RCTimelineDateEntryUserInfo *)self currentTime];
  v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unint64_t v4 = (unint64_t)[v3 hash];
  [(RCTimelineDateEntryUserInfo *)self recordingDuration];
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  [(RCTimelineDateEntryUserInfo *)self currentTime];
  uint64_t v4 = v3;
  [(RCTimelineDateEntryUserInfo *)self recordingDuration];
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"currentTime = %f;  recordingDuration = %f",
           v4,
           v5);
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setRecordingDuration:(double)a3
{
  self->_recordingDuration = a3;
}

@end