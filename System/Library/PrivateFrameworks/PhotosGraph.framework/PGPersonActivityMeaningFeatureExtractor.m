@interface PGPersonActivityMeaningFeatureExtractor
- (PGPersonActivityMeaningFeatureExtractor)initWithError:(id *)a3;
- (PGPersonActivityMeaningFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
- (id)labelsForVersion:(int64_t)a3;
- (id)prefix;
@end

@implementation PGPersonActivityMeaningFeatureExtractor

- (id)labelsForVersion:(int64_t)a3
{
  v6[12] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    v6[0] = @"PersonBeachWater";
    v6[1] = @"PersonToys";
    v6[2] = @"PersonPlayground";
    v6[3] = @"PersonSoccer";
    v6[4] = @"PersonMartialArts";
    v6[5] = @"PersonActionSwimming";
    v6[6] = @"PersonActionPlayingOnASwing";
    v6[7] = @"PersonActionPlayingOnASlide";
    v6[8] = @"PersonActionHugging";
    v6[9] = @"PersonActionKissing";
    v6[10] = @"PersonActionJumpingOrLeaping";
    v6[11] = @"PersonActionRunningOrJogging";
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:12];
    v4 = [MEMORY[0x1E4F1CBF0] arrayByAddingObjectsFromArray:v3];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (id)prefix
{
  return @"PersonActivityMeaning";
}

- (PGPersonActivityMeaningFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v5 = -[PGPersonActivityMeaningFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v6 = +[PGGraphMomentNode personActivityMeaningOfMoment];
  v9.receiver = self;
  v9.super_class = (Class)PGPersonActivityMeaningFeatureExtractor;
  v7 = [(PGGraphFeatureExtractor *)&v9 initWithName:@"PersonActivityMeaning" featureNames:v5 relation:v6 labelForTargetBlock:&__block_literal_global_8442];

  return v7;
}

uint64_t __65__PGPersonActivityMeaningFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

- (PGPersonActivityMeaningFeatureExtractor)initWithError:(id *)a3
{
  return [(PGPersonActivityMeaningFeatureExtractor *)self initWithVersion:1 error:a3];
}

@end