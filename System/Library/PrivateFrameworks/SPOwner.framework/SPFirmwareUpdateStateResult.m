@interface SPFirmwareUpdateStateResult
+ (BOOL)supportsSecureCoding;
- (NSDate)stateDate;
- (NSError)error;
- (NSString)currentSystemVersion;
- (SPFirmwareUpdateStateResult)initWithCoder:(id)a3;
- (id)description;
- (id)dictionary;
- (id)firmwareUpdateState;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentSystemVersion:(id)a3;
- (void)setError:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStateDate:(id)a3;
@end

@implementation SPFirmwareUpdateStateResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInteger:state forKey:@"state"];
  [v5 encodeObject:self->_stateDate forKey:@"stateDate"];
  [v5 encodeObject:self->_currentSystemVersion forKey:@"currentSystemVersion"];
  [v5 encodeObject:self->_error forKey:@"error"];
}

- (SPFirmwareUpdateStateResult)initWithCoder:(id)a3
{
  id v4 = a3;
  self->_int64_t state = [v4 decodeIntegerForKey:@"state"];
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stateDate"];
  stateDate = self->_stateDate;
  self->_stateDate = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentSystemVersion"];
  currentSystemVersion = self->_currentSystemVersion;
  self->_currentSystemVersion = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];

  error = self->_error;
  self->_error = v9;

  return self;
}

- (id)firmwareUpdateState
{
  int64_t v2 = [(SPFirmwareUpdateStateResult *)self state];
  if ((unint64_t)(v2 + 1) > 7) {
    return @"completed";
  }
  else {
    return off_1E601B988[v2 + 1];
  }
}

- (id)dictionary
{
  v3 = objc_opt_new();
  id v4 = [(SPFirmwareUpdateStateResult *)self firmwareUpdateState];
  [v3 setObject:v4 forKeyedSubscript:@"FirmwareUpdateState"];

  id v5 = [(SPFirmwareUpdateStateResult *)self stateDate];
  [v3 setObject:v5 forKeyedSubscript:@"Date"];

  v6 = [(SPFirmwareUpdateStateResult *)self currentSystemVersion];
  [v3 setObject:v6 forKeyedSubscript:@"SystemVersion"];

  v7 = [(SPFirmwareUpdateStateResult *)self error];
  [v3 setObject:v7 forKeyedSubscript:@"Error"];

  v8 = (void *)[v3 copy];

  return v8;
}

- (id)description
{
  int64_t v2 = [(SPFirmwareUpdateStateResult *)self dictionary];
  v3 = [v2 description];

  return v3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (NSDate)stateDate
{
  return self->_stateDate;
}

- (void)setStateDate:(id)a3
{
}

- (NSString)currentSystemVersion
{
  return self->_currentSystemVersion;
}

- (void)setCurrentSystemVersion:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_currentSystemVersion, 0);

  objc_storeStrong((id *)&self->_stateDate, 0);
}

@end