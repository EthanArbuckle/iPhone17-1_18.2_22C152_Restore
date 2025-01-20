@interface SXAnimatedImageFrame
- (double)duration;
- (id)image;
- (id)initWithImageSource:(void *)a3 index:(void *)a4 cache:(void *)a5 type:;
- (uint64_t)index;
- (void)captureFrameProperties;
- (void)dealloc;
@end

@implementation SXAnimatedImageFrame

- (id)initWithImageSource:(void *)a3 index:(void *)a4 cache:(void *)a5 type:
{
  id v10 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)SXAnimatedImageFrame;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      a1[2] = (id)CFRetain(a2);
      a1[4] = a3;
      objc_storeStrong(a1 + 1, a4);
      a1[5] = a5;
      -[SXAnimatedImageFrame captureFrameProperties]((uint64_t)a1);
    }
  }

  return a1;
}

- (void)captureFrameProperties
{
  if (a1)
  {
    v1 = (const void **)MEMORY[0x263F0F370];
    v2 = (const void **)MEMORY[0x263F0F368];
    *(void *)(a1 + 24) = 0x3FB999999999999ALL;
    v3 = (double *)(a1 + 24);
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4 == 1) {
      v1 = (const void **)MEMORY[0x263F0F4E0];
    }
    v5 = *v1;
    if (v4 == 1) {
      v6 = (const void **)MEMORY[0x263F0F058];
    }
    else {
      v6 = v2;
    }
    CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(*(CGImageSourceRef *)(a1 + 16), *(void *)(a1 + 32), 0);
    value = 0;
    if (CFDictionaryGetValueIfPresent(v7, v5, (const void **)&value))
    {
      if (v4 == 1) {
        v8 = (const void *)*MEMORY[0x263F0F070];
      }
      else {
        v8 = (const void *)*MEMORY[0x263F0F390];
      }
      CFNumberRef number = 0;
      if (!CFDictionaryGetValueIfPresent((CFDictionaryRef)value, v8, (const void **)&number)) {
        CFDictionaryGetValueIfPresent((CFDictionaryRef)value, *v6, (const void **)&number);
      }
      if (number) {
        CFNumberGetValue(number, kCFNumberDoubleType, v3);
      }
    }
    CFRelease(v7);
    if (*v3 < 0.011) {
      double *v3 = 0.1;
    }
  }
}

- (uint64_t)index
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (id)image
{
  if (a1)
  {
    a1 = [*(id *)(a1 + 8) imageForFrameIndex:*(void *)(a1 + 32)];
    uint64_t v1 = vars8;
  }
  return (id)a1;
}

- (void)dealloc
{
  imageSource = self->_imageSource;
  if (imageSource)
  {
    CFRelease(imageSource);
    self->_imageSource = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SXAnimatedImageFrame;
  [(SXAnimatedImageFrame *)&v4 dealloc];
}

- (double)duration
{
  if (a1) {
    return *(double *)(a1 + 24);
  }
  else {
    return 0.0;
  }
}

- (void).cxx_destruct
{
}

@end