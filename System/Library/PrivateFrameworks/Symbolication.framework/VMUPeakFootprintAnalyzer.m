@interface VMUPeakFootprintAnalyzer
- (const)analyzerName;
- (id)analysisSummaryWithError:(id *)a3;
@end

@implementation VMUPeakFootprintAnalyzer

- (const)analyzerName
{
  return "PEAK FOOTPRINT";
}

- (id)analysisSummaryWithError:(id *)a3
{
  unint64_t v4 = [(VMUProcessObjectGraph *)self->super._graph physicalFootprint];
  unint64_t v5 = [(VMUProcessObjectGraph *)self->super._graph physicalFootprintPeak];
  v6 = objc_opt_new();
  v7 = [[VMUAnalyzerSummaryField alloc] initWithKey:@"Physical footprint" numericalValue:v4 objectValue:0 fieldType:2];
  [v6 addObject:v7];
  v8 = [[VMUAnalyzerSummaryField alloc] initWithKey:@"Physical footprint (peak)" numericalValue:v5 objectValue:0 fieldType:2];

  [v6 addObject:v8];
  float v9 = (float)v5 / (float)v4;
  if (v9 > 1.25)
  {
    v10 = [NSString stringWithFormat:@"Peak physical footprint was %.2f times higher than current -- past memory use was much higher. This can be analyzed with the Allocations instrument", v9];
    v11 = [VMUAnalyzerSummaryField alloc];
    uint64_t v12 = [(VMUAnalyzerSummaryField *)v11 initWithKey:kVMUAnalysisSummaryKey[0] numericalValue:0 objectValue:v10 fieldType:0];

    [v6 addObject:v12];
    v8 = (VMUAnalyzerSummaryField *)v12;
  }

  return v6;
}

@end