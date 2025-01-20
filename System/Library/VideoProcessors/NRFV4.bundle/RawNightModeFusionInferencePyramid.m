@interface RawNightModeFusionInferencePyramid
- (NSMutableArray)bandTextures;
- (RawNightModeFusionInferencePyramid)init;
- (void)setBandTextures:(id)a3;
@end

@implementation RawNightModeFusionInferencePyramid

- (RawNightModeFusionInferencePyramid)init
{
  v6.receiver = self;
  v6.super_class = (Class)RawNightModeFusionInferencePyramid;
  v2 = [(RawNightModeFusionInferencePyramid *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(RawNightModeFusionInferencePyramid *)v2 setBandTextures:v3];

    v4 = [(RawNightModeFusionInferencePyramid *)v2 bandTextures];

    if (v4) {
      v4 = v2;
    }
    else {
      FigSignalErrorAt();
    }
  }
  else
  {
    FigSignalErrorAt();
    v4 = 0;
  }

  return v4;
}

- (NSMutableArray)bandTextures
{
  return self->_bandTextures;
}

- (void)setBandTextures:(id)a3
{
}

- (void).cxx_destruct
{
}

@end