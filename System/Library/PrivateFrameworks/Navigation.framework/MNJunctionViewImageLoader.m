@interface MNJunctionViewImageLoader
- (MNJunctionViewImageLoader)init;
- (id)_imagesForRequest:(id)a3 response:(id)a4;
- (id)_stringForImageIDs:(id)a3;
- (void)_imagesForIDs:(id)a3 handler:(id)a4;
- (void)imagesForJunctionView:(id)a3 eventID:(id)a4 handler:(id)a5;
- (void)setJunctionViewEvents:(id)a3;
- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4;
- (void)updateForLocation:(id)a3 remainingDistanceOnRoute:(double)a4;
@end

@implementation MNJunctionViewImageLoader

- (MNJunctionViewImageLoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNJunctionViewImageLoader;
  v2 = [(MNJunctionViewImageLoader *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F64860] sharedPlatform];
    v2->_imageWidth = (double)[v3 deviceScreenWidthInPixels];
    v2->_imageHeight = (double)[v3 deviceScreenHeightInPixels];
    v4 = v2;
  }
  return v2;
}

- (void)setJunctionViewEvents:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ([v10 hasJunctionView])
        {
          [v10 startValidDistance];
          if (v11 > 0.0)
          {
            v12 = objc_alloc_init(_MNJunctionViewPreloadEvent);
            [(_MNJunctionViewPreloadEvent *)v12 setJunctionViewEvent:v10];
            [(_MNJunctionViewPreloadEvent *)v12 setNeedsPreload:1];
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v7);
  }

  [v4 sortUsingComparator:&__block_literal_global_17];
  p_preloadEvents = &self->_preloadEvents;
  objc_storeStrong((id *)&self->_preloadEvents, v4);
  v14 = GEOFindOrCreateLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

  if (v15)
  {
    id v30 = v5;
    v31 = v4;
    v16 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"Setting %d event(s) to preload:\n", -[NSArray count](*p_preloadEvents, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = *p_preloadEvents;
    uint64_t v17 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v33 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v36 != v33) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          v21 = [v20 junctionViewEvent];
          v22 = [v21 uniqueID];
          [v21 startValidDistance];
          uint64_t v24 = v23;
          v25 = [v21 junctionView];
          v26 = [v25 imageIds];
          v27 = [(MNJunctionViewImageLoader *)self _stringForImageIDs:v26];
          [v16 appendFormat:@"\t%@ | startDistance: %0.1f | images: (%@)", v22, v24, v27];

          v28 = [(NSArray *)self->_preloadEvents lastObject];

          if (v20 != v28) {
            [v16 appendFormat:@"\n"];
          }
        }
        uint64_t v18 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v18);
    }

    v29 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v16;
      _os_log_impl(&dword_1B542B000, v29, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }

    id v5 = v30;
    v4 = v31;
  }
}

uint64_t __51__MNJunctionViewImageLoader_setJunctionViewEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [a2 junctionViewEvent];
  [v6 startValidDistance];
  uint64_t v7 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v8 = NSNumber;
  v9 = [v5 junctionViewEvent];

  [v9 startValidDistance];
  v10 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

- (void)setJunctionViewImageWidth:(double)a3 height:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (vabdd_f64(self->_imageWidth, a3) >= 0.000001 || vabdd_f64(self->_imageHeight, a4) >= 0.000001)
  {
    self->_imageWidth = a3;
    self->_imageHeight = a4;
    uint64_t v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      double v19 = a3;
      __int16 v20 = 2048;
      double v21 = a4;
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_INFO, "Setting desired junction view image size to [%g x %g]", buf, 0x16u);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = self->_preloadEvents;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setNeedsPreload:", 1, (void)v13);
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)updateForLocation:(id)a3 remainingDistanceOnRoute:(double)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  GEOConfigGetDouble();
  double v7 = v6;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = self->_preloadEvents;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v24;
    *(void *)&long long v10 = 134218240;
    long long v22 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v14, "needsPreload", v22, (void)v23))
        {
          long long v15 = [v14 junctionViewEvent];
          [v15 endValidDistance];
          if (v16 > a4) {
            goto LABEL_12;
          }
          [v15 startValidDistance];
          double v18 = v7 + v17;
          if (v7 + v17 >= a4)
          {
            double v19 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v22;
              double v28 = a4;
              __int16 v29 = 2048;
              double v30 = v18;
              _os_log_impl(&dword_1B542B000, v19, OS_LOG_TYPE_INFO, "Preloading junction view images | remainingDistance: %0.1f | preloadDistance: %0.1f", buf, 0x16u);
            }

            __int16 v20 = [v15 junctionView];
            double v21 = [v15 uniqueID];
            [(MNJunctionViewImageLoader *)self imagesForJunctionView:v20 eventID:v21 handler:0];

LABEL_12:
            [v14 setNeedsPreload:0];
          }

          continue;
        }
      }
      uint64_t v11 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v11);
  }
}

- (void)imagesForJunctionView:(id)a3 eventID:(id)a4 handler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  long long v10 = [a3 imageIds];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__MNJunctionViewImageLoader_imagesForJunctionView_eventID_handler___block_invoke;
  v13[3] = &unk_1E60F79E0;
  id v14 = v8;
  id v15 = v9;
  id v11 = v8;
  id v12 = v9;
  [(MNJunctionViewImageLoader *)self _imagesForIDs:v10 handler:v13];
}

void __67__MNJunctionViewImageLoader_imagesForJunctionView_eventID_handler___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    id v3 = a2;
    v4 = [[MNGuidanceJunctionViewInfo alloc] initWithID:*(void *)(a1 + 32) images:v3];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_imagesForIDs:(id)a3 handler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F645E8]);
  id v9 = (void *)[v6 mutableCopy];
  [v8 setImageIds:v9];

  [v8 setWidth:self->_imageWidth];
  [v8 setHeight:self->_imageHeight];
  objc_initWeak(&location, self);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __51__MNJunctionViewImageLoader__imagesForIDs_handler___block_invoke;
  v27[3] = &unk_1E60F7A08;
  objc_copyWeak(&v30, &location);
  id v10 = v8;
  id v28 = v10;
  id v11 = v7;
  id v29 = v11;
  id v12 = (void *)MEMORY[0x1BA99B3A0](v27);
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  long long v24 = __51__MNJunctionViewImageLoader__imagesForIDs_handler___block_invoke_2;
  long long v25 = &unk_1E60F7A30;
  id v13 = v10;
  id v26 = v13;
  id v14 = (void *)MEMORY[0x1BA99B3A0](&v22);
  GEOFindOrCreateLog();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = [v13 width];
    int v17 = [v13 height];
    double v18 = [(MNJunctionViewImageLoader *)self _stringForImageIDs:v6];
    *(_DWORD *)buf = 134218754;
    id v33 = v13;
    __int16 v34 = 1024;
    int v35 = v16;
    __int16 v36 = 1024;
    int v37 = v17;
    __int16 v38 = 2112;
    long long v39 = v18;
    _os_log_impl(&dword_1B542B000, v15, OS_LOG_TYPE_INFO, "Requesting junction view images (%p) [%u x %u] for IDs: %@", buf, 0x22u);
  }
  double v19 = [MEMORY[0x1E4F645F0] sharedRequester];
  uint64_t v20 = MEMORY[0x1E4F14428];
  id v21 = MEMORY[0x1E4F14428];
  objc_msgSend(v19, "startImageServiceRequest:auditToken:throttleToken:queue:finished:networkActivity:error:", v13, 0, 0, v20, v12, 0, v14, v22, v23, v24, v25);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __51__MNJunctionViewImageLoader__imagesForIDs_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v7 = [WeakRetained _imagesForRequest:*(void *)(a1 + 32) response:v4];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
  }
}

void __51__MNJunctionViewImageLoader__imagesForIDs_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218243;
    uint64_t v7 = v5;
    __int16 v8 = 2113;
    id v9 = v3;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "Error requesting junction images for request (%p): %{private}@", (uint8_t *)&v6, 0x16u);
  }
}

- (id)_imagesForRequest:(id)a3 response:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "imagesCount"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  __int16 v8 = [v6 images];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v14 = [v13 imageId];
        [v7 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v10);
  }

  uint64_t v32 = v6;
  id v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "imagesCount"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v33 = v5;
  int v16 = [v5 imageIds];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        uint64_t v22 = [v7 objectForKeyedSubscript:v21];
        if (v22)
        {
          uint64_t v23 = objc_alloc_init(MNGuidanceJunctionViewImage);
          long long v24 = [v22 imageId];
          -[MNGuidanceJunctionViewImage setImageID:](v23, "setImageID:", objc_msgSend(v24, "_navigation_unsignedIntegerValue"));

          long long v25 = [v22 image];
          [(MNGuidanceJunctionViewImage *)v23 setImageData:v25];

          [v15 addObject:v23];
        }
        else
        {
          GEOFindOrCreateLog();
          uint64_t v23 = (MNGuidanceJunctionViewImage *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = objc_msgSend(v21, "_navigation_unsignedIntegerValue");
            *(_DWORD *)buf = 134217984;
            uint64_t v43 = v26;
            _os_log_impl(&dword_1B542B000, &v23->super, OS_LOG_TYPE_ERROR, "Requested junction view image (%llu) was not found in response", buf, 0xCu);
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v18);
  }

  v27 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v28 = [v33 imageIds];
    id v29 = [(MNJunctionViewImageLoader *)self _stringForImageIDs:v28];
    *(_DWORD *)buf = 134218242;
    uint64_t v43 = (uint64_t)v33;
    __int16 v44 = 2112;
    v45 = v29;
    _os_log_impl(&dword_1B542B000, v27, OS_LOG_TYPE_INFO, "Received junction view images (%p) for IDs: %@", buf, 0x16u);
  }
  return v15;
}

- (id)_stringForImageIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] string];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v5 firstObject];
        if (v10 == v11) {
          id v12 = @"%llu";
        }
        else {
          id v12 = @", %llu";
        }
        id v13 = v12;

        objc_msgSend(v4, "appendFormat:", v13, objc_msgSend(v10, "_navigation_unsignedIntegerValue"));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end