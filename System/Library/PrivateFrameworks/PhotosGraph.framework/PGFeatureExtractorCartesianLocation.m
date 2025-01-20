@interface PGFeatureExtractorCartesianLocation
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorCartesianLocation

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v24[3] = *MEMORY[0x1E4F143B8];
  v4 = [a3 location];
  v5 = v4;
  if (v4)
  {
    [v4 coordinate];
    *(float *)&double v6 = v6;
    *(float *)&double v7 = v7;
    [MEMORY[0x1E4F8A930] cartesianCoordinateFromLatitude:v6 longitude:v7];
    int v9 = v8;
    int v11 = v10;
    int v13 = v12;
    id v14 = objc_alloc(MEMORY[0x1E4F71ED0]);
    LODWORD(v15) = v9;
    v16 = [NSNumber numberWithFloat:v15];
    LODWORD(v17) = v11;
    v18 = objc_msgSend(NSNumber, "numberWithFloat:", v17, v16);
    v24[1] = v18;
    LODWORD(v19) = v13;
    v20 = [NSNumber numberWithFloat:v19];
    v24[2] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    v22 = (void *)[v14 initWithArray:v21];
  }
  else
  {
    v22 = [MEMORY[0x1E4F71ED0] zerosOfCount:3];
  }

  return v22;
}

- (id)featureNames
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"LOCATION_X";
  v4[1] = @"LOCATION_Y";
  v4[2] = @"LOCATION_Z";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

- (int64_t)featureLength
{
  return 3;
}

- (id)name
{
  v2 = @"Location";
  return @"Location";
}

@end