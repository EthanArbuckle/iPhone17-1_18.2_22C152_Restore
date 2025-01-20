@interface TPSContextualBiomeEventBuilder
+ (id)contextualBiomeEventFromDictionary:(id)a3;
+ (id)contextualBiomeEventFromDuetEventDictionary:(id)a3;
@end

@implementation TPSContextualBiomeEventBuilder

+ (id)contextualBiomeEventFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = +[TPSContextualBiomeEvent streamFromDictionary:v3];
  if ([v4 isEqualToString:@"App.InFocus"])
  {
    v5 = off_1E5906258;
LABEL_11:
    v6 = (void *)[objc_alloc(*v5) initWithDictionary:v3];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"AppLaunch"])
  {
    v5 = off_1E5906260;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Device.Wireless.Bluetooth"])
  {
    v5 = off_1E5906268;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Discoverability.Signals"])
  {
    v5 = off_1E5906270;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"UserFocusComputedMode"])
  {
    v5 = off_1E5906288;
    goto LABEL_11;
  }
  v6 = 0;
LABEL_12:

  return v6;
}

+ (id)contextualBiomeEventFromDuetEventDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"stream"];
  int v5 = [v4 isEqualToString:@"/discoverability/signals"];

  if (v5)
  {
    v6 = (void *)[v3 mutableCopy];
    [v6 setObject:@"Discoverability.Signals" forKeyedSubscript:@"stream"];
    v7 = [NSNumber numberWithInt:3];
    [v6 setObject:v7 forKeyedSubscript:@"type"];

    v8 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    v9 = [v3 objectForKeyedSubscript:@"value"];
    v10 = (void *)[v9 copy];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__TPSContextualBiomeEventBuilder_contextualBiomeEventFromDuetEventDictionary___block_invoke;
    v15[3] = &unk_1E59071A0;
    id v16 = v8;
    id v11 = v8;
    [v10 enumerateKeysAndObjectsUsingBlock:v15];
    [v6 removeObjectForKey:@"value"];
    v12 = (void *)[v11 copy];
    [v6 setObject:v12 forKeyedSubscript:@"filter"];

    [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_8];
    v13 = [(TPSContextualBiomeEvent *)[TPSContextualBiomeDiscoverabilitySignalsEvent alloc] initWithDictionary:v6];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __78__TPSContextualBiomeEventBuilder_contextualBiomeEventFromDuetEventDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v7 = a2;
  id v5 = a3;
  if ([(__CFString *)v7 isEqualToString:@"stringValue"]) {
    v6 = @"contentIdentifier";
  }
  else {
    v6 = v7;
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

void __78__TPSContextualBiomeEventBuilder_contextualBiomeEventFromDuetEventDictionary___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

@end