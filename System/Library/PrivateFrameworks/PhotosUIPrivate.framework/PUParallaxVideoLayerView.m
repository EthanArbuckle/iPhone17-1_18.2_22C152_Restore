@interface PUParallaxVideoLayerView
- (AVPlayer)player;
- (PFParallaxVideoLayer)parallaxVideoLayer;
- (PUParallaxLayerLayoutInfo)currentLayoutInfo;
- (PUParallaxVideoLayerContentView)contentView;
- (PUParallaxVideoLayerView)initWithParallaxVideoLayer:(id)a3;
- (id)snapshotViewAfterScreenUpdates:(BOOL)a3;
- (void)_layoutWithCurrentLayoutInfo;
- (void)_updateParallaxVideoLayerProperties;
- (void)setCurrentLayoutInfo:(id)a3;
- (void)setParallaxVideoLayer:(id)a3;
@end

@implementation PUParallaxVideoLayerView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_parallaxVideoLayer, 0);
  objc_storeStrong((id *)&self->_currentLayoutInfo, 0);
}

- (PUParallaxVideoLayerContentView)contentView
{
  return self->_contentView;
}

- (PFParallaxVideoLayer)parallaxVideoLayer
{
  return self->_parallaxVideoLayer;
}

- (PUParallaxLayerLayoutInfo)currentLayoutInfo
{
  return self->_currentLayoutInfo;
}

- (id)snapshotViewAfterScreenUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PUParallaxVideoLayerView;
  v5 = -[PUParallaxVideoLayerView snapshotViewAfterScreenUpdates:](&v28, sel_snapshotViewAfterScreenUpdates_);
  v6 = [(PUParallaxVideoLayerView *)self contentView];
  v7 = [v6 snapshotViewAfterScreenUpdates:v3];

  [v5 addSubview:v7];
  v8 = [(PUParallaxVideoLayerView *)self currentLayoutInfo];
  v9 = [(PUParallaxVideoLayerView *)self parallaxVideoLayer];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  objc_msgSend(v8, "viewFrameForLayerFrame:", v11, v13, v15, v17);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  if (v8) {
    [v8 additionalContentTransform];
  }
  else {
    memset(&v27, 0, sizeof(v27));
  }
  v30.origin.x = v19;
  v30.origin.y = v21;
  v30.size.width = v23;
  v30.size.height = v25;
  CGRect v31 = CGRectApplyAffineTransform(v30, &v27);
  objc_msgSend(v7, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);

  return v5;
}

- (void)_layoutWithCurrentLayoutInfo
{
  BOOL v3 = [(PUParallaxVideoLayerView *)self currentLayoutInfo];
  v4 = v3;
  if (v3)
  {
    [v3 containerFrame];
    v5 = [(PUParallaxVideoLayerView *)self parallaxVideoLayer];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v4, "viewFrameForLayerFrame:", v7, v9, v11, v13);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    [v4 additionalContentTransform];
    v29.origin.double x = v15;
    v29.origin.double y = v17;
    v29.size.double width = v19;
    v29.size.double height = v21;
    CGRect v30 = CGRectApplyAffineTransform(v29, &v28);
    double x = v30.origin.x;
    double y = v30.origin.y;
    double width = v30.size.width;
    double height = v30.size.height;
    v26 = [(PUParallaxVideoLayerView *)self contentView];
    objc_msgSend(v26, "setFrame:", x, y, width, height);

    [v4 additionalTransform];
    v27[0] = v27[3];
    v27[1] = v27[4];
    v27[2] = v27[5];
    [(PUParallaxVideoLayerView *)self setTransform:v27];
    PXRectWithSize();
    -[PUParallaxVideoLayerView setBounds:](self, "setBounds:");
    PXRectGetCenter();
    -[PUParallaxVideoLayerView setCenter:](self, "setCenter:");
  }
}

- (void)setCurrentLayoutInfo:(id)a3
{
  double v8 = (PUParallaxLayerLayoutInfo *)a3;
  v5 = self->_currentLayoutInfo;
  if (v5 == v8)
  {
  }
  else
  {
    double v6 = v5;
    BOOL v7 = [(PUParallaxLayerLayoutInfo *)v5 isEqual:v8];

    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentLayoutInfo, a3);
      [(PUParallaxVideoLayerView *)self _layoutWithCurrentLayoutInfo];
    }
  }
}

- (void)_updateParallaxVideoLayerProperties
{
  BOOL v3 = [(PUParallaxVideoLayerView *)self parallaxVideoLayer];
  v4 = [v3 video];

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__26495;
  v11[4] = __Block_byref_object_dispose__26496;
  id v12 = [(PUParallaxVideoLayerView *)self player];
  v5 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PUParallaxVideoLayerView__updateParallaxVideoLayerProperties__block_invoke;
  v7[3] = &unk_1E5F2E0D0;
  double v10 = v11;
  id v6 = v4;
  id v8 = v6;
  double v9 = self;
  [v5 performWithoutAnimation:v7];

  _Block_object_dispose(v11, 8);
}

uint64_t __63__PUParallaxVideoLayerView__updateParallaxVideoLayerProperties__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) currentItem];
  BOOL v3 = [v2 asset];
  v4 = *(void **)(a1 + 32);

  if (v3 != v4)
  {
    if (!*(void *)(*(void *)(a1 + 40) + 424))
    {
      v5 = [PUParallaxVideoLayerContentView alloc];
      uint64_t v6 = -[PUParallaxVideoLayerContentView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(void **)(v7 + 424);
      *(void *)(v7 + 424) = v6;

      [*(id *)(a1 + 40) addSubview:*(void *)(*(void *)(a1 + 40) + 424)];
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v9 = [MEMORY[0x1E4F16608] playerWithPlayerItem:0];
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      double v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setMuted:1];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setActionAtItemEnd:1];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPreventsDisplaySleepDuringVideoPlayback:0];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAllowsExternalPlayback:0];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) _setDisallowsVideoLayerDisplayCompositing:1];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) _setParticipatesInAudioSession:0];
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      double v13 = [*(id *)(a1 + 40) contentView];
      double v14 = [v13 _playerLayer];
      [v14 setPlayer:v12];
    }
    CGFloat v15 = [MEMORY[0x1E4F16620] playerItemWithAsset:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) replaceCurrentItemWithPlayerItem:v15];
  }
  double v16 = *(void **)(a1 + 40);
  return [v16 _layoutWithCurrentLayoutInfo];
}

- (void)setParallaxVideoLayer:(id)a3
{
  id v8 = (PFParallaxVideoLayer *)a3;
  v5 = self->_parallaxVideoLayer;
  if (v5 == v8)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(PFParallaxVideoLayer *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_parallaxVideoLayer, a3);
      [(PUParallaxVideoLayerView *)self _updateParallaxVideoLayerProperties];
    }
  }
}

- (AVPlayer)player
{
  v2 = [(PUParallaxVideoLayerView *)self contentView];
  BOOL v3 = [v2 _playerLayer];
  v4 = [v3 player];

  return (AVPlayer *)v4;
}

- (PUParallaxVideoLayerView)initWithParallaxVideoLayer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUParallaxVideoLayerView;
  uint64_t v6 = [(PUParallaxVideoLayerView *)&v9 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parallaxVideoLayer, a3);
    [(PUParallaxVideoLayerView *)v7 _updateParallaxVideoLayerProperties];
  }

  return v7;
}

@end