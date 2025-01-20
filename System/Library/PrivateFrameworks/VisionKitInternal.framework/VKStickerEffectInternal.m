@interface VKStickerEffectInternal
+ (VKStickerEffectInternal)comicEffect;
+ (VKStickerEffectInternal)iridescentEffect;
+ (VKStickerEffectInternal)makeNewEffect;
+ (VKStickerEffectInternal)noneEffect;
+ (VKStickerEffectInternal)puffyEffect;
+ (VKStickerEffectInternal)strokeEffect;
@end

@implementation VKStickerEffectInternal

+ (VKStickerEffectInternal)makeNewEffect
{
  v2 = objc_alloc_init(_VKStickerEffectInternal);
  return (VKStickerEffectInternal *)v2;
}

+ (VKStickerEffectInternal)noneEffect
{
  return (VKStickerEffectInternal *)+[_VKStickerEffectInternal noneEffect];
}

+ (VKStickerEffectInternal)comicEffect
{
  return (VKStickerEffectInternal *)+[_VKStickerEffectInternal comicEffect];
}

+ (VKStickerEffectInternal)strokeEffect
{
  return (VKStickerEffectInternal *)+[_VKStickerEffectInternal strokeEffect];
}

+ (VKStickerEffectInternal)puffyEffect
{
  return (VKStickerEffectInternal *)+[_VKStickerEffectInternal puffyEffect];
}

+ (VKStickerEffectInternal)iridescentEffect
{
  return (VKStickerEffectInternal *)+[_VKStickerEffectInternal iridescentEffect];
}

@end