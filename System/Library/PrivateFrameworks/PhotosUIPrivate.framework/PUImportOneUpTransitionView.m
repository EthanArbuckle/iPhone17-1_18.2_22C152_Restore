@interface PUImportOneUpTransitionView
+ (double)interpolatedValueBetweenInitialValue:(double)a3 andFinalValue:(double)a4 atProgress:(double)a5;
- (CGRect)initialFrame;
- (CGRect)targetFrame;
- (NSArray)badgeViewOffsetConstraints;
- (PUImportOneUpCellBadgeView)badgeView;
- (PUImportOneUpTransitionView)initWithImportItem:(id)a3 startingImage:(id)a4 mediaProvider:(id)a5;
- (PXImportMediaProvider)mediaProvider;
- (UIImage)startingImage;
- (double)currentProgress;
- (double)initialPhotoViewAlpha;
- (double)targetPhotoViewAlpha;
- (int64_t)importOneUpCell:(id)a3 requestedThumbnailForImportItem:(id)a4 completion:(id)a5;
- (void)contextForObservingViewModelChanges;
- (void)importOneUpCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4;
- (void)setFrame:(CGRect)a3;
- (void)setInitialFrame:(CGRect)a3;
- (void)setInitialFrame:(CGRect)a3 targetFrame:(CGRect)a4;
- (void)setInitialPhotoViewAlpha:(double)a3;
- (void)setMediaProvider:(id)a3;
- (void)setPhotoViewInitialAlpha:(double)a3 targetAlpha:(double)a4;
- (void)setStartingImage:(id)a3;
- (void)setTargetFrame:(CGRect)a3;
- (void)setTargetPhotoViewAlpha:(double)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)updateAlphaIfNeeded;
- (void)updateBadgeView;
- (void)updateConstraints;
@end

@implementation PUImportOneUpTransitionView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeViewOffsetConstraints, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_startingImage, 0);
}

- (void)setTargetPhotoViewAlpha:(double)a3
{
  self->_targetPhotoViewAlpha = a3;
}

- (double)targetPhotoViewAlpha
{
  return self->_targetPhotoViewAlpha;
}

- (void)setInitialPhotoViewAlpha:(double)a3
{
  self->_initialPhotoViewAlpha = a3;
}

- (double)initialPhotoViewAlpha
{
  return self->_initialPhotoViewAlpha;
}

- (void)setTargetFrame:(CGRect)a3
{
  self->_targetFrame = a3;
}

- (CGRect)targetFrame
{
  double x = self->_targetFrame.origin.x;
  double y = self->_targetFrame.origin.y;
  double width = self->_targetFrame.size.width;
  double height = self->_targetFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialFrame:(CGRect)a3
{
  self->_initialFrame = a3;
}

- (CGRect)initialFrame
{
  double x = self->_initialFrame.origin.x;
  double y = self->_initialFrame.origin.y;
  double width = self->_initialFrame.size.width;
  double height = self->_initialFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSArray)badgeViewOffsetConstraints
{
  return self->_badgeViewOffsetConstraints;
}

- (PUImportOneUpCellBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setMediaProvider:(id)a3
{
}

- (PXImportMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setStartingImage:(id)a3
{
}

- (UIImage)startingImage
{
  return self->_startingImage;
}

- (void)importOneUpCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4
{
  id v5 = [(PUImportOneUpTransitionView *)self mediaProvider];
  [v5 cancelImageRequest:a4];
}

- (int64_t)importOneUpCell:(id)a3 requestedThumbnailForImportItem:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(PUImportOneUpTransitionView *)self mediaProvider];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__PUImportOneUpTransitionView_importOneUpCell_requestedThumbnailForImportItem_completion___block_invoke;
  v13[3] = &unk_1E5F264D8;
  id v14 = v7;
  id v10 = v7;
  int64_t v11 = [v9 requestImageForImportItem:v8 ofSize:3 priority:1 completion:v13];

  return v11;
}

uint64_t __90__PUImportOneUpTransitionView_importOneUpCell_requestedThumbnailForImportItem_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  }
  return result;
}

- (void)setPhotoViewInitialAlpha:(double)a3 targetAlpha:(double)a4
{
  [(PUImportOneUpTransitionView *)self setInitialPhotoViewAlpha:a3];
  [(PUImportOneUpTransitionView *)self setTargetPhotoViewAlpha:a4];
  [(PUImportOneUpTransitionView *)self initialFrame];
  if (!CGRectIsNull(v7))
  {
    [(PUImportOneUpTransitionView *)self targetFrame];
    if (!CGRectIsNull(v8))
    {
      [(PUImportOneUpTransitionView *)self updateAlphaIfNeeded];
    }
  }
}

- (void)setInitialFrame:(CGRect)a3 targetFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  -[PUImportOneUpTransitionView setInitialFrame:](self, "setInitialFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PUImportOneUpTransitionView setTargetFrame:](self, "setTargetFrame:", x, y, width, height);
  [(PUImportOneUpTransitionView *)self initialFrame];
  if (!CGRectIsNull(v10))
  {
    [(PUImportOneUpTransitionView *)self targetFrame];
    if (!CGRectIsNull(v11))
    {
      [(PUImportOneUpTransitionView *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUImportOneUpTransitionView;
  long long v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  [(PUImportOneUpTransitionView *)&v6 setTransform:v5];
  [(PUImportOneUpTransitionView *)self initialFrame];
  if (!CGRectIsNull(v7))
  {
    [(PUImportOneUpTransitionView *)self targetFrame];
    if (!CGRectIsNull(v8))
    {
      [(PUImportOneUpTransitionView *)self setNeedsUpdateConstraints];
      [(PUImportOneUpTransitionView *)self updateAlphaIfNeeded];
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpTransitionView;
  -[PUImportOneUpTransitionView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PUImportOneUpTransitionView *)self initialFrame];
  if (!CGRectIsNull(v5))
  {
    [(PUImportOneUpTransitionView *)self targetFrame];
    if (!CGRectIsNull(v6))
    {
      [(PUImportOneUpTransitionView *)self setNeedsUpdateConstraints];
      [(PUImportOneUpTransitionView *)self updateAlphaIfNeeded];
    }
  }
}

- (void)updateAlphaIfNeeded
{
  [(PUImportOneUpTransitionView *)self initialPhotoViewAlpha];
  double v4 = v3;
  [(PUImportOneUpTransitionView *)self targetPhotoViewAlpha];
  if (v4 != v5)
  {
    [(PUImportOneUpTransitionView *)self currentProgress];
    double v7 = v6;
    CGRect v8 = objc_opt_class();
    [(PUImportOneUpTransitionView *)self initialPhotoViewAlpha];
    double v10 = v9;
    [(PUImportOneUpTransitionView *)self targetPhotoViewAlpha];
    [v8 interpolatedValueBetweenInitialValue:v10 andFinalValue:v11 atProgress:v7];
    double v13 = v12;
    id v15 = [(PUPhotosSharingGridCell *)self photoView];
    id v14 = [v15 contentHelper];
    [v14 setContentAlpha:v13];
  }
}

- (void)updateConstraints
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(PUImportOneUpTransitionView *)self initialFrame];
  if (!CGRectIsNull(v20))
  {
    [(PUImportOneUpTransitionView *)self targetFrame];
    if (!CGRectIsNull(v21))
    {
      [(PUImportOneUpTransitionView *)self currentProgress];
      double v4 = v3;
      [(PUImportOneUpTransitionView *)self initialFrame];
      [(PUImportOneUpTransitionView *)self initialFrame];
      [(PUImportOneUpTransitionView *)self targetFrame];
      [(PUImportOneUpTransitionView *)self targetFrame];
      CGRectGetHeight(v25);
      [(id)objc_opt_class() interpolatedValueBetweenInitialValue:6.0 andFinalValue:6.0 atProgress:v4];
      double v6 = v5;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      double v7 = [(PUImportOneUpTransitionView *)self badgeViewOffsetConstraints];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v15;
        double v11 = -v6;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            [*(id *)(*((void *)&v14 + 1) + 8 * v12++) setConstant:v11];
          }
          while (v9 != v12);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)PUImportOneUpTransitionView;
  [(PUImportOneUpTransitionView *)&v13 updateConstraints];
}

- (double)currentProgress
{
  [(PUImportOneUpTransitionView *)self initialFrame];
  if (CGRectIsNull(v5)) {
    return 1.0;
  }
  [(PUImportOneUpTransitionView *)self targetFrame];
  if (CGRectIsNull(v6)) {
    return 1.0;
  }
  [(PUImportOneUpTransitionView *)self initialFrame];
  CGRectGetWidth(v7);
  [(PUImportOneUpTransitionView *)self initialFrame];
  CGRectGetHeight(v8);
  [(PUImportOneUpTransitionView *)self targetFrame];
  CGRectGetWidth(v9);
  [(PUImportOneUpTransitionView *)self targetFrame];
  CGRectGetHeight(v10);
  [(PUImportOneUpTransitionView *)self bounds];
  CGRectGetWidth(v11);
  [(PUImportOneUpTransitionView *)self bounds];
  CGRectGetHeight(v12);
  PXClamp();
  return result;
}

- (void)updateBadgeView
{
  double v3 = [(PUImportOneUpTransitionView *)self badgeView];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__PUImportOneUpTransitionView_updateBadgeView__block_invoke;
  v4[3] = &unk_1E5F2ED10;
  v4[4] = self;
  [v3 performBadgeUpdates:v4];
}

void __46__PUImportOneUpTransitionView_updateBadgeView__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) importItem];
  uint64_t v3 = [v2 badgeType];
  double v4 = [*(id *)(a1 + 32) badgeView];
  [v4 setBadgeType:v3];

  id v7 = [*(id *)(a1 + 32) importItem];
  uint64_t v5 = [v7 isSelectable];
  CGRect v6 = [*(id *)(a1 + 32) badgeView];
  [v6 setSelectable:v5];
}

- (void)contextForObservingViewModelChanges
{
  return (void *)PUImportOneUpTransitionViewContext;
}

- (PUImportOneUpTransitionView)initWithImportItem:(id)a3 startingImage:(id)a4 mediaProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)PUImportOneUpTransitionView;
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v15 = -[PUImportOneUpCell initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v12, v13, v14);
  long long v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_startingImage, a4);
    objc_storeStrong((id *)&v16->_mediaProvider, a5);
    CGPoint v18 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v17 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v16->_initialFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v16->_initialFrame.size = v17;
    v16->_targetFrame.origin = v18;
    v16->_targetFrame.size = v17;
    v16->_initialPhotoViewAlpha = 1.0;
    v16->_targetPhotoViewAlpha = 1.0;
    uint64_t v19 = -[PUImportOneUpCellBadgeView initWithFrame:]([PUImportOneUpCellBadgeView alloc], "initWithFrame:", v11, v12, v13, v14);
    badgeView = v16->_badgeView;
    v16->_badgeView = v19;

    CGRect v21 = [(PUImportOneUpTransitionView *)v16 contentView];
    [v21 addSubview:v16->_badgeView];

    [(PUImportOneUpCellBadgeView *)v16->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    CGRect v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    CGRect v23 = [(PUImportOneUpCellBadgeView *)v16->_badgeView rightAnchor];
    CGRect v24 = [(PUPhotosSharingGridCell *)v16 photoView];
    CGRect v25 = [v24 rightAnchor];
    v26 = [v23 constraintEqualToAnchor:v25 constant:-6.0];
    [(NSArray *)v22 addObject:v26];

    v27 = [(PUImportOneUpCellBadgeView *)v16->_badgeView bottomAnchor];
    v28 = [(PUPhotosSharingGridCell *)v16 photoView];
    v29 = [v28 bottomAnchor];
    v30 = [v27 constraintEqualToAnchor:v29 constant:-6.0];
    [(NSArray *)v22 addObject:v30];

    badgeViewOffsetConstraints = v16->_badgeViewOffsetConstraints;
    v16->_badgeViewOffsetConstraints = v22;
    v32 = v22;

    [MEMORY[0x1E4F28DC8] activateConstraints:v16->_badgeViewOffsetConstraints];
    [(PUImportOneUpCell *)v16 setDisplayDelegate:v16];
    [(PUImportOneUpCell *)v16 setImportItem:v8];
    if (v9) {
      [(PUImportOneUpCell *)v16 setImage:v9 isPlaceholder:0];
    }
    [(PUImportOneUpCell *)v16 refreshThumbnail];
    [(PUImportOneUpTransitionView *)v16 updateBadgeView];
    v33 = [(PUPhotosSharingGridCell *)v16 photoView];
    v34 = [v33 contentHelper];
    [v34 setImageViewEdgeAntialiasingEnabled:1];
  }
  return v16;
}

+ (double)interpolatedValueBetweenInitialValue:(double)a3 andFinalValue:(double)a4 atProgress:(double)a5
{
  return a3 + a5 * (a4 - a3);
}

@end