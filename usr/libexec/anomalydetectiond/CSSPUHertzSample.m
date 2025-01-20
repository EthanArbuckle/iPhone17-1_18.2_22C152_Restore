@interface CSSPUHertzSample
- ($E272AD5D86549EDF00629498E6BE4065)c_struct;
- (CSSPUHertzSample)initWithTimestamp:(unint64_t)a3 dramDurationMs:(unsigned __int16)a4 vehicularFlags:(unsigned __int8)a5;
- (unint64_t)timestamp;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation CSSPUHertzSample

- (CSSPUHertzSample)initWithTimestamp:(unint64_t)a3 dramDurationMs:(unsigned __int16)a4 vehicularFlags:(unsigned __int8)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CSSPUHertzSample;
  result = [(CSSPUHertzSample *)&v9 init];
  if (result)
  {
    result->_c_struct.timestamp = a3;
    result->_c_struct.dramDurationMs = a4;
    result->_c_struct.vehicularFlags = a5;
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

- ($E272AD5D86549EDF00629498E6BE4065)c_struct
{
  return ($E272AD5D86549EDF00629498E6BE4065 *)&self->_c_struct;
}

@end