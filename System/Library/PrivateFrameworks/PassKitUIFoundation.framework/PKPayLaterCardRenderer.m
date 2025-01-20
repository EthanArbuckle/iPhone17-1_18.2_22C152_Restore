@interface PKPayLaterCardRenderer
- (BOOL)isInvalidated;
- (BOOL)isPresented;
- (PKPayLaterCardRenderer)init;
- (__n128)setGravity:(__n128 *)result;
- (__n128)setRotation:(__n128 *)result;
- (double)rotation;
- (id)_initWithRenderLoop:(void *)a3 overlayLoader:;
- (id)initWithRenderLoop:(uint64_t)a3 overlay:;
- (uint64_t)_addInstances:(uint64_t)result category:(unint64_t)a2 time:(uint64_t)a3;
- (uint64_t)_countOfActiveInstancesAtTime:(uint64_t)a1;
- (uint64_t)_countOfNonExplodingInstances;
- (uint64_t)renderAtTime:(uint64_t)a1;
- (uint64_t)setPresented:(uint64_t)result;
- (unint64_t)_updateRenderPassDescriptorWithDrawable:(void *)a1;
- (void)_removeInstances:(uint64_t)a1 category:(uint64_t)a2 time:(uint64_t)a3;
- (void)_updateUniformsForDevice:(uint64_t)a1;
- (void)dealloc;
- (void)invalidate;
- (void)setMagnitudes:(uint64_t)a1;
@end

@implementation PKPayLaterCardRenderer

- (BOOL)isInvalidated
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

- (PKPayLaterCardRenderer)init
{
  return 0;
}

- (id)_initWithRenderLoop:(void *)a3 overlayLoader:
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  v9 = 0;
  if (a1 && v6 && v7)
  {
    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v10)
    {
      v65.receiver = a1;
      v65.super_class = (Class)PKPayLaterCardRenderer;
      v11 = (id *)objc_msgSendSuper2(&v65, sel_init);
      a1 = v11;
      if (!v11)
      {
LABEL_19:
        a1 = a1;
        v9 = a1;
        goto LABEL_20;
      }
      objc_storeStrong(v11 + 4, a2);
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      id v13 = a1[3];
      a1[3] = v12;

      *((_OWORD *)a1 + 11) = xmmword_21EEE79D0;
      a1[25] = 0;
      a1[26] = 0;
      a1[24] = 0;
      v14 = [v6 device];
      id v64 = 0;
      v15 = (void *)[v14 newDefaultLibraryWithBundle:v10 error:&v64];
      id v16 = v64;
      v17 = v16;
      if (v15)
      {

        uint64_t v18 = [v10 pathForResource:@"PayLater-CardView" ofType:@"pipelinelib"];
        v62 = v14;
        v63 = (void *)v18;
        v61 = v10;
        if (v18) {
          v60 = (void *)[v14 newPipelineLibraryWithFilePath:v18 error:0];
        }
        else {
          v60 = 0;
        }
        id v20 = objc_alloc_init(MEMORY[0x263F12A80]);
        v21 = [v20 attributes];
        v22 = [v21 objectAtIndexedSubscript:0];
        [v22 setFormat:29];
        [v22 setOffset:0];
        [v22 setBufferIndex:0];
        v23 = [v21 objectAtIndexedSubscript:1];

        [v23 setFormat:29];
        [v23 setOffset:8];
        [v23 setBufferIndex:0];
        v24 = [v20 layouts];
        v25 = [v24 objectAtIndexedSubscript:0];

        [v25 setStride:16];
        [v25 setStepRate:1];
        [v25 setStepFunction:1];

        id v26 = objc_alloc_init(MEMORY[0x263F129C0]);
        [v26 setPipelineLibrary:v60];
        [v26 setVertexDescriptor:v20];
        v27 = (void *)[v15 newFunctionWithName:@"payLaterCard_vertex"];
        [v26 setVertexFunction:v27];

        v28 = [v26 colorAttachments];
        v29 = [v28 objectAtIndexedSubscript:0];
        objc_msgSend(v29, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));

        v30 = (void *)[v15 newFunctionWithName:@"payLaterCard_fragment_background"];
        [v26 setFragmentFunction:v30];
        uint64_t v31 = [v62 newRenderPipelineStateWithDescriptor:v26 error:0];
        id v32 = a1[6];
        a1[6] = (id)v31;

        id v33 = objc_alloc_init(MEMORY[0x263F129C0]);
        [v33 setPipelineLibrary:v60];
        v34 = (void *)[v15 newFunctionWithName:@"payLaterCard_instanceVertex"];
        [v33 setVertexFunction:v34];

        v35 = [v33 colorAttachments];
        v36 = [v35 objectAtIndexedSubscript:0];
        objc_msgSend(v36, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
        [v36 setBlendingEnabled:1];
        [v36 setRgbBlendOperation:0];
        [v36 setSourceRGBBlendFactor:4];
        [v36 setDestinationRGBBlendFactor:5];
        [v36 setAlphaBlendOperation:0];
        [v36 setDestinationAlphaBlendFactor:5];

        v37 = (void *)[v15 newFunctionWithName:@"payLaterCard_fragment_instances"];
        [v33 setFragmentFunction:v37];
        uint64_t v38 = [v62 newRenderPipelineStateWithDescriptor:v33 error:0];
        id v39 = a1[8];
        a1[8] = (id)v38;

        id v40 = objc_alloc_init(MEMORY[0x263F129C0]);
        [v40 setPipelineLibrary:v60];
        [v40 setVertexDescriptor:v20];
        v41 = (void *)[v15 newFunctionWithName:@"payLaterCard_vertex"];
        [v40 setVertexFunction:v41];

        v42 = [v40 colorAttachments];
        v43 = [v42 objectAtIndexedSubscript:0];
        objc_msgSend(v43, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
        [v43 setBlendingEnabled:1];
        [v43 setRgbBlendOperation:0];
        [v43 setSourceRGBBlendFactor:4];
        [v43 setDestinationRGBBlendFactor:5];
        [v43 setAlphaBlendOperation:0];
        [v43 setSourceAlphaBlendFactor:1];
        [v43 setDestinationAlphaBlendFactor:1];

        v44 = (void *)[v15 newFunctionWithName:@"payLaterCard_fragment_overlay"];
        [v40 setFragmentFunction:v44];
        uint64_t v45 = [v62 newRenderPipelineStateWithDescriptor:v40 error:0];
        id v46 = a1[7];
        a1[7] = (id)v45;

        uint64_t v47 = [v62 newCommandQueue];
        id v48 = a1[5];
        a1[5] = (id)v47;

        objc_storeStrong(a1 + 12, a3);
        PKPassFrontFaceContentSize();
        uint64_t v49 = 0;
        double v52 = v51 / v50 * 32.0;
        a1[18] = (id)0x4042AAAAAAAAAAABLL;
        *((double *)a1 + 19) = v52 * 1.16666667;
        float v53 = 600.0 / (v52 + v52);
        LODWORD(v54) = 0;
        *((float *)&v54 + 1) = v53;
        *(float *)&double v52 = (v52 - v52) / (v52 + v52);
        LODWORD(v55) = 0;
        DWORD1(v55) = LODWORD(v52);
        *((void *)&v55 + 1) = __PAIR64__(-1.0, -7.0);
        *((_OWORD *)a1 + 10) = xmmword_21EEE79E0;
        v66[0] = xmmword_21EEE79F0;
        v66[1] = v54;
        v66[2] = v55;
        v66[3] = xmmword_21EEE7A00;
        *(_OWORD *)buf = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        do
        {
          *(float32x4_t *)&buf[v49 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_21EEE7800, COERCE_FLOAT(v66[v49])), (float32x4_t)xmmword_21EEE7A10, *(float32x2_t *)&v66[v49], 1), (float32x4_t)xmmword_21EEE7A20, (float32x4_t)v66[v49], 2), (float32x4_t)xmmword_21EEE7A30, (float32x4_t)v66[v49], 3);
          ++v49;
        }
        while (v49 != 4);
        long long v56 = v68;
        long long v57 = v69;
        long long v58 = v70;
        *((_OWORD *)a1 + 18) = *(_OWORD *)buf;
        *((_OWORD *)a1 + 19) = v56;
        *((_OWORD *)a1 + 20) = v57;
        *((_OWORD *)a1 + 21) = v58;
        *((_OWORD *)a1 + 23) = xmmword_21EEE7810;
        *((_OWORD *)a1 + 24) = xmmword_21EEE7810;

        v10 = v61;
        goto LABEL_19;
      }
      v19 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[PKPayLaterCardRenderer _initWithRenderLoop:overlayLoader:]((uint64_t)v17, v19);
      }

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v17;
        _os_log_impl(&dword_21EEBD000, v19, OS_LOG_TYPE_DEFAULT, "PKPayLaterCardRenderer: could not load metal library - %@.", buf, 0xCu);
      }
    }
    v9 = 0;
LABEL_20:
  }
  return v9;
}

- (id)initWithRenderLoop:(uint64_t)a3 overlay:
{
  id v5 = a2;
  id v6 = v5;
  id v7 = 0;
  if (a1 && v5 && a3)
  {
    v8 = [v5 device];
    id v9 = [[PKTextureLoadDescriptor alloc] initForDevice:v8];
    v10 = (void *)[v9 createLoaderForCGImage:a3];
    a1 = -[PKPayLaterCardRenderer _initWithRenderLoop:overlayLoader:](a1, v6, v10);

    id v7 = a1;
  }

  return v7;
}

- (void)dealloc
{
  -[PKPayLaterCardRenderer invalidate]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterCardRenderer;
  [(PKPayLaterCardRenderer *)&v3 dealloc];
}

- (void)invalidate
{
  if (a1 && !*(unsigned char *)(a1 + 8))
  {
    *(unsigned char *)(a1 + 8) = 1;
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    objc_super v3 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    v4 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    id v5 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    id v6 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    id v7 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = 0;

    v8 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    id v9 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = 0;

    v10 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = 0;

    v11 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = 0;

    id v12 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = 0;

    id v13 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    v14 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = 0;

    v15 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = 0;
  }
}

- (void)setMagnitudes:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && *(id *)(a1 + 16) != v3)
  {
    id v31 = v3;
    double Current = CFAbsoluteTimeGetCurrent();
    for (uint64_t i = 0; ; ++i)
    {
      switch(i)
      {
        case 0:
          uint64_t v6 = objc_msgSend(v31, "unknownCount", Current);
          uint64_t v7 = [*(id *)(a1 + 16) unknownCount];
          unint64_t v8 = v6 - v7;
          if (v6 - v7 >= 1)
          {
            uint64_t v9 = a1;
            uint64_t v10 = 0;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0) {
            continue;
          }
          uint64_t v23 = v7 - v6;
          uint64_t v24 = a1;
          uint64_t v25 = 0;
          break;
        case 1:
          uint64_t v11 = objc_msgSend(v31, "foodAndDrinksCount", Current);
          uint64_t v12 = [*(id *)(a1 + 16) foodAndDrinksCount];
          unint64_t v8 = v11 - v12;
          if (v11 - v12 >= 1)
          {
            uint64_t v9 = a1;
            uint64_t v10 = 1;
LABEL_19:
            -[PKPayLaterCardRenderer _addInstances:category:time:](v9, v8, v10);
            continue;
          }
          if ((v8 & 0x8000000000000000) == 0) {
            continue;
          }
          uint64_t v23 = v12 - v11;
          uint64_t v24 = a1;
          uint64_t v25 = 1;
          break;
        case 2:
          uint64_t v13 = objc_msgSend(v31, "shoppingCount", Current);
          uint64_t v14 = [*(id *)(a1 + 16) shoppingCount];
          unint64_t v8 = v13 - v14;
          if (v13 - v14 >= 1)
          {
            uint64_t v9 = a1;
            uint64_t v10 = 2;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0) {
            continue;
          }
          uint64_t v23 = v14 - v13;
          uint64_t v24 = a1;
          uint64_t v25 = 2;
          break;
        case 3:
          uint64_t v15 = objc_msgSend(v31, "travelCount", Current);
          uint64_t v16 = [*(id *)(a1 + 16) travelCount];
          unint64_t v8 = v15 - v16;
          if (v15 - v16 >= 1)
          {
            uint64_t v9 = a1;
            uint64_t v10 = 3;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0) {
            continue;
          }
          uint64_t v23 = v16 - v15;
          uint64_t v24 = a1;
          uint64_t v25 = 3;
          break;
        case 4:
          uint64_t v17 = objc_msgSend(v31, "servicesCount", Current);
          uint64_t v18 = [*(id *)(a1 + 16) servicesCount];
          unint64_t v8 = v17 - v18;
          if (v17 - v18 >= 1)
          {
            uint64_t v9 = a1;
            uint64_t v10 = 4;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0) {
            continue;
          }
          uint64_t v23 = v18 - v17;
          uint64_t v24 = a1;
          uint64_t v25 = 4;
          break;
        case 5:
          uint64_t v19 = objc_msgSend(v31, "funCount", Current);
          uint64_t v20 = [*(id *)(a1 + 16) funCount];
          unint64_t v8 = v19 - v20;
          if (v19 - v20 >= 1)
          {
            uint64_t v9 = a1;
            uint64_t v10 = 5;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0) {
            continue;
          }
          uint64_t v23 = v20 - v19;
          uint64_t v24 = a1;
          uint64_t v25 = 5;
          break;
        case 6:
          uint64_t v21 = objc_msgSend(v31, "healthCount", Current);
          uint64_t v22 = [*(id *)(a1 + 16) healthCount];
          unint64_t v8 = v21 - v22;
          if (v21 - v22 >= 1)
          {
            uint64_t v9 = a1;
            uint64_t v10 = 6;
            goto LABEL_19;
          }
          if ((v8 & 0x8000000000000000) == 0) {
            continue;
          }
          uint64_t v23 = v22 - v21;
          uint64_t v24 = a1;
          uint64_t v25 = 6;
          break;
        case 7:
          uint64_t v26 = objc_msgSend(v31, "transportcount", Current);
          uint64_t v27 = [*(id *)(a1 + 16) transportcount];
          unint64_t v28 = v26 - v27;
          if (v26 - v27 < 1)
          {
            if ((v28 & 0x8000000000000000) != 0) {
              -[PKPayLaterCardRenderer _removeInstances:category:time:](a1, v27 - v26, 7);
            }
          }
          else
          {
            -[PKPayLaterCardRenderer _addInstances:category:time:](a1, v28, 7);
          }
          uint64_t v29 = [v31 copy];
          v30 = *(void **)(a1 + 16);
          *(void *)(a1 + 16) = v29;

          id v3 = v31;
          goto LABEL_41;
        default:
          continue;
      }
      -[PKPayLaterCardRenderer _removeInstances:category:time:](v24, v23, v25);
    }
  }
LABEL_41:
}

- (uint64_t)_addInstances:(uint64_t)result category:(unint64_t)a2 time:(uint64_t)a3
{
  if (result)
  {
    uint64_t v5 = result;
    result = -[PKPayLaterCardRenderer _countOfNonExplodingInstances](result);
    if (result + a2 <= 0x64)
    {
      double v6 = *(double *)(v5 + 160);
      double v7 = *(double *)(v5 + 144);
      double v8 = *(double *)(v5 + 176);
      double v9 = *(double *)(v5 + 184);
      uint32_t v10 = arc4random_uniform(2u);
      if (a2)
      {
        unint64_t v11 = 0;
        double v12 = v6 * v9;
        double v13 = v7 / v8;
        if (v10) {
          double v13 = -(v7 / v8);
        }
        double v14 = v13 * 0.3;
        if (a2 >= 4) {
          double v15 = 0.0;
        }
        else {
          double v15 = v14;
        }
        do
        {
          v16.f64[0] = v15 + v12 * ((double)v11 - (double)(a2 - 1) * 0.5);
          v16.f64[1] = *(float64_t *)(v5 + 152);
          float64x2_t v19 = v16;
          arc4random();
          uint64_t v17 = [[PKPayLaterCardRendererInstance alloc] initWithPosition:a3 scale:COERCE_DOUBLE(vcvt_f32_f64(v19)) category:*(double *)(v5 + 168)];
          [*(id *)(v5 + 24) addObject:v17];

          ++v11;
        }
        while (a2 != v11);
      }
      uint64_t v18 = *(void **)(v5 + 24);
      return [v18 sortUsingComparator:&__block_literal_global_144];
    }
  }
  return result;
}

- (void)_removeInstances:(uint64_t)a1 category:(uint64_t)a2 time:(uint64_t)a3
{
  if (a1)
  {
    if ([*(id *)(a1 + 24) count])
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x2020000000;
      v13[3] = 0;
      double v7 = *(void **)(a1 + 24);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke;
      v12[3] = &unk_2644F8ED8;
      v12[4] = v13;
      v12[5] = a3;
      v12[6] = a2;
      double v8 = objc_msgSend(v7, "pk_objectsPassingTest:", v12);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke_2;
      v11[3] = &unk_2644F8F00;
      *(CFAbsoluteTime *)&v11[5] = Current;
      v11[4] = v13;
      [v8 enumerateObjectsUsingBlock:v11];
      [*(id *)(a1 + 24) sortUsingComparator:&__block_literal_global_142];
      dispatch_time_t v9 = dispatch_time(0, 1400000000);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke_3;
      v10[3] = &unk_2644F8CF8;
      v10[4] = a1;
      dispatch_after(v9, MEMORY[0x263EF83A0], v10);

      _Block_object_dispose(v13, 8);
    }
  }
}

- (uint64_t)_countOfNonExplodingInstances
{
  if (result)
  {
    v1 = objc_msgSend(*(id *)(result + 24), "pk_objectsPassingTest:", &__block_literal_global_146);
    uint64_t v2 = [v1 count];

    return v2;
  }
  return result;
}

uint64_t __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 category] == a1[5] && (objc_msgSend(v6, "explodeTime"), v7 < 0.0))
  {
    uint64_t v8 = ++*(void *)(*(void *)(a1[4] + 8) + 24);
    uint64_t v9 = a1[6];
    uint64_t v10 = 1;
    if (v8 == v9) {
      *a4 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  return [a2 explodeAtTime:*(double *)(a1 + 40)+ (double)a3 / (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
}

uint64_t __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "pk_removeObjectsPassingTest:", &__block_literal_global_1);
}

BOOL __57__PKPayLaterCardRenderer__removeInstances_category_time___block_invoke_4(uint64_t a1, void *a2)
{
  [a2 explodeTime];
  return v2 >= 0.0;
}

- (uint64_t)renderAtTime:(uint64_t)a1
{
  uint64_t v1 = a1;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a1)
  {
    if (*(unsigned char *)(a1 + 8))
    {
      return 1;
    }
    else
    {
      double v2 = [*(id *)(a1 + 32) device];
      if ([*(id *)(v1 + 32) isDrawableAvailable])
      {
        id v3 = [*(id *)(v1 + 32) currentDrawable];
        if (v3 && -[PKPayLaterCardRenderer _updateRenderPassDescriptorWithDrawable:]((void *)v1, v3))
        {
          v22[0] = xmmword_21EEE7A80;
          v22[1] = unk_21EEE7A90;
          v22[2] = xmmword_21EEE7AA0;
          v22[3] = unk_21EEE7AB0;
          uint64_t v4 = [v2 newBufferWithBytes:v22 length:64 options:0];
          uint64_t v5 = *(void **)(v1 + 104);
          *(void *)(v1 + 104) = v4;

          v21[0] = 0x3F0000003FC00000;
          v21[1] = 0xBF0000003FC00000;
          v21[2] = 0x3F000000BFC00000;
          v21[3] = 0xBF000000BFC00000;
          uint64_t v6 = [v2 newBufferWithBytes:v21 length:32 options:0];
          double v7 = *(void **)(v1 + 112);
          *(void *)(v1 + 112) = v6;

          -[PKPayLaterCardRenderer _updateUniformsForDevice:](v1, v2);
          uint64_t v8 = [*(id *)(v1 + 40) commandBuffer];
          uint64_t v9 = v8;
          if (*(void *)(v1 + 96))
          {
            uint64_t v10 = [v8 blitCommandEncoder];
            unint64_t v11 = *(void **)(v1 + 96);
            v18[0] = MEMORY[0x263EF8330];
            v18[1] = 3221225472;
            v18[2] = __39__PKPayLaterCardRenderer_renderAtTime___block_invoke;
            v18[3] = &unk_2644F8F48;
            v18[4] = v1;
            id v19 = v2;
            id v20 = v10;
            id v12 = v10;
            [v11 read:v18];
            double v13 = *(void **)(v1 + 96);
            *(void *)(v1 + 96) = 0;

            [v12 endEncoding];
          }
          if (*(void *)(v1 + 136))
          {
            double v14 = [v9 renderCommandEncoderWithDescriptor:*(void *)(v1 + 88)];
            [v14 setRenderPipelineState:*(void *)(v1 + 48)];
            [v14 setVertexBuffer:*(void *)(v1 + 104) offset:0 atIndex:0];
            [v14 setFragmentBuffer:*(void *)(v1 + 120) offset:0 atIndex:0];
            [v14 drawPrimitives:4 vertexStart:0 vertexCount:4];
            uint64_t v15 = [*(id *)(v1 + 24) count];
            if (v15)
            {
              uint64_t v16 = v15;
              [v14 setRenderPipelineState:*(void *)(v1 + 64)];
              [v14 setVertexBuffer:*(void *)(v1 + 112) offset:0 atIndex:0];
              [v14 setVertexBuffer:*(void *)(v1 + 120) offset:0 atIndex:1];
              [v14 setVertexBuffer:*(void *)(v1 + 128) offset:0 atIndex:2];
              [v14 drawPrimitives:4 vertexStart:0 vertexCount:4 instanceCount:v16];
            }
            [v14 setRenderPipelineState:*(void *)(v1 + 56)];
            [v14 setVertexBuffer:*(void *)(v1 + 104) offset:0 atIndex:0];
            [v14 setFragmentBuffer:*(void *)(v1 + 120) offset:0 atIndex:0];
            [v14 setFragmentTexture:*(void *)(v1 + 136) atIndex:3];
            [v14 drawPrimitives:4 vertexStart:0 vertexCount:4];
            [v14 endEncoding];

            [v9 presentDrawable:v3];
            [v9 commit];
          }
          else
          {
            -[PKPayLaterCardRenderer invalidate](v1);
          }

          uint64_t v1 = 1;
        }
        else
        {
          uint64_t v1 = 0;
        }
      }
      else
      {
        uint64_t v1 = 0;
        id v3 = 0;
      }
    }
  }
  return v1;
}

- (unint64_t)_updateRenderPassDescriptorWithDrawable:(void *)a1
{
  unint64_t v2 = (unint64_t)a1;
  if (a1)
  {
    id v3 = [a2 texture];
    uint64_t v4 = [v3 width];
    uint64_t v5 = [v3 height];
    if (*(void *)(v2 + 72) != v4 || *(void *)(v2 + 80) != v5)
    {
      *(void *)(v2 + 72) = v4;
      *(void *)(v2 + 80) = v5;
      uint64_t v6 = *(void **)(v2 + 88);
      *(void *)(v2 + 88) = 0;

      uint64_t v4 = *(void *)(v2 + 72);
    }
    if (v4 && *(void *)(v2 + 80))
    {
      double v7 = *(void **)(v2 + 88);
      if (!v7)
      {
        id v8 = objc_alloc_init(MEMORY[0x263F129A0]);
        uint64_t v9 = *(void **)(v2 + 88);
        *(void *)(v2 + 88) = v8;

        double v7 = *(void **)(v2 + 88);
      }
      uint64_t v10 = [v7 colorAttachments];
      unint64_t v11 = [v10 objectAtIndexedSubscript:0];
      [v11 setTexture:v3];
      unint64_t v2 = *(void *)(v2 + 88) != 0;
    }
    else
    {
      unint64_t v2 = 0;
    }
  }
  return v2;
}

- (void)_updateUniformsForDevice:(uint64_t)a1
{
  v187[16] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!*(void *)(a1 + 120))
    {
      uint64_t v5 = [v3 newBufferWithLength:192 options:0];
      uint64_t v6 = *(void **)(a1 + 120);
      *(void *)(a1 + 120) = v5;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v8 = -[PKPayLaterCardRenderer _countOfActiveInstancesAtTime:](a1, Current);
    float v9 = *(float *)(a1 + 368);
    float v10 = *(float *)(a1 + 372);
    *(float *)&uint64_t v149 = -v10;
    float v11 = *(float *)(a1 + 376);
    float v12 = *(float *)(a1 + 380);
    float v13 = -(float)((float)(v10 * v12) - (float)(v9 * v11));
    *(float *)&unint64_t v14 = (float)((float)((float)(v9 * v9) - (float)(v10 * v10)) - (float)(v11 * v11)) + (float)(v12 * v12);
    *((float *)&v14 + 1) = (float)((float)(v11 * v12) + (float)(v9 * v10))
                         + (float)((float)(v11 * v12) + (float)(v9 * v10));
    float32x4_t v153 = (float32x4_t)v14;
    float v15 = (float)(v9 * v12) + (float)(v10 * v11);
    *(float *)&unint64_t v14 = (float)-(float)((float)(v11 * v12) - (float)(v9 * v10))
                   - (float)((float)(v11 * v12) - (float)(v9 * v10));
    *((float *)&v14 + 1) = (float)((float)((float)(v10 * v10) - (float)(v11 * v11)) + (float)(v12 * v12))
                         - (float)(v9 * v9);
    *(float *)&long long v16 = (float)((float)(v10 * v12) + (float)(v11 * v9)) + (float)((float)(v10 * v12) + (float)(v11 * v9));
    *(float *)&long long v17 = (float)-(float)((float)(v9 * v12) - (float)(v10 * v11))
                   - (float)((float)(v9 * v12) - (float)(v10 * v11));
    float v18 = (float)((float)(v12 * v12) + (float)(v11 * v11)) - (float)(v9 * v9);
    long long v138 = v17;
    long long v139 = v16;
    *(float *)&unint64_t v19 = *(float *)&v16;
    HIDWORD(v19) = v17;
    long long v151 = v19;
    float32x4_t v152 = (float32x4_t)v14;
    *(double *)&long long v20 = (1.0 - pow(1.0 - fmin(fmax((double)(unint64_t)v8 / 30.0, 0.0), 1.0), 3.0)) * -1.2 + 2.2;
    long long v150 = v20;
    long double v21 = log((double)(unint64_t)v8);
    uint64_t v22 = 0;
    v23.f64[0] = fmin(fmax(v21 * -0.9 + 5.0, 1.1), 2.42);
    *(void *)&v23.f64[1] = v150;
    float64x2_t v24 = vmlaq_f64(vmulq_f64(v23, (float64x2_t)vdupq_n_s64(0x3FA999999999999AuLL)), (float64x2_t)vdupq_n_s64(0x3FEE666666666666uLL), *(float64x2_t *)(a1 + 176));
    *(float64x2_t *)(a1 + 176) = v24;
    *(void *)&long long v150 = v8;
    if ((unint64_t)(v8 - 3) >= 0x12) {
      double v25 = 0.0;
    }
    else {
      double v25 = 1.0;
    }
    double v26 = 0.05;
    double v27 = *(double *)(a1 + 200);
    double v28 = v25 * 0.05 + *(double *)(a1 + 192) * 0.95;
    if (!*(unsigned char *)(a1 + 352)) {
      double v26 = 0.0;
    }
    *(double *)(a1 + 192) = v28;
    *(double *)(a1 + 200) = v26 + v27 * 0.95;
    *(float *)&unsigned int v29 = v24.f64[0];
    float v30 = *(float *)&v29;
    LODWORD(v31) = 0;
    HIDWORD(v31) = v29;
    *(void *)&long long v32 = 0;
    *((void *)&v32 + 1) = v29;
    float32x2_t v33 = vrsqrte_f32((float32x2_t)1206862336);
    float32x2_t v34 = vmul_f32(v33, vrsqrts_f32((float32x2_t)1206862336, vmul_f32(v33, v33)));
    float32x4_t v35 = vmulq_n_f32((float32x4_t)xmmword_21EEE7A40, vmul_f32(v34, vrsqrts_f32((float32x2_t)1206862336, vmul_f32(v34, v34))).f32[0]);
    float32x4_t v36 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35, (int32x4_t)v35), (int8x16_t)v35, 0xCuLL);
    float32x4_t v37 = vmlaq_f32(vmulq_f32(v36, (float32x4_t)xmmword_21EEE7A50), (float32x4_t)xmmword_21EEE79C0, v35);
    float32x4_t v38 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v37, (int32x4_t)v37), (int8x16_t)v37, 0xCuLL);
    float32x4_t v39 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v38, (int32x4_t)v38), (int8x16_t)v38, 0xCuLL), vnegq_f32(v35)), v38, v36);
    float32x4_t v40 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v39, (int32x4_t)v39), (int8x16_t)v39, 0xCuLL);
    int32x4_t v41 = (int32x4_t)vmulq_f32(v37, v37);
    v41.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v41.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v41, 2), *(float32x2_t *)v41.i8)).u32[0];
    float32x2_t v42 = vrsqrte_f32((float32x2_t)v41.u32[0]);
    float32x2_t v43 = vmul_f32(v42, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v42, v42)));
    float32x4_t v47 = vmulq_n_f32(v38, vmul_f32(v43, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v43, v43))).f32[0]);
    int32x4_t v44 = (int32x4_t)vmulq_f32(v39, v39);
    v44.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v44.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v44, 2), *(float32x2_t *)v44.i8)).u32[0];
    *(float32x2_t *)v39.f32 = vrsqrte_f32((float32x2_t)v44.u32[0]);
    *(float32x2_t *)v39.f32 = vmul_f32(*(float32x2_t *)v39.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v39.f32, *(float32x2_t *)v39.f32)));
    float32x4_t v45 = vmulq_n_f32(v40, vmul_f32(*(float32x2_t *)v39.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v39.f32, *(float32x2_t *)v39.f32))).f32[0]);
    v48.i64[0] = __PAIR64__(v45.u32[1], v47.u32[1]);
    v49.i64[0] = __PAIR64__(v45.u32[2], v47.u32[2]);
    int32x4_t v46 = (int32x4_t)vmulq_f32(v47, (float32x4_t)xmmword_21EEE7A40);
    v47.i32[1] = v45.i32[0];
    v47.i64[1] = v35.u32[0];
    v48.i64[1] = v35.u32[1];
    v49.i64[1] = v35.u32[2];
    int32x4_t v50 = (int32x4_t)vmulq_f32(v45, (float32x4_t)xmmword_21EEE7A40);
    float32x2_t v51 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v46.i8, *(int32x2_t *)v50.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v46.i8, *(int32x2_t *)v50.i8));
    float32x4_t v52 = (float32x4_t)vzip2q_s32(v46, v50);
    float32x4_t v53 = vmulq_f32(v35, (float32x4_t)xmmword_21EEE7A40);
    *(float32x2_t *)v52.f32 = vadd_f32(*(float32x2_t *)v52.f32, v51);
    v35.f32[0] = -vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v53, 2), vaddq_f32(v53, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v53.f32, 1))).f32[0];
    v54.i64[0] = vnegq_f32(v52).u64[0];
    v54.i64[1] = __PAIR64__(1.0, v35.u32[0]);
    long long v154 = LODWORD(v30);
    long long v155 = v31;
    long long v156 = v32;
    long long v157 = xmmword_21EEE7810;
    long long v173 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    do
    {
      *(long long *)((char *)&v173 + v22) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(*(long long *)((char *)&v154 + v22))), v48, *(float32x2_t *)((char *)&v154 + v22), 1), v49, *(float32x4_t *)((char *)&v154 + v22), 2), v54, *(float32x4_t *)((char *)&v154 + v22), 3);
      v22 += 16;
    }
    while (v22 != 64);
    id v140 = v4;
    uint64_t v55 = 0;
    long long v56 = v173;
    long long v57 = v174;
    float v58 = v18 + (float)(*(float *)&v149 * v10);
    long long v59 = v175;
    long long v60 = v176;
    *(_OWORD *)(a1 + 224) = v173;
    *(_OWORD *)(a1 + 240) = v57;
    *(_OWORD *)(a1 + 256) = v59;
    *(_OWORD *)(a1 + 272) = v60;
    float32x4_t v61 = *(float32x4_t *)(a1 + 288);
    float32x4_t v62 = *(float32x4_t *)(a1 + 304);
    float32x4_t v63 = *(float32x4_t *)(a1 + 320);
    float32x4_t v64 = *(float32x4_t *)(a1 + 336);
    long long v154 = v56;
    long long v155 = v57;
    long long v156 = v59;
    long long v157 = v60;
    long long v173 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    do
    {
      *(long long *)((char *)&v173 + v55) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v61, COERCE_FLOAT(*(long long *)((char *)&v154 + v55))), v62, *(float32x2_t *)((char *)&v154 + v55), 1), v63, *(float32x4_t *)((char *)&v154 + v55), 2), v64, *(float32x4_t *)((char *)&v154 + v55), 3);
      v55 += 16;
    }
    while (v55 != 64);
    float32x4_t v66 = v152;
    float32x4_t v65 = v153;
    v65.f32[2] = v13 + v13;
    v66.f32[2] = v15 + v15;
    long long v67 = v151;
    *((float *)&v67 + 2) = v58;
    float32x4_t v177 = v65;
    float32x4_t v178 = v66;
    long long v179 = v67;
    long long v180 = xmmword_21EEE7810;
    float64x2_t v68 = vcvtq_f64_u64(*(uint64x2_t *)(a1 + 72));
    *(float32x2_t *)&v68.f64[0] = vcvt_f32_f64(v68);
    float64x2_t v181 = v68;
    id v69 = [MEMORY[0x263F5BE00] colorWithR:0.09 G:0.09 B:0.09 A:1.0];
    *(double *)&long long v70 = PKMakeFloat4FromCGColor((CGColor *)[v69 CGColor]);
    long long v182 = v70;
    id v71 = [MEMORY[0x263F5BE00] colorWithR:0.0 G:0.0 B:0.0 A:1.0];
    *(double *)&long long v72 = PKMakeFloat4FromCGColor((CGColor *)[v71 CGColor]);
    *(float *)&unsigned int v73 = *(double *)(a1 + 208);
    long long v183 = v72;
    long long v184 = v73;

    v74 = (void *)[*(id *)(a1 + 120) contents];
    if ((unint64_t)[*(id *)(a1 + 120) length] > 0xBF) {
      size_t v75 = 192;
    }
    else {
      size_t v75 = [*(id *)(a1 + 120) length];
    }
    memcpy(v74, &v173, v75);
    double v77 = *(double *)(a1 + 176);
    double v76 = *(double *)(a1 + 184);
    double v78 = *(double *)(a1 + 144);
    double v79 = *(double *)(a1 + 160);
    double v80 = *(double *)(a1 + 152) / v77;
    double v141 = *(double *)(a1 + 192);
    double v142 = v76;
    if (*(double *)(a1 + 208) <= 0.0) {
      double v81 = v80 * 0.1;
    }
    else {
      double v81 = 0.0;
    }
    double v147 = v81;
    long long v169 = 0u;
    long long v170 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    *(void *)&long long v151 = *(id *)(a1 + 24);
    uint64_t v82 = [(id)v151 countByEnumeratingWithState:&v169 objects:v187 count:16];
    if (v82)
    {
      uint64_t v84 = v82;
      double v85 = v79 * v142;
      *(double *)v83.i64 = v79 * 0.125;
      double v86 = v79 * 0.125 - v78 / v77;
      double v87 = v78 / v77 - *(double *)v83.i64;
      double v88 = -(v80 - *(double *)v83.i64 * (v141 + 1.0));
      *(double *)v83.i64 = -(*(double *)v83.i64 * (v141 + 4.0));
      double v89 = *(double *)v83.i64 + v80 * 0.52;
      uint64_t v90 = *(void *)v170;
      v83.f32[0] = v87;
      float32x4_t v144 = v83;
      v83.f32[0] = v86;
      float32x4_t v146 = v83;
      v83.f32[0] = v89;
      float32x4_t v143 = v83;
      v83.f32[0] = v88;
      float32x4_t v145 = v83;
      long long v148 = xmmword_21EEE7A60;
      uint64_t v149 = v90;
      do
      {
        for (uint64_t i = 0; i != v84; ++i)
        {
          if (*(void *)v170 != v90) {
            objc_enumerationMutation((id)v151);
          }
          v92 = *(void **)(*((void *)&v169 + 1) + 8 * i);
          if ((objc_msgSend(v92, "isIgnoredAtTime:", Current, (void)v138, *((void *)&v138 + 1)) & 1) == 0)
          {
            [v92 position];
            float32x4_t v153 = v93;
            [v92 velocity];
            if (v86 > v153.f32[0])
            {
              float32x4_t v94 = v146;
              goto LABEL_29;
            }
            if (v87 >= v153.f32[0])
            {
              float32x4_t v94 = v153;
            }
            else
            {
              float32x4_t v94 = v144;
LABEL_29:
              *(uint64_t *)((char *)v94.i64 + 4) = *(uint64_t *)((char *)v153.i64 + 4);
            }
            if (v88 > v94.f32[1])
            {
              float32x4_t v95 = v94;
              __int32 v96 = v145.i32[0];
              goto LABEL_35;
            }
            if (v89 < v94.f32[1])
            {
              float32x4_t v95 = v94;
              __int32 v96 = v143.i32[0];
LABEL_35:
              v95.i32[1] = v96;
              v95.i32[2] = v94.i32[2];
              float32x4_t v94 = v95;
            }
            float32x4_t v153 = v94;
            objc_msgSend(v92, "setPosition:andVelocity:");
            double v97 = *(double *)&v148;
            if ((unint64_t)v150 <= 0x1B)
            {
              *(float *)&unsigned int v98 = v147 + v153.f32[1];
              *(void *)&double v97 = vmulq_f32((float32x4_t)__PAIR64__(v98, v153.u32[0]), (float32x4_t)xmmword_21EEE7A70).u64[0];
            }
            [v92 addForces:v97];
            long long v167 = 0u;
            long long v168 = 0u;
            long long v165 = 0u;
            long long v166 = 0u;
            uint64_t v99 = a1;
            id v100 = *(id *)(a1 + 24);
            uint64_t v101 = [v100 countByEnumeratingWithState:&v165 objects:v186 count:16];
            if (v101)
            {
              uint64_t v102 = v101;
              uint64_t v103 = *(void *)v166;
              do
              {
                for (uint64_t j = 0; j != v102; ++j)
                {
                  if (*(void *)v166 != v103) {
                    objc_enumerationMutation(v100);
                  }
                  v105 = *(void **)(*((void *)&v165 + 1) + 8 * j);
                  if (v105 != v92
                    && ([*(id *)(*((void *)&v165 + 1) + 8 * j) isIgnoredAtTime:Current] & 1) == 0)
                  {
                    [v92 position];
                    float32x4_t v153 = v106;
                    [v105 position];
                    float32x4_t v153 = vsubq_f32(v153, v107);
                    float32x4_t v108 = vmulq_f32(v153, v153);
                    v108.f32[0] = vaddv_f32(*(float32x2_t *)v108.f32);
                    float32x4_t v152 = v108;
                    double v109 = sqrtf(v108.f32[0]);
                    [v92 size];
                    double v111 = v85 * v110;
                    if (v111 > v109)
                    {
                      long double v112 = pow(v109 / v111, 8.0);
                      float32x2_t v113 = vrsqrte_f32((float32x2_t)v152.u32[0]);
                      float32x2_t v114 = vmul_f32(v113, vrsqrts_f32((float32x2_t)v152.u32[0], vmul_f32(v113, v113)));
                      *(float32x2_t *)v115.f32 = vmul_n_f32(*(float32x2_t *)v153.f32, vmul_f32(v114, vrsqrts_f32((float32x2_t)v152.u32[0], vmul_f32(v114, v114))).f32[0]);
                      v115.i32[2] = 0;
                      *(float *)&long double v112 = 1.0 - v112;
                      float32x4_t v116 = vmulq_n_f32(v115, *(float *)&v112);
                      v115.i64[0] = 0x3F0000003F000000;
                      v115.i64[1] = 0x3F0000003F000000;
                      float32x4_t v153 = vmulq_f32(v116, v115);
                      objc_msgSend(v92, "addForces:");
                      [v105 addForces:*(double *)vnegq_f32(v153).i64];
                    }
                  }
                }
                uint64_t v102 = [v100 countByEnumeratingWithState:&v165 objects:v186 count:16];
              }
              while (v102);
            }

            [v92 applyForces];
            a1 = v99;
            uint64_t v90 = v149;
            continue;
          }
        }
        uint64_t v84 = [(id)v151 countByEnumeratingWithState:&v169 objects:v187 count:16];
      }
      while (v84);
    }

    uint64_t v117 = [*(id *)(a1 + 24) count];
    if (v117)
    {
      v152.i64[0] = (uint64_t)&v138;
      uint64_t v119 = 112 * v117;
      MEMORY[0x270FA5388](v118);
      long long v163 = 0u;
      long long v164 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      v153.i64[0] = a1;
      id v120 = *(id *)(a1 + 24);
      uint64_t v121 = [v120 countByEnumeratingWithState:&v161 objects:v185 count:16];
      if (v121)
      {
        uint64_t v122 = v121;
        uint64_t v123 = 0;
        double v124 = v142 * v141;
        v125.i32[0] = v139;
        v125.f32[1] = -*(float *)&v138;
        uint64_t v126 = *(void *)v162;
        double v127 = COERCE_DOUBLE(vmul_f32(v125, (float32x2_t)vdup_n_s32(0x40066666u)));
        do
        {
          uint64_t v128 = 0;
          v129 = (long long *)((char *)&v138 + 112 * v123 - v119);
          do
          {
            if (*(void *)v162 != v126) {
              objc_enumerationMutation(v120);
            }
            v130 = *(void **)(*((void *)&v161 + 1) + 8 * v128);
            long long v159 = 0u;
            long long v160 = 0u;
            long long v157 = 0u;
            long long v158 = 0u;
            long long v155 = 0u;
            long long v156 = 0u;
            long long v154 = 0u;
            if (v130) {
              [v130 uniformWithSkew:v127 now:Current waveAmplitude:v124];
            }
            long long v131 = v159;
            v129[4] = v158;
            v129[5] = v131;
            v129[6] = v160;
            long long v132 = v155;
            _OWORD *v129 = v154;
            v129[1] = v132;
            long long v133 = v157;
            ++v128;
            v129[2] = v156;
            v129[3] = v133;
            v129 += 7;
          }
          while (v122 != v128);
          uint64_t v122 = [v120 countByEnumeratingWithState:&v161 objects:v185 count:16];
          v123 += v128;
        }
        while (v122);
      }

      id v4 = v140;
      uint64_t v134 = [v140 newBufferWithBytes:(char *)&v138 - v119 length:v119 options:0];
      v135 = *(void **)(v153.i64[0] + 128);
      *(void *)(v153.i64[0] + 128) = v134;
    }
    else
    {
      id v4 = v140;
      uint64_t v136 = [v140 newBufferWithLength:0 options:0];
      v137 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v136;
    }
  }
}

void __39__PKPayLaterCardRenderer_renderAtTime___block_invoke(uint64_t a1, uint64_t a2)
{
  DefaultPrivate2DTexture = PKTextureLoaderResultCreateDefaultPrivate2DTexture(a2, *(void **)(a1 + 40), *(void **)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 136);
  *(void *)(v4 + 136) = DefaultPrivate2DTexture;

  if (!*(void *)(*(void *)(a1 + 32) + 136))
  {
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_21EEBD000, v6, OS_LOG_TYPE_DEFAULT, "PKPayLaterCardRenderer: could not load overlay texture.", v7, 2u);
    }
  }
}

- (uint64_t)_countOfActiveInstancesAtTime:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  unint64_t v2 = *(void **)(a1 + 24);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__PKPayLaterCardRenderer__countOfActiveInstancesAtTime___block_invoke;
  v6[3] = &__block_descriptor_40_e47_B32__0__PKPayLaterCardRendererInstance_8Q16_B24l;
  *(double *)&v6[4] = a2;
  id v3 = objc_msgSend(v2, "pk_objectsPassingTest:", v6);
  uint64_t v4 = [v3 count];

  return v4;
}

uint64_t __53__PKPayLaterCardRenderer__sortInstancesByExplodeTime__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 explodeTime];
  double v6 = v5;
  [v4 explodeTime];
  double v8 = v7;

  uint64_t v9 = -1;
  if (v6 <= v8) {
    uint64_t v9 = 1;
  }
  if (v6 == v8) {
    return 0;
  }
  else {
    return v9;
  }
}

uint64_t __48__PKPayLaterCardRenderer__sortInstancesByZOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 position];
  float v6 = v5;
  [v4 position];
  float v10 = v7;

  uint64_t v8 = -1;
  if (v6 <= v10) {
    uint64_t v8 = 1;
  }
  if (v6 == v10) {
    return 0;
  }
  else {
    return v8;
  }
}

BOOL __55__PKPayLaterCardRenderer__countOfNonExplodingInstances__block_invoke(uint64_t a1, void *a2)
{
  [a2 explodeTime];
  return v2 < 0.0;
}

uint64_t __56__PKPayLaterCardRenderer__countOfActiveInstancesAtTime___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isIgnoredAtTime:*(double *)(a1 + 32)] ^ 1;
}

- (double)rotation
{
  if (a1) {
    long long v1 = *(_OWORD *)(a1 + 368);
  }
  else {
    *(void *)&long long v1 = 0;
  }
  return *(double *)&v1;
}

- (__n128)setRotation:(__n128 *)result
{
  if (result) {
    result[23] = a2;
  }
  return result;
}

- (__n128)setGravity:(__n128 *)result
{
  if (result) {
    result[24] = a2;
  }
  return result;
}

- (BOOL)isPresented
{
  if (result) {
    return *(unsigned char *)(result + 352) != 0;
  }
  return result;
}

- (uint64_t)setPresented:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 352) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_storeStrong((id *)&self->_instanceUniforms, 0);
  objc_storeStrong((id *)&self->_uniform, 0);
  objc_storeStrong((id *)&self->_instanceVertexCoords, 0);
  objc_storeStrong((id *)&self->_vertices, 0);
  objc_storeStrong((id *)&self->_overlayLoader, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_instancePipelineState, 0);
  objc_storeStrong((id *)&self->_overlayPipelineState, 0);
  objc_storeStrong((id *)&self->_backgroundPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_loop, 0);
  objc_storeStrong((id *)&self->_instances, 0);

  objc_storeStrong((id *)&self->_magnitudes, 0);
}

- (void)_initWithRenderLoop:(uint64_t)a1 overlayLoader:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21EEBD000, a2, OS_LOG_TYPE_FAULT, "PKPayLaterCardRenderer: could not load metal library - %@.", (uint8_t *)&v2, 0xCu);
}

@end