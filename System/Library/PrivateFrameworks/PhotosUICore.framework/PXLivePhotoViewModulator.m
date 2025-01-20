@interface PXLivePhotoViewModulator
- (BOOL)_needsUpdate;
- (BOOL)animateGainMapAppearance;
- (BOOL)displayingVideoComplement;
- (BOOL)revealsGainMapImage;
- (CGImage)gainMapImage;
- (ISLivePhotoUIView)livePhotoView;
- (PXImageLayerModulator)imageModulator;
- (PXImageLayerModulator)videoModulator;
- (PXLivePhotoViewModulator)init;
- (PXLivePhotoViewModulator)initWithImageModulator:(id)a3 videoModulator:(id)a4;
- (float)gainMapValue;
- (void)_invalidateGainMapImage;
- (void)_invalidateInput;
- (void)_setNeedsUpdate;
- (void)_updateGainMapImage;
- (void)_updateIfNeeded;
- (void)_updateInput;
- (void)basePlayerUIView:(id)a3 didChange:(unint64_t)a4 withAnimationDuration:(double)a5;
- (void)dealloc;
- (void)performChanges:(id)a3;
- (void)prepareForReuse;
- (void)setAnimateGainMapAppearance:(BOOL)a3;
- (void)setDisplayingVideoComplement:(BOOL)a3;
- (void)setGainMapImage:(CGImage *)a3;
- (void)setGainMapImage:(CGImage *)a3 animated:(BOOL)a4;
- (void)setGainMapValue:(float)a3;
- (void)setLivePhotoView:(id)a3;
- (void)setRevealsGainMapImage:(BOOL)a3;
@end

@implementation PXLivePhotoViewModulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoModulator, 0);
  objc_storeStrong((id *)&self->_imageModulator, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
}

- (PXImageLayerModulator)videoModulator
{
  return self->_videoModulator;
}

- (PXImageLayerModulator)imageModulator
{
  return self->_imageModulator;
}

- (BOOL)displayingVideoComplement
{
  return self->_displayingVideoComplement;
}

- (void)setAnimateGainMapAppearance:(BOOL)a3
{
  self->_animateGainMapAppearance = a3;
}

- (BOOL)animateGainMapAppearance
{
  return self->_animateGainMapAppearance;
}

- (BOOL)revealsGainMapImage
{
  return self->_revealsGainMapImage;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (ISLivePhotoUIView)livePhotoView
{
  return self->_livePhotoView;
}

- (void)basePlayerUIView:(id)a3 didChange:(unint64_t)a4 withAnimationDuration:(double)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v9 = PLUIGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 134218754;
    v20 = self;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 2048;
    unint64_t v24 = a4;
    __int16 v25 = 2048;
    double v26 = a5;
    _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "[LivePhotoViewModulator %p] %@ %li %f", buf, 0x2Au);
  }
  if (a4)
  {
    v11 = [(PXLivePhotoViewModulator *)self livePhotoView];
    char v12 = [v11 isDisplayingPhoto] ^ 1;

    v13 = [(PXLivePhotoViewModulator *)self imageModulator];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __77__PXLivePhotoViewModulator_basePlayerUIView_didChange_withAnimationDuration___block_invoke;
    v17[3] = &__block_descriptor_41_e40_v16__0___PXMutableImageLayerModulator__8l;
    char v18 = v12;
    *(double *)&v17[4] = a5;
    [v13 performChanges:v17];

    v14 = [(PXLivePhotoViewModulator *)self videoModulator];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__PXLivePhotoViewModulator_basePlayerUIView_didChange_withAnimationDuration___block_invoke_2;
    v15[3] = &__block_descriptor_41_e40_v16__0___PXMutableImageLayerModulator__8l;
    char v16 = v12;
    *(double *)&v15[4] = a5;
    [v14 performChanges:v15];
  }
}

void __77__PXLivePhotoViewModulator_basePlayerUIView_didChange_withAnimationDuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  [v4 setDisplayingVideoComplement:v3];
  [v4 animateChangesWithDuration:*(double *)(a1 + 32)];
}

void __77__PXLivePhotoViewModulator_basePlayerUIView_didChange_withAnimationDuration___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  [v4 setDisplayingVideoComplement:v3];
  [v4 animateChangesWithDuration:*(double *)(a1 + 32)];
}

- (void)_updateGainMapImage
{
  if (self->_needsUpdateFlags.gainMapImage)
  {
    self->_needsUpdateFlags.gainMapImage = 0;
    uint64_t v3 = [(PXLivePhotoViewModulator *)self imageModulator];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __47__PXLivePhotoViewModulator__updateGainMapImage__block_invoke;
    v4[3] = &unk_1E5DBAB18;
    v4[4] = self;
    [v3 performChanges:v4];
  }
}

void __47__PXLivePhotoViewModulator__updateGainMapImage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setGainMapImage:animated:", objc_msgSend(v3, "gainMapImage"), objc_msgSend(*(id *)(a1 + 32), "animateGainMapAppearance"));
}

- (void)_invalidateGainMapImage
{
  self->_needsUpdateFlags.gainMapImage = 1;
  [(PXLivePhotoViewModulator *)self _setNeedsUpdate];
}

- (void)_updateInput
{
  if (self->_needsUpdateFlags.input)
  {
    self->_needsUpdateFlags.input = 0;
    uint64_t v3 = [(PXLivePhotoViewModulator *)self livePhotoView];
    id v4 = [v3 customPhotoView];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [v3 photoView];
    }
    v7 = v6;

    v8 = [v3 videoView];
    v9 = [(PXLivePhotoViewModulator *)self imageModulator];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __40__PXLivePhotoViewModulator__updateInput__block_invoke;
    v16[3] = &unk_1E5DBAAF0;
    id v17 = v7;
    char v18 = self;
    id v10 = v7;
    [v9 performChanges:v16];

    v11 = [(PXLivePhotoViewModulator *)self videoModulator];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__PXLivePhotoViewModulator__updateInput__block_invoke_2;
    v13[3] = &unk_1E5DBAAF0;
    id v14 = v8;
    v15 = self;
    id v12 = v8;
    [v11 performChanges:v13];
  }
}

void __40__PXLivePhotoViewModulator__updateInput__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 layer];
  [v5 setLayer:v4];

  [*(id *)(a1 + 40) gainMapValue];
  objc_msgSend(v5, "setGainMapValue:");
  objc_msgSend(v5, "setRevealsGainMapImage:", objc_msgSend(*(id *)(a1 + 40), "revealsGainMapImage"));
  objc_msgSend(v5, "setDisplayingVideoComplement:", objc_msgSend(*(id *)(a1 + 40), "displayingVideoComplement"));
}

void __40__PXLivePhotoViewModulator__updateInput__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 layer];
  [v5 setLayer:v4];

  objc_msgSend(v5, "setDisplayingVideoComplement:", objc_msgSend(*(id *)(a1 + 40), "displayingVideoComplement"));
}

- (void)_invalidateInput
{
  self->_needsUpdateFlags.input = 1;
  [(PXLivePhotoViewModulator *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  if ([(PXLivePhotoViewModulator *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PXLivePhotoViewModulator *)self _updateInput];
    [(PXLivePhotoViewModulator *)self _updateGainMapImage];
    [(PXLivePhotoViewModulator *)self setAnimateGainMapAppearance:0];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
  }
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PXLivePhotoViewModulator.m", 162, @"neither insider -performChanges: block, nor performing updates" object file lineNumber description];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.input || self->_needsUpdateFlags.gainMapImage;
}

- (void)setRevealsGainMapImage:(BOOL)a3
{
  if (self->_revealsGainMapImage != a3)
  {
    self->_revealsGainMapImage = a3;
    [(PXLivePhotoViewModulator *)self _invalidateInput];
  }
}

- (void)setGainMapValue:(float)a3
{
}

- (void)setGainMapImage:(CGImage *)a3 animated:(BOOL)a4
{
  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    BOOL v6 = a4;
    CGImageRelease(gainMapImage);
    self->_gainMapImage = a3;
    CGImageRetain(a3);
    [(PXLivePhotoViewModulator *)self setAnimateGainMapAppearance:v6];
    [(PXLivePhotoViewModulator *)self _invalidateGainMapImage];
  }
}

- (void)setGainMapImage:(CGImage *)a3
{
}

- (void)setDisplayingVideoComplement:(BOOL)a3
{
  if (self->_displayingVideoComplement != a3)
  {
    self->_displayingVideoComplement = a3;
    [(PXLivePhotoViewModulator *)self _invalidateInput];
  }
}

- (void)setLivePhotoView:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (ISLivePhotoUIView *)a3;
  livePhotoView = self->_livePhotoView;
  if (livePhotoView != v6)
  {
    [(ISLivePhotoUIView *)livePhotoView unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_livePhotoView, a3);
    [(ISLivePhotoUIView *)v6 registerChangeObserver:self];
    if (v6) {
      uint64_t v8 = [(ISLivePhotoUIView *)v6 isDisplayingPhoto] ^ 1;
    }
    else {
      uint64_t v8 = 0;
    }
    [(PXLivePhotoViewModulator *)self setDisplayingVideoComplement:v8];
    [(PXLivePhotoViewModulator *)self _invalidateInput];
    v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = NSStringFromSelector(a2);
      int v11 = 134218498;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v10;
      __int16 v15 = 2112;
      char v16 = v6;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "[LivePhotoViewModulator %p] %@ %@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)prepareForReuse
{
  [(PXLivePhotoViewModulator *)self setLivePhotoView:0];
  [(PXLivePhotoViewModulator *)self setGainMapImage:0];
  [(PXLivePhotoViewModulator *)self setGainMapValue:0.0];
}

- (void)performChanges:(id)a3
{
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  (*((void (**)(id, PXLivePhotoViewModulator *))a3 + 2))(a3, self);
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PXLivePhotoViewModulator *)self _updateIfNeeded];
  }
}

- (void)dealloc
{
  CGImageRelease(self->_gainMapImage);
  v3.receiver = self;
  v3.super_class = (Class)PXLivePhotoViewModulator;
  [(PXLivePhotoViewModulator *)&v3 dealloc];
}

- (PXLivePhotoViewModulator)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXLivePhotoViewModulator.m", 62, @"%s is not available as initializer", "-[PXLivePhotoViewModulator init]");

  abort();
}

- (PXLivePhotoViewModulator)initWithImageModulator:(id)a3 videoModulator:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)PXLivePhotoViewModulator;
    v9 = [(PXLivePhotoViewModulator *)&v13 init];
    id v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_imageModulator, a3);
      objc_storeStrong((id *)&v10->_videoModulator, a4);
      v10->_gainMapImage = PXImageCreateBlackPlaceholderImageWithSize();
    }
    self = v10;
    int v11 = self;
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

@end