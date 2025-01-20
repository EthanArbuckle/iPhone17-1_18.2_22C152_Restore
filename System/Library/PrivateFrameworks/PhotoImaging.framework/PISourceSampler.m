@interface PISourceSampler
- (NSString)tag;
- (id)_pipelineFilters;
@end

@implementation PISourceSampler

- (id)_pipelineFilters
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PIPipelineFilters sourceFilterNoOrientation];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (NSString)tag
{
  return (NSString *)@"/masterSpace";
}

@end