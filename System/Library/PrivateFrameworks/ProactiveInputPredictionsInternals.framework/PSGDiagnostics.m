@interface PSGDiagnostics
+ (id)getDiagnosticsInfoForReportCrash;
@end

@implementation PSGDiagnostics

+ (id)getDiagnosticsInfoForReportCrash
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v17 = objc_opt_new();
  v16 = [MEMORY[0x263F80E18] clientWithIdentifier:103];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v2 = [&unk_26F241EC8 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(&unk_26F241EC8);
        }
        uint64_t v6 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v7 = [v16 experimentIdentifiersWithNamespaceName:v6];
        v8 = [v7 experimentId];
        uint64_t v9 = [v7 deploymentId];
        v10 = [v7 treatmentId];
        if (!v7 || ![(__CFString *)v8 length] || ![(__CFString *)v10 length])
        {

          uint64_t v9 = 0xFFFFFFFFLL;
          v10 = @"<nil>";
          v8 = @"<nil>";
        }
        v24[0] = @"experimentId";
        v24[1] = @"treatmentId";
        v25[0] = v8;
        v25[1] = v10;
        v24[2] = @"deploymentId";
        v11 = [NSNumber numberWithInt:v9];
        v12 = [v11 stringValue];
        v25[2] = v12;
        v13 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];

        [v17 setObject:v13 forKeyedSubscript:v6];
      }
      uint64_t v3 = [&unk_26F241EC8 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v3);
  }
  v22 = @"experimentInfo";
  v23 = v17;
  v14 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];

  return v14;
}

@end