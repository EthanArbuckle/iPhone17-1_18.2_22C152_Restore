@interface NUNIClassicRenderer
- (MTLDevice)mtlDevice;
- (NUNIClassicRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5;
- (NUNIClassicRendererResources)resources;
- (NUNIClassicTextureGroup)textureGroup;
- (void)_createPipelineForProgramType:(unint64_t)a3 fromLibrary:(id)a4;
- (void)_initHemi;
- (void)_initPrograms;
- (void)_updateStateWithScene:(id)a3 viewport:(NUNIViewport)a4;
- (void)bindAssetArt:(unint64_t)a3 renderEncoder:(id)a4 toSlot:(unint64_t)a5;
- (void)dealloc;
- (void)discard;
- (void)draw3DWithEncoder:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5;
- (void)drawSpriteWithEncoder:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5;
- (void)renderOffscreenWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5;
- (void)renderWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 passDescriptor:(id)a6;
@end

@implementation NUNIClassicRenderer

- (NUNIClassicRendererResources)resources
{
  return &self->_resources;
}

- (void)discard
{
  p_resources = &self->_resources;
  vertexBuffer = self->_resources.vertexBuffer;
  self->_resources.vertexBuffer = 0;

  indexBuffer = p_resources->indexBuffer;
  p_resources->indexBuffer = 0;

  for (uint64_t i = 0; i != 4; ++i)
  {
    v6 = p_resources->pipelines[i];
    p_resources->pipelines[i] = 0;
  }
}

- (NUNIClassicRenderer)initWithPixelFormat:(unint64_t)a3 textureSuffix:(id)a4 rendererStyle:(unint64_t)a5
{
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NUNIClassicRenderer;
  v9 = [(NUNIRenderer *)&v17 initWithPixelFormat:a3 textureSuffix:v8 rendererStyle:a5];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F32148] sharedDevice];
    mtlDevice = v9->_mtlDevice;
    v9->_mtlDevice = (MTLDevice *)v10;

    uint64_t v12 = +[NUNIClassicResourceManager sharedInstance];
    resourceManager = v9->_resourceManager;
    v9->_resourceManager = (NUNIClassicResourceManager *)v12;

    [(NUNIClassicResourceManager *)v9->_resourceManager addClient];
    uint64_t v14 = [(NUNIClassicResourceManager *)v9->_resourceManager textureGroupWithSuffix:v8];
    textureGroup = v9->_textureGroup;
    v9->_textureGroup = (NUNIClassicTextureGroup *)v14;

    [(NUNIClassicRenderer *)v9 _initPrograms];
    [(NUNIClassicRenderer *)v9 _initHemi];
  }

  return v9;
}

- (void)dealloc
{
  [(NUNIClassicResourceManager *)self->_resourceManager removeClient];
  v3.receiver = self;
  v3.super_class = (Class)NUNIClassicRenderer;
  [(NUNIRenderer *)&v3 dealloc];
}

- (void)_initHemi
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = (id)objc_opt_new();
  unsigned int v4 = _NTKCreateHalfOctahedron(v3, 1.0);
  _NTKCreateHalfOctahedron(v3, -1.0);

  self->_octahedronGeomRange = (NUNIClassicGeometryRange)(v4 | 0xD8000000000);
  uint64_t v14 = 0;
  long long v12 = xmmword_21E8FEDD0;
  uint64_t v13 = 0x3F0000003E000001;
  uint64_t v17 = 0;
  long long v15 = xmmword_21E8FEDE0;
  uint64_t v16 = 0x3F0000003F600000;
  uint64_t v20 = 0;
  long long v18 = xmmword_21E8FEDF0;
  uint64_t v19 = 0x3F0000003EC00000;
  uint64_t v23 = 0;
  long long v21 = xmmword_21E8FEE00;
  uint64_t v22 = 0x3F0000003F200000;
  id v5 = v3;
  uint64_t v6 = [v5 addVertices:&v12 count:4];
  unsigned int v7 = objc_msgSend(v5, "addIndices:count:vbase:", &_NTKCreateQuad_indices, 4, v6, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);

  self->_quadGeomRange = (NUNIClassicGeometryRange)(v7 | 0x400000000);
  id v8 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_mtlDevice, "newBufferWithBytes:length:options:", [v5 vertices], 32 * (int)objc_msgSend(v5, "vcount"), 0);
  vertexBuffer = self->_resources.vertexBuffer;
  self->_resources.vertexBuffer = v8;

  uint64_t v10 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_mtlDevice, "newBufferWithBytes:length:options:", [v5 indices], 2 * (int)objc_msgSend(v5, "icount"), 0);
  indexBuffer = self->_resources.indexBuffer;
  self->_resources.indexBuffer = v10;
}

- (void)bindAssetArt:(unint64_t)a3 renderEncoder:(id)a4 toSlot:(unint64_t)a5
{
  textureGroup = self->_textureGroup;
  id v8 = a4;
  v9 = [(NUNIClassicTextureGroup *)textureGroup textures];
  id v11 = [v9 objectAtIndexedSubscript:a3];

  uint64_t v10 = [v11 atlas];
  [v10 bind:v8 slot:a5];
}

- (void)draw3DWithEncoder:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [v9 position];
  long long v79 = v10;
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
  simd_float4 v74 = v18;
  simd_float4 v76 = v17;
  simd_float4 v77 = v16;
  simd_float4 v78 = v15;
  *(double *)v23.columns[0].i64 = UMFloat4x4MakeTranslate();
  if (v13 == 0.0)
  {
    v34.columns[1] = v77;
    v34.columns[0] = v78;
    v34.columns[3] = v74;
    v34.columns[2] = v76;
  }
  else
  {
    simd_float4 v69 = v23.columns[1];
    simd_float4 v71 = v23.columns[0];
    simd_float4 v67 = v23.columns[3];
    simd_float4 v68 = v23.columns[2];
    uint64_t v24 = [v9 type];
    float v25 = 1.5708;
    if (v24 != 4) {
      float v25 = 0.0;
    }
    *(double *)v26.i64 = UMFloat4x4MakeRotateZ(v13 + v25);
    v108.columns[0] = v26;
    v108.columns[1] = v27;
    v108.columns[2] = v28;
    v108.columns[3] = v29;
    v107.columns[1] = v77;
    v107.columns[0] = v78;
    v107.columns[3] = v74;
    v107.columns[2] = v76;
    *(double *)v30.i64 = UMMul(v107, v108);
    v34.columns[0] = v30;
    v34.columns[1] = v31;
    v23.columns[1] = v69;
    v23.columns[0] = v71;
    v34.columns[2] = v32;
    v34.columns[3] = v33;
    v23.columns[3] = v67;
    v23.columns[2] = v68;
  }
  *(double *)v35.i64 = UMMul(v23, v34);
  if (v11 == 1) {
    -[NUNIClassicRenderer draw3DWithEncoder:state:spheroid:]();
  }
  v75.columns[0] = v35;
  v75.columns[1] = v36;
  v75.columns[2] = v37;
  v75.columns[3] = v38;
  [v9 light];
  float v70 = v39;
  __float2 v41 = __sincosf_stret(v40);
  __float2 v42 = __sincosf_stret(v70);
  v43.f32[0] = v42.__cosval * v41.__sinval;
  v43.f32[1] = v42.__sinval * v41.__sinval;
  v43.i64[1] = LODWORD(v41.__cosval);
  v44 = a4 + 4;
  *(double *)v45.i64 = UMMul(*(float32x4_t *)&a4[4].viewport.width, *(float32x4_t *)&a4[4].collectionType, *(float32x4_t *)&a4[4].octGeomRange.start, *(float32x4_t *)&a4[5].viewport.width, v43);
  if (v11 == 2)
  {
    uint64_t v90 = 0;
    uint64_t v91 = 0;
    simd_float4 v73 = v45;
    [(NUNIClassicRenderer *)self bindAssetArt:5 renderEncoder:v8 toSlot:0];
    [(NUNIClassicRenderer *)self bindAssetArt:6 renderEncoder:v8 toSlot:1];
    long long v104 = v79;
    simd_float4 v92 = v75.columns[0];
    simd_float4 v93 = v75.columns[1];
    simd_float4 v94 = v75.columns[2];
    simd_float4 v95 = v75.columns[3];
    simd_float4 v80 = v75.columns[0];
    simd_float4 v81 = v75.columns[1];
    simd_float4 v82 = v75.columns[2];
    simd_float4 v83 = v75.columns[3];
    long long v58 = *(_OWORD *)&a4[4].collectionType;
    long long v96 = *(_OWORD *)&v44->viewport.width;
    long long v97 = v58;
    long long v59 = *(_OWORD *)&a4[5].viewport.width;
    long long v98 = *(_OWORD *)&a4[4].octGeomRange.start;
    long long v99 = v59;
    long long v84 = v96;
    long long v85 = v58;
    long long v86 = v98;
    long long v87 = v59;
    simd_float4 v89 = v73;
    [v9 colorize];
    long long v88 = v60;
    [v9 opacity];
    float v61 = fminf(fmaxf((float)((float)a4->viewport.width + -42.0) / 326.0, 0.0), 1.0);
    LODWORD(v90) = v62;
    *((float *)&v90 + 1) = (float)((float)(v61 * 0.08) + (float)((float)(1.0 - v61) * 0.3)) + 0.17365;
    *(double *)&long long v63 = UMMul(*(simd_float4x4 *)&a4[5].collectionType, v75);
    long long v100 = v63;
    long long v101 = v64;
    long long v102 = v65;
    long long v103 = v66;
    [v8 setVertexBytes:&v92 length:208 atIndex:1];
    v56 = v8;
    uint64_t v57 = 176;
    goto LABEL_16;
  }
  if (!v11)
  {
    uint64_t v106 = 0;
    uint64_t v105 = 0;
    simd_float4 v82 = 0uLL;
    simd_float4 v72 = v45;
    [(NUNIClassicRenderer *)self bindAssetArt:3 renderEncoder:v8 toSlot:0];
    [(NUNIClassicRenderer *)self bindAssetArt:4 renderEncoder:v8 toSlot:1];
    long long v104 = v79;
    simd_float4 v92 = v75.columns[0];
    simd_float4 v93 = v75.columns[1];
    simd_float4 v94 = v75.columns[2];
    simd_float4 v95 = v75.columns[3];
    long long v46 = *(_OWORD *)&a4[4].collectionType;
    long long v96 = *(_OWORD *)&v44->viewport.width;
    long long v97 = v46;
    long long v47 = *(_OWORD *)&a4[5].viewport.width;
    long long v98 = *(_OWORD *)&a4[4].octGeomRange.start;
    long long v99 = v47;
    float v48 = -(float)(v13
                 - (float)((float)((float)((float)(a4->yearsSince1970 * 32.0) - floorf(a4->yearsSince1970 * 32.0))
                                 * -3.1416)
                         * 2.0));
    *(float *)&uint64_t v105 = (float)(v48 + (float)(floorf(v48 / 6.2832) * -6.2832)) / 6.2832;
    simd_float4 v81 = v72;
    [v9 colorize];
    simd_float4 v80 = v49;
    [v9 opacity];
    float v50 = fminf(fmaxf((float)((float)a4->viewport.width + -42.0) / 326.0, 0.0), 1.0);
    v82.i32[0] = v51;
    v82.f32[1] = (float)((float)(v50 * 0.08) + (float)((float)(1.0 - v50) * 0.3)) + 0.17365;
    *(double *)&long long v52 = UMMul(*(simd_float4x4 *)&a4[5].collectionType, v75);
    long long v100 = v52;
    long long v101 = v53;
    long long v102 = v54;
    long long v103 = v55;
    [v8 setVertexBytes:&v92 length:224 atIndex:1];
    v56 = v8;
    uint64_t v57 = 48;
LABEL_16:
    [v56 setFragmentBytes:&v80 length:v57 atIndex:0];
  }
  objc_msgSend(v8, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", 3, a4->octGeomRange.count, 0, self->_resources.indexBuffer, 2 * a4->octGeomRange.start, *(double *)v45.i64);
  [v8 setCullMode:0];
}

- (void)drawSpriteWithEncoder:(id)a3 state:(const NUNIClassicRendererState *)a4 spheroid:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v53[4] = s_sprites_0[13 * a4->collectionType + [v8 spriteType]];
  [v8 opacity];
  int v52 = v10;
  [v8 position];
  float32x4_t v48 = v11;
  if ([v8 isFacing] && !a4->projectionType)
  {
    _Q0 = vsubq_f32(*(float32x4_t *)&a4[1].viewport.width, v48);
    _Q1 = vmulq_f32(_Q0, _Q0);
    _S2 = _Q0.i32[2];
    __asm { FMLA            S1, S2, V0.S[2] }
    _Q1.f32[0] = sqrtf(_Q1.f32[0]);
    int32x4_t v25 = (int32x4_t)vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
    float32x4_t v26 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v25, v25), (int8x16_t)v25, 0xCuLL);
    float32x4_t v27 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v25, (int8x16_t)v25, 0xCuLL), (int8x16_t)v25, 8uLL);
    int32x4_t v28 = (int32x4_t)vmlaq_f32(vmulq_f32(v27, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(*(int32x4_t *)&a4[1].octGeomRange.start, *(int32x4_t *)&a4[1].octGeomRange.start), *(int8x16_t *)&a4[1].octGeomRange.start, 0xCuLL))), v26, (float32x4_t)vextq_s8(vextq_s8(*(int8x16_t *)&a4[1].octGeomRange.start, *(int8x16_t *)&a4[1].octGeomRange.start, 0xCuLL), *(int8x16_t *)&a4[1].octGeomRange.start, 8uLL));
    float32x4_t v29 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v28, v28), (int8x16_t)v28, 0xCuLL);
    float32x4_t v30 = vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v28, (int8x16_t)v28, 0xCuLL), (int8x16_t)v28, 8uLL), vnegq_f32(v26));
    v28.i32[3] = 0;
    float32x4_t v31 = vmlaq_f32(v30, v29, v27);
    v25.i32[3] = 0;
    simd_float4 v50 = (simd_float4)v28;
    simd_float4 v51 = (simd_float4)v25;
    __asm { FMOV            V0.4S, #1.0 }
    _Q0.i64[0] = v48.i64[0];
    _Q0.i32[2] = v48.i32[2];
    simd_float4 v49 = _Q0;
    objc_msgSend(v8, "radius", v31.i64[0], v31.u32[2]);
  }
  else
  {
    *(double *)v12.i64 = UMFloat4x4MakeTranslate();
    simd_float4 v50 = v12;
    simd_float4 v51 = v13;
    simd_float4 v49 = v14;
    objc_msgSend(v8, "radius", v15, v16);
  }
  float v33 = v17;
  [v8 radiusScale];
  UMFloat4x4MakeScale(v33 * v34);
  v55.columns[0] = v35;
  v55.columns[1] = v36;
  v55.columns[2] = v37;
  v55.columns[3] = v38;
  v54.columns[0] = v50;
  v54.columns[2] = v51;
  v54.columns[1] = v47;
  v54.columns[3] = v49;
  *(double *)v39.i64 = UMMul(v54, v55);
  v56.columns[0] = v39;
  v56.columns[1] = v40;
  v56.columns[2] = v41;
  v56.columns[3] = v42;
  *(double *)&long long v43 = UMMul(*(simd_float4x4 *)&a4[5].collectionType, v56);
  v53[0] = v43;
  v53[1] = v44;
  v53[2] = v45;
  v53[3] = v46;
  [v9 setVertexBytes:v53 length:80 atIndex:1];
  [v9 setFragmentBytes:&v52 length:4 atIndex:0];
  [v9 drawIndexedPrimitives:4 indexCount:a4->quadGeomRange.count indexType:0 indexBuffer:self->_resources.indexBuffer indexBufferOffset:2 * a4->quadGeomRange.start];
}

- (void)renderWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5 passDescriptor:(id)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v9 = a3;
  int v10 = [a5 renderCommandEncoderWithDescriptor:a6];
  kdebug_trace();
  simd_float4 v39 = self;
  memcpy(__dst, &self->_state, sizeof(__dst));
  memset(v50, 0, sizeof(v50));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  simd_float4 v40 = v9;
  float32x4_t v11 = [v9 spheroids];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    int v14 = 0;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v11);
        }
        float v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        objc_msgSend(v17, "radiusScale", v39);
        if (v18 > 0.00001)
        {
          [v17 opacity];
          if (v19 > 0.00001)
          {
            int v20 = [v17 type];
            if (v20 == 10)
            {
              _S0 = 1258291200;
            }
            else if (v20 == 13)
            {
              _S0 = 1258291198;
            }
            else
            {
              _S0 = 1258291196;
              if (((1 << v20) & 0xFFC000) == 0)
              {
                _S0 = 1258291194;
                if (v20 != 12)
                {
                  float32x4_t v41 = (float32x4_t)__dst[3];
                  [v17 position];
                  _S2 = vsubq_f32(v41, v22).i32[2];
                  __asm { FMLA            S0, S2, V1.S[2] }
                }
              }
            }
            int32x4_t v28 = (int *)&__base[8 * v14];
            *int32x4_t v28 = _S0;
            v28[1] = v14;
            objc_storeStrong((id *)v50 + v14++, v17);
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v13);
  }
  else
  {
    int v14 = 0;
  }

  qsort(__base, v14, 8uLL, (int (__cdecl *)(const void *, const void *))_NUNIClassicRenderCompareObject);
  float32x4_t v29 = v39;
  p_resources = &v39->_resources;
  [v10 setVertexBuffer:v39->_resources.vertexBuffer offset:0 atIndex:0];
  if (v14 >= 1)
  {
    float32x4_t v31 = &v49;
    uint64_t v32 = 4;
    for (uint64_t j = v14; j; --j)
    {
      uint64_t v34 = *v31;
      v31 += 2;
      id v35 = *((id *)v50 + v34);
      if ([v35 isVisible])
      {
        uint64_t v36 = [v35 programType];
        if (v32 == v36)
        {
          if (v32 != 1) {
            goto LABEL_29;
          }
        }
        else
        {
          uint64_t v37 = v36;
          [v10 setRenderPipelineState:p_resources->pipelines[v36]];
          uint64_t v32 = v37;
          if (v37 != 1)
          {
LABEL_29:
            -[NUNIClassicRenderer draw3DWithEncoder:state:spheroid:](v29, "draw3DWithEncoder:state:spheroid:", v10, __dst, v35, v39);
            goto LABEL_30;
          }
          [(NUNIClassicRenderer *)v29 bindAssetArt:0 renderEncoder:v10 toSlot:0];
        }
        -[NUNIClassicRenderer drawSpriteWithEncoder:state:spheroid:](v29, "drawSpriteWithEncoder:state:spheroid:", v10, __dst, v35, v39);
        uint64_t v32 = 1;
      }
LABEL_30:
    }
  }
  kdebug_trace();
  [v10 endEncoding];
  for (uint64_t k = 184; k != -8; k -= 8)
}

- (void)renderOffscreenWithScene:(id)a3 viewport:(NUNIViewport)a4 commandBuffer:(id)a5
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v33 = a5;
  kdebug_trace();
  [(NUNIClassicRenderer *)self _updateStateWithScene:v8 viewport:a4];
  memcpy(__dst, &self->_state, sizeof(__dst));
  memset(v44, 0, sizeof(v44));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v34 = v8;
  id v9 = [v8 spheroids];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v10)
  {
    int v12 = 0;
    goto LABEL_21;
  }
  uint64_t v11 = v10;
  int v12 = 0;
  uint64_t v13 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(v9);
      }
      uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      objc_msgSend(v15, "radiusScale", v33);
      if (v16 > 0.00001)
      {
        [v15 opacity];
        if (v17 > 0.00001)
        {
          int v18 = [v15 type];
          if (v18 == 10)
          {
            int v19 = 1266679808;
LABEL_12:
            _S0 = v19;
          }
          else
          {
            if (v18 == 13)
            {
              int v19 = 1266679807;
              goto LABEL_12;
            }
            _S0 = 1266679806;
            if (((1 << v18) & 0xFFC000) == 0)
            {
              _S0 = 1266679805;
              if (v18 != 12)
              {
                float32x4_t v35 = (float32x4_t)__dst[3];
                [v15 position];
                _S2 = vsubq_f32(v35, v21).i32[2];
                __asm { FMLA            S0, S2, V1.S[2] }
              }
            }
          }
          float32x4_t v27 = (int *)&__base[8 * v12];
          *float32x4_t v27 = _S0;
          v27[1] = v12;
          objc_storeStrong((id *)v44 + v12++, v15);
          continue;
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  }
  while (v11);
LABEL_21:

  qsort(__base, v12, 8uLL, (int (__cdecl *)(const void *, const void *))_NUNIClassicRenderCompareObject);
  if (v12 >= 1)
  {
    uint64_t v28 = v12;
    float32x4_t v29 = &v43;
    do
    {
      uint64_t v30 = *v29;
      v29 += 2;
      id v31 = *((id *)v44 + v30);
      if ([v31 isVisible] && objc_msgSend(v31, "programType") != 1) {
        [(NUNIClassicRenderer *)self drawOffscreen3DWithCommandBuffer:v33 state:__dst spheroid:v31];
      }

      --v28;
    }
    while (v28);
  }
  kdebug_trace();
  for (uint64_t j = 184; j != -8; j -= 8)
}

- (void)_updateStateWithScene:(id)a3 viewport:(NUNIViewport)a4
{
  int width = a4.width;
  int height = a4.height;
  id v7 = a3;
  [v7 yearsSince1970];
  float v9 = v8;
  [v7 cameraPosition];
  float32x4_t v123 = v10;
  [v7 cameraTarget];
  float32x4_t v122 = v11;
  unint64_t v12 = [v7 projectionType];
  NUNIClassicGeometryRange octahedronGeomRange = self->_octahedronGeomRange;
  NUNIClassicGeometryRange quadGeomRange = self->_quadGeomRange;
  unint64_t v15 = [v7 collectionType];
  [v7 cameraRoll];
  float v17 = v16;
  _Q0 = vsubq_f32(v122, v123);
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  float32x4_t v124 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
  [v7 cameraUp];
  int8x16_t v120 = v25;

  int32x4_t v26 = (int32x4_t)v124;
  float32x4_t v27 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v26, (int8x16_t)v26, 0xCuLL), (int8x16_t)v26, 8uLL);
  _Q4 = (int32x4_t)v120;
  _Q3 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q4, _Q4), v120, 0xCuLL);
  float32x4_t v29 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v26, v26), (int8x16_t)v26, 0xCuLL);
  _Q2 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)_Q4, (int8x16_t)_Q4, 0xCuLL), v120, 8uLL), vnegq_f32(v29)), _Q3, v27);
  _Q3.i32[0] = _Q2.i32[2];
  __asm { FMLA            S4, S3, V2.S[2] }
  _Q3.f32[0] = sqrtf(*(float *)_Q4.i32);
  if (_Q3.f32[0] < 0.00001)
  {
    _Q2 = vmlaq_f32(vmulq_f32(v29, (float32x4_t)xmmword_21E8F22D0), (float32x4_t)xmmword_21E8F1C00, v27);
    _Q3.i64[0] = _Q2.u32[2];
    __asm { FMLA            S4, S3, V2.S[2] }
    _Q3.f32[0] = sqrtf(_S4);
    if (_Q3.f32[0] < 0.00001)
    {
      _Q2 = vmlaq_f32(vmulq_f32(v29, (float32x4_t)xmmword_21E8F22E0), (float32x4_t)xmmword_21E8F22F0, v27);
      _Q3.i64[0] = _Q2.u32[2];
      __asm { FMLA            S4, S3, V2.S[2] }
      _Q3.f32[0] = sqrtf(_S4);
    }
  }
  int32x4_t v34 = (int32x4_t)vdivq_f32(_Q2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q3.f32, 0));
  _Q0 = vmlaq_f32(vmulq_f32(v27, vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v34, v34), (int8x16_t)v34, 0xCuLL))), v29, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v34, (int8x16_t)v34, 0xCuLL), (int8x16_t)v34, 8uLL));
  _Q1 = vmulq_f32(_Q0, _Q0);
  _S2 = _Q0.i32[2];
  __asm { FMLA            S1, S2, V0.S[2] }
  _Q1.f32[0] = sqrtf(_Q1.f32[0]);
  float32x4_t v119 = vnegq_f32(vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0)));
  int32x4_t v121 = v34;
  if (v12)
  {
    __asm { FMOV            V3.2S, #1.0 }
    LODWORD(v39) = _D3;
    if (_NF ^ _VF | _ZF)
    {
      *((float *)&v39 + 1) = (float)height / (float)width;
      uint64_t v40 = v39;
    }
    else
    {
      *(float *)&_D3 = (float)width / (float)height;
      uint64_t v40 = _D3;
    }
    v41.f32[0] = UMFloat4x4MakeOrtho(-*(float *)&v40, *(float *)&v40, -*((float *)&v40 + 1), *((float *)&v40 + 1), -0.001, 5.0);
    simd_float4 v115 = v42;
    simd_float4 v117 = v41;
    simd_float4 v111 = v44;
    simd_float4 v113 = v43;
    *(__n64 *)v45.f32 = UMFloat4x4MakeLookAt(*(double *)v121.i64, v119.f32[0]);
    simd_float4 v107 = v46;
    simd_float4 v109 = v45;
    simd_float4 v101 = v48;
    simd_float4 v105 = v47;
    *(double *)v49.i64 = UMFloat4x4MakeTranslate();
    v128.columns[0] = v49;
    v128.columns[1] = v50;
    v128.columns[2] = v51;
    v128.columns[3] = v52;
    v125.columns[1] = v107;
    v125.columns[0] = v109;
    v125.columns[3] = v101;
    v125.columns[2] = v105;
    *(double *)v53.i64 = UMMul(v125, v128);
    v129.columns[0] = v53;
    simd_float4 v108 = v54;
    simd_float4 v110 = v53;
    v129.columns[1] = v54;
    v129.columns[2] = v55;
    simd_float4 v102 = v56;
    simd_float4 v106 = v55;
    v129.columns[3] = v56;
    v126.columns[1] = v115;
    v126.columns[0] = v117;
    v126.columns[3] = v111;
    v126.columns[2] = v113;
    *(double *)&long long v57 = UMMul(v126, v129);
    simd_float4 v62 = v102;
    simd_float4 v61 = v106;
    simd_float4 v64 = v108;
    simd_float4 v63 = v110;
    simd_float4 v66 = v111;
    simd_float4 v65 = v113;
    simd_float4 v68 = v115;
    simd_float4 v67 = v117;
    float32x4_t v70 = v119;
    int32x4_t v69 = v121;
    float32x4_t v71 = v123;
    float32x4_t v72 = v124;
    float32x4_t v73 = v122;
  }
  else
  {
    float v74 = (float)width / (float)height;
    float v75 = 20.0;
    if (v74 < 1.0)
    {
      float v76 = atanf(0.17633 / v74);
      float v75 = (v76 + v76) * 180.0 / 3.14159274;
    }
    v77.f32[0] = UMFloat4x4MakePerspective(v75, (float)width / (float)height, 0.001, 5.0);
    simd_float4 v116 = v78;
    simd_float4 v118 = v77;
    simd_float4 v112 = v80;
    simd_float4 v114 = v79;
    *(__n64 *)v81.f32 = UMFloat4x4MakeLookAt(*(double *)v121.i64, v119.f32[0]);
    simd_float4 v85 = v81;
    if (fabsf(v17) > 0.00001)
    {
      v103.columns[0] = v81;
      v103.columns[1] = v82;
      v103.columns[2] = v83;
      v103.columns[3] = v84;
      __float2 v86 = __sincosf_stret(v17 * 0.5);
      float32x2_t v87 = vmul_n_f32(*(float32x2_t *)v124.f32, v86.__sinval);
      *(__n64 *)v88.f32 = UMFloat4x4Make(v87.f32[0], v87.f32[1], vmuls_lane_f32(v86.__sinval, v124, 2), v86.__cosval);
      v130.columns[0] = v88;
      v130.columns[1] = v89;
      v130.columns[2] = v90;
      v130.columns[3] = v91;
      *(double *)v92.i64 = UMMul(v103, v130);
      simd_float4 v85 = v92;
    }
    v104.columns[0] = v85;
    v104.columns[1] = v82;
    v104.columns[2] = v83;
    v104.columns[3] = v84;
    *(double *)v93.i64 = UMFloat4x4MakeTranslate();
    v131.columns[0] = v93;
    v131.columns[1] = v94;
    v131.columns[2] = v95;
    v131.columns[3] = v96;
    *(double *)v97.i64 = UMMul(v104, v131);
    v132.columns[0] = v97;
    v104.columns[2] = v98;
    v104.columns[3] = v97;
    v132.columns[1] = v98;
    v132.columns[2] = v99;
    v104.columns[0] = v100;
    v104.columns[1] = v99;
    v132.columns[3] = v100;
    v127.columns[1] = v116;
    v127.columns[0] = v118;
    v127.columns[3] = v112;
    v127.columns[2] = v114;
    *(double *)&long long v57 = UMMul(v127, v132);
    simd_float4 v62 = v104.columns[0];
    simd_float4 v61 = v104.columns[1];
    simd_float4 v64 = v104.columns[2];
    simd_float4 v63 = v104.columns[3];
    simd_float4 v66 = v112;
    simd_float4 v65 = v114;
    simd_float4 v68 = v116;
    simd_float4 v67 = v118;
    float32x4_t v71 = v123;
    float32x4_t v72 = v124;
    int32x4_t v69 = v121;
    float32x4_t v73 = v122;
    float32x4_t v70 = v119;
  }
  self->_state.viewport.int width = width;
  self->_state.viewport.int height = height;
  self->_state.unint64_t projectionType = v12;
  self->_state.collectionType = v15;
  self->_state.yearsSince1970 = v9;
  self->_state.cameraRoll = v17;
  self->_state.octGeomRange = octahedronGeomRange;
  self->_state.NUNIClassicGeometryRange quadGeomRange = quadGeomRange;
  *(float32x4_t *)self->_anon_a0 = v71;
  *(float32x4_t *)&self->_anon_a0[16] = v73;
  *(float32x4_t *)&self->_anon_a0[32] = v70;
  *(int32x4_t *)&self->_anon_a0[48] = v69;
  *(float32x4_t *)&self->_anon_a0[64] = v72;
  *(simd_float4 *)&self->_anon_a0[80] = v67;
  *(simd_float4 *)&self->_anon_a0[96] = v68;
  *(simd_float4 *)&self->_anon_a0[112] = v65;
  *(simd_float4 *)&self->_anon_a0[128] = v66;
  *(simd_float4 *)&self->_anon_a0[144] = v63;
  *(simd_float4 *)&self->_anon_a0[160] = v64;
  *(simd_float4 *)&self->_anon_a0[176] = v61;
  *(simd_float4 *)&self->_anon_a0[192] = v62;
  *(_OWORD *)&self->_anon_a0[208] = v57;
  *(_OWORD *)&self->_anon_a0[224] = v58;
  *(_OWORD *)&self->_anon_a0[240] = v59;
  *(_OWORD *)&self->_anon_a0[256] = v60;
}

- (void)_createPipelineForProgramType:(unint64_t)a3 fromLibrary:(id)a4
{
  id v21 = a4;
  unint64_t v20 = [(NUNIRenderer *)self pixelFormat];
  if (a3 >= 3) {
    -[NUNIClassicRenderer _createPipelineForProgramType:fromLibrary:]();
  }
  uint64_t v6 = off_2644CDF88[a3];
  id v7 = off_2644CDFA0[a3];
  float v8 = (void *)MEMORY[0x263F32140];
  float v9 = NUNIBundle();
  float32x4_t v10 = [v8 archiveWithName:@"NUNIClassicShaders" bundle:v9 device:self->_mtlDevice];

  float32x4_t v11 = [MEMORY[0x263F128B8] functionDescriptor];
  [v11 setName:v7];
  unint64_t v12 = (void *)[v10 newFunctionInLibrary:v21 withDescriptor:v11];
  [v11 setName:v6];
  uint64_t v13 = (void *)[v10 newFunctionInLibrary:v21 withDescriptor:v11];
  id v14 = objc_alloc_init(MEMORY[0x263F129C0]);
  [v14 setLabel:_NUNIClassicPipelineNames[a3]];
  [v14 setVertexFunction:v12];
  [v14 setFragmentFunction:v13];
  unint64_t v15 = [v14 colorAttachments];
  float v16 = [v15 objectAtIndexedSubscript:0];

  [v16 setPixelFormat:v20];
  [v16 setBlendingEnabled:1];
  [v16 setRgbBlendOperation:0];
  [v16 setAlphaBlendOperation:0];
  [v16 setSourceRGBBlendFactor:1];
  [v16 setSourceAlphaBlendFactor:1];
  [v16 setDestinationRGBBlendFactor:5];
  [v16 setDestinationAlphaBlendFactor:5];
  uint64_t v17 = [v10 newRenderPipelineStateForDevice:self->_mtlDevice withDescriptor:v14];
  p_resources = &self->_resources;
  int v19 = p_resources->pipelines[a3];
  p_resources->pipelines[a3] = (MTLRenderPipelineState *)v17;

  if (!p_resources->pipelines[a3]) {
    -[NUNIClassicRenderer _createPipelineForProgramType:fromLibrary:]();
  }
}

- (void)_initPrograms
{
  NUNIBundle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (void *)[(MTLDevice *)self->_mtlDevice newDefaultLibraryWithBundle:v4 error:0];
  [(NUNIClassicRenderer *)self _createPipelineForProgramType:0 fromLibrary:v3];
  [(NUNIClassicRenderer *)self _createPipelineForProgramType:1 fromLibrary:v3];
  [(NUNIClassicRenderer *)self _createPipelineForProgramType:2 fromLibrary:v3];
}

- (NUNIClassicTextureGroup)textureGroup
{
  return self->_textureGroup;
}

- (MTLDevice)mtlDevice
{
  return self->_mtlDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlDevice, 0);
  objc_storeStrong((id *)&self->_textureGroup, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  __destructor_8_AB0s8n4_s0_AE_s32_s40((uint64_t)&self->_resources);
}

- (void)draw3DWithEncoder:state:spheroid:.cold.1()
{
  __assert_rtn("-[NUNIClassicRenderer draw3DWithEncoder:state:spheroid:]", "NUNIClassicRenderer.m", 414, "ptype != NUNIProgramTypeSprite");
}

- (void)_createPipelineForProgramType:fromLibrary:.cold.1()
{
  __assert_rtn("-[NUNIClassicRenderer _createPipelineForProgramType:fromLibrary:]", "NUNIClassicRenderer.m", 821, "_resources.pipelines[programType] != nil");
}

- (void)_createPipelineForProgramType:fromLibrary:.cold.2()
{
}

@end