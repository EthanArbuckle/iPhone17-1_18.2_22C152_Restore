@interface VUIMediaStartTimeInfo
- (NSDate)timestamp;
- (NSNumber)startTime;
- (NSString)source;
- (VUIMediaStartTimeInfo)initWithStartTime:(id)a3 timestamp:(id)a4 type:(int64_t)a5 source:(id)a6;
- (id)description;
- (int64_t)type;
- (void)setSource:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation VUIMediaStartTimeInfo

- (VUIMediaStartTimeInfo)initWithStartTime:(id)a3 timestamp:(id)a4 type:(int64_t)a5 source:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)VUIMediaStartTimeInfo;
  v14 = [(VUIMediaStartTimeInfo *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_startTime, a3);
    objc_storeStrong((id *)&v15->_timestamp, a4);
    v15->_type = a5;
    objc_storeStrong((id *)&v15->_source, a6);
  }

  return v15;
}

- (id)description
{
  if ([(VUIMediaStartTimeInfo *)self type])
  {
    if ([(VUIMediaStartTimeInfo *)self type] == 1) {
      v3 = @"relative to main content";
    }
    else {
      v3 = @"unknown";
    }
  }
  else
  {
    v3 = @"absolute";
  }
  v4 = NSString;
  v5 = [(VUIMediaStartTimeInfo *)self startTime];
  v6 = [(VUIMediaStartTimeInfo *)self timestamp];
  v7 = [(VUIMediaStartTimeInfo *)self source];
  v8 = [v4 stringWithFormat:@"start time: %@, timestamp: %@, type: %@, source: %@", v5, v6, v3, v7];

  return v8;
}

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end