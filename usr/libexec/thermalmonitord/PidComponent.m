@interface PidComponent
- (BOOL)allowCEOverride;
- (BOOL)isEqualMType:(int)a3;
- (BOOL)isIntegratorAtMin;
- (__CFString)nameofComponent;
- (float)TARGET;
- (float)integrator;
- (id)initPIDWith:(__CFDictionary *)a3;
- (int)controlEffort;
- (int)mitigationType;
- (void)applySeedToIntegratorFromControlEffort:(int)a3 currentTemperature:(float)a4;
- (void)calculateControlEffort:(float)a3;
- (void)dealloc;
- (void)setAllowCEOverride:(BOOL)a3;
- (void)setControlEffort:(int)a3;
- (void)setTARGET:(float)a3;
@end

@implementation PidComponent

- (int)mitigationType
{
  return self->mitigationType;
}

- (int)controlEffort
{
  return self->controlEffort;
}

- (id)initPIDWith:(__CFDictionary *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PidComponent;
  v4 = [(PidComponent *)&v7 init];
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      sub_100008280(a3, @"kp", kCFNumberFloatType, &v4->kp);
      sub_100008280(a3, @"ki", kCFNumberFloatType, &v5->ki);
      sub_100008280(a3, @"ts", kCFNumberFloatType, &v5->ts);
      sub_100008280(a3, @"intMin", kCFNumberFloatType, &v5->integratorMin);
      sub_100008280(a3, @"intMax", kCFNumberFloatType, &v5->integratorMax);
      sub_100008280(a3, @"target", kCFNumberFloatType, &v5->TARGET);
      v5->engageDelta = 0.0;
      sub_100008280(a3, @"engageDelta", kCFNumberFloatType, &v5->engageDelta);
    }
    v5->allowCEOverride = 0;
    v5->mitigationType = -1;
    v5->nameofComponent = 0;
    *(void *)&v5->boundCheckLow = 0xFF00000000;
  }
  return v5;
}

- (void)dealloc
{
  nameofComponent = self->nameofComponent;
  if (nameofComponent) {
    CFRelease(nameofComponent);
  }
  v4.receiver = self;
  v4.super_class = (Class)PidComponent;
  [(PidComponent *)&v4 dealloc];
}

- (void)calculateControlEffort:(float)a3
{
  float v3 = self->TARGET - a3;
  float integratorMin = self->integratorMin;
  float v5 = self->integrator + (float)((float)(self->ki * self->ts) * v3);
  self->integrator = v5;
  if (v5 < integratorMin)
  {
    self->integrator = integratorMin;
    float v5 = integratorMin;
  }
  float integratorMax = self->integratorMax;
  if (v5 > integratorMax)
  {
    self->integrator = integratorMax;
    float v5 = integratorMax;
  }
  if (!self->allowCEOverride)
  {
    int boundCheckLow = (int)(float)(v5 + (float)(self->kp * (float)(v3 - self->engageDelta)));
    if (self->boundCheckLow > boundCheckLow) {
      int boundCheckLow = self->boundCheckLow;
    }
    if (boundCheckLow >= self->boundCheckHigh) {
      int boundCheckLow = self->boundCheckHigh;
    }
    self->controlEffort = boundCheckLow;
  }
}

- (BOOL)isEqualMType:(int)a3
{
  return self->mitigationType == a3;
}

- (BOOL)isIntegratorAtMin
{
  return self->integrator == self->integratorMin;
}

- (void)applySeedToIntegratorFromControlEffort:(int)a3 currentTemperature:(float)a4
{
  int boundCheckLow = self->boundCheckLow;
  if (boundCheckLow <= a3) {
    int boundCheckLow = a3;
  }
  float v5 = self->TARGET - a4;
  if (boundCheckLow >= self->boundCheckHigh) {
    int boundCheckLow = self->boundCheckHigh;
  }
  float v6 = (float)(int)(float)((float)boundCheckLow - (float)(v5 * self->kp));
  self->integrator = v6;
  float integratorMin = self->integratorMin;
  if (integratorMin > v6)
  {
    self->integrator = integratorMin;
    float v6 = integratorMin;
  }
  float integratorMax = self->integratorMax;
  if (v6 > integratorMax)
  {
    self->integrator = integratorMax;
    float v6 = integratorMax;
  }
  v9 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    double v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> Setting integral component to %f", (uint8_t *)&v10, 0xCu);
  }
}

- (BOOL)allowCEOverride
{
  return self->allowCEOverride;
}

- (void)setAllowCEOverride:(BOOL)a3
{
  self->allowCEOverride = a3;
}

- (void)setControlEffort:(int)a3
{
  self->controlEffort = a3;
}

- (__CFString)nameofComponent
{
  return self->nameofComponent;
}

- (float)integrator
{
  return self->integrator;
}

- (float)TARGET
{
  return self->TARGET;
}

- (void)setTARGET:(float)a3
{
  self->TARGET = a3;
}

@end