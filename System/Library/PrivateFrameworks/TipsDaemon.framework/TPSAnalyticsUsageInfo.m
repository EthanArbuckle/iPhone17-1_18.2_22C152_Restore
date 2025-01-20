@interface TPSAnalyticsUsageInfo
- (BOOL)overrideHoldout;
- (NSDate)firstShownDate;
- (NSDate)notifiedDate;
- (NSString)identifier;
- (TPSContextualBiomeEvent)usageEvent;
- (unint64_t)desiredOutcomeCount;
- (void)setDesiredOutcomeCount:(unint64_t)a3;
- (void)setFirstShownDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setNotifiedDate:(id)a3;
- (void)setOverrideHoldout:(BOOL)a3;
- (void)setUsageEvent:(id)a3;
@end

@implementation TPSAnalyticsUsageInfo

- (BOOL)overrideHoldout
{
  return self->_overrideHoldout;
}

- (void)setOverrideHoldout:(BOOL)a3
{
  self->_overrideHoldout = a3;
}

- (NSDate)firstShownDate
{
  return self->_firstShownDate;
}

- (void)setFirstShownDate:(id)a3
{
}

- (NSDate)notifiedDate
{
  return self->_notifiedDate;
}

- (void)setNotifiedDate:(id)a3
{
}

- (TPSContextualBiomeEvent)usageEvent
{
  return self->_usageEvent;
}

- (void)setUsageEvent:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)desiredOutcomeCount
{
  return self->_desiredOutcomeCount;
}

- (void)setDesiredOutcomeCount:(unint64_t)a3
{
  self->_desiredOutcomeCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_usageEvent, 0);
  objc_storeStrong((id *)&self->_notifiedDate, 0);

  objc_storeStrong((id *)&self->_firstShownDate, 0);
}

@end