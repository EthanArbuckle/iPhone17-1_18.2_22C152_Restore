@interface CACLabeledElementsOverlayView
- (BOOL)displayElementRectangles;
- (CACLabeledElementsOverlayView)initWithFrame:(CGRect)a3;
- (UIView)badgesContainer;
- (UIView)contrastBadgesContainer;
- (id)_viewShowingDebuggingRect:(CGRect)a3;
- (void)addLabeledElements:(id)a3;
- (void)clearLabeledElements;
- (void)setBadgesContainer:(id)a3;
- (void)setContrastBadgesContainer:(id)a3;
- (void)setDisplayElementRectangles:(BOOL)a3;
@end

@implementation CACLabeledElementsOverlayView

- (CACLabeledElementsOverlayView)initWithFrame:(CGRect)a3
{
  v50[8] = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  double v9 = (v6 + -160.0) * 0.5;
  double v10 = v8 + -160.0;
  v49.receiver = self;
  v49.super_class = (Class)CACLabeledElementsOverlayView;
  v11 = -[CACLabeledElementsOverlayView initWithFrame:](&v49, sel_initWithFrame_, v9, v10, 160.0, 160.0);
  if (v11)
  {
    v12 = [MEMORY[0x263F825C8] clearColor];
    [(CACLabeledElementsOverlayView *)v11 setBackgroundColor:v12];

    uint64_t v13 = +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 0, v9, v10, 160.0, 160.0);
    badgesContainer = v11->_badgesContainer;
    v11->_badgesContainer = (UIView *)v13;

    uint64_t v15 = +[CACOverlayContainerView badgeViewContainerWithFrame:usingContrast:](CACOverlayContainerView, "badgeViewContainerWithFrame:usingContrast:", 1, v9, v10, 160.0, 160.0);
    contrastBadgesContainer = v11->_contrastBadgesContainer;
    v11->_contrastBadgesContainer = (UIView *)v15;

    v17 = [(CACLabeledElementsOverlayView *)v11 contrastBadgesContainer];
    [(CACLabeledElementsOverlayView *)v11 addSubview:v17];

    v18 = [(CACLabeledElementsOverlayView *)v11 badgesContainer];
    [(CACLabeledElementsOverlayView *)v11 addSubview:v18];

    Boolean keyExistsAndHasValidFormat = 0;
    if (CFPreferencesGetAppBooleanValue(@"CACShowElementRectanglesWithNumbers", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log", &keyExistsAndHasValidFormat))
    {
      BOOL v19 = keyExistsAndHasValidFormat == 0;
    }
    else
    {
      BOOL v19 = 1;
    }
    uint64_t v20 = !v19;
    [(CACLabeledElementsOverlayView *)v11 setDisplayElementRectangles:v20];
    v38 = (void *)MEMORY[0x263F08938];
    v47 = [(UIView *)v11->_badgesContainer topAnchor];
    v46 = [(CACLabeledElementsOverlayView *)v11 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v50[0] = v45;
    v44 = [(UIView *)v11->_badgesContainer bottomAnchor];
    v43 = [(CACLabeledElementsOverlayView *)v11 bottomAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v50[1] = v42;
    v41 = [(UIView *)v11->_badgesContainer leadingAnchor];
    v40 = [(CACLabeledElementsOverlayView *)v11 leadingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v50[2] = v39;
    v37 = [(UIView *)v11->_badgesContainer trailingAnchor];
    v36 = [(CACLabeledElementsOverlayView *)v11 trailingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v50[3] = v35;
    v34 = [(UIView *)v11->_contrastBadgesContainer topAnchor];
    v33 = [(CACLabeledElementsOverlayView *)v11 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v50[4] = v32;
    v31 = [(UIView *)v11->_contrastBadgesContainer bottomAnchor];
    v21 = [(CACLabeledElementsOverlayView *)v11 bottomAnchor];
    v22 = [v31 constraintEqualToAnchor:v21];
    v50[5] = v22;
    v23 = [(UIView *)v11->_contrastBadgesContainer leadingAnchor];
    v24 = [(CACLabeledElementsOverlayView *)v11 leadingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v50[6] = v25;
    v26 = [(UIView *)v11->_contrastBadgesContainer trailingAnchor];
    v27 = [(CACLabeledElementsOverlayView *)v11 trailingAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v50[7] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:8];
    [v38 activateConstraints:v29];
  }
  return v11;
}

- (void)clearLabeledElements
{
  v2 = self;
  objc_sync_enter(v2);
  labeledElements = v2->_labeledElements;
  if (labeledElements)
  {
    [(NSMutableArray *)labeledElements removeAllObjects];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
    double v5 = v2->_labeledElements;
    v2->_labeledElements = (NSMutableArray *)v4;
  }
  objc_sync_exit(v2);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CACLabeledElementsOverlayView_clearLabeledElements__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__CACLabeledElementsOverlayView_clearLabeledElements__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v2 = [*(id *)(a1 + 32) badgesContainer];
  v3 = [v2 subviews];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v8 = objc_msgSend(*(id *)(a1 + 32), "contrastBadgesContainer", 0);
  double v9 = [v8 subviews];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) removeFromSuperview];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)addLabeledElements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = (void *)[v4 mutableCopy];
  [(NSMutableArray *)v5->_labeledElements addObjectsFromArray:v6];

  objc_sync_exit(v5);
  uint64_t v7 = (void *)MEMORY[0x263EFF960];
  double v8 = +[CACPreferences sharedPreferences];
  double v9 = [v8 bestLocaleIdentifier];
  uint64_t v10 = [v7 localeWithLocaleIdentifier:v9];

  id v11 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v11 setNumberStyle:1];
  [v11 setLocale:v10];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__CACLabeledElementsOverlayView_addLabeledElements___block_invoke;
  v13[3] = &unk_264D117C0;
  v13[4] = v5;
  id v14 = v11;
  id v12 = v11;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

void __52__CACLabeledElementsOverlayView_addLabeledElements___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v27 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 408);
  uint64_t v2 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v34 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v7 = *(void **)(a1 + 40);
        double v8 = [v6 numberedLabel];
        double v9 = [v7 numberFromString:v8];

        uint64_t v10 = [*(id *)(a1 + 40) stringFromNumber:v9];
        [v6 labelRectangle];
        id v11 = [CACLabeledBadgeView alloc];
        [v6 labelRectangle];
        long long v16 = -[CACLabeledBadgeView initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:](v11, "initWithFrame:label:arrowOrientation:badgePresentation:badgeIndicator:", v10, [v6 arrowOrientation], objc_msgSend(v6, "badgePresentation"), objc_msgSend(v6, "badgeIndicatorMask"), v12, v13, v14, v15);
        long long v17 = [*(id *)(a1 + 32) badgesContainer];
        [v17 addSubview:v16];

        [v27 addObject:v16];
        if ([*(id *)(a1 + 32) displayElementRectangles])
        {
          long long v18 = *(void **)(a1 + 32);
          [v6 interfaceOrientedRectangle];
          long long v19 = objc_msgSend(v18, "_viewShowingDebuggingRect:");
          [v18 addSubview:v19];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v3);
  }

  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v20 = v27;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v29 + 1) + 8 * j) contrastedCopy];
          v26 = [*(id *)(a1 + 32) contrastBadgesContainer];
          [v26 addSubview:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v22);
    }
  }
}

- (id)_viewShowingDebuggingRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = [MEMORY[0x263F82B60] mainScreen];
  [v7 scale];
  CGFloat v9 = v8;
  v17.double width = width;
  v17.double height = height;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v9);

  uint64_t v10 = [MEMORY[0x263F824C0] bezierPath];
  id v11 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRect:", 0.0, 0.0, width, height);
  [v10 appendPath:v11];

  [v10 closePath];
  double v12 = [MEMORY[0x263F825C8] redColor];
  [v12 set];

  [v10 stroke];
  double v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  double v14 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v13];
  objc_msgSend(v14, "setFrame:", x, y, width, height);

  return v14;
}

- (BOOL)displayElementRectangles
{
  return self->_displayElementRectangles;
}

- (void)setDisplayElementRectangles:(BOOL)a3
{
  self->_displayElementRectangles = a3;
}

- (UIView)badgesContainer
{
  return self->_badgesContainer;
}

- (void)setBadgesContainer:(id)a3
{
}

- (UIView)contrastBadgesContainer
{
  return self->_contrastBadgesContainer;
}

- (void)setContrastBadgesContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contrastBadgesContainer, 0);
  objc_storeStrong((id *)&self->_badgesContainer, 0);
  objc_storeStrong((id *)&self->_labeledElements, 0);
}

void __52__CACLabeledElementsOverlayView_addLabeledElements___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  [a2 labelRectangle];
  uint64_t v7 = NSStringFromCGRect(v8);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_238377000, a4, OS_LOG_TYPE_ERROR, "Frame for labeled element was invalid - %@", a1, 0xCu);
}

@end