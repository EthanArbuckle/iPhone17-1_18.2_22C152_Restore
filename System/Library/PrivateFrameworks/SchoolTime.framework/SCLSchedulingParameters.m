@interface SCLSchedulingParameters
- (BOOL)isSuppressed;
- (NSCalendar)calendar;
- (NSDate)evaluationDate;
- (SCLScheduleSettings)scheduleSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)activationSetting;
- (void)setActivationSetting:(unint64_t)a3;
- (void)setCalendar:(id)a3;
- (void)setEvaluationDate:(id)a3;
- (void)setScheduleSettings:(id)a3;
- (void)setSuppressed:(BOOL)a3;
@end

@implementation SCLSchedulingParameters

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SCLSchedulingParameters);
  v5 = [(SCLSchedulingParameters *)self calendar];
  [(SCLSchedulingParameters *)v4 setCalendar:v5];

  v6 = [(SCLSchedulingParameters *)self evaluationDate];
  [(SCLSchedulingParameters *)v4 setEvaluationDate:v6];

  v7 = [(SCLSchedulingParameters *)self scheduleSettings];
  [(SCLSchedulingParameters *)v4 setScheduleSettings:v7];

  [(SCLSchedulingParameters *)v4 setActivationSetting:[(SCLSchedulingParameters *)self activationSetting]];
  [(SCLSchedulingParameters *)v4 setSuppressed:[(SCLSchedulingParameters *)self isSuppressed]];
  return v4;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (NSDate)evaluationDate
{
  return self->_evaluationDate;
}

- (void)setEvaluationDate:(id)a3
{
}

- (SCLScheduleSettings)scheduleSettings
{
  return self->_scheduleSettings;
}

- (void)setScheduleSettings:(id)a3
{
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (void)setSuppressed:(BOOL)a3
{
  self->_suppressed = a3;
}

- (unint64_t)activationSetting
{
  return self->_activationSetting;
}

- (void)setActivationSetting:(unint64_t)a3
{
  self->_activationSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleSettings, 0);
  objc_storeStrong((id *)&self->_evaluationDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end