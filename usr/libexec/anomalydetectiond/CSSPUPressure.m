@interface CSSPUPressure
- (CSSPUPressure)initWithTimestamp:(unint64_t)a3 pressure:(float)a4 temperature:(float)a5;
- (FastUncompPressure)c_struct;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation CSSPUPressure

- (CSSPUPressure)initWithTimestamp:(unint64_t)a3 pressure:(float)a4 temperature:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CSSPUPressure;
  result = [(CSSPUPressure *)&v9 init];
  if (result)
  {
    result->_c_struct.timestamp = a3;
    result->_c_struct.pressure = a4;
    result->_c_struct.temperature = a5;
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

- (FastUncompPressure)c_struct
{
  return &self->_c_struct;
}

@end