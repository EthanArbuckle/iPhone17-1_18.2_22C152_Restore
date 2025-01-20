@interface UGCPOIEnrichmentEditorCell
- (BOOL)showBottomHairline;
- (BOOL)showTopHairline;
- (UGCPOIEnrichmentEditorCell)initWithFrame:(CGRect)a3;
- (void)setShowBottomHairline:(BOOL)a3;
- (void)setShowTopHairline:(BOOL)a3;
@end

@implementation UGCPOIEnrichmentEditorCell

- (UGCPOIEnrichmentEditorCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UGCPOIEnrichmentEditorCell;
  v3 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(UGCPOIEnrichmentEditorCell *)v3 _mapsui_resetLayoutMargins];
  }
  return v4;
}

- (void)setShowTopHairline:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UGCPOIEnrichmentEditorCell *)self showTopHairline] != a3)
  {
    if (v3)
    {
      v5 = -[UGCHairlineView initWithFrame:]([UGCHairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      topHairlineView = self->_topHairlineView;
      self->_topHairlineView = v5;

      [(UGCHairlineView *)self->_topHairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UGCPOIEnrichmentEditorCell *)self addSubview:self->_topHairlineView];
      v18 = [(UGCHairlineView *)self->_topHairlineView topAnchor];
      v7 = [(UGCPOIEnrichmentEditorCell *)self topAnchor];
      v8 = [v18 constraintEqualToAnchor:v7];
      v19[0] = v8;
      v9 = [(UGCHairlineView *)self->_topHairlineView leadingAnchor];
      v10 = [(UGCPOIEnrichmentEditorCell *)self layoutMarginsGuide];
      v11 = [v10 leadingAnchor];
      v12 = [v9 constraintEqualToAnchor:v11];
      v19[1] = v12;
      v13 = [(UGCHairlineView *)self->_topHairlineView trailingAnchor];
      v14 = [(UGCPOIEnrichmentEditorCell *)self trailingAnchor];
      v15 = [v13 constraintEqualToAnchor:v14];
      v19[2] = v15;
      v16 = +[NSArray arrayWithObjects:v19 count:3];
      +[NSLayoutConstraint activateConstraints:v16];
    }
    else
    {
      v17 = self->_topHairlineView;
      [(UGCHairlineView *)v17 removeFromSuperview];
    }
  }
}

- (BOOL)showTopHairline
{
  return self->_topHairlineView != 0;
}

- (void)setShowBottomHairline:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UGCPOIEnrichmentEditorCell *)self showBottomHairline] != a3)
  {
    if (v3)
    {
      v5 = -[UGCHairlineView initWithFrame:]([UGCHairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      bottomHairlineView = self->_bottomHairlineView;
      self->_bottomHairlineView = v5;

      [(UGCHairlineView *)self->_bottomHairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UGCPOIEnrichmentEditorCell *)self addSubview:self->_bottomHairlineView];
      v18 = [(UGCHairlineView *)self->_bottomHairlineView bottomAnchor];
      v7 = [(UGCPOIEnrichmentEditorCell *)self bottomAnchor];
      v8 = [v18 constraintEqualToAnchor:v7];
      v19[0] = v8;
      v9 = [(UGCHairlineView *)self->_bottomHairlineView leadingAnchor];
      v10 = [(UGCPOIEnrichmentEditorCell *)self layoutMarginsGuide];
      v11 = [v10 leadingAnchor];
      v12 = [v9 constraintEqualToAnchor:v11];
      v19[1] = v12;
      v13 = [(UGCHairlineView *)self->_bottomHairlineView trailingAnchor];
      v14 = [(UGCPOIEnrichmentEditorCell *)self trailingAnchor];
      v15 = [v13 constraintEqualToAnchor:v14];
      v19[2] = v15;
      v16 = +[NSArray arrayWithObjects:v19 count:3];
      +[NSLayoutConstraint activateConstraints:v16];
    }
    else
    {
      v17 = self->_bottomHairlineView;
      [(UGCHairlineView *)v17 removeFromSuperview];
    }
  }
}

- (BOOL)showBottomHairline
{
  return self->_bottomHairlineView != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomHairlineView, 0);

  objc_storeStrong((id *)&self->_topHairlineView, 0);
}

@end