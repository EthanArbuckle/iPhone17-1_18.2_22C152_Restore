@interface UIAnimatedAttachmentView
@end

@implementation UIAnimatedAttachmentView

void __63___UIAnimatedAttachmentView_cachedObjectWithKey_creationBlock___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:5 valueOptions:5];
  v1 = (void *)qword_1EB2648A0;
  qword_1EB2648A0 = v0;
}

id __48___UIAnimatedAttachmentView_initWithAttachment___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  CFDataRef v1 = (const __CFData *)*(id *)(a1 + 32);
  v30 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"contents"];
  CFDataRef v31 = v1;
  v2 = CGImageSourceCreateWithData(v1, 0);
  size_t Count = CGImageSourceGetCount(v2);
  v36 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count + 1];
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
  v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count + 1];
  if (Count)
  {
    size_t v6 = 0;
    uint64_t v7 = *MEMORY[0x1E4F2FF48];
    key = (void *)*MEMORY[0x1E4F2F990];
    v34 = (void *)*MEMORY[0x1E4F2F9A8];
    v32 = (void *)*MEMORY[0x1E4F2F988];
    v33 = (void *)*MEMORY[0x1E4F2FCD8];
    double v8 = 0.0;
    do
    {
      float valuePtr = 0.0;
      *(void *)&long long v39 = v7;
      v38[0] = MEMORY[0x1E4F1CC38];
      objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v38, &v39, 1, v30, v31);
      CFDictionaryRef v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CFDictionaryRef v10 = CGImageSourceCopyPropertiesAtIndex(v2, v6, v9);

      if (v10)
      {
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v10, key);
        if (Value || (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v10, v33)) != 0)
        {
          CFDictionaryRef v12 = Value;
          CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(Value, v34);
          if (v13 || (CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v12, v32)) != 0) {
            CFNumberGetValue(v13, kCFNumberFloatType, &valuePtr);
          }
        }
        CFRelease(v10);
        float v14 = valuePtr;
      }
      else
      {
        float v14 = 0.0;
      }
      if (v14 >= 0.011) {
        double v15 = v14;
      }
      else {
        double v15 = 0.100000001;
      }
      CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v2, v6, 0);
      [v36 addObject:ImageAtIndex];

      v17 = [NSNumber numberWithDouble:v15];
      [v4 addObject:v17];

      double v8 = v8 + v15;
      ++v6;
    }
    while (Count != v6);
  }
  else
  {
    double v8 = 0.0;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v18 = v4;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v40;
    double v22 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v25 = objc_msgSend(NSNumber, "numberWithDouble:", v22, v30);
        [v5 addObject:v25];

        [v24 doubleValue];
        double v22 = v22 + v26 / v8;
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v38 count:16];
    }
    while (v20);
  }

  [v5 addObject:&unk_1ED3F2838];
  v27 = [v36 firstObject];
  [v36 addObject:v27];

  [v30 setValues:v36];
  [v30 setKeyTimes:v5];
  [v30 setDuration:v8];
  LODWORD(v28) = 2139095039;
  [v30 setRepeatCount:v28];
  [v30 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v30 setCalculationMode:*MEMORY[0x1E4F39D78]];
  [v30 setRemovedOnCompletion:0];
  [v30 setBeginTimeMode:*MEMORY[0x1E4F39D60]];
  CFRelease(v2);

  return v30;
}

@end