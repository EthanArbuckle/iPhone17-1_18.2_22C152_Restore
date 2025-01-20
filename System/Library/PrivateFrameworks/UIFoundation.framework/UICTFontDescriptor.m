@interface UICTFontDescriptor
+ (id)fontDescriptorWithFontAttributes:(id)a3;
+ (id)fontDescriptorWithName:(id)a3 matrix:(CGAffineTransform *)a4;
+ (id)fontDescriptorWithName:(id)a3 size:(double)a4;
- (BOOL)allowsWeakReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)retainWeakReference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)fontAttributes;
- (id)fontDescriptorByAddingAttributes:(id)a3;
- (id)matchingFontDescriptorWithMandatoryKeys:(id)a3;
- (id)matchingFontDescriptorsWithMandatoryKeys:(id)a3;
- (id)objectForKey:(id)a3;
@end

@implementation UICTFontDescriptor

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = self;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual() != 0;
}

- (id)objectForKey:(id)a3
{
  v3 = (void *)CTFontDescriptorCopyAttribute((CTFontDescriptorRef)self, (CFStringRef)a3);

  return v3;
}

- (id)fontAttributes
{
  CFDictionaryRef v2 = CTFontDescriptorCopyAttributes((CTFontDescriptorRef)self);

  return v2;
}

- (id)fontDescriptorByAddingAttributes:(id)a3
{
  CFDictionaryRef v4 = +[UIFontDescriptor _createMungledDictionary:a3];
  CTFontDescriptorRef CopyWithAttributes = CTFontDescriptorCreateCopyWithAttributes((CTFontDescriptorRef)self, v4);

  return CopyWithAttributes;
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (id)fontDescriptorWithFontAttributes:(id)a3
{
  CFDictionaryRef v3 = +[UIFontDescriptor _createMungledDictionary:a3];
  CTFontDescriptorRef v4 = CTFontDescriptorCreateWithAttributes(v3);

  return v4;
}

+ (id)fontDescriptorWithName:(id)a3 size:(double)a4
{
  CTFontDescriptorRef v4 = CTFontDescriptorCreateWithNameAndSize((CFStringRef)a3, a4);

  return v4;
}

+ (id)fontDescriptorWithName:(id)a3 matrix:(CGAffineTransform *)a4
{
  long long v6 = *(_OWORD *)&a4->c;
  v9[0] = *(_OWORD *)&a4->a;
  v9[1] = v6;
  v9[2] = *(_OWORD *)&a4->tx;
  uint64_t v7 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:v9];
  return (id)objc_msgSend(a1, "fontDescriptorWithFontAttributes:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a3, @"NSFontNameAttribute", v7, @"NSFontMatrixAttribute", 0));
}

- (id)matchingFontDescriptorsWithMandatoryKeys:(id)a3
{
  CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors((CTFontDescriptorRef)self, (CFSetRef)a3);

  return MatchingFontDescriptors;
}

- (id)matchingFontDescriptorWithMandatoryKeys:(id)a3
{
  CTFontDescriptorRef MatchingFontDescriptor = CTFontDescriptorCreateMatchingFontDescriptor((CTFontDescriptorRef)self, (CFSetRef)a3);

  return MatchingFontDescriptor;
}

@end