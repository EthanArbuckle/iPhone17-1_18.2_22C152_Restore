@interface TTSAssetTechnology
+ (TTSAssetTechnology)custom;
+ (TTSAssetTechnology)gryphon;
+ (TTSAssetTechnology)macintalk;
+ (TTSAssetTechnology)natural;
+ (TTSAssetTechnology)neural;
+ (TTSAssetTechnology)neuralAX;
+ (TTSAssetTechnology)vocalizer;
@end

@implementation TTSAssetTechnology

+ (TTSAssetTechnology)vocalizer
{
  id v2 = static TTSAssetTechnology.vocalizer.getter();
  return (TTSAssetTechnology *)v2;
}

+ (TTSAssetTechnology)custom
{
  id v2 = static TTSAssetTechnology.custom.getter();
  return (TTSAssetTechnology *)v2;
}

+ (TTSAssetTechnology)macintalk
{
  id v2 = static TTSAssetTechnology.macintalk.getter();
  return (TTSAssetTechnology *)v2;
}

+ (TTSAssetTechnology)gryphon
{
  id v2 = static TTSAssetTechnology.gryphon.getter();
  return (TTSAssetTechnology *)v2;
}

+ (TTSAssetTechnology)neural
{
  id v2 = static TTSAssetTechnology.neural.getter();
  return (TTSAssetTechnology *)v2;
}

+ (TTSAssetTechnology)neuralAX
{
  id v2 = static TTSAssetTechnology.neuralAX.getter();
  return (TTSAssetTechnology *)v2;
}

+ (TTSAssetTechnology)natural
{
  id v2 = static TTSAssetTechnology.natural.getter();
  return (TTSAssetTechnology *)v2;
}

@end