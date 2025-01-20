@interface PGFeatureExtractorTaboo
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorTaboo

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = [a3 sceneClassifications];
  v6 = objc_msgSend(MEMORY[0x1E4F71EF8], "zerosOfCount:", -[PGFeatureExtractorTaboo featureLength](self, "featureLength"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "extendedSceneIdentifier", (void)v15) - 2147482870;
        if (v12 <= 9 && ((0x2FFu >> v12) & 1) != 0)
        {
          LODWORD(v13) = 1.0;
          [v6 setFloat:qword_1D1F4F678[v12] atIndex:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (int64_t)featureLength
{
  return 9;
}

- (id)featureNames
{
  v4[9] = *MEMORY[0x1E4F143B8];
  v4[0] = @"Blood";
  v4[1] = @"Demonstration";
  v4[2] = @"FireDevastation";
  v4[3] = @"FloodDevastation";
  v4[4] = @"Funeral";
  v4[5] = @"Hospital";
  v4[6] = @"ReligiousSetting";
  v4[7] = @"VehicleCrash";
  v4[8] = @"War";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:9];
  return v2;
}

- (id)name
{
  v2 = @"Taboo";
  return @"Taboo";
}

@end