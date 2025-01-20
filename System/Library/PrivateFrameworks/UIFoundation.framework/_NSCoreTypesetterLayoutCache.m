@interface _NSCoreTypesetterLayoutCache
- (BOOL)getCTLine:(void *)a3 attachmentLayoutContext:(unsigned char *)a4 lineValidForDrawing:;
- (uint64_t)getCount:(void *)a3 glyphs:(void *)a4 advances:(void *)a5 elasticAdvances:(CFTypeRef *)a6 resolvedFont:(void *)a7 textAlignment:;
- (void)dealloc;
- (void)setCTLine:(void *)a3 attachmentLayoutContext:(char)a4 validForDrawing:;
- (void)setCount:(const void *)a3 glyphs:(const void *)a4 advances:(const void *)a5 elasticAdvances:(void *)a6 resolvedFont:(double)a7 textAlignment:;
@end

@implementation _NSCoreTypesetterLayoutCache

- (uint64_t)getCount:(void *)a3 glyphs:(void *)a4 advances:(void *)a5 elasticAdvances:(CFTypeRef *)a6 resolvedFont:(void *)a7 textAlignment:
{
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)(result + 16);
    if (v8)
    {
      *a2 = *(void *)(result + 8);
      *a3 = v8;
      *a4 = *(void *)(result + 24);
      *a5 = *(void *)(result + 32);
      CFTypeRef v11 = CFRetain(*(CFTypeRef *)(result + 40));
      *a6 = CFAutorelease(v11);
      *a7 = *(void *)(v7 + 48);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setCount:(const void *)a3 glyphs:(const void *)a4 advances:(const void *)a5 elasticAdvances:(void *)a6 resolvedFont:(double)a7 textAlignment:
{
  if (result)
  {
    size_t v12 = a2;
    v13 = result;
    result[1] = (void *)a2;
    free(result[2]);
    v14 = malloc_type_malloc(2 * v12, 0x1000040BDFB0063uLL);
    v13[2] = v14;
    memcpy(v14, a3, 2 * v12);
    free(v13[3]);
    v12 *= 16;
    v15 = malloc_type_malloc(v12, 0x1000040451B5BE8uLL);
    v13[3] = v15;
    memcpy(v15, a4, v12);
    *((double *)v13 + 4) = a7;
    v16 = v13[5];
    if (v16) {
      CFRelease(v16);
    }
    result = (void **)CFRetain(a5);
    v13[5] = result;
    v13[6] = a6;
  }
  return result;
}

- (void)setCTLine:(void *)a3 attachmentLayoutContext:(char)a4 validForDrawing:
{
  if (a1)
  {
    CFTypeRef v8 = *(CFTypeRef *)(a1 + 56);
    if (v8 != cf)
    {
      if (v8)
      {
        CFRelease(v8);
        *(void *)(a1 + 56) = 0;
      }
      if (cf) {
        *(void *)(a1 + 56) = CFRetain(cf);
      }
    }
    v9 = *(void **)(a1 + 64);
    if (v9 != a3)
    {

      *(void *)(a1 + 64) = a3;
    }
    *(unsigned char *)(a1 + 72) = a4;
  }
}

- (BOOL)getCTLine:(void *)a3 attachmentLayoutContext:(unsigned char *)a4 lineValidForDrawing:
{
  if (!a1) {
    return 0;
  }
  if (a4) {
    *a4 = *(unsigned char *)(a1 + 72);
  }
  if (a3) {
    *a3 = *(void *)(a1 + 64);
  }
  if (!a2) {
    return 0;
  }
  CFTypeRef v5 = *(CFTypeRef *)(a1 + 56);
  BOOL v6 = v5 != 0;
  if (v5)
  {
    CFTypeRef v7 = CFRetain(v5);
    CFTypeRef v5 = CFAutorelease(v7);
  }
  *a2 = v5;
  return v6;
}

- (void)dealloc
{
  free(self->_glyphs);
  free(self->_advances);
  resolvedFont = self->_resolvedFont;
  if (resolvedFont) {
    CFRelease(resolvedFont);
  }
  line = self->_line;
  if (line) {
    CFRelease(line);
  }

  v5.receiver = self;
  v5.super_class = (Class)_NSCoreTypesetterLayoutCache;
  [(_NSCoreTypesetterLayoutCache *)&v5 dealloc];
}

@end