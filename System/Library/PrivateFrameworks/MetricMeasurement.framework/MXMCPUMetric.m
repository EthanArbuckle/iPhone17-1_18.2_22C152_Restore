@interface MXMCPUMetric
+ (MXMCPUMetric)currentProcess;
+ (MXMCPUMetric)instrumentThread;
- (BOOL)_shouldConstructProbe;
- (BOOL)harvestData:(id *)a3 error:(id *)a4;
- (MXMCPUMetric)initWithBundleIdentifier:(id)a3;
- (MXMCPUMetric)initWithIdentifier:(id)a3 filter:(id)a4;
- (MXMCPUMetric)initWithProcessIdentifier:(int)a3;
- (MXMCPUMetric)initWithProcessName:(id)a3;
- (NSNumber)processIdentifier;
- (NSString)processName;
- (id)_constructProbe;
@end

@implementation MXMCPUMetric

+ (MXMCPUMetric)currentProcess
{
  v2 = [[MXMCPUMetric alloc] initWithProcessIdentifier:getpid()];
  return v2;
}

+ (MXMCPUMetric)instrumentThread
{
  v2 = [[MXMCPUMetric alloc] initWithIdentifier:@"com.apple.metricmeasurement.metrics.cpu" filter:0];
  return v2;
}

- (MXMCPUMetric)initWithProcessIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [MXMSampleTagFilter alloc];
  v6 = +[MXMUtilizationSampleTag CPU];
  v7 = [(MXMSampleTagFilter *)v5 initWithTag:v6 allowDescendents:1];

  v8 = [MXMSampleAttributeFilter alloc];
  v9 = [NSNumber numberWithInt:v3];
  v10 = [(MXMSampleAttributeFilter *)v8 initWithAttributeName:@"Process Identifier" numericValue:v9];

  v11 = [MXMSampleFilter alloc];
  v12 = [MEMORY[0x263EFFA08] setWithObject:v10];
  v13 = [MEMORY[0x263EFFA08] setWithObject:v7];
  v14 = [(MXMSampleFilter *)v11 initWithAttributeFilters:v12 tagFilters:v13];

  v15 = [(MXMCPUMetric *)self initWithIdentifier:@"com.apple.metricmeasurement.metrics.cpu" filter:v14];
  return v15;
}

- (MXMCPUMetric)initWithProcessName:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [MXMSampleTagFilter alloc];
    v6 = +[MXMUtilizationSampleTag CPU];
    v7 = [(MXMSampleTagFilter *)v5 initWithTag:v6 allowDescendents:1];

    v8 = [[MXMSampleAttributeFilter alloc] initWithAttributeName:@"Process Name" stringValue:v4];
    v9 = [MXMSampleFilter alloc];
    v10 = [MEMORY[0x263EFFA08] setWithObject:v8];
    v11 = [MEMORY[0x263EFFA08] setWithObject:v7];
    v12 = [(MXMSampleFilter *)v9 initWithAttributeFilters:v10 tagFilters:v11];

    self = [(MXMCPUMetric *)self initWithIdentifier:@"com.apple.metricmeasurement.metrics.cpu" filter:v12];
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (MXMCPUMetric)initWithBundleIdentifier:(id)a3
{
  id v4 = +[MXMMachUtils _processNameWithBundleIdentifier:a3];
  v5 = [(MXMCPUMetric *)self initWithProcessName:v4];

  return v5;
}

- (MXMCPUMetric)initWithIdentifier:(id)a3 filter:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MXMCPUMetric;
  id v4 = [(MXMMetric *)&v7 initWithIdentifier:a3 filter:a4];
  v5 = v4;
  if (v4) {
    [(MXMMetric *)v4 setPreferredSampleMode:3];
  }
  return v5;
}

- (NSString)processName
{
  v2 = [(MXMMetric *)self filter];
  uint64_t v3 = [v2 attributeFilterWithName:@"Process Name"];
  id v4 = [v3 stringValue];

  return (NSString *)v4;
}

- (NSNumber)processIdentifier
{
  v2 = [(MXMMetric *)self filter];
  uint64_t v3 = [v2 attributeFilterWithName:@"Process Identifier"];
  id v4 = [v3 numericValue];

  return (NSNumber *)v4;
}

- (BOOL)_shouldConstructProbe
{
  v2 = [(MXMMetric *)self filter];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_constructProbe
{
  v2 = objc_alloc_init(MXMResourceProbe);
  return v2;
}

- (BOOL)harvestData:(id *)a3 error:(id *)a4
{
  v32[2] = *MEMORY[0x263EF8340];
  v8 = [(MXMMetric *)self filter];

  if (v8)
  {
    v30.receiver = self;
    v30.super_class = (Class)MXMCPUMetric;
    return [(MXMMetric *)&v30 harvestData:a3 error:a4];
  }
  else
  {
    v10 = +[MXMInstrument activeInstrument];
    uint64_t v11 = [v10 currentIteration];

    if (v11)
    {
      v12 = (void *)MEMORY[0x263EFFA08];
      v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v11 + 16)];
      v14 = +[MXMSampleAttribute attributeWithName:@"Thread Identifier" numericValue:v13];
      v15 = [v12 setWithObject:v14];

      if (!*(void *)(v11 + 40))
      {
        v26 = [MEMORY[0x263F08690] currentHandler];
        [v26 handleFailureInMethod:a2, self, @"MXMCPUMetric.m", 97, @"Invalid parameter not satisfying: %@", @"iteration->startTime > 0" object file lineNumber description];
      }
      if (!*(void *)(v11 + 48))
      {
        v27 = [MEMORY[0x263F08690] currentHandler];
        [v27 handleFailureInMethod:a2, self, @"MXMCPUMetric.m", 98, @"Invalid parameter not satisfying: %@", @"iteration->stopTime > 0" object file lineNumber description];
      }
      if (!*(void *)(v11 + 88))
      {
        v28 = [MEMORY[0x263F08690] currentHandler];
        [v28 handleFailureInMethod:a2, self, @"MXMCPUMetric.m", 99, @"Invalid parameter not satisfying: %@", @"iteration->startThreadCounts.instructions > 0" object file lineNumber description];
      }
      if (!*(void *)(v11 + 104))
      {
        v29 = [MEMORY[0x263F08690] currentHandler];
        [v29 handleFailureInMethod:a2, self, @"MXMCPUMetric.m", 100, @"Invalid parameter not satisfying: %@", @"iteration->stopThreadCounts.instructions > 0" object file lineNumber description];
      }
      v16 = objc_alloc_init(MXMMutableSampleData);
      +[MXMMachUtils _nanosecondsWithAbsoluteTime:*(void *)(v11 + 40)];
      v32[0] = (unint64_t)v17;
      +[MXMMachUtils _nanosecondsWithAbsoluteTime:*(void *)(v11 + 48)];
      v32[1] = (unint64_t)v18;
      double v19 = (double)*(unint64_t *)(v11 + 104);
      v31[0] = (double)*(unint64_t *)(v11 + 88);
      v31[1] = v19;
      v20 = [[MXMSampleTimeSeries alloc] initWithAbsoluteTimeSeries:v32 length:2];
      v21 = [MXMSampleSet alloc];
      v22 = +[MXMUtilizationSampleTag CPUInstructions];
      v23 = +[MXMUnitInstruction baseUnit];
      v24 = [(MXMSampleSet *)v21 initWithTime:v20 tag:v22 unit:v23 attributes:v15 doubleValues:v31 length:2];

      [(MXMMutableSampleData *)v16 appendSet:v24];
      v25 = v16;
      *a3 = v25;

      return 1;
    }
    else
    {
      return 0;
    }
  }
}

@end