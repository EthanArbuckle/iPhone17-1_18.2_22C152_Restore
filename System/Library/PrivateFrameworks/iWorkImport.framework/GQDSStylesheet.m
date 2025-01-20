@interface GQDSStylesheet
- (BOOL)addStyle:(id)a3 withOwnedXmlUid:(char *)a4;
- (GQDSStylesheet)initWithRoot:(id)a3;
- (__CFArray)retainedArrayOfIdentifiedStyles;
- (id)parent;
- (id)styleWithIdentifier:(const char *)a3;
- (id)styleWithXmlUid:(const char *)a3;
- (void)addStyle:(id)a3 needingParentResolution:(const char *)a4 resolveInParent:(BOOL)a5;
- (void)addStyle:(id)a3 withOwnedIdentifier:(char *)a4;
- (void)dealloc;
- (void)resolveStyleParents;
@end

@implementation GQDSStylesheet

- (GQDSStylesheet)initWithRoot:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GQDSStylesheet;
  v4 = [(GQDSStylesheet *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mRoot = (GQDRoot *)a3;
    v4->mIdentifiedStyles = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&unk_85110, &kCFTypeDictionaryValueCallBacks);
    v5->mStylesNeedingParentResolution = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v5->mStylesNeedingParentResolutionInParent = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  }
  return v5;
}

- (void)dealloc
{
  self->mRoot = 0;

  CFRelease(self->mIdentifiedStyles);
  mStylesNeedingParentResolution = self->mStylesNeedingParentResolution;
  if (mStylesNeedingParentResolution) {
    CFRelease(mStylesNeedingParentResolution);
  }
  mStylesNeedingParentResolutionInParent = self->mStylesNeedingParentResolutionInParent;
  if (mStylesNeedingParentResolutionInParent) {
    CFRelease(mStylesNeedingParentResolutionInParent);
  }
  v5.receiver = self;
  v5.super_class = (Class)GQDSStylesheet;
  [(GQDSStylesheet *)&v5 dealloc];
}

- (id)parent
{
  return self->mParent;
}

- (void)addStyle:(id)a3 withOwnedIdentifier:(char *)a4
{
}

- (BOOL)addStyle:(id)a3 withOwnedXmlUid:(char *)a4
{
  return [(GQDRoot *)self->mRoot addObject:a3 withOwnedXmlUid:a4];
}

- (id)styleWithIdentifier:(const char *)a3
{
  id result = (id)CFDictionaryGetValue(self->mIdentifiedStyles, a3);
  if (!result)
  {
    id result = self->mParent;
    if (result)
    {
      return [result styleWithIdentifier:a3];
    }
  }
  return result;
}

- (id)styleWithXmlUid:(const char *)a3
{
  return [(GQDRoot *)self->mRoot objectWithXmlUid:a3];
}

- (void)addStyle:(id)a3 needingParentResolution:(const char *)a4 resolveInParent:(BOOL)a5
{
  BOOL v5 = a5;
  objc_super v7 = [[GQDSParentResolutionEntry alloc] initWithStyle:a3 parentIdentifier:a4];
  v9 = v7;
  uint64_t v8 = 40;
  if (v5) {
    uint64_t v8 = 32;
  }
  CFArrayAppendValue(*(CFMutableArrayRef *)((char *)&self->super.isa + v8), v7);
}

- (void)resolveStyleParents
{
  mStylesNeedingParentResolution = self->mStylesNeedingParentResolution;
  if (mStylesNeedingParentResolution)
  {
    v5.length = CFArrayGetCount(self->mStylesNeedingParentResolution);
    v5.location = 0;
    CFArrayApplyFunction(mStylesNeedingParentResolution, v5, (CFArrayApplierFunction)sub_13110, self);
    CFRelease(self->mStylesNeedingParentResolution);
    self->mStylesNeedingParentResolution = 0;
  }
  mStylesNeedingParentResolutionInParent = self->mStylesNeedingParentResolutionInParent;
  if (mStylesNeedingParentResolutionInParent)
  {
    if (self->mParent)
    {
      v6.length = CFArrayGetCount(self->mStylesNeedingParentResolutionInParent);
      v6.location = 0;
      CFArrayApplyFunction(mStylesNeedingParentResolutionInParent, v6, (CFArrayApplierFunction)sub_13110, self->mParent);
      CFRelease(self->mStylesNeedingParentResolutionInParent);
      self->mStylesNeedingParentResolutionInParent = 0;
    }
  }
}

- (__CFArray)retainedArrayOfIdentifiedStyles
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFDictionaryApplyFunction(self->mIdentifiedStyles, (CFDictionaryApplierFunction)sub_13270, Mutable);
  return Mutable;
}

@end