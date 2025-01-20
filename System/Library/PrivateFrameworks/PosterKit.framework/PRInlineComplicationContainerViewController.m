@interface PRInlineComplicationContainerViewController
- (BOOL)isFocused;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (PRComplicationDescriptor)complicationDescriptor;
- (PRInlineComplicationContainerViewController)initWithComplicationDescriptor:(id)a3;
- (PRInlineComplicationContainerViewControllerDelegate)delegate;
- (void)_tapGestureRecognized:(id)a3;
- (void)invalidate;
- (void)setComplicationDescriptor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocused:(BOOL)a3;
- (void)setFocused:(BOOL)a3 animated:(BOOL)a4;
- (void)setFocused:(BOOL)a3 animationSettings:(id)a4;
- (void)setVibrancyConfiguration:(id)a3;
- (void)viewDidLoad;
@end

@implementation PRInlineComplicationContainerViewController

- (PRInlineComplicationContainerViewController)initWithComplicationDescriptor:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRInlineComplicationContainerViewController;
  v5 = [(PRInlineComplicationContainerViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PRInlineComplicationContainerViewController *)v5 setComplicationDescriptor:v4];
  }

  return v6;
}

- (void)invalidate
{
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PRInlineComplicationContainerViewController;
  [(PRInlineComplicationContainerViewController *)&v7 viewDidLoad];
  v3 = [(PRInlineComplicationContainerViewController *)self view];
  id v4 = [v3 layer];
  [v4 setHitTestsAsOpaque:1];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__tapGestureRecognized_];
  v6 = [(PRInlineComplicationContainerViewController *)self view];
  [v6 addGestureRecognizer:v5];
}

- (void)setComplicationDescriptor:(id)a3
{
  v5 = (PRComplicationDescriptor *)a3;
  if (self->_complicationDescriptor != v5)
  {
    objc_storeStrong((id *)&self->_complicationDescriptor, a3);
    if (self->_hostViewController)
    {
      -[PRInlineComplicationContainerViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
      [(CHUISWidgetHostViewController *)self->_hostViewController invalidate];
    }
    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F58F58]);
      objc_super v7 = objc_msgSend(v6, "pr_initWithComplicationDescriptor:", v5);

      id v8 = objc_alloc_init(MEMORY[0x1E4F58CE8]);
      [v8 setShowsDateAlongsideText:1];
      id v9 = objc_alloc_init(MEMORY[0x1E4F58CD0]);
      [v9 setSize:&unk_1ED9EF230];
      v10 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
      [v9 setWeight:v10];

      v21 = v9;
      [v8 setFontSpecification:v9];
      [v8 setSymbolScale:1];
      [v7 setInlineTextParameters:v8];
      [v7 setDrawSystemBackgroundMaterialIfNecessary:0];
      [v7 setVisibility:2];
      [v7 setCanAppearInSecureEnvironment:1];
      [v7 setContentType:0];
      [v7 setShouldShareTouchesWithHost:1];
      [v7 setColorScheme:2];
      v11 = [(PRInlineComplicationContainerViewController *)self vibrancyConfiguration];
      [v7 setVibrancyConfiguration:v11];

      v12 = [v7 view];
      [v12 setUserInteractionEnabled:0];

      v13 = (void *)[objc_alloc(MEMORY[0x1E4F58EE8]) initWithPrimaryTintColor:0 secondaryTintColor:0 filterStyle:2 fallbackFilterStyle:2 fraction:1.0];
      [v7 setTintParameters:v13];
      v14 = [(PRComplicationDescriptor *)v5 widget];
      v15 = PRSharedWidgetDescriptorProvider();
      v16 = [v15 descriptorForPersonality:v14];

      uint64_t v17 = [v16 intentType];
      if (v17
        && (v18 = (void *)v17,
            [v14 intent],
            v19 = objc_claimAutoreleasedReturnValue(),
            v19,
            v18,
            !v19))
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __73__PRInlineComplicationContainerViewController_setComplicationDescriptor___block_invoke;
        v22[3] = &unk_1E54DC398;
        id v23 = v7;
        id v24 = v14;
        v25 = v5;
        [v16 loadDefaultIntent:v22];
      }
      else
      {
        [v7 setPresentationMode:2];
      }
      [(PRInlineComplicationContainerViewController *)self loadViewIfNeeded];
      [(PRInlineComplicationContainerViewController *)self bs_addChildViewController:v7];
      hostViewController = self->_hostViewController;
      self->_hostViewController = (CHUISWidgetHostViewController *)v7;
    }
  }
}

void __73__PRInlineComplicationContainerViewController_setComplicationDescriptor___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [a1[4] widget];
    id v5 = a1[5];

    if (v4 == v5)
    {
      id v6 = [a1[5] widgetByReplacingIntent:v3];
      [a1[6] setWidget:v6];
      [a1[4] setWidget:v6];
    }
    [a1[4] setPresentationMode:2];
  }
  else
  {
    objc_super v7 = PRLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__PRInlineComplicationSnapshotViewController__hostViewControllerForComplicationDescriptor___block_invoke_cold_1((uint64_t)a1, v7);
    }
  }
}

- (void)setFocused:(BOOL)a3
{
}

- (void)setFocused:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    uint64_t v6 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.3];
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = (id)v6;
  [(PRInlineComplicationContainerViewController *)self setFocused:v4 animationSettings:v6];
}

- (void)setFocused:(BOOL)a3 animationSettings:(id)a4
{
  if (self->_focused != a3) {
    self->_focused = a3;
  }
}

- (void)setVibrancyConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
  id v5 = a3;
  [(CHUISWidgetHostViewController *)self->_hostViewController setVibrancyConfiguration:v5];
}

- (void)_tapGestureRecognized:(id)a3
{
  id v4 = a3;
  if (self->_focused)
  {
    if (!self->_complicationDescriptor) {
      goto LABEL_6;
    }
    id v6 = v4;
    id v5 = [(PRInlineComplicationContainerViewController *)self delegate];
    [v5 inlineComplicationContainerViewController:self didEditComplication:self->_complicationDescriptor];
  }
  else
  {
    id v6 = v4;
    id v5 = [(PRInlineComplicationContainerViewController *)self delegate];
    [v5 inlineComplicationContainerViewControllerDidTapAdd:self];
  }

  id v4 = v6;
LABEL_6:
}

- (PRComplicationDescriptor)complicationDescriptor
{
  return self->_complicationDescriptor;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (PRInlineComplicationContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRInlineComplicationContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_complicationDescriptor, 0);
  objc_storeStrong((id *)&self->_hostViewController, 0);
}

@end