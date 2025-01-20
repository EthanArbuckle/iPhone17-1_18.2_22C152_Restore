@interface RTStateTransitionOneTransPred
- (NSUUID)stateUUID;
- (RTStateTransitionOnePredEl)daily;
- (RTStateTransitionOnePredEl)weekly;
- (RTStateTransitionOneTransPred)init;
- (void)setDaily:(id)a3;
- (void)setStateUUID:(id)a3;
- (void)setWeekly:(id)a3;
@end

@implementation RTStateTransitionOneTransPred

- (RTStateTransitionOneTransPred)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTStateTransitionOneTransPred;
  v2 = [(RTStateTransitionOneTransPred *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(RTStateTransitionOnePredEl);
    [(RTStateTransitionOneTransPred *)v2 setWeekly:v3];

    v4 = objc_alloc_init(RTStateTransitionOnePredEl);
    [(RTStateTransitionOneTransPred *)v2 setDaily:v4];
  }
  return v2;
}

- (RTStateTransitionOnePredEl)weekly
{
  return self->_weekly;
}

- (void)setWeekly:(id)a3
{
}

- (RTStateTransitionOnePredEl)daily
{
  return self->_daily;
}

- (void)setDaily:(id)a3
{
}

- (NSUUID)stateUUID
{
  return self->_stateUUID;
}

- (void)setStateUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUUID, 0);
  objc_storeStrong((id *)&self->_daily, 0);

  objc_storeStrong((id *)&self->_weekly, 0);
}

@end