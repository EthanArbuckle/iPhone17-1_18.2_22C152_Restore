@interface PIParallaxCompoundLayerStackRequest
- (BOOL)isSettlingEffectEnabled;
- (BOOL)updateClockAreaLuminance;
- (BOOL)updateClockZPosition;
- (BOOL)updateInactiveFrame;
- (PFPosterLayout)layout;
- (PIParallaxCompoundLayerStackRequest)initWithComposition:(id)a3;
- (PIParallaxCompoundLayerStackRequest)initWithSegmentationItem:(id)a3;
- (PIParallaxStyle)style;
- (PISegmentationItem)segmentationItem;
- (id)_responseWithCompoundLayerStack:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)effectiveLayout;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (unint64_t)layerStackOptions;
- (void)_chooseLayoutForOrientation:(int64_t)a3 completion:(id)a4;
- (void)_generateLayerStackForOrientation:(int64_t)a3 completion:(id)a4;
- (void)_recordError:(id)a3;
- (void)_recordResult:(id)a3;
- (void)_submit:(id)a3;
- (void)_submitClockMaterialRequestWithLayerStack:(id)a3 completion:(id)a4;
- (void)_submitClockOverlapRequestWithLayout:(id)a3 completion:(id)a4;
- (void)_submitInactiveLayoutRequestWithOrientedLayout:(id)a3 completion:(id)a4;
- (void)_submitLayerStackRequestForMode:(int64_t)a3 layout:(id)a4 completion:(id)a5;
- (void)_submitLayerStackRequestsWithLayout:(id)a3 orientation:(int64_t)a4 completion:(id)a5;
- (void)cancel;
- (void)setLayerStackOptions:(unint64_t)a3;
- (void)setLayout:(id)a3;
- (void)setSettlingEffectEnabled:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setUpdateClockAreaLuminance:(BOOL)a3;
- (void)setUpdateClockZPosition:(BOOL)a3;
- (void)setUpdateInactiveFrame:(BOOL)a3;
- (void)submit:(id)a3;
@end

@implementation PIParallaxCompoundLayerStackRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

- (void)setUpdateClockAreaLuminance:(BOOL)a3
{
  self->_updateClockAreaLuminance = a3;
}

- (BOOL)updateClockAreaLuminance
{
  return self->_updateClockAreaLuminance;
}

- (void)setUpdateClockZPosition:(BOOL)a3
{
  self->_updateClockZPosition = a3;
}

- (BOOL)updateClockZPosition
{
  return self->_updateClockZPosition;
}

- (void)setUpdateInactiveFrame:(BOOL)a3
{
  self->_updateInactiveFrame = a3;
}

- (BOOL)updateInactiveFrame
{
  return self->_updateInactiveFrame;
}

- (void)setSettlingEffectEnabled:(BOOL)a3
{
  self->_settlingEffectEnabled = a3;
}

- (BOOL)isSettlingEffectEnabled
{
  return self->_settlingEffectEnabled;
}

- (void)setLayerStackOptions:(unint64_t)a3
{
  self->_layerStackOptions = a3;
}

- (unint64_t)layerStackOptions
{
  return self->_layerStackOptions;
}

- (void)setLayout:(id)a3
{
}

- (PFPosterLayout)layout
{
  return self->_layout;
}

- (void)setStyle:(id)a3
{
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)cancel
{
  id v2 = [(NURenderRequest *)self renderContext];
  [v2 cancelAllRequests];
}

- (id)_responseWithCompoundLayerStack:(id)a3
{
  id v4 = a3;
  if (self->_error)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithError:self->_error];
  }
  else
  {
    v6 = objc_alloc_init(_PIParallaxCompoundLayerStackResult);
    [(_PIParallaxCompoundLayerStackResult *)v6 setCompoundLayerStack:v4];
    if ([(NSMutableArray *)self->_results count])
    {
      v7 = PFMap();
      v8 = [MEMORY[0x1E4F7A608] aggregateStatistics:v7];
      [(_NURenderResult *)v6 setStatistics:v8];
    }
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A660]) initWithResult:v6];
  }
  return v5;
}

uint64_t __71__PIParallaxCompoundLayerStackRequest__responseWithCompoundLayerStack___block_invoke(uint64_t a1, void *a2)
{
  return [a2 statistics];
}

- (void)_recordError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_error)
  {
    objc_storeStrong((id *)&self->_error, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = self->_requests;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "renderContext", (void)v12);
          [v11 cancelAllRequests];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (void)_recordResult:(id)a3
{
}

- (void)_submitLayerStackRequestForMode:(int64_t)a3 layout:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [PIParallaxLayerStackRequest alloc];
  v11 = [(PIParallaxCompoundLayerStackRequest *)self segmentationItem];
  long long v12 = [(PIParallaxLayerStackRequest *)v10 initWithSegmentationItem:v11];

  long long v13 = [(NURenderRequest *)self priority];
  [(NURenderRequest *)v12 setPriority:v13];

  long long v14 = [(NURenderRequest *)self responseQueue];
  [(NURenderRequest *)v12 setResponseQueue:v14];

  long long v15 = [(PIParallaxCompoundLayerStackRequest *)self style];
  [(PIParallaxLayerStackRequest *)v12 setStyle:v15];

  [(PIParallaxLayerStackRequest *)v12 setLayout:v9];
  [(PIParallaxLayerStackRequest *)v12 setLayerStackMode:a3];
  [(PIParallaxLayerStackRequest *)v12 setSettlingEffectEnabled:[(PIParallaxCompoundLayerStackRequest *)self isSettlingEffectEnabled]];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __89__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestForMode_layout_completion___block_invoke;
  v20 = &unk_1E5D81798;
  v21 = self;
  id v22 = v8;
  id v16 = v8;
  [(PIParallaxLayerStackRequest *)v12 submit:&v17];
  -[NSMutableArray addObject:](self->_requests, "addObject:", v12, v17, v18, v19, v20, v21);
}

void __89__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestForMode_layout_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v3 = [a2 result:&v8];
  id v4 = v8;
  if (v3)
  {
    [*(id *)(a1 + 32) _recordResult:v3];
    uint64_t v5 = *(void *)(a1 + 40);
    v6 = [v3 layerStack];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_130);
    }
    uint64_t v7 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Failed to render layer stack, error: %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _recordError:v4];
  }
}

- (void)_submitClockMaterialRequestWithLayerStack:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(PIParallaxCompoundLayerStackRequest *)self updateClockAreaLuminance];
  if (v6 && v8 && !self->_error)
  {
    id v9 = [[PIParallaxClockMaterialRequest alloc] initWithLayerStack:v6];
    id v10 = [(NURenderRequest *)self priority];
    [(NURenderRequest *)v9 setPriority:v10];

    uint64_t v11 = [(NURenderRequest *)self responseQueue];
    [(NURenderRequest *)v9 setResponseQueue:v11];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__PIParallaxCompoundLayerStackRequest__submitClockMaterialRequestWithLayerStack_completion___block_invoke;
    v12[3] = &unk_1E5D81180;
    id v13 = v6;
    long long v14 = self;
    id v15 = v7;
    [(PIParallaxClockMaterialRequest *)v9 submit:v12];
    [(NSMutableArray *)self->_requests addObject:v9];
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }
}

void __92__PIParallaxCompoundLayerStackRequest__submitClockMaterialRequestWithLayerStack_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  v3 = [a2 result:&v8];
  id v4 = v8;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    [v3 clockAreaLuminance];
    id v6 = objc_msgSend(v5, "layerStackByUpdatingClockAreaLuminance:");
    [*(id *)(a1 + 40) _recordResult:v3];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_130);
    }
    id v7 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Failed to compute clock material: %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 40) _recordError:v4];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_submitClockOverlapRequestWithLayout:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PIParallaxCompoundLayerStackRequest *)self updateClockZPosition])
  {
    id v8 = [PIParallaxClockLayoutRequest alloc];
    id v9 = [(PIParallaxCompoundLayerStackRequest *)self segmentationItem];
    id v10 = [(PIParallaxClockLayoutRequest *)v8 initWithSegmentationItem:v9];

    [(PIParallaxClockLayoutRequest *)v10 setLayout:v6];
    uint64_t v11 = [(NURenderRequest *)self priority];
    [(NURenderRequest *)v10 setPriority:v11];

    long long v12 = [(NURenderRequest *)self responseQueue];
    [(NURenderRequest *)v10 setResponseQueue:v12];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__PIParallaxCompoundLayerStackRequest__submitClockOverlapRequestWithLayout_completion___block_invoke;
    v14[3] = &unk_1E5D81180;
    v14[4] = self;
    id v16 = v7;
    id v15 = v6;
    [(PIParallaxClockLayoutRequest *)v10 submit:v14];
    [(NSMutableArray *)self->_requests addObject:v10];
  }
  else
  {
    id v13 = [v6 clockLayerOrder];
    (*((void (**)(id, void *, uint64_t))v7 + 2))(v7, v13, [v6 clockIntersection]);
  }
}

void __87__PIParallaxCompoundLayerStackRequest__submitClockOverlapRequestWithLayout_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  v3 = [a2 result:&v9];
  id v4 = v9;
  if (v3)
  {
    [*(id *)(a1 + 32) _recordResult:v3];
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [v3 clockLayerOrder];
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, [v3 clockIntersection]);
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_130);
    }
    id v7 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v4;
      _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Failed to compute clock overlap: %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _recordError:v4];
    uint64_t v8 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 40) clockLayerOrder];
    (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))(v8, v6, [*(id *)(a1 + 40) clockIntersection]);
  }
}

- (void)_submitInactiveLayoutRequestWithOrientedLayout:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PIParallaxCompoundLayerStackRequest *)self updateInactiveFrame])
  {
    uint64_t v8 = [PIPosterInactiveFrameLayoutRequest alloc];
    id v9 = [(PIParallaxCompoundLayerStackRequest *)self segmentationItem];
    id v10 = [(PIPosterInactiveFrameLayoutRequest *)v8 initWithSegmentationItem:v9];

    [(PIPosterInactiveFrameLayoutRequest *)v10 setLayout:v6];
    id v11 = [(NURenderRequest *)self priority];
    [(NURenderRequest *)v10 setPriority:v11];

    uint64_t v12 = [(NURenderRequest *)self responseQueue];
    [(NURenderRequest *)v10 setResponseQueue:v12];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __97__PIParallaxCompoundLayerStackRequest__submitInactiveLayoutRequestWithOrientedLayout_completion___block_invoke;
    v14[3] = &unk_1E5D81180;
    v14[4] = self;
    id v15 = v10;
    id v16 = v7;
    id v13 = v10;
    [(PIPosterInactiveFrameLayoutRequest *)v13 submit:v14];
    [(NSMutableArray *)self->_requests addObject:v13];
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }
}

void __97__PIParallaxCompoundLayerStackRequest__submitInactiveLayoutRequestWithOrientedLayout_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  v3 = [a2 result:&v10];
  id v4 = v10;
  if (v3)
  {
    [*(id *)(a1 + 32) _recordResult:v3];
    uint64_t v5 = [*(id *)(a1 + 40) layout];
    [v3 inactiveRect];
    id v6 = objc_msgSend(v5, "layoutByUpdatingInactiveFrame:");

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_130);
    }
    uint64_t v8 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = v4;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Failed to update layout: %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _recordError:v4];
    uint64_t v9 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 40) layout];
    id v7 = *(void (**)(void))(v9 + 16);
  }
  v7();
}

- (void)_chooseLayoutForOrientation:(int64_t)a3 completion:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void *))a4;
  if (a3 == 1)
  {
    id v15 = [(PIParallaxCompoundLayerStackRequest *)self effectiveLayout];
    uint64_t v16 = [v15 portraitLayout];
    goto LABEL_11;
  }
  if (a3 == 2)
  {
    id v15 = [(PIParallaxCompoundLayerStackRequest *)self effectiveLayout];
    uint64_t v16 = [v15 landscapeLayout];
LABEL_11:
    uint64_t v17 = (PIPosterLayoutRequest *)v16;

    if (v17)
    {
      v6[2](v6, v17);
LABEL_14:

      return;
    }
LABEL_13:
    uint64_t v18 = [PIPosterLayoutRequest alloc];
    v19 = [(PIParallaxCompoundLayerStackRequest *)self segmentationItem];
    v20 = [v19 composition];
    uint64_t v17 = [(PIPosterLayoutRequest *)v18 initWithComposition:v20];

    v21 = [MEMORY[0x1E4F8CE48] deviceConfiguration];
    [(PIPosterLayoutRequest *)v17 setLayoutConfiguration:v21];

    id v22 = [(PIParallaxCompoundLayerStackRequest *)self segmentationItem];
    v23 = [v22 regions];
    [(PIPosterLayoutRequest *)v17 setLayoutRegions:v23];

    v24 = [(PIParallaxCompoundLayerStackRequest *)self segmentationItem];
    v25 = [v24 segmentationMatte];
    [(PIPosterLayoutRequest *)v17 setSegmentationMatte:v25];

    v26 = [(PIParallaxCompoundLayerStackRequest *)self segmentationItem];
    v27 = [v26 segmentationConfidenceMap];
    [(PIPosterLayoutRequest *)v17 setSegmentationConfidenceMap:v27];

    v28 = [(PIParallaxCompoundLayerStackRequest *)self segmentationItem];
    -[PIPosterLayoutRequest setSegmentationClassification:](v17, "setSegmentationClassification:", [v28 classification]);

    v29 = [(NURenderRequest *)self responseQueue];
    [(NURenderRequest *)v17 setResponseQueue:v29];

    v30 = [(NURenderRequest *)self renderContext];
    [(NURenderRequest *)v17 setRenderContext:v30];

    v31 = [(NURenderRequest *)self priority];
    [(NURenderRequest *)v17 setPriority:v31];

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __78__PIParallaxCompoundLayerStackRequest__chooseLayoutForOrientation_completion___block_invoke;
    v37[3] = &unk_1E5D7F850;
    int64_t v39 = a3;
    v37[4] = self;
    v38 = v6;
    [(PIPosterLayoutRequest *)v17 submit:v37];

    goto LABEL_14;
  }
  if (a3) {
    goto LABEL_13;
  }
  id v7 = NUAssertLogger_8370();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = [NSString stringWithFormat:@"Unknown orientation"];
    *(_DWORD *)buf = 138543362;
    v41 = v8;
    _os_log_error_impl(&dword_1A9680000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  uint64_t v9 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  id v11 = NUAssertLogger_8370();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v12)
    {
      v32 = dispatch_get_specific(*v9);
      v33 = (void *)MEMORY[0x1E4F29060];
      id v34 = v32;
      v35 = [v33 callStackSymbols];
      v36 = [v35 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v41 = v32;
      __int16 v42 = 2114;
      v43 = v36;
      _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F29060] callStackSymbols];
    long long v14 = [v13 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v41 = v14;
    _os_log_error_impl(&dword_1A9680000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  _NUAssertFailHandler();
  NUAssertLogger_8370();
}

void __78__PIParallaxCompoundLayerStackRequest__chooseLayoutForOrientation_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_130);
  }
  uint64_t v5 = (os_log_t *)MEMORY[0x1E4F7A758];
  id v6 = *MEMORY[0x1E4F7A758];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v30 = v3;
    _os_log_impl(&dword_1A9680000, v6, OS_LOG_TYPE_DEFAULT, "Poster original layout response: %{public}@", buf, 0xCu);
  }
  id v28 = 0;
  id v7 = [v3 result:&v28];
  id v8 = v28;
  if (!v7)
  {
    if (*v4 != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_130);
    }
    uint64_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v30 = v8;
      _os_log_error_impl(&dword_1A9680000, v18, OS_LOG_TYPE_ERROR, "Failed to request layout for item: %{public}@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _recordError:v8];
    goto LABEL_22;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9 == 1)
  {
    uint64_t v19 = *(void *)(a1 + 40);
    v20 = [v7 layout];
    uint64_t v21 = [v20 portraitLayout];
LABEL_21:
    id v22 = (void *)v21;
    (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, v21);

    goto LABEL_22;
  }
  if (v9 == 2)
  {
    uint64_t v19 = *(void *)(a1 + 40);
    v20 = [v7 layout];
    uint64_t v21 = [v20 landscapeLayout];
    goto LABEL_21;
  }
  if (v9)
  {
LABEL_22:

    return;
  }
  id v10 = NUAssertLogger_8370();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = [NSString stringWithFormat:@"Unknown orientation"];
    *(_DWORD *)buf = 138543362;
    id v30 = v11;
    _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
  }
  BOOL v12 = (const void **)MEMORY[0x1E4F7A308];
  specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
  long long v14 = NUAssertLogger_8370();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (specific)
  {
    if (v15)
    {
      v23 = dispatch_get_specific(*v12);
      v24 = (void *)MEMORY[0x1E4F29060];
      id v25 = v23;
      v26 = [v24 callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v30 = v23;
      __int16 v31 = 2114;
      v32 = v27;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
    }
  }
  else if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    id v30 = v17;
    _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
  }
  _NUAssertFailHandler();
  __NUAssertLogger_block_invoke_8393();
}

- (void)_generateLayerStackForOrientation:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke;
  v8[3] = &unk_1E5D7F828;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PIParallaxCompoundLayerStackRequest *)self _chooseLayoutForOrientation:a3 completion:v8];
}

void __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_2;
  v4[3] = &unk_1E5D7F828;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  [v3 _submitInactiveLayoutRequestWithOrientedLayout:a2 completion:v4];
}

void __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_3;
  v6[3] = &unk_1E5D7F800;
  id v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _submitClockOverlapRequestWithLayout:v5 completion:v6];
}

void __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) layoutByUpdatingClockLayerOrder:a2];
  id v6 = [v5 layoutByUpdatingClockIntersection:a3];

  id v7 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_4;
  v8[3] = &unk_1E5D7F7D8;
  v8[4] = v7;
  id v9 = *(id *)(a1 + 48);
  [v7 _submitLayerStackRequestsWithLayout:v6 orientation:1 completion:v8];
}

void __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_5;
  v4[3] = &unk_1E5D7F7B0;
  id v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 _submitClockMaterialRequestWithLayerStack:a2 completion:v4];
}

uint64_t __84__PIParallaxCompoundLayerStackRequest__generateLayerStackForOrientation_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)effectiveLayout
{
  id v3 = [(PIParallaxCompoundLayerStackRequest *)self layout];
  if (!v3)
  {
    if (![(PIParallaxCompoundLayerStackRequest *)self isSettlingEffectEnabled]
      || ([(PIParallaxCompoundLayerStackRequest *)self segmentationItem],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v4 settlingEffectLayout],
          id v3 = objc_claimAutoreleasedReturnValue(),
          v4,
          !v3))
    {
      id v5 = [(PIParallaxCompoundLayerStackRequest *)self segmentationItem];
      id v3 = [v5 originalLayout];
    }
  }
  return v3;
}

- (void)_submitLayerStackRequestsWithLayout:(id)a3 orientation:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [MEMORY[0x1E4F7A648] begin];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__8398;
  v19[4] = __Block_byref_object_dispose__8399;
  id v20 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestsWithLayout_orientation_completion___block_invoke;
  v18[3] = &unk_1E5D7F760;
  v18[4] = v19;
  id v10 = (void *)MEMORY[0x1AD0F8FE0](v18);
  if (a4 == 2)
  {
    if (([(PIParallaxCompoundLayerStackRequest *)self layerStackOptions] & 0x20) != 0) {
      [(PIParallaxCompoundLayerStackRequest *)self _submitLayerStackRequestForMode:1 layout:v8 completion:v10];
    }
    if (([(PIParallaxCompoundLayerStackRequest *)self layerStackOptions] & 0x80) != 0)
    {
      uint64_t v11 = 5;
      goto LABEL_13;
    }
  }
  else if (a4 == 1)
  {
    if ([(PIParallaxCompoundLayerStackRequest *)self layerStackOptions]) {
      [(PIParallaxCompoundLayerStackRequest *)self _submitLayerStackRequestForMode:0 layout:v8 completion:v10];
    }
    if (([(PIParallaxCompoundLayerStackRequest *)self layerStackOptions] & 8) != 0) {
      [(PIParallaxCompoundLayerStackRequest *)self _submitLayerStackRequestForMode:4 layout:v8 completion:v10];
    }
    if (([(PIParallaxCompoundLayerStackRequest *)self layerStackOptions] & 0x40) != 0)
    {
      uint64_t v11 = 7;
LABEL_13:
      [(PIParallaxCompoundLayerStackRequest *)self _submitLayerStackRequestForMode:v11 layout:v8 completion:v10];
    }
  }
  if (([(PIParallaxCompoundLayerStackRequest *)self layerStackOptions] & 2) != 0) {
    [(PIParallaxCompoundLayerStackRequest *)self _submitLayerStackRequestForMode:2 layout:v8 completion:v10];
  }
  if (([(PIParallaxCompoundLayerStackRequest *)self layerStackOptions] & 4) != 0) {
    [(PIParallaxCompoundLayerStackRequest *)self _submitLayerStackRequestForMode:3 layout:v8 completion:v10];
  }
  if (([(PIParallaxCompoundLayerStackRequest *)self layerStackOptions] & 0x10) != 0) {
    [(PIParallaxCompoundLayerStackRequest *)self _submitLayerStackRequestForMode:6 layout:v8 completion:v10];
  }
  BOOL v12 = (void *)MEMORY[0x1E4F7A648];
  uint64_t v13 = [(NURenderRequest *)self responseQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestsWithLayout_orientation_completion___block_invoke_2;
  v15[3] = &unk_1E5D7F788;
  id v14 = v9;
  id v16 = v14;
  uint64_t v17 = v19;
  [v12 commitAndNotifyOnQueue:v13 withBlock:v15];

  _Block_object_dispose(v19, 8);
}

void __98__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestsWithLayout_orientation_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  id v11 = v3;
  if (v5)
  {
    id v6 = [v3 layers];
    [v11 size];
    uint64_t v7 = objc_msgSend(v5, "layerStackByUpdatingLayers:imageSize:", v6);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    id v10 = v3;
    id v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v10;
  }
}

uint64_t __98__PIParallaxCompoundLayerStackRequest__submitLayerStackRequestsWithLayout_orientation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)_submit:(id)a3
{
  id v4 = a3;
  id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  requests = self->_requests;
  self->_requests = v5;

  uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  results = self->_results;
  self->_results = v7;

  error = self->_error;
  self->_error = 0;

  id v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__8398;
  v26[4] = __Block_byref_object_dispose__8399;
  id v27 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke;
  v23[3] = &unk_1E5D7F710;
  id v25 = v26;
  id v11 = v10;
  v24 = v11;
  [(PIParallaxCompoundLayerStackRequest *)self _generateLayerStackForOrientation:1 completion:v23];
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__8398;
  v21[4] = __Block_byref_object_dispose__8399;
  id v22 = 0;
  if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration])
  {
    dispatch_group_enter(v11);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke_2;
    v18[3] = &unk_1E5D7F710;
    id v20 = v21;
    uint64_t v19 = v11;
    [(PIParallaxCompoundLayerStackRequest *)self _generateLayerStackForOrientation:2 completion:v18];
  }
  BOOL v12 = [(NURenderRequest *)self responseQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke_3;
  v14[3] = &unk_1E5D7F738;
  id v16 = v21;
  uint64_t v17 = v26;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_group_notify(v11, v12, v14);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v26, 8);
}

void __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __47__PIParallaxCompoundLayerStackRequest__submit___block_invoke_3(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) settlingEffectLayer];
    id v3 = (void *)v2;
    if (v2)
    {
      id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v16[0] = v2;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) size];
      uint64_t v6 = objc_msgSend(v4, "layerStackByUpdatingLayers:imageSize:", v5);
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F8CE50]) initWithPortraitLayerStack:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) landscapeLayerStack:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [*(id *)(a1 + 32) _responseWithCompoundLayerStack:v9];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);
  }
  else
  {
    id v13 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v15 = (id)[objc_alloc(MEMORY[0x1E4F8CE50]) initWithPortraitLayerStack:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) landscapeLayerStack:0];
    id v14 = objc_msgSend(v13, "_responseWithCompoundLayerStack:");
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);
  }
}

- (void)submit:(id)a3
{
  id v4 = a3;
  id v5 = (id)[(PIParallaxCompoundLayerStackRequest *)self copy];
  [v5 _submit:v4];
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (id)newRenderJob
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    id v3 = (os_log_t *)MEMORY[0x1E4F7A748];
    id v4 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      id v5 = NSString;
      uint64_t v6 = v4;
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      id v9 = [v5 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v8];
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_error_impl(&dword_1A9680000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v10 = *v2;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v10 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_128_8390);
        }
LABEL_7:
        os_log_t v11 = *v3;
        if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = (void *)MEMORY[0x1E4F29060];
          id v13 = v11;
          id v14 = [v12 callStackSymbols];
          id v15 = [v14 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_128_8390);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v16 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      uint64_t v18 = (void *)MEMORY[0x1E4F29060];
      id v19 = specific;
      id v13 = v16;
      id v20 = [v18 callStackSymbols];
      uint64_t v2 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v23 = specific;
      __int16 v24 = 2114;
      id v25 = v2;
      _os_log_error_impl(&dword_1A9680000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    uint64_t v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_128_8390);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PIParallaxCompoundLayerStackRequest;
  id v4 = [(NURenderRequest *)&v12 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(PIParallaxCompoundLayerStackRequest *)self segmentationItem];
    uint64_t v6 = (void *)v4[23];
    v4[23] = v5;

    uint64_t v7 = [(PIParallaxCompoundLayerStackRequest *)self layout];
    uint64_t v8 = (void *)v4[25];
    v4[25] = v7;

    uint64_t v9 = [(PIParallaxCompoundLayerStackRequest *)self style];
    uint64_t v10 = (void *)v4[24];
    v4[24] = v9;

    v4[26] = [(PIParallaxCompoundLayerStackRequest *)self layerStackOptions];
    *((unsigned char *)v4 + 177) = [(PIParallaxCompoundLayerStackRequest *)self updateInactiveFrame];
    *((unsigned char *)v4 + 178) = [(PIParallaxCompoundLayerStackRequest *)self updateClockZPosition];
    *((unsigned char *)v4 + 179) = [(PIParallaxCompoundLayerStackRequest *)self updateClockAreaLuminance];
    *((unsigned char *)v4 + 176) = [(PIParallaxCompoundLayerStackRequest *)self isSettlingEffectEnabled];
  }
  return v4;
}

- (PIParallaxCompoundLayerStackRequest)initWithComposition:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F7A750];
  if (*MEMORY[0x1E4F7A750] != -1) {
    goto LABEL_15;
  }
  while (1)
  {
    uint64_t v5 = (os_log_t *)MEMORY[0x1E4F7A748];
    uint64_t v6 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = NSString;
      uint64_t v8 = v6;
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      os_log_t v11 = [v7 stringWithFormat:@"This is an abstract method! Subclass '%@' should provide concrete implementation", v10];
      *(_DWORD *)buf = 138543362;
      id v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      uint64_t v12 = *v4;
      if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v12 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_128_8390);
        }
LABEL_7:
        os_log_t v13 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          id v14 = (void *)MEMORY[0x1E4F29060];
          id v15 = v13;
          os_log_t v16 = [v14 callStackSymbols];
          uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
          *(_DWORD *)buf = 138543362;
          id v25 = v17;
          _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v12 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_128_8390);
      }
    }
    else if (!dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
      goto LABEL_7;
    }
    os_log_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      id v20 = (void *)MEMORY[0x1E4F29060];
      id v21 = specific;
      id v15 = v18;
      id v22 = [v20 callStackSymbols];
      id v4 = [v22 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      id v25 = specific;
      __int16 v26 = 2114;
      id v27 = v4;
      _os_log_error_impl(&dword_1A9680000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_13;
    }
LABEL_14:
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler();
LABEL_15:
    dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_128_8390);
  }
}

- (PIParallaxCompoundLayerStackRequest)initWithSegmentationItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v10 = NUAssertLogger_8370();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      os_log_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "segmentationItem != nil");
      *(_DWORD *)buf = 138543362;
      id v25 = v11;
      _os_log_error_impl(&dword_1A9680000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    uint64_t v12 = (const void **)MEMORY[0x1E4F7A308];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
    id v14 = NUAssertLogger_8370();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        os_log_t v18 = dispatch_get_specific(*v12);
        id v19 = (void *)MEMORY[0x1E4F29060];
        id v20 = v18;
        id v21 = [v19 callStackSymbols];
        id v22 = [v21 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v25 = v18;
        __int16 v26 = 2114;
        id v27 = v22;
        _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v15)
    {
      os_log_t v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v25 = v17;
      _os_log_error_impl(&dword_1A9680000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler();
  }
  uint64_t v6 = v5;
  uint64_t v7 = [v5 composition];
  v23.receiver = self;
  v23.super_class = (Class)PIParallaxCompoundLayerStackRequest;
  uint64_t v8 = [(NURenderRequest *)&v23 initWithComposition:v7];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_segmentationItem, a3);
    v8->_layerStackOptions = 1;
  }

  return v8;
}

@end