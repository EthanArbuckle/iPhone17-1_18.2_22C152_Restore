@interface PPSOnDeviceIngesterUtilities
+ (id)allDataSourcesForSubsystem:(id)a3 category:(id)a4;
+ (id)dataSourceForSubsystem:(id)a3 category:(id)a4;
+ (id)filepathForMetricDefinition:(id)a3;
+ (id)filepathForSubsystem:(id)a3 category:(id)a4;
+ (id)metricDefinitionForSubsystem:(id)a3 category:(id)a4 metricName:(id)a5;
+ (id)metricDefinitionHistoryForSubsystem:(id)a3 category:(id)a4 metricName:(id)a5;
@end

@implementation PPSOnDeviceIngesterUtilities

+ (id)dataSourceForSubsystem:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x25A2D4DD0]();
  v8 = [MEMORY[0x263F5D3B0] getMetadataForSubsystem:v5 category:v6];
  if ([v8 count])
  {
    v9 = [v8 firstObject];
    v10 = +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)allDataSourcesForSubsystem:(id)a3 category:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x25A2D4DD0]();
  v8 = [MEMORY[0x263F5D3B0] getMetadataForSubsystem:v5 category:v6];
  if ([v8 count])
  {
    v26 = v7;
    id v27 = v6;
    id v28 = v5;
    v9 = objc_opt_new();
    v10 = [v8 firstObject];
    v11 = +[PPSDataIngesterCommonUtilities dataSourceForMetricDefinition:v10];

    [v9 addObject:v11];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v25 = v8;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (!v13) {
      goto LABEL_16;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    unint64_t v16 = 0x263F08000uLL;
    v29 = v9;
    while (1)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v30 + 1) + 8 * v17);
        if ([v18 auxiliaryType] == 2)
        {
          v19 = [*(id *)(v16 + 2880) stringWithFormat:@"%@_Dynamic", v11];
LABEL_9:
          [v9 addObject:v19];

          goto LABEL_12;
        }
        if ([v18 auxiliaryType] == 3 && !objc_msgSend(v18, "fixedArraySize"))
        {
          v20 = *(void **)(v16 + 2880);
          [v18 name];
          v22 = unint64_t v21 = v16;
          v19 = [v20 stringWithFormat:@"%@_Array_%@", v11, v22];

          unint64_t v16 = v21;
          v9 = v29;
          goto LABEL_9;
        }
LABEL_12:
        ++v17;
      }
      while (v14 != v17);
      uint64_t v23 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v14 = v23;
      if (!v23)
      {
LABEL_16:

        id v6 = v27;
        id v5 = v28;
        v8 = v25;
        v7 = v26;
        goto LABEL_18;
      }
    }
  }
  v9 = 0;
LABEL_18:

  return v9;
}

+ (id)filepathForMetricDefinition:(id)a3
{
  switch([a3 storage])
  {
    case 1u:
      v3 = NSURL;
      v4 = [MEMORY[0x263F5D3B8] containerPath];
      id v5 = [v4 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
      id v6 = [v5 stringByAppendingString:@"ExtendedPersistence/"];
      v7 = v6;
      v8 = @"CurrentLog.EPSQL";
      goto LABEL_8;
    case 2u:
      v10 = NSURL;
      v4 = [MEMORY[0x263F5D3B8] containerPath];
      id v5 = [v4 stringByAppendingString:@"/Library/BatteryLife/"];
      v7 = [v5 stringByAppendingString:@"CurrentPowerlog.PLSQL"];
      v9 = [v10 fileURLWithPath:v7 isDirectory:0];
      goto LABEL_9;
    case 3u:
      v3 = NSURL;
      v4 = [MEMORY[0x263F5D3B8] containerPath];
      id v5 = [v4 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
      id v6 = [v5 stringByAppendingString:@"CleanEnergy/"];
      v7 = v6;
      v8 = @"CurrentCleanEnergyDB.CESQL";
      goto LABEL_8;
    case 4u:
      v3 = NSURL;
      v4 = [MEMORY[0x263F5D3B8] containerPath];
      id v5 = [v4 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
      id v6 = [v5 stringByAppendingString:@"XcodeOrganizer/"];
      v7 = v6;
      v8 = @"CurrentXcodeOrganizerDB.XCSQL";
      goto LABEL_8;
    case 5u:
      v3 = NSURL;
      v4 = [MEMORY[0x263F5D3B8] containerPath];
      id v5 = [v4 stringByAppendingString:@"/Library/PerfPowerTelemetry/"];
      id v6 = [v5 stringByAppendingString:@"BackgroundProcessing/"];
      v7 = v6;
      v8 = @"CurrentBackgroundProcessingDB.BGSQL";
LABEL_8:
      v11 = [v6 stringByAppendingString:v8];
      v9 = [v3 fileURLWithPath:v11 isDirectory:0];

LABEL_9:
      break;
    default:
      v9 = 0;
      break;
  }
  return v9;
}

+ (id)filepathForSubsystem:(id)a3 category:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x25A2D4DD0]();
  v8 = [MEMORY[0x263F5D3B0] getMetadataForSubsystem:v5 category:v6];
  if ([v8 count])
  {
    v9 = objc_opt_class();
    v10 = [v8 firstObject];
    v11 = [v9 filepathForMetricDefinition:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)metricDefinitionForSubsystem:(id)a3 category:(id)a4 metricName:(id)a5
{
  return (id)[MEMORY[0x263F5D3B0] getMetadataForSubsystem:a3 category:a4 name:a5];
}

+ (id)metricDefinitionHistoryForSubsystem:(id)a3 category:(id)a4 metricName:(id)a5
{
  v7 = (void *)MEMORY[0x263F5D3B0];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() filepathForSubsystem:v10 category:v9];
  id v12 = [v7 getMetadataHistoryForFilepath:v11 subsystem:v10 category:v9 name:v8];

  return v12;
}

@end