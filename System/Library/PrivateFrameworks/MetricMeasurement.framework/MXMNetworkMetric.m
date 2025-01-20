@interface MXMNetworkMetric
+ (MXMNetworkMetric)currentProcess;
- (BOOL)_shouldConstructProbe;
- (MXMNetworkMetric)initWithBundleIdentifier:(id)a3;
- (MXMNetworkMetric)initWithIdentifier:(id)a3 filter:(id)a4;
- (MXMNetworkMetric)initWithProcessIdentifier:(int)a3;
- (MXMNetworkMetric)initWithProcessName:(id)a3;
- (NSNumber)processIdentifier;
- (NSString)processName;
- (id)_constructProbe;
@end

@implementation MXMNetworkMetric

+ (MXMNetworkMetric)currentProcess
{
  v2 = (void *)[objc_alloc((Class)a1) initWithProcessIdentifier:getpid()];
  return (MXMNetworkMetric *)v2;
}

- (MXMNetworkMetric)initWithProcessIdentifier:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [MXMSampleTagFilter alloc];
  v6 = +[MXMUtilizationSampleTag network];
  v7 = [(MXMSampleTagFilter *)v5 initWithTag:v6 allowDescendents:1];

  v8 = [MXMSampleAttributeFilter alloc];
  v9 = [NSNumber numberWithInt:v3];
  v10 = [(MXMSampleAttributeFilter *)v8 initWithAttributeName:@"Process Identifier" numericValue:v9];

  v11 = +[MXMSampleFilter filterWithAttributeFilter:v10 tagFilter:v7];
  v12 = [(MXMNetworkMetric *)self initWithIdentifier:@"com.apple.metricmeasurement.metric.network" filter:v11];

  return v12;
}

- (MXMNetworkMetric)initWithProcessName:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [MXMSampleTagFilter alloc];
    v6 = +[MXMUtilizationSampleTag network];
    v7 = [(MXMSampleTagFilter *)v5 initWithTag:v6 allowDescendents:1];

    v8 = [[MXMSampleAttributeFilter alloc] initWithAttributeName:@"Process Name" stringValue:v4];
    v9 = +[MXMSampleFilter filterWithAttributeFilter:v8 tagFilter:v7];
    self = [(MXMNetworkMetric *)self initWithIdentifier:@"com.apple.metricmeasurement.metric.network" filter:v9];

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MXMNetworkMetric)initWithBundleIdentifier:(id)a3
{
  id v4 = +[MXMMachUtils _processNameWithBundleIdentifier:a3];
  v5 = [(MXMNetworkMetric *)self initWithProcessName:v4];

  return v5;
}

- (MXMNetworkMetric)initWithIdentifier:(id)a3 filter:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MXMNetworkMetric;
  id v4 = [(MXMMetric *)&v7 initWithIdentifier:a3 filter:a4];
  v5 = v4;
  if (v4) {
    [(MXMMetric *)v4 setPreferredSampleMode:-1];
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
  return 1;
}

- (id)_constructProbe
{
  v2 = objc_alloc_init(MXMResourceProbe);
  return v2;
}

@end