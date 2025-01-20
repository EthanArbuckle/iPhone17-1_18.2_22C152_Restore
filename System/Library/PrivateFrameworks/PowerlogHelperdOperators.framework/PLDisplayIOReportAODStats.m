@interface PLDisplayIOReportAODStats
- (PLDisplayAODStats)displayAODStats;
- (PLDisplayIOReportAODStats)init;
- (void)setDisplayAODStats:(id)a3;
@end

@implementation PLDisplayIOReportAODStats

- (PLDisplayIOReportAODStats)init
{
  if (+[PLDisplayAgent shouldLogFromDCP])
  {
    v5.receiver = self;
    v5.super_class = (Class)PLDisplayIOReportAODStats;
    self = [(PLIOReportStats *)&v5 initWithGroup:@"DCP" andSubGroup:@"aod stats"];
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (PLDisplayAODStats)displayAODStats
{
  return (PLDisplayAODStats *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisplayAODStats:(id)a3
{
}

- (void).cxx_destruct
{
}

@end