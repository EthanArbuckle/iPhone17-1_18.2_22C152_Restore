@interface PRWidgetSuggestionCell
- (BOOL)_descendantsShouldHighlight;
- (CGSize)contentSize;
- (PRWidgetSuggestionCell)initWithFrame:(CGRect)a3;
- (SBHWidgetWrapperViewController)widgetWrapperViewController;
- (UIImage)iconImage;
- (UIImageView)iconImageView;
- (void)setContentSize:(CGSize)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setWidgetWrapperViewController:(id)a3;
@end

@implementation PRWidgetSuggestionCell

- (PRWidgetSuggestionCell)initWithFrame:(CGRect)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PRWidgetSuggestionCell;
  v3 = -[PRWidgetSuggestionCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    iconImageView = v3->_iconImageView;
    v3->_iconImageView = v4;

    [(UIImageView *)v3->_iconImageView setHidden:1];
    v6 = [(PRWidgetSuggestionCell *)v3 contentView];
    [v6 addSubview:v3->_iconImageView];

    [(UIImageView *)v3->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = (void *)MEMORY[0x1E4F28DC8];
    v21 = [(UIImageView *)v3->_iconImageView widthAnchor];
    v20 = [v21 constraintEqualToConstant:20.0];
    v23[0] = v20;
    v19 = [(UIImageView *)v3->_iconImageView heightAnchor];
    v18 = [v19 constraintEqualToConstant:20.0];
    v23[1] = v18;
    v7 = [(UIImageView *)v3->_iconImageView trailingAnchor];
    v8 = [(PRWidgetSuggestionCell *)v3 contentView];
    v9 = [v8 trailingAnchor];
    v10 = [v7 constraintEqualToAnchor:v9 constant:4.0];
    v23[2] = v10;
    v11 = [(UIImageView *)v3->_iconImageView bottomAnchor];
    v12 = [(PRWidgetSuggestionCell *)v3 contentView];
    v13 = [v12 bottomAnchor];
    v14 = [v11 constraintEqualToAnchor:v13 constant:4.0];
    v23[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
    [v17 activateConstraints:v15];
  }
  return v3;
}

- (void)setWidgetWrapperViewController:(id)a3
{
  v33[4] = *MEMORY[0x1E4F143B8];
  v5 = (SBHWidgetWrapperViewController *)a3;
  p_widgetWrapperViewController = &self->_widgetWrapperViewController;
  widgetWrapperViewController = self->_widgetWrapperViewController;
  if (widgetWrapperViewController != v5)
  {
    v8 = [(SBHWidgetWrapperViewController *)widgetWrapperViewController view];
    int v9 = [v8 isDescendantOfView:self];

    if (v9)
    {
      v10 = [(SBHWidgetWrapperViewController *)*p_widgetWrapperViewController parentViewController];
      objc_msgSend(v10, "bs_removeChildViewController:", *p_widgetWrapperViewController);
    }
    objc_storeStrong((id *)&self->_widgetWrapperViewController, a3);
    if (*p_widgetWrapperViewController)
    {
      v11 = [(SBHWidgetWrapperViewController *)*p_widgetWrapperViewController view];
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
      v12 = [(PRWidgetSuggestionCell *)self contentView];
      v13 = [(PRWidgetSuggestionCell *)self iconImageView];
      [v12 insertSubview:v11 belowSubview:v13];

      v25 = (void *)MEMORY[0x1E4F28DC8];
      v31 = [v11 leadingAnchor];
      v32 = [(PRWidgetSuggestionCell *)self contentView];
      v30 = [v32 leadingAnchor];
      v29 = [v31 constraintEqualToAnchor:v30];
      v33[0] = v29;
      v27 = [v11 trailingAnchor];
      v28 = [(PRWidgetSuggestionCell *)self contentView];
      v26 = [v28 trailingAnchor];
      v24 = [v27 constraintEqualToAnchor:v26];
      v33[1] = v24;
      v23 = [v11 topAnchor];
      v14 = [(PRWidgetSuggestionCell *)self contentView];
      v15 = [v14 topAnchor];
      v16 = [v23 constraintEqualToAnchor:v15];
      v33[2] = v16;
      v17 = [v11 bottomAnchor];
      v18 = [(PRWidgetSuggestionCell *)self contentView];
      v19 = [v18 bottomAnchor];
      v20 = [v17 constraintEqualToAnchor:v19];
      v33[3] = v20;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
      objc_super v22 = v21 = v5;
      [v25 activateConstraints:v22];

      v5 = v21;
    }
  }
}

- (void)setIconImage:(id)a3
{
  -[UIImageView setImage:](self->_iconImageView, "setImage:");
  iconImageView = self->_iconImageView;
  [(UIImageView *)iconImageView setHidden:a3 == 0];
}

- (UIImage)iconImage
{
  return [(UIImageView *)self->_iconImageView image];
}

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (SBHWidgetWrapperViewController)widgetWrapperViewController
{
  return self->_widgetWrapperViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetWrapperViewController, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end