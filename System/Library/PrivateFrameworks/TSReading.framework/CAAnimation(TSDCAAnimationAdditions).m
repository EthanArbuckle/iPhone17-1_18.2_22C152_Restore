@interface CAAnimation(TSDCAAnimationAdditions)
+ (uint64_t)TSD_supportedKeyPaths;
- (double)TSD_animationPercentByApplyingTimingFunctionForKeyPath:()TSDCAAnimationAdditions atTime:;
- (uint64_t)TSD_animationForKeyPath:()TSDCAAnimationAdditions atTime:;
- (uint64_t)TSD_containsAnimationForKeyPath:()TSDCAAnimationAdditions;
- (uint64_t)TSD_valueAtTime:()TSDCAAnimationAdditions initialValue:;
- (uint64_t)TSD_valueForKeyPath:()TSDCAAnimationAdditions atTime:;
- (uint64_t)TSD_valueForKeyPath:()TSDCAAnimationAdditions atTime:animationCache:;
- (uint64_t)p_getValue:()TSDCAAnimationAdditions animationPercent:atTime:initialValue:;
@end

@implementation CAAnimation(TSDCAAnimationAdditions)

+ (uint64_t)TSD_supportedKeyPaths
{
  if (TSD_supportedKeyPaths_onceToken != -1) {
    dispatch_once(&TSD_supportedKeyPaths_onceToken, &__block_literal_global_77);
  }
  return TSD_supportedKeyPaths_s_supportedKeyPaths;
}

- (uint64_t)p_getValue:()TSDCAAnimationAdditions animationPercent:atTime:initialValue:
{
  v0 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"-[CAAnimation(TSDCAAnimationAdditions) p_getValue:animationPercent:atTime:initialValue:]"];
  uint64_t v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"];

  return [v0 handleFailureInFunction:v1 file:v2 lineNumber:169 description:@"Implement me in subclass!"];
}

- (uint64_t)TSD_valueForKeyPath:()TSDCAAnimationAdditions atTime:animationCache:
{
  if ((objc_msgSend((id)objc_msgSend(a1, "keyPath"), "isEqualToString:", a4) & 1) == 0)
  {
    v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[CAAnimation(TSDCAAnimationAdditions) TSD_valueForKeyPath:atTime:animationCache:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 174, @"Wrong keyPath for animation!");
  }
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a5, "initialValues"), "objectForKey:", a4);

  return objc_msgSend(a1, "TSD_valueAtTime:initialValue:", v11, a2);
}

- (uint64_t)TSD_valueForKeyPath:()TSDCAAnimationAdditions atTime:
{
  return objc_msgSend(a1, "TSD_valueForKeyPath:atTime:animationCache:", a3, 0);
}

- (uint64_t)TSD_valueAtTime:()TSDCAAnimationAdditions initialValue:
{
  v0 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"-[CAAnimation(TSDCAAnimationAdditions) TSD_valueAtTime:initialValue:]"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 188, @"Implement me in subclass!");
  return 0;
}

- (double)TSD_animationPercentByApplyingTimingFunctionForKeyPath:()TSDCAAnimationAdditions atTime:
{
  v0 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"-[CAAnimation(TSDCAAnimationAdditions) TSD_animationPercentByApplyingTimingFunctionForKeyPath:atTime:]"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 194, @"Implement me in subclass!");
  return 0.0;
}

- (uint64_t)TSD_containsAnimationForKeyPath:()TSDCAAnimationAdditions
{
  v0 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"-[CAAnimation(TSDCAAnimationAdditions) TSD_containsAnimationForKeyPath:]"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 200, @"Implement me in subclass!");
  return 0;
}

- (uint64_t)TSD_animationForKeyPath:()TSDCAAnimationAdditions atTime:
{
  v0 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"-[CAAnimation(TSDCAAnimationAdditions) TSD_animationForKeyPath:atTime:]"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/CAAnimationAdditions.m"), 206, @"Implement me in subclass!");
  return 0;
}

@end