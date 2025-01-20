@interface TSURetainedPointerKeyDictionary
- (TSURetainedPointerKeyDictionary)initWithCapacity:(unint64_t)a3;
@end

@implementation TSURetainedPointerKeyDictionary

- (TSURetainedPointerKeyDictionary)initWithCapacity:(unint64_t)a3
{
  *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)&kCFTypeDictionaryKeyCallBacks.retain;
  copyDescription = kCFTypeDictionaryKeyCallBacks.copyDescription;
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  keyCallBacks.copyDescription = copyDescription;
  v9.receiver = self;
  v9.super_class = (Class)TSURetainedPointerKeyDictionary;
  keyCallBacks.version = kCFTypeDictionaryKeyCallBacks.version;
  v5 = -[TSUNoCopyDictionary initWithCapacity:](&v9, "initWithCapacity:");
  v6 = v5;
  if (v5)
  {
    mDictionary = v5->super.mDictionary;
    if (mDictionary) {
      CFRelease(mDictionary);
    }
    v6->super.mDictionary = CFDictionaryCreateMutable(0, a3, &keyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  return v6;
}

@end