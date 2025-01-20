@interface TUIEnvironment
- (BOOL)_setValue:(ResolvedValue *)a3 forName:(id)a4;
- (BOOL)accessibilityElementsNeeded;
- (BOOL)demoMode;
- (BOOL)hasExtendedNS:(unsigned __int16)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEnvironment:(id)a3;
- (BOOL)setFloat:(double)a3 forName:(id)a4;
- (BOOL)setSymbol:(id)a3 forName:(id)a4;
- (BOOL)useFontFallback;
- (BuiltinSymbol)contentSizeCategorySymbol;
- (CGSize)viewSize;
- (CGSize)windowSize;
- (NSString)language;
- (ResolvedValue)lookupName:(SEL)a3 symtab:(Entry)a4;
- (TUIEnvironment)init;
- (TUIEnvironment)initWithOther:(id)a3;
- (TUIEnvironment)initWithTraitCollection:(id)a3 viewController:(id)a4 viewSize:(CGSize)a5;
- (TUIEnvironment)initWithTraitCollection:(id)a3 viewController:(id)a4 viewSize:(CGSize)a5 windowSize:(CGSize)a6;
- (TUIEnvironment)initWithViewController:(id)a3 viewSize:(CGSize)a4;
- (TUIEnvironment)initWithViewController:(id)a3 viewSize:(CGSize)a4 windowSize:(CGSize)a5;
- (TUIEnvironment)initWithViewSize:(CGSize)a3 traitCollection:(id)a4;
- (UIColor)tintColor;
- (UITraitCollection)sanitizedTraitCollection;
- (UITraitCollection)traitCollection;
- (double)contentsScale;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)activeAppearance;
- (unint64_t)contentSizeCategory;
- (unint64_t)deviceClass;
- (unint64_t)differenceMaskWithEnvironment:(id)a3;
- (unint64_t)displayClass;
- (unint64_t)heightClass;
- (unint64_t)layoutDirection;
- (unint64_t)orientation;
- (unint64_t)split;
- (unint64_t)style;
- (unint64_t)widthClass;
- (void)_updateValues;
- (void)setAccessibilityElementsNeeded:(BOOL)a3;
- (void)setActiveAppearance:(unint64_t)a3;
- (void)setContentSizeCategory:(unint64_t)a3;
- (void)setContentsScale:(double)a3;
- (void)setDemoMode:(BOOL)a3;
- (void)setDeviceClass:(unint64_t)a3;
- (void)setDisplayClass:(unint64_t)a3;
- (void)setHeightClass:(unint64_t)a3;
- (void)setLanguage:(id)a3;
- (void)setLayoutDirection:(unint64_t)a3;
- (void)setOrientation:(unint64_t)a3;
- (void)setSplit:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)setUseFontFallback:(BOOL)a3;
- (void)setViewSize:(CGSize)a3;
- (void)setWidthClass:(unint64_t)a3;
- (void)setWindowSize:(CGSize)a3;
@end

@implementation TUIEnvironment

- (void)_updateValues
{
  unint64_t deviceClass = self->_deviceClass;
  if (deviceClass > 6)
  {
    int v6 = 0;
  }
  else
  {
    int64_t v2 = qword_243968[deviceClass];
    int v6 = 7;
  }
  self->_deviceClassValue._kind = v6;
  object = self->_deviceClassValue._object;
  self->_deviceClassValue._object = 0;

  self->_deviceClassValue.var0._integer = v2;
  unint64_t widthClass = self->_widthClass;
  v9 = qword_2439A0;
  if (widthClass > 3)
  {
    int v10 = 0;
  }
  else
  {
    int64_t v3 = qword_2439A0[widthClass];
    int v10 = 7;
  }
  self->_widthClassValue._kind = v10;
  v11 = self->_widthClassValue._object;
  self->_widthClassValue._object = 0;

  self->_widthClassValue.var0._integer = v3;
  unint64_t heightClass = self->_heightClass;
  if (heightClass > 3)
  {
    int v13 = 0;
  }
  else
  {
    v9 = (void *)qword_2439A0[heightClass];
    int v13 = 7;
  }
  self->_heightClassValue._kind = v13;
  v14 = self->_heightClassValue._object;
  self->_heightClassValue._object = 0;

  self->_heightClassValue.var0._integer = (int64_t)v9;
  unint64_t displayClass = self->_displayClass;
  if (displayClass > 2)
  {
    int v16 = 0;
  }
  else
  {
    v9 = (void *)qword_2439C0[displayClass];
    int v16 = 7;
  }
  self->_displayClassValue._kind = v16;
  v17 = self->_displayClassValue._object;
  self->_displayClassValue._object = 0;

  self->_displayClassValue.var0._integer = (int64_t)v9;
  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_windowSize.width, self->_windowSize.height);
  v18 = (_value *)objc_claimAutoreleasedReturnValue();
  self->_windowSizeValue._kind = 3;
  v19 = self->_windowSizeValue._object;
  self->_windowSizeValue._object = v18;
  v20 = v18;

  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_viewSize.width, self->_viewSize.height);
  v21 = (_value *)objc_claimAutoreleasedReturnValue();
  self->_viewSizeValue._kind = 3;
  v22 = self->_viewSizeValue._object;
  self->_viewSizeValue._object = v21;
  v23 = v21;

  unint64_t split = self->_split;
  if (split > 4)
  {
    int v25 = 0;
  }
  else
  {
    v23 = (_value *)qword_2439D8[split];
    int v25 = 7;
  }
  self->_splitValue._kind = v25;
  v26 = self->_splitValue._object;
  self->_splitValue._object = 0;

  self->_splitValue.var0._integer = (int64_t)v23;
  unint64_t orientation = self->_orientation;
  if (orientation > 2)
  {
    int v28 = 0;
  }
  else
  {
    v23 = (_value *)qword_243A00[orientation];
    int v28 = 7;
  }
  self->_orientationValue._kind = v28;
  v29 = self->_orientationValue._object;
  self->_orientationValue._object = 0;

  self->_orientationValue.var0._integer = (int64_t)v23;
  unint64_t style = self->_style;
  if (style > 2)
  {
    int v31 = 0;
  }
  else
  {
    v23 = (_value *)qword_243A18[style];
    int v31 = 7;
  }
  self->_styleValue._kind = v31;
  v32 = self->_styleValue._object;
  self->_styleValue._object = 0;

  self->_styleValue.var0._integer = (int64_t)v23;
  int64_t demoMode = self->_demoMode;
  self->_demoModeValue._kind = 12;
  v34 = self->_demoModeValue._object;
  self->_demoModeValue._object = 0;

  self->_demoModeValue.var0._integer = demoMode;
  unint64_t contentSizeCategory = self->_contentSizeCategory;
  v36 = (unint64_t *)((char *)&unk_243A30 + 8 * contentSizeCategory);
  if (contentSizeCategory >= 0xD) {
    v36 = (unint64_t *)&unk_243A98;
  }
  int64_t v37 = *v36;
  self->_contentSizeCategorySymbol.value = *v36;
  self->_contentSizeCategoryValue._kind = 7;
  v38 = self->_contentSizeCategoryValue._object;
  self->_contentSizeCategoryValue._object = 0;

  self->_contentSizeCategoryValue.var0._integer = v37;
  int64_t v39 = *(void *)&self->_contentsScale;
  self->_contentsScaleValue._kind = 1;
  v40 = self->_contentsScaleValue._object;
  self->_contentsScaleValue._object = 0;

  self->_contentsScaleValue.var0._integer = v39;
  v41 = self->_tintColor;
  self->_tintColorValue._kind = 11;
  v42 = self->_tintColorValue._object;
  self->_tintColorValue._object = (_value *)v41;
  v43 = v41;

  unint64_t layoutDirection = self->_layoutDirection;
  if (layoutDirection > 2)
  {
    int v45 = 0;
  }
  else
  {
    v43 = (UIColor *)qword_243AA0[layoutDirection];
    int v45 = 7;
  }
  self->_layoutDirectionValue._kind = v45;
  v46 = self->_layoutDirectionValue._object;
  self->_layoutDirectionValue._object = 0;

  self->_layoutDirectionValue.var0._integer = (int64_t)v43;
  unint64_t activeAppearance = self->_activeAppearance;
  if (activeAppearance > 2)
  {
    int v48 = 0;
  }
  else
  {
    v43 = (UIColor *)qword_243AB8[activeAppearance];
    int v48 = 7;
  }
  self->_activeAppearanceValue._kind = v48;
  v49 = self->_activeAppearanceValue._object;
  self->_activeAppearanceValue._object = 0;

  self->_activeAppearanceValue.var0._integer = (int64_t)v43;
}

- (TUIEnvironment)initWithViewSize:(CGSize)a3 traitCollection:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8 = (UITraitCollection *)a4;
  v18.receiver = self;
  v18.super_class = (Class)TUIEnvironment;
  v9 = [(TUIEnvironment *)&v18 init];
  if (v9)
  {
    uint64_t v10 = [(UITraitCollection *)v8 traitCollectionByModifyingTraits:&stru_255BC0];
    sanitizedTraitCollection = v9->_sanitizedTraitCollection;
    v9->_sanitizedTraitCollection = (UITraitCollection *)v10;

    objc_storeStrong((id *)&v9->_traitCollection, a4);
    v9->_unint64_t activeAppearance = _determineActiveAppearance(v8);
    v9->_viewSize.CGFloat width = width;
    v9->_viewSize.CGFloat height = height;
    v9->_unint64_t contentSizeCategory = 4;
    v9->_contentsScale = 2.0;
    v9->_int64_t demoMode = +[UIApplication isRunningInStoreDemoMode];
    v9->_unint64_t layoutDirection = 1;
    uint64_t v12 = +[UIColor blueColor];
    tintColor = v9->_tintColor;
    v9->_tintColor = (UIColor *)v12;

    objc_storeStrong((id *)&v9->_traitCollection, a4);
    v14 = +[NSBundle mainBundle];
    v15 = [v14 preferredLocalizations];
    int v16 = [v15 firstObject];
    [(TUIEnvironment *)v9 setLanguage:v16];

    [(TUIEnvironment *)v9 _updateValues];
  }

  return v9;
}

- (TUIEnvironment)init
{
  return -[TUIEnvironment initWithViewSize:traitCollection:](self, "initWithViewSize:traitCollection:", 0, CGSizeZero.width, CGSizeZero.height);
}

- (TUIEnvironment)initWithViewController:(id)a3 viewSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = [v7 viewIfLoaded];
  v9 = [v8 window];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = +[UIWindow _applicationKeyWindow];
  }
  uint64_t v12 = v11;

  [v12 bounds];
  int v13 = [(TUIEnvironment *)self initWithViewController:v7 viewSize:width windowSize:height];

  return v13;
}

- (TUIEnvironment)initWithViewController:(id)a3 viewSize:(CGSize)a4 windowSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  id v10 = a3;
  id v11 = [v10 traitCollection];
  uint64_t v12 = -[TUIEnvironment initWithTraitCollection:viewController:viewSize:windowSize:](self, "initWithTraitCollection:viewController:viewSize:windowSize:", v11, v10, v8, v7, width, height);

  return v12;
}

- (TUIEnvironment)initWithTraitCollection:(id)a3 viewController:(id)a4 viewSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v10 = a4;
  id v11 = [v10 viewIfLoaded];
  uint64_t v12 = [v11 window];
  int v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = +[UIWindow _applicationKeyWindow];
  }
  v15 = v14;

  [v15 bounds];
  int v16 = [(TUIEnvironment *)self initWithTraitCollection:v9 viewController:v10 viewSize:width windowSize:height];

  return v16;
}

- (TUIEnvironment)initWithTraitCollection:(id)a3 viewController:(id)a4 viewSize:(CGSize)a5 windowSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double v8 = a5.height;
  double v9 = a5.width;
  id v12 = a3;
  id v13 = a4;
  id v14 = -[TUIEnvironment initWithViewSize:traitCollection:](self, "initWithViewSize:traitCollection:", v12, v9, v8);
  v15 = v14;
  if (v14)
  {
    -[TUIEnvironment setWindowSize:](v14, "setWindowSize:", width, height);
    id v16 = v12;
    if (qword_2DF738 != -1) {
      dispatch_once(&qword_2DF738, &stru_255BE0);
    }
    if ([v16 userInterfaceIdiom] == (char *)&def_141F14 + 1)
    {
      if (qword_2DF720 != -1) {
        dispatch_once(&qword_2DF720, &stru_255B80);
      }
      if (dword_2DF718) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = 1;
      }
    }
    else if ([v16 userInterfaceIdiom])
    {
      if ([v16 userInterfaceIdiom] == (char *)&dword_4 + 1) {
        uint64_t v17 = 6;
      }
      else {
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v17 = 5;
      if (*(double *)&qword_2DF728 <= 667.0 && *(double *)&qword_2DF730 <= 667.0)
      {
        if (*(double *)&qword_2DF730 <= 568.0 && *(double *)&qword_2DF728 <= 568.0) {
          uint64_t v17 = 3;
        }
        else {
          uint64_t v17 = 4;
        }
      }
    }

    [(TUIEnvironment *)v15 setDeviceClass:v17];
    id v19 = v16;
    if ([v19 horizontalSizeClass] == (char *)&def_141F14 + 1)
    {
      uint64_t v20 = 1;
    }
    else if ([v19 horizontalSizeClass] == (char *)&def_141F14 + 2)
    {
      if (qword_2DF720 != -1) {
        dispatch_once(&qword_2DF720, &stru_255B80);
      }
      if (width <= 1024.0 || dword_2DF718 == 0) {
        uint64_t v20 = 2;
      }
      else {
        uint64_t v20 = 3;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }

    [(TUIEnvironment *)v15 setWidthClass:v20];
    id v22 = v19;
    if ([v22 verticalSizeClass] == (char *)&def_141F14 + 1) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = 2 * ([v22 verticalSizeClass] == (char *)&def_141F14 + 2);
    }

    [(TUIEnvironment *)v15 setHeightClass:v23];
    if (_TUIDeviceHasOLEDDisplay()) {
      uint64_t v24 = 2;
    }
    else {
      uint64_t v24 = 1;
    }
    [(TUIEnvironment *)v15 setDisplayClass:v24];
    int v25 = +[UIScreen mainScreen];
    [v25 bounds];
    double v27 = v26;
    double v29 = v28;

    if (width == v27 && height == v29)
    {
      uint64_t v30 = 1;
    }
    else
    {
      double v31 = width + v27 * -0.5;
      double v32 = fabs(v31);
      uint64_t v33 = 2;
      if (v31 < 0.0) {
        uint64_t v33 = 4;
      }
      if (v32 >= 10.0) {
        uint64_t v30 = v33;
      }
      else {
        uint64_t v30 = 3;
      }
    }
    [(TUIEnvironment *)v15 setSplit:v30];
    v34 = (UIViewController *)v13;
    v35 = (char *)[(UIViewController *)v34 _rotatingToInterfaceOrientation];
    if (!v35)
    {
      v35 = [(UIViewController *)v34 interfaceOrientation];
      if (!v35)
      {
        v36 = +[UIWindow _applicationKeyWindow];
        int64_t v37 = [v36 windowScene];
        v35 = (char *)[v37 interfaceOrientation];
      }
    }
    if ((unint64_t)(v35 - 1) < 2) {
      uint64_t v38 = 1;
    }
    else {
      uint64_t v38 = 2;
    }

    [(TUIEnvironment *)v15 setOrientation:v38];
    id v39 = v22;
    if ([v39 userInterfaceStyle] == (char *)&def_141F14 + 1) {
      uint64_t v40 = 1;
    }
    else {
      uint64_t v40 = 2 * ([v39 userInterfaceStyle] == (char *)&def_141F14 + 2);
    }

    [(TUIEnvironment *)v15 setStyle:v40];
    v41 = (UITraitCollection *)v39;
    UIContentSizeCategory v42 = [(UITraitCollection *)v41 preferredContentSizeCategory];

    if (v42 == UIContentSizeCategoryAccessibilityExtraExtraExtraLarge)
    {
      uint64_t v54 = 12;
    }
    else
    {
      UIContentSizeCategory v43 = [(UITraitCollection *)v41 preferredContentSizeCategory];

      if (v43 == UIContentSizeCategoryAccessibilityExtraExtraLarge)
      {
        uint64_t v54 = 11;
      }
      else
      {
        UIContentSizeCategory v44 = [(UITraitCollection *)v41 preferredContentSizeCategory];

        if (v44 == UIContentSizeCategoryAccessibilityExtraLarge)
        {
          uint64_t v54 = 10;
        }
        else
        {
          UIContentSizeCategory v45 = [(UITraitCollection *)v41 preferredContentSizeCategory];

          if (v45 == UIContentSizeCategoryAccessibilityLarge)
          {
            uint64_t v54 = 9;
          }
          else
          {
            UIContentSizeCategory v46 = [(UITraitCollection *)v41 preferredContentSizeCategory];

            if (v46 == UIContentSizeCategoryAccessibilityMedium)
            {
              uint64_t v54 = 8;
            }
            else
            {
              UIContentSizeCategory v47 = [(UITraitCollection *)v41 preferredContentSizeCategory];

              if (v47 == UIContentSizeCategoryExtraExtraExtraLarge)
              {
                uint64_t v54 = 7;
              }
              else
              {
                UIContentSizeCategory v48 = [(UITraitCollection *)v41 preferredContentSizeCategory];

                if (v48 == UIContentSizeCategoryExtraExtraLarge)
                {
                  uint64_t v54 = 6;
                }
                else
                {
                  UIContentSizeCategory v49 = [(UITraitCollection *)v41 preferredContentSizeCategory];

                  if (v49 == UIContentSizeCategoryExtraLarge)
                  {
                    uint64_t v54 = 5;
                  }
                  else
                  {
                    UIContentSizeCategory v50 = [(UITraitCollection *)v41 preferredContentSizeCategory];

                    if (v50 == UIContentSizeCategoryLarge)
                    {
                      uint64_t v54 = 4;
                    }
                    else
                    {
                      UIContentSizeCategory v51 = [(UITraitCollection *)v41 preferredContentSizeCategory];

                      if (v51 == UIContentSizeCategoryMedium)
                      {
                        uint64_t v54 = 3;
                      }
                      else
                      {
                        UIContentSizeCategory v52 = [(UITraitCollection *)v41 preferredContentSizeCategory];

                        if (v52 == UIContentSizeCategorySmall)
                        {
                          uint64_t v54 = 2;
                        }
                        else
                        {
                          UIContentSizeCategory v53 = [(UITraitCollection *)v41 preferredContentSizeCategory];
                          uint64_t v54 = v53 == UIContentSizeCategoryExtraSmall;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    [(TUIEnvironment *)v15 setContentSizeCategory:v54];
    [(UITraitCollection *)v41 displayScale];
    -[TUIEnvironment setContentsScale:](v15, "setContentsScale:");
    v55 = [(UIViewController *)v34 viewIfLoaded];
    v56 = [v55 tintColor];
    [(TUIEnvironment *)v15 setTintColor:v56];

    [(TUIEnvironment *)v15 setLayoutDirection:_determineLayoutDirection(v41, v34)];
    [(TUIEnvironment *)v15 setAccessibilityElementsNeeded:_AXSApplicationAccessibilityEnabled() != 0];
  }

  return v15;
}

- (TUIEnvironment)initWithOther:(id)a3
{
  id v4 = a3;
  [v4 viewSize];
  double v6 = v5;
  double v8 = v7;
  double v9 = [v4 traitCollection];
  id v10 = -[TUIEnvironment initWithViewSize:traitCollection:](self, "initWithViewSize:traitCollection:", v9, v6, v8);

  if (v10)
  {
    v10->_unint64_t deviceClass = (unint64_t)[v4 deviceClass];
    v10->_unint64_t widthClass = (unint64_t)[v4 widthClass];
    v10->_unint64_t heightClass = (unint64_t)[v4 heightClass];
    v10->_unint64_t displayClass = (unint64_t)[v4 displayClass];
    v10->_unint64_t split = (unint64_t)[v4 split];
    [v4 windowSize];
    v10->_windowSize.double width = v11;
    v10->_windowSize.double height = v12;
    v10->_unint64_t orientation = (unint64_t)[v4 orientation];
    v10->_unint64_t style = (unint64_t)[v4 style];
    v10->_unint64_t contentSizeCategory = (unint64_t)[v4 contentSizeCategory];
    v10->_unint64_t layoutDirection = (unint64_t)[v4 layoutDirection];
    v10->_accessibilityElementsNeeded = [v4 accessibilityElementsNeeded];
    uint64_t v13 = [v4 language];
    language = v10->_language;
    v10->_language = (NSString *)v13;

    v10->_useFontFallback = [v4 useFontFallback];
    [(TUIEnvironment *)v10 _updateValues];
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());

  return [v4 initWithOther:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    BOOL v6 = [(TUIEnvironment *)self isEqualToEnvironment:v4];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToEnvironment:(id)a3
{
  id v4 = a3;
  id v5 = [(TUIEnvironment *)self deviceClass];
  if (v5 != [v4 deviceClass]) {
    goto LABEL_23;
  }
  id v6 = [(TUIEnvironment *)self widthClass];
  if (v6 != [v4 widthClass]) {
    goto LABEL_23;
  }
  id v7 = [(TUIEnvironment *)self heightClass];
  if (v7 != [v4 heightClass]) {
    goto LABEL_23;
  }
  id v8 = [(TUIEnvironment *)self displayClass];
  if (v8 != [v4 displayClass]) {
    goto LABEL_23;
  }
  id v9 = [(TUIEnvironment *)self split];
  if (v9 != [v4 split]) {
    goto LABEL_23;
  }
  [(TUIEnvironment *)self windowSize];
  double v11 = v10;
  double v13 = v12;
  [v4 windowSize];
  BOOL v15 = 0;
  if (v11 == v16 && v13 == v14)
  {
    [(TUIEnvironment *)self viewSize];
    double v18 = v17;
    double v20 = v19;
    [v4 viewSize];
    BOOL v15 = 0;
    if (v18 == v22 && v20 == v21)
    {
      id v23 = [(TUIEnvironment *)self style];
      if (v23 != [v4 style]) {
        goto LABEL_23;
      }
      unsigned int v24 = [(TUIEnvironment *)self demoMode];
      if (v24 != [v4 demoMode]) {
        goto LABEL_23;
      }
      id v25 = [(TUIEnvironment *)self orientation];
      if (v25 != [v4 orientation]) {
        goto LABEL_23;
      }
      id v26 = [(TUIEnvironment *)self contentSizeCategory];
      if (v26 != [v4 contentSizeCategory]) {
        goto LABEL_23;
      }
      [(TUIEnvironment *)self contentsScale];
      double v28 = v27;
      [v4 contentsScale];
      if (v28 != v29) {
        goto LABEL_23;
      }
      id v30 = [(TUIEnvironment *)self layoutDirection];
      if (v30 != [v4 layoutDirection]) {
        goto LABEL_23;
      }
      id v31 = [(TUIEnvironment *)self activeAppearance];
      if (v31 != [v4 activeAppearance]) {
        goto LABEL_23;
      }
      unsigned int v32 = [(TUIEnvironment *)self accessibilityElementsNeeded];
      if (v32 != [v4 accessibilityElementsNeeded]) {
        goto LABEL_23;
      }
      uint64_t v33 = [(TUIEnvironment *)self language];
      v34 = [v4 language];
      if (v33 == v34)
      {
      }
      else
      {
        v35 = [(TUIEnvironment *)self language];
        v36 = [v4 language];
        unsigned int v37 = [v35 isEqualToString:v36];

        if (!v37) {
          goto LABEL_23;
        }
      }
      unsigned int v38 = [(TUIEnvironment *)self useFontFallback];
      if (v38 != [v4 useFontFallback])
      {
LABEL_23:
        BOOL v15 = 0;
        goto LABEL_24;
      }
      uint64_t v40 = [(TUIEnvironment *)self sanitizedTraitCollection];
      v41 = [v4 sanitizedTraitCollection];
      if (v40 == v41)
      {
        unsigned __int8 v44 = 1;
      }
      else
      {
        UIContentSizeCategory v42 = [(TUIEnvironment *)self sanitizedTraitCollection];
        UIContentSizeCategory v43 = [v4 sanitizedTraitCollection];
        unsigned __int8 v44 = [v42 isEqual:v43];
      }
      BOOL v15 = v44;
    }
  }
LABEL_24:

  return v15;
}

- (unint64_t)differenceMaskWithEnvironment:(id)a3
{
  id v4 = (TUIEnvironment *)a3;
  id v5 = v4;
  if (!v4)
  {
    unint64_t v22 = 61;
    goto LABEL_44;
  }
  if (self == v4)
  {
    unint64_t v22 = 0;
    goto LABEL_44;
  }
  [(TUIEnvironment *)self windowSize];
  double v7 = v6;
  double v9 = v8;
  [(TUIEnvironment *)v5 windowSize];
  BOOL v11 = 0;
  if (v7 == v12 && v9 == v10)
  {
    [(TUIEnvironment *)self viewSize];
    double v14 = v13;
    double v16 = v15;
    [(TUIEnvironment *)v5 viewSize];
    BOOL v11 = v16 == v18 && v14 == v17;
  }
  id v19 = [(TUIEnvironment *)self widthClass];
  if (v19 == (id)[(TUIEnvironment *)v5 widthClass])
  {
    id v20 = [(TUIEnvironment *)self heightClass];
    BOOL v21 = v20 == (id)[(TUIEnvironment *)v5 heightClass];
  }
  else
  {
    BOOL v21 = 0;
  }
  id v23 = [(TUIEnvironment *)self split];
  if (v23 == (id)[(TUIEnvironment *)v5 split])
  {
    id v24 = [(TUIEnvironment *)self orientation];
    BOOL v25 = v24 == (id)[(TUIEnvironment *)v5 orientation];
  }
  else
  {
    BOOL v25 = 0;
  }
  id v26 = [(TUIEnvironment *)self style];
  if (v26 != (id)[(TUIEnvironment *)v5 style]) {
    goto LABEL_19;
  }
  double v27 = [(TUIEnvironment *)self tintColor];
  double v28 = [(TUIEnvironment *)v5 tintColor];
  if (v27 == v28)
  {

    goto LABEL_21;
  }
  double v29 = [(TUIEnvironment *)self tintColor];
  id v30 = [(TUIEnvironment *)v5 tintColor];
  unsigned int v31 = [v29 isEqual:v30];

  if (v31)
  {
LABEL_21:
    id v33 = [(TUIEnvironment *)self activeAppearance];
    BOOL v32 = v33 == (id)[(TUIEnvironment *)v5 activeAppearance];
    goto LABEL_22;
  }
LABEL_19:
  BOOL v32 = 0;
LABEL_22:
  id v34 = [(TUIEnvironment *)self deviceClass];
  if (v34 != (id)[(TUIEnvironment *)v5 deviceClass]) {
    goto LABEL_34;
  }
  id v35 = [(TUIEnvironment *)self displayClass];
  if (v35 != (id)[(TUIEnvironment *)v5 displayClass]) {
    goto LABEL_34;
  }
  unsigned int v36 = [(TUIEnvironment *)self demoMode];
  if (v36 != [(TUIEnvironment *)v5 demoMode]) {
    goto LABEL_34;
  }
  id v37 = [(TUIEnvironment *)self contentSizeCategory];
  if (v37 != (id)[(TUIEnvironment *)v5 contentSizeCategory]) {
    goto LABEL_34;
  }
  [(TUIEnvironment *)self contentsScale];
  double v39 = v38;
  [(TUIEnvironment *)v5 contentsScale];
  if (v39 != v40) {
    goto LABEL_34;
  }
  id v41 = [(TUIEnvironment *)self layoutDirection];
  if (v41 != (id)[(TUIEnvironment *)v5 layoutDirection]) {
    goto LABEL_34;
  }
  unsigned int v42 = [(TUIEnvironment *)self accessibilityElementsNeeded];
  if (v42 != [(TUIEnvironment *)v5 accessibilityElementsNeeded]) {
    goto LABEL_34;
  }
  v55 = [(TUIEnvironment *)self language];
  UIContentSizeCategory v43 = [(TUIEnvironment *)v5 language];
  if (v55 == v43)
  {
  }
  else
  {
    unsigned __int8 v44 = [(TUIEnvironment *)self language];
    UIContentSizeCategory v45 = [(TUIEnvironment *)v5 language];
    unsigned int v46 = [v44 isEqualToString:v45];

    if (!v46) {
      goto LABEL_34;
    }
  }
  unsigned int v47 = [(TUIEnvironment *)self useFontFallback];
  if (v47 == [(TUIEnvironment *)v5 useFontFallback])
  {
    UIContentSizeCategory v51 = [(TUIEnvironment *)self sanitizedTraitCollection];
    UIContentSizeCategory v52 = [(TUIEnvironment *)v5 sanitizedTraitCollection];
    if (v51 == v52)
    {
      unsigned int v48 = 1;
    }
    else
    {
      UIContentSizeCategory v53 = [(TUIEnvironment *)self sanitizedTraitCollection];
      uint64_t v54 = [(TUIEnvironment *)v5 sanitizedTraitCollection];
      unsigned int v48 = [v53 isEqual:v54];
    }
    goto LABEL_35;
  }
LABEL_34:
  unsigned int v48 = 0;
LABEL_35:
  unint64_t v49 = !v11;
  if (!v21) {
    v49 |= 4uLL;
  }
  if (!v25) {
    v49 |= 8uLL;
  }
  if (!v32) {
    v49 |= 0x10uLL;
  }
  if (v48) {
    unint64_t v22 = v49;
  }
  else {
    unint64_t v22 = v49 | 0x20;
  }
LABEL_44:

  return v22;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
  id v5 = a3;
  BOOL v6 = +[TUIFontSpec determineUseFontFallbackFromLanguage:v5];

  self->_useFontFallback = v6;
}

- (void)setDeviceClass:(unint64_t)a3
{
  self->_unint64_t deviceClass = a3;
  if (a3 > 6)
  {
    int v5 = 0;
  }
  else
  {
    int64_t v3 = qword_243968[a3];
    int v5 = 7;
  }
  self->_deviceClassValue._kind = v5;
  object = self->_deviceClassValue._object;
  self->_deviceClassValue._object = 0;

  self->_deviceClassValue.var0._integer = v3;
}

- (void)setWidthClass:(unint64_t)a3
{
  self->_unint64_t widthClass = a3;
  if (a3 > 3)
  {
    int v5 = 0;
  }
  else
  {
    int64_t v3 = qword_2439A0[a3];
    int v5 = 7;
  }
  self->_widthClassValue._kind = v5;
  object = self->_widthClassValue._object;
  self->_widthClassValue._object = 0;

  self->_widthClassValue.var0._integer = v3;
}

- (void)setHeightClass:(unint64_t)a3
{
  self->_unint64_t heightClass = a3;
  if (a3 > 3)
  {
    int v5 = 0;
  }
  else
  {
    int64_t v3 = qword_2439A0[a3];
    int v5 = 7;
  }
  self->_heightClassValue._kind = v5;
  object = self->_heightClassValue._object;
  self->_heightClassValue._object = 0;

  self->_heightClassValue.var0._integer = v3;
}

- (void)setDisplayClass:(unint64_t)a3
{
  self->_unint64_t displayClass = a3;
  if (a3 > 2)
  {
    int v5 = 0;
  }
  else
  {
    int64_t v3 = qword_2439C0[a3];
    int v5 = 7;
  }
  self->_displayClassValue._kind = v5;
  object = self->_displayClassValue._object;
  self->_displayClassValue._object = 0;

  self->_displayClassValue.var0._integer = v3;
}

- (void)setSplit:(unint64_t)a3
{
  self->_unint64_t split = a3;
  if (a3 > 4)
  {
    int v5 = 0;
  }
  else
  {
    int64_t v3 = qword_2439D8[a3];
    int v5 = 7;
  }
  self->_splitValue._kind = v5;
  object = self->_splitValue._object;
  self->_splitValue._object = 0;

  self->_splitValue.var0._integer = v3;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_unint64_t orientation = a3;
  if (a3 > 2)
  {
    int v5 = 0;
  }
  else
  {
    int64_t v3 = qword_243A00[a3];
    int v5 = 7;
  }
  self->_orientationValue._kind = v5;
  object = self->_orientationValue._object;
  self->_orientationValue._object = 0;

  self->_orientationValue.var0._integer = v3;
}

- (void)setWindowSize:(CGSize)a3
{
  self->_windowSize = a3;
  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:");
  id v4 = (_value *)objc_claimAutoreleasedReturnValue();
  self->_windowSizeValue._kind = 3;
  object = self->_windowSizeValue._object;
  self->_windowSizeValue._object = v4;
  BOOL v6 = v4;
}

- (void)setViewSize:(CGSize)a3
{
  self->_viewSize = a3;
  +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:");
  id v4 = (_value *)objc_claimAutoreleasedReturnValue();
  self->_viewSizeValue._kind = 3;
  object = self->_viewSizeValue._object;
  self->_viewSizeValue._object = v4;
  BOOL v6 = v4;
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t style = a3;
  if (a3 > 2)
  {
    int v5 = 0;
  }
  else
  {
    int64_t v3 = qword_243A18[a3];
    int v5 = 7;
  }
  self->_styleValue._kind = v5;
  object = self->_styleValue._object;
  self->_styleValue._object = 0;

  self->_styleValue.var0._integer = v3;
}

- (void)setActiveAppearance:(unint64_t)a3
{
  self->_unint64_t activeAppearance = a3;
  if (a3 > 2)
  {
    int v5 = 0;
  }
  else
  {
    int64_t v3 = qword_243AB8[a3];
    int v5 = 7;
  }
  self->_activeAppearanceValue._kind = v5;
  object = self->_activeAppearanceValue._object;
  self->_activeAppearanceValue._object = 0;

  self->_activeAppearanceValue.var0._integer = v3;
}

- (void)setDemoMode:(BOOL)a3
{
  self->_int64_t demoMode = a3;
  int64_t v4 = a3;
  self->_demoModeValue._kind = 12;
  object = self->_demoModeValue._object;
  self->_demoModeValue._object = 0;

  self->_demoModeValue.var0._integer = v4;
}

- (void)setContentSizeCategory:(unint64_t)a3
{
  self->_unint64_t contentSizeCategory = a3;
  int64_t v4 = (unint64_t *)((char *)&unk_243A30 + 8 * a3);
  if (a3 >= 0xD) {
    int64_t v4 = (unint64_t *)&unk_243A98;
  }
  int64_t v5 = *v4;
  self->_contentSizeCategorySymbol.value = *v4;
  self->_contentSizeCategoryValue._kind = 7;
  object = self->_contentSizeCategoryValue._object;
  self->_contentSizeCategoryValue._object = 0;

  self->_contentSizeCategoryValue.var0._integer = v5;
}

- (void)setContentsScale:(double)a3
{
  if (a3 <= 0.0) {
    double v4 = 1.0;
  }
  else {
    double v4 = a3;
  }
  self->_contentsScale = v4;
  self->_contentsScaleValue._kind = 1;
  object = self->_contentsScaleValue._object;
  self->_contentsScaleValue._object = 0;

  self->_contentsScaleValue.var0._float = v4;
}

- (void)setTintColor:(id)a3
{
  int64_t v5 = (_value *)a3;
  objc_storeStrong((id *)&self->_tintColor, a3);
  self->_tintColorValue._kind = 11;
  object = self->_tintColorValue._object;
  self->_tintColorValue._object = v5;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_unint64_t layoutDirection = a3;
  if (a3 > 2)
  {
    int v5 = 0;
  }
  else
  {
    int64_t v3 = qword_243AA0[a3];
    int v5 = 7;
  }
  self->_layoutDirectionValue._kind = v5;
  object = self->_layoutDirectionValue._object;
  self->_layoutDirectionValue._object = 0;

  self->_layoutDirectionValue.var0._integer = v3;
}

- (ResolvedValue)lookupName:(SEL)a3 symtab:(Entry)a4
{
  int v5 = self;
  Entry v26 = a4;
  if (a4.var0 == 1)
  {
    double v7 = (unsigned __int16 *)*((void *)a5 + 5);
    unint64_t v8 = *((void *)a5 + 6) - (void)v7;
    if (v8 < 0x13) {
      int v9 = 0xFFFF;
    }
    else {
      int v9 = v7[9];
    }
    if (v9 == a4.var1)
    {
      retstr->_kind = (int)self->_object;
      self = (ResolvedValue *)self->var0._integer;
      int64_t integer = *(void *)&v5[1]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x15) {
      int v12 = 0xFFFF;
    }
    else {
      int v12 = v7[10];
    }
    if (v12 == a4.var1)
    {
      retstr->_kind = (int)self[1]._object;
      self = (ResolvedValue *)self[1].var0._integer;
      int64_t integer = *(void *)&v5[2]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x17) {
      int v13 = 0xFFFF;
    }
    else {
      int v13 = v7[11];
    }
    if (v13 == a4.var1)
    {
      retstr->_kind = (int)self[2]._object;
      self = (ResolvedValue *)self[2].var0._integer;
      int64_t integer = *(void *)&v5[3]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x1B) {
      int v14 = 0xFFFF;
    }
    else {
      int v14 = v7[13];
    }
    if (v14 == a4.var1)
    {
      retstr->_kind = (int)self[6]._object;
      self = (ResolvedValue *)self[6].var0._integer;
      int64_t integer = *(void *)&v5[7]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x19) {
      int v15 = 0xFFFF;
    }
    else {
      int v15 = v7[12];
    }
    if (v15 == a4.var1)
    {
      retstr->_kind = (int)self[4]._object;
      self = (ResolvedValue *)self[4].var0._integer;
      int64_t integer = *(void *)&v5[5]._kind;
      goto LABEL_79;
    }
    if (v8 < 0xB3) {
      int v16 = 0xFFFF;
    }
    else {
      int v16 = v7[89];
    }
    if (v16 == a4.var1)
    {
      retstr->_kind = (int)self[5]._object;
      self = (ResolvedValue *)self[5].var0._integer;
      int64_t integer = *(void *)&v5[6]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x1D) {
      int v17 = 0xFFFF;
    }
    else {
      int v17 = v7[14];
    }
    if (v17 == a4.var1)
    {
      retstr->_kind = (int)self[7]._object;
      self = (ResolvedValue *)self[7].var0._integer;
      int64_t integer = *(void *)&v5[8]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x3B) {
      int v18 = 0xFFFF;
    }
    else {
      int v18 = v7[29];
    }
    if (v18 == a4.var1)
    {
      retstr->_kind = (int)self[8]._object;
      self = (ResolvedValue *)self[8].var0._integer;
      int64_t integer = *(void *)&v5[9]._kind;
      goto LABEL_79;
    }
    if (v8 < 0xBF) {
      int v19 = 0xFFFF;
    }
    else {
      int v19 = v7[95];
    }
    if (v19 == a4.var1)
    {
      retstr->_kind = (int)self[9]._object;
      self = (ResolvedValue *)self[9].var0._integer;
      int64_t integer = *(void *)&v5[10]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x55) {
      int v20 = 0xFFFF;
    }
    else {
      int v20 = v7[42];
    }
    if (v20 == a4.var1)
    {
      retstr->_kind = (int)self[10]._object;
      self = (ResolvedValue *)self[10].var0._integer;
      int64_t integer = *(void *)&v5[11]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x63) {
      int v21 = 0xFFFF;
    }
    else {
      int v21 = v7[49];
    }
    if (v21 == a4.var1)
    {
      retstr->_kind = (int)self[11]._object;
      self = (ResolvedValue *)self[11].var0._integer;
      int64_t integer = *(void *)&v5[12]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x65) {
      int v22 = 0xFFFF;
    }
    else {
      int v22 = v7[50];
    }
    if (v22 == a4.var1)
    {
      retstr->_kind = (int)self[12]._object;
      self = (ResolvedValue *)self[12].var0._integer;
      int64_t integer = *(void *)&v5[13]._kind;
      goto LABEL_79;
    }
    if (v8 < 0x75) {
      int v23 = 0xFFFF;
    }
    else {
      int v23 = v7[58];
    }
    if (v23 == a4.var1)
    {
      retstr->_kind = (int)self[13]._object;
      self = (ResolvedValue *)self[13].var0._integer;
      int64_t integer = *(void *)&v5[14]._kind;
      goto LABEL_79;
    }
    if (v8 < 0xAD) {
      int v24 = 0xFFFF;
    }
    else {
      int v24 = v7[86];
    }
    if (v24 == a4.var1)
    {
      retstr->_kind = (int)self[3]._object;
      self = (ResolvedValue *)self[3].var0._integer;
      int64_t integer = *(void *)&v5[4]._kind;
      goto LABEL_79;
    }
    if (v8 < 0xDD) {
      int v25 = 0xFFFF;
    }
    else {
      int v25 = v7[110];
    }
    if (v25 == a4.var1)
    {
      retstr->_kind = (int)self[14]._object;
      self = (ResolvedValue *)self[14].var0._integer;
      int64_t integer = *(void *)&v5[15]._kind;
      goto LABEL_79;
    }
LABEL_81:
    retstr->_kind = 0;
    retstr->_object = 0;
    return self;
  }
  self = (ResolvedValue *)sub_270E0(&self[17]._kind, &v26.var0);
  if (!self) {
    goto LABEL_81;
  }
  double v10 = self;
  retstr->_kind = self[1]._kind;
  self = self[1]._object;
  int64_t integer = v10[1].var0._integer;
LABEL_79:
  retstr->_object = (_value *)self;
  retstr->var0._int64_t integer = integer;
  return self;
}

- (BOOL)hasExtendedNS:(unsigned __int16)a3
{
  unsigned __int16 v4 = a3;
  return self->_hasExtendedValues
      && sub_12E50(&self->_extendedNameSpaces.__table_.__bucket_list_.__ptr_.__value_, &v4) != 0;
}

- (BOOL)setFloat:(double)a3 forName:(id)a4
{
  int v6 = 1;
  id v7 = 0;
  double v8 = a3;
  BOOL v4 = [(TUIEnvironment *)self _setValue:&v6 forName:*(unsigned int *)&a4];

  return v4;
}

- (BOOL)setSymbol:(id)a3 forName:(id)a4
{
  int v6 = 6;
  id v7 = 0;
  unsigned __int16 var0 = a3.var0;
  BOOL v4 = [(TUIEnvironment *)self _setValue:&v6 forName:*(unsigned int *)&a4];

  return v4;
}

- (BOOL)_setValue:(ResolvedValue *)a3 forName:(id)a4
{
  BOOL IsValid = TUINameIsValid(*(_DWORD *)&a4);
  BOOL result = 0;
  if (IsValid && (a4.var0 & 0xFFFE) != 0)
  {
    if (a3->_kind)
    {
      $201E9A47BE70A2B12CCA2F48B75AA2F7 v10 = a4;
      LOWORD(v11) = a4.var0;
      if (!sub_12E50(&self->_extendedNameSpaces.__table_.__bucket_list_.__ptr_.__value_, (unsigned __int16 *)&v11))
      {
        LOWORD(v11) = a4.var0;
        sub_124B1C((uint64_t)&self->_extendedNameSpaces, (unsigned __int16 *)&v11, &v11);
      }
      BOOL v11 = &v10;
      int v9 = sub_124D3C((uint64_t)&self->_extendedValues, &v10.var0, (uint64_t)&std::piecewise_construct, (_DWORD **)&v11);
      *((_DWORD *)v9 + 6) = a3->_kind;
      objc_storeStrong((id *)v9 + 4, a3->_object);
      v9[5] = a3->var0._integer;
      BOOL result = 1;
      self->_hasExtendedValues = 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BuiltinSymbol)contentSizeCategorySymbol
{
  return self->_contentSizeCategorySymbol;
}

- (unint64_t)deviceClass
{
  return self->_deviceClass;
}

- (unint64_t)widthClass
{
  return self->_widthClass;
}

- (unint64_t)heightClass
{
  return self->_heightClass;
}

- (unint64_t)displayClass
{
  return self->_displayClass;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)windowSize
{
  double width = self->_windowSize.width;
  double height = self->_windowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)split
{
  return self->_split;
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)demoMode
{
  return self->_demoMode;
}

- (unint64_t)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (BOOL)accessibilityElementsNeeded
{
  return self->_accessibilityElementsNeeded;
}

- (void)setAccessibilityElementsNeeded:(BOOL)a3
{
  self->_accessibilityElementsNeeded = a3;
}

- (unint64_t)activeAppearance
{
  return self->_activeAppearance;
}

- (NSString)language
{
  return self->_language;
}

- (BOOL)useFontFallback
{
  return self->_useFontFallback;
}

- (void)setUseFontFallback:(BOOL)a3
{
  self->_useFontFallback = a3;
}

- (UITraitCollection)sanitizedTraitCollection
{
  return self->_sanitizedTraitCollection;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_sanitizedTraitCollection, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  sub_354AC((uint64_t)&self->_extendedValues);
  sub_1265C((uint64_t)&self->_extendedNameSpaces);

  object = self->_deviceClassValue._object;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((void *)self + 2) = 0;
  *((_DWORD *)self + 8) = 0;
  *((void *)self + 5) = 0;
  *((_DWORD *)self + 14) = 0;
  *((void *)self + 8) = 0;
  *((_DWORD *)self + 20) = 0;
  *((void *)self + 11) = 0;
  *((_DWORD *)self + 26) = 0;
  *((void *)self + 14) = 0;
  *((_DWORD *)self + 32) = 0;
  *((void *)self + 17) = 0;
  *((_DWORD *)self + 38) = 0;
  *((void *)self + 20) = 0;
  *((_DWORD *)self + 44) = 0;
  *((void *)self + 23) = 0;
  *((_DWORD *)self + 50) = 0;
  *((void *)self + 26) = 0;
  *((_DWORD *)self + 56) = 0;
  *((void *)self + 29) = 0;
  *((_DWORD *)self + 62) = 0;
  *((void *)self + 32) = 0;
  *((_DWORD *)self + 68) = 0;
  *((void *)self + 35) = 0;
  *((_DWORD *)self + 74) = 0;
  *((void *)self + 38) = 0;
  *((_DWORD *)self + 80) = 0;
  *((void *)self + 41) = 0;
  *((_DWORD *)self + 86) = 0;
  *((void *)self + 44) = 0;
  *((_OWORD *)self + 23) = 0u;
  *((_OWORD *)self + 24) = 0u;
  *((_DWORD *)self + 100) = 1065353216;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *((_DWORD *)self + 110) = 1065353216;
  return self;
}

@end