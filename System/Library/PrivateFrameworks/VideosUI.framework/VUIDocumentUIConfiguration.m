@interface VUIDocumentUIConfiguration
+ (CGSize)_preferredSizeFromConfig:(id)a3;
+ (VUIDocumentUIConfiguration)uiConfigurationWithDict:(id)a3;
+ (id)_detentsFromDictionary:(id)a3 inConfig:(id)a4;
+ (int64_t)_presentationTypeFromString:(id)a3;
- (BOOL)isAnimated;
- (BOOL)isComingFromExtras;
- (BOOL)isComingFromRoot;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInteractivePopGestureAllowed;
- (BOOL)isNavigationBarAdjustedToSizeClass;
- (BOOL)isNavigationBarHidden;
- (BOOL)prefersLargeTitle;
- (BOOL)shouldWrapModalInNavigationController;
- (NSString)loadingViewText;
- (NSString)navigationTitle;
- (NSString)viewControllerDocumentIdentifier;
- (NSString)viewControllerIdentifier;
- (VUIDocumentUIConfiguration)init;
- (int64_t)type;
- (void)setAnimated:(BOOL)a3;
- (void)setIsComingFromExtras:(BOOL)a3;
- (void)setIsComingFromRoot:(BOOL)a3;
- (void)setIsInteractivePopGestureAllowed:(BOOL)a3;
- (void)setLoadingViewText:(id)a3;
- (void)setNavigationBarAdjustedToSizeClass:(BOOL)a3;
- (void)setNavigationBarHidden:(BOOL)a3;
- (void)setNavigationTitle:(id)a3;
- (void)setPrefersLargeTitle:(BOOL)a3;
- (void)setShouldWrapModalInNavigationController:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setViewControllerDocumentIdentifier:(id)a3;
- (void)setViewControllerIdentifier:(id)a3;
@end

@implementation VUIDocumentUIConfiguration

- (NSString)viewControllerIdentifier
{
  return self->_viewControllerIdentifier;
}

- (NSString)viewControllerDocumentIdentifier
{
  return self->_viewControllerDocumentIdentifier;
}

- (BOOL)prefersLargeTitle
{
  return self->_prefersLargeTitle;
}

- (NSString)navigationTitle
{
  return self->_navigationTitle;
}

- (NSString)loadingViewText
{
  return self->_loadingViewText;
}

- (BOOL)isComingFromRoot
{
  return self->_isComingFromRoot;
}

- (BOOL)isComingFromExtras
{
  return self->_isComingFromExtras;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationTitle, 0);
  objc_storeStrong((id *)&self->_loadingViewText, 0);
  objc_storeStrong((id *)&self->_viewControllerDocumentIdentifier, 0);
  objc_storeStrong((id *)&self->_viewControllerIdentifier, 0);
}

- (void)setViewControllerIdentifier:(id)a3
{
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (VUIDocumentUIConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIDocumentUIConfiguration;
  result = [(VUIDocumentUIConfiguration *)&v3 init];
  if (result)
  {
    result->_shouldWrapModalInNavigationController = 1;
    result->_prefersLargeTitle = 1;
  }
  return result;
}

- (void)setViewControllerDocumentIdentifier:(id)a3
{
}

+ (VUIDocumentUIConfiguration)uiConfigurationWithDict:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "vui_stringForKey:", @"transitionType");
  uint64_t v6 = [v4 _presentationTypeFromString:v5];

  v7 = objc_msgSend(v3, "vui_stringForKey:", @"viewControllerId");
  v8 = objc_msgSend(v3, "vui_stringForKey:", @"viewControllerDocumentId");
  v9 = objc_msgSend(v3, "vui_stringForKey:", @"loadingViewText");
  v10 = objc_msgSend(v3, "vui_stringForKey:", @"navigationTitle");
  unsigned int v24 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"animated", 1);
  unsigned int v21 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"navBarHidden", 0);
  unsigned int v20 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"navBarAdjustedToSizeClass", 0);
  unsigned int v19 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"interactivePopGestureAllowed", 1);
  uint64_t v11 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"modalOverModalAllowed", 0);
  unsigned int v22 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"prefersLargeTitle", 1);
  unsigned int v23 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"isComingFromExtras", 0);
  v12 = objc_msgSend(v3, "vui_stringForKey:", @"documentType");
  switch(v6)
  {
    case 2:
    case 3:
    case 14:
      v13 = objc_alloc_init(VUIDocumentUIConfigurationModal);
      [(VUIDocumentUIConfigurationModal *)v13 setModalOverModalAllowed:v11];
      -[VUIDocumentUIConfigurationModal setPresentOnPresentingVC:](v13, "setPresentOnPresentingVC:", [v12 isEqualToString:@"modalOverPlayback"] ^ 1);
      break;
    case 4:
      v13 = objc_alloc_init(VUIDocumentUIConfigurationFormSheet);
      unsigned int v17 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"tapDismissable", 1);
      [(id)objc_opt_class() _preferredSizeFromConfig:v3];
      -[VUIDocumentUIConfigurationFormSheet setPreferredSize:](v13, "setPreferredSize:");
      [(VUIDocumentUIConfigurationFormSheet *)v13 setTapDismissable:v17];
      -[VUIDocumentUIConfigurationFormSheet setPrefersGrabberVisible:](v13, "setPrefersGrabberVisible:", objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"prefersGrabberVisible", 0));
      v14 = [(id)objc_opt_class() _detentsFromDictionary:v3 inConfig:v13];
      [(VUIDocumentUIConfigurationFormSheet *)v13 setDetents:v14];

      v15 = (VUIDocumentUIConfigurationFormSheetFullscreen *)v13;
      goto LABEL_7;
    case 5:
      v13 = objc_alloc_init(VUIDocumentUIConfigurationPopover);
      unsigned int v18 = objc_msgSend(v3, "vui_BOOLForKey:defaultValue:", @"presentationAdjustedToSizeClass", 0);
      [(id)objc_opt_class() _preferredSizeFromConfig:v3];
      -[VUIDocumentUIConfigurationFormSheet setPreferredSize:](v13, "setPreferredSize:");
      [(VUIDocumentUIConfigurationModal *)v13 setModalOverModalAllowed:v11];
      [(VUIDocumentUIConfigurationFormSheet *)v13 setPopOverArrowDirection:15];
      [(VUIDocumentUIConfigurationFormSheet *)v13 setPresentationAdjustedToSizeClass:v18];
      break;
    case 9:
      v15 = objc_alloc_init(VUIDocumentUIConfigurationFormSheetFullscreen);
      v13 = (VUIDocumentUIConfigurationFormSheet *)v15;
LABEL_7:
      [(VUIDocumentUIConfigurationModal *)v15 setModalOverModalAllowed:v11];
      break;
    default:
      v13 = objc_alloc_init(VUIDocumentUIConfiguration);
      break;
  }
  [(VUIDocumentUIConfiguration *)v13 setViewControllerIdentifier:v7];
  [(VUIDocumentUIConfiguration *)v13 setViewControllerDocumentIdentifier:v8];
  [(VUIDocumentUIConfiguration *)v13 setNavigationBarHidden:v21];
  [(VUIDocumentUIConfiguration *)v13 setNavigationBarAdjustedToSizeClass:v20];
  [(VUIDocumentUIConfiguration *)v13 setIsInteractivePopGestureAllowed:v19];
  [(VUIDocumentUIConfiguration *)v13 setType:v6];
  [(VUIDocumentUIConfiguration *)v13 setAnimated:v24];
  [(VUIDocumentUIConfiguration *)v13 setLoadingViewText:v9];
  [(VUIDocumentUIConfiguration *)v13 setShouldWrapModalInNavigationController:1];
  [(VUIDocumentUIConfiguration *)v13 setPrefersLargeTitle:v22];
  [(VUIDocumentUIConfiguration *)v13 setNavigationTitle:v10];
  [(VUIDocumentUIConfiguration *)v13 setIsComingFromExtras:v23];

  return (VUIDocumentUIConfiguration *)v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VUIDocumentUIConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t v6 = [(VUIDocumentUIConfiguration *)self type];
      if (v6 == [(VUIDocumentUIConfiguration *)v5 type])
      {
        v7 = [(VUIDocumentUIConfiguration *)self viewControllerIdentifier];
        v8 = [(VUIDocumentUIConfiguration *)v5 viewControllerIdentifier];
        if (v7 == v8)
        {
          v10 = [(VUIDocumentUIConfiguration *)self viewControllerDocumentIdentifier];
          uint64_t v11 = [(VUIDocumentUIConfiguration *)v5 viewControllerDocumentIdentifier];
          if (v10 == v11
            && (BOOL v12 = [(VUIDocumentUIConfiguration *)self isAnimated],
                v12 == [(VUIDocumentUIConfiguration *)v5 isAnimated])
            && (BOOL v13 = [(VUIDocumentUIConfiguration *)self isNavigationBarHidden],
                v13 == [(VUIDocumentUIConfiguration *)v5 isNavigationBarHidden])
            && (BOOL v14 = [(VUIDocumentUIConfiguration *)self isNavigationBarAdjustedToSizeClass], v14 == [(VUIDocumentUIConfiguration *)v5 isNavigationBarAdjustedToSizeClass])&& (v15 = [(VUIDocumentUIConfiguration *)self isInteractivePopGestureAllowed], v15 == [(VUIDocumentUIConfiguration *)v5 isInteractivePopGestureAllowed]))
          {
            BOOL v17 = [(VUIDocumentUIConfiguration *)self shouldWrapModalInNavigationController];
            BOOL v9 = v17 ^ [(VUIDocumentUIConfiguration *)v5 shouldWrapModalInNavigationController] ^ 1;
          }
          else
          {
            LOBYTE(v9) = 0;
          }
        }
        else
        {
          LOBYTE(v9) = 0;
        }
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

+ (CGSize)_preferredSizeFromConfig:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "vui_numberForKey:", @"preferredWidth");
  [v4 doubleValue];
  double v6 = v5;

  v7 = objc_msgSend(v3, "vui_numberForKey:", @"preferredHeight");

  [v7 doubleValue];
  double v9 = v8;

  double v10 = v6;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (int64_t)_presentationTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 length] && (objc_msgSend(v3, "isEqualToString:", @"Push") & 1) == 0)
  {
    if ([v3 isEqualToString:@"Zoom"])
    {
      int64_t v4 = 15;
    }
    else if ([v3 isEqualToString:@"FullScreen"])
    {
      int64_t v4 = 2;
    }
    else if ([v3 isEqualToString:@"OverFullScreen"])
    {
      int64_t v4 = 14;
    }
    else if ([v3 isEqualToString:@"BlurOverFullScreen"])
    {
      int64_t v4 = 3;
    }
    else if ([v3 isEqualToString:@"Pop"])
    {
      int64_t v4 = 6;
    }
    else if ([v3 isEqualToString:@"Dismiss"])
    {
      int64_t v4 = 7;
    }
    else if ([v3 isEqualToString:@"PopOrDismiss"])
    {
      int64_t v4 = 8;
    }
    else if ([v3 isEqualToString:@"DismissAndPush"])
    {
      int64_t v4 = 12;
    }
    else if ([v3 isEqualToString:@"DismissAndZoom"])
    {
      int64_t v4 = 16;
    }
    else if ([v3 isEqualToString:@"Popover"])
    {
      int64_t v4 = 5;
    }
    else if ([v3 isEqualToString:@"FormSheet"])
    {
      int64_t v4 = 4;
    }
    else if ([v3 isEqualToString:@"FormSheetFullscreen"])
    {
      int64_t v4 = 9;
    }
    else if ([v3 isEqualToString:@"Replace"])
    {
      int64_t v4 = 17;
    }
    else
    {
      int64_t v4 = 1;
    }
  }
  else
  {
    int64_t v4 = 1;
  }

  return v4;
}

+ (id)_detentsFromDictionary:(id)a3 inConfig:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id val = a4;
  double v5 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v6 = objc_msgSend(v18, "vui_arrayForKey:", @"detents");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v10 isEqualToString:@"medium"])
        {
          double v11 = [MEMORY[0x1E4FB1C30] mediumDetent];
          [v5 addObject:v11];
        }
        else if ([v10 isEqualToString:@"large"])
        {
          BOOL v12 = [MEMORY[0x1E4FB1C30] largeDetent];
          [v5 addObject:v12];
        }
        else if ([v10 isEqualToString:@"custom"])
        {
          objc_initWeak(&location, val);
          BOOL v13 = (void *)MEMORY[0x1E4FB1C30];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __62__VUIDocumentUIConfiguration__detentsFromDictionary_inConfig___block_invoke;
          v20[3] = &unk_1E6DFBF20;
          objc_copyWeak(&v21, &location);
          BOOL v14 = [v13 customDetentWithIdentifier:@"custom" resolver:v20];
          [v5 addObject:v14];

          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  if ([v5 count]) {
    BOOL v15 = v5;
  }
  else {
    BOOL v15 = 0;
  }
  id v16 = v15;

  return v16;
}

double __62__VUIDocumentUIConfiguration__detentsFromDictionary_inConfig___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained preferredSize];
  if (v2 == 0.0) {
    double v3 = *MEMORY[0x1E4FB2F08];
  }
  else {
    double v3 = v2;
  }

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (BOOL)isNavigationBarHidden
{
  return self->_navigationBarHidden;
}

- (void)setNavigationBarHidden:(BOOL)a3
{
  self->_navigationBarHidden = a3;
}

- (BOOL)isNavigationBarAdjustedToSizeClass
{
  return self->_navigationBarAdjustedToSizeClass;
}

- (void)setNavigationBarAdjustedToSizeClass:(BOOL)a3
{
  self->_navigationBarAdjustedToSizeClass = a3;
}

- (BOOL)isInteractivePopGestureAllowed
{
  return self->_isInteractivePopGestureAllowed;
}

- (void)setIsInteractivePopGestureAllowed:(BOOL)a3
{
  self->_isInteractivePopGestureAllowed = a3;
}

- (void)setLoadingViewText:(id)a3
{
}

- (void)setPrefersLargeTitle:(BOOL)a3
{
  self->_prefersLargeTitle = a3;
}

- (void)setNavigationTitle:(id)a3
{
}

- (void)setIsComingFromExtras:(BOOL)a3
{
  self->_isComingFromExtras = a3;
}

- (void)setIsComingFromRoot:(BOOL)a3
{
  self->_isComingFromRoot = a3;
}

- (BOOL)shouldWrapModalInNavigationController
{
  return self->_shouldWrapModalInNavigationController;
}

- (void)setShouldWrapModalInNavigationController:(BOOL)a3
{
  self->_shouldWrapModalInNavigationController = a3;
}

@end