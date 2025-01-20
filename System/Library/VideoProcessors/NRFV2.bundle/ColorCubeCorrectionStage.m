@interface ColorCubeCorrectionStage
+ (int)prewarmShaders:(id)a3;
- (id)init:(id)a3;
- (int)runOnLuma:(id)a3 andChroma:(id)a4 outChroma:(id)a5 colorCubeFixType:(int)a6;
- (int)runOnLuma:(id)a3 andChroma:(id)a4 withMask:(id)a5 outChroma:(id)a6 colorCubeFixType:(int)a7;
- (int)setMaskedSkyCubeVersion:(int)a3;
@end

@implementation ColorCubeCorrectionStage

+ (int)prewarmShaders:(id)a3
{
  return objc_msgSend_prewarmShaders_(SingleColorCubeCorrectionStage, a2, (uint64_t)a3, v3);
}

- (id)init:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ColorCubeCorrectionStage;
  v6 = [(ColorCubeCorrectionStage *)&v23 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metal, a3);
    v8 = [SingleColorCubeCorrectionStage alloc];
    uint64_t inited = objc_msgSend_init_cubeSize_data_(v8, v9, (uint64_t)v5, 32, &unk_263017AA8);
    v11 = v7->fixes[0];
    v7->fixes[0] = (SingleColorCubeCorrectionStage *)inited;

    v12 = [SingleColorCubeCorrectionStage alloc];
    uint64_t v14 = objc_msgSend_init_cubeSize_data_(v12, v13, (uint64_t)v5, 32, &unk_263037AA8);
    v15 = v7->fixes[1];
    v7->fixes[1] = (SingleColorCubeCorrectionStage *)v14;

    v16 = [SingleColorCubeCorrectionStage alloc];
    uint64_t v18 = objc_msgSend_init_cubeSize_data_(v16, v17, (uint64_t)v5, 32, &unk_263057AA8);
    v19 = v7->fixes[2];
    v7->fixes[2] = (SingleColorCubeCorrectionStage *)v18;

    v20 = v7->fixes[3];
    v7->fixes[3] = 0;

    v21 = v7;
  }

  return v7;
}

- (int)setMaskedSkyCubeVersion:(int)a3
{
  switch(a3)
  {
    case 1:
      v7 = [SingleColorCubeCorrectionStage alloc];
      uint64_t inited = (SingleColorCubeCorrectionStage *)objc_msgSend_init_alternateCubeSize_alternateCubeData_defaultCubeSize_defaultCubeData_(v7, v8, (uint64_t)self->_metal, 32, &unk_2630D7AA8, 32, &unk_2630F7AA8);
      goto LABEL_8;
    case 0:
      v9 = [SingleColorCubeCorrectionStage alloc];
      uint64_t inited = (SingleColorCubeCorrectionStage *)objc_msgSend_init_alternateCubeSize_alternateCubeData_defaultCubeSize_defaultCubeData_(v9, v10, (uint64_t)self->_metal, 32, &unk_263097AA8, 32, &unk_2630B7AA8);
      goto LABEL_8;
    case -1:
      v4 = [SingleColorCubeCorrectionStage alloc];
      uint64_t inited = (SingleColorCubeCorrectionStage *)objc_msgSend_init_alternateCubeSize_alternateCubeData_defaultCubeSize_defaultCubeData_(v4, v5, (uint64_t)self->_metal, 32, &unk_263077AA8, 32, &unk_263077AA8);
LABEL_8:
      v11 = self->fixes[3];
      self->fixes[3] = inited;

      return 0;
  }
  return -1;
}

- (int)runOnLuma:(id)a3 andChroma:(id)a4 withMask:(id)a5 outChroma:(id)a6 colorCubeFixType:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v16 = a6;
  if (a7 == -1)
  {
    int v17 = FigSignalErrorAt();
  }
  else if ((a7 - 4) >= 0xFFFFFFFB)
  {
    int v17 = objc_msgSend_runOnLuma_andChroma_withMask_outChroma_(self->fixes[a7], v15, (uint64_t)v12, (uint64_t)v13, v14, v16);
    if (v17) {
      FigDebugAssert3();
    }
  }
  else
  {
    int v17 = -1;
  }

  return v17;
}

- (int)runOnLuma:(id)a3 andChroma:(id)a4 outChroma:(id)a5 colorCubeFixType:(int)a6
{
  return objc_msgSend_runOnLuma_andChroma_withMask_outChroma_colorCubeFixType_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, a5, *(void *)&a6);
}

- (void).cxx_destruct
{
  for (uint64_t i = 40; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end