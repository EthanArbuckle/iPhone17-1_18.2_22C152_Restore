@interface SBPrototypeBasicAlertElementViewProvider
- (BOOL)_canShowWhileLocked;
- (BOOL)handleElementViewEvent:(int64_t)a3;
- (BOOL)hasAlertBehavior;
- (NSString)elementIdentifier;
- (UIView)leadingView;
- (UIView)minimalView;
- (UIView)trailingView;
- (unint64_t)layoutAxis;
- (void)setLayoutAxis:(unint64_t)a3;
@end

@implementation SBPrototypeBasicAlertElementViewProvider

- (NSString)elementIdentifier
{
  return (NSString *)@"prototype sparkles alert";
}

- (BOOL)hasAlertBehavior
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  return 0;
}

- (UIView)leadingView
{
  leadingView = self->_leadingView;
  if (!leadingView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v5 = (void *)MEMORY[0x1E4F42A80];
    v6 = (void *)MEMORY[0x1E4F42A98];
    v7 = [MEMORY[0x1E4F428B8] whiteColor];
    v8 = [v6 configurationWithHierarchicalColor:v7];
    v9 = [v5 systemImageNamed:@"sparkles" withConfiguration:v8];
    v10 = (UIView *)[v4 initWithImage:v9];
    v11 = self->_leadingView;
    self->_leadingView = v10;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  trailingView = self->_trailingView;
  if (!trailingView)
  {
    id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(UIView *)v4 setText:@"Demo"];
    v5 = (void *)MEMORY[0x1E4F42A30];
    v6 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43890]];
    v7 = [v5 fontWithDescriptor:v6 size:0.0];
    [(UIView *)v4 setFont:v7];

    v8 = [MEMORY[0x1E4F428B8] systemRedColor];
    [(UIView *)v4 setTextColor:v8];

    v9 = self->_trailingView;
    self->_trailingView = v4;

    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (UIView)minimalView
{
  minimalCompoundView = self->_minimalCompoundView;
  if (!minimalCompoundView)
  {
    id v4 = objc_alloc_init(_SBPrototypeBasicAlertElementCompoundView);
    v5 = self->_minimalCompoundView;
    self->_minimalCompoundView = v4;

    v6 = self->_minimalCompoundView;
    v7 = (void *)MEMORY[0x1E4F42A80];
    v8 = (void *)MEMORY[0x1E4F42A98];
    v9 = [MEMORY[0x1E4F428B8] whiteColor];
    v10 = [v8 configurationWithHierarchicalColor:v9];
    v11 = [v7 systemImageNamed:@"sparkles" withConfiguration:v10];
    [(_SBPrototypeBasicAlertElementCompoundView *)v6 setLeadingImage:v11];

    v12 = self->_minimalCompoundView;
    v13 = (void *)MEMORY[0x1E4F42A80];
    v14 = (void *)MEMORY[0x1E4F42A98];
    v15 = [MEMORY[0x1E4F428B8] whiteColor];
    v16 = [v14 configurationWithHierarchicalColor:v15];
    v17 = [v13 systemImageNamed:@"bubbles.and.sparkles.fill" withConfiguration:v16];
    [(_SBPrototypeBasicAlertElementCompoundView *)v12 setTrailingImage:v17];

    minimalCompoundView = self->_minimalCompoundView;
  }
  return (UIView *)minimalCompoundView;
}

- (unint64_t)layoutAxis
{
  return [(_SBPrototypeBasicAlertElementCompoundView *)self->_minimalCompoundView layoutAxis];
}

- (void)setLayoutAxis:(unint64_t)a3
{
  if (a3 - 1 <= 1 && [(SBPrototypeBasicAlertElementViewProvider *)self layoutAxis] != a3)
  {
    minimalCompoundView = self->_minimalCompoundView;
    [(_SBPrototypeBasicAlertElementCompoundView *)minimalCompoundView setLayoutAxis:a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_minimalCompoundView, 0);
}

@end