@interface PGInvariantPartnerMemoryNodeFeatureExtractor
+ (id)name;
- (PGInvariantPartnerMemoryNodeFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGInvariantPartnerMemoryNodeFeatureExtractor

- (PGInvariantPartnerMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v4 = +[PGInvariantPartnerMemoryNodeFeatureExtractor name];
  v19[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

  v6 = (void *)MEMORY[0x1E4F71F18];
  v7 = +[PGGraphPersonNode filterExcludingMe];
  v8 = [v7 relation];
  v18[0] = v8;
  v9 = +[PGGraphPersonNode partnerOfPerson];
  v18[1] = v9;
  v10 = +[PGGraphMeNode filter];
  v11 = [v10 relation];
  v18[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
  v13 = [v6 chain:v12];

  v14 = +[PGInvariantPartnerMemoryNodeFeatureExtractor name];
  v17.receiver = self;
  v17.super_class = (Class)PGInvariantPartnerMemoryNodeFeatureExtractor;
  v15 = [(PGGraphMemoryNodeFeatureExtractor *)&v17 initWithName:v14 featureNames:v5 relation:v13 labelForTargetBlock:&__block_literal_global_33];

  return v15;
}

id __62__PGInvariantPartnerMemoryNodeFeatureExtractor_initWithError___block_invoke()
{
  return +[PGInvariantPartnerMemoryNodeFeatureExtractor name];
}

+ (id)name
{
  return (id)*MEMORY[0x1E4F76B90];
}

@end