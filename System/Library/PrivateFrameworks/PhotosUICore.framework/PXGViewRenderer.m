@interface PXGViewRenderer
- ($EDEBC7EA21717A15148E9A8A98906629)interactionState;
- (BOOL)lowMemoryMode;
- (BOOL)shouldSeparateViewLayers;
- (BOOL)wantsBGRATextures;
- (BOOL)wantsMipmaps;
- (BOOL)wantsToDriveRender;
- (CGRect)visibleRect;
- (PXGEntityManager)entityManager;
- (PXGRendererDelegate)delegate;
- (PXGTextureConverter)textureConverter;
- (PXGTungstenRecordingSession)recordingSession;
- (PXGViewRenderer)init;
- (PXScrollViewController)scrollViewController;
- (UIView)rootView;
- (__n128)cameraConfiguration;
- (__n128)setCameraConfiguration:(uint64_t)a3;
- (double)_screenScale;
- (id)_dequeueViewWithClass:(Class)a3;
- (id)renderSnapshotForRequest:(id *)a3 offscreenEffect:(id)a4;
- (id)test_renderSnapshotHandler;
- (id)trackingContainerViewForSpriteIndex:(unsigned int)a3;
- (id)viewForSpriteIndex:(unsigned int)a3;
- (unint64_t)destinationColorSpaceName;
- (unsigned)presentationType;
- (void)_configureTrackingContainerView:(id)a3 spriteIndex:(unsigned int)a4 sprites:(id *)a5 screenScale:(double)a6;
- (void)_ensureUnderlayHostingView;
- (void)_makeViewInfoReusable:(id)a3;
- (void)_resizeBuffersForSpriteCount:(int64_t)a3;
- (void)_shiftViewsToCompensateForDeferredVisibleOrigin;
- (void)dealloc;
- (void)releaseResources;
- (void)renderSpritesWithTextures:(id)a3 dataStore:(id)a4 presentationDataStore:(id)a5 presentationMetadataStore:(id)a6 layout:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setEntityManager:(id)a3;
- (void)setInteractionState:(id *)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setRecordingSession:(id)a3;
- (void)setRootView:(id)a3;
- (void)setScrollViewController:(id)a3;
- (void)setShouldSeparateViewLayers:(BOOL)a3;
- (void)setTest_renderSnapshotHandler:(id)a3;
- (void)setVisibleRect:(CGRect)a3;
- (void)updateWithChangeDetails:(id)a3;
@end

@implementation PXGViewRenderer

- (unsigned)presentationType
{
  return 1;
}

- (void)updateWithChangeDetails:(id)a3
{
  reusableViewInfoBySpriteIndex = self->_reusableViewInfoBySpriteIndex;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__PXGViewRenderer_updateWithChangeDetails___block_invoke;
  v9[3] = &unk_1E5DAFBF8;
  v9[4] = self;
  id v6 = a3;
  [v6 applyToDictionary:reusableViewInfoBySpriteIndex removalHandler:v9];
  trackingContainerViewInfoBySpriteIndex = self->_trackingContainerViewInfoBySpriteIndex;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PXGViewRenderer_updateWithChangeDetails___block_invoke_2;
  v8[3] = &unk_1E5DAFC20;
  v8[4] = self;
  v8[5] = a2;
  [v6 applyToDictionary:trackingContainerViewInfoBySpriteIndex removalHandler:v8];
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (void)setInteractionState:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var4;
  CGSize size = a3->var8.size;
  self->_interactionState.targetRect.origin = a3->var8.origin;
  self->_interactionState.targetRect.CGSize size = size;
  *(_OWORD *)&self->_interactionState.scrollRegime = v3;
  *(_OWORD *)&self->_interactionState.contentChangeTrend = v4;
}

- (__n128)setCameraConfiguration:(uint64_t)a3
{
  *(_OWORD *)(a1 + 112) = *(_OWORD *)a3;
  long long v3 = *(_OWORD *)(a3 + 16);
  long long v4 = *(_OWORD *)(a3 + 32);
  long long v5 = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(a1 + 176) = v5;
  *(_OWORD *)(a1 + 128) = v3;
  *(_OWORD *)(a1 + 144) = v4;
  long long v6 = *(_OWORD *)(a3 + 80);
  long long v7 = *(_OWORD *)(a3 + 96);
  long long v8 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(a1 + 240) = v8;
  *(_OWORD *)(a1 + 192) = v6;
  *(_OWORD *)(a1 + 208) = v7;
  __n128 result = *(__n128 *)(a3 + 144);
  long long v10 = *(_OWORD *)(a3 + 160);
  long long v11 = *(_OWORD *)(a3 + 192);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a3 + 176);
  *(_OWORD *)(a1 + 304) = v11;
  *(__n128 *)(a1 + 256) = result;
  *(_OWORD *)(a1 + 272) = v10;
  return result;
}

- (PXGTextureConverter)textureConverter
{
  return self->_textureConverter;
}

- (void)renderSpritesWithTextures:(id)a3 dataStore:(id)a4 presentationDataStore:(id)a5 presentationMetadataStore:(id)a6 layout:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  a7;
  v16 = [(PXGViewRenderer *)self recordingSession];

  if (v16)
  {
    v17 = [(PXGViewRenderer *)self recordingSession];
    [(PXGViewRenderer *)self visibleRect];
    double v19 = v18;
    double v21 = v20;
    [(PXGViewRenderer *)self visibleRect];
    double v23 = v22;
    double v25 = v24;
    [(PXGViewRenderer *)self _screenScale];
    v27 = +[PXGViewRecordingFrameStartEvent eventWithViewSize:renderOrigin:screenScale:](PXGViewRecordingFrameStartEvent, "eventWithViewSize:renderOrigin:screenScale:", v19, v21, v23, v25, v26);
    [v17 recordEvent:v27];
  }
  [(PXGViewRenderer *)self _screenScale];
  objc_storeStrong((id *)&self->_lastPresentationDataStore, a5);
  if (v13) {
    [v13 sprites];
  }
  if (v14) {
    [v14 sprites];
  }
  [v15 resizableCapInsets];
  [(PXGViewRenderer *)self visibleRect];
  self->_renderedVisibleOrigin.x = v28;
  self->_renderedVisibleOrigin.y = v29;
  PXEdgeInsetsInsetRect();
}

- (PXGTungstenRecordingSession)recordingSession
{
  return self->_recordingSession;
}

- (void)_shiftViewsToCompensateForDeferredVisibleOrigin
{
  if ([(PXScrollViewController *)self->_scrollViewController deferContentOffsetUpdates]) {
    PXPointIsNull();
  }
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (double)_screenScale
{
  v2 = [(PXScrollViewController *)self->_scrollViewController scrollView];
  objc_msgSend(v2, "px_screenScale");
  double v4 = v3;

  return v4;
}

- (void)setScrollViewController:(id)a3
{
  long long v5 = (PXScrollViewController *)a3;
  scrollViewController = self->_scrollViewController;
  if (scrollViewController != v5)
  {
    long long v7 = v5;
    [(PXScrollViewController *)scrollViewController unregisterObserver:self];
    objc_storeStrong((id *)&self->_scrollViewController, a3);
    [(PXScrollViewController *)self->_scrollViewController registerObserver:self];
    long long v5 = v7;
  }
}

- (void)setShouldSeparateViewLayers:(BOOL)a3
{
  self->_shouldSeparateViewLayers = a3;
}

- (void)setRootView:(id)a3
{
}

- (PXGViewRenderer)init
{
  v12.receiver = self;
  v12.super_class = (Class)PXGViewRenderer;
  v2 = [(PXGViewRenderer *)&v12 init];
  if (v2)
  {
    double v3 = objc_alloc_init(PXGViewTextureConverter);
    textureConverter = v2->_textureConverter;
    v2->_textureConverter = (PXGTextureConverter *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    reusableViewsByClass = v2->_reusableViewsByClass;
    v2->_reusableViewsByClass = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    reusableViewInfoBySpriteIndedouble x = v2->_reusableViewInfoBySpriteIndex;
    v2->_reusableViewInfoBySpriteIndedouble x = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    trackingContainerViewInfoBySpriteIndedouble x = v2->_trackingContainerViewInfoBySpriteIndex;
    v2->_trackingContainerViewInfoBySpriteIndedouble x = (NSMutableDictionary *)v9;

    v2->_renderedVisibleOrigin = *(CGPoint *)off_1E5DAB000;
    PXEdgeInsetsMake();
  }
  return 0;
}

- (BOOL)wantsToDriveRender
{
  return 0;
}

- (BOOL)wantsMipmaps
{
  return 0;
}

- (BOOL)wantsBGRATextures
{
  return 0;
}

- (void)setEntityManager:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)destinationColorSpaceName
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootView);
  objc_storeStrong((id *)&self->_recordingSession, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_textureConverter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_test_renderSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_storeStrong((id *)&self->_lastPresentationDataStore, 0);
  objc_destroyWeak((id *)&self->_underlayHostingView);
  objc_storeStrong((id *)&self->_trackingContainerViewInfoBySpriteIndex, 0);
  objc_storeStrong((id *)&self->_reusableViewInfoBySpriteIndex, 0);
  objc_storeStrong((id *)&self->_reusableViewsByClass, 0);
}

- (UIView)rootView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootView);
  return (UIView *)WeakRetained;
}

- (BOOL)shouldSeparateViewLayers
{
  return self->_shouldSeparateViewLayers;
}

- (void)setRecordingSession:(id)a3
{
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (__n128)cameraConfiguration
{
  long long v2 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 272);
  *(_OWORD *)(a2 + 176) = v2;
  *(_OWORD *)(a2 + 192) = *(_OWORD *)(a1 + 304);
  long long v3 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 240);
  *(_OWORD *)(a2 + 144) = v4;
  long long v5 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 48) = v5;
  long long v6 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 80) = v6;
  __n128 result = *(__n128 *)(a1 + 128);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 112);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

- ($EDEBC7EA21717A15148E9A8A98906629)interactionState
{
  long long v3 = *(_OWORD *)&self[6].var8.size.height;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[6].var8.origin.y;
  *(_OWORD *)&retstr->var4 = v3;
  CGSize v4 = *(CGSize *)&self[7].var5;
  retstr->var8.origin = *(CGPoint *)&self[7].var1;
  retstr->var8.CGSize size = v4;
  return self;
}

- (PXGRendererDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGRendererDelegate *)WeakRetained;
}

- (void)setTest_renderSnapshotHandler:(id)a3
{
}

- (id)test_renderSnapshotHandler
{
  return self->_test_renderSnapshotHandler;
}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

- (void)releaseResources
{
  [(PXGViewRenderer *)self interactionState];
  if (!v9)
  {
    long long v3 = [MEMORY[0x1E4F1CA48] array];
    reusableViewInfoBySpriteIndedouble x = self->_reusableViewInfoBySpriteIndex;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__PXGViewRenderer_releaseResources__block_invoke;
    v7[3] = &unk_1E5DAFD60;
    id v8 = v3;
    id v5 = v3;
    [(NSMutableDictionary *)reusableViewInfoBySpriteIndex enumerateKeysAndObjectsUsingBlock:v7];
    [(NSMutableDictionary *)self->_reusableViewInfoBySpriteIndex removeObjectsForKeys:v5];
    long long v6 = [(PXGViewRenderer *)self delegate];
    [v6 rendererNeedsUpdate:self];
  }
  [(NSMutableDictionary *)self->_reusableViewsByClass enumerateKeysAndObjectsUsingBlock:&__block_literal_global_10160];
  [(NSMutableDictionary *)self->_reusableViewsByClass removeAllObjects];
}

void __35__PXGViewRenderer_releaseResources__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  long long v6 = [v5 view];
  int v7 = [v6 canUnloadWhenInvisible];

  if (v7)
  {
    id v8 = [v5 view];
    objc_msgSend(v8, "pxg_removeFromSuperview");

    [*(id *)(a1 + 32) addObject:v9];
  }
}

void __35__PXGViewRenderer_releaseResources__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "pxg_removeFromSuperview");
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_configureTrackingContainerView:(id)a3 spriteIndex:(unsigned int)a4 sprites:(id *)a5 screenScale:(double)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a5->var0 > a4)
  {
    id v11 = a3;
    objc_super v12 = [v11 view];
    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        var3 = a5->var3;
        id v14 = (char *)a5->var2 + 32 * a4;
        id v15 = (char *)a5->var4 + 40 * a4;
        v16 = (_OWORD *)((char *)var3 + 160 * a4);
        long long v17 = v16[1];
        v35[0] = *v16;
        v35[1] = v17;
        long long v18 = v16[2];
        long long v19 = v16[3];
        long long v20 = v16[5];
        v35[4] = v16[4];
        v35[5] = v20;
        v35[2] = v18;
        v35[3] = v19;
        long long v21 = v16[6];
        long long v22 = v16[7];
        long long v23 = v16[9];
        v35[8] = v16[8];
        v35[9] = v23;
        v35[6] = v21;
        v35[7] = v22;
        LODWORD(v35[0]) = 1065353216;
        BOOL v24 = [(PXGViewRenderer *)self shouldSeparateViewLayers];
        LODWORD(v25) = *(_DWORD *)off_1E5DAAF58;
        LODWORD(v26) = *((_DWORD *)off_1E5DAAF58 + 1);
        LODWORD(v27) = *((_DWORD *)off_1E5DAAF58 + 2);
        LODWORD(v28) = *((_DWORD *)off_1E5DAAF58 + 3);
        LOBYTE(v34) = v24;
        objc_msgSend(v12, "pxg_configureWithTexture:geometry:info:style:textureInfo:resizableCapInsets:reusableViewInfo:screenScale:separateLayers:", 0, v14, v15, v35, 0, v11, v25, v26, v27, v28, a6, v34);

        return;
      }
      CGFloat v29 = [MEMORY[0x1E4F28B00] currentHandler];
      v32 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v32);
      v33 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
      [v29 handleFailureInMethod:a2, self, @"PXGViewRenderer.m", 631, @"%@ should be an instance inheriting from %@, but it is %@", @"viewInfo.view", v31, v33 object file lineNumber description];
    }
    else
    {
      CGFloat v29 = [MEMORY[0x1E4F28B00] currentHandler];
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      [v29 handleFailureInMethod:a2, self, @"PXGViewRenderer.m", 631, @"%@ should be an instance inheriting from %@, but it is nil", @"viewInfo.view", v31 object file lineNumber description];
    }

    goto LABEL_4;
  }
}

- (id)trackingContainerViewForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  trackingContainerViewInfoBySpriteIndedouble x = self->_trackingContainerViewInfoBySpriteIndex;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  long long v8 = [(NSMutableDictionary *)trackingContainerViewInfoBySpriteIndex objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v14 = [PXGTrackingContainerView alloc];
    long long v9 = -[PXGTrackingContainerView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    long long v8 = [[_PXGReusableViewInfo alloc] initWithReusableView:v9];
    id v15 = self->_trackingContainerViewInfoBySpriteIndex;
    v16 = [NSNumber numberWithUnsignedInt:v3];
    [(NSMutableDictionary *)v15 setObject:v8 forKeyedSubscript:v16];

    lastPresentationDataStore = self->_lastPresentationDataStore;
    if (lastPresentationDataStore)
    {
      [(PXGSpriteDataStore *)lastPresentationDataStore sprites];
    }
    else
    {
      uint64_t v22 = 0;
      memset(v21, 0, sizeof(v21));
    }
    [(PXGViewRenderer *)self _screenScale];
    -[PXGViewRenderer _configureTrackingContainerView:spriteIndex:sprites:screenScale:](self, "_configureTrackingContainerView:spriteIndex:sprites:screenScale:", v8, v3, v21);
    [(PXScrollViewController *)self->_scrollViewController addSubview:v9];
    long long v18 = [(PXGViewRenderer *)self delegate];
    [v18 rendererNeedsUpdate:self];

    goto LABEL_9;
  }
  long long v9 = [(_PXGReusableViewInfo *)v8 view];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_9;
    }
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = (objc_class *)objc_opt_class();
    objc_super v12 = NSStringFromClass(v11);
    uint64_t v13 = [(PXGTrackingContainerView *)v9 px_descriptionForAssertionMessage];
    [v10 handleFailureInMethod:a2, self, @"PXGViewRenderer.m", 609, @"%@ should be an instance inheriting from %@, but it is %@", @"viewInfo.view", v12, v13 object file lineNumber description];
  }
  else
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v20 = (objc_class *)objc_opt_class();
    objc_super v12 = NSStringFromClass(v20);
    [v10 handleFailureInMethod:a2, self, @"PXGViewRenderer.m", 609, @"%@ should be an instance inheriting from %@, but it is nil", @"viewInfo.view", v12 object file lineNumber description];
  }

LABEL_9:
  return v9;
}

- (id)viewForSpriteIndex:(unsigned int)a3
{
  reusableViewInfoBySpriteIndedouble x = self->_reusableViewInfoBySpriteIndex;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  uint64_t v5 = [(NSMutableDictionary *)reusableViewInfoBySpriteIndex objectForKey:v4];
  uint64_t v6 = [v5 view];

  return v6;
}

- (id)renderSnapshotForRequest:(id *)a3 offscreenEffect:(id)a4
{
  return 0;
}

uint64_t __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke(uint64_t result, unsigned int a2)
{
  uint64_t v2 = *(void *)(result + 40) + 32 * a2;
  double v3 = *(double *)(result + 48);
  float32x2_t v4 = vmul_f32(*(float32x2_t *)(v2 + 24), (float32x2_t)0x3F0000003F000000);
  if (*(double *)v2 - v4.f32[0] <= v3 + *(double *)(result + 64) && *(double *)v2 + v4.f32[0] >= v3)
  {
    double v6 = *(double *)(result + 56);
    double v7 = *(double *)(v2 + 8);
    double v8 = v4.f32[1];
    double v9 = v7 - v8;
    double v10 = v7 + v8;
    if (v9 <= *(double *)(result + 72) + v6 && v10 >= v6) {
      return [*(id *)(result + 32) addIndex:v10];
    }
  }
  return result;
}

uint64_t __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedIntegerValue];
  uint64_t result = [*(id *)(a1 + 32) containsIndex:v3];
  if ((result & 1) == 0)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    return [v5 addIndex:v3];
  }
  return result;
}

void __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v4];
  [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v4];
  [*(id *)(a1 + 32) _makeViewInfoReusable:v3];
}

uint64_t __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_4(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  id v4 = [*(id *)(a1 + 32) leafSublayoutForSpriteIndex:a2];
  id v5 = [v4 nextViewHostingLayout];
  double v6 = v4;
  while (1)
  {
    double v7 = v5;
    unsigned int v8 = objc_msgSend(*(id *)(a1 + 32), "convertSpriteIndex:fromLayout:", objc_msgSend(v5, "viewHostingSpriteIndexForSublayout:", v6), v5);
    BOOL v9 = v8 == v2 && v5 == v4;
    double v10 = v4;
    if (!v9)
    {
      double v10 = v5;
      if (v8 != -1) {
        break;
      }
    }
    id v11 = v10;

    id v5 = [v11 nextViewHostingLayout];

    double v6 = v7;
    if (!v5)
    {
      uint64_t v12 = 0xFFFFFFFFLL;
      double v6 = v7;
      goto LABEL_13;
    }
  }
  if (v5) {
    uint64_t v12 = v8;
  }
  else {
    uint64_t v12 = 0xFFFFFFFFLL;
  }

LABEL_13:
  return v12;
}

void __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_5(double *a1, void *a2)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 spriteIndex];
  id v5 = *(void **)(*((void *)a1 + 4) + 16);
  double v6 = [NSNumber numberWithUnsignedInt:v4];
  double v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x4010000000;
  v57 = &unk_1AB5D584F;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v49 = *((void *)a1 + 10);
  unsigned int v8 = (long long *)(*((void *)a1 + 9) + 32 * v4);
  long long v9 = v8[1];
  long long v58 = *v8;
  long long v59 = v9;
  uint64_t v47 = *((void *)a1 + 11) + 40 * v4;
  char v10 = *(unsigned char *)(v47 + 34);
  v48 = [v7 view];
  if ([v3 needsParenting])
  {
LABEL_2:
    int v11 = (*(uint64_t (**)(void))(*((void *)a1 + 6) + 16))();
    uint64_t v12 = (void *)*((void *)a1 + 4);
    if (v11 == -1)
    {
      if ((v10 & 0x20) == 0)
      {
        objc_msgSend(v48, "pxg_addToScrollViewController:", v12[46]);
        goto LABEL_22;
      }
      [v12 _ensureUnderlayHostingView];
      id WeakRetained = objc_loadWeakRetained((id *)(*((void *)a1 + 4) + 32));
      objc_msgSend(v48, "pxg_insertIntoView:atIndex:", WeakRetained, 0);
      goto LABEL_21;
    }
    uint64_t v13 = (void *)v12[2];
    id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    id v15 = [v13 objectForKeyedSubscript:v14];

    if (v15)
    {
      id v16 = [v15 view];
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        char v17 = objc_opt_respondsToSelector();

        if (v17)
        {
          id WeakRetained = v15;
          [v7 setHostingViewInfo:WeakRetained];
          [WeakRetained addHostedViewInfo:v7];
          long long v19 = [WeakRetained view];
          objc_msgSend(v48, "pxg_addToHostingView:", v19);

LABEL_19:
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
      }
      PXGTungstenGetLog();
    }
    id WeakRetained = 0;
    goto LABEL_19;
  }
  uint64_t v20 = *((void *)a1 + 4);
  if ((v10 & 0x20) != 0)
  {
    if (objc_msgSend(v48, "pxg_isChildOfScrollViewController:", *(void *)(v20 + 368))) {
      goto LABEL_2;
    }
  }
  else
  {
    id v21 = objc_loadWeakRetained((id *)(v20 + 32));
    if (v21)
    {
      id v22 = objc_loadWeakRetained((id *)(*((void *)a1 + 4) + 32));
      int v23 = objc_msgSend(v48, "pxg_isChildOfView:", v22);

      if (v23) {
        goto LABEL_2;
      }
    }
  }
LABEL_22:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_80;
  aBlock[3] = &unk_1E5DAFCC0;
  *(double *)&aBlock[4] = a1[4];
  aBlock[5] = &v54;
  BOOL v24 = (void (**)(void *, void *))_Block_copy(aBlock);
  double v25 = [v7 hostingViewInfo];
  double v26 = [v25 view];

  if (v26)
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_2_82;
    v51[3] = &unk_1E5DAFCE8;
    id v52 = v7;
    v24[2](v24, v51);
  }
  id v27 = objc_loadWeakRetained((id *)(*((void *)a1 + 4) + 32));
  if (v27)
  {
    double v28 = [v7 view];
    id v29 = objc_loadWeakRetained((id *)(*((void *)a1 + 4) + 32));
    int v30 = objc_msgSend(v28, "pxg_isChildOfView:", v29);

    if (v30)
    {
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_3_84;
      v50[3] = &unk_1E5DAFCE8;
      *(double *)&v50[4] = a1[4];
      v24[2](v24, v50);
    }
  }
  v31 = (int *)(*((void *)a1 + 12) + 16 * *(unsigned __int16 *)(v49 + 160 * v4 + 68));
  int v32 = *v31;
  int v33 = v31[1];
  int v34 = v31[2];
  int v35 = v31[3];
  long long v62 = 0u;
  long long v63 = 0u;
  *(_OWORD *)buf = 0u;
  long long v61 = 0u;
  if (v3) {
    [v3 textureInfo];
  }
  uint64_t v36 = [v7 view];
  v37 = [v3 texture];
  v38 = v55;
  double v39 = a1[13];
  LOBYTE(v46) = [v3 separateLayers];
  LODWORD(v40) = v32;
  LODWORD(v41) = v33;
  LODWORD(v42) = v34;
  LODWORD(v43) = v35;
  objc_msgSend(v36, "pxg_configureWithTexture:geometry:info:style:textureInfo:resizableCapInsets:reusableViewInfo:screenScale:separateLayers:", v37, v38 + 4, v47, v49 + 160 * v4, buf, v7, v40, v41, v42, v43, v39, v46);

  v44 = (void *)*((void *)a1 + 5);
  v45 = [NSNumber numberWithUnsignedInt:v4];
  [v44 removeObjectForKey:v45];

  _Block_object_dispose(&v54, 8);
}

void __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_4_86(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [a2 unsignedIntValue];
  double v8 = *(double *)(a1 + 80);
  long long v9 = *(_OWORD *)(a1 + 56);
  v10[0] = *(_OWORD *)(a1 + 40);
  v10[1] = v9;
  uint64_t v11 = *(void *)(a1 + 72);
  [v5 _configureTrackingContainerView:v6 spriteIndex:v7 sprites:v10 screenScale:v8];
}

void __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_80(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 368);
  uint64_t v4 = a2;
  id v5 = [v3 scrollView];
  id v9 = [v5 layer];

  double v6 = v4[2](v4, v9, *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  uint64_t v8 = v7;

  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v6;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v8;
}

double __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_2_82(uint64_t a1, void *a2, double a3, double a4)
{
  double v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 hostingViewInfo];
  id v9 = [v8 view];
  objc_msgSend(v9, "convertHostedChildCenter:fromGlobalLayer:", v7, a3, a4);
  double v11 = v10;

  return v11;
}

double __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_3_84(uint64_t a1, void *a2, double a3, double a4)
{
  double v6 = (id *)(*(void *)(a1 + 32) + 32);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  id v9 = [WeakRetained layer];
  objc_msgSend(v9, "convertPoint:fromLayer:", v7, a3, a4);
  double v11 = v10;

  return v11;
}

uint64_t __43__PXGViewRenderer_updateWithChangeDetails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_makeViewInfoReusable:");
}

void __43__PXGViewRenderer_updateWithChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = [a3 view];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    double v11 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v11);
    uint64_t v12 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
    [v4 handleFailureInMethod:v9, v10, @"PXGViewRenderer.m", 265, @"%@ should be an instance inheriting from %@, but it is %@", @"viewInfo.view", v8, v12 object file lineNumber description];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    [v4 handleFailureInMethod:v5, v6, @"PXGViewRenderer.m", 265, @"%@ should be an instance inheriting from %@, but it is nil", @"viewInfo.view", v8 object file lineNumber description];
  }

LABEL_3:
  [v13 setIsSpriteRemoved:1];
}

- (id)_dequeueViewWithClass:(Class)a3
{
  uint64_t v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_reusableViewsByClass, "objectForKeyedSubscript:");
  if ([v4 count])
  {
    id v5 = [v4 firstObject];
    [v4 removeObjectAtIndex:0];
    objc_msgSend(v5, "pxg_prepareForReuse");
  }
  else
  {
    id v5 = objc_alloc_init(a3);
  }

  return v5;
}

- (void)_makeViewInfoReusable:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(v4, "hostedViewInfos", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v9++) removeFromSuperViewInfo];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [v4 hostedViewInfos];
  uint64_t v11 = [v10 count];

  if (v11) {
    PXAssertGetLog();
  }
  [v4 removeFromSuperViewInfo];
  uint64_t v12 = [v4 view];
  objc_msgSend(v12, "pxg_becomeReusable");
  id v13 = [(NSMutableDictionary *)self->_reusableViewsByClass objectForKeyedSubscript:objc_opt_class()];
  if (!v13)
  {
    id v13 = [MEMORY[0x1E4F1CA48] array];
    [(NSMutableDictionary *)self->_reusableViewsByClass setObject:v13 forKeyedSubscript:objc_opt_class()];
  }
  [v13 addObject:v12];
}

- (void)_resizeBuffersForSpriteCount:(int64_t)a3
{
  if (self->_spriteBufferCapacity < a3)
  {
    self->_spriteBufferCapacitdouble y = a3;
    self->_spriteIndexes = (unsigned int *)malloc_type_realloc(self->_spriteIndexes, 4 * a3, 0x100004052888210uLL);
    self->_textureInfos = ($3BA783FF50B239963188BE194EBFFEBA *)malloc_type_realloc(self->_textureInfos, a3 << 6, 0x100004011B15C4DuLL);
  }
}

- (void)_ensureUnderlayHostingView
{
  p_underlayHostingView = &self->_underlayHostingView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_underlayHostingView);

  if (!WeakRetained)
  {
    uint64_t v6 = [(PXGViewRenderer *)self rootView];
    objc_storeWeak((id *)p_underlayHostingView, v6);

    id v7 = objc_loadWeakRetained((id *)p_underlayHostingView);
    if (!v7)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PXGViewRenderer.m", 192, @"Invalid parameter not satisfying: %@", @"_underlayHostingView != nil" object file lineNumber description];
    }
    id v8 = objc_loadWeakRetained((id *)p_underlayHostingView);
    char v9 = [v8 enableUnderlaySupport];

    if ((v9 & 1) == 0) {
      PXAssertGetLog();
    }
  }
}

- (void)dealloc
{
  free(self->_spriteIndexes);
  free(self->_textureInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXGViewRenderer;
  [(PXGViewRenderer *)&v3 dealloc];
}

@end