@interface PGInvariantPartnerFeatureExtractor
+ (id)name;
- (PGInvariantPartnerFeatureExtractor)initWithError:(id *)a3;
@end

@implementation PGInvariantPartnerFeatureExtractor

- (PGInvariantPartnerFeatureExtractor)initWithError:(id *)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F76B90];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v5 = (void *)MEMORY[0x1E4F71F18];
  v6 = +[PGGraphMomentNode personInMoment];
  v15[0] = v6;
  v7 = +[PGGraphPersonNode partnerOfPerson];
  v15[1] = v7;
  v8 = +[PGGraphMeNode filter];
  v9 = [v8 relation];
  v15[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  v11 = [v5 chain:v10];

  v14.receiver = self;
  v14.super_class = (Class)PGInvariantPartnerFeatureExtractor;
  v12 = [(PGGraphFeatureExtractor *)&v14 initWithName:@"Partner" featureNames:v4 relation:v11 labelForTargetBlock:&__block_literal_global_45334];

  return v12;
}

id __52__PGInvariantPartnerFeatureExtractor_initWithError___block_invoke()
{
  return (id)*MEMORY[0x1E4F76B90];
}

+ (id)name
{
  return (id)*MEMORY[0x1E4F76B90];
}

@end