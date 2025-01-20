@interface PESpatialAudioMixMode
+ (id)audioMixModeForRenderingStyle:(id)a3;
+ (id)audioMixModes;
- (NSString)localizedTitle;
- (NSString)renderingStyle;
- (PESpatialAudioMixMode)initWithType:(unint64_t)a3;
- (unint64_t)type;
@end

@implementation PESpatialAudioMixMode

- (unint64_t)type
{
  return self->_type;
}

- (NSString)renderingStyle
{
  unint64_t v2 = [(PESpatialAudioMixMode *)self type];
  if (v2 <= 3) {
    id v3 = **((id **)&unk_2642BE440 + v2);
  }
  return (NSString *)v3;
}

- (NSString)localizedTitle
{
  unint64_t v2 = [(PESpatialAudioMixMode *)self type];
  if (v2 > 3) {
    id v3 = 0;
  }
  else {
    id v3 = off_2642BE420[v2];
  }
  return (NSString *)PELocalizedString(v3);
}

- (PESpatialAudioMixMode)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PESpatialAudioMixMode;
  result = [(PESpatialAudioMixMode *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

+ (id)audioMixModeForRenderingStyle:(id)a3
{
  id v3 = a3;
  v4 = +[PESpatialAudioMixMode audioMixModes];
  v8 = v3;
  id v5 = v3;
  v6 = PFFind();

  return v6;
}

uint64_t __55__PESpatialAudioMixMode_audioMixModeForRenderingStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 renderingStyle];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

+ (id)audioMixModes
{
  v8[4] = *MEMORY[0x263EF8340];
  unint64_t v2 = [[PESpatialAudioMixMode alloc] initWithType:0];
  v8[0] = v2;
  id v3 = [[PESpatialAudioMixMode alloc] initWithType:3];
  v8[1] = v3;
  uint64_t v4 = [[PESpatialAudioMixMode alloc] initWithType:2];
  v8[2] = v4;
  id v5 = [[PESpatialAudioMixMode alloc] initWithType:1];
  v8[3] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v6;
}

@end