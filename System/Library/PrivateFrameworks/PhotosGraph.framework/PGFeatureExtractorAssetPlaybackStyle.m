@interface PGFeatureExtractorAssetPlaybackStyle
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAssetPlaybackStyle

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F71EF8];
  id v6 = a3;
  v7 = objc_msgSend(v5, "zerosOfCount:", -[PGFeatureExtractorAssetPlaybackStyle featureLength](self, "featureLength"));
  unint64_t v8 = [v6 playbackStyle];

  if (v8 <= 5)
  {
    LODWORD(v9) = 1.0;
    [v7 setFloat:v8 atIndex:v9];
  }
  return v7;
}

- (int64_t)featureLength
{
  return 6;
}

- (id)featureNames
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Unsupported";
  v4[1] = @"Image";
  v4[2] = @"ImageAnimated";
  v4[3] = @"LivePhoto";
  v4[4] = @"Video";
  v4[5] = @"VideoLooping";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return v2;
}

- (id)name
{
  v2 = @"AssetPlaybackStyle";
  return @"AssetPlaybackStyle";
}

@end