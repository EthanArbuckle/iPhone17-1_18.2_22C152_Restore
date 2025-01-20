@interface TTSAssetType
+ (TTSAssetType)combinedVoice;
+ (TTSAssetType)customVoice;
+ (TTSAssetType)gryphonVoice;
+ (TTSAssetType)macintalkVoice;
+ (TTSAssetType)vocalizerVoice;
+ (TTSAssetType)voiceResources;
- (id)pathComponent;
@end

@implementation TTSAssetType

+ (TTSAssetType)macintalkVoice
{
  id v2 = static TTSAssetType.macintalkVoice.getter();
  return (TTSAssetType *)v2;
}

+ (TTSAssetType)vocalizerVoice
{
  id v2 = static TTSAssetType.vocalizerVoice.getter();
  return (TTSAssetType *)v2;
}

+ (TTSAssetType)combinedVoice
{
  id v2 = static TTSAssetType.combinedVoice.getter();
  return (TTSAssetType *)v2;
}

+ (TTSAssetType)customVoice
{
  id v2 = static TTSAssetType.customVoice.getter();
  return (TTSAssetType *)v2;
}

+ (TTSAssetType)gryphonVoice
{
  id v2 = static TTSAssetType.gryphonVoice.getter();
  return (TTSAssetType *)v2;
}

+ (TTSAssetType)voiceResources
{
  id v2 = static TTSAssetType.voiceResources.getter();
  return (TTSAssetType *)v2;
}

- (id)pathComponent
{
  id v2 = self;
  TTSAssetType.pathComponent()();

  v3 = (void *)sub_19CED5230();
  swift_bridgeObjectRelease();
  return v3;
}

@end