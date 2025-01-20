@interface TRITelemetryFactory
+ (id)containerOriginTelemetryForTaskAttribution:(id)a3;
@end

@implementation TRITelemetryFactory

+ (id)containerOriginTelemetryForTaskAttribution:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"TRITelemetryFactory.m", 23, @"Invalid parameter not satisfying: %@", @"taskAttribution" object file lineNumber description];
  }
  v6 = objc_opt_new();
  v7 = [v5 teamIdentifier];

  if (v7)
  {
    v8 = [v5 teamIdentifier];
    [v6 setClientTeamId:v8];
  }
  v9 = objc_opt_new();
  uint64_t v10 = [v5 triCloudKitContainer];
  if (v10 <= 2) {
    [v9 setCkContainer:v10];
  }
  unint64_t v11 = [MEMORY[0x1E4FB0090] currentEnvironment];
  if (v11 <= 5) {
    [v9 setCkEnvironment:dword_1DA403780[v11]];
  }
  [v6 setContainerOriginFields:v9];

  return v6;
}

@end