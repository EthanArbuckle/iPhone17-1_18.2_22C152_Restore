@interface PGFeatureExtractorSharplyFocusedSubjectScore
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorSharplyFocusedSubjectScore

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v5 = [a3 aestheticProperties];
  [v5 sharplyFocusedSubjectScore];
  int v7 = v6;
  v8 = (void *)MEMORY[0x1E4F71ED0];
  int64_t v9 = [(PGFeatureExtractorSharplyFocusedSubjectScore *)self featureLength];
  LODWORD(v10) = v7;
  v11 = [v8 vectorRepeatingFloat:v9 count:v10];

  return v11;
}

- (int64_t)featureLength
{
  return 1;
}

- (id)featureNames
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"SharplyFocusedSubjectScore";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)name
{
  v2 = @"SharplyFocusedSubjectScore";
  return @"SharplyFocusedSubjectScore";
}

@end