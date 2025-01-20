@interface PKTexturedCardRenderer
- (PKTexturedCardRenderer)init;
- (__n128)setRotation:(__n128 *)result;
- (double)rotation;
- (id)_initWithStyle:(void *)a3 renderLoop:(void *)a4 diffuseLoader:(void *)a5 metalnessLoader:(void *)a6 normalLoader:;
- (id)initWithStyle:(void *)a3 renderLoop:(uint64_t)a4 diffuse:(double)a5 insets:(double)a6;
- (id)initWithStyle:(void *)a3 renderLoop:(uint64_t)a4 diffuse:(uint64_t)a5 metalness:(uint64_t)a6 normal:;
- (uint64_t)setLightIntensity:(uint64_t)result;
- (unint64_t)updateRenderPassDescriptorWithDrawable:(void *)a1;
- (void)dealloc;
- (void)invalidate;
- (void)renderAtTime:(uint64_t)a1;
@end

@implementation PKTexturedCardRenderer

- (__n128)setRotation:(__n128 *)result
{
  if (result) {
    result[11] = a2;
  }
  return result;
}

- (unint64_t)updateRenderPassDescriptorWithDrawable:(void *)a1
{
  unint64_t v2 = (unint64_t)a1;
  if (a1)
  {
    v3 = [a2 texture];
    uint64_t v4 = [v3 width];
    uint64_t v5 = [v3 height];
    if (*(void *)(v2 + 48) != v4 || *(void *)(v2 + 56) != v5)
    {
      *(void *)(v2 + 48) = v4;
      *(void *)(v2 + 56) = v5;
      v6 = *(void **)(v2 + 64);
      *(void *)(v2 + 64) = 0;

      uint64_t v4 = *(void *)(v2 + 48);
    }
    if (v4 && *(void *)(v2 + 56))
    {
      v7 = *(void **)(v2 + 64);
      v8 = v7;
      if (!v7)
      {
        id v9 = objc_alloc_init(MEMORY[0x263F129A0]);
        v10 = *(void **)(v2 + 64);
        *(void *)(v2 + 64) = v9;

        v8 = *(void **)(v2 + 64);
      }
      v11 = [v8 colorAttachments];
      v12 = [v11 objectAtIndexedSubscript:0];
      v13 = v12;
      if (!v7)
      {
        [v12 setLoadAction:0];
        [v13 setStoreAction:1];
      }
      [v13 setTexture:v3];
      unint64_t v2 = *(void *)(v2 + 64) != 0;
    }
    else
    {
      unint64_t v2 = 0;
    }
  }
  return v2;
}

- (double)rotation
{
  if (a1) {
    long long v1 = *(_OWORD *)(a1 + 176);
  }
  else {
    *(void *)&long long v1 = 0;
  }
  return *(double *)&v1;
}

- (void)renderAtTime:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (a1 && !*(unsigned char *)(a1 + 8))
  {
    if (![*(id *)(a1 + 24) isDrawableAvailable])
    {
      unint64_t v2 = 0;
LABEL_41:

      return;
    }
    unint64_t v2 = [*(id *)(a1 + 24) currentDrawable];
    if (!v2 || !-[PKTexturedCardRenderer updateRenderPassDescriptorWithDrawable:]((void *)a1, v2)) {
      goto LABEL_41;
    }
    v3 = [*(id *)(a1 + 24) device];
    uint64_t v4 = v3;
    if (!*(void *)(a1 + 96))
    {
      uint64_t v5 = [v3 newBufferWithBytes:&renderAtTime__vertices length:64 options:32];
      v6 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v5;

      if (!*(void *)(a1 + 96)) {
        goto LABEL_40;
      }
    }
    if (!*(void *)(a1 + 104))
    {
      unint64_t v24 = *(void *)(a1 + 16);
      if (v24 > 4
        || (uint64_t v25 = [v4 newBufferWithLength:qword_21EEE7C30[v24] options:0],
            v26 = *(void **)(a1 + 104),
            *(void *)(a1 + 104) = v25,
            v26,
            !*(void *)(a1 + 104)))
      {
LABEL_40:

        goto LABEL_41;
      }
    }
    v7 = [*(id *)(a1 + 32) commandBuffer];
    v8 = v7;
    if (*(void *)(a1 + 72) || *(void *)(a1 + 80) || *(void *)(a1 + 88))
    {
      id v9 = [v7 blitCommandEncoder];
      v10 = *(void **)(a1 + 72);
      if (v10)
      {
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __39__PKTexturedCardRenderer_renderAtTime___block_invoke;
        v46[3] = &unk_2644F8F48;
        v46[4] = a1;
        id v47 = v4;
        id v48 = v9;
        [v10 tiling:1 read:v46];
        v11 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = 0;
      }
      v12 = *(void **)(a1 + 80);
      if (v12)
      {
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __39__PKTexturedCardRenderer_renderAtTime___block_invoke_69;
        v43[3] = &unk_2644F8F48;
        v43[4] = a1;
        id v44 = v4;
        id v45 = v9;
        [v12 tiling:1 read:v43];
        v13 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = 0;
      }
      v14 = *(void **)(a1 + 88);
      if (v14)
      {
        v40[0] = MEMORY[0x263EF8330];
        v40[1] = 3221225472;
        v40[2] = __39__PKTexturedCardRenderer_renderAtTime___block_invoke_70;
        v40[3] = &unk_2644F8F48;
        v40[4] = a1;
        id v41 = v4;
        id v42 = v9;
        [v14 tiling:1 read:v40];
        v15 = *(void **)(a1 + 88);
        *(void *)(a1 + 88) = 0;
      }
      [v9 endEncoding];
    }
    unint64_t v16 = *(void *)(a1 + 16);
    if (v16 < 5)
    {
      v17 = *(void **)(a1 + 112);
      if (!v17) {
        goto LABEL_43;
      }
      if (v16 < 3)
      {
        if (*(void *)(a1 + 152) && *(void *)(a1 + 160))
        {
          if (v16 != 1)
          {
            *(double *)&long long v18 = simd_matrix4x4(*(float32x4_t *)(a1 + 176));
            *(_OWORD *)__src = v18;
            *(_OWORD *)&__src[16] = v19;
            long long v50 = v20;
            long long v51 = v21;
            v22 = (void *)[*(id *)(a1 + 104) contents];
            if ((unint64_t)[*(id *)(a1 + 104) length] > 0x3F)
            {
              size_t v23 = 64;
LABEL_38:
              memcpy(v22, __src, v23);
              v38 = [v8 renderCommandEncoderWithDescriptor:*(void *)(a1 + 64)];
              [v38 setRenderPipelineState:*(void *)(a1 + 40)];
              [v38 setVertexBuffer:*(void *)(a1 + 96) offset:0 atIndex:0];
              [v38 setFragmentBuffer:*(void *)(a1 + 104) offset:0 atIndex:0];
              [v38 setFragmentTexture:*(void *)(a1 + 112) atIndex:0];
              [v38 setFragmentTexture:*(void *)(a1 + 152) atIndex:1];
              [v38 setFragmentTexture:*(void *)(a1 + 160) atIndex:2];
              [v38 drawPrimitives:4 vertexStart:0 vertexCount:4];
              [v38 endEncoding];

              [v8 presentDrawable:v2];
              [v8 commit];
LABEL_39:

              goto LABEL_40;
            }
LABEL_36:
            size_t v23 = [*(id *)(a1 + 104) length];
            goto LABEL_38;
          }
          float32x4_t v52 = 0uLL;
          *(double *)&long long v34 = simd_matrix4x4(*(float32x4_t *)(a1 + 176));
          *(_OWORD *)__src = v34;
          *(_OWORD *)&__src[16] = v35;
          long long v50 = v36;
          long long v51 = v37;
          v52.i32[0] = *(_DWORD *)(a1 + 168);
LABEL_35:
          v22 = (void *)[*(id *)(a1 + 104) contents];
          if ((unint64_t)[*(id *)(a1 + 104) length] > 0x4F)
          {
            size_t v23 = 80;
            goto LABEL_38;
          }
          goto LABEL_36;
        }
LABEL_43:
        v39 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__src = 134218240;
          *(void *)&__src[4] = a1;
          *(_WORD *)&__src[12] = 2048;
          *(void *)&__src[14] = v16;
          _os_log_impl(&dword_21EEBD000, v39, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): required textures missing - invalidating.", __src, 0x16u);
        }

        -[PKTexturedCardRenderer invalidate](a1);
        goto LABEL_39;
      }
      if (v16 - 3 < 2)
      {
        uint64_t v27 = [v17 width];
        uint64_t v28 = [*(id *)(a1 + 112) height];
        *(double *)v29.i64 = simd_matrix4x4(*(float32x4_t *)(a1 + 176));
        *(uint64x2_t *)__src = v29;
        *(_OWORD *)&__src[16] = v30;
        long long v50 = v31;
        long long v51 = v32;
        v29.i64[0] = v28;
        v29.i64[1] = v27;
        float64x2_t v33 = vcvtq_f64_u64(v29);
        float32x4_t v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(*(float64x2_t *)(a1 + 120), v33)), vdivq_f64(*(float64x2_t *)(a1 + 136), v33));
        goto LABEL_35;
      }
    }
    __break(1u);
  }
}

void __39__PKTexturedCardRenderer_renderAtTime___block_invoke_70(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 160);
  *(void *)(v4 + 160) = DefaultPrivate2DTexture;

  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 160))
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(v6 + 16);
      int v9 = 134218240;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      _os_log_impl(&dword_21EEBD000, v7, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load normal texture.", (uint8_t *)&v9, 0x16u);
    }
  }
}

void __39__PKTexturedCardRenderer_renderAtTime___block_invoke_69(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 152);
  *(void *)(v4 + 152) = DefaultPrivate2DTexture;

  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 152))
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(v6 + 16);
      int v9 = 134218240;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      _os_log_impl(&dword_21EEBD000, v7, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load metalness texture.", (uint8_t *)&v9, 0x16u);
    }
  }
}

void __39__PKTexturedCardRenderer_renderAtTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 112);
  *(void *)(v4 + 112) = DefaultPrivate2DTexture;

  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 112))
  {
    v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(v6 + 16);
      int v9 = 134218240;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      _os_log_impl(&dword_21EEBD000, v7, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load diffuse texture.", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (id)initWithStyle:(void *)a3 renderLoop:(uint64_t)a4 diffuse:(uint64_t)a5 metalness:(uint64_t)a6 normal:
{
  result = a3;
  uint64_t v12 = result;
  if (!a1)
  {
    uint64_t v13 = 0;
LABEL_8:

    return v13;
  }
  if (a2 <= 2)
  {
    uint64_t v13 = 0;
    if (result && a4 && a5)
    {
      if (a6)
      {
        v14 = [result device];
        id v15 = [[PKTextureLoadDescriptor alloc] initForDevice:v14];
        unint64_t v16 = (void *)[v15 createLoaderForCGImage:a4];
        v17 = (void *)[v15 createLoaderForCGImage:a5];
        long long v18 = (void *)[v15 createLoaderForCGImage:a6];
        a1 = -[PKTexturedCardRenderer _initWithStyle:renderLoop:diffuseLoader:metalnessLoader:normalLoader:](a1, a2, v12, v16, v17, v18);

        uint64_t v13 = a1;
      }
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

- (id)_initWithStyle:(void *)a3 renderLoop:(void *)a4 diffuseLoader:(void *)a5 metalnessLoader:(void *)a6 normalLoader:
{
  uint64_t v10 = a3;
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v55 = v16;
  if (!a1)
  {
    id v41 = 0;
    goto LABEL_33;
  }
  if (!v13 || a2 >= 5 || !v14) {
    goto LABEL_14;
  }
  if (a2 >= 3)
  {
    if (a2 - 3 < 2) {
      goto LABEL_8;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!v15 || !v16) {
    goto LABEL_14;
  }
LABEL_8:
  id obj = a5;
  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (!v6)
  {
LABEL_31:
    id v41 = 0;
    goto LABEL_32;
  }
  v58.receiver = a1;
  v58.super_class = (Class)PKTexturedCardRenderer;
  v17 = (id *)objc_msgSendSuper2(&v58, sel_init);
  a1 = v17;
  if (v17)
  {
    id v47 = a6;
    id v53 = v15;
    v17[2] = (id)a2;
    objc_storeStrong(v17 + 3, v10);
    a5 = [v13 device];
    id v57 = 0;
    uint64_t v18 = [a5 newDefaultLibraryWithBundle:v6 error:&v57];
    id v19 = v57;
    uint64_t v10 = v19;
    long long v51 = (void *)v18;
    if (v18)
    {
      float32x4_t v52 = a5;
      id v48 = v14;
      v49 = v13;

      id v20 = objc_alloc_init(MEMORY[0x263F12A80]);
      long long v21 = [v20 attributes];
      v22 = [v21 objectAtIndexedSubscript:0];
      [v22 setFormat:29];
      [v22 setOffset:0];
      [v22 setBufferIndex:0];
      size_t v23 = [v21 objectAtIndexedSubscript:1];

      [v23 setFormat:29];
      [v23 setOffset:8];
      [v23 setBufferIndex:0];
      unint64_t v24 = [v20 layouts];
      uint64_t v25 = [v24 objectAtIndexedSubscript:0];

      [v25 setStride:16];
      [v25 setStepRate:1];
      [v25 setStepFunction:1];

      id v26 = objc_alloc_init(MEMORY[0x263F129C0]);
      uint64_t v27 = [v6 pathForResource:off_2644F9678[a2] ofType:@"pipelinelib"];
      if (v27) {
        uint64_t v28 = (void *)[v52 newPipelineLibraryWithFilePath:v27 error:0];
      }
      else {
        uint64_t v28 = 0;
      }
      [v26 setPipelineLibrary:v28];

      [v26 setVertexDescriptor:v20];
      uint64_t v10 = v51;
      long long v31 = (void *)[v51 newFunctionWithName:@"texturedCard_vertex"];
      long long v50 = v26;
      [v26 setVertexFunction:v31];

      id v13 = v49;
      uint64_t v32 = [v51 newFunctionWithName:off_2644F96A0[a2]];
      if (v32)
      {
        float64x2_t v33 = v32;
        [v50 setFragmentFunction:v32];
        long long v34 = [v50 colorAttachments];
        long long v35 = [v34 objectAtIndexedSubscript:0];
        objc_msgSend(v35, "setPixelFormat:", objc_msgSend(v49, "pixelFormat"));

        id v56 = 0;
        uint64_t v36 = [v52 newRenderPipelineStateWithDescriptor:v50 error:&v56];
        id v37 = v56;
        id v38 = a1[5];
        a1[5] = (id)v36;

        if (a1[5])
        {

          uint64_t v39 = [v52 newCommandQueue];
          id v40 = a1[4];
          a1[4] = (id)v39;

          objc_storeStrong(a1 + 9, a4);
          objc_storeStrong(a1 + 10, obj);
          objc_storeStrong(a1 + 11, v47);
          *((_OWORD *)a1 + 11) = xmmword_21EEE7810;
          *((_DWORD *)a1 + 42) = 1065353216;

          id v14 = v48;
          goto LABEL_24;
        }
        id v44 = PKLogFacilityTypeGetObject();
        id v14 = v48;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          id v45 = a1[2];
          *(_DWORD *)buf = 134218498;
          v60 = a1;
          __int16 v61 = 2048;
          id v62 = v45;
          __int16 v63 = 2114;
          id v64 = v37;
          _os_log_impl(&dword_21EEBD000, v44, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load pipeline - %{public}@.", buf, 0x20u);
        }

        a5 = v52;
        id v15 = v53;
      }
      else
      {
        float64x2_t v33 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
          -[PKTexturedCardRenderer _initWithStyle:renderLoop:diffuseLoader:metalnessLoader:normalLoader:]((uint64_t)a1, (uint64_t *)a1 + 2, v33);
        }

        id v14 = v48;
        a5 = v52;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          id v42 = a1[2];
          *(_DWORD *)buf = 134218240;
          v60 = a1;
          __int16 v61 = 2048;
          id v62 = v42;
          _os_log_impl(&dword_21EEBD000, v33, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load fragment function.", buf, 0x16u);
        }
      }

      goto LABEL_30;
    }
LABEL_15:
    uint64x2_t v29 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      id v46 = a1[2];
      *(_DWORD *)buf = 134218498;
      v60 = a1;
      __int16 v61 = 2048;
      id v62 = v46;
      __int16 v63 = 2114;
      id v64 = v10;
      _os_log_fault_impl(&dword_21EEBD000, v29, OS_LOG_TYPE_FAULT, "PKTexturedCardRenderer (%p:%ld): could not load metal library - %{public}@.", buf, 0x20u);
    }

    id v15 = v53;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = a1[2];
      *(_DWORD *)buf = 134218498;
      v60 = a1;
      __int16 v61 = 2048;
      id v62 = v30;
      __int16 v63 = 2114;
      id v64 = v10;
      _os_log_impl(&dword_21EEBD000, v29, OS_LOG_TYPE_DEFAULT, "PKTexturedCardRenderer (%p:%ld): could not load metal library - %{public}@.", buf, 0x20u);
    }

LABEL_30:
    goto LABEL_31;
  }
LABEL_24:
  a1 = a1;
  id v41 = a1;
LABEL_32:

LABEL_33:
  return v41;
}

- (PKTexturedCardRenderer)init
{
  return 0;
}

- (id)initWithStyle:(void *)a3 renderLoop:(uint64_t)a4 diffuse:(double)a5 insets:(double)a6
{
  id v15 = a3;
  id v16 = v15;
  if (!a1) {
    goto LABEL_11;
  }
  if (a2 >= 5 || a2 - 3 >= 2)
  {
    __break(1u);
LABEL_11:
    v17 = 0;
    goto LABEL_9;
  }
  v17 = 0;
  if (v15 && a4)
  {
    uint64_t v18 = [v15 device];
    id v19 = [[PKTextureLoadDescriptor alloc] initForDevice:v18];
    id v20 = (void *)[v19 createLoaderForCGImage:a4];
    long long v21 = (double *)-[PKTexturedCardRenderer _initWithStyle:renderLoop:diffuseLoader:metalnessLoader:normalLoader:](a1, a2, v16, v20, 0, 0);
    if (v21)
    {
      v21[15] = a5;
      v21[16] = a6;
      v21[17] = a7;
      v21[18] = a8;
    }
    a1 = v21;

    v17 = a1;
  }
LABEL_9:

  return v17;
}

- (void)dealloc
{
  -[PKTexturedCardRenderer invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PKTexturedCardRenderer;
  [(PKTexturedCardRenderer *)&v3 dealloc];
}

- (void)invalidate
{
  if (a1 && !*(unsigned char *)(a1 + 8))
  {
    *(unsigned char *)(a1 + 8) = 1;
    unint64_t v2 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    objc_super v3 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    uint64_t v4 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    uint64_t v5 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    uint64_t v6 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = 0;

    v7 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0;

    uint64_t v8 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0;

    int v9 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;

    uint64_t v10 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = 0;

    __int16 v11 = *(void **)(a1 + 152);
    *(void *)(a1 + 152) = 0;

    uint64_t v12 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = 0;

    id v13 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;
  }
}

- (uint64_t)setLightIntensity:(uint64_t)result
{
  if (result) {
    *(float *)(result + 168) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normal, 0);
  objc_storeStrong((id *)&self->_metalness, 0);
  objc_storeStrong((id *)&self->_diffuse, 0);
  objc_storeStrong((id *)&self->_uniform, 0);
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_normalLoader, 0);
  objc_storeStrong((id *)&self->_metalnessLoader, 0);
  objc_storeStrong((id *)&self->_diffuseLoader, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_loop, 0);
}

- (void)_initWithStyle:(os_log_t)log renderLoop:diffuseLoader:metalnessLoader:normalLoader:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 134218240;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_fault_impl(&dword_21EEBD000, log, OS_LOG_TYPE_FAULT, "PKTexturedCardRenderer (%p:%ld): could not load fragment function.", (uint8_t *)&v4, 0x16u);
}

@end