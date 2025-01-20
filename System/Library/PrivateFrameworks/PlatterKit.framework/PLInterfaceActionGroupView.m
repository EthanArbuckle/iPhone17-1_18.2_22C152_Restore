@interface PLInterfaceActionGroupView
+ (void)initialize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)actions;
- (NSArray)requiredVisualStyleCategories;
- (PLInterfaceActionGroupView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (id)_newInterfaceActionGroupViewWithActions:(id)a3;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)_updateStylingOfInterfaceActionGroupView:(id)a3;
- (void)layoutSubviews;
- (void)providedStylesDidChangeForProvider:(id)a3;
- (void)setActions:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation PLInterfaceActionGroupView

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    PLRegisterPlatterKitLogging();
  }
}

- (PLInterfaceActionGroupView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLInterfaceActionGroupView;
  id v3 = -[PLInterfaceActionGroupView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PLInterfaceActionGroupView *)v3 setClipsToBounds:1];
  }
  return v4;
}

- (NSArray)actions
{
  v2 = [(UIInterfaceActionGroupView *)self->_actionsGroupView actionGroup];
  id v3 = [v2 actions];

  return (NSArray *)v3;
}

- (void)_updateStylingOfInterfaceActionGroupView:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLInterfaceActionGroupView *)self visualStylingProviderForCategory:1];
  objc_super v6 = [v5 _visualStylingForStyle:0];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = objc_msgSend(v4, "actionGroup", 0);
  v8 = [v7 actions];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v13 type] != 2)
        {
          v14 = [v6 color];
          [v13 _setTitleTextColor:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  v15 = [(PLInterfaceActionGroupView *)self visualStylingProviderForCategory:2];
  v16 = [v15 _visualStylingForStyle:5];
  if (v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F42AE0]);
    uint64_t v18 = [v16 composedFilter];
    v19 = (void *)v18;
    if (v18)
    {
      uint64_t v26 = v18;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [v17 setFilters:v20];
    }
    else if (os_log_type_enabled((os_log_t)PLLogGeneral, OS_LOG_TYPE_ERROR))
    {
      -[PLInterfaceActionGroupView _updateStylingOfInterfaceActionGroupView:]();
    }
    v21 = [v16 color];
    [v17 setBackgroundColor:v21];

    [v16 alpha];
    objc_msgSend(v17, "setOpacity:");
    [v4 _setVisualStyleOverrideSeparatorAttributes:v17];
  }
  else if (os_log_type_enabled((os_log_t)PLLogGeneral, OS_LOG_TYPE_ERROR))
  {
    -[PLInterfaceActionGroupView _updateStylingOfInterfaceActionGroupView:]();
  }
}

- (id)_newInterfaceActionGroupViewWithActions:(id)a3
{
  id v4 = [MEMORY[0x1E4F42AD0] actionGroupWithActions:a3];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F42AD8]) initWithActionGroup:v4 actionHandlerInvocationDelegate:0];
  [v5 setPresentationStyle:2];
  [(PLInterfaceActionGroupView *)self _updateStylingOfInterfaceActionGroupView:v5];
  [v5 _setDrawsBackground:0];
  [v5 _setSelectionHighlightContinuousCornerRadius:self->_cornerRadius];

  return v5;
}

- (void)setActions:(id)a3
{
  id v8 = a3;
  id v4 = [(PLInterfaceActionGroupView *)self actions];
  char v5 = [v8 isEqualToArray:v4];

  if ((v5 & 1) == 0)
  {
    [(UIInterfaceActionGroupView *)self->_actionsGroupView removeFromSuperview];
    objc_super v6 = [(PLInterfaceActionGroupView *)self _newInterfaceActionGroupViewWithActions:v8];
    actionsGroupView = self->_actionsGroupView;
    self->_actionsGroupView = v6;

    [(PLInterfaceActionGroupView *)self addSubview:self->_actionsGroupView];
    self->_actionsDirty = 1;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIInterfaceActionGroupView sizeThatFits:](self->_actionsGroupView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PLInterfaceActionGroupView;
  [(PLInterfaceActionGroupView *)&v7 layoutSubviews];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PLInterfaceActionGroupView_layoutSubviews__block_invoke;
  v6[3] = &unk_1E6B5F800;
  v6[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v6];
  if (self->_actionsDirty
    && [MEMORY[0x1E4F42FF0] _isInAnimationBlockWithAnimationsEnabled])
  {
    double v3 = [MEMORY[0x1E4F39D18] animation];
    double v4 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [v3 setTimingFunction:v4];

    [v3 setType:*MEMORY[0x1E4F3A5B8]];
    [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
    objc_msgSend(v3, "setDuration:");
    char v5 = [(PLInterfaceActionGroupView *)self layer];
    [v5 addAnimation:v3 forKey:@"kCATransitionFade"];
  }
  self->_actionsDirty = 0;
}

uint64_t __44__PLInterfaceActionGroupView_layoutSubviews__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v3 = (void *)v2[51];
  [v2 bounds];
  objc_msgSend(v3, "setFrame:");
  double v4 = *(void **)(*(void *)(a1 + 32) + 408);
  return [v4 layoutIfNeeded];
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  categoriesToProviders = self->_categoriesToProviders;
  double v4 = [NSNumber numberWithInteger:a3];
  char v5 = [(NSMutableDictionary *)categoriesToProviders objectForKey:v4];

  return v5;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F3358E90;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v11 = a3;
  if (!self->_categoriesToProviders)
  {
    objc_super v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    categoriesToProviders = self->_categoriesToProviders;
    self->_categoriesToProviders = v6;
  }
  id v8 = [NSNumber numberWithInteger:a4];
  uint64_t v9 = [(NSMutableDictionary *)self->_categoriesToProviders objectForKey:v8];
  [v9 _removeObserver:self];

  uint64_t v10 = self->_categoriesToProviders;
  if (v11)
  {
    [(NSMutableDictionary *)v10 setObject:v11 forKey:v8];
    [v11 _addObserver:self];
  }
  else
  {
    [(NSMutableDictionary *)v10 removeObjectForKey:v8];
  }
}

- (void)providedStylesDidChangeForProvider:(id)a3
{
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesToProviders, 0);
  objc_storeStrong((id *)&self->_actionsGroupView, 0);
}

- (void)_updateStylingOfInterfaceActionGroupView:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D93DD000, v0, v1, "%{public}@: Failed to obtain viaual styling from provider: %{public}@");
}

- (void)_updateStylingOfInterfaceActionGroupView:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D93DD000, v0, v1, "%{public}@: Failed to obtain composed filter from viaual styling: %{public}@");
}

@end