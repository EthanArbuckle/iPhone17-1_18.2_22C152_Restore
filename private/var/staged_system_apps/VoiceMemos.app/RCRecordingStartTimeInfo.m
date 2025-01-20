@interface RCRecordingStartTimeInfo
+ (RCRecordingStartTimeInfo)infoWithCurrentDateAndTime;
- (NSDate)dateRecordingStartTime;
- (RCRecordingStartTimeInfo)initWithDateRecordingStartTime:(id)a3 initWithMachRecordingStartTime:(unint64_t)a4;
- (double)recordingDurationAtStartTime;
- (double)recordingTimeAtStartTime;
- (unint64_t)machRecordingStartTime;
- (void)setRecordingDurationAtStartTime:(double)a3;
- (void)setRecordingTimeAtStartTime:(double)a3;
@end

@implementation RCRecordingStartTimeInfo

+ (RCRecordingStartTimeInfo)infoWithCurrentDateAndTime
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[NSDate date];
  id v4 = [v2 initWithDateRecordingStartTime:v3 initWithMachRecordingStartTime:mach_absolute_time()];

  return (RCRecordingStartTimeInfo *)v4;
}

- (RCRecordingStartTimeInfo)initWithDateRecordingStartTime:(id)a3 initWithMachRecordingStartTime:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RCRecordingStartTimeInfo;
  v8 = [(RCRecordingStartTimeInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateRecordingStartTime, a3);
    v9->_machRecordingStartTime = a4;
  }

  return v9;
}

- (unint64_t)machRecordingStartTime
{
  return self->_machRecordingStartTime;
}

- (NSDate)dateRecordingStartTime
{
  return self->_dateRecordingStartTime;
}

- (double)recordingTimeAtStartTime
{
  return self->_recordingTimeAtStartTime;
}

- (void)setRecordingTimeAtStartTime:(double)a3
{
  self->_recordingTimeAtStartTime = a3;
}

- (double)recordingDurationAtStartTime
{
  return self->_recordingDurationAtStartTime;
}

- (void)setRecordingDurationAtStartTime:(double)a3
{
  self->_recordingDurationAtStartTime = a3;
}

- (void).cxx_destruct
{
}

@end