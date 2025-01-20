@interface HRHandleInfo
- (BOOL)handleBlown;
- (HRHandleInfo)initWithHandleName:(unint64_t)a3 fenceName:(unint64_t)a4 traceStart:(unint64_t)a5 traceEnd:(unint64_t)a6;
- (unint64_t)fenceName;
- (unint64_t)handleBlownTime;
- (unint64_t)handleEndTime;
- (unint64_t)handleName;
- (unint64_t)handleStartTime;
- (void)setFenceName:(unint64_t)a3;
- (void)setHandleBlown:(BOOL)a3;
- (void)setHandleBlownTime:(unint64_t)a3;
- (void)setHandleEndTime:(unint64_t)a3;
- (void)setHandleName:(unint64_t)a3;
- (void)setHandleStartTime:(unint64_t)a3;
@end

@implementation HRHandleInfo

- (HRHandleInfo)initWithHandleName:(unint64_t)a3 fenceName:(unint64_t)a4 traceStart:(unint64_t)a5 traceEnd:(unint64_t)a6
{
  v13.receiver = self;
  v13.super_class = (Class)HRHandleInfo;
  v10 = [(HRHandleInfo *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(HRHandleInfo *)v10 setHandleName:a3];
    [(HRHandleInfo *)v11 setFenceName:a4];
    [(HRHandleInfo *)v11 setHandleStartTime:a5];
    [(HRHandleInfo *)v11 setHandleEndTime:a6];
    [(HRHandleInfo *)v11 setHandleBlown:0];
    [(HRHandleInfo *)v11 setHandleBlownTime:a6];
  }
  return v11;
}

- (unint64_t)fenceName
{
  return self->_fenceName;
}

- (void)setFenceName:(unint64_t)a3
{
  self->_fenceName = a3;
}

- (unint64_t)handleName
{
  return self->_handleName;
}

- (void)setHandleName:(unint64_t)a3
{
  self->_handleName = a3;
}

- (unint64_t)handleStartTime
{
  return self->_handleStartTime;
}

- (void)setHandleStartTime:(unint64_t)a3
{
  self->_handleStartTime = a3;
}

- (unint64_t)handleEndTime
{
  return self->_handleEndTime;
}

- (void)setHandleEndTime:(unint64_t)a3
{
  self->_handleEndTime = a3;
}

- (BOOL)handleBlown
{
  return self->_handleBlown;
}

- (void)setHandleBlown:(BOOL)a3
{
  self->_handleBlown = a3;
}

- (unint64_t)handleBlownTime
{
  return self->_handleBlownTime;
}

- (void)setHandleBlownTime:(unint64_t)a3
{
  self->_handleBlownTime = a3;
}

@end