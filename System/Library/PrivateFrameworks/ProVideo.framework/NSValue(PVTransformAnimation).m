@interface NSValue(PVTransformAnimation)
+ (uint64_t)valueWithPVTransformAnimationInfo:()PVTransformAnimation;
- (uint64_t)PVTransformAnimationInfoValue;
@end

@implementation NSValue(PVTransformAnimation)

+ (uint64_t)valueWithPVTransformAnimationInfo:()PVTransformAnimation
{
  return [MEMORY[0x1E4F29238] valueWithBytes:a3 objCType:"{PVTransformAnimationInfo={?=qiIq}{CGPoint=dd}dd}"];
}

- (uint64_t)PVTransformAnimationInfoValue
{
  uint64_t v4 = MEMORY[0x1E4F1FA48];
  *(_OWORD *)x8_0 = *MEMORY[0x1E4F1FA48];
  uint64_t v5 = *(void *)(v4 + 16);
  *(void *)(x8_0 + 24) = 0;
  *(void *)(x8_0 + 32) = 0;
  *(void *)(x8_0 + 16) = v5;
  *(_OWORD *)(x8_0 + 40) = xmmword_1B7E733D0;
  return objc_msgSend(a1, "getValue:size:");
}

@end