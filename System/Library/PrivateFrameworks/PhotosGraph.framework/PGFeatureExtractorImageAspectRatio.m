@interface PGFeatureExtractorImageAspectRatio
- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5;
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorImageAspectRatio

- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    v13 = @"message";
    v14[0] = a5;
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = a5;
    v10 = [v8 dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v11 = [v7 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureExtractorPHAssetAttributes" code:a4 userInfo:v10];

    *a3 = v11;
  }
  return 1;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 pixelHeight])
  {
    unint64_t v7 = [v6 pixelWidth];
    float v8 = (float)(v7 / [v6 pixelHeight]);
    id v9 = (void *)MEMORY[0x1E4F71ED0];
    int64_t v10 = [(PGFeatureExtractorImageAspectRatio *)self featureLength];
    *(float *)&double v11 = v8;
    v12 = [v9 vectorRepeatingFloat:v10 count:v11];
  }
  else
  {
    v13 = NSString;
    v14 = [v6 localIdentifier];
    v15 = [v13 stringWithFormat:@"Divide by 0 is not a valid operation, in asset %@", v14];
    [(PGFeatureExtractorImageAspectRatio *)self _generateError:a4 withCode:0 andMessage:v15];

    v12 = 0;
  }

  return v12;
}

- (int64_t)featureLength
{
  return 1;
}

- (id)featureNames
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"ImageAspectRatio";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)name
{
  v2 = @"ImageAspectRatio";
  return @"ImageAspectRatio";
}

@end