@interface PXMemoryView
- (CGRect)_performLayoutInRect:(CGRect)a3 applyToSubviews:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXDisplayAssetContentView)displayAssetView;
- (PXMemoryView)init;
- (PXMemoryViewModel)viewModel;
- (PXMemoryViewPresentationDelegate)presentationDelegate;
- (PXTitleSubtitleUILabel)titleSubtitleLabel;
- (UIView)highlightView;
- (UIView)overlayView;
- (void)_didTap:(id)a3;
- (void)_updateHighlightedIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateKeyAssetIfNeeded;
- (void)_updateSpecIfNeeded;
- (void)_updateTitleSubtitleIfNeeded;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDisplayAssetView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PXMemoryView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAssetView, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_titleSubtitleLabel, 0);
}

- (PXDisplayAssetContentView)displayAssetView
{
  return self->_displayAssetView;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (PXMemoryViewPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (PXMemoryViewPresentationDelegate *)WeakRetained;
}

- (PXMemoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXMemoryViewModelObservationContext != a5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXMemoryView.m" lineNumber:252 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 3) != 0)
  {
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[PXMemoryView observable:didChange:context:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXMemoryView.m", 237, @"invalidating %lu after it already has been updated", 1);
      goto LABEL_29;
    }
    self->_updateFlags.needsUpdate |= 1uLL;
  }
  if ((v6 & 4) != 0)
  {
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 2) != 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[PXMemoryView observable:didChange:context:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXMemoryView.m", 240, @"invalidating %lu after it already has been updated", 2);
      goto LABEL_29;
    }
    self->_updateFlags.needsUpdate |= 2uLL;
  }
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if ((v6 & 8) != 0)
  {
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 4) != 0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[PXMemoryView observable:didChange:context:]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXMemoryView.m", 243, @"invalidating %lu after it already has been updated", 4);
      goto LABEL_29;
    }
    needsUpdate |= 4uLL;
    p_updateFlags->unint64_t needsUpdate = needsUpdate;
  }
  if ((v6 & 0x10) != 0)
  {
    if (!self->_updateFlags.isPerformingUpdate || (self->_updateFlags.updated & 8) == 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      goto LABEL_20;
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"-[PXMemoryView observable:didChange:context:]"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXMemoryView.m", 246, @"invalidating %lu after it already has been updated", 8);
LABEL_29:

    abort();
  }
  if (needsUpdate)
  {
LABEL_20:
    id v15 = v9;
    [(PXMemoryView *)self setNeedsLayout];
    id v9 = v15;
  }
}

- (void)_didTap:(id)a3
{
  id v4 = [(PXMemoryView *)self presentationDelegate];
  [v4 presentDetailsForMemoryView:self];
}

- (CGRect)_performLayoutInRect:(CGRect)a3 applyToSubviews:(BOOL)a4
{
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    v8 = [(PXMemoryView *)self displayAssetView];
    objc_msgSend(v8, "setFrame:", x, y, width, width);

    id v9 = [(PXMemoryView *)self overlayView];
    objc_msgSend(v9, "setFrame:", x, y, width, width);

    v10 = [(PXMemoryView *)self highlightView];
    objc_msgSend(v10, "setFrame:", x, y, width, width);

    v11 = [(PXMemoryView *)self titleSubtitleLabel];
    objc_msgSend(v11, "setFrame:", x, y, width, width);
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = width;
  result.size.height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)_updateSpecIfNeeded
{
  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = [NSString stringWithUTF8String:"-[PXMemoryView _updateSpecIfNeeded]"];
    [v15 handleFailureInFunction:v16, @"PXMemoryView.m", 197, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 8uLL;
  if ((needsUpdate & 8) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
    [(PXMemoryView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    id v17 = [(PXMemoryView *)self viewModel];
    double v13 = objc_msgSend(off_1E5DA9618, "memoriesTitleSubtitleSpecForTileKind:viewMode:boundedByRect:", 1, v17, v6, v8, v10, v12);
    double v14 = [(PXMemoryView *)self titleSubtitleLabel];
    [v14 setSpec:v13];
  }
}

- (void)_updateHighlightedIfNeeded
{
  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    double v8 = [NSString stringWithUTF8String:"-[PXMemoryView _updateHighlightedIfNeeded]"];
    [v7 handleFailureInFunction:v8, @"PXMemoryView.m", 189, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 4uLL;
  if ((needsUpdate & 4) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
    double v5 = [(PXMemoryView *)self viewModel];
    int v6 = [v5 isHighlighted];

    id v9 = [(PXMemoryView *)self highlightView];
    [v9 setHidden:v6 ^ 1u];
  }
}

- (void)_updateKeyAssetIfNeeded
{
  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    double v8 = [NSString stringWithUTF8String:"-[PXMemoryView _updateKeyAssetIfNeeded]"];
    [v7 handleFailureInFunction:v8, @"PXMemoryView.m", 176, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 2uLL;
  if ((needsUpdate & 2) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
    double v5 = [(PXMemoryView *)self viewModel];
    id v9 = [v5 keyAsset];

    if (v9)
    {
      int v6 = +[PXDisplayAssetContentView checkOutViewForAsset:v9];
      [v6 setCanDisplayLoadingIndicator:1];
    }
    else
    {
      int v6 = 0;
    }
    [(PXMemoryView *)self setDisplayAssetView:v6];
  }
}

- (void)_updateTitleSubtitleIfNeeded
{
  p_updateFlags = &self->_updateFlags;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    double v13 = [NSString stringWithUTF8String:"-[PXMemoryView _updateTitleSubtitleIfNeeded]"];
    [v12 handleFailureInFunction:v13, @"PXMemoryView.m", 166, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 1uLL;
  if (needsUpdate)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    id v14 = [(PXMemoryView *)self viewModel];
    double v5 = [(PXMemoryView *)self titleSubtitleLabel];
    uint64_t v6 = [v14 localizedTitle];
    double v7 = (void *)v6;
    if (v6) {
      double v8 = (__CFString *)v6;
    }
    else {
      double v8 = &stru_1F00B0030;
    }
    [v5 setTitleText:v8];

    uint64_t v9 = [v14 localizedDateText];
    double v10 = (void *)v9;
    if (v9) {
      double v11 = (__CFString *)v9;
    }
    else {
      double v11 = &stru_1F00B0030;
    }
    [v5 setSubtitleText:v11];
  }
}

- (void)_updateIfNeeded
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  if (self->_updateFlags.needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      double v5 = [NSString stringWithUTF8String:"-[PXMemoryView _updateIfNeeded]"];
      [v4 handleFailureInFunction:v5, @"PXMemoryView.m", 157, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 0;
    [(PXMemoryView *)self _updateTitleSubtitleIfNeeded];
    [(PXMemoryView *)self _updateKeyAssetIfNeeded];
    [(PXMemoryView *)self _updateHighlightedIfNeeded];
    [(PXMemoryView *)self _updateSpecIfNeeded];
    p_updateFlags->isPerformingUpdate = 0;
    if (p_updateFlags->needsUpdate)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXMemoryView _updateIfNeeded]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXMemoryView.m", 162, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PXMemoryView _performLayoutInRect:applyToSubviews:](self, "_performLayoutInRect:applyToSubviews:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  double v4 = v3;
  double v6 = v5;
  result.height = v6;
  result.double width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXMemoryView;
  [(PXMemoryView *)&v3 layoutSubviews];
  [(PXMemoryView *)self _updateIfNeeded];
  [(PXMemoryView *)self bounds];
  -[PXMemoryView _performLayoutInRect:applyToSubviews:](self, "_performLayoutInRect:applyToSubviews:", 1);
}

- (void)setFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXMemoryView;
  -[PXMemoryView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 0xA) != 0)
  {
    double v4 = [MEMORY[0x1E4F28B00] currentHandler];
    double v5 = [NSString stringWithUTF8String:"-[PXMemoryView setFrame:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXMemoryView.m", 138, @"invalidating %lu after it already has been updated", 10);

    abort();
  }
  self->_updateFlags.needsUpdate |= 0xAuLL;
}

- (void)setDisplayAssetView:(id)a3
{
  double v12 = (PXDisplayAssetContentView *)a3;
  p_displayAssetView = &self->_displayAssetView;
  objc_super v6 = self->_displayAssetView;
  if (v6 == v12)
  {
  }
  else
  {
    id v7 = v6;
    char v8 = -[PXDisplayAssetContentView isEqual:](v6, "isEqual:");

    if ((v8 & 1) == 0)
    {
      if (*p_displayAssetView)
      {
        [(PXDisplayAssetContentView *)*p_displayAssetView removeFromSuperview];
        +[PXDisplayAssetContentView checkInView:*p_displayAssetView];
      }
      objc_storeStrong((id *)&self->_displayAssetView, a3);
      if (*p_displayAssetView)
      {
        uint64_t v9 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
        [(PXDisplayAssetContentView *)*p_displayAssetView setBackgroundColor:v9];

        [(PXDisplayAssetContentView *)*p_displayAssetView setContentMode:2];
        double v10 = objc_alloc_init(PXPhotoKitUIMediaProvider);
        [(PXDisplayAssetContentView *)*p_displayAssetView setMediaProvider:v10];

        double v11 = [(PXDisplayAssetContentView *)*p_displayAssetView layer];
        [v11 setAllowsGroupBlending:1];

        [(PXMemoryView *)self addSubview:*p_displayAssetView];
        [(PXMemoryView *)self sendSubviewToBack:*p_displayAssetView];
      }
    }
  }
}

- (void)setViewModel:(id)a3
{
  double v12 = (PXMemoryViewModel *)a3;
  p_viewModel = &self->_viewModel;
  objc_super v6 = self->_viewModel;
  if (v6 == v12)
  {
  }
  else
  {
    id v7 = v6;
    char v8 = [(PXMemoryViewModel *)v6 isEqual:v12];

    uint64_t v9 = v12;
    if (v8) {
      goto LABEL_8;
    }
    [(PXMemoryViewModel *)*p_viewModel unregisterChangeObserver:self context:PXMemoryViewModelObservationContext];
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PXMemoryViewModel *)*p_viewModel registerChangeObserver:self context:PXMemoryViewModelObservationContext];
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 0xB) != 0)
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      double v11 = [NSString stringWithUTF8String:"-[PXMemoryView setViewModel:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PXMemoryView.m", 108, @"invalidating %lu after it already has been updated", 11);

      abort();
    }
    self->_updateFlags.needsUpdate |= 0xBuLL;
    [(PXMemoryView *)self setNeedsLayout];
  }
  uint64_t v9 = v12;
LABEL_8:
}

- (UIView)highlightView
{
  highlightView = self->_highlightView;
  if (!highlightView)
  {
    double v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    double v5 = self->_highlightView;
    self->_highlightView = v4;

    objc_super v6 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIView *)self->_highlightView setBackgroundColor:v6];

    [(UIView *)self->_highlightView setAlpha:0.3];
    [(UIView *)self->_highlightView setHidden:1];
    [(PXMemoryView *)self addSubview:self->_highlightView];
    highlightView = self->_highlightView;
  }
  return highlightView;
}

- (UIView)overlayView
{
  overlayView = self->_overlayView;
  if (!overlayView)
  {
    double v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    double v5 = self->_overlayView;
    self->_overlayView = v4;

    objc_super v6 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIView *)self->_overlayView setBackgroundColor:v6];

    [(UIView *)self->_overlayView setAlpha:0.2];
    [(PXMemoryView *)self addSubview:self->_overlayView];
    overlayView = self->_overlayView;
  }
  return overlayView;
}

- (PXTitleSubtitleUILabel)titleSubtitleLabel
{
  titleSubtitleLabel = self->_titleSubtitleLabel;
  if (!titleSubtitleLabel)
  {
    double v4 = objc_alloc_init(PXTitleSubtitleUILabel);
    double v5 = self->_titleSubtitleLabel;
    self->_titleSubtitleLabel = v4;

    [(PXTitleSubtitleUILabel *)self->_titleSubtitleLabel setRendersTextAsynchronously:0];
    [(PXMemoryView *)self addSubview:self->_titleSubtitleLabel];
    titleSubtitleLabel = self->_titleSubtitleLabel;
  }
  return titleSubtitleLabel;
}

- (PXMemoryView)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXMemoryView;
  v2 = -[PXMemoryView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  objc_super v3 = v2;
  if (v2)
  {
    double v4 = [(PXMemoryView *)v2 overlayView];
    double v5 = [(PXMemoryView *)v3 highlightView];
    objc_super v6 = [(PXMemoryView *)v3 titleSubtitleLabel];
    [(PXMemoryView *)v3 setClipsToBounds:1];
    id v7 = [(PXMemoryView *)v3 layer];
    [v7 setCornerRadius:4.0];

    char v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v3 action:sel__didTap_];
    [(PXMemoryView *)v3 addGestureRecognizer:v8];
  }
  return v3;
}

@end