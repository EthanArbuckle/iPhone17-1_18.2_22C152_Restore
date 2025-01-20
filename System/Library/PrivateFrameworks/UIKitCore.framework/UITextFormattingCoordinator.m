@interface UITextFormattingCoordinator
+ (BOOL)isFontPanelVisible;
+ (UITextFormattingCoordinator)textFormattingCoordinatorForWindowScene:(UIWindowScene *)windowScene;
- (UITextFormattingCoordinator)initWithWindowScene:(UIWindowScene *)windowScene;
- (id)delegate;
- (void)fontPickerViewControllerDidPickFont:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)updateTextAttributesWithConversionHandler:(id)a3;
@end

@implementation UITextFormattingCoordinator

- (UITextFormattingCoordinator)initWithWindowScene:(UIWindowScene *)windowScene
{
  v4.receiver = self;
  v4.super_class = (Class)UITextFormattingCoordinator;
  return [(UITextFormattingCoordinator *)&v4 init];
}

+ (UITextFormattingCoordinator)textFormattingCoordinatorForWindowScene:(UIWindowScene *)windowScene
{
  v3 = [(UIWindowScene *)windowScene keyboardSceneDelegate];
  objc_super v4 = [v3 textFormattingCoordinator];

  return (UITextFormattingCoordinator *)v4;
}

- (void)updateTextAttributesWithConversionHandler:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 updateTextAttributesWithConversionHandler:v4];
  }
  else
  {
    id v7 = +[UIWindow _applicationKeyWindow];
    v6 = [v7 firstResponder];
    [v6 updateTextAttributesWithConversionHandler:v4];

    id v4 = v6;
  }
}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  id v4 = a3;
  v5 = [v4 selectedFontDescriptor];

  if (v5)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__UITextFormattingCoordinator_fontPickerViewControllerDidPickFont___block_invoke;
    aBlock[3] = &unk_1E5309EF0;
    id v8 = v4;
    v6 = _Block_copy(aBlock);
    [(UITextFormattingCoordinator *)self updateTextAttributesWithConversionHandler:v6];
  }
}

id __67__UITextFormattingCoordinator_fontPickerViewControllerDidPickFont___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)off_1E52D2040;
  v5 = [v3 objectForKeyedSubscript:*(void *)off_1E52D2040];
  if (v5
    && ([*(id *)(a1 + 32) selectedFontDescriptor],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = (id)[v3 mutableCopy];
    id v8 = [*(id *)(a1 + 32) selectedFontDescriptor];
    [v5 pointSize];
    v9 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", v8);

    [v7 setObject:v9 forKeyedSubscript:v4];
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

+ (BOOL)isFontPanelVisible
{
  return 0;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (void).cxx_destruct
{
}

@end