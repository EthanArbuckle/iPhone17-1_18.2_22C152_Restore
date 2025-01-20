@interface UICTFont
- (BOOL)allowsWeakReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)retainWeakReference;
- (UICTFont)retain;
- (unint64_t)hash;
@end

@implementation UICTFont

- (unint64_t)hash
{
  unint64_t v3 = _CFNonObjCHash();
  ExtraData = (void *)__CTFontGetExtraData((const __CTFont *)self);
  if (ExtraData) {
    v3 ^= [ExtraData hash];
  }
  return v3;
}

- (UICTFont)retain
{
  return self;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  if (self == a3) {
    goto LABEL_9;
  }
  int v5 = _CFNonObjCEqual();
  if (!v5) {
    return v5;
  }
  ExtraData = (void *)__CTFontGetExtraData((const __CTFont *)self);
  uint64_t v7 = __CTFontGetExtraData((const __CTFont *)a3);
  if (ExtraData == (void *)v7)
  {
LABEL_9:
    LOBYTE(v5) = 1;
    return v5;
  }

  LOBYTE(v5) = [ExtraData isEqualToExtraData:v7];
  return v5;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

@end