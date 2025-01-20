@interface VMULeaksAnalyzer
- (const)analyzerName;
- (id)analysisSummaryWithError:(id *)a3;
@end

@implementation VMULeaksAnalyzer

- (const)analyzerName
{
  return "LEAKS";
}

- (id)analysisSummaryWithError:(id *)a3
{
  v4 = [[VMULeakDetector alloc] initWithVMUTask:0 graph:self->super._graph scanner:0 stackLogReader:0];
  id v15 = 0;
  unsigned int v5 = [(VMULeakDetector *)v4 detectLeaksWithError:&v15];
  id v6 = v15;
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    if (a3) {
      *a3 = v6;
    }
  }
  else
  {
    v8 = objc_opt_new();
    v9 = [VMUAnalyzerSummaryField alloc];
    if (v5)
    {
      v10 = [(VMUAnalyzerSummaryField *)v9 initWithKey:@"Allocations count" numericalValue:[(VMULeakDetector *)v4 allocationsCount] objectValue:0 fieldType:1];
      [v8 addObject:v10];
      v11 = [[VMUAnalyzerSummaryField alloc] initWithKey:@"Allocations size" numericalValue:[(VMULeakDetector *)v4 allocationsSize] objectValue:0 fieldType:2];

      [v8 addObject:v11];
      v12 = [[VMUAnalyzerSummaryField alloc] initWithKey:@"Leaks count" numericalValue:[(VMULeakDetector *)v4 leakedAllocationsCount] objectValue:0 fieldType:1];

      [v8 addObject:v12];
      v13 = [[VMUAnalyzerSummaryField alloc] initWithKey:@"Leaks total size" numericalValue:[(VMULeakDetector *)v4 leakedAllocationsSize] objectValue:0 fieldType:2];
    }
    else
    {
      v13 = [(VMUAnalyzerSummaryField *)v9 initWithKey:kVMUAnalysisSummaryKey[0] numericalValue:0 objectValue:@"No leaks detected" fieldType:0];
    }
    [v8 addObject:v13];
  }

  return v8;
}

@end