@interface RBDecodedFontMetadata
+ (id)fontMetadata:(uint64_t)a1;
- (id).cxx_construct;
- (uint64_t)fontUID;
- (uint64_t)glyphMap;
- (void)initWithFontUID:(const void *)a3 glyphMap:;
@end

@implementation RBDecodedFontMetadata

- (uint64_t)fontUID
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

+ (id)fontMetadata:(uint64_t)a1
{
  self;
  id AssociatedObject = objc_getAssociatedObject(a2, "RBDecodedFontMetadata");
  if (!AssociatedObject) {
    return 0;
  }
  id v4 = AssociatedObject;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return v4;
}

- (void)initWithFontUID:(const void *)a3 glyphMap:
{
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)RBDecodedFontMetadata;
  v5 = objc_msgSendSuper2(&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = (const void *)v5[1];
    if (v7 != a2)
    {
      if (v7) {
        CFRelease(v7);
      }
      if (a2) {
        CFTypeRef v8 = CFRetain(a2);
      }
      else {
        CFTypeRef v8 = 0;
      }
      v6[1] = v8;
    }
    v9 = (const void *)v6[2];
    if (v9 != a3)
    {
      if (v9) {
        CFRelease(v9);
      }
      if (a3) {
        CFTypeRef v10 = CFRetain(a3);
      }
      else {
        CFTypeRef v10 = 0;
      }
      v6[2] = v10;
    }
  }
  return v6;
}

- (uint64_t)glyphMap
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void).cxx_destruct
{
  p = self->_glyph_map._p;
  if (p) {
    CFRelease(p);
  }
  id v4 = self->_uid._p;
  if (v4)
  {
    CFRelease(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end