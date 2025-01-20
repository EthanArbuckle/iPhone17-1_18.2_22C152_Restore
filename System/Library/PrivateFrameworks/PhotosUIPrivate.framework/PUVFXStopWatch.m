@interface PUVFXStopWatch
- (OS_os_log)log;
- (PUVFXStopWatch)initWithLog:(id)a3;
- (unint64_t)sid;
- (void)setLog:(id)a3;
- (void)setSid:(unint64_t)a3;
@end

@implementation PUVFXStopWatch

- (void)setLog:(id)a3
{
  self->_log = (OS_os_log *)a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setSid:(unint64_t)a3
{
  self->_sid = a3;
}

- (unint64_t)sid
{
  return self->_sid;
}

- (PUVFXStopWatch)initWithLog:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUVFXStopWatch;
  result = [(PUVFXStopWatch *)&v5 init];
  result->_log = (OS_os_log *)a3;
  return result;
}

@end