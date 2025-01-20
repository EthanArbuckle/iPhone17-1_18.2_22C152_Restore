@interface PGFeatureExtractorStandardAspectRatio
- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5;
- (float)precisionEpsilon;
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
- (int64_t)standardAspectRatioFromFloatVector:(id)a3;
@end

@implementation PGFeatureExtractorStandardAspectRatio

- (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
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
    float v7 = (float)(unint64_t)[v6 pixelWidth];
    *(float *)&double v8 = v7 / (float)(unint64_t)[v6 pixelHeight];
    id v9 = [MEMORY[0x1E4F71ED0] vectorRepeatingFloat:1 count:v8];
    unint64_t v10 = [(PGFeatureExtractorStandardAspectRatio *)self standardAspectRatioFromFloatVector:v9];
    v11 = objc_msgSend(MEMORY[0x1E4F71EF8], "zerosOfCount:", -[PGFeatureExtractorStandardAspectRatio featureLength](self, "featureLength"));
    uint64_t v13 = v11;
    if (v10 <= 3)
    {
      LODWORD(v12) = 1.0;
      [v11 setFloat:v10 atIndex:v12];
    }
  }
  else
  {
    v14 = NSString;
    id v9 = [v6 localIdentifier];
    v15 = [v14 stringWithFormat:@"Divide by 0 is not a valid operation, in asset %@", v9];
    [(PGFeatureExtractorStandardAspectRatio *)self _generateError:a4 withCode:0 andMessage:v15];

    uint64_t v13 = 0;
  }

  return v13;
}

- (int64_t)standardAspectRatioFromFloatVector:(id)a3
{
  id v4 = a3;
  int v15 = 1068149419;
  int v13 = 1071877689;
  int v14 = 1069547520;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithFloats:&v15 count:1];
  [(PGFeatureExtractorStandardAspectRatio *)self precisionEpsilon];
  char v6 = objc_msgSend(v4, "isApproximatelyEqualTo:epsilon:", v5);

  if (v6)
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = 1;
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithFloats:&v14 count:1];
    [(PGFeatureExtractorStandardAspectRatio *)self precisionEpsilon];
    char v9 = objc_msgSend(v4, "isApproximatelyEqualTo:epsilon:", v8);

    if ((v9 & 1) == 0)
    {
      unint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F71ED0]) initWithFloats:&v13 count:1];
      [(PGFeatureExtractorStandardAspectRatio *)self precisionEpsilon];
      int v11 = objc_msgSend(v4, "isApproximatelyEqualTo:epsilon:", v10);

      if (v11) {
        int64_t v7 = 2;
      }
      else {
        int64_t v7 = 3;
      }
    }
  }

  return v7;
}

- (float)precisionEpsilon
{
  return 0.05;
}

- (int64_t)featureLength
{
  return 4;
}

- (id)featureNames
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"StandardAspectRatioFourByThree";
  v4[1] = @"StandardAspectRatioThreeByTwo";
  v4[2] = @"StandardAspectRatioSixteenByNine";
  v4[3] = @"StandardAspectRatioOthers";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  return v2;
}

- (id)name
{
  v2 = @"StandardAspectRatio";
  return @"StandardAspectRatio";
}

@end