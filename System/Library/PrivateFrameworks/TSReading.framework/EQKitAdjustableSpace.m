@interface EQKitAdjustableSpace
+ (__CTRunDelegate)newRunDelegateWithAscent:(double)a3 descent:(double)a4 width:(double)a5;
+ (void)appendSpaceToAttributedString:(id)a3 ascent:(double)a4 descent:(double)a5 width:(double)a6;
- (EQKitAdjustableSpace)initWithAscent:(double)a3 descent:(double)a4 width:(double)a5;
- (double)ascent;
- (double)descent;
- (double)width;
@end

@implementation EQKitAdjustableSpace

- (EQKitAdjustableSpace)initWithAscent:(double)a3 descent:(double)a4 width:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)EQKitAdjustableSpace;
  result = [(EQKitAdjustableSpace *)&v9 init];
  if (result)
  {
    result->mAscent = a3;
    result->mDescent = a4;
    result->mWidth = a5;
  }
  return result;
}

+ (__CTRunDelegate)newRunDelegateWithAscent:(double)a3 descent:(double)a4 width:(double)a5
{
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAscent:a3 descent:a4 width:a5];

  return CTRunDelegateCreate(&kEQKitRunDelegateCallBacks, v5);
}

+ (void)appendSpaceToAttributedString:(id)a3 ascent:(double)a4 descent:(double)a5 width:(double)a6
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  v7 = (void *)[a1 newRunDelegateWithAscent:a4 descent:a5 width:a6];
  v8 = (void *)*MEMORY[0x263F03C68];
  keys[0] = *(void **)MEMORY[0x263F03CA8];
  keys[1] = v8;
  objc_super v9 = (void *)*MEMORY[0x263EFFB40];
  values[0] = v7;
  values[1] = v9;
  CFDictionaryRef v10 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 2, 0, MEMORY[0x263EFFF90]);
  v11 = (void *)[[NSString alloc] initWithCharacters:&kRunDelegateCharacter length:1];
  v12 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11 attributes:v10];
  [a3 appendAttributedString:v12];
  CFRelease(v7);
  CFRelease(v10);
}

- (double)ascent
{
  return self->mAscent;
}

- (double)descent
{
  return self->mDescent;
}

- (double)width
{
  return self->mWidth;
}

@end