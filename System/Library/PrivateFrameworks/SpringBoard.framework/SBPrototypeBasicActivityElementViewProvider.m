@interface SBPrototypeBasicActivityElementViewProvider
- (BOOL)_canShowWhileLocked;
- (BOOL)acceptsFullScreenTransitionFromSceneWithIdentifier:(id)a3 ofBundleId:(id)a4;
- (BOOL)handleElementViewEvent:(int64_t)a3;
- (BOOL)hasActivityBehavior;
- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3;
- (NSString)elementIdentifier;
- (SAUILayoutHosting)layoutHost;
- (SBPrototypeBasicActivityElementViewProvider)init;
- (UIColor)keyColor;
- (UIView)leadingView;
- (UIView)trailingView;
- (int64_t)layoutMode;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)preferredLayoutMode;
- (void)_activateApplication;
- (void)_updateLabel;
- (void)setLayoutHost:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
@end

@implementation SBPrototypeBasicActivityElementViewProvider

- (SBPrototypeBasicActivityElementViewProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBPrototypeBasicActivityElementViewProvider;
  v2 = [(SBPrototypeBasicActivityElementViewProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
    startTime = v2->_startTime;
    v2->_startTime = (NSDate *)v3;

    v5 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28C00]);
    formatter = v2->_formatter;
    v2->_formatter = v5;

    [(NSDateComponentsFormatter *)v2->_formatter setUnitsStyle:0];
    [(NSDateComponentsFormatter *)v2->_formatter setZeroFormattingBehavior:0x10000];
    [(NSDateComponentsFormatter *)v2->_formatter setAllowedUnits:192];
  }
  return v2;
}

- (NSString)elementIdentifier
{
  return (NSString *)@"prototype timer countdown";
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  if ((unint64_t)a3 < 2) {
    goto LABEL_4;
  }
  if (a3 == 2)
  {
    v4 = [MEMORY[0x1E4F1C9C8] date];
    startTime = self->_startTime;
    self->_startTime = v4;

    [(SBPrototypeBasicActivityElementViewProvider *)self _updateLabel];
    return 1;
  }
  if (a3 == 3)
  {
LABEL_4:
    [(SBPrototypeBasicActivityElementViewProvider *)self _activateApplication];
    return 1;
  }
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)leadingView
{
  leadingView = self->_leadingView;
  if (!leadingView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v5 = (void *)MEMORY[0x1E4F42A80];
    v6 = (void *)MEMORY[0x1E4F42A98];
    v7 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    objc_super v8 = [v6 configurationWithHierarchicalColor:v7];
    v9 = [v5 systemImageNamed:@"timer" withConfiguration:v8];
    v10 = (UIView *)[v4 initWithImage:v9];
    v11 = self->_leadingView;
    self->_leadingView = v10;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  v19[1] = *MEMORY[0x1E4F143B8];
  trailingView = self->_trailingView;
  if (!trailingView)
  {
    id v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    [(UIView *)v4 setText:@"00:00"];
    v5 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4F43890]];
    uint64_t v6 = *MEMORY[0x1E4F43850];
    v17[0] = *MEMORY[0x1E4F43858];
    v17[1] = v6;
    v18[0] = &unk_1F334B4B0;
    v18[1] = &unk_1F334B4C8;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    v19[0] = v7;
    objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

    uint64_t v15 = *MEMORY[0x1E4F43808];
    v16 = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v10 = [v5 fontDescriptorByAddingAttributes:v9];

    v11 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v10 size:0.0];
    [(UIView *)v4 setFont:v11];

    v12 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    [(UIView *)v4 setTextColor:v12];

    v13 = self->_trailingView;
    self->_trailingView = v4;

    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  if (self->_layoutMode != a3)
  {
    self->_layoutMode = a3;
    if (a3 < 2)
    {
      [(NSTimer *)self->_timer invalidate];
      timer = self->_timer;
      self->_timer = 0;
    }
    else
    {
      objc_initWeak(&location, self);
      v5 = (void *)MEMORY[0x1E4F1CB00];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __68__SBPrototypeBasicActivityElementViewProvider_setLayoutMode_reason___block_invoke;
      v9[3] = &unk_1E6AF61A0;
      objc_copyWeak(&v10, &location);
      uint64_t v6 = [v5 scheduledTimerWithTimeInterval:1 repeats:v9 block:1.0];
      v7 = self->_timer;
      self->_timer = v6;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __68__SBPrototypeBasicActivityElementViewProvider_setLayoutMode_reason___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _updateLabel];
  }
  else {
    [v5 invalidate];
  }
}

- (int64_t)minimumSupportedLayoutMode
{
  return 1;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 2;
}

- (int64_t)preferredLayoutMode
{
  return 2;
}

- (BOOL)acceptsFullScreenTransitionFromSceneWithIdentifier:(id)a3 ofBundleId:(id)a4
{
  return [a4 isEqualToString:@"com.apple.mobiletimer"];
}

- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3
{
  return [a3 isEqualToString:@"com.apple.mobiletimer"];
}

- (UIColor)keyColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] colorWithRed:1.0 green:0.622 blue:0.044 alpha:1.0];
}

- (void)_activateApplication
{
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v2 = MEMORY[0x1E4F1CC38];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F62688]];
  [v5 setObject:v2 forKey:*MEMORY[0x1E4F626A0]];
  [v5 setObject:*MEMORY[0x1E4FA7098] forKey:*MEMORY[0x1E4F62658]];
  uint64_t v3 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v5];
  id v4 = SBSCreateOpenApplicationService();
  [v4 openApplication:@"com.apple.mobiletimer" withOptions:v3 completion:0];
}

- (void)_updateLabel
{
  id v7 = [(SBPrototypeBasicActivityElementViewProvider *)self trailingView];
  formatter = self->_formatter;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSinceDate:self->_startTime];
  id v5 = -[NSDateComponentsFormatter stringFromTimeInterval:](formatter, "stringFromTimeInterval:");
  [v7 setText:v5];

  if (self->_layoutMode != 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    [WeakRetained preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:self];
  }
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
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
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end