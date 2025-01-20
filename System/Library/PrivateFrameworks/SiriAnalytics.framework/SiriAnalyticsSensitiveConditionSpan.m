@interface SiriAnalyticsSensitiveConditionSpan
- (BOOL)containsTimestamp:(unint64_t)a3;
- (BOOL)hasEndedAt;
- (SiriAnalyticsSensitiveConditionSpan)initWithConditionType:(int)a3 startedAt:(unint64_t)a4;
- (int)conditionType;
- (unint64_t)endedAt;
- (unint64_t)startedAt;
- (void)setConditionType:(int)a3;
- (void)setEndedAt:(unint64_t)a3;
- (void)setStartedAt:(unint64_t)a3;
@end

@implementation SiriAnalyticsSensitiveConditionSpan

- (unint64_t)endedAt
{
  return self->_endedAt;
}

- (unint64_t)startedAt
{
  return self->_startedAt;
}

- (void)setConditionType:(int)a3
{
  self->_conditionType = a3;
}

- (int)conditionType
{
  return self->_conditionType;
}

- (BOOL)containsTimestamp:(unint64_t)a3
{
  return self->_hasStartedAtValue && self->_startedAt <= a3 && (self->_endedAt >= a3 || !self->_hasEndedAtValue);
}

- (BOOL)hasEndedAt
{
  return self->_hasEndedAtValue;
}

- (void)setEndedAt:(unint64_t)a3
{
  self->_hasEndedAtValue = 1;
  self->_endedAt = a3;
}

- (void)setStartedAt:(unint64_t)a3
{
  self->_hasStartedAtValue = 1;
  self->_startedAt = a3;
}

- (SiriAnalyticsSensitiveConditionSpan)initWithConditionType:(int)a3 startedAt:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SiriAnalyticsSensitiveConditionSpan;
  v6 = [(SiriAnalyticsSensitiveConditionSpan *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_conditionType = a3;
    [(SiriAnalyticsSensitiveConditionSpan *)v6 setStartedAt:a4];
  }
  return v7;
}

@end