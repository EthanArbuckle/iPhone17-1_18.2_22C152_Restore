@interface PGInvariantPartnerBiologicalSexFemaleFeatureExtractor
+ (id)labelProcessingForLabel:(id)a3 sex:(unint64_t)a4;
+ (id)name;
- (PGInvariantPartnerBiologicalSexFemaleFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGInvariantPartnerBiologicalSexFemaleFeatureExtractor

- (PGInvariantPartnerBiologicalSexFemaleFeatureExtractor)initWithError:(id *)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v4 = +[PGInvariantPartnerBiologicalSexFemaleFeatureExtractor name];
  v20[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];

  v6 = (void *)MEMORY[0x1E4F71F18];
  v7 = +[PGGraphMomentNode personInMoment];
  v19[0] = v7;
  v8 = +[PGGraphPersonNode filterForBiologicalSex:1];
  v9 = [v8 relation];
  v19[1] = v9;
  v10 = +[PGGraphPersonNode partnerOfPerson];
  v19[2] = v10;
  v11 = +[PGGraphMeNode filter];
  v12 = [v11 relation];
  v19[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  v14 = [v6 chain:v13];

  v15 = +[PGInvariantPartnerBiologicalSexFemaleFeatureExtractor name];
  v18.receiver = self;
  v18.super_class = (Class)PGInvariantPartnerBiologicalSexFemaleFeatureExtractor;
  v16 = [(PGGraphFeatureExtractor *)&v18 initWithName:v15 featureNames:v5 relation:v14 labelForTargetBlock:&__block_literal_global_25];

  return v16;
}

id __71__PGInvariantPartnerBiologicalSexFemaleFeatureExtractor_initWithError___block_invoke()
{
  return +[PGInvariantPartnerBiologicalSexFemaleFeatureExtractor name];
}

+ (id)labelProcessingForLabel:(id)a3 sex:(unint64_t)a4
{
  return (id)[NSString stringWithFormat:@"%@_%lu", a3, a4];
}

+ (id)name
{
  return +[PGInvariantPartnerBiologicalSexFemaleFeatureExtractor labelProcessingForLabel:*MEMORY[0x1E4F76B90] sex:2];
}

@end