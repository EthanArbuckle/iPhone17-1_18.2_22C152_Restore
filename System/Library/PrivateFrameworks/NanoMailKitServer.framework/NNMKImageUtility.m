@interface NNMKImageUtility
+ (void)scaleImageFromData:(id)a3 destinationData:(id)a4 maxWidth:(float)a5;
+ (void)scaleImageFromData:(id)a3 destinationURL:(id)a4 maxWidth:(float)a5;
+ (void)scaleImageFromURL:(id)a3 destinationURL:(id)a4 maxWidth:(float)a5;
+ (void)scaleImageFromURL:(id)a3 imageData:(id)a4 destinationURL:(id)a5 destinationData:(id)a6 maxWidth:(float)a7;
@end

@implementation NNMKImageUtility

+ (void)scaleImageFromData:(id)a3 destinationData:(id)a4 maxWidth:(float)a5
{
}

+ (void)scaleImageFromData:(id)a3 destinationURL:(id)a4 maxWidth:(float)a5
{
}

+ (void)scaleImageFromURL:(id)a3 destinationURL:(id)a4 maxWidth:(float)a5
{
}

+ (void)scaleImageFromURL:(id)a3 imageData:(id)a4 destinationURL:(id)a5 destinationData:(id)a6 maxWidth:(float)a7
{
  v34[3] = *MEMORY[0x263EF8340];
  CFURLRef v11 = (const __CFURL *)a3;
  CFDataRef v12 = (const __CFData *)a4;
  CFURLRef v13 = (const __CFURL *)a5;
  v14 = (__CFData *)a6;
  if (v12) {
    v15 = CGImageSourceCreateWithData(v12, 0);
  }
  else {
    v15 = CGImageSourceCreateWithURL(v11, 0);
  }
  v16 = v15;
  if (v15)
  {
    CFDictionaryRef v17 = CGImageSourceCopyPropertiesAtIndex(v15, 0, 0);
    if (v17)
    {
      CFDictionaryRef v19 = v17;
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v17, (const void *)*MEMORY[0x263F0F4F8]);
      if (Value)
      {
        double v32 = 0.0;
        CFNumberGetValue(Value, kCFNumberCGFloatType, &v32);
        if (v32 < a7) {
          a7 = v32;
        }
      }
      CFRelease(v19);
    }
    v21 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v22 = *MEMORY[0x263F0F600];
    v34[0] = MEMORY[0x263EFFA80];
    uint64_t v23 = *MEMORY[0x263F0EFE0];
    v33[0] = v22;
    v33[1] = v23;
    *(float *)&double v18 = a7;
    v24 = [NSNumber numberWithFloat:v18];
    v33[2] = *MEMORY[0x263F0EFE8];
    v34[1] = v24;
    v34[2] = &unk_26F131738;
    v25 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
    CFDictionaryRef v26 = [v21 dictionaryWithDictionary:v25];

    size_t Count = CGImageSourceGetCount(v16);
    CFStringRef Type = CGImageSourceGetType(v16);
    if (v14) {
      CGImageDestinationRef v29 = CGImageDestinationCreateWithData(v14, Type, Count, 0);
    }
    else {
      CGImageDestinationRef v29 = CGImageDestinationCreateWithURL(v13, Type, Count, 0);
    }
    v30 = v29;
    if (v29)
    {
      if (Count)
      {
        for (size_t i = 0; i != Count; ++i)
          CGImageDestinationAddImageFromSource(v30, v16, i, v26);
      }
      CGImageDestinationFinalize(v30);
      CFRelease(v30);
    }

    CFRelease(v16);
  }
}

@end