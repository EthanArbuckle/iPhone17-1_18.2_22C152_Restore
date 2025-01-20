@interface CSSPUHgAccel
- (CSSPUHgAccel)initWithTimestamp:(unint64_t)a3 x:(float)a4 y:(float)a5 z:(float)a6;
- (unsigned)kReportInterval;
@end

@implementation CSSPUHgAccel

- (CSSPUHgAccel)initWithTimestamp:(unint64_t)a3 x:(float)a4 y:(float)a5 z:(float)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CSSPUHgAccel;
  result = -[CSSPUTriad initWithTimestamp:x:y:z:](&v7, "initWithTimestamp:x:y:z:", a3);
  if (result) {
    result->_kReportInterval = 312;
  }
  return result;
}

- (unsigned)kReportInterval
{
  return self->_kReportInterval;
}

@end