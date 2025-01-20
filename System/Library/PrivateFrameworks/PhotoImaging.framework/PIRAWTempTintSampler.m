@interface PIRAWTempTintSampler
- (NSString)tag;
- (PIRAWTempTintSampler)initWithComposition:(id)a3 responseQueue:(id)a4;
- (id)_pipelineFilters;
@end

@implementation PIRAWTempTintSampler

- (id)_pipelineFilters
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = +[PIPipelineFilters sourceFilterNoOrientation];
  v6[0] = v2;
  v3 = +[PIPipelineFilters sushiLevel1Filter];
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

- (NSString)tag
{
  return (NSString *)[NSString stringWithFormat:@"/Master%@", @"/RAW/SushiLevel1"];
}

- (PIRAWTempTintSampler)initWithComposition:(id)a3 responseQueue:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PIRAWTempTintSampler;
  v4 = [(NUTagColorSampler *)&v7 initWithComposition:a3 tag:@"/RAW/SushiLevel1" responseQueue:a4];
  v5 = [MEMORY[0x1E4F7A400] sRGBLinearColorSpace];
  [(NUColorSampler *)v4 setColorSpace:v5];

  return v4;
}

@end