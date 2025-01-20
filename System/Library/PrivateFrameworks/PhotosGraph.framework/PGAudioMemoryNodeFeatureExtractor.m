@interface PGAudioMemoryNodeFeatureExtractor
+ (id)name;
- (PGAudioMemoryNodeFeatureExtractor)initWithError:(id *)a3;
- (PGAudioMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4;
- (id)labelsForVersion:(int64_t)a3;
@end

@implementation PGAudioMemoryNodeFeatureExtractor

- (id)labelsForVersion:(int64_t)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    v5[0] = @"ExcitementAudio";
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (PGAudioMemoryNodeFeatureExtractor)initWithVersion:(int64_t)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v5 = -[PGAudioMemoryNodeFeatureExtractor labelsForVersion:](self, "labelsForVersion:", a3, a4);
  v6 = (void *)MEMORY[0x1E4F71F18];
  v7 = +[PGGraphAudioFeatureNode filter];
  v8 = [v7 relation];
  v15[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v10 = [v6 chain:v9];

  v11 = +[PGAudioMemoryNodeFeatureExtractor name];
  v14.receiver = self;
  v14.super_class = (Class)PGAudioMemoryNodeFeatureExtractor;
  v12 = [(PGGraphMemoryNodeFeatureExtractor *)&v14 initWithName:v11 featureNames:v5 relation:v10 labelForTargetBlock:&__block_literal_global_19785];

  return v12;
}

uint64_t __59__PGAudioMemoryNodeFeatureExtractor_initWithVersion_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 label];
}

- (PGAudioMemoryNodeFeatureExtractor)initWithError:(id *)a3
{
  return [(PGAudioMemoryNodeFeatureExtractor *)self initWithVersion:1 error:a3];
}

+ (id)name
{
  return @"Audio";
}

@end