@interface PUBadgeInfoProvider
- (BOOL)_needsUpdate;
- (BOOL)outputShouldAnimate;
- (BOOL)playing;
- (PUAssetViewModel)assetViewModel;
- (PUBadgeInfoProvider)init;
- (PXAssetBadgeInfo)_filteredBadgeInfoForTime:(SEL)a3 outShouldAnimate:(double)a4;
- (PXAssetBadgeInfo)badgeInfo;
- (PXAssetBadgeInfo)outputBadgeInfo;
- (double)lastPlayingTime;
- (void)_invalidateOutput;
- (void)_setNeedsUpdate;
- (void)_setOutputBadgeInfo:(PXAssetBadgeInfo *)a3 shouldAnimate:(BOOL)a4;
- (void)_updateIfNeeded;
- (void)_updateOutputIfNeeded;
- (void)_updatePlaying;
- (void)assetEditOperationManager:(id)a3 didChangeEditOperationStatusForAsset:(id)a4 context:(void *)a5;
- (void)didPerformChanges;
- (void)invalidateOutput;
- (void)performChanges:(id)a3;
- (void)prepareForReuse;
- (void)setAssetViewModel:(id)a3;
- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3;
- (void)setLastPlayingTime:(double)a3;
- (void)setPlaying:(BOOL)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUBadgeInfoProvider

- (void).cxx_destruct
{
}

- (BOOL)playing
{
  return self->_playing;
}

- (double)lastPlayingTime
{
  return self->_lastPlayingTime;
}

- (BOOL)outputShouldAnimate
{
  return self->_outputShouldAnimate;
}

- (PXAssetBadgeInfo)outputBadgeInfo
{
  long long v3 = *(_OWORD *)&self[5].duration;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[4].fileSize;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (PXAssetBadgeInfo)badgeInfo
{
  long long v3 = *(_OWORD *)&self[4].duration;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[3].fileSize;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (void)assetEditOperationManager:(id)a3 didChangeEditOperationStatusForAsset:(id)a4 context:(void *)a5
{
  id v12 = a3;
  id v9 = a4;
  if ((void *)PUBadgeTileEditOperationManagerObservationContext != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PUBadgeInfoProvider.m" lineNumber:244 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = v9;
  [(PUBadgeInfoProvider *)self invalidateOutput];
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "playStateDidChange", a3))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__PUBadgeInfoProvider_viewModel_didChange___block_invoke;
    v5[3] = &unk_1E5F2B538;
    v5[4] = self;
    [(PUBadgeInfoProvider *)self performChanges:v5];
  }
}

uint64_t __43__PUBadgeInfoProvider_viewModel_didChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlaying];
}

- (void)_setOutputBadgeInfo:(PXAssetBadgeInfo *)a3 shouldAnimate:(BOOL)a4
{
  p_PXAssetBadgeInfo outputBadgeInfo = &self->_outputBadgeInfo;
  PXAssetBadgeInfo outputBadgeInfo = self->_outputBadgeInfo;
  PXAssetBadgeInfo v9 = *a3;
  if ((PXAssetBadgeInfoEqualToBadgeInfo() & 1) == 0)
  {
    long long v8 = *(_OWORD *)&a3->count;
    *(_OWORD *)&p_outputBadgeInfo->badges = *(_OWORD *)&a3->badges;
    *(_OWORD *)&p_outputBadgeInfo->count = v8;
    self->_outputShouldAnimate = a4;
    -[PUBadgeInfoProvider signalChange:](self, "signalChange:", 1, *(_OWORD *)&v9.badges, *(_OWORD *)&v9.count, *(_OWORD *)&outputBadgeInfo.badges, *(_OWORD *)&outputBadgeInfo.count);
  }
}

- (PXAssetBadgeInfo)_filteredBadgeInfoForTime:(SEL)a3 outShouldAnimate:(double)a4
{
  *(_OWORD *)&retstr->unint64_t badges = 0u;
  *(_OWORD *)&retstr->count = 0u;
  [(PUBadgeInfoProvider *)self badgeInfo];
  [(PUBadgeInfoProvider *)self lastPlayingTime];
  double v10 = v9;
  if (v9 == -1.79769313e308)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    id v12 = [(PUBadgeInfoProvider *)self assetViewModel];
    v13 = [v12 asset];
    unint64_t v14 = ((unint64_t)[v13 mediaSubtypes] >> 20) & 1;

    double v15 = v10 + 2.5;
    if (v15 < a4) {
      BOOL v11 = v14;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11) {
      retstr->badges &= ~0x400uLL;
    }
    v16 = [(PUBadgeInfoProvider *)self assetViewModel];
    v17 = [v16 asset];
    uint64_t v18 = [v17 mediaSubtypes] & 0x200000;

    if (v15 < a4 && v18 != 0)
    {
      retstr->badges &= ~0x800000000uLL;
      LOBYTE(v11) = 1;
    }
    v20 = [(PUBadgeInfoProvider *)self assetViewModel];
    v21 = [v20 asset];

    int v22 = [v21 isProRes];
    if (v15 < a4 && v22)
    {
      retstr->badges &= ~0x400000000uLL;
      LOBYTE(v11) = 1;
    }
    if ([v21 isSpatialMedia])
    {
      int v23 = [v21 isVideo];
      if (v15 < a4)
      {
        if (v23)
        {
          retstr->badges &= ~0x20000000000uLL;
          LOBYTE(v11) = 1;
        }
      }
    }
  }
  v24 = [MEMORY[0x1E4F8FFD0] sharedManager];
  v25 = [(PUBadgeInfoProvider *)self assetViewModel];
  v26 = [v25 asset];
  uint64_t v27 = [v24 editOperationStatusForAsset:v26];

  unint64_t badges = retstr->badges;
  if ((retstr->badges & 0x2000) != 0 && v27 == 3)
  {
    badges |= 0x4000uLL;
    retstr->unint64_t badges = badges;
  }
  else if ((badges & 0x4000) != 0 && v27 != 3)
  {
    badges &= ~0x4000uLL;
    retstr->unint64_t badges = badges;
    goto LABEL_30;
  }
  if ((badges & 0x40000000000) != 0 && v27 == 3)
  {
    unint64_t v30 = badges | 0x80000000000;
    goto LABEL_33;
  }
LABEL_30:
  if ((badges & 0x80000000000) == 0 || v27 == 3) {
    goto LABEL_34;
  }
  unint64_t v30 = badges & 0xFFFFF7FFFFFFFFFFLL;
LABEL_33:
  retstr->unint64_t badges = v30;
LABEL_34:
  if (a5) {
    *a5 = v11;
  }
  return result;
}

- (void)_updateOutputIfNeeded
{
  if (self->_needsUpdateFlags.output)
  {
    self->_needsUpdateFlags.output = 0;
    unsigned __int8 v6 = 0;
    long long v4 = 0u;
    long long v5 = 0u;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[PUBadgeInfoProvider _filteredBadgeInfoForTime:outShouldAnimate:](self, "_filteredBadgeInfoForTime:outShouldAnimate:", &v6);
    v3[0] = v4;
    v3[1] = v5;
    [(PUBadgeInfoProvider *)self _setOutputBadgeInfo:v3 shouldAnimate:v6];
  }
}

- (void)_invalidateOutput
{
  self->_needsUpdateFlags.output = 1;
  [(PUBadgeInfoProvider *)self _setNeedsUpdate];
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.output;
}

- (void)_updateIfNeeded
{
  if ([(PUBadgeInfoProvider *)self _needsUpdate])
  {
    [(PUBadgeInfoProvider *)self _updateOutputIfNeeded];
    if ([(PUBadgeInfoProvider *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PUBadgeInfoProvider.m" lineNumber:134 description:@"update still needed after update pass"];
    }
  }
}

- (void)_setNeedsUpdate
{
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PUBadgeInfoProvider;
  [(PUBadgeInfoProvider *)&v3 didPerformChanges];
  [(PUBadgeInfoProvider *)self _updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUBadgeInfoProvider;
  [(PUBadgeInfoProvider *)&v3 performChanges:a3];
}

- (void)invalidateOutput
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__PUBadgeInfoProvider_invalidateOutput__block_invoke;
  v2[3] = &unk_1E5F2B538;
  v2[4] = self;
  [(PUBadgeInfoProvider *)self performChanges:v2];
}

uint64_t __39__PUBadgeInfoProvider_invalidateOutput__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateOutput];
}

- (void)setLastPlayingTime:(double)a3
{
  if (self->_lastPlayingTime != a3)
  {
    self->_lastPlayingTime = a3;
    [(PUBadgeInfoProvider *)self _invalidateOutput];
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    if (a3)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[PUBadgeInfoProvider setLastPlayingTime:](self, "setLastPlayingTime:");
      objc_initWeak(&location, self);
      dispatch_time_t v4 = dispatch_time(0, 2500000000);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __34__PUBadgeInfoProvider_setPlaying___block_invoke;
      v5[3] = &unk_1E5F2E530;
      objc_copyWeak(&v6, &location);
      dispatch_after(v4, MEMORY[0x1E4F14428], v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PUBadgeInfoProvider *)self setLastPlayingTime:-1.79769313e308];
    }
  }
}

void __34__PUBadgeInfoProvider_setPlaying___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateOutput];
}

- (void)_updatePlaying
{
  id v3 = [(PUAssetViewModel *)self->_assetViewModel videoPlayer];
  -[PUBadgeInfoProvider setPlaying:](self, "setPlaying:", [v3 playState] == 3);
}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3
{
  p_PXAssetBadgeInfo badgeInfo = &self->_badgeInfo;
  PXAssetBadgeInfo badgeInfo = self->_badgeInfo;
  PXAssetBadgeInfo v7 = *a3;
  if ((PXAssetBadgeInfoEqualToBadgeInfo() & 1) == 0)
  {
    long long v6 = *(_OWORD *)&a3->count;
    *(_OWORD *)&p_badgeInfo->unint64_t badges = *(_OWORD *)&a3->badges;
    *(_OWORD *)&p_badgeInfo->count = v6;
    [(PUBadgeInfoProvider *)self _invalidateOutput];
  }
}

- (void)setAssetViewModel:(id)a3
{
  long long v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  if (assetViewModel != v5)
  {
    double v9 = v5;
    PXAssetBadgeInfo v7 = [(PUAssetViewModel *)assetViewModel videoPlayer];
    [v7 unregisterChangeObserver:self];

    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUBadgeInfoProvider *)self _updatePlaying];
    long long v8 = [(PUAssetViewModel *)self->_assetViewModel videoPlayer];
    [v8 registerChangeObserver:self];

    long long v5 = v9;
  }
}

- (void)prepareForReuse
{
  [(PUBadgeInfoProvider *)self setAssetViewModel:0];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F91308] + 16);
  v4[0] = *MEMORY[0x1E4F91308];
  v4[1] = v3;
  [(PUBadgeInfoProvider *)self setBadgeInfo:v4];
  [(PUBadgeInfoProvider *)self setLastPlayingTime:-1.79769313e308];
}

- (PUBadgeInfoProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUBadgeInfoProvider;
  v2 = [(PUBadgeInfoProvider *)&v6 init];
  long long v3 = v2;
  if (v2)
  {
    v2->_lastPlayingTime = -1.79769313e308;
    dispatch_time_t v4 = [MEMORY[0x1E4F8FFD0] sharedManager];
    [v4 registerObserver:v3 context:PUBadgeTileEditOperationManagerObservationContext];
  }
  return v3;
}

@end