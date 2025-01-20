@interface SOSKappaStatus
- (BOOL)isKappaFlow;
- (BOOL)isKappaFlowActive;
- (SOSKappaStatus)init;
- (SOSKappaStatus)initWithSOSStatus:(id)a3;
- (SOSStatus)sosStatus;
- (id)description;
- (int64_t)sosKappaState;
- (void)setSosKappaState:(int64_t)a3;
@end

@implementation SOSKappaStatus

- (SOSKappaStatus)init
{
  return 0;
}

- (SOSKappaStatus)initWithSOSStatus:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOSKappaStatus;
  v6 = [(SOSKappaStatus *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sosStatus, a3);
  }

  return v7;
}

- (BOOL)isKappaFlow
{
  v2 = [(SOSKappaStatus *)self sosStatus];
  BOOL v3 = [v2 trigger] == 7;

  return v3;
}

- (BOOL)isKappaFlowActive
{
  BOOL v3 = [(SOSKappaStatus *)self isKappaFlow];
  if (v3)
  {
    v4 = [(SOSKappaStatus *)self sosStatus];
    char v5 = [v4 isFlowActiveAndNotResting];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)description
{
  v2 = [(SOSKappaStatus *)self sosStatus];
  BOOL v3 = [v2 description];

  return v3;
}

- (SOSStatus)sosStatus
{
  return self->_sosStatus;
}

- (int64_t)sosKappaState
{
  return self->_sosKappaState;
}

- (void)setSosKappaState:(int64_t)a3
{
  self->_sosKappaState = a3;
}

- (void).cxx_destruct
{
}

@end