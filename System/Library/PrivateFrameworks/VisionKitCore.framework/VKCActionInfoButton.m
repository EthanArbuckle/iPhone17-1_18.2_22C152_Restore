@interface VKCActionInfoButton
+ (id)buttonWithImage:(id)a3 text:(id)a4;
- (BOOL)hasAction:(SEL)a3;
- (BOOL)isMoreButton;
- (DDUIAction)defaultAction;
- (NSArray)allUnfilteredElements;
- (NSString)text;
- (NSUUID)correlationIdentifier;
- (UIImage)image;
- (UIImage)menuImage;
- (UIImageSymbolConfiguration)preferredSymbolConfiguration;
- (VKCActionInfoButtonDelegate)delegate;
- (VKCBaseDataDetectorElement)representedElement;
- (id)buttonConfigurationTextAttributesTransformer;
- (id)dataDetectorContext;
- (id)defaultSymbolConfigurationForImage;
- (id)description;
- (id)filledButtonConfiguration;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)translucentButtonConfiguration;
- (id)translucentSelectedButtonConfiguration;
- (int64_t)overrideUserInterfaceStyle;
- (unint64_t)quickActionType;
- (void)_vk_performAction;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)performDefaultElementAction;
- (void)setAllUnfilteredElements:(id)a3;
- (void)setCorrelationIdentifier:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsMoreButton:(BOOL)a3;
- (void)setMenuImage:(id)a3;
- (void)setPreferredSymbolConfiguration:(id)a3;
- (void)setQuickActionType:(unint64_t)a3;
- (void)setRepresentedElement:(id)a3;
- (void)setText:(id)a3;
- (void)tearDown;
- (void)vk_addTarget:(id)a3 action:(SEL)a4;
@end

@implementation VKCActionInfoButton

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(VKCActionInfoButton *)self representedElement];
  v6 = [v3 stringWithFormat:@"<%@: %p> element: %@", v4, self, v5];

  return v6;
}

- (void)tearDown
{
}

+ (id)buttonWithImage:(id)a3 text:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() buttonWithType:1];
  [v7 setImage:v6];

  [v7 setText:v5];
  [v7 setPreferredBehavioralStyle:1];
  v8 = [v7 translucentButtonConfiguration];
  [v7 setConfiguration:v8];

  [v7 setMaximumContentSizeCategory:*MEMORY[0x1E4F43780]];
  [v7 setShowsLargeContentViewer:1];
  id v9 = objc_alloc_init(MEMORY[0x1E4F42B40]);
  [v7 addInteraction:v9];

  [v7 setPointerInteractionEnabled:1];
  [v7 setQuickActionType:2];
  return v7;
}

- (void)vk_addTarget:(id)a3 action:(SEL)a4
{
}

- (void)_vk_performAction
{
}

- (BOOL)hasAction:(SEL)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(VKCActionInfoButton *)self allTargets];
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = [(VKCActionInfoButton *)self actionsForTarget:*(void *)(*((void *)&v22 + 1) + 8 * i) forControlEvent:64];
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              if (NSSelectorFromString(*(NSString **)(*((void *)&v18 + 1) + 8 * j)) == a3)
              {
                char v7 = 1;
                goto LABEL_16;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (void)performDefaultElementAction
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(VKCActionInfoButton *)self representedElement];
  uint64_t v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1DB266000, v4, OS_LOG_TYPE_DEFAULT, "Performing default element action: %@", (uint8_t *)&buf, 0xCu);
  }

  if ([v3 isTextDataDetector])
  {
    id DDContextMenuActionClass_1 = getDDContextMenuActionClass_1();
    uint64_t v6 = [v3 scannerResult];
    uint64_t v7 = [v6 coreResult];
    uint64_t v8 = [(VKCActionInfoButton *)self dataDetectorContext];
    id v16 = 0;
    id v9 = (id)[DDContextMenuActionClass_1 buttonActionsForURL:0 result:v7 contact:0 icsString:0 context:v8 view:self identifier:0 suggestedActions:0 defaultAction:&v16];
    id v10 = v16;

    if (v10)
    {
      uint64_t v17 = 0;
      long long v18 = &v17;
      uint64_t v19 = 0x2050000000;
      id v11 = (void *)getDDUIActionClass_softClass_1;
      uint64_t v20 = getDDUIActionClass_softClass_1;
      if (!getDDUIActionClass_softClass_1)
      {
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        long long v22 = __getDDUIActionClass_block_invoke_1;
        long long v23 = &unk_1E6BF0A90;
        long long v24 = &v17;
        __getDDUIActionClass_block_invoke_1((uint64_t)&buf);
        id v11 = (void *)v18[3];
      }
      id v12 = v11;
      _Block_object_dispose(&v17, 8);
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v10, "dd_performAction");
      }
    }
    uint64_t v13 = [(VKCActionInfoButton *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [(VKCActionInfoButton *)self delegate];
      [v15 actionInfoButtonDidActivatePrimaryAction:self];
    }
  }
}

- (id)dataDetectorContext
{
  v3 = [(VKCActionInfoButton *)self representedElement];
  uint64_t v4 = [v3 scannerResult];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = [(VKCActionInfoButton *)self allUnfilteredElements];
  uint64_t v7 = objc_msgSend(v6, "vk_compactMap:", &__block_literal_global_39);

  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v8 = (void *)getkDataDetectorsAllResultsKeySymbolLoc_ptr_1;
  uint64_t v26 = getkDataDetectorsAllResultsKeySymbolLoc_ptr_1;
  if (!getkDataDetectorsAllResultsKeySymbolLoc_ptr_1)
  {
    id v9 = (void *)DataDetectorsUILibrary_5();
    v24[3] = (uint64_t)dlsym(v9, "kDataDetectorsAllResultsKey");
    getkDataDetectorsAllResultsKeySymbolLoc_ptr_1 = v24[3];
    uint64_t v8 = (void *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v8)
  {
    getkDDRVInteractionDidFinishNotification_cold_1();
    goto LABEL_13;
  }
  objc_msgSend(v5, "vk_setNonNilObject:forKey:", v7, *v8);
  id v10 = [(VKCActionInfoButton *)self representedElement];
  id v11 = [v10 groupedElementData];
  objc_msgSend(v5, "vk_addEntriesFromNonNilDictionary:", v11);

  id v12 = [(VKCActionInfoButton *)self representedElement];
  uint64_t v13 = [v12 scannerResult];
  char v14 = [v13 value];
  uint64_t v15 = [v14 length];

  if (!v15) {
    goto LABEL_9;
  }
  id v16 = [v4 value];
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v17 = (void *)getkDataDetectorsMiddleTextSymbolLoc_ptr_0;
  uint64_t v26 = getkDataDetectorsMiddleTextSymbolLoc_ptr_0;
  if (!getkDataDetectorsMiddleTextSymbolLoc_ptr_0)
  {
    long long v18 = (void *)DataDetectorsUILibrary_5();
    v24[3] = (uint64_t)dlsym(v18, "kDataDetectorsMiddleText");
    getkDataDetectorsMiddleTextSymbolLoc_ptr_0 = v24[3];
    uint64_t v17 = (void *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (!v17)
  {
LABEL_13:
    long long v22 = (_Unwind_Exception *)getkDDRVInteractionDidFinishNotification_cold_1();
    _Block_object_dispose(&v23, 8);
    _Unwind_Resume(v22);
  }
  [v5 setObject:v16 forKeyedSubscript:*v17];

LABEL_9:
  id DDContextMenuActionClass_1 = getDDContextMenuActionClass_1();
  [(VKCActionInfoButton *)self bounds];
  uint64_t v20 = objc_msgSend(DDContextMenuActionClass_1, "updateContext:withSourceRect:", v5);

  return v20;
}

id __42__VKCActionInfoButton_dataDetectorContext__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 scannerResult];
  v3 = [v2 coreResult];

  return v3;
}

- (id)buttonConfigurationTextAttributesTransformer
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__VKCActionInfoButton_buttonConfigurationTextAttributesTransformer__block_invoke;
  v4[3] = &unk_1E6BF3F50;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x1E018E600](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

id __67__VKCActionInfoButton_buttonConfigurationTextAttributesTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = (void *)[v3 mutableCopy];
    uint64_t v6 = (void *)MEMORY[0x1E4F42A30];
    uint64_t v7 = *MEMORY[0x1E4F438C8];
    uint64_t v8 = [WeakRetained traitCollection];
    id v9 = [v6 preferredFontForTextStyle:v7 compatibleWithTraitCollection:v8];

    if (vk_isSeedBuild())
    {
      id v10 = [WeakRetained traitCollection];
      int v11 = objc_msgSend(v10, "vk_isOptimizedForMac");

      id v12 = (void *)MEMORY[0x1E4F42A30];
      if (v11)
      {
        double v13 = 13.0;
      }
      else
      {
        [v9 pointSize];
        double v13 = v14 * 1.2987013;
      }
      uint64_t v15 = [v12 systemFontOfSize:v13];

      id v9 = (void *)v15;
    }
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F42508]];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)filledButtonConfiguration
{
  id v3 = [MEMORY[0x1E4F427E8] filledButtonConfiguration];
  uint64_t v4 = [(VKCActionInfoButton *)self image];
  [v3 setImage:v4];

  id v5 = [(VKCActionInfoButton *)self text];
  [v3 setTitle:v5];

  [(VKCActionInfoButton *)self setTintAdjustmentMode:1];
  uint64_t v6 = [(VKCActionInfoButton *)self buttonConfigurationTextAttributesTransformer];
  [v3 setTitleTextAttributesTransformer:v6];

  [v3 setTitleLineBreakMode:4];
  [v3 setImagePadding:5.0];
  [v3 setCornerStyle:4];
  uint64_t v7 = [(VKCActionInfoButton *)self defaultSymbolConfigurationForImage];
  [v3 setPreferredSymbolConfigurationForImage:v7];

  return v3;
}

- (id)translucentButtonConfiguration
{
  id v3 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
  uint64_t v4 = [(VKCActionInfoButton *)self image];
  [v3 setImage:v4];

  id v5 = [(VKCActionInfoButton *)self text];
  [v3 setTitle:v5];

  [(VKCActionInfoButton *)self setTintAdjustmentMode:1];
  uint64_t v6 = [(VKCActionInfoButton *)self buttonConfigurationTextAttributesTransformer];
  [v3 setTitleTextAttributesTransformer:v6];

  [v3 setTitleLineBreakMode:4];
  [v3 setImagePadding:5.0];
  [v3 setCornerStyle:4];
  uint64_t v7 = [MEMORY[0x1E4F427B0] clearConfiguration];
  uint64_t v8 = [MEMORY[0x1E4F427D8] effectWithStyle:17];
  [v7 setVisualEffect:v8];

  [v3 setBackground:v7];
  id v9 = [(VKCActionInfoButton *)self defaultSymbolConfigurationForImage];
  [v3 setPreferredSymbolConfigurationForImage:v9];

  if ([(VKCActionInfoButton *)self isHighlighted]) {
    [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }
  else {
  id v10 = [MEMORY[0x1E4F428B8] labelColor];
  }
  int v11 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
  id v12 = [v10 resolvedColorWithTraitCollection:v11];
  [v3 setBaseForegroundColor:v12];

  return v3;
}

- (id)defaultSymbolConfigurationForImage
{
  if (vk_isSeedBuild()) {
    uint64_t v2 = 3;
  }
  else {
    uint64_t v2 = 1;
  }
  id v3 = (void *)MEMORY[0x1E4F42A98];
  uint64_t v4 = *MEMORY[0x1E4F438C8];
  return (id)[v3 configurationWithTextStyle:v4 scale:v2];
}

- (int64_t)overrideUserInterfaceStyle
{
  return 2;
}

- (id)translucentSelectedButtonConfiguration
{
  id v3 = [MEMORY[0x1E4F427E8] filledButtonConfiguration];
  uint64_t v4 = [(VKCActionInfoButton *)self image];
  [v3 setImage:v4];

  id v5 = [(VKCActionInfoButton *)self text];
  [v3 setTitle:v5];

  [(VKCActionInfoButton *)self setTintAdjustmentMode:1];
  uint64_t v6 = [(VKCActionInfoButton *)self buttonConfigurationTextAttributesTransformer];
  [v3 setTitleTextAttributesTransformer:v6];

  [v3 setTitleLineBreakMode:4];
  [v3 setImagePadding:5.0];
  [v3 setCornerStyle:4];
  uint64_t v7 = [MEMORY[0x1E4F427B0] clearConfiguration];
  uint64_t v8 = [MEMORY[0x1E4F427D8] effectWithStyle:12];
  [v7 setVisualEffect:v8];

  id v9 = [(VKCActionInfoButton *)self tintColor];
  id v10 = [v9 colorWithAlphaComponent:0.85];
  [v7 setBackgroundColor:v10];

  if ([(VKCActionInfoButton *)self isHighlighted]) {
    [MEMORY[0x1E4F428B8] secondaryLabelColor];
  }
  else {
  int v11 = [MEMORY[0x1E4F428B8] labelColor];
  }
  id v12 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
  double v13 = [v11 resolvedColorWithTraitCollection:v12];
  [v3 setBaseForegroundColor:v13];

  double v14 = [(VKCActionInfoButton *)self defaultSymbolConfigurationForImage];
  [v3 setPreferredSymbolConfigurationForImage:v14];

  [v3 setBackground:v7];
  return v3;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F42CF8]);
  uint64_t v6 = (void *)MEMORY[0x1E4F427D0];
  [(VKCActionInfoButton *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [(VKCActionInfoButton *)self layer];
  [v15 cornerRadius];
  uint64_t v17 = objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:", v8, v10, v12, v14, v16);
  [v5 setVisiblePath:v17];

  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self parameters:v5];
  uint64_t v19 = [MEMORY[0x1E4F42CA8] effectWithPreview:v18];
  uint64_t v20 = [MEMORY[0x1E4F42CC0] styleWithEffect:v19 shape:0];

  return v20;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v17 = self;
    _os_log_impl(&dword_1DB266000, v11, OS_LOG_TYPE_DEFAULT, "Displaying menu for quick action: %@", buf, 0xCu);
  }

  v15.receiver = self;
  v15.super_class = (Class)VKCActionInfoButton;
  [(VKCActionInfoButton *)&v15 contextMenuInteraction:v10 willDisplayMenuForConfiguration:v9 animator:v8];

  double v12 = [(VKCActionInfoButton *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    double v14 = [(VKCActionInfoButton *)self delegate];
    [v14 willDisplayMenuForActionInfoButton:self];
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.interaction");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v17 = self;
    _os_log_impl(&dword_1DB266000, v11, OS_LOG_TYPE_DEFAULT, "Hiding menu for quick action: %@", buf, 0xCu);
  }

  v15.receiver = self;
  v15.super_class = (Class)VKCActionInfoButton;
  [(VKCActionInfoButton *)&v15 contextMenuInteraction:v10 willEndForConfiguration:v9 animator:v8];

  double v12 = [(VKCActionInfoButton *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13)
  {
    double v14 = [(VKCActionInfoButton *)self delegate];
    [v14 willHideMenuForActionInfoButton:self];
  }
}

- (VKCBaseDataDetectorElement)representedElement
{
  return self->_representedElement;
}

- (void)setRepresentedElement:(id)a3
{
}

- (NSArray)allUnfilteredElements
{
  return self->_allUnfilteredElements;
}

- (void)setAllUnfilteredElements:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIImage)menuImage
{
  return self->_menuImage;
}

- (void)setMenuImage:(id)a3
{
}

- (VKCActionInfoButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKCActionInfoButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DDUIAction)defaultAction
{
  return self->_defaultAction;
}

- (void)setDefaultAction:(id)a3
{
}

- (NSUUID)correlationIdentifier
{
  return self->_correlationIdentifier;
}

- (void)setCorrelationIdentifier:(id)a3
{
}

- (unint64_t)quickActionType
{
  return self->_quickActionType;
}

- (void)setQuickActionType:(unint64_t)a3
{
  self->_quickActionType = a3;
}

- (BOOL)isMoreButton
{
  return self->_isMoreButton;
}

- (void)setIsMoreButton:(BOOL)a3
{
  self->_isMoreButton = a3;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_correlationIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_menuImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_allUnfilteredElements, 0);
  objc_storeStrong((id *)&self->_representedElement, 0);
}

@end