@interface SBHAddWidgetSheetGalleryCollectionViewCell
- (SBHAddWidgetSheetGalleryCollectionViewCell)initWithFrame:(CGRect)a3;
- (SBHWidgetWrapperViewController)widgetWrapperViewController;
- (UILabel)debugLabel;
- (UIView)highlightView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlightView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setWidgetWrapperViewController:(id)a3;
@end

@implementation SBHAddWidgetSheetGalleryCollectionViewCell

- (SBHAddWidgetSheetGalleryCollectionViewCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBHAddWidgetSheetGalleryCollectionViewCell;
  v3 = -[SBHAddWidgetSheetGalleryCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SBHAddWidgetSheetGalleryCollectionViewCell *)v3 contentView];
    v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    highlightView = v4->_highlightView;
    v4->_highlightView = v6;

    [(UIView *)v4->_highlightView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = v4->_highlightView;
    v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.1];
    [(UIView *)v8 setBackgroundColor:v9];

    [v5 addSubview:v4->_highlightView];
    [(UIView *)v4->_highlightView setAlpha:0.0];
  }
  return v4;
}

- (void)setWidgetWrapperViewController:(id)a3
{
  v49[4] = *MEMORY[0x1E4F143B8];
  v5 = (SBHWidgetWrapperViewController *)a3;
  p_widgetWrapperViewController = &self->_widgetWrapperViewController;
  widgetWrapperViewController = self->_widgetWrapperViewController;
  if (widgetWrapperViewController != v5)
  {
    v8 = [(SBHWidgetWrapperViewController *)widgetWrapperViewController view];
    v9 = [v8 superview];
    v10 = [(SBHAddWidgetSheetGalleryCollectionViewCell *)self contentView];

    if (v9 == v10)
    {
      objc_super v11 = [(SBHWidgetWrapperViewController *)*p_widgetWrapperViewController parentViewController];
      objc_msgSend(v11, "bs_removeChildViewController:", *p_widgetWrapperViewController);
    }
    objc_storeStrong((id *)&self->_widgetWrapperViewController, a3);
    if (*p_widgetWrapperViewController)
    {
      v47 = v5;
      v12 = [(SBHAddWidgetSheetGalleryCollectionViewCell *)self contentView];
      v13 = [(SBHWidgetWrapperViewController *)*p_widgetWrapperViewController wrapperView];
      [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v12 addSubview:v13];
      v34 = (void *)MEMORY[0x1E4F28DC8];
      v44 = [v13 leadingAnchor];
      v42 = [v12 leadingAnchor];
      v40 = [v44 constraintEqualToAnchor:v42];
      v49[0] = v40;
      v38 = [v13 trailingAnchor];
      v36 = [v12 trailingAnchor];
      v14 = [v38 constraintEqualToAnchor:v36];
      v49[1] = v14;
      v15 = [v13 topAnchor];
      v16 = [v12 topAnchor];
      v17 = [v15 constraintEqualToAnchor:v16];
      v49[2] = v17;
      v18 = [v13 bottomAnchor];
      v46 = v12;
      v19 = [v12 bottomAnchor];
      v20 = [v18 constraintEqualToAnchor:v19];
      v49[3] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
      [v34 activateConstraints:v21];

      v45 = v13;
      v22 = [v13 contentView];
      if (v22)
      {
        v33 = (void *)MEMORY[0x1E4F28DC8];
        v43 = [(UIView *)self->_highlightView leadingAnchor];
        v41 = [v22 leadingAnchor];
        v39 = [v43 constraintEqualToAnchor:v41];
        v48[0] = v39;
        v37 = [(UIView *)self->_highlightView trailingAnchor];
        v35 = [v22 trailingAnchor];
        v32 = [v37 constraintEqualToAnchor:v35];
        v48[1] = v32;
        v23 = [(UIView *)self->_highlightView topAnchor];
        v24 = [v22 topAnchor];
        v25 = [v23 constraintEqualToAnchor:v24];
        v48[2] = v25;
        v26 = [(UIView *)self->_highlightView bottomAnchor];
        v27 = [v22 bottomAnchor];
        v28 = [v26 constraintEqualToAnchor:v27];
        v48[3] = v28;
        v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
        [v33 activateConstraints:v29];
      }
      highlightView = self->_highlightView;
      v5 = v47;
      v31 = [(SBHWidgetWrapperViewController *)v47 wrapperView];
      [v31 cornerRadius];
      -[UIView _setContinuousCornerRadius:](highlightView, "_setContinuousCornerRadius:");
    }
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBHAddWidgetSheetGalleryCollectionViewCell;
  [(SBHAddWidgetSheetGalleryCollectionViewCell *)&v4 layoutSubviews];
  v3 = [(SBHAddWidgetSheetGalleryCollectionViewCell *)self contentView];
  [v3 bringSubviewToFront:self->_highlightView];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v4 = [(SBHWidgetWrapperViewController *)self->_widgetWrapperViewController wrapperView];
  id v5 = [v4 contentView];

  [v5 setHighlighted:v3];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SBHAddWidgetSheetGalleryCollectionViewCell;
  [(SBHAddWidgetSheetGalleryCollectionViewCell *)&v3 prepareForReuse];
  [(SBHAddWidgetSheetGalleryCollectionViewCell *)self setWidgetWrapperViewController:0];
}

- (UILabel)debugLabel
{
  return 0;
}

- (SBHWidgetWrapperViewController)widgetWrapperViewController
{
  return self->_widgetWrapperViewController;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_widgetWrapperViewController, 0);
}

@end