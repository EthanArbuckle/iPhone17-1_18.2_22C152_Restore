@interface CSVTUITrainingResult
+ (BOOL)supportsSecureCoding;
- (CSVTUITrainingResult)initWithCoder:(id)a3;
- (CSVTUITrainingResult)initWithSessionId:(int64_t)a3 sessionStatus:(int)a4 audioStatus:(int)a5;
- (int)audioStatus;
- (int)sessionStatus;
- (int64_t)sessionId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CSVTUITrainingResult

- (int)audioStatus
{
  return self->_audioStatus;
}

- (int)sessionStatus
{
  return self->_sessionStatus;
}

- (int64_t)sessionId
{
  return self->_sessionId;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t sessionId = self->_sessionId;
  id v6 = a3;
  v7 = [v4 numberWithInteger:sessionId];
  [v6 encodeObject:v7 forKey:@"VTUITrainingResultSessionId"];

  v8 = [NSNumber numberWithLongLong:self->_sessionStatus];
  [v6 encodeObject:v8 forKey:@"VTUITrainingResultStatus"];

  id v9 = [NSNumber numberWithLongLong:self->_audioStatus];
  [v6 encodeObject:v9 forKey:@"VTUITrainingAudioStatus"];
}

- (CSVTUITrainingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VTUITrainingResultSessionId"];
  uint64_t v6 = [v5 longLongValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VTUITrainingResultStatus"];
  uint64_t v8 = [v7 longLongValue];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VTUITrainingAudioStatus"];

  uint64_t v10 = [v9 longLongValue];

  return [(CSVTUITrainingResult *)self initWithSessionId:v6 sessionStatus:v8 audioStatus:v10];
}

- (CSVTUITrainingResult)initWithSessionId:(int64_t)a3 sessionStatus:(int)a4 audioStatus:(int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CSVTUITrainingResult;
  result = [(CSVTUITrainingResult *)&v9 init];
  if (result)
  {
    result->_int64_t sessionId = a3;
    result->_sessionStatus = a4;
    result->_audioStatus = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end