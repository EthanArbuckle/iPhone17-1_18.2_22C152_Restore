@interface PXContentSyndicationSectionHeaderView
- (CGSize)_performLayoutInWidth:(double)a3 applyLayoutToSubviews:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXContentSyndicationSectionHeaderView)initWithFrame:(CGRect)a3;
- (PXContentSyndicationSectionHeaderViewDelegate)delegate;
- (PXPhotosSectionHeaderLayoutSpec)spec;
- (SLHighlight)socialLayerHighlight;
- (id)contextMenuItemsForAttributionView:(id)a3;
- (void)_updatePillAlignmentWithTraitCollection:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setSocialLayerHighlight:(id)a3;
- (void)setSpec:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXContentSyndicationSectionHeaderView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_socialLayerHighlight, 0);
  objc_storeStrong((id *)&self->_socialLayerAttributionView, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXContentSyndicationSectionHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXContentSyndicationSectionHeaderViewDelegate *)WeakRetained;
}

- (PXPhotosSectionHeaderLayoutSpec)spec
{
  return self->_spec;
}

- (SLHighlight)socialLayerHighlight
{
  return self->_socialLayerHighlight;
}

- (id)contextMenuItemsForAttributionView:(id)a3
{
  v4 = [(PXContentSyndicationSectionHeaderView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  v6 = (void *)MEMORY[0x1E4F1CBF0];
  v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5)
  {
    v8 = [(PXContentSyndicationSectionHeaderView *)self delegate];
    v7 = [v8 additionalContextMenuActionsForAttributionViewInContentSyndicationHeaderView:self];
  }
  if (v7) {
    v9 = v7;
  }
  else {
    v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (CGSize)_performLayoutInWidth:(double)a3 applyLayoutToSubviews:(BOOL)a4
{
  socialLayerAttributionView = self->_socialLayerAttributionView;
  if (a4)
  {
    [(SLAttributionView *)socialLayerAttributionView prepareLayoutWithMaxWidth:a3 + -32.0];
    -[SLAttributionView sizeThatFits:](self->_socialLayerAttributionView, "sizeThatFits:", a3 + -32.0, 1.79769313e308);
    double v8 = v7 + 16.0;
    -[SLAttributionView setFrame:](self->_socialLayerAttributionView, "setFrame:");
  }
  else if (socialLayerAttributionView)
  {
    -[SLAttributionView sizeThatFits:](socialLayerAttributionView, "sizeThatFits:", a3 + -32.0, 1.79769313e308);
    if (v9 <= 29.5) {
      double v8 = 45.5;
    }
    else {
      double v8 = v9 + 16.0;
    }
  }
  else
  {
    double v8 = 45.5;
  }
  double v10 = a3;
  double v11 = v8;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PXContentSyndicationSectionHeaderView _performLayoutInWidth:applyLayoutToSubviews:](self, "_performLayoutInWidth:applyLayoutToSubviews:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXContentSyndicationSectionHeaderView;
  [(PXContentSyndicationSectionHeaderView *)&v4 layoutSubviews];
  [(PXContentSyndicationSectionHeaderView *)self bounds];
  [(PXContentSyndicationSectionHeaderView *)self _performLayoutInWidth:1 applyLayoutToSubviews:v3];
}

- (void)_updatePillAlignmentWithTraitCollection:(id)a3
{
  id v4 = a3;
  char v5 = +[PXContentSyndicationSettings sharedInstance];
  int v6 = [v5 shouldHorizontallyCenterAttributionViewInGrid];

  double v7 = +[PXContentSyndicationSettings sharedInstance];
  int v8 = [v7 alwaysLeadingAlignAttributionViewOnRegularWidthPads];

  uint64_t v9 = [v4 userInterfaceIdiom];
  uint64_t v10 = [v4 horizontalSizeClass];

  if (v6) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11 && v9 == 1)
  {
    if (v10 == 2) {
      goto LABEL_9;
    }
  }
  else if ((v6 & 1) == 0)
  {
LABEL_9:
    uint64_t v13 = 0;
    goto LABEL_12;
  }
  uint64_t v13 = 1;
LABEL_12:
  socialLayerAttributionView = self->_socialLayerAttributionView;
  [(SLAttributionView *)socialLayerAttributionView updateAlignment:v13];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXContentSyndicationSectionHeaderView;
  [(PXContentSyndicationSectionHeaderView *)&v5 traitCollectionDidChange:a3];
  id v4 = [(PXContentSyndicationSectionHeaderView *)self traitCollection];
  [(PXContentSyndicationSectionHeaderView *)self _updatePillAlignmentWithTraitCollection:v4];
}

- (void)setSpec:(id)a3
{
  int v8 = (PXPhotosSectionHeaderLayoutSpec *)a3;
  objc_super v5 = self->_spec;
  if (v5 == v8)
  {
  }
  else
  {
    int v6 = v5;
    char v7 = [(PXPhotosSectionHeaderLayoutSpec *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      [(PXContentSyndicationSectionHeaderView *)self setNeedsLayout];
    }
  }
}

- (void)setSocialLayerHighlight:(id)a3
{
  v12 = (SLHighlight *)a3;
  objc_super v5 = self->_socialLayerHighlight;
  if (v5 == v12)
  {
  }
  else
  {
    int v6 = v5;
    char v7 = [(SLHighlight *)v5 isEqual:v12];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_socialLayerHighlight, a3);
      [(SLAttributionView *)self->_socialLayerAttributionView removeFromSuperview];
      socialLayerAttributionView = self->_socialLayerAttributionView;
      self->_socialLayerAttributionView = 0;

      PXContentSyndicationAttributionViewForSocialLayerHighlight(self->_socialLayerHighlight, 1);
      uint64_t v9 = (SLAttributionView *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = self->_socialLayerAttributionView;
      self->_socialLayerAttributionView = v9;

      [(SLAttributionView *)self->_socialLayerAttributionView setDelegate:self];
      BOOL v11 = [(PXContentSyndicationSectionHeaderView *)self traitCollection];
      [(PXContentSyndicationSectionHeaderView *)self _updatePillAlignmentWithTraitCollection:v11];

      [(PXContentSyndicationSectionHeaderView *)self addSubview:self->_socialLayerAttributionView];
      [(PXContentSyndicationSectionHeaderView *)self setNeedsLayout];
    }
  }
}

- (PXContentSyndicationSectionHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXContentSyndicationSectionHeaderView;
  double v3 = -[PXContentSyndicationSectionHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXContentSyndicationSectionHeaderView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

@end