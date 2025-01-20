@interface PFVideoAdjustments
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameDurationForNominalFrameRate:(SEL)a3;
+ ($9E16F6706E08E1DCF37CEDFAE5F41851)defaultSlowMotionTimeRangeForDuration:(SEL)a3;
+ (BOOL)isRecognizedSlowMotionFormatWithIdentifier:(id)a3 version:(id)a4;
+ (float)defaultSlowMotionRateForNominalFrameRate:(float)a3;
+ (id)defaultSlowMotionAdjustmentsForAsset:(id)a3;
+ (id)defaultVideoAdjustmentsURLForVideoURL:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToOriginalTimeFromScaledTime:(SEL)a3 forExport:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToScaledTimeFromOriginalTime:(SEL)a3 forExport:(id *)a4;
- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampIn;
- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampOut;
- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionTimeRange;
- (BOOL)_isValidSlowMotionTimeRange:(id *)a3 rate:(float)a4;
- (BOOL)_parseAppleVideoDataBlobDictionary:(id)a3 forSlowMotionTimeRange:(id *)a4 rate:(float *)a5;
- (BOOL)_parseLegacySLMDictionary:(id)a3 forSlowMotionTimeRange:(id *)a4 rate:(float *)a5;
- (BOOL)_parseVersionedDataForSlowMotionTimeRange:(id *)a3 rate:(float *)a4;
- (BOOL)hasSlowMotionAdjustments;
- (BOOL)isRecognizedFormat;
- (PFVideoAdjustments)initWithPropertyListDictionary:(id)a3;
- (PFVideoAdjustments)initWithSlowMotionTimeRange:(id *)a3 rate:(float)a4;
- (float)slowMotionRate;
- (id)_adjustmentsObjectFromNSKeyedArchiverData:(id)a3;
- (id)_dictionaryFromSlowMotionTimeRange:(id *)a3 rate:(float)a4;
- (id)description;
- (void)_updateDerivedPropertiesFromVersionedData;
- (void)setSlowMotionRate:(float)a3;
- (void)setSlowMotionTimeRange:(id *)a3;
@end

@implementation PFVideoAdjustments

- (void)setSlowMotionTimeRange:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.var3;
  long long v3 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)(&self->_slowMotionRate + 1) = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&self->_slowMotionTimeRange.start.flags = v4;
  *(_OWORD *)((char *)&self->_slowMotionTimeRange.duration.value + 4) = v3;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionTimeRange
{
  long long v3 = *(_OWORD *)((char *)&self->var1.var3 + 4);
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)((char *)&self->var1.var0 + 4);
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var2;
  return self;
}

- (void)setSlowMotionRate:(float)a3
{
  self->_slowMotionRate = a3;
}

- (float)slowMotionRate
{
  return self->_slowMotionRate;
}

- (id)_adjustmentsObjectFromNSKeyedArchiverData:(id)a3
{
  v14[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v4 = (void *)MEMORY[0x1A6259880]();
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  id v11 = 0;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v11];
  id v8 = v11;
  if (v7)
  {
    v9 = [v7 decodeObjectOfClasses:v6 forKey:*MEMORY[0x1E4F284E8]];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't unarchive data: error %@", buf, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (id)_dictionaryFromSlowMotionTimeRange:(id *)a3 rate:(float)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v16.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v16.start.epoch = v6;
  *(_OWORD *)&v16.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CFDictionaryRef v7 = CMTimeRangeCopyAsDictionary(&v16, v5);
  CFDictionaryRef v8 = v7;
  if (v7)
  {
    v22 = @"timeRange";
    v23[0] = v7;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v21 = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    *(float *)&double v11 = a4;
    v12 = [NSNumber numberWithFloat:v11];
    v19[0] = @"rate";
    v19[1] = @"regions";
    v20[0] = v12;
    v20[1] = v10;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v17 = @"slowMotion";
    v18 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_parseAppleVideoDataBlobDictionary:(id)a3 forSlowMotionTimeRange:(id *)a4 rate:(float *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = MEMORY[0x1E4F1FA20];
  CMTimeValue value = *MEMORY[0x1E4F1FA20];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
  CFDictionaryRef v8 = [a3 objectForKeyedSubscript:@"slowMotion"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 objectForKeyedSubscript:@"rate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      int v11 = v10;
      v12 = [v8 objectForKeyedSubscript:@"regions"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 count])
      {
        unsigned int v13 = *(_DWORD *)(v7 + 12);
        CMTimeValue v22 = *(void *)(v7 + 24);
        CMTimeEpoch v23 = *(void *)(v7 + 16);
        CMTimeFlags flags = *(_DWORD *)(v7 + 36);
        CMTimeScale v21 = *(_DWORD *)(v7 + 32);
        CMTimeEpoch epoch = *(void *)(v7 + 40);
        CMTimeRange v16 = [v12 firstObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          CMTimeFlags v20 = v13;
          CFDictionaryRef v17 = [v16 objectForKeyedSubscript:@"timeRange"];
          objc_opt_class();
          BOOL v18 = 0;
          if ((objc_opt_isKindOfClass() & 1) != 0 && v17)
          {
            CMTimeRangeMakeFromDictionary(&v24, v17);
            CMTimeValue value = v24.start.value;
            CMTimeScale timescale = v24.start.timescale;
            CMTimeFlags flags = v24.duration.flags;
            CMTimeFlags v20 = v24.start.flags;
            CMTimeScale v21 = v24.duration.timescale;
            CMTimeEpoch epoch = v24.duration.epoch;
            CMTimeValue v22 = v24.duration.value;
            CMTimeEpoch v23 = v24.start.epoch;
            if (v24.start.flags)
            {
              if (v24.duration.value >= 0) {
                BOOL v18 = v24.duration.flags & (v24.duration.epoch == 0);
              }
              else {
                BOOL v18 = 0;
              }
            }
            else
            {
              BOOL v18 = 0;
            }
          }

          unsigned int v13 = v20;
        }
        else
        {
          BOOL v18 = 0;
        }
        a4->var0.var0 = value;
        a4->var0.var1 = timescale;
        a4->var0.var2 = v13;
        a4->var0.var3 = v23;
        a4->var1.var0 = v22;
        a4->var1.var1 = v21;
        a4->var1.var2 = flags;
        a4->var1.var3 = epoch;
        *(_DWORD *)a5 = v11;
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)_parseVersionedDataForSlowMotionTimeRange:(id *)a3 rate:(float *)a4
{
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v21 = *MEMORY[0x1E4F1FA20];
  long long v22 = v7;
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  int v20 = 1065353216;
  CFDictionaryRef v8 = [(PFAssetAdjustments *)self adjustmentFormatVersion];
  int v9 = [v8 isEqualToString:@"1.1"];

  int v10 = [(PFAssetAdjustments *)self adjustmentFormatVersion];
  int v11 = [v10 isEqualToString:@"1.0"];

  v12 = [(PFAssetAdjustments *)self adjustmentFormatIdentifier];
  if (![v12 isEqualToString:@"com.apple.video.slomo"])
  {

    goto LABEL_7;
  }

  if ((v9 | v11) != 1)
  {
LABEL_7:
    BOOL v15 = 0;
    float v16 = 1.0;
    goto LABEL_16;
  }
  unsigned int v13 = [(PFAssetAdjustments *)self adjustmentData];
  if (!v13) {
    goto LABEL_11;
  }
  if (!v9)
  {
    if (v11)
    {
      uint64_t v14 = [(PFVideoAdjustments *)self _adjustmentsObjectFromNSKeyedArchiverData:v13];
      goto LABEL_10;
    }
LABEL_11:
    CFDictionaryRef v17 = 0;
    goto LABEL_12;
  }
  uint64_t v14 = [MEMORY[0x1E4F28F98] propertyListWithData:v13 options:0 format:0 error:0];
LABEL_10:
  CFDictionaryRef v17 = (void *)v14;
LABEL_12:
  objc_opt_class();
  BOOL v15 = (objc_opt_isKindOfClass() & 1) != 0
     && [(PFVideoAdjustments *)self _parseAppleVideoDataBlobDictionary:v17 forSlowMotionTimeRange:&v21 rate:&v20];

  float v16 = *(float *)&v20;
LABEL_16:
  long long v18 = v22;
  *(_OWORD *)&a3->var0.var0 = v21;
  *(_OWORD *)&a3->var0.var3 = v18;
  *(_OWORD *)&a3->var1.var1 = v23;
  *a4 = v16;
  return v15;
}

- (BOOL)_parseLegacySLMDictionary:(id)a3 forSlowMotionTimeRange:(id *)a4 rate:(float *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = MEMORY[0x1E4F1FA20];
  CMTimeValue value = *MEMORY[0x1E4F1FA20];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
  int v9 = [v7 objectForKeyedSubscript:@"version"];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    && [v9 intValue] <= 1)
  {
    int v11 = [v7 objectForKeyedSubscript:@"regions"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 count])
    {
      unsigned int v12 = *(_DWORD *)(v8 + 12);
      CMTimeValue v20 = *(void *)(v8 + 24);
      CMTimeEpoch v21 = *(void *)(v8 + 16);
      CMTimeFlags flags = *(_DWORD *)(v8 + 36);
      CMTimeScale v19 = *(_DWORD *)(v8 + 32);
      CMTimeEpoch epoch = *(void *)(v8 + 40);
      BOOL v15 = [v11 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CMTimeFlags v18 = v12;
        CFDictionaryRef v16 = [v15 objectForKeyedSubscript:@"timeRange"];
        objc_opt_class();
        BOOL v10 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0 && v16)
        {
          CMTimeRangeMakeFromDictionary(&v22, v16);
          CMTimeValue value = v22.start.value;
          CMTimeScale timescale = v22.start.timescale;
          CMTimeFlags flags = v22.duration.flags;
          CMTimeFlags v18 = v22.start.flags;
          CMTimeScale v19 = v22.duration.timescale;
          CMTimeEpoch epoch = v22.duration.epoch;
          CMTimeValue v20 = v22.duration.value;
          CMTimeEpoch v21 = v22.start.epoch;
          if (v22.start.flags)
          {
            if (v22.duration.value >= 0) {
              BOOL v10 = v22.duration.flags & (v22.duration.epoch == 0);
            }
            else {
              BOOL v10 = 0;
            }
          }
          else
          {
            BOOL v10 = 0;
          }
        }

        unsigned int v12 = v18;
      }
      else
      {
        BOOL v10 = 0;
      }
      a4->var0.var0 = value;
      a4->var0.var1 = timescale;
      a4->var0.var2 = v12;
      a4->var0.var3 = v21;
      a4->var1.var0 = v20;
      a4->var1.var1 = v19;
      a4->var1.var2 = flags;
      a4->var1.var3 = epoch;
      *a5 = 0.25;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)_updateDerivedPropertiesFromVersionedData
{
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v6 = *MEMORY[0x1E4F1FA20];
  long long v9 = *MEMORY[0x1E4F1FA20];
  long long v10 = v5;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  long long v11 = v4;
  int v8 = 1065353216;
  if (![(PFVideoAdjustments *)self _parseVersionedDataForSlowMotionTimeRange:&v9 rate:&v8])
  {
    long long v9 = v6;
    long long v10 = v5;
    long long v11 = v4;
    int v8 = 1065353216;
  }
  v7[0] = v9;
  v7[1] = v10;
  v7[2] = v11;
  [(PFVideoAdjustments *)self setSlowMotionTimeRange:v7];
  LODWORD(v3) = v8;
  [(PFVideoAdjustments *)self setSlowMotionRate:v3];
}

- (BOOL)isRecognizedFormat
{
  double v3 = objc_opt_class();
  long long v4 = [(PFAssetAdjustments *)self adjustmentFormatIdentifier];
  long long v5 = [(PFAssetAdjustments *)self adjustmentFormatVersion];
  LOBYTE(v3) = [v3 isRecognizedSlowMotionFormatWithIdentifier:v4 version:v5];

  return (char)v3;
}

- (id)description
{
  if ([(PFVideoAdjustments *)self isRecognizedFormat])
  {
    [(PFVideoAdjustments *)self slowMotionTimeRange];
    CMTime time = v13;
    double Seconds = CMTimeGetSeconds(&time);
    [(PFVideoAdjustments *)self slowMotionTimeRange];
    CMTime v12 = v11;
    double v4 = Seconds + CMTimeGetSeconds(&v12);
    v10.receiver = self;
    v10.super_class = (Class)PFVideoAdjustments;
    long long v5 = [(PFAssetAdjustments *)&v10 description];
    [(PFVideoAdjustments *)self slowMotionRate];
    id v7 = [v5 stringByAppendingFormat:@" slowMotion (%.2fx from %.2fs to %.2fs)", v6, *(void *)&Seconds, *(void *)&v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PFVideoAdjustments;
    id v7 = [(PFAssetAdjustments *)&v9 description];
  }

  return v7;
}

- (PFVideoAdjustments)initWithPropertyListDictionary:(id)a3
{
  id v4 = a3;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  long long v14 = *MEMORY[0x1E4F1FA20];
  long long v15 = v5;
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  int v13 = 1065353216;
  if ([(PFVideoAdjustments *)self _parseLegacySLMDictionary:v4 forSlowMotionTimeRange:&v14 rate:&v13])
  {
    LODWORD(v6) = v13;
    v12[0] = v14;
    v12[1] = v15;
    v12[2] = v16;
    id v7 = [(PFVideoAdjustments *)self initWithSlowMotionTimeRange:v12 rate:v6];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PFVideoAdjustments;
    int v8 = [(PFAssetAdjustments *)&v11 initWithPropertyListDictionary:v4];
    id v7 = v8;
    if (v8) {
      [(PFVideoAdjustments *)v8 _updateDerivedPropertiesFromVersionedData];
    }
  }
  objc_super v9 = v7;

  return v9;
}

+ (id)defaultVideoAdjustmentsURLForVideoURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 URLByDeletingPathExtension];
  long long v5 = [v4 URLByAppendingPathExtension:@"SLM"];

  double v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [v5 path];
  char v8 = [v6 fileExistsAtPath:v7];

  if ((v8 & 1) == 0)
  {
    objc_super v9 = [v3 URLByDeletingPathExtension];
    uint64_t v10 = [v9 URLByAppendingPathExtension:@"plist"];

    long long v5 = (void *)v10;
  }

  return v5;
}

- (BOOL)hasSlowMotionAdjustments
{
  [(PFVideoAdjustments *)self slowMotionTimeRange];
  [(PFVideoAdjustments *)self slowMotionRate];
  return -[PFVideoAdjustments _isValidSlowMotionTimeRange:rate:](self, "_isValidSlowMotionTimeRange:rate:", &v4);
}

- (BOOL)_isValidSlowMotionTimeRange:(id *)a3 rate:(float)a4
{
  BOOL v4 = (a3->var0.var2 & 1) != 0 && (a3->var1.var2 & 1) != 0 && !a3->var1.var3 && a3->var1.var0 >= 0;
  if (a4 > 1.0) {
    BOOL v4 = 0;
  }
  return a4 > 0.0 && v4;
}

- (PFVideoAdjustments)initWithSlowMotionTimeRange:(id *)a3 rate:(float)a4
{
  double v6 = self;
  long long v7 = *(_OWORD *)&a3->var0.var3;
  long long v14 = *(_OWORD *)&a3->var0.var0;
  long long v15 = v7;
  long long v16 = *(_OWORD *)&a3->var1.var1;
  int v8 = DWORD1(v16);
  if ([(PFVideoAdjustments *)self _isValidSlowMotionTimeRange:&v14 rate:*(double *)&a4])
  {
    long long v9 = *(_OWORD *)&a3->var0.var3;
    long long v14 = *(_OWORD *)&a3->var0.var0;
    long long v15 = v9;
    long long v16 = *(_OWORD *)&a3->var1.var1;
    uint64_t v10 = [(PFVideoAdjustments *)v6 _dictionaryFromSlowMotionTimeRange:&v14 rate:COERCE_DOUBLE(__PAIR64__(DWORD1(v16), LODWORD(a4)))];
    objc_super v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:200 options:0 error:0];
    double v6 = [(PFAssetAdjustments *)v6 initWithFormatIdentifier:@"com.apple.video.slomo" formatVersion:@"1.1" data:v11 baseVersion:0 editorBundleID:0 renderTypes:0];

    CMTime v12 = v6;
  }
  else
  {
    CMTime v12 = 0;
  }

  return v12;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToOriginalTimeFromScaledTime:(SEL)a3 forExport:(id *)a4
{
  *retstr = *a4;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)convertToScaledTimeFromOriginalTime:(SEL)a3 forExport:(id *)a4
{
  *retstr = *a4;
  return self;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampOut
{
  uint64_t v3 = MEMORY[0x1E4F1FA20];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)slowMotionRampIn
{
  uint64_t v3 = MEMORY[0x1E4F1FA20];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v3 + 32);
  return self;
}

+ (BOOL)isRecognizedSlowMotionFormatWithIdentifier:(id)a3 version:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"com.apple.video.slomo"])
  {
    if ([v5 isEqualToString:@"1.0"]) {
      char v6 = 1;
    }
    else {
      char v6 = [v5 isEqualToString:@"1.1"];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameDurationForNominalFrameRate:(SEL)a3
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 1, 30);
  if (a4 >= 85.0 && a4 < 105.0)
  {
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake(&v8, 1, 25);
    *(CMTime *)retstr = v8;
  }
  return result;
}

+ (float)defaultSlowMotionRateForNominalFrameRate:(float)a3
{
  float v3 = 0.125;
  if (a3 < 210.0)
  {
    float v3 = 0.25;
    float v4 = 1.0;
    if (a3 >= 85.0) {
      float v4 = 0.25;
    }
    if (a3 < 105.0) {
      return v4;
    }
  }
  return v3;
}

+ ($9E16F6706E08E1DCF37CEDFAE5F41851)defaultSlowMotionTimeRangeForDuration:(SEL)a3
{
  uint64_t v5 = MEMORY[0x1E4F1FA30];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA30];
  *(_OWORD *)&retstr->var0.var3 = v6;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v5 + 32);
  if ((a4->var2 & 0x1D) == 1 && a4->var0 >= 1 && a4->var1 >= 1)
  {
    memset(&v12, 0, sizeof(v12));
    time.start = (CMTime)*a4;
    CMTimeMultiplyByFloat64(&v12, &time.start, 0.15);
    *(_OWORD *)&time.start.CMTimeValue value = *(_OWORD *)&a4->var0;
    time.start.CMTimeEpoch epoch = a4->var3;
    CMTime v9 = v12;
    CMTimeSubtract(&end, &time.start, &v9);
    CMTime v9 = v12;
    result = ($9E16F6706E08E1DCF37CEDFAE5F41851 *)CMTimeRangeFromTimeToTime(&time, &v9, &end);
    long long v8 = *(_OWORD *)&time.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&time.start.value;
    *(_OWORD *)&retstr->var0.var3 = v8;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&time.duration.timescale;
  }
  return result;
}

+ (id)defaultSlowMotionAdjustmentsForAsset:(id)a3
{
  id v3 = a3;
  float v4 = v3;
  long long v18 = 0uLL;
  uint64_t v19 = 0;
  if (v3) {
    [v3 duration];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  long long v12 = v18;
  *(void *)&long long v13 = v19;
  +[PFVideoAdjustments defaultSlowMotionTimeRangeForDuration:&v12];
  uint64_t v5 = +[PFMediaUtilities tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v4];
  long long v6 = [v5 firstObject];
  [v6 nominalFrameRate];
  +[PFVideoAdjustments defaultSlowMotionRateForNominalFrameRate:](PFVideoAdjustments, "defaultSlowMotionRateForNominalFrameRate:");
  unsigned int v8 = v7;
  CMTime v9 = [PFVideoAdjustments alloc];
  long long v12 = v15;
  long long v13 = v16;
  long long v14 = v17;
  uint64_t v10 = [(PFVideoAdjustments *)v9 initWithSlowMotionTimeRange:&v12 rate:COERCE_DOUBLE(__PAIR64__(DWORD1(v17), v8))];

  return v10;
}

@end