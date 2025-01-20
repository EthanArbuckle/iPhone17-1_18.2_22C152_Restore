@interface WFTemperature(NWMComparison)
- (double)nwm_percentageBetweenLow:()NWMComparison high:;
- (uint64_t)nwm_compare:()NWMComparison;
@end

@implementation WFTemperature(NWMComparison)

- (uint64_t)nwm_compare:()NWMComparison
{
  id v4 = a3;
  [a1 celsius];
  double v6 = v5;
  [v4 celsius];
  if (v6 >= v7)
  {
    [a1 celsius];
    double v10 = v9;
    [v4 celsius];
    uint64_t v8 = v10 > v11;
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

- (double)nwm_percentageBetweenLow:()NWMComparison high:
{
  id v6 = a4;
  id v7 = a3;
  [a1 celsius];
  double v9 = v8;
  [v7 celsius];
  double v11 = v9 - v10;
  [v6 celsius];
  double v13 = v12;

  [v7 celsius];
  double v15 = v14;

  double v16 = v11 / (v13 - v15);
  if (v16 > 1.0) {
    double v16 = 1.0;
  }
  return fmax(v16, 0.0);
}

@end