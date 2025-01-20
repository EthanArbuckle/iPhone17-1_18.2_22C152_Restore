@interface WCM_CoexMonitorIOS
- (WCM_CoexMonitorIOS)init;
- (unint64_t)getCoexBandErrorCountFor:(int)a3;
- (unint64_t)getCoexCountDurationFor:(int)a3;
- (unint64_t)getCoexCountFor:(int)a3;
- (unint64_t)getCoexErrorCountFor:(int)a3;
- (void)updateCoexCondition:(int)a3 inBand:(int)a4 state:(BOOL)a5;
- (void)updateCoexDurationCount:(double)a3;
- (void)updateCoexErrorFor:(int)a3 inBand:(int)a4;
@end

@implementation WCM_CoexMonitorIOS

- (WCM_CoexMonitorIOS)init
{
  if (ADClientIsEnabled())
  {
    v5.receiver = self;
    v5.super_class = (Class)WCM_CoexMonitorIOS;
    result = [(WCM_CoexMonitor *)&v5 init];
    for (uint64_t i = 0; i != 4; ++i)
    {
      result->lteCoexStart[i] = 0;
      result->lteCoexConditionBand[i] = -1;
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Aggd is not enabled"];
    return 0;
  }
  return result;
}

- (void)updateCoexCondition:(int)a3 inBand:(int)a4 state:(BOOL)a5
{
  if (a3 < 4 || !a5)
  {
    if (a5)
    {
      uint64_t v6 = a3;
      if (!self->lteCoexStart[a3] || self->lteCoexConditionBand[a3] != a4)
      {
        unint64_t v7 = a4;
        self->lteCoexStart[a3] = ADMonotonicTimeGetCurrent();
        ++self->lteCoexCount[v6];
        self->lteCoexConditionBand[v6] = v7;
        ADClientAddValueForScalarKey();
        ADClientAddValueForScalarKey();
      }
    }
    else
    {
      lteCoexStart = self->lteCoexStart;
      if (a3 == 4)
      {
        for (uint64_t i = 0; i != 4; ++i)
        {
          if (lteCoexStart[i])
          {
            ADPushTimeIntervalForDistributionKeySinceStartTime();
            -[WCM_CoexMonitorIOS updateCoexDurationCount:](self, "updateCoexDurationCount:");
            lteCoexStart[i] = 0;
            self->lteCoexConditionBand[i] = -1;
          }
        }
      }
      else if (lteCoexStart[a3])
      {
        uint64_t v10 = a3;
        ADPushTimeIntervalForDistributionKeySinceStartTime();
        -[WCM_CoexMonitorIOS updateCoexDurationCount:](self, "updateCoexDurationCount:");
        lteCoexStart[v10] = 0;
        self->lteCoexConditionBand[v10] = -1;
      }
    }
  }
}

- (void)updateCoexDurationCount:(double)a3
{
  if (a3 <= 5.0)
  {
    uint64_t v3 = 0;
  }
  else if (a3 <= 30.0)
  {
    uint64_t v3 = 1;
  }
  else if (a3 <= 120.0)
  {
    uint64_t v3 = 2;
  }
  else if (a3 <= 300.0)
  {
    uint64_t v3 = 3;
  }
  else
  {
    uint64_t v3 = 4;
    if (a3 > 1800.0) {
      uint64_t v3 = 5;
    }
  }
  ++self->lteCoexDurationsCount[v3];
  ADClientAddValueForScalarKey();
}

- (void)updateCoexErrorFor:(int)a3 inBand:(int)a4
{
  if (a3 <= 4)
  {
    if (a3 != 4)
    {
      ++self->lteCoexConditionErrors[a3];
      ADClientAddValueForScalarKey();
    }
    ++self->lteCoexBandErrors[a4];
    ADClientAddValueForScalarKey();
  }
}

- (unint64_t)getCoexCountFor:(int)a3
{
  return self->lteCoexCount[a3];
}

- (unint64_t)getCoexCountDurationFor:(int)a3
{
  return self->lteCoexDurationsCount[a3];
}

- (unint64_t)getCoexErrorCountFor:(int)a3
{
  return self->lteCoexConditionErrors[a3];
}

- (unint64_t)getCoexBandErrorCountFor:(int)a3
{
  return self->lteCoexBandErrors[a3];
}

@end