@interface NUNIGlobetrotterRenderer
- (id)_renderGlobeLinesWithCommandBuffer:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5;
- (void)_createPipelineForProgramType:(unint64_t)a3 fromLibrary:(id)a4;
- (void)_initPrograms;
- (void)draw3DWithEncoder:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5;
- (void)drawOffscreen3DWithCommandBuffer:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5;
@end

@implementation NUNIGlobetrotterRenderer

- (void)draw3DWithEncoder:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [v9 position];
  long long v104 = v10;
  uint64_t v11 = [v9 programType];
  [v8 setFrontFacingWinding:1];
  [v8 setCullMode:2];
  [v9 equatorRotation];
  float v13 = v12;
  unint64_t projectionType = a4->projectionType;
  if (projectionType == 1)
  {
    float v22 = 1.0;
  }
  else
  {
    simd_float4 v15 = 0uLL;
    simd_float4 v16 = 0uLL;
    simd_float4 v17 = 0uLL;
    simd_float4 v18 = 0uLL;
    if (projectionType) {
      goto LABEL_6;
    }
    objc_msgSend(v9, "radius", 0.0, 0.0, 0.0, 0.0);
    float v20 = v19;
    [v9 radiusScale];
    float v22 = v20 * v21;
  }
  UMFloat4x4MakeScale(v22);
LABEL_6:
  simd_float4 v96 = v18;
  simd_float4 v98 = v17;
  simd_float4 v100 = v16;
  simd_float4 v102 = v15;
  *(double *)v23.columns[0].i64 = UMFloat4x4MakeTranslate();
  if (v13 == 0.0)
  {
    v32.columns[1] = v100;
    v32.columns[0] = v102;
    v32.columns[3] = v96;
    v32.columns[2] = v98;
  }
  else
  {
    simd_float4 v91 = v23.columns[1];
    simd_float4 v93 = v23.columns[0];
    simd_float4 v87 = v23.columns[3];
    simd_float4 v89 = v23.columns[2];
    *(double *)v24.i64 = UMFloat4x4MakeRotateZ(v13 + 0.0);
    v147.columns[0] = v24;
    v147.columns[1] = v25;
    v147.columns[2] = v26;
    v147.columns[3] = v27;
    v146.columns[1] = v100;
    v146.columns[0] = v102;
    v146.columns[3] = v96;
    v146.columns[2] = v98;
    *(double *)v28.i64 = UMMul(v146, v147);
    v32.columns[0] = v28;
    v32.columns[1] = v29;
    v23.columns[1] = v91;
    v23.columns[0] = v93;
    v32.columns[2] = v30;
    v32.columns[3] = v31;
    v23.columns[3] = v87;
    v23.columns[2] = v89;
  }
  *(double *)v33.i64 = UMMul(v23, v32);
  if (v11)
  {
    if (v11 == 1) {
      -[NUNIGlobetrotterRenderer draw3DWithEncoder:state:spheroid:]();
    }
  }
  else
  {
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    float32x4_t v116 = 0u;
    float32x4_t v117 = 0u;
    float32x4_t v114 = 0u;
    float32x4_t v115 = 0u;
    long long v112 = 0u;
    float32x4_t v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    simd_float4 v101 = v34;
    simd_float4 v103 = v33;
    simd_float4 v97 = v36;
    simd_float4 v99 = v35;
    [(NUNIClassicRenderer *)self bindAssetArt:3 renderEncoder:v8 toSlot:0];
    [v8 setFragmentTexture:self->_globeLinesCurrentTexture atIndex:1];
    long long v145 = v104;
    v140[0] = v103;
    v140[1] = v101;
    v140[2] = v99;
    v140[3] = v97;
    long long v37 = *(_OWORD *)&a4[4].collectionType;
    v140[4] = *(_OWORD *)&a4[4].viewport.width;
    v140[5] = v37;
    long long v38 = *(_OWORD *)&a4[5].viewport.width;
    v140[6] = *(_OWORD *)&a4[4].octGeomRange.start;
    v140[7] = v38;
    [v9 light];
    float v94 = v39;
    __float2 v41 = __sincosf_stret(v40);
    __float2 v42 = __sincosf_stret(v94);
    v43.f32[0] = v42.__cosval * v41.__sinval;
    v43.f32[1] = v42.__sinval * v41.__sinval;
    v43.i64[1] = LODWORD(v41.__cosval);
    *(double *)&long long v44 = UMMul(*(float32x4_t *)&a4[4].viewport.width, *(float32x4_t *)&a4[4].collectionType, *(float32x4_t *)&a4[4].octGeomRange.start, *(float32x4_t *)&a4[5].viewport.width, v43);
    long long v111 = v44;
    [v9 blend];
    float v105 = v45;
    double v46 = (float)((float)(v45 * 0.35) + (float)((float)(1.0 - v45) * 0.72));
    double v47 = (float)((float)(v45 * 0.0) + (float)((float)(1.0 - v45) * 0.92157));
    double v48 = (float)((float)(v45 * 0.15) + (float)((float)(1.0 - v45) * 0.98431));
    double v49 = (float)((float)(v45 * 0.25) + (float)((float)(1.0 - v45) * 0.54902));
    float v95 = 1.0 - v45;
    double v50 = (float)((float)(v45 * 0.56) + (float)((float)(1.0 - v45) * 0.87843));
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__NUNIGlobetrotterRenderer_draw3DWithEncoder_state_spheroid___block_invoke;
    aBlock[3] = &unk_2644CD838;
    id v51 = v9;
    id v109 = v51;
    v52 = (double (**)(void, double))_Block_copy(aBlock);
    v106[0] = MEMORY[0x263EF8330];
    v106[1] = 3221225472;
    v106[2] = __61__NUNIGlobetrotterRenderer_draw3DWithEncoder_state_spheroid___block_invoke_2;
    v106[3] = &unk_2644CD838;
    id v53 = v51;
    id v107 = v53;
    v54 = (double (**)(void, double))_Block_copy(v106);
    v55 = v54;
    if (v105 == 0.0)
    {
      v56 = v54 + 2;
      *(double *)v57.i64 = v54[2](v54, v46);
      float32x4_t v117 = v57;
      *(double *)v58.i64 = (*v56)(v55, v47);
      float32x4_t v116 = v58;
      *(double *)v59.i64 = (*v56)(v55, v48);
      float32x4_t v115 = v59;
      *(double *)v60.i64 = (*v56)(v55, v49);
      float32x4_t v114 = v60;
      *(double *)v61.i64 = (*v56)(v55, v50);
    }
    else
    {
      *(double *)v62.i64 = v52[2](v52, v46);
      if (v105 == 1.0)
      {
        float32x4_t v117 = v62;
        *(double *)v63.i64 = v52[2](v52, v47);
        float32x4_t v116 = v63;
        *(double *)v64.i64 = v52[2](v52, v48);
        float32x4_t v115 = v64;
        *(double *)v65.i64 = v52[2](v52, v49);
        float32x4_t v114 = v65;
        *(double *)v61.i64 = v52[2](v52, v50);
      }
      else
      {
        float32x4_t v90 = v62;
        *(double *)v72.i64 = v52[2](v52, v47);
        float32x4_t v92 = v72;
        *(double *)v73.i64 = v52[2](v52, v48);
        float32x4_t v88 = v73;
        *(double *)v74.i64 = v52[2](v52, v49);
        float32x4_t v86 = v74;
        *(double *)v75.i64 = v52[2](v52, v50);
        float32x4_t v85 = v75;
        *(double *)v76.i64 = v55[2](v55, v46);
        float32x4_t v84 = v76;
        *(double *)v77.i64 = v55[2](v55, v47);
        float32x4_t v83 = v77;
        *(double *)v78.i64 = v55[2](v55, v48);
        float32x4_t v82 = v78;
        *(double *)v79.i64 = v55[2](v55, v49);
        float32x4_t v81 = v79;
        *(double *)v80.i64 = v55[2](v55, v50);
        float32x4_t v116 = vmlaq_n_f32(vmulq_n_f32(v92, v105), v83, v95);
        float32x4_t v117 = vmlaq_n_f32(vmulq_n_f32(v90, v105), v84, v95);
        float32x4_t v114 = vmlaq_n_f32(vmulq_n_f32(v86, v105), v81, v95);
        float32x4_t v115 = vmlaq_n_f32(vmulq_n_f32(v88, v105), v82, v95);
        float32x4_t v61 = vmlaq_n_f32(vmulq_n_f32(v85, v105), v80, v95);
      }
    }
    float32x4_t v113 = v61;
    [v53 colorize];
    CLKUIConvertToRGBfFromSRGBf_fast();
    long long v110 = v66;
    [v53 opacity];
    LODWORD(v112) = v67;
    v148.columns[1] = v101;
    v148.columns[0] = v103;
    v148.columns[3] = v97;
    v148.columns[2] = v99;
    *(double *)&long long v68 = UMMul(*(simd_float4x4 *)&a4[5].collectionType, v148);
    long long v141 = v68;
    long long v142 = v69;
    long long v143 = v70;
    long long v144 = v71;
    [v8 setVertexBytes:v140 length:208 atIndex:1];
    [v8 setFragmentBytes:&v110 length:480 atIndex:0];
  }
  objc_msgSend(v8, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, a4->octGeomRange.count, 0, (void)-[NUNIClassicRenderer resources](self, "resources")[40], 2 * a4->octGeomRange.start);
  [v8 setCullMode:0];
}

uint64_t __61__NUNIGlobetrotterRenderer_draw3DWithEncoder_state_spheroid___block_invoke(uint64_t a1, double a2)
{
  if (a2 >= 0.5)
  {
    [*(id *)(a1 + 32) colorize];
    __asm { FMOV            V0.4S, #1.0 }
  }
  else
  {
    [*(id *)(a1 + 32) colorize];
  }
  return CLKUIConvertToRGBfFromSRGBf_fast();
}

uint64_t __61__NUNIGlobetrotterRenderer_draw3DWithEncoder_state_spheroid___block_invoke_2(uint64_t a1)
{
  return CLKUIConvertToRGBfFromSRGBf_fast();
}

- (void)drawOffscreen3DWithCommandBuffer:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5
{
  id v14 = a3;
  id v8 = a5;
  if (![v8 programType]
    && !UMFloat4x4Equal(*(simd_float4x4 *)&a4[4].viewport.width, *(simd_float4x4 *)self->_anon_1d0))
  {
    id v9 = [(NUNIGlobetrotterRenderer *)self _renderGlobeLinesWithCommandBuffer:v14 state:a4 spheroid:v8];
    globeLinesCurrentTexture = self->_globeLinesCurrentTexture;
    self->_globeLinesCurrentTexture = v9;

    long long v11 = *(_OWORD *)&a4[4].viewport.width;
    long long v12 = *(_OWORD *)&a4[4].collectionType;
    long long v13 = *(_OWORD *)&a4[5].viewport.width;
    *(_OWORD *)&self->_anon_1d0[32] = *(_OWORD *)&a4[4].octGeomRange.start;
    *(_OWORD *)&self->_anon_1d0[48] = v13;
    *(_OWORD *)self->_anon_1d0 = v11;
    *(_OWORD *)&self->_anon_1d0[16] = v12;
  }
}

- (id)_renderGlobeLinesWithCommandBuffer:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5
{
  id v7 = a3;
  globeLineTextureResourcePool = self->_globeLineTextureResourcePool;
  if (!globeLineTextureResourcePool)
  {
    id v9 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:10 width:a4->viewport.width height:a4->viewport.height mipmapped:0];
    [v9 setUsage:5];
    long long v10 = [MEMORY[0x263F32150] texturePoolWithDescriptor:v9 expectedCountPerFrame:3];
    long long v11 = self->_globeLineTextureResourcePool;
    self->_globeLineTextureResourcePool = v10;

    globeLineTextureResourcePool = self->_globeLineTextureResourcePool;
  }
  long long v12 = [(CLKUIMetalResourcePool *)globeLineTextureResourcePool dequeueReusableResourceForUseOnCommandBuffer:v7];
  long long v13 = objc_opt_new();
  id v14 = [v13 colorAttachments];
  simd_float4 v15 = [v14 objectAtIndexedSubscript:0];
  [v15 setTexture:v12];

  simd_float4 v16 = [v13 colorAttachments];
  simd_float4 v17 = [v16 objectAtIndexedSubscript:0];
  [v17 setLoadAction:2];

  simd_float4 v18 = [v13 colorAttachments];
  float v19 = [v18 objectAtIndexedSubscript:0];
  objc_msgSend(v19, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  float v20 = [v13 colorAttachments];
  float v21 = [v20 objectAtIndexedSubscript:0];
  [v21 setStoreAction:1];

  float v22 = [v7 renderCommandEncoderWithDescriptor:v13];
  objc_msgSend(v22, "setRenderPipelineState:", (void)-[NUNIClassicRenderer resources](self, "resources")[24]);
  long long v39 = 0u;
  long long v40 = 0u;
  memset(&v38[4], 0, 384);
  long long v23 = *(_OWORD *)&a4[4].collectionType;
  v38[0] = *(_OWORD *)&a4[4].viewport.width;
  v38[1] = v23;
  long long v24 = *(_OWORD *)&a4[5].viewport.width;
  v38[2] = *(_OWORD *)&a4[4].octGeomRange.start;
  v38[3] = v24;
  for (uint64_t i = 8; i != 32; ++i)
  {
    float v26 = (float)(unint64_t)(i - 8) * 6.28318531 / 24.0;
    *((__float2 *)v38 + i) = __sincosf_stret(v26);
  }
  for (unint64_t j = 0; j != 12; ++j)
  {
    float v28 = (float)j * 3.14159265 / 12.0;
    unint64_t v29 = (unint64_t)__sincosf_stret(v28);
    *(double *)&long long v30 = UMMul(*(float32x4_t *)&a4[4].viewport.width, *(float32x4_t *)&a4[4].collectionType, *(float32x4_t *)&a4[4].octGeomRange.start, *(float32x4_t *)&a4[5].viewport.width, (float32x4_t)v29);
    v38[j + 16] = v30;
  }
  *(double *)&_Q0 = UMMul(*(float32x4_t *)&a4[4].viewport.width, *(float32x4_t *)&a4[4].collectionType, *(float32x4_t *)&a4[4].octGeomRange.start, *(float32x4_t *)&a4[5].viewport.width, (float32x4_t)xmmword_21E8F1C00);
  long long v39 = _Q0;
  v37[0] = 0;
  v37[1] = 0x3F80000000000000;
  v37[2] = 1065353216;
  __asm { FMOV            V0.2S, #1.0 }
  v37[3] = _Q0;
  [v22 setVertexBytes:v37 length:32 atIndex:1];
  [v22 setFragmentBytes:v38 length:480 atIndex:0];
  [v22 drawPrimitives:4 vertexStart:0 vertexCount:4];
  [v22 setCullMode:0];
  [v22 endEncoding];

  return v12;
}

- (void)_createPipelineForProgramType:(unint64_t)a3 fromLibrary:(id)a4
{
  id v38 = a4;
  unint64_t v6 = [(NUNIRenderer *)self pixelFormat];
  id v7 = @"classic_sprite_vsh";
  id v8 = @"classic_sprite_fsh";
  id v9 = @"NUNIClassicShaders";
  switch(a3)
  {
    case 0uLL:
      id v7 = @"globetrotter_globe_vsh";
      id v8 = @"globetrotter_globe_fsh";
      goto LABEL_5;
    case 1uLL:
      goto LABEL_6;
    case 2uLL:
      id v7 = @"classic_luna_vsh";
      id v8 = @"classic_luna_fsh";
      goto LABEL_6;
    case 3uLL:
      id v7 = @"globetrotter_lines_vsh";
      id v8 = @"globetrotter_lines_fsh";
      unint64_t v6 = 10;
LABEL_5:
      id v9 = @"NUNIGlobetrotterShaders";
LABEL_6:
      long long v10 = (void *)MEMORY[0x263F32140];
      long long v11 = NUNIBundle();
      long long v12 = [(NUNIClassicRenderer *)self mtlDevice];
      long long v13 = [v10 archiveWithName:v9 bundle:v11 device:v12];

      id v14 = [MEMORY[0x263F128B8] functionDescriptor];
      [v14 setName:v7];
      simd_float4 v15 = (void *)[v13 newFunctionInLibrary:v38 withDescriptor:v14];
      [v14 setName:v8];
      simd_float4 v16 = (void *)[v13 newFunctionInLibrary:v38 withDescriptor:v14];
      id v17 = objc_alloc_init(MEMORY[0x263F129C0]);
      [v17 setLabel:_NUNIGlobetrotterPipelineNames[a3]];
      [v17 setVertexFunction:v15];
      [v17 setFragmentFunction:v16];
      simd_float4 v18 = [v17 colorAttachments];
      float v19 = [v18 objectAtIndexedSubscript:0];
      [v19 setPixelFormat:v6];

      float v20 = [v17 colorAttachments];
      float v21 = [v20 objectAtIndexedSubscript:0];
      [v21 setBlendingEnabled:1];

      float v22 = [v17 colorAttachments];
      long long v23 = [v22 objectAtIndexedSubscript:0];
      [v23 setRgbBlendOperation:0];

      long long v24 = [v17 colorAttachments];
      simd_float4 v25 = [v24 objectAtIndexedSubscript:0];
      [v25 setAlphaBlendOperation:0];

      float v26 = [v17 colorAttachments];
      simd_float4 v27 = [v26 objectAtIndexedSubscript:0];
      [v27 setSourceRGBBlendFactor:1];

      float v28 = [v17 colorAttachments];
      unint64_t v29 = [v28 objectAtIndexedSubscript:0];
      [v29 setSourceAlphaBlendFactor:1];

      long long v30 = [v17 colorAttachments];
      simd_float4 v31 = [v30 objectAtIndexedSubscript:0];
      [v31 setDestinationRGBBlendFactor:5];

      simd_float4x4 v32 = [v17 colorAttachments];
      simd_float4 v33 = [v32 objectAtIndexedSubscript:0];
      [v33 setDestinationAlphaBlendFactor:5];

      simd_float4 v34 = [(NUNIClassicRenderer *)self mtlDevice];
      uint64_t v35 = [v13 newRenderPipelineStateForDevice:v34 withDescriptor:v17];
      simd_float4 v36 = [(NUNIClassicRenderer *)self resources];
      long long v37 = v36->pipelines[a3];
      v36->pipelines[a3] = (MTLRenderPipelineState *)v35;

      if (!(void)[(NUNIClassicRenderer *)self resources][8 * a3]) {
        -[NUNIGlobetrotterRenderer _createPipelineForProgramType:fromLibrary:]();
      }

      return;
    default:
      -[NUNIGlobetrotterRenderer _createPipelineForProgramType:fromLibrary:]();
  }
}

- (void)_initPrograms
{
  NUNIBundle();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = [(NUNIClassicRenderer *)self mtlDevice];
  v4 = (void *)[v3 newDefaultLibraryWithBundle:v5 error:0];

  [(NUNIGlobetrotterRenderer *)self _createPipelineForProgramType:0 fromLibrary:v4];
  [(NUNIGlobetrotterRenderer *)self _createPipelineForProgramType:1 fromLibrary:v4];
  [(NUNIGlobetrotterRenderer *)self _createPipelineForProgramType:2 fromLibrary:v4];
  [(NUNIGlobetrotterRenderer *)self _createPipelineForProgramType:3 fromLibrary:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globeLinesCurrentTexture, 0);
  objc_storeStrong((id *)&self->_globeLineTextureResourcePool, 0);
}

- (void)draw3DWithEncoder:state:spheroid:.cold.1()
{
  __assert_rtn("-[NUNIGlobetrotterRenderer draw3DWithEncoder:state:spheroid:]", "NUNIGlobetrotterRenderer.m", 94, "ptype != NUNIProgramTypeSprite");
}

- (void)_createPipelineForProgramType:fromLibrary:.cold.1()
{
}

- (void)_createPipelineForProgramType:fromLibrary:.cold.2()
{
  __assert_rtn("-[NUNIGlobetrotterRenderer _createPipelineForProgramType:fromLibrary:]", "NUNIGlobetrotterRenderer.m", 334, "[self resources]->pipelines[programType] != nil");
}

@end