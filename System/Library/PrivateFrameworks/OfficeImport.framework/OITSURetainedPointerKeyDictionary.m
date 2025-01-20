@interface OITSURetainedPointerKeyDictionary
- (OITSURetainedPointerKeyDictionary)initWithCapacity:(unint64_t)a3;
@end

@implementation OITSURetainedPointerKeyDictionary

- (OITSURetainedPointerKeyDictionary)initWithCapacity:(unint64_t)a3
{
  CFIndex v4 = *MEMORY[0x263EFFF88];
  *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x263EFFF88] + 8);
  v5 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x263EFFF88] + 24);
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  keyCallBacks.copyDescription = v5;
  v10.receiver = self;
  v10.super_class = (Class)OITSURetainedPointerKeyDictionary;
  keyCallBacks.version = v4;
  v6 = -[OITSUNoCopyDictionary initWithCapacity:](&v10, sel_initWithCapacity_);
  v7 = v6;
  if (v6)
  {
    mDictionary = v6->super.mDictionary;
    if (mDictionary) {
      CFRelease(mDictionary);
    }
    v7->super.mDictionary = CFDictionaryCreateMutable(0, a3, &keyCallBacks, MEMORY[0x263EFFF90]);
  }
  return v7;
}

@end