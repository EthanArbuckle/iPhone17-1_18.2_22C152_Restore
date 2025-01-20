@interface SBPrototypeProminentPresentingActivityElementViewProvider
- (BOOL)_canShowWhileLocked;
- (BOOL)handleElementViewEvent:(int64_t)a3;
- (BOOL)hasAlertBehavior;
- (BOOL)isProminent;
- (BOOL)showsTrailing;
- (NSString)elementIdentifier;
- (SAUILayoutHosting)layoutHost;
- (SBPrototypeProminentPresentingActivityElementViewProvider)init;
- (UIView)leadingView;
- (UIView)minimalView;
- (UIView)trailingView;
- (int64_t)layoutMode;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)preferredLayoutMode;
- (int64_t)systemApertureLayoutCustomizingOptions;
- (void)setLayoutHost:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
- (void)setProminent:(BOOL)a3;
- (void)setShowsTrailing:(BOOL)a3;
@end

@implementation SBPrototypeProminentPresentingActivityElementViewProvider

- (SBPrototypeProminentPresentingActivityElementViewProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBPrototypeProminentPresentingActivityElementViewProvider;
  result = [(SBPrototypeProminentPresentingActivityElementViewProvider *)&v3 init];
  if (result)
  {
    result->_preferredLayoutMode = 2;
    *(_WORD *)&result->_prominent = 1;
  }
  return result;
}

- (void)setProminent:(BOOL)a3
{
  if (self->_prominent != a3)
  {
    self->_prominent = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
  }
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (void)setShowsTrailing:(BOOL)a3
{
  if (self->_showsTrailing != a3)
  {
    self->_showsTrailing = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
  }
}

- (BOOL)showsTrailing
{
  return self->_showsTrailing;
}

- (NSString)elementIdentifier
{
  return (NSString *)@"prototype.prominent.alert";
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

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  self->_layoutMode = a3;
}

- (int64_t)minimumSupportedLayoutMode
{
  return 2;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 2;
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  if (self->_showsTrailing) {
    return self->_prominent;
  }
  else {
    return self->_prominent | 2;
  }
}

- (UIView)leadingView
{
  leadingView = self->_leadingView;
  if (!leadingView)
  {
    v4 = objc_alloc_init(SBPrototypeHeightFittingSizeView);
    v5 = self->_leadingView;
    self->_leadingView = &v4->super;

    id v6 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v7 = (void *)MEMORY[0x1E4F42A80];
    v8 = (void *)MEMORY[0x1E4F42A98];
    v9 = [MEMORY[0x1E4F428B8] whiteColor];
    v10 = [v8 configurationWithHierarchicalColor:v9];
    v11 = [v7 systemImageNamed:@"flashlight.on.fill" withConfiguration:v10];
    v12 = (void *)[v6 initWithImage:v11];

    [v12 setContentMode:1];
    [(UIView *)self->_leadingView addSubview:v12];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [v12 leadingAnchor];
    v14 = [(UIView *)self->_leadingView leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    v16 = [v12 trailingAnchor];
    v17 = [(UIView *)self->_leadingView trailingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    v19 = [v12 topAnchor];
    v20 = [(UIView *)self->_leadingView topAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    v22 = [v12 bottomAnchor];
    v23 = [(UIView *)self->_leadingView bottomAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v24 setActive:1];

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  trailingView = self->_trailingView;
  if (!trailingView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(UIView *)v4 setText:@"ON"];
    v5 = (void *)MEMORY[0x1E4F42A30];
    id v6 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43890]];
    v7 = [v5 fontWithDescriptor:v6 size:0.0];
    [(UIView *)v4 setFont:v7];

    v8 = [MEMORY[0x1E4F428B8] systemYellowColor];
    [(UIView *)v4 setTextColor:v8];

    v9 = self->_trailingView;
    self->_trailingView = v4;

    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (UIView)minimalView
{
  return self->_leadingView;
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (SAUILayoutHosting)layoutHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return (SAUILayoutHosting *)WeakRetained;
}

- (void)setLayoutHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_layoutHost);
}

@end