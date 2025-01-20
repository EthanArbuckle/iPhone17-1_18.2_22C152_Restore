@interface ICPasswordChangeView
- (ICPasswordChangeViewController)parentViewController;
- (void)layoutSubviews;
- (void)setParentViewController:(id)a3;
- (void)updateConstraints;
@end

@implementation ICPasswordChangeView

- (void)layoutSubviews
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v3.receiver = self;
  v3.super_class = (Class)ICPasswordChangeView;
  [(ICPasswordChangeView *)&v3 layoutSubviews];
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)updateConstraints
{
  BOOL v3 = ICAccessibilityAccessibilityLargerTextSizesEnabled();
  v4 = (void *)MEMORY[0x1E4F28DC8];
  v5 = [(ICPasswordChangeView *)self parentViewController];
  v6 = v5;
  if (v3)
  {
    v7 = [v5 defaultConstraints];
    [v4 deactivateConstraints:v7];

    v8 = (void *)MEMORY[0x1E4F28DC8];
    v9 = [(ICPasswordChangeView *)self parentViewController];
    [v9 alternateConstraintsForAXLargerTextSizes];
  }
  else
  {
    v10 = [v5 alternateConstraintsForAXLargerTextSizes];
    [v4 deactivateConstraints:v10];

    v8 = (void *)MEMORY[0x1E4F28DC8];
    v9 = [(ICPasswordChangeView *)self parentViewController];
    [v9 defaultConstraints];
  v11 = };
  [v8 activateConstraints:v11];

  v12.receiver = self;
  v12.super_class = (Class)ICPasswordChangeView;
  [(ICPasswordChangeView *)&v12 updateConstraints];
}

- (ICPasswordChangeViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (ICPasswordChangeViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end