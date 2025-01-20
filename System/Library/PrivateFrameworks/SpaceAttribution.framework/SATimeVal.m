@interface SATimeVal
- (timeval)getTimeValAddr;
- (timeval)timeVal;
- (void)setTimeVal:(timeval)a3;
@end

@implementation SATimeVal

- (timeval)getTimeValAddr
{
  return &self->_timeVal;
}

- (timeval)timeVal
{
  objc_copyStruct(v4, &self->_timeVal, 16, 1, 0);
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_usec = v3;
  result.tv_sec = v2;
  return result;
}

- (void)setTimeVal:(timeval)a3
{
  timeval v3 = a3;
  objc_copyStruct(&self->_timeVal, &v3, 16, 1, 0);
}

@end