@interface AppActivationTimeInfo
- (AppActivationTimeInfo)init;
- (double)totalLaunchActivationTime;
- (double)totalResumeActivationTime;
- (id)description;
- (int)launchCount;
- (int)resumeCount;
- (void)setLaunchCount:(int)a3;
- (void)setResumeCount:(int)a3;
- (void)setTotalLaunchActivationTime:(double)a3;
- (void)setTotalResumeActivationTime:(double)a3;
@end

@implementation AppActivationTimeInfo

- (AppActivationTimeInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)AppActivationTimeInfo;
  result = [(AppActivationTimeInfo *)&v3 init];
  if (result)
  {
    *(void *)&result->_launchCount = 0;
    result->_totalLaunchActivationTime = 0.0;
    result->_totalResumeActivationTime = 0.0;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"Cold Launches: %d -- Total Launch Activation Time: %f ***** Resumes: %d - Total Resume Activation Time %f", self->_launchCount, *(void *)&self->_totalLaunchActivationTime, self->_resumeCount, *(void *)&self->_totalResumeActivationTime];
}

- (int)launchCount
{
  return self->_launchCount;
}

- (void)setLaunchCount:(int)a3
{
  self->_launchCount = a3;
}

- (int)resumeCount
{
  return self->_resumeCount;
}

- (void)setResumeCount:(int)a3
{
  self->_resumeCount = a3;
}

- (double)totalLaunchActivationTime
{
  return self->_totalLaunchActivationTime;
}

- (void)setTotalLaunchActivationTime:(double)a3
{
  self->_totalLaunchActivationTime = a3;
}

- (double)totalResumeActivationTime
{
  return self->_totalResumeActivationTime;
}

- (void)setTotalResumeActivationTime:(double)a3
{
  self->_totalResumeActivationTime = a3;
}

@end