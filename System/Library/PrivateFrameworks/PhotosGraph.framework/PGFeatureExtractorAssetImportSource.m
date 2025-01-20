@interface PGFeatureExtractorAssetImportSource
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAssetImportSource

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x1E4F71EF8];
  id v6 = a3;
  v7 = objc_msgSend(v5, "zerosOfCount:", -[PGFeatureExtractorAssetImportSource featureLength](self, "featureLength"));
  v8 = [v6 importProperties];

  unint64_t v9 = [v8 importedBy];
  if (v9 < 0xC || v9 == 14 || v9 == 13) {
    goto LABEL_2;
  }
  if (v9 == 12)
  {
    LODWORD(v10) = 1.0;
    objc_msgSend(v7, "setFloat:atIndex:", v10);
LABEL_2:
    LODWORD(v10) = 1.0;
    objc_msgSend(v7, "setFloat:atIndex:", v10);
  }

  return v7;
}

- (int64_t)featureLength
{
  return 10;
}

- (id)featureNames
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v4[0] = @"ImportSourceUnknown";
  v4[1] = @"ImportSourceBackCamera";
  v4[2] = @"ImportSourceFrontCamera";
  v4[3] = @"ImportSourcePhotoKit";
  v4[4] = @"ImportSourceCameraConnectionKit";
  v4[5] = @"ImportSourcePhotosApp";
  v4[6] = @"ImportSourceLegacy";
  v4[7] = @"ImportSourceMomentShare";
  v4[8] = @"ImportSourcePhotoKitInternal";
  v4[9] = @"ImportSourceLegacyInternal";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];
  return v2;
}

- (id)name
{
  v2 = @"ImportSource";
  return @"ImportSource";
}

@end