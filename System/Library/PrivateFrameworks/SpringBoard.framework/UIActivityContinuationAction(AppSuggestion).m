@interface UIActivityContinuationAction(AppSuggestion)
- (uint64_t)initWithIdentifier:()AppSuggestion activityTypeIdentifier:appSuggestion:;
@end

@implementation UIActivityContinuationAction(AppSuggestion)

- (uint64_t)initWithIdentifier:()AppSuggestion activityTypeIdentifier:appSuggestion:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12 = v11;
  if (v8) {
    [v11 setObject:v8 forKeyedSubscript:&unk_1F334A0E8];
  }
  if (v9) {
    [v12 setObject:v9 forKeyedSubscript:&unk_1F334A100];
  }
  v13 = [v10 originatingDeviceType];

  if (v13)
  {
    v14 = [v10 originatingDeviceType];
    [v12 setObject:v14 forKeyedSubscript:&unk_1F334A118];
  }
  v15 = [v10 originatingDeviceName];

  if (v15)
  {
    v16 = [v10 originatingDeviceName];
    [v12 setObject:v16 forKeyedSubscript:&unk_1F334A130];
  }
  v17 = [v10 activityType];

  if (v17)
  {
    v18 = [v10 activityType];
    [v12 setObject:v18 forKeyedSubscript:&unk_1F334A148];
  }
  v19 = [v10 lastUpdateTime];

  if (v19)
  {
    v20 = [v10 lastUpdateTime];
    [v12 setObject:v20 forKeyedSubscript:&unk_1F334A160];
  }
  uint64_t v21 = [a1 initWithSettings:v12];

  return v21;
}

@end