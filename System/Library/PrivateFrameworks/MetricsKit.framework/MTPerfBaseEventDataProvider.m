@interface MTPerfBaseEventDataProvider
- (id)knownFields;
- (id)xpSamplingForced:(id)a3;
@end

@implementation MTPerfBaseEventDataProvider

- (id)knownFields
{
  v13[11] = *MEMORY[0x263EF8340];
  v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MTEventDataProvider *)self delegate];
    uint64_t v6 = [v5 knownFields];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MTPerfBaseEventDataProvider;
    v7 = [(MTBaseEventDataProvider *)&v12 knownFields];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      v13[0] = @"app";
      v13[1] = @"appVersion";
      v13[2] = @"hardwareFamily";
      v13[3] = @"os";
      v13[4] = @"osBuildNumber";
      v13[5] = @"osVersion";
      v13[6] = @"connection";
      v13[7] = @"clientEventId";
      v13[8] = @"timezoneOffset";
      v13[9] = @"eventTime";
      v13[10] = @"xpVersionMetricsKit";
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:11];
    }
    v5 = v9;

    uint64_t v6 = [v5 arrayByAddingObject:@"xpSamplingForced"];
  }
  v10 = (void *)v6;

  return v10;
}

- (id)xpSamplingForced:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 xpSamplingForced:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  id v9 = [v4 objectForKeyedSubscript:@"xpSamplingForced"];
  v7 = v9;
  if (v9)
  {
    id v8 = v9;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  objc_super v12 = [v11 config];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __48__MTPerfBaseEventDataProvider_xpSamplingForced___block_invoke;
  v14[3] = &unk_26430F7F8;
  v14[4] = self;
  v10 = [v12 computeWithConfigSources:v14];

LABEL_7:

  return v10;
}

id __48__MTPerfBaseEventDataProvider_xpSamplingForced___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metricsKit];
  v5 = [v4 config];
  char v6 = [v5 configValueForKeyPath:@"performance.samplingForced" sources:v3];

  return v6;
}

@end