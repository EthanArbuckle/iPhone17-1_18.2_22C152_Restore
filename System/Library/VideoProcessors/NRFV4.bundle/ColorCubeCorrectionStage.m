@interface ColorCubeCorrectionStage
+ (int)prewarmShaders:(id)a3;
- (id)init:(id)a3;
- (int)runOnLuma:(id)a3 andChroma:(id)a4 outChroma:(id)a5 colorCubeFixType:(int)a6;
- (int)runOnLuma:(id)a3 andChroma:(id)a4 withMask:(id)a5 outChroma:(id)a6 colorCubeFixType:(int)a7;
- (int)setMaskedSkyCubeVersion:(int)a3;
@end

@implementation ColorCubeCorrectionStage

- (id)init:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ColorCubeCorrectionStage;
  v6 = [(ColorCubeCorrectionStage *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v8 = [[SingleColorCubeCorrectionStage alloc] init:v5 cubeSize:32 data:&redFaceFixCubeData];
    v9 = v7->fixes[0];
    v7->fixes[0] = v8;

    v10 = [[SingleColorCubeCorrectionStage alloc] init:v5 cubeSize:32 data:&greenSkyFixCubeData];
    v11 = v7->fixes[1];
    v7->fixes[1] = v10;

    v12 = [[SingleColorCubeCorrectionStage alloc] init:v5 cubeSize:32 data:&yellowSatFixCubeData];
    v13 = v7->fixes[2];
    v7->fixes[2] = v12;

    v14 = v7->fixes[3];
    v7->fixes[3] = 0;

    v15 = v7;
  }

  return v7;
}

+ (int)prewarmShaders:(id)a3
{
  return +[SingleColorCubeCorrectionStage prewarmShaders:a3];
}

- (int)setMaskedSkyCubeVersion:(int)a3
{
  uint64_t v15 = v3;
  switch(a3)
  {
    case -1:
      v8 = [SingleColorCubeCorrectionStage alloc];
      metal = self->_metal;
      v10 = &identityCubeData;
      goto LABEL_8;
    case 0:
      v8 = [SingleColorCubeCorrectionStage alloc];
      metal = self->_metal;
      v10 = &maskedSkyV0AlternateCubeData;
      v12 = &maskedSkyV0DefaultCubeData;
      goto LABEL_9;
    case 1:
      v8 = [SingleColorCubeCorrectionStage alloc];
      metal = self->_metal;
      v10 = &maskedSkyV1AlternateCubeData;
      v12 = &maskedSkyV1DefaultCubeData;
      goto LABEL_9;
    case 2:
      v8 = [SingleColorCubeCorrectionStage alloc];
      metal = self->_metal;
      v10 = &maskedSkyV1AlternateCubeData;
LABEL_8:
      v12 = v10;
LABEL_9:
      v13 = -[SingleColorCubeCorrectionStage init:alternateCubeSize:alternateCubeData:defaultCubeSize:defaultCubeData:](v8, "init:alternateCubeSize:alternateCubeData:defaultCubeSize:defaultCubeData:", metal, 32, v10, 32, v12, v4, v15, v5, v6);
      v14 = self->fixes[3];
      self->fixes[3] = v13;

      int result = 0;
      break;
    default:
      int result = -73426;
      break;
  }
  return result;
}

- (int)runOnLuma:(id)a3 andChroma:(id)a4 withMask:(id)a5 outChroma:(id)a6 colorCubeFixType:(int)a7
{
  int v12 = -73426;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (a7 == -1)
  {
    int v12 = FigSignalErrorAt();
  }
  else if ((a7 - 4) >= 0xFFFFFFFB)
  {
    int v12 = [(SingleColorCubeCorrectionStage *)self->fixes[a7] runOnLuma:v13 andChroma:v14 withMask:v15 outChroma:v16];
    if (v12) {
      FigDebugAssert3();
    }
  }

  return v12;
}

- (int)runOnLuma:(id)a3 andChroma:(id)a4 outChroma:(id)a5 colorCubeFixType:(int)a6
{
  return [(ColorCubeCorrectionStage *)self runOnLuma:a3 andChroma:a4 withMask:0 outChroma:a5 colorCubeFixType:*(void *)&a6];
}

- (void).cxx_destruct
{
  for (uint64_t i = 40; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end