@interface PXMockDisplayAsset
+ (id)propertiesForImageWithSize:(CGSize)a3;
+ (id)propertiesForLivePhotoWithSize:(CGSize)a3;
+ (id)propertiesForVideoWithSize:(CGSize)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoVideoDuration;
- (BOOL)_BOOLValueForKey:(id)a3;
- (BOOL)hasPeopleSceneMidOrGreaterConfidence;
- (BOOL)isEligibleForAutoPlayback;
- (BOOL)isFavorite;
- (BOOL)isInCloud;
- (BOOL)isInSharedLibrary;
- (BOOL)isPartOfStack;
- (BOOL)representsBurst;
- (CGRect)acceptableCropRect;
- (CGRect)faceAreaRect;
- (CGRect)preferredCropRect;
- (Class)defaultImageProviderClass;
- (NSDate)creationDate;
- (NSDate)localCreationDate;
- (NSDictionary)backingDictionary;
- (NSString)uuid;
- (PXMockDisplayAsset)init;
- (PXMockDisplayAsset)initWithProperties:(id)a3;
- (double)_doubleValueForKey:(id)a3;
- (double)duration;
- (float)_floatValueForKey:(id)a3;
- (float)audioScore;
- (id)_dateValueForKey:(id)a3;
- (id)_stringValueForKey:(id)a3;
- (int64_t)_integerValueForKey:(id)a3;
- (int64_t)isContentEqualTo:(id)a3;
- (int64_t)mediaType;
- (int64_t)playbackStyle;
- (unint64_t)_unsignedIntegerValueForKey:(id)a3;
- (unint64_t)mediaSubtypes;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)thumbnailIndex;
- (unsigned)playbackVariation;
@end

@implementation PXMockDisplayAsset

- (void).cxx_destruct
{
}

- (NSDictionary)backingDictionary
{
  return self->_backingDictionary;
}

- (Class)defaultImageProviderClass
{
  v2 = [(PXMockDisplayAsset *)self _stringValueForKey:@"PXMockDisplayAssetDefaultImageProviderClassKey"];
  Class v3 = NSClassFromString(v2);

  return v3;
}

- (unsigned)playbackVariation
{
  return [(PXMockDisplayAsset *)self _integerValueForKey:@"PXMockDisplayAssetPlaybackVariationKey"];
}

- (int64_t)playbackStyle
{
  return [(PXMockDisplayAsset *)self _integerValueForKey:@"PXMockDisplayAssetPlaybackStyleKey"];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoVideoDuration
{
  [(PXMockDisplayAsset *)self _doubleValueForKey:@"PXMockDisplayAssetLivePhotoDurationKey"];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v4, 600);
}

- (double)duration
{
  [(PXMockDisplayAsset *)self _doubleValueForKey:@"PXMockDisplayAssetDurationKey"];
  return result;
}

- (NSString)uuid
{
  return (NSString *)[(PXMockDisplayAsset *)self _stringValueForKey:@"PXMockDisplayAssetUUIDKey"];
}

- (BOOL)hasPeopleSceneMidOrGreaterConfidence
{
  return 0;
}

- (float)audioScore
{
  [(PXMockDisplayAsset *)self _floatValueForKey:@"PXMockDisplayAssetAudioScoreKey"];
  return result;
}

- (CGRect)faceAreaRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)acceptableCropRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)preferredCropRect
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isEligibleForAutoPlayback
{
  return [(PXMockDisplayAsset *)self _BOOLValueForKey:@"PXMockDisplayAssetIsEligibleForAutoPlaybackKey"];
}

- (int64_t)isContentEqualTo:(id)a3
{
  double v4 = (PXMockDisplayAsset *)a3;
  if (self == v4)
  {
    int64_t v8 = 2;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      v6 = [(PXMockDisplayAsset *)self backingDictionary];
      v7 = [(PXMockDisplayAsset *)v5 backingDictionary];
      if (v6 == v7)
      {
        int64_t v8 = 2;
      }
      else if ([v6 isEqual:v7])
      {
        int64_t v8 = 2;
      }
      else
      {
        int64_t v8 = 1;
      }
    }
    else
    {
      int64_t v8 = 1;
    }
  }

  return v8;
}

- (unint64_t)thumbnailIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)pixelHeight
{
  return [(PXMockDisplayAsset *)self _unsignedIntegerValueForKey:@"PXMockDisplayAssetPixelHeightKey"];
}

- (unint64_t)pixelWidth
{
  return [(PXMockDisplayAsset *)self _unsignedIntegerValueForKey:@"PXMockDisplayAssetPixelWidthKey"];
}

- (BOOL)isInSharedLibrary
{
  return 0;
}

- (BOOL)isInCloud
{
  return [(PXMockDisplayAsset *)self _BOOLValueForKey:@"PXMockDisplayAssetIsInCloudKey"];
}

- (BOOL)isPartOfStack
{
  return 0;
}

- (BOOL)representsBurst
{
  return [(PXMockDisplayAsset *)self _BOOLValueForKey:@"PXMockDisplayAssetRepresentsBurstKey"];
}

- (BOOL)isFavorite
{
  return [(PXMockDisplayAsset *)self _BOOLValueForKey:@"PXMockDisplayAssetIsFavoriteKey"];
}

- (NSDate)localCreationDate
{
  return (NSDate *)[(PXMockDisplayAsset *)self _dateValueForKey:@"PXMockDisplayAssetLocalCreationDateKey"];
}

- (NSDate)creationDate
{
  return (NSDate *)[(PXMockDisplayAsset *)self _dateValueForKey:@"PXMockDisplayAssetCreationDateKey"];
}

- (unint64_t)mediaSubtypes
{
  return [(PXMockDisplayAsset *)self _unsignedIntegerValueForKey:@"PXMockDisplayAssetMediaSubtypesKey"];
}

- (int64_t)mediaType
{
  return [(PXMockDisplayAsset *)self _integerValueForKey:@"PXMockDisplayAssetMediaTypeKey"];
}

- (id)_stringValueForKey:(id)a3
{
  id v5 = a3;
  v6 = [(PXMockDisplayAsset *)self backingDictionary];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 122, @"%@ should be an instance inheriting from %@, but it is %@", @"self.backingDictionary[key]", v11, v13 object file lineNumber description];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 122, @"%@ should be an instance inheriting from %@, but it is nil", @"self.backingDictionary[key]", v11 object file lineNumber description];
  }

LABEL_3:
  return v7;
}

- (id)_dateValueForKey:(id)a3
{
  id v5 = a3;
  v6 = [(PXMockDisplayAsset *)self backingDictionary];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    v13 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 117, @"%@ should be an instance inheriting from %@, but it is %@", @"self.backingDictionary[key]", v11, v13 object file lineNumber description];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 117, @"%@ should be an instance inheriting from %@, but it is nil", @"self.backingDictionary[key]", v11 object file lineNumber description];
  }

LABEL_3:
  return v7;
}

- (float)_floatValueForKey:(id)a3
{
  id v5 = a3;
  v6 = [(PXMockDisplayAsset *)self backingDictionary];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 112, @"%@ should be an instance inheriting from %@, but it is nil", @"self.backingDictionary[key]", v13 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 112, @"%@ should be an instance inheriting from %@, but it is %@", @"self.backingDictionary[key]", v13, v15 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  [v7 floatValue];
  float v9 = v8;

  return v9;
}

- (double)_doubleValueForKey:(id)a3
{
  id v5 = a3;
  v6 = [(PXMockDisplayAsset *)self backingDictionary];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 107, @"%@ should be an instance inheriting from %@, but it is nil", @"self.backingDictionary[key]", v13 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 107, @"%@ should be an instance inheriting from %@, but it is %@", @"self.backingDictionary[key]", v13, v15 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  [v7 doubleValue];
  double v9 = v8;

  return v9;
}

- (BOOL)_BOOLValueForKey:(id)a3
{
  id v5 = a3;
  v6 = [(PXMockDisplayAsset *)self backingDictionary];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 102, @"%@ should be an instance inheriting from %@, but it is nil", @"self.backingDictionary[key]", v12 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 102, @"%@ should be an instance inheriting from %@, but it is %@", @"self.backingDictionary[key]", v12, v14 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  char v8 = [v7 BOOLValue];

  return v8;
}

- (unint64_t)_unsignedIntegerValueForKey:(id)a3
{
  id v5 = a3;
  v6 = [(PXMockDisplayAsset *)self backingDictionary];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 97, @"%@ should be an instance inheriting from %@, but it is nil", @"self.backingDictionary[key]", v12 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 97, @"%@ should be an instance inheriting from %@, but it is %@", @"self.backingDictionary[key]", v12, v14 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  unint64_t v8 = [v7 unsignedIntegerValue];

  return v8;
}

- (int64_t)_integerValueForKey:(id)a3
{
  id v5 = a3;
  v6 = [(PXMockDisplayAsset *)self backingDictionary];
  v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 92, @"%@ should be an instance inheriting from %@, but it is nil", @"self.backingDictionary[key]", v12 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v13);
    v14 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 92, @"%@ should be an instance inheriting from %@, but it is %@", @"self.backingDictionary[key]", v12, v14 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  int64_t v8 = [v7 integerValue];

  return v8;
}

- (PXMockDisplayAsset)initWithProperties:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXMockDisplayAsset.m", 46, @"Invalid parameter not satisfying: %@", @"properties" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXMockDisplayAsset;
  v6 = [(PXMockDisplayAsset *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    backingDictionary = v6->_backingDictionary;
    v6->_backingDictionary = (NSDictionary *)v7;
  }
  return v6;
}

- (PXMockDisplayAsset)init
{
  double v3 = [MEMORY[0x1E4F1C9E8] dictionary];
  double v4 = [(PXMockDisplayAsset *)self initWithProperties:v3];

  return v4;
}

+ (id)propertiesForVideoWithSize:(CGSize)a3
{
  double height = a3.height;
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"PXMockDisplayAssetMediaTypeKey";
  v8[1] = @"PXMockDisplayAssetPlaybackStyleKey";
  v9[0] = &unk_1F02D6100;
  v9[1] = &unk_1F02D6118;
  v8[2] = @"PXMockDisplayAssetPixelWidthKey";
  double v4 = [NSNumber numberWithUnsignedInteger:(unint64_t)a3.width];
  v9[2] = v4;
  v8[3] = @"PXMockDisplayAssetPixelHeightKey";
  id v5 = [NSNumber numberWithUnsignedInteger:(unint64_t)height];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (id)propertiesForLivePhotoWithSize:(CGSize)a3
{
  double height = a3.height;
  void v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"PXMockDisplayAssetMediaTypeKey";
  v8[1] = @"PXMockDisplayAssetMediaSubtypesKey";
  v9[0] = &unk_1F02D60B8;
  v9[1] = &unk_1F02D60D0;
  v9[2] = &unk_1F02D60E8;
  v8[2] = @"PXMockDisplayAssetPlaybackStyleKey";
  v8[3] = @"PXMockDisplayAssetPixelWidthKey";
  double v4 = [NSNumber numberWithUnsignedInteger:(unint64_t)a3.width];
  v9[3] = v4;
  void v8[4] = @"PXMockDisplayAssetPixelHeightKey";
  id v5 = [NSNumber numberWithUnsignedInteger:(unint64_t)height];
  v9[4] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];

  return v6;
}

+ (id)propertiesForImageWithSize:(CGSize)a3
{
  double height = a3.height;
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"PXMockDisplayAssetMediaTypeKey";
  v8[1] = @"PXMockDisplayAssetPlaybackStyleKey";
  v9[0] = &unk_1F02D60B8;
  v9[1] = &unk_1F02D60B8;
  v8[2] = @"PXMockDisplayAssetPixelWidthKey";
  double v4 = [NSNumber numberWithUnsignedInteger:(unint64_t)a3.width];
  v9[2] = v4;
  v8[3] = @"PXMockDisplayAssetPixelHeightKey";
  id v5 = [NSNumber numberWithUnsignedInteger:(unint64_t)height];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

@end