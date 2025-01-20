@interface PGFeatureExtractorAudioClassification
- (id)featureNames;
- (id)floatVectorWithEntity:(id)a3 error:(id *)a4;
- (id)name;
- (int64_t)featureLength;
@end

@implementation PGFeatureExtractorAudioClassification

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  v5 = [a3 mediaAnalysisProperties];
  int v6 = [v5 audioClassification];
  v7 = objc_msgSend(MEMORY[0x1E4F71EF8], "zerosOfCount:", -[PGFeatureExtractorAudioClassification featureLength](self, "featureLength"));
  v9 = v7;
  if (!v6)
  {
    uint64_t v10 = 0;
LABEL_16:
    LODWORD(v8) = 1.0;
    [v9 setFloat:v10 atIndex:v8];
    goto LABEL_17;
  }
  if (v6)
  {
    LODWORD(v8) = 1.0;
    [v7 setFloat:1 atIndex:v8];
    if ((v6 & 2) == 0)
    {
LABEL_4:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_12;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_4;
  }
  LODWORD(v8) = 1.0;
  [v9 setFloat:2 atIndex:v8];
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  LODWORD(v8) = 1.0;
  [v9 setFloat:3 atIndex:v8];
  if ((v6 & 8) == 0)
  {
LABEL_6:
    if ((v6 & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    LODWORD(v8) = 1.0;
    [v9 setFloat:5 atIndex:v8];
    if ((v6 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_13:
  LODWORD(v8) = 1.0;
  [v9 setFloat:4 atIndex:v8];
  if ((v6 & 0x10) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((v6 & 0x20) != 0)
  {
LABEL_15:
    uint64_t v10 = 6;
    goto LABEL_16;
  }
LABEL_17:

  return v9;
}

- (int64_t)featureLength
{
  return 7;
}

- (id)featureNames
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AudioNone";
  v4[1] = @"Applause";
  v4[2] = @"Babble";
  v4[3] = @"Cheering";
  v4[4] = @"Laughter";
  v4[5] = @"Speech";
  v4[6] = @"Music";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  return v2;
}

- (id)name
{
  v2 = @"AudioClassification";
  return @"AudioClassification";
}

@end