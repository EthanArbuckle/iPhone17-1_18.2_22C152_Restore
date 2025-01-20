@interface PRUISPosterContentViewCoordinator
- (BSUIVibrancyEffectView)obscurableContentVibrancyView;
- (CGRect)primaryContentTightFrame;
- (PRUISPosterContentViewCoordinator)initWithBounds:(CGRect)a3;
- (UIView)obscurableContentView;
- (UIView)obscurableOverlayView;
- (UIView)overlayContentView;
- (UIView)vibrantObscurableContentView;
- (id)updateContentViewsWithContentStyle:(id)a3 initialAppearance:(id)a4;
- (void)setObscurableOverlayView:(id)a3;
- (void)setPrimaryContentTightFrame:(CGRect)a3;
- (void)updateLayoutForChangedVibrantObscuredSubviewBounds;
@end

@implementation PRUISPosterContentViewCoordinator

- (PRUISPosterContentViewCoordinator)initWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)PRUISPosterContentViewCoordinator;
  result = [(PRUISPosterContentViewCoordinator *)&v8 init];
  if (result)
  {
    result->_bounds.origin.CGFloat x = x;
    result->_bounds.origin.CGFloat y = y;
    result->_bounds.size.CGFloat width = width;
    result->_bounds.size.CGFloat height = height;
  }
  return result;
}

- (UIView)obscurableContentView
{
  obscurableContentContainerView = self->_obscurableContentContainerView;
  if (!obscurableContentContainerView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
    v5 = self->_obscurableContentContainerView;
    self->_obscurableContentContainerView = v4;

    [(UIView *)self->_obscurableContentContainerView setAutoresizingMask:18];
    obscurableContentContainerView = self->_obscurableContentContainerView;
  }

  return obscurableContentContainerView;
}

- (BSUIVibrancyEffectView)obscurableContentVibrancyView
{
  obscurableContentVibrancyView = self->_obscurableContentVibrancyView;
  if (!obscurableContentVibrancyView)
  {
    v4 = (BSUIVibrancyEffectView *)objc_msgSend(objc_alloc(MEMORY[0x263F29D68]), "initWithFrame:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
    v5 = self->_obscurableContentVibrancyView;
    self->_obscurableContentVibrancyView = v4;

    [(BSUIVibrancyEffectView *)self->_obscurableContentVibrancyView setAutoresizingMask:18];
    v6 = [(BSUIVibrancyEffectView *)self->_obscurableContentVibrancyView contentView];
    [v6 setAutoresizingMask:18];

    v7 = [(PRUISPosterContentViewCoordinator *)self obscurableContentView];
    [v7 addSubview:self->_obscurableContentVibrancyView];

    obscurableContentVibrancyView = self->_obscurableContentVibrancyView;
  }

  return obscurableContentVibrancyView;
}

- (UIView)vibrantObscurableContentView
{
  v2 = [(PRUISPosterContentViewCoordinator *)self obscurableContentVibrancyView];
  v3 = [v2 contentView];

  return (UIView *)v3;
}

- (UIView)overlayContentView
{
  overlayContentView = self->_overlayContentView;
  if (!overlayContentView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
    v5 = self->_overlayContentView;
    self->_overlayContentView = v4;

    [(UIView *)self->_overlayContentView setAutoresizingMask:18];
    overlayContentView = self->_overlayContentView;
  }

  return overlayContentView;
}

- (UIView)obscurableOverlayView
{
  obscurableOverlayView = self->_obscurableOverlayView;
  if (!obscurableOverlayView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
    v5 = self->_obscurableOverlayView;
    self->_obscurableOverlayView = v4;

    [(UIView *)self->_obscurableOverlayView setAutoresizingMask:18];
    v6 = [(PRUISPosterContentViewCoordinator *)self obscurableContentView];
    [v6 addSubview:self->_obscurableOverlayView];

    obscurableOverlayView = self->_obscurableOverlayView;
  }

  return obscurableOverlayView;
}

- (id)updateContentViewsWithContentStyle:(id)a3 initialAppearance:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  obscurableContentVibrancyView = self->_obscurableContentVibrancyView;
  v10 = v8;
  if (obscurableContentVibrancyView)
  {
    v11 = [(BSUIVibrancyEffectView *)obscurableContentVibrancyView contentView];
    [v11 setNeedsLayout];

    v12 = [(BSUIVibrancyEffectView *)self->_obscurableContentVibrancyView contentView];
    [v12 layoutIfNeeded];

    [(PRPosterContentStyleVibrantContentRenderer *)self->_vibrantContentStyleRenderer clearAllStyles];
    v13 = [(BSUIVibrancyEffectView *)self->_obscurableContentVibrancyView contentView];
    v14 = [v13 subviews];

    double x = *MEMORY[0x263F001A8];
    double y = *(double *)(MEMORY[0x263F001A8] + 8);
    double width = *(double *)(MEMORY[0x263F001A8] + 16);
    double height = *(double *)(MEMORY[0x263F001A8] + 24);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v19 = v14;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "frame", (void)v35);
          v44.origin.double x = v24;
          v44.origin.double y = v25;
          v44.size.double width = v26;
          v44.size.double height = v27;
          v42.origin.double x = x;
          v42.origin.double y = y;
          v42.size.double width = width;
          v42.size.double height = height;
          CGRect v43 = CGRectUnion(v42, v44);
          double x = v43.origin.x;
          double y = v43.origin.y;
          double width = v43.size.width;
          double height = v43.size.height;
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v21);
    }

    if (CGRectIsEmpty(self->_primaryContentTightFrame))
    {
      self->_primaryContentTightFrame.origin.double x = x;
      self->_primaryContentTightFrame.origin.double y = y;
      self->_primaryContentTightFrame.size.double width = width;
      self->_primaryContentTightFrame.size.double height = height;
    }
    vibrantContentStyleRenderer = self->_vibrantContentStyleRenderer;
    if (vibrantContentStyleRenderer)
    {
      -[PRPosterContentStyleVibrantContentRenderer setContentBoundingRect:](vibrantContentStyleRenderer, "setContentBoundingRect:", x, y, width, height);
      -[PRPosterContentStyleVibrantContentRenderer setStyleBoundingRect:](self->_vibrantContentStyleRenderer, "setStyleBoundingRect:", self->_primaryContentTightFrame.origin.x, self->_primaryContentTightFrame.origin.y, self->_primaryContentTightFrame.size.width, self->_primaryContentTightFrame.size.height);
    }
    else
    {
      id v29 = objc_alloc(MEMORY[0x263F5F4E0]);
      v30 = self->_obscurableContentVibrancyView;
      v31 = [(BSUIVibrancyEffectView *)v30 contentView];
      v32 = (PRPosterContentStyleVibrantContentRenderer *)objc_msgSend(v29, "initWithVibrancyView:contentView:contentBoundingRect:styleBoundingRect:initialAppearance:", v30, v31, v8, x, y, width, height, self->_primaryContentTightFrame.origin.x, self->_primaryContentTightFrame.origin.y, self->_primaryContentTightFrame.size.width, self->_primaryContentTightFrame.size.height);
      v33 = self->_vibrantContentStyleRenderer;
      self->_vibrantContentStyleRenderer = v32;
    }
    objc_msgSend(v7, "applyStyleWithRenderer:", self->_vibrantContentStyleRenderer, (void)v35);
    objc_storeStrong((id *)&self->_currentStyle, a3);
    v10 = [(PRPosterContentStyleVibrantContentRenderer *)self->_vibrantContentStyleRenderer currentAppearance];
  }

  return v10;
}

- (void)updateLayoutForChangedVibrantObscuredSubviewBounds
{
  if (self->_vibrantContentStyleRenderer) {
    id v2 = [(PRUISPosterContentViewCoordinator *)self updateContentViewsWithContentStyle:self->_currentStyle initialAppearance:0];
  }
}

- (void)setPrimaryContentTightFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_primaryContentTightFrame, a3))
  {
    self->_primaryContentTightFrame.origin.CGFloat x = x;
    self->_primaryContentTightFrame.origin.CGFloat y = y;
    self->_primaryContentTightFrame.size.CGFloat width = width;
    self->_primaryContentTightFrame.size.CGFloat height = height;
    [(PRUISPosterContentViewCoordinator *)self updateLayoutForChangedVibrantObscuredSubviewBounds];
  }
}

- (void)setObscurableOverlayView:(id)a3
{
}

- (CGRect)primaryContentTightFrame
{
  double x = self->_primaryContentTightFrame.origin.x;
  double y = self->_primaryContentTightFrame.origin.y;
  double width = self->_primaryContentTightFrame.size.width;
  double height = self->_primaryContentTightFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantContentStyleRenderer, 0);
  objc_storeStrong((id *)&self->_currentStyle, 0);
  objc_storeStrong((id *)&self->_obscurableOverlayView, 0);
  objc_storeStrong((id *)&self->_overlayContentView, 0);
  objc_storeStrong((id *)&self->_obscurableContentContainerView, 0);

  objc_storeStrong((id *)&self->_obscurableContentVibrancyView, 0);
}

@end