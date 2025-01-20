@interface TMTimeSynthesizerStates
- (double)rateSf;
- (double)rtc;
- (double)sf_var;
- (double)utc;
- (double)utc_sf_cov;
- (double)utc_var;
- (id)description;
- (void)setRateSf:(double)a3;
- (void)setRtc:(double)a3;
- (void)setSf_var:(double)a3;
- (void)setUtc:(double)a3;
- (void)setUtc_sf_cov:(double)a3;
- (void)setUtc_var:(double)a3;
@end

@implementation TMTimeSynthesizerStates

- (id)description
{
  [(TMTimeSynthesizerStates *)self rtc];
  uint64_t v4 = v3;
  [(TMTimeSynthesizerStates *)self utc];
  uint64_t v6 = v5;
  [(TMTimeSynthesizerStates *)self rateSf];
  uint64_t v8 = v7;
  [(TMTimeSynthesizerStates *)self utc_var];
  double v10 = sqrt(v9);
  [(TMTimeSynthesizerStates *)self sf_var];
  return +[NSString stringWithFormat:@"rtc,%.3lf,utc,%.3lf,sf,%.8lf,utcStd,%.8lf,sfStd,%.8lf", v4, v6, v8, *(void *)&v10, sqrt(v11)];
}

- (double)rtc
{
  return self->_rtc;
}

- (void)setRtc:(double)a3
{
  self->_rtc = a3;
}

- (double)utc
{
  return self->_utc;
}

- (void)setUtc:(double)a3
{
  self->_utc = a3;
}

- (double)rateSf
{
  return self->_rateSf;
}

- (void)setRateSf:(double)a3
{
  self->_rateSf = a3;
}

- (double)utc_var
{
  return self->_utc_var;
}

- (void)setUtc_var:(double)a3
{
  self->_utc_var = a3;
}

- (double)sf_var
{
  return self->_sf_var;
}

- (void)setSf_var:(double)a3
{
  self->_sf_var = a3;
}

- (double)utc_sf_cov
{
  return self->_utc_sf_cov;
}

- (void)setUtc_sf_cov:(double)a3
{
  self->_utc_sf_cov = a3;
}

@end