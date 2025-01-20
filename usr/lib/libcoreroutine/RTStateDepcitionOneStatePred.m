@interface RTStateDepcitionOneStatePred
- (NSUUID)stateUUID;
- (RTStateDepcitionOneStatePred)init;
- (RTStateDepictionOnePredEl)daily;
- (RTStateDepictionOnePredEl)weekly;
- (void)setDaily:(id)a3;
- (void)setStateUUID:(id)a3;
- (void)setWeekly:(id)a3;
@end

@implementation RTStateDepcitionOneStatePred

- (RTStateDepcitionOneStatePred)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTStateDepcitionOneStatePred;
  v2 = [(RTStateDepcitionOneStatePred *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(RTStateDepictionOnePredEl);
    [(RTStateDepcitionOneStatePred *)v2 setWeekly:v3];

    v4 = objc_alloc_init(RTStateDepictionOnePredEl);
    [(RTStateDepcitionOneStatePred *)v2 setDaily:v4];
  }
  return v2;
}

- (RTStateDepictionOnePredEl)weekly
{
  return self->_weekly;
}

- (void)setWeekly:(id)a3
{
}

- (RTStateDepictionOnePredEl)daily
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