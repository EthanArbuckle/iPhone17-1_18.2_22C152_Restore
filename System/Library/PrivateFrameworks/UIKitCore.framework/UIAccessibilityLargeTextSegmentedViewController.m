@interface UIAccessibilityLargeTextSegmentedViewController
- (BOOL)_canShowWhileLocked;
- (NSArray)segments;
- (NSMutableArray)segmentButtons;
- (UIAccessibilityLargeTextSegmentedViewController)initWithSegmentedControl:(id)a3 segments:(id)a4 delegate:(id)a5;
- (UIScrollView)mainScrollView;
- (UISegment)originalSelectedSegment;
- (UISegmentedControl)segmentedControl;
- (id)segmentFromSegment:(id)a3;
- (void)_configureSegmentViews;
- (void)_orientationChanged:(id)a3;
- (void)buttonPress:(id)a3;
- (void)buttonTouchDown:(id)a3;
- (void)buttonTouchUp:(id)a3;
- (void)setMainScrollView:(id)a3;
- (void)setOriginalSelectedSegment:(id)a3;
- (void)setSegmentButtons:(id)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setSegments:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation UIAccessibilityLargeTextSegmentedViewController

- (id)segmentFromSegment:(id)a3
{
  v3 = (id *)a3;
  v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:0 error:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:0];
  [v5 setRequiresSecureCoding:0];
  v6 = [v5 decodeObjectForKey:*MEMORY[0x1E4F284E8]];
  v7 = [v3 backgroundColor];
  [v6 setBackgroundColor:v7];

  v8 = [v3 tintColor];
  [v6 setTintColor:v8];

  objc_msgSend(v6, "setEnabled:", objc_msgSend(v3, "isEnabled"));
  objc_storeStrong(v6 + 68, v3[68]);
  if (((_BYTE)v3[78] & 0x20) != 0)
  {
    v9 = [v3 objectValue];
    v10 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody"];
    v11 = [v9 imageWithConfiguration:v10];
    [v6 setObjectValue:v11];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6[63] setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  }

  return v6;
}

- (UIAccessibilityLargeTextSegmentedViewController)initWithSegmentedControl:(id)a3 segments:(id)a4 delegate:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v54.receiver = self;
  v54.super_class = (Class)UIAccessibilityLargeTextSegmentedViewController;
  v12 = [(UIViewController *)&v54 init];
  v13 = v12;
  if (v12)
  {
    p_segmentedControl = (id *)&v12->_segmentedControl;
    objc_storeStrong((id *)&v12->_segmentedControl, a3);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    segmentButtons = v13->_segmentButtons;
    v13->_segmentButtons = v15;

    [(UIViewController *)v13 setModalPresentationStyle:7];
    v17 = [(UIViewController *)v13 popoverPresentationController];
    [v17 setDelegate:v11];
    [v17 setSourceView:*p_segmentedControl];
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      [*p_segmentedControl bounds];
      objc_msgSend(v17, "setSourceRect:");
    }
    id v49 = v11;
    [v17 setPermittedArrowDirections:3];
    v18 = objc_opt_class();
    v19 = [v9 traitCollection];
    v20 = UISegmentedControlStyleProviderForIdiom(v18, [v19 userInterfaceIdiom]);

    v48 = v20;
    if (([v20 useSelectionIndicatorStyling] & 1) == 0)
    {
      v21 = [*p_segmentedControl tintColor];
      [v17 setArrowBackgroundColor:v21];

      id v22 = [*p_segmentedControl backgroundColor];
      id v23 = v10;
      uint64_t v24 = [v22 CGColor];
      v25 = [(UIViewController *)v13 view];
      v26 = [v25 layer];
      [v26 setBackgroundColor:v24];

      id v27 = [*p_segmentedControl tintColor];
      uint64_t v28 = [v27 CGColor];
      v29 = [(UIViewController *)v13 view];
      v30 = [v29 layer];
      [v30 setBorderColor:v28];

      id v10 = v23;
      v31 = [(UIViewController *)v13 view];
      v32 = [v31 layer];
      [v32 setBorderWidth:1.0];

      v33 = [(UIViewController *)v13 view];
      v34 = [v33 layer];
      [v34 setCornerRadius:13.0];
    }
    v35 = [(UIViewController *)v13 view];
    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];

    v36 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v37 = v10;
    id v38 = v10;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v51 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = [(UIAccessibilityLargeTextSegmentedViewController *)v13 segmentFromSegment:*(void *)(*((void *)&v50 + 1) + 8 * i)];
          [(NSArray *)v36 addObject:v43];
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v40);
    }

    segments = v13->_segments;
    v13->_segments = v36;
    v45 = v36;

    [(UIAccessibilityLargeTextSegmentedViewController *)v13 _configureSegmentViews];
    v46 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v46 addObserver:v13 selector:sel__orientationChanged_ name:@"UIDeviceOrientationDidChangeNotification" object:0];

    id v10 = v37;
    id v11 = v49;
  }

  return v13;
}

- (void)_configureSegmentViews
{
  v3 = objc_alloc_init(UIScrollView);
  [(UIView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIScrollView *)v3 setBounces:0];
  v61 = objc_alloc_init(UIStackView);
  [(UIStackView *)v61 setAxis:1];
  [(UIStackView *)v61 setDistribution:3];
  [(UIStackView *)v61 setAlignment:0];
  [(UIStackView *)v61 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [(UIViewController *)self view];
  [v4 addSubview:v3];

  [(UIView *)v3 addSubview:v61];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [(UIView *)v3 centerXAnchor];
  v7 = [(UIViewController *)self view];
  v8 = [v7 centerXAnchor];
  id v9 = [v6 constraintEqualToAnchor:v8];
  [v5 addObject:v9];

  id v10 = [(UIView *)v3 widthAnchor];
  id v11 = [(UIViewController *)self view];
  v12 = [v11 widthAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [v5 addObject:v13];

  v14 = [(UIView *)v3 topAnchor];
  v15 = [(UIViewController *)self view];
  v16 = [v15 safeAreaLayoutGuide];
  v17 = [v16 topAnchor];
  v18 = [v14 constraintEqualToAnchor:v17];
  [v5 addObject:v18];

  v19 = [(UIView *)v61 centerXAnchor];
  v20 = [(UIView *)v3 centerXAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v5 addObject:v21];

  id v22 = [(UIView *)v61 widthAnchor];
  id v23 = [(UIView *)v3 widthAnchor];
  uint64_t v24 = [v22 constraintEqualToAnchor:v23];
  [v5 addObject:v24];

  v25 = [(UIView *)v61 topAnchor];
  v26 = [(UIView *)v3 topAnchor];
  id v27 = [v25 constraintEqualToAnchor:v26];
  [v5 addObject:v27];

  uint64_t v28 = [(UIView *)v61 bottomAnchor];
  v59 = v3;
  v29 = [(UIView *)v3 bottomAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v5 addObject:v30];

  NSUInteger v60 = [(NSArray *)self->_segments count];
  if (v60)
  {
    uint64_t v31 = 0;
    double v32 = *MEMORY[0x1E4F1DB30];
    double v33 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v34 = 0.0;
    v35 = &OBJC_IVAR___UIDeferredMenuElement__sender;
    while (1)
    {
      v36 = [(NSArray *)self->_segments objectAtIndex:v31];
      [v36 setUsesAXTextSize:1];
      [v36 setSegmentPosition:1];
      if (v31 == [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex])
      {
        objc_storeStrong((id *)&self->_originalSelectedSegment, v36);
        [v36 setSelected:1];
      }
      id v37 = *(id *)&v36[v35[206]];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v37 setNumberOfLines:0];
        [v37 setLineBreakMode:0];
      }
      id v38 = +[UISegmentAccessibilityButton buttonWithSegment:v36];
      [v38 addTarget:self action:sel_buttonPress_ forControlEvents:64];
      [v38 addTarget:self action:sel_buttonTouchDown_ forControlEvents:1];
      [v38 addTarget:self action:sel_buttonTouchDown_ forControlEvents:16];
      [v38 addTarget:self action:sel_buttonTouchUp_ forControlEvents:128];
      [v38 addTarget:self action:sel_buttonTouchUp_ forControlEvents:32];
      uint64_t v39 = v35;
      id v40 = *(id *)&v36[v35[206]];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v36 _maximumTextSize];
      }
      else
      {
        double v42 = v33;
        double v43 = v32;
        if (!v40) {
          goto LABEL_12;
        }
        [v40 intrinsicContentSize];
      }
      double v43 = v41;
LABEL_12:
      double v44 = v42 + 16.0;
      if (!v31)
      {
        v45 = [(UIView *)self->_segmentedControl window];
        [v45 bounds];
        double v47 = v46;

        if (v47 < v44 + v44) {
          [(UIViewController *)self dismissViewControllerAnimated:0 completion:0];
        }
      }
      [(UIStackView *)v61 addArrangedSubview:v38];
      v48 = [v38 heightAnchor];
      id v49 = [v48 constraintEqualToConstant:v44];
      [v5 addObject:v49];

      [(NSMutableArray *)self->_segmentButtons addObject:v38];
      if (v34 < v43 + 32.0) {
        double v34 = v43 + 32.0;
      }

      ++v31;
      v35 = v39;
      if (v60 == v31) {
        goto LABEL_20;
      }
    }
  }
  double v34 = 0.0;
LABEL_20:
  -[UIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v34, 0.0);
  long long v50 = [(UIView *)v59 heightAnchor];
  long long v51 = [(UIView *)v61 heightAnchor];
  long long v52 = [v50 constraintEqualToAnchor:v51];

  LODWORD(v53) = 1148829696;
  [v52 setPriority:v53];
  [v5 addObject:v52];
  objc_super v54 = [(UIView *)v59 heightAnchor];
  v55 = [(UIViewController *)self view];
  uint64_t v56 = [v55 heightAnchor];
  v57 = [v54 constraintLessThanOrEqualToAnchor:v56 multiplier:1.0];
  [v5 addObject:v57];

  [MEMORY[0x1E4F5B268] activateConstraints:v5];
  mainScrollView = self->_mainScrollView;
  self->_mainScrollView = v59;
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityLargeTextSegmentedViewController;
  [(UIViewController *)&v5 viewDidLayoutSubviews];
  [(UIViewController *)self preferredContentSize];
  double v4 = v3;
  [(UIView *)self->_mainScrollView size];
  [(UIViewController *)self setPreferredContentSize:v4];
}

- (void)buttonPress:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIAccessibilityLargeTextSegmentedViewController *)self originalSelectedSegment];
  [v5 setSelected:0];

  v6 = [v4 segment];
  [v6 setSelected:1];

  v7 = [(UIAccessibilityLargeTextSegmentedViewController *)self segmentedControl];
  uint64_t v8 = [(NSMutableArray *)self->_segmentButtons indexOfObject:v4];

  [v7 setSelectedSegmentIndex:v8];
  id v9 = [(UIAccessibilityLargeTextSegmentedViewController *)self segmentedControl];
  [v9 _sendValueChanged];

  [(UIViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)buttonTouchDown:(id)a3
{
  id v3 = [a3 segment];
  [v3 setHighlighted:1];
}

- (void)buttonTouchUp:(id)a3
{
  id v3 = [a3 segment];
  [v3 setHighlighted:0];
}

- (void)_orientationChanged:(id)a3
{
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
}

- (NSMutableArray)segmentButtons
{
  return self->_segmentButtons;
}

- (void)setSegmentButtons:(id)a3
{
}

- (UISegment)originalSelectedSegment
{
  return self->_originalSelectedSegment;
}

- (void)setOriginalSelectedSegment:(id)a3
{
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (UIScrollView)mainScrollView
{
  return self->_mainScrollView;
}

- (void)setMainScrollView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainScrollView, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_originalSelectedSegment, 0);
  objc_storeStrong((id *)&self->_segmentButtons, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end