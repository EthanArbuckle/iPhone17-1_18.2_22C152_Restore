@interface VGMLSegmentationModel
- (VGMLSegmentationModel)init;
- (id)_performSegmentationRequest:(id)a3 onPixelBuffer:(__CVBuffer *)a4 segmentationRequestRevision:(unint64_t)a5 error:(id *)a6;
- (id)_resizePixelBuffer:(__CVBuffer *)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (id)segmentationMaps:(__CVBuffer *)a3;
- (id)segmentationSurfaces:(__CVBuffer *)a3;
@end

@implementation VGMLSegmentationModel

- (VGMLSegmentationModel)init
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)VGMLSegmentationModel;
  v2 = [(VGMLSegmentationModel *)&v27 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    humanAttributesMap();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v24;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(id *)(*((void *)&v23 + 1) + 8 * v7);
          v9 = [v4 objectForKeyedSubscript:v8];
          [v3 addObject:v9];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v5);
    }

    [v3 addObject:@"person"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = personInstancesMapNames();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(id *)(*((void *)&v19 + 1) + 8 * v13);
          objc_msgSend(v3, "addObject:", v14, (void)v19);

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v28 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v3];
    outputSegmentationMaps = v2->_outputSegmentationMaps;
    v2->_outputSegmentationMaps = (NSOrderedSet *)v15;

    v17 = v2;
  }

  return v2;
}

- (id)_performSegmentationRequest:(id)a3 onPixelBuffer:(__CVBuffer *)a4 segmentationRequestRevision:(unint64_t)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = objc_alloc(MEMORY[0x263F1EF40]);
  uint64_t v11 = (void *)[v10 initWithCVPixelBuffer:a4 options:MEMORY[0x263EFFA78]];
  if (!v11)
  {
    uint64_t v15 = __VGLogSharedInstance();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v16 = " Vision request handler failed to instantiate ";
LABEL_23:
    v18 = v15;
    uint32_t v19 = 2;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v9;
    [v12 setQualityLevel:0];
    [v12 setOutputPixelFormat:1278226534];
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = __VGLogSharedInstance();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    v16 = " Unsupported type received for VNGenerateSegmentationRequest. ";
    goto LABEL_23;
  }
  uint64_t v15 = v9;
  [v15 setQualityLevel:0];
  if (([v15 setRevision:a5 error:a6] & 1) == 0)
  {
    long long v21 = __VGLogSharedInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = *a6;
      *(_DWORD *)buf = 138412290;
      id v26 = v22;
      _os_log_impl(&dword_260C8D000, v21, OS_LOG_TYPE_ERROR, " Error setting revision for person instance model %@ ", buf, 0xCu);
    }

    goto LABEL_25;
  }
  [v15 setMinimumConfidence:0.0];
  [v15 setOutputPixelFormat:1278226534];
LABEL_4:

  id v24 = v9;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v24 count:1];
  char v14 = [v11 performRequests:v13 error:a6];

  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      long long v20 = [v9 results];
      goto LABEL_26;
    }
    uint64_t v15 = __VGLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = " SegmentationRequest not of supported type. ";
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v15 = __VGLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v17 = *a6;
      *(_DWORD *)buf = 138412290;
      id v26 = v17;
      v16 = " Failed to process segmentation request %@ ";
      v18 = v15;
      uint32_t v19 = 12;
LABEL_24:
      _os_log_impl(&dword_260C8D000, v18, OS_LOG_TYPE_ERROR, v16, buf, v19);
    }
  }
LABEL_25:

  long long v20 = 0;
LABEL_26:

  return v20;
}

- (id)_resizePixelBuffer:(__CVBuffer *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  CVPixelBufferGetIOSurface(a3);
  uint64_t v7 = (IOSurface *)objc_claimAutoreleasedReturnValue();
  id v8 = resizeSurface(v7, a4, a5);

  return v8;
}

- (id)segmentationSurfaces:(__CVBuffer *)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  id v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSOrderedSet count](self->_outputSegmentationMaps, "count"));
  uint64_t v55 = 0;
  v34 = objc_opt_new();
  v38 = a3;
  v36 = -[VGMLSegmentationModel _performSegmentationRequest:onPixelBuffer:segmentationRequestRevision:error:](self, "_performSegmentationRequest:onPixelBuffer:segmentationRequestRevision:error:");
  id v35 = 0;
  if (v35)
  {
    uint64_t v5 = __VGLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v59 = v35;
      _os_log_impl(&dword_260C8D000, v5, OS_LOG_TYPE_ERROR, " Could not perform human attributes segmentation request. %@ ", buf, 0xCu);
    }
  }
  else
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v5 = v36;
    obuint64_t j = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v52 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(id *)(*((void *)&v51 + 1) + 8 * i);
          id v10 = humanAttributesMap();
          uint64_t v11 = [v9 featureName];
          id v12 = [v10 objectForKey:v11];
          BOOL v13 = v12 == 0;

          if (v13)
          {
            char v14 = __VGLogSharedInstance();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              id v17 = [v9 featureName];
              *(_DWORD *)buf = 138412290;
              id v59 = v17;
              _os_log_impl(&dword_260C8D000, v14, OS_LOG_TYPE_ERROR, " Received an unexpected output map from VNGenerateHumanAttributesSegmentationRequest: %@ ", buf, 0xCu);
            }
          }
          else
          {
            char v14 = -[VGMLSegmentationModel _resizePixelBuffer:width:height:](self, "_resizePixelBuffer:width:height:", [v9 pixelBuffer], Width, Height);
            uint64_t v15 = [v9 featureName];
            v16 = [v10 objectForKeyedSubscript:v15];
            [v44 setObject:v14 forKey:v16];
          }
        }
        uint64_t v5 = obj;
        uint64_t v6 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v6);
    }
  }

  id v50 = v35;
  v37 = objc_opt_new();
  v39 = -[VGMLSegmentationModel _performSegmentationRequest:onPixelBuffer:segmentationRequestRevision:error:](self, "_performSegmentationRequest:onPixelBuffer:segmentationRequestRevision:error:");
  id obja = v35;

  if (obja)
  {
    v18 = __VGLogSharedInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v59 = obja;
      _os_log_impl(&dword_260C8D000, v18, OS_LOG_TYPE_ERROR, " Could not perform person segmentation request. %@ ", buf, 0xCu);
    }
  }
  else
  {
    v18 = personInstancesMapNames();
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v19 = v39;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v20)
    {
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v47 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(id *)(*((void *)&v46 + 1) + 8 * j);
          long long v25 = -[VGMLSegmentationModel _resizePixelBuffer:width:height:](self, "_resizePixelBuffer:width:height:", [v24 pixelBuffer], Width, Height);
          id v26 = [v18 objectAtIndexedSubscript:v21 + j];
          [v44 setObject:v25 forKey:v26];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v56 count:16];
        v21 += j;
      }
      while (v20);
    }
  }
  uint64_t v27 = objc_opt_new();
  id v45 = obja;
  v28 = [(VGMLSegmentationModel *)self _performSegmentationRequest:v27 onPixelBuffer:v38 segmentationRequestRevision:1 error:&v45];
  id v29 = v45;

  if (v29)
  {
    uint64_t v30 = __VGLogSharedInstance();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v59 = v29;
      _os_log_impl(&dword_260C8D000, v30, OS_LOG_TYPE_ERROR, " Could not perform person segmentation request. %@ ", buf, 0xCu);
    }

    goto LABEL_30;
  }
  if (![v28 count])
  {
LABEL_30:
    v31 = 0;
    goto LABEL_33;
  }
  v32 = [v28 objectAtIndexedSubscript:0];
  v31 = -[VGMLSegmentationModel _resizePixelBuffer:width:height:](self, "_resizePixelBuffer:width:height:", [v32 pixelBuffer], Width, Height);

  [v44 setObject:v31 forKey:@"person"];
LABEL_33:

  return v44;
}

- (id)segmentationMaps:(__CVBuffer *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  char v14 = [(VGMLSegmentationModel *)self segmentationSurfaces:a3];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v14, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v14;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v8, v14);
        id v9 = (IOSurface *)objc_claimAutoreleasedReturnValue();
        CVPixelBufferRef CVPixelBufferFromIOSurface = createCVPixelBufferFromIOSurface(v9);

        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __42__VGMLSegmentationModel_segmentationMaps___block_invoke;
        v15[3] = &__block_descriptor_40_e5_v8__0l;
        v15[4] = CVPixelBufferFromIOSurface;
        uint64_t v11 = (void (**)(void))MEMORY[0x261227FC0](v15);
        id v12 = [[VGMLImageIOData alloc] initWithCVPixelBufferRef:CVPixelBufferFromIOSurface];
        [v3 setObject:v12 forKey:v8];

        v11[2](v11);
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v3;
}

void __42__VGMLSegmentationModel_segmentationMaps___block_invoke(uint64_t a1)
{
}

- (void).cxx_destruct
{
}

@end