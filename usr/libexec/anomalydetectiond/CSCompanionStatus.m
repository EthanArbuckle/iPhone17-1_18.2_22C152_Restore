@interface CSCompanionStatus
- ($2889772B1FD9C78F31F69BD8F09C608A)c_struct;
- (CSCompanionStatus)initWithTimestamp:(unint64_t)a3 code:(int)a4;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation CSCompanionStatus

- (CSCompanionStatus)initWithTimestamp:(unint64_t)a3 code:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CSCompanionStatus;
  result = [(CSCompanionStatus *)&v7 init];
  if (result)
  {
    result->_c_struct.timestamp = a3;
    result->_c_struct.code = a4;
  }
  return result;
}

- (unint64_t)timestamp
{
  return self->_c_struct.timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_c_struct.timestamp = a3;
}

- ($2889772B1FD9C78F31F69BD8F09C608A)c_struct
{
  return ($2889772B1FD9C78F31F69BD8F09C608A *)&self->_c_struct;
}

@end