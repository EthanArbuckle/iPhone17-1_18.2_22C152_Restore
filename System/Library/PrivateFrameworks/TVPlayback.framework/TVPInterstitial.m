@interface TVPInterstitial
- (TVPTimeRange)timeRange;
- (id)description;
- (void)setTimeRange:(id)a3;
@end

@implementation TVPInterstitial

- (id)description
{
  v2 = [(TVPInterstitial *)self timeRange];
  v3 = [v2 description];

  return v3;
}

- (TVPTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
}

- (void).cxx_destruct
{
}

@end