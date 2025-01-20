@interface MSTableCell
- (SUPlayerStatus)previewStatus;
- (void)_destroyPreviewProgressView;
- (void)_flipFromPreviewProgressView;
- (void)_flipToPreviewProgressView;
- (void)dealloc;
- (void)setPreviewStatus:(id)a3;
- (void)setPreviewStatus:(id)a3 animated:(BOOL)a4;
@end

@implementation MSTableCell

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MSTableCell;
  [(SUTableCell *)&v3 dealloc];
}

- (void)setPreviewStatus:(id)a3
{
}

- (void)setPreviewStatus:(id)a3 animated:(BOOL)a4
{
  previewStatus = self->_previewStatus;
  if (previewStatus != a3)
  {
    BOOL v5 = a4;

    v8 = (SUPlayerStatus *)a3;
    self->_previewStatus = v8;
    if (v8)
    {
      if (self->_previewContainerView)
      {
        v9 = v8;
      }
      else
      {
        v10 = (void *)[(MSTableCell *)self contentView];
        v11 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", @"PreviewFlipBackground", objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()));
        [v10 frame];
        double v13 = v12;
        double v15 = v14;
        [v11 size];
        v18 = (CGImage *)objc_msgSend(v10, "newSnapshotWithRect:", v13, v15, v16, v17);
        [(UIImageView *)self->_backsideSnapshotView removeFromSuperview];

        self->_backsideSnapshotView = 0;
        if (v18)
        {
          id v19 = objc_alloc(MEMORY[0x263F1C6D0]);
          self->_backsideSnapshotView = (UIImageView *)objc_msgSend(v19, "initWithImage:", objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:", v18));
          CGImageRelease(v18);
        }
        self->_previewContainerView = (UIView *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v11];
        v20 = [(SUTableCell *)self clippingPath];
        if (v20)
        {
          v21 = v20;
          [(UIView *)self->_previewContainerView bounds];
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          [v11 scale];
          CGFloat v27 = v26;
          v34.width = v23;
          v34.height = v25;
          UIGraphicsBeginImageContextWithOptions(v34, 0, v27);
          objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "blackColor"), "set");
          [(UIBezierPath *)v21 fill];
          ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
          id v29 = objc_alloc_init(MEMORY[0x263F157E8]);
          objc_msgSend(v29, "setContents:", -[UIImage CGImage](ImageFromCurrentImageContext, "CGImage"));
          [(CALayer *)[(UIView *)self->_previewContainerView layer] bounds];
          objc_msgSend(v29, "setFrame:");
          [(CALayer *)[(UIView *)self->_previewContainerView layer] setMask:v29];

          UIGraphicsEndImageContext();
        }
        [v10 addSubview:self->_previewContainerView];
        v30 = [MSAudioProgressView alloc];
        [(UIView *)self->_previewContainerView bounds];
        v31 = -[MSAudioProgressView initWithFrame:](v30, "initWithFrame:");
        self->_previewProgressView = v31;
        [(MSAudioProgressView *)v31 setBackgroundColor:[(MSTableCell *)self backgroundColor]];
        if (v5) {
          [(MSTableCell *)self _flipToPreviewProgressView];
        }
        else {
          [(UIView *)self->_previewContainerView addSubview:self->_previewProgressView];
        }
        [(MSTableCell *)self setNeedsLayout];
        v9 = self->_previewStatus;
      }
      previewProgressView = self->_previewProgressView;
      [(MSAudioProgressView *)previewProgressView setPlayerStatus:v9];
    }
    else if (v5)
    {
      [(MSTableCell *)self _flipFromPreviewProgressView];
    }
    else
    {
      [(MSTableCell *)self _destroyPreviewProgressView];
    }
  }
}

- (void)_destroyPreviewProgressView
{
  [(UIImageView *)self->_backsideSnapshotView removeFromSuperview];

  self->_backsideSnapshotView = 0;
  [(UIView *)self->_previewContainerView removeFromSuperview];

  self->_previewContainerView = 0;
  [(MSAudioProgressView *)self->_previewProgressView removeFromSuperview];

  self->_previewProgressView = 0;
  [(MSTableCell *)self setNeedsLayout];
}

- (void)_flipFromPreviewProgressView
{
  [(NSArray *)[(UIView *)self->_previewContainerView subviews] makeObjectsPerformSelector:sel_removeFromSuperview];
  [(UIView *)self->_previewContainerView bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v3, v5, v7, v9);
  [(UIView *)self->_previewContainerView addSubview:v11];
  [v11 addSubview:self->_previewProgressView];
  double v12 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v4, v6, v8, v10);
  objc_msgSend(v12, "setBackgroundColor:", -[MSTableCell backgroundColor](self, "backgroundColor"));
  if (self->_backsideSnapshotView) {
    objc_msgSend(v12, "addSubview:");
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
  dispatch_time_t v13 = dispatch_time(0, 10000000);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__MSTableCell__flipFromPreviewProgressView__block_invoke;
  v14[3] = &unk_264CE8AF8;
  v14[4] = self;
  v14[5] = v12;
  dispatch_after(v13, MEMORY[0x263EF83A0], v14);
}

uint64_t __43__MSTableCell__flipFromPreviewProgressView__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 1112);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__MSTableCell__flipFromPreviewProgressView__block_invoke_2;
  v5[3] = &unk_264CE89E8;
  v5[4] = v2;
  [MEMORY[0x263F1CB60] transitionFromView:v3 toView:v1 duration:0x100000 options:v5 completion:0.6];
  return objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "endIgnoringInteractionEvents");
}

uint64_t __43__MSTableCell__flipFromPreviewProgressView__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _destroyPreviewProgressView];
}

- (void)_flipToPreviewProgressView
{
  [(UIView *)self->_previewContainerView bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v3, v5, v7, v9);
  [(UIView *)self->_previewContainerView addSubview:v11];
  double v12 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v4, v6, v8, v10);
  objc_msgSend(v12, "setBackgroundColor:", -[MSTableCell backgroundColor](self, "backgroundColor"));
  if (self->_backsideSnapshotView) {
    objc_msgSend(v12, "addSubview:");
  }
  [v11 addSubview:v12];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "beginIgnoringInteractionEvents");
  dispatch_time_t v13 = dispatch_time(0, 10000000);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __41__MSTableCell__flipToPreviewProgressView__block_invoke;
  v14[3] = &unk_264CE8AF8;
  v14[4] = v12;
  v14[5] = self;
  dispatch_after(v13, MEMORY[0x263EF83A0], v14);
}

uint64_t __41__MSTableCell__flipToPreviewProgressView__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F1CB60] transitionFromView:*(void *)(a1 + 32) toView:*(void *)(*(void *)(a1 + 40) + 1112) duration:0x200000 options:0 completion:0.6];
  uint64_t v1 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  return [v1 endIgnoringInteractionEvents];
}

- (SUPlayerStatus)previewStatus
{
  return self->_previewStatus;
}

@end