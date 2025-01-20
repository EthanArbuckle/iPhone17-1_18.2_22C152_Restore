@interface NSNull(TSDMixingAdditions)
- (uint64_t)mixedObjectWithFraction:()TSDMixingAdditions ofObject:;
- (uint64_t)mixingTypeWithObject:()TSDMixingAdditions;
@end

@implementation NSNull(TSDMixingAdditions)

- (uint64_t)mixingTypeWithObject:()TSDMixingAdditions
{
  if ([MEMORY[0x263EFF9D0] null] != a3)
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[NSNull(TSDMixingAdditions) mixingTypeWithObject:]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m"), 283, @"other object isn't NSNull!");
  }
  return 5;
}

- (uint64_t)mixedObjectWithFraction:()TSDMixingAdditions ofObject:
{
  if ((void *)[MEMORY[0x263EFF9D0] null] == a4) {
    return a1;
  }

  return [a4 mixedObjectWithFraction:a1 ofObject:1.0 - a2];
}

@end