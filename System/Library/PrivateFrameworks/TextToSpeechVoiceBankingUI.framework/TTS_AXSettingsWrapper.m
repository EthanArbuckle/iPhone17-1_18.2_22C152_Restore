@interface TTS_AXSettingsWrapper
+ (id)customSettingsForVoice:(id)a3 speechSource:(id)a4;
+ (void)setCustomSettingsForVoice:(id)a3 speechSource:(id)a4 settings:(id)a5;
@end

@implementation TTS_AXSettingsWrapper

+ (id)customSettingsForVoice:(id)a3 speechSource:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [getAXSettingsClass() sharedInstance];
  v8 = [v7 customSettingsForVoice:v6 sourceKey:v5];

  return v8;
}

+ (void)setCustomSettingsForVoice:(id)a3 speechSource:(id)a4 settings:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [getAXSettingsClass() sharedInstance];
  [v10 setCustomSettingsForVoice:v9 sourceKey:v8 settings:v7];
}

@end