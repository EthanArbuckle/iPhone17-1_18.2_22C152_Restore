@interface GQDWPLayoutFrame
- (BOOL)isBlank;
- (id)layoutStyle;
- (id)storage;
- (int)readAttributesFromReader:(_xmlTextReader *)a3;
- (unsigned)textScale;
- (void)dealloc;
- (void)resolveStyleRef;
@end

@implementation GQDWPLayoutFrame

- (void)dealloc
{
  mStyleRef = self->mStyleRef;
  if (mStyleRef) {
    xmlFree(mStyleRef);
  }

  v4.receiver = self;
  v4.super_class = (Class)GQDWPLayoutFrame;
  [(GQDWPLayoutFrame *)&v4 dealloc];
}

- (id)layoutStyle
{
  return self->mStyle;
}

- (id)storage
{
  return self->mStorage;
}

- (unsigned)textScale
{
  return self->mTextScale;
}

- (BOOL)isBlank
{
  v2 = [(GQDWPLayoutStorage *)self->mStorage body];
  if (!v2 || (CFArrayRef v3 = v2, (Count = CFArrayGetCount(v2)) == 0))
  {
LABEL_10:
    LOBYTE(v7) = 1;
    return v7;
  }
  CFIndex v5 = 0;
  while (1)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v3, v5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    if (([ValueAtIndex isBlank] & 1) == 0) {
      goto LABEL_12;
    }
LABEL_9:
    if (Count == ++v5) {
      goto LABEL_10;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v7 = [ValueAtIndex isBlank];
    if (!v7) {
      return v7;
    }
    goto LABEL_9;
  }
LABEL_12:
  LOBYTE(v7) = 0;
  return v7;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3
{
  mStyleRef = self->mStyleRef;
  if (mStyleRef) {
    xmlFree(mStyleRef);
  }
  self->mStyleRef = (char *)xmlTextReaderGetAttributeNs(a3, (const xmlChar *)"layoutstyle", *(const xmlChar **)(qword_A35E8 + 16));
  self->mTextScale = sub_42F04(a3, qword_A35E8, (xmlChar *)"tscale", 0);
  return 1;
}

- (void)resolveStyleRef
{
  if (self->mStyleRef)
  {
    id v3 = [(GQDWPStorage *)self->mStorage stylesheet];
    objc_super v4 = (GQDSStyle *)[v3 styleWithIdentifier:self->mStyleRef];
    self->mStyle = v4;
    if (!v4)
    {
      objc_super v4 = (GQDSStyle *)[v3 styleWithXmlUid:self->mStyleRef];
      self->mStyle = v4;
    }
    CFIndex v5 = v4;
    xmlFree(self->mStyleRef);
    self->mStyleRef = 0;
  }
}

@end