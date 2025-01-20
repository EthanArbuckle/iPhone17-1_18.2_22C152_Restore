@interface OITSUPointerKeyDictionary
- (OITSUPointerKeyDictionary)initWithCapacity:(unint64_t)a3;
@end

@implementation OITSUPointerKeyDictionary

- (OITSUPointerKeyDictionary)initWithCapacity:(unint64_t)a3
{
  keyCallBacks.version = *MEMORY[0x263EFFF88];
  keyCallBacks.retain = 0;
  v4 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x263EFFF88] + 24);
  keyCallBacks.release = 0;
  keyCallBacks.copyDescription = v4;
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  v9.receiver = self;
  v9.super_class = (Class)OITSUPointerKeyDictionary;
  v5 = -[OITSUNoCopyDictionary initWithCapacity:](&v9, sel_initWithCapacity_);
  v6 = v5;
  if (v5)
  {
    mDictionary = v5->super.mDictionary;
    if (mDictionary) {
      CFRelease(mDictionary);
    }
    v6->super.mDictionary = CFDictionaryCreateMutable(0, a3, &keyCallBacks, MEMORY[0x263EFFF90]);
  }
  return v6;
}

@end