@interface ADAFUtil
+ (BOOL)isProcessMediaserverd;
+ (id)stringFromDataType:(unsigned int)a3;
@end

@implementation ADAFUtil

+ (BOOL)isProcessMediaserverd
{
  if (isProcessMediaserverd_once != -1) {
    dispatch_once(&isProcessMediaserverd_once, &__block_literal_global_1057);
  }
  return isProcessMediaserverd_isMediaserverd;
}

void __33__ADAFUtil_isProcessMediaserverd__block_invoke()
{
  int v0 = _os_feature_enabled_impl();
  v1 = @"mediaserverd";
  if (v0) {
    v1 = @"audiomxd";
  }
  v2 = (void *)MEMORY[0x263F08AB0];
  v3 = v1;
  id v6 = [v2 processInfo];
  v4 = [v6 processName];
  char v5 = [v4 isEqualToString:v3];

  isProcessMediaserverd_isMediaserverd = v5;
}

+ (id)stringFromDataType:(unsigned int)a3
{
  v3 = @"UnkownType";
  if (a3 == 1936614505) {
    v3 = @"SoundClassification";
  }
  if (a3 == 1751213428) {
    v4 = @"HeadphoneAudioExposure";
  }
  else {
    v4 = v3;
  }
  if (a3 == 1702260324) {
    return @"EnvironmentalDosage";
  }
  else {
    return v4;
  }
}

@end