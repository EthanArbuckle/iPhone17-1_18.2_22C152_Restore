@interface PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor
+ (id)labelProcessingForLabel:(id)a3 sex:(unint64_t)a4;
+ (id)name;
- (PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor

- (PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v3 = +[PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor name];
  v21[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

  v5 = (void *)MEMORY[0x1E4F71F18];
  v6 = +[PGGraphPersonNode filterExcludingMe];
  v7 = [v6 relation];
  v20[0] = v7;
  v8 = +[PGGraphPersonNode filterForBiologicalSex:2];
  v9 = [v8 relation];
  v20[1] = v9;
  v10 = +[PGGraphPersonNode partnerOfPerson];
  v20[2] = v10;
  v11 = +[PGGraphMeNode filter];
  v12 = [v11 relation];
  v20[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  v14 = [v5 chain:v13];

  v15 = +[PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor name];
  v19.receiver = self;
  v19.super_class = (Class)PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor;
  v16 = [(PGGraphMemoryNodeFeatureExtractor *)&v19 initWithName:v15 featureNames:v4 relation:v14 labelForTargetBlock:&__block_literal_global_39];

  return v16;
}

id __79__PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor_initWithError___block_invoke()
{
  return +[PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor name];
}

+ (id)labelProcessingForLabel:(id)a3 sex:(unint64_t)a4
{
  return (id)[NSString stringWithFormat:@"%@_%lu", a3, a4];
}

+ (id)name
{
  return +[PGInvariantPartnerBiologicalSexMaleMemoryNodeFeatureExtractor labelProcessingForLabel:*MEMORY[0x1E4F76B90] sex:2];
}

@end