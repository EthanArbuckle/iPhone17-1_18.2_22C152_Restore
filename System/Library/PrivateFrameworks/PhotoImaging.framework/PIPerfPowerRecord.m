@interface PIPerfPowerRecord
- (NSDate)endTime;
- (NSDate)startTime;
- (NSDictionary)payload;
- (PPSTelemetryIdentifier)identifier;
- (int64_t)operation;
- (void)setEndTime:(id)a3;
- (void)setIdentifier:(PPSTelemetryIdentifier *)a3;
- (void)setOperation:(int64_t)a3;
- (void)setStartTime:(id)a3;
@end

@implementation PIPerfPowerRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

- (void)setEndTime:(id)a3
{
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setIdentifier:(PPSTelemetryIdentifier *)a3
{
  self->_identifier = a3;
}

- (PPSTelemetryIdentifier)identifier
{
  return self->_identifier;
}

- (NSDictionary)payload
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = [(PIPerfPowerRecord *)self endTime];
  v4 = [(PIPerfPowerRecord *)self startTime];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  v13[0] = @"durationInSeconds";
  v7 = [NSNumber numberWithDouble:v6];
  v14[0] = v7;
  v13[1] = @"startTime";
  v8 = [(PIPerfPowerRecord *)self startTime];
  v14[1] = v8;
  v13[2] = @"endTime";
  v9 = [(PIPerfPowerRecord *)self endTime];
  v14[2] = v9;
  v13[3] = @"operation";
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[PIPerfPowerRecord operation](self, "operation"));
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  return (NSDictionary *)v11;
}

@end