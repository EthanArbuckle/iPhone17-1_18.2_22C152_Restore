@interface PLDisplayIOReportStats
- (PLDisplayAPLStats)displayAPLStats;
- (PLDisplayAZLStats)displayAZLStats;
- (PLDisplayIOReportStats)init;
- (void)setDisplayAPLStats:(id)a3;
- (void)setDisplayAZLStats:(id)a3;
@end

@implementation PLDisplayIOReportStats

- (PLDisplayIOReportStats)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod])
  {
    v3 = 0;
  }
  else
  {
    if (+[PLDisplayAgent shouldLogFromDCP])
    {
      if (objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 302024, 302027, 302025, 302028, 0))
      {
        v7.receiver = self;
        v7.super_class = (Class)PLDisplayIOReportStats;
        v4 = [(PLIOReportStats *)&v7 initWithGroup:@"DCP0" andSubGroup:@"display stats"];
      }
      else
      {
        v6.receiver = self;
        v6.super_class = (Class)PLDisplayIOReportStats;
        v4 = [(PLIOReportStats *)&v6 initWithGroup:@"DCP" andSubGroup:@"display stats"];
      }
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)PLDisplayIOReportStats;
      v4 = [(PLIOReportStats *)&v8 initWithGroup:@"IOMFB Reporting" andSubGroup:@"display stats"];
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (PLDisplayAPLStats)displayAPLStats
{
  return (PLDisplayAPLStats *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisplayAPLStats:(id)a3
{
}

- (PLDisplayAZLStats)displayAZLStats
{
  return (PLDisplayAZLStats *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisplayAZLStats:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAZLStats, 0);
  objc_storeStrong((id *)&self->_displayAPLStats, 0);
}

@end