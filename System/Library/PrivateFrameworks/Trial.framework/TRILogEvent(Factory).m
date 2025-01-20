@interface TRILogEvent(Factory)
+ (id)contextWithTrackingId:()Factory projectId:;
+ (id)currentTime;
+ (id)eventWithTrackingId:()Factory projectId:;
@end

@implementation TRILogEvent(Factory)

+ (id)currentTime
{
  v0 = (void *)MEMORY[0x1E4FB0590];
  v1 = [MEMORY[0x1E4F1C9C8] date];
  v2 = [v0 logTimeFromDate:v1];

  return v2;
}

+ (id)contextWithTrackingId:()Factory projectId:
{
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [a1 currentTime];
  [v7 setDeviceLogTime:v8];

  v9 = (void *)MEMORY[0x1E4FB0590];
  v10 = [v6 time];
  v11 = [v9 logTimeFromDate:v10];
  [v7 setDeviceTrackingTime:v11];

  v12 = [v6 uuid];

  v13 = [v12 UUIDString];
  [v7 setTrackingId:v13];

  [v7 setProjectId:a4];
  return v7;
}

+ (id)eventWithTrackingId:()Factory projectId:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  v9 = [v8 UUIDString];
  [v7 setLogEventId:v9];

  v10 = [a1 contextWithTrackingId:v6 projectId:a4];
  [v7 setContext:v10];

  v11 = objc_opt_new();
  [v7 setDenormalizedEvent:v11];

  v12 = [v6 subject];
  v13 = [v7 denormalizedEvent];
  [v13 setSubject:v12];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v14 = objc_msgSend(v6, "treatments", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v20 = [v7 denormalizedEvent];
        [v20 addTreatment:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  return v7;
}

@end