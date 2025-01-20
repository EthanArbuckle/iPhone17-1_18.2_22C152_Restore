@interface QLCacheIndexFileRequest
- (BOOL)allSizes;
- (BOOL)hasAtLeastOneLowQuality;
- (QLCacheFileIdentifier)fileIdentifier;
- (QLCacheIndexFileRequest)initWithFileIdentifier:(id)a3;
- (QLCacheIndexFileRequest)initWithFileIdentifier:(id)a3 version:(id)a4;
- (QLCacheIndexFileRequest)initWithVersionedFileIdentifier:(id)a3;
- (QLThumbnailVersion)version;
- (float)minimumSizeAtIndex:(unint64_t)a3;
- (float)sizeAtIndex:(int64_t)a3;
- (int)interpolationQualityAtIndex:(unint64_t)a3;
- (int64_t)iconVariantAtIndex:(unint64_t)a3;
- (int64_t)sizeAndIconModeCount;
- (unint64_t)badgeTypeAtIndex:(unint64_t)a3;
- (unint64_t)cacheId;
- (unint64_t)externalGeneratorDataHashAtIndex:(unint64_t)a3;
- (unsigned)iconModeAtIndex:(int64_t)a3;
- (unsigned)lowQualityAtIndex:(int64_t)a3;
- (void)_setCacheId:(unint64_t)a3;
- (void)appendSize:(float)a3 minimumSize:(float)a4 withIconMode:(unsigned __int8)a5 lowQuality:(BOOL)a6 badgeType:(unint64_t)a7 iconVariant:(int64_t)a8 interpolationQuality:(int)a9 externalGeneratorDataHash:(unint64_t)a10;
- (void)dealloc;
@end

@implementation QLCacheIndexFileRequest

- (unint64_t)cacheId
{
  return self->_cacheId;
}

- (BOOL)hasAtLeastOneLowQuality
{
  return self->_atLeastOneLowQuality;
}

- (float)sizeAtIndex:(int64_t)a3
{
  float valuePtr = 0.0;
  CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(self->_sizes, a3);
  int Value = CFNumberGetValue(ValueAtIndex, kCFNumberFloatType, &valuePtr);
  float result = valuePtr;
  if (!Value) {
    return 0.0;
  }
  return result;
}

- (int64_t)sizeAndIconModeCount
{
  return CFArrayGetCount(self->_sizes);
}

- (float)minimumSizeAtIndex:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_minimumSizes objectAtIndexedSubscript:a3];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (int)interpolationQualityAtIndex:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_interpolationQualities objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (QLCacheIndexFileRequest)initWithFileIdentifier:(id)a3 version:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)QLCacheIndexFileRequest;
  v9 = [(QLCacheIndexFileRequest *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileIdentifier, a3);
    v11 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
    v10->_sizes = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    minimumSizes = v10->_minimumSizes;
    v10->_minimumSizes = (NSMutableArray *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    badgeTypes = v10->_badgeTypes;
    v10->_badgeTypes = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    externalGeneratorDataHashs = v10->_externalGeneratorDataHashs;
    v10->_externalGeneratorDataHashs = (NSMutableArray *)v16;

    v10->_iconModes = CFArrayCreateMutable(0, 0, v11);
    v10->_lowQualities = CFArrayCreateMutable(0, 0, v11);
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    iconVariants = v10->_iconVariants;
    v10->_iconVariants = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    interpolationQualities = v10->_interpolationQualities;
    v10->_interpolationQualities = v20;

    objc_storeStrong((id *)&v10->_version, a4);
  }

  return v10;
}

- (int64_t)iconVariantAtIndex:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_iconVariants objectAtIndexedSubscript:a3];
  int64_t v4 = (int)[v3 intValue];

  return v4;
}

- (unsigned)iconModeAtIndex:(int64_t)a3
{
  CFBooleanRef ValueAtIndex = (const __CFBoolean *)CFArrayGetValueAtIndex(self->_iconModes, a3);
  return CFBooleanGetValue(ValueAtIndex);
}

- (unint64_t)externalGeneratorDataHashAtIndex:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_externalGeneratorDataHashs objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)badgeTypeAtIndex:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->_badgeTypes objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)allSizes
{
  return CFArrayGetCount(self->_sizes) == 0;
}

- (QLCacheFileIdentifier)fileIdentifier
{
  return (QLCacheFileIdentifier *)objc_getProperty(self, a2, 80, 1);
}

- (QLThumbnailVersion)version
{
  return (QLThumbnailVersion *)objc_getProperty(self, a2, 88, 1);
}

- (void)_setCacheId:(unint64_t)a3
{
  self->_cacheId = a3;
}

- (void)dealloc
{
  sizes = self->_sizes;
  if (sizes) {
    CFRelease(sizes);
  }
  iconModes = self->_iconModes;
  if (iconModes) {
    CFRelease(iconModes);
  }
  lowQualities = self->_lowQualities;
  if (lowQualities) {
    CFRelease(lowQualities);
  }
  v6.receiver = self;
  v6.super_class = (Class)QLCacheIndexFileRequest;
  [(QLCacheIndexFileRequest *)&v6 dealloc];
}

- (void)appendSize:(float)a3 minimumSize:(float)a4 withIconMode:(unsigned __int8)a5 lowQuality:(BOOL)a6 badgeType:(unint64_t)a7 iconVariant:(int64_t)a8 interpolationQuality:(int)a9 externalGeneratorDataHash:(unint64_t)a10
{
  int v14 = a6;
  int v15 = a5;
  float valuePtr = a3;
  CFNumberRef v18 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  sizes = self->_sizes;
  v41.length = CFArrayGetCount(sizes);
  v41.location = 0;
  FirstIndexOfint Value = CFArrayGetFirstIndexOfValue(sizes, v41, v18);
  if (FirstIndexOfValue == -1)
  {
LABEL_10:
    minimumSizes = self->_minimumSizes;
    *(float *)&double v21 = a4;
    v26 = [NSNumber numberWithFloat:v21];
    [(NSMutableArray *)minimumSizes addObject:v26];

    badgeTypes = self->_badgeTypes;
    v28 = [NSNumber numberWithUnsignedInteger:a7];
    [(NSMutableArray *)badgeTypes addObject:v28];

    externalGeneratorDataHashs = self->_externalGeneratorDataHashs;
    v30 = [NSNumber numberWithUnsignedInteger:a10];
    [(NSMutableArray *)externalGeneratorDataHashs addObject:v30];

    CFArrayAppendValue(self->_sizes, v18);
    v31 = (const void *)*MEMORY[0x1E4F1CFD0];
    v32 = (const void *)*MEMORY[0x1E4F1CFC8];
    if (v14) {
      v33 = (const void *)*MEMORY[0x1E4F1CFD0];
    }
    else {
      v33 = (const void *)*MEMORY[0x1E4F1CFC8];
    }
    CFArrayAppendValue(self->_lowQualities, v33);
    if (self->_atLeastOneLowQuality) {
      BOOL v34 = 1;
    }
    else {
      BOOL v34 = v14;
    }
    self->_atLeastOneLowQuality = v34;
    if (v15) {
      v35 = v31;
    }
    else {
      v35 = v32;
    }
    CFArrayAppendValue(self->_iconModes, v35);
    iconVariants = self->_iconVariants;
    v37 = [NSNumber numberWithInteger:a8];
    [(NSMutableArray *)iconVariants addObject:v37];

    interpolationQualities = self->_interpolationQualities;
    v39 = [NSNumber numberWithInt:a9];
    [(NSMutableArray *)interpolationQualities addObject:v39];
  }
  else
  {
    CFIndex v22 = FirstIndexOfValue;
    while ([(QLCacheIndexFileRequest *)self iconModeAtIndex:v22] != v15
         || [(QLCacheIndexFileRequest *)self lowQualityAtIndex:v22] != v14
         || [(QLCacheIndexFileRequest *)self badgeTypeAtIndex:v22] != a7
         || [(QLCacheIndexFileRequest *)self iconVariantAtIndex:v22] != a8
         || [(QLCacheIndexFileRequest *)self interpolationQualityAtIndex:v22] != a9
         || [(QLCacheIndexFileRequest *)self externalGeneratorDataHashAtIndex:v22] != a10)
    {
      CFIndex v23 = v22 + 1;
      v24 = self->_sizes;
      v42.length = CFArrayGetCount(v24) - v23;
      v42.location = v23;
      CFIndex v22 = CFArrayGetFirstIndexOfValue(v24, v42, v18);
      if (v22 == -1) {
        goto LABEL_10;
      }
    }
  }
  CFRelease(v18);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_fileIdentifier, 0);
  objc_storeStrong((id *)&self->_interpolationQualities, 0);
  objc_storeStrong((id *)&self->_iconVariants, 0);
  objc_storeStrong((id *)&self->_externalGeneratorDataHashs, 0);
  objc_storeStrong((id *)&self->_badgeTypes, 0);
  objc_storeStrong((id *)&self->_minimumSizes, 0);
}

- (QLCacheIndexFileRequest)initWithFileIdentifier:(id)a3
{
  return [(QLCacheIndexFileRequest *)self initWithFileIdentifier:a3 version:0];
}

- (QLCacheIndexFileRequest)initWithVersionedFileIdentifier:(id)a3
{
  id v4 = a3;
  float v5 = [v4 fileIdentifier];
  objc_super v6 = [v4 version];

  id v7 = [(QLCacheIndexFileRequest *)self initWithFileIdentifier:v5 version:v6];
  return v7;
}

- (unsigned)lowQualityAtIndex:(int64_t)a3
{
  CFBooleanRef ValueAtIndex = (const __CFBoolean *)CFArrayGetValueAtIndex(self->_lowQualities, a3);
  return CFBooleanGetValue(ValueAtIndex);
}

@end