@interface SingleColorCubeCorrectionStage
+ (int)prewarmShaders:(id)a3;
- (BOOL)canApplyMaskedCube;
- (id)init:(id)a3 alternateCubeSize:(unsigned int)a4 alternateCubeData:(const char *)a5 defaultCubeSize:(unsigned int)a6 defaultCubeData:(const char *)a7;
- (id)init:(id)a3 cubeSize:(unsigned int)a4 data:(const char *)a5;
- (int)load3DTextureFromData:(const char *)a3 cubeSize:(unsigned int)a4 metal:(id)a5 outTexture:(id *)a6;
- (int)runOnLuma:(id)a3 andChroma:(id)a4 outChroma:(id)a5;
- (int)runOnLuma:(id)a3 andChroma:(id)a4 withMask:(id)a5 outChroma:(id)a6;
@end

@implementation SingleColorCubeCorrectionStage

+ (int)prewarmShaders:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_sharedInstance(SingleColorCubeCorrectionStageShared, v4, v5, v6);
  v10 = objc_msgSend_getShaders_(v7, v8, (uint64_t)v3, v9);

  if (v10) {
    int v11 = 0;
  }
  else {
    int v11 = -12786;
  }

  return v11;
}

- (int)load3DTextureFromData:(const char *)a3 cubeSize:(unsigned int)a4 metal:(id)a5 outTexture:(id *)a6
{
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263F12A50]);
  v13 = v10;
  if (!v10) {
    goto LABEL_5;
  }
  objc_msgSend_setTextureType_(v10, v11, 7, v12);
  objc_msgSend_setWidth_(v13, v14, a4, v15);
  objc_msgSend_setHeight_(v13, v16, a4, v17);
  objc_msgSend_setDepth_(v13, v18, a4, v19);
  objc_msgSend_setPixelFormat_(v13, v20, 70, v21);
  objc_msgSend_setUsage_(v13, v22, 1, v23);
  v27 = objc_msgSend_device(v9, v24, v25, v26);
  v30 = objc_msgSend_newTextureWithDescriptor_(v27, v28, (uint64_t)v13, v29);
  id v31 = *a6;
  *a6 = v30;

  id v33 = *a6;
  if (*a6)
  {
    memset(v36, 0, 24);
    v36[3] = a4;
    v36[4] = a4;
    v36[5] = a4;
    objc_msgSend_replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_(v33, v32, (uint64_t)v36, 0, 0, a3, 4 * a4, 4 * a4 * a4);
    int v34 = 0;
  }
  else
  {
LABEL_5:
    FigDebugAssert3();
    int v34 = FigSignalErrorAt();
  }

  return v34;
}

- (id)init:(id)a3 alternateCubeSize:(unsigned int)a4 alternateCubeData:(const char *)a5 defaultCubeSize:(unsigned int)a6 defaultCubeData:(const char *)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v10 = *(void *)&a4;
  id v13 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SingleColorCubeCorrectionStage;
  v14 = [(SingleColorCubeCorrectionStage *)&v27 init];
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&v14->_metal, a3);
  uint64_t v19 = objc_msgSend_sharedInstance(SingleColorCubeCorrectionStageShared, v16, v17, v18);
  uint64_t v22 = objc_msgSend_getShaders_(v19, v20, (uint64_t)v15->_metal, v21);
  shaders = v15->_shaders;
  v15->_shaders = (ColorCubeCorrectionShaders *)v22;

  if (!v15->_shaders)
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_14:
    uint64_t v25 = 0;
    goto LABEL_10;
  }
  if (v10 && a5)
  {
    v15->_canApplyMaskedCube = 1;
    if (objc_msgSend_load3DTextureFromData_cubeSize_metal_outTexture_(v15, v24, (uint64_t)a5, v10, v13, &v15->_alternateCubeTexture))goto LABEL_13; {
  }
    }
  else
  {
    v15->_canApplyMaskedCube = 0;
  }
  if (objc_msgSend_load3DTextureFromData_cubeSize_metal_outTexture_(v15, v24, (uint64_t)a7, v8, v13, &v15->_defaultCubeTexture))
  {
LABEL_13:
    FigDebugAssert3();
    goto LABEL_14;
  }
  uint64_t v25 = v15;
LABEL_10:

  return v25;
}

- (id)init:(id)a3 cubeSize:(unsigned int)a4 data:(const char *)a5
{
  return (id)objc_msgSend_init_alternateCubeSize_alternateCubeData_defaultCubeSize_defaultCubeData_(self, a2, (uint64_t)a3, 0, 0, *(void *)&a4, a5);
}

- (int)runOnLuma:(id)a3 andChroma:(id)a4 withMask:(id)a5 outChroma:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v16 = a6;
  if (v12 && (objc_msgSend_canApplyMaskedCube(self, v13, v14, v15) & 1) == 0)
  {
    FigDebugAssert3();
  }
  else
  {
    uint64_t v17 = objc_msgSend_commandQueue(self->_metal, v13, v14, v15);
    uint64_t v21 = objc_msgSend_commandBuffer(v17, v18, v19, v20);

    if (!v21)
    {
      FigDebugAssert3();
      int v49 = FigSignalErrorAt();
      goto LABEL_11;
    }
    uint64_t v25 = objc_msgSend_computeCommandEncoder(v21, v22, v23, v24);
    if (!v25)
    {
      FigDebugAssert3();
      int v49 = FigSignalErrorAt();

      goto LABEL_11;
    }
    v28 = v25;
    uint64_t v29 = 16;
    if (!v12) {
      uint64_t v29 = 8;
    }
    objc_msgSend_setComputePipelineState_(v25, v26, *(uint64_t *)((char *)&self->_shaders->super.isa + v29), v27);
    objc_msgSend_setImageblockWidth_height_(v28, v30, 32, 32);
    objc_msgSend_setTexture_atIndex_(v28, v31, (uint64_t)v10, 0);
    objc_msgSend_setTexture_atIndex_(v28, v32, (uint64_t)v11, 1);
    objc_msgSend_setTexture_atIndex_(v28, v33, (uint64_t)v16, 2);
    objc_msgSend_setTexture_atIndex_(v28, v34, (uint64_t)self->_defaultCubeTexture, 4);
    if (v12)
    {
      objc_msgSend_setTexture_atIndex_(v28, v35, (uint64_t)self->_alternateCubeTexture, 3);
      objc_msgSend_setTexture_atIndex_(v28, v38, (uint64_t)v12, 5);
    }
    v53[0] = objc_msgSend_width(v16, v35, v36, v37);
    v53[1] = objc_msgSend_height(v16, v39, v40, v41);
    v53[2] = 1;
    int64x2_t v51 = vdupq_n_s64(0x10uLL);
    uint64_t v52 = 1;
    objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v28, v42, (uint64_t)v53, (uint64_t)&v51);
    objc_msgSend_endEncoding(v28, v43, v44, v45);
    objc_msgSend_commit(v21, v46, v47, v48);
  }
  int v49 = 0;
LABEL_11:

  return v49;
}

- (int)runOnLuma:(id)a3 andChroma:(id)a4 outChroma:(id)a5
{
  return objc_msgSend_runOnLuma_andChroma_withMask_outChroma_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, a5);
}

- (BOOL)canApplyMaskedCube
{
  return self->_canApplyMaskedCube;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_shaders, 0);
  objc_storeStrong((id *)&self->_alternateCubeTexture, 0);

  objc_storeStrong((id *)&self->_defaultCubeTexture, 0);
}

@end