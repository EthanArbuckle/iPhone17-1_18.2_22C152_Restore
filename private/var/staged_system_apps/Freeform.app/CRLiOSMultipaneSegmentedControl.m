@interface CRLiOSMultipaneSegmentedControl
- (BOOL)isBackdropHidden;
- (BOOL)isEnabledForSegmentAtIndex:(unint64_t)a3;
- (BOOL)isSegmentHuggingEnabled;
- (BOOL)needsRemoveAllConstraints;
- (BOOL)needsUpdateTitles;
- (CRLiOSMultipaneSegmentedControl)initWithCoder:(id)a3;
- (CRLiOSMultipaneSegmentedControl)initWithFrame:(CGRect)a3;
- (CRLiOSMultipaneSegmentedControl)initWithItems:(id)a3;
- (CRLiOSVibrantBackdropView)backdropView;
- (NSDictionary)defaultDisabledTitleAttributes;
- (NSDictionary)defaultNormalTitleAttributes;
- (NSDictionary)defaultSelectedTitleAttributes;
- (NSDictionary)overrideDisabledTitleAttributes;
- (NSDictionary)overrideHighlightedTitleAttributes;
- (NSDictionary)overrideNormalTitleAttributes;
- (NSDictionary)overrideSelectedTitleAttributes;
- (NSMutableArray)segments;
- (UIEdgeInsets)defaultEdgeInsets;
- (UIEdgeInsets)edgeInsetsForSegmentAtIndex:(unint64_t)a3;
- (double)p_fontSize;
- (double)widthForSegmentAtIndex:(unint64_t)a3;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)effectiveTitleAttributesForState:(unint64_t)a3;
- (id)imageForSegmentAtIndex:(unint64_t)a3;
- (id)p_attributedStringForTitle:(id)a3 forState:(unint64_t)a4;
- (id)p_newButton;
- (id)p_segmentForButton:(id)a3;
- (id)p_viewControllerForPresentingAccessibilityHUD;
- (id)titleForSegmentAtIndex:(unint64_t)a3;
- (id)titleTextAttributesForState:(unint64_t)a3;
- (int64_t)buttonHighlightedColorPreset;
- (int64_t)buttonSelectedColorPreset;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (int64_t)selectedSegmentIndex;
- (unint64_t)numberOfSegments;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)dealloc;
- (void)insertSegmentWithImage:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)insertSegmentWithTitle:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5;
- (void)p_buttonTouchCancel:(id)a3;
- (void)p_buttonTouchDown:(id)a3;
- (void)p_buttonTouchUpInside:(id)a3;
- (void)p_buttonTouchUpOutside:(id)a3;
- (void)p_insertSegment:(id)a3 atIndex:(unint64_t)a4;
- (void)p_removeAllConstraints;
- (void)p_setSelectedSegmentIndex:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5;
- (void)p_updateAllButtons;
- (void)p_updateBackgroundImagesForAllButtons;
- (void)p_updateBackgroundImagesForButton:(id)a3;
- (void)p_updateButtonForSegment:(id)a3;
- (void)p_updateConstraintsHugging;
- (void)p_updateConstraintsNormal;
- (void)removeAllSegments;
- (void)removeSegmentAtIndex:(unint64_t)a3 animated:(BOOL)a4;
- (void)setAllEdgeInsets:(UIEdgeInsets)a3;
- (void)setBackdropHidden:(BOOL)a3;
- (void)setBackdropView:(id)a3;
- (void)setButtonHighlightedColorPreset:(int64_t)a3;
- (void)setButtonSelectedColorPreset:(int64_t)a3;
- (void)setDefaultDisabledTitleAttributes:(id)a3;
- (void)setDefaultEdgeInsets:(UIEdgeInsets)a3;
- (void)setDefaultHighlightedTitleAttributes:(id)a3;
- (void)setDefaultNormalTitleAttributes:(id)a3;
- (void)setDefaultSelectedTitleAttributes:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3 forSegmentAtIndex:(unint64_t)a4;
- (void)setEnabled:(BOOL)a3 forSegmentAtIndex:(unint64_t)a4;
- (void)setImage:(id)a3 forSegmentAtIndex:(unint64_t)a4;
- (void)setNeedsRemoveAllConstraints:(BOOL)a3;
- (void)setNeedsUpdateTitles:(BOOL)a3;
- (void)setOverrideDisabledTitleAttributes:(id)a3;
- (void)setOverrideHighlightedTitleAttributes:(id)a3;
- (void)setOverrideNormalTitleAttributes:(id)a3;
- (void)setOverrideSelectedTitleAttributes:(id)a3;
- (void)setSegmentHuggingEnabled:(BOOL)a3;
- (void)setSegments:(id)a3;
- (void)setSelectedSegmentIndex:(int64_t)a3;
- (void)setTitle:(id)a3 forSegmentAtIndex:(unint64_t)a4;
- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)setWidth:(double)a3 forSegmentAtIndex:(unint64_t)a4;
- (void)tintColorDidChange;
- (void)updateConstraints;
@end

@implementation CRLiOSMultipaneSegmentedControl

- (CRLiOSMultipaneSegmentedControl)initWithItems:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CRLiOSMultipaneSegmentedControl;
  v5 = -[CRLiOSMultipaneSegmentedControl initWithFrame:](&v37, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v6;

    *((void *)v5 + 3) = 14;
    *((void *)v5 + 4) = 12;
    v8 = [[CRLiOSVibrantBackdropView alloc] initWithCorners:5 radius:0 style:7.5];
    v9 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v8;

    [*((id *)v5 + 14) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 addSubview:*((void *)v5 + 14)];
    v10 = [*((id *)v5 + 14) leadingAnchor];
    v11 = [v5 leadingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [v12 setActive:1];

    v13 = [*((id *)v5 + 14) trailingAnchor];
    v14 = [v5 trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    v16 = [*((id *)v5 + 14) topAnchor];
    v17 = [v5 topAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    v19 = [*((id *)v5 + 14) bottomAnchor];
    v20 = [v5 bottomAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    [v21 setActive:1];

    v5[9] = 1;
    *((void *)v5 + 2) = -1;
    *(_OWORD *)(v5 + 120) = xmmword_101174E20;
    *(_OWORD *)(v5 + 136) = xmmword_101174E20;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v32 = v4;
    id v22 = v4;
    id v23 = [v22 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v34;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          *((void *)v5 + 2) = 0;
          v28 = +[CRLiOSMultipaneSegmentedControlSegment segmentWithObject:edgeInsets:](CRLiOSMultipaneSegmentedControlSegment, "segmentWithObject:edgeInsets:", v27, *((double *)v5 + 15), *((double *)v5 + 16), *((double *)v5 + 17), *((double *)v5 + 18));
          if (v28) {
            [v5 p_insertSegment:v28 atIndex:-1];
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v24);
    }

    id v29 = objc_alloc_init((Class)UILargeContentViewerInteraction);
    [v5 addInteraction:v29];

    v5[9] = 0;
    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v5 selector:"p_updateBackgroundImagesForAllButtons" name:UIAccessibilityDarkerSystemColorsStatusDidChangeNotification object:0];

    id v4 = v32;
  }

  return (CRLiOSMultipaneSegmentedControl *)v5;
}

- (CRLiOSMultipaneSegmentedControl)initWithFrame:(CGRect)a3
{
  return -[CRLiOSMultipaneSegmentedControl initWithItems:](self, "initWithItems:", &__NSArray0__struct, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CRLiOSMultipaneSegmentedControl)initWithCoder:(id)a3
{
  return [(CRLiOSMultipaneSegmentedControl *)self initWithItems:&__NSArray0__struct];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSMultipaneSegmentedControl;
  [(CRLiOSMultipaneSegmentedControl *)&v4 dealloc];
}

- (unint64_t)numberOfSegments
{
  return (unint64_t)[(NSMutableArray *)self->_segments count];
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
}

- (BOOL)isBackdropHidden
{
  v2 = [(CRLiOSMultipaneSegmentedControl *)self backdropView];
  unsigned __int8 v3 = [v2 isHidden];

  return v3;
}

- (void)setBackdropHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CRLiOSMultipaneSegmentedControl *)self backdropView];
  [v4 setHidden:v3];
}

- (void)setSegmentHuggingEnabled:(BOOL)a3
{
  if (self->_segmentHuggingEnabled != a3)
  {
    self->_segmentHuggingEnabled = a3;
    self->_needsRemoveAllConstraints = 1;
    [(CRLiOSMultipaneSegmentedControl *)self setNeedsUpdateConstraints];
  }
}

- (void)insertSegmentWithTitle:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  +[CRLiOSMultipaneSegmentedControlSegment segmentWithString:edgeInsets:](CRLiOSMultipaneSegmentedControlSegment, "segmentWithString:edgeInsets:", a3, a4, a5, self->_defaultEdgeInsets.top, self->_defaultEdgeInsets.left, self->_defaultEdgeInsets.bottom, self->_defaultEdgeInsets.right);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(CRLiOSMultipaneSegmentedControl *)self p_insertSegment:v7 atIndex:a4];
}

- (void)insertSegmentWithImage:(id)a3 atIndex:(unint64_t)a4 animated:(BOOL)a5
{
  +[CRLiOSMultipaneSegmentedControlSegment segmentWithImage:edgeInsets:](CRLiOSMultipaneSegmentedControlSegment, "segmentWithImage:edgeInsets:", a3, a4, a5, self->_defaultEdgeInsets.top, self->_defaultEdgeInsets.left, self->_defaultEdgeInsets.bottom, self->_defaultEdgeInsets.right);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(CRLiOSMultipaneSegmentedControl *)self p_insertSegment:v7 atIndex:a4];
}

- (void)removeSegmentAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  if ((unint64_t)[(NSMutableArray *)self->_segments count] <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB868);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010670CC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB888);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl removeSegmentAtIndex:animated:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 259, 0, "Tried to remove out of bounds segment index: %lu", a3);
  }
  else
  {
    id v13 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a3];
    id v6 = [v13 button];
    [v6 removeFromSuperview];

    [(NSMutableArray *)self->_segments removeObjectAtIndex:a3];
    if ([(NSMutableArray *)self->_segments count])
    {
      int64_t selectedSegmentIndex = self->_selectedSegmentIndex;
      id v8 = [(NSMutableArray *)self->_segments count];
      if (selectedSegmentIndex >= (uint64_t)v8 - 1) {
        uint64_t v9 = (uint64_t)v8 - 1;
      }
      else {
        uint64_t v9 = selectedSegmentIndex;
      }
    }
    else
    {
      uint64_t v9 = -1;
    }
    [(CRLiOSMultipaneSegmentedControl *)self setSelectedSegmentIndex:v9];
    self->_needsRemoveAllConstraints = 1;
    [(CRLiOSMultipaneSegmentedControl *)self setNeedsUpdateConstraints];
  }
}

- (void)removeAllSegments
{
  BOOL v3 = (char *)[(NSMutableArray *)self->_segments count];
  if (v3)
  {
    id v4 = v3;
    do
    {
      [(CRLiOSMultipaneSegmentedControl *)self removeSegmentAtIndex:0 animated:0];
      --v4;
    }
    while (v4);
  }
}

- (void)setTitle:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_segments count] <= a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB8A8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067154();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB8C8);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl setTitle:forSegmentAtIndex:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 287, 0, "Tried to set title for out of bounds segment index: %lu", a4);
  }
  else
  {
    id v7 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a4];
    [v7 setTitle:v6];
    [v7 setAccessibilityLabel:v6];
    self->_needsUpdateTitles = 1;
    [(CRLiOSMultipaneSegmentedControl *)self p_updateButtonForSegment:v7];
    self->_needsUpdateTitles = 0;
  }
}

- (id)titleForSegmentAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_segments count] <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB8E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010671DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB908);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl titleForSegmentAtIndex:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 302, 0, "Tried to get title for out of bounds segment index: %lu", a3);

    id v6 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a3];
    id v6 = [v5 title];
  }

  return v6;
}

- (void)setImage:(id)a3 forSegmentAtIndex:(unint64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_segments count] <= a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB928);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067264();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB948);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl setImage:forSegmentAtIndex:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 311, 0, "Tried to set image for out of bounds segment index: %lu", a4);
  }
  else
  {
    id v7 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a4];
    [v7 setImage:v6];
    [(CRLiOSMultipaneSegmentedControl *)self p_updateButtonForSegment:v7];
  }
}

- (id)imageForSegmentAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_segments count] <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB968);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010672EC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB988);
    }
    id v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl imageForSegmentAtIndex:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 323, 0, "Tried to get image for out of bounds segment index: %lu", a3);

    id v6 = 0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a3];
    id v6 = [v5 image];
  }

  return v6;
}

- (void)setWidth:(double)a3 forSegmentAtIndex:(unint64_t)a4
{
  if ((unint64_t)[(NSMutableArray *)self->_segments count] <= a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB9A8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067374();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB9C8);
    }
    id v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl setWidth:forSegmentAtIndex:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 332, 0, "Tried to set width of bounds segment index: %lu", a4);
  }
  else
  {
    id v7 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a4];
    [v7 setWidth:a3];

    [(CRLiOSMultipaneSegmentedControl *)self setNeedsUpdateConstraints];
  }
}

- (double)widthForSegmentAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_segments count] <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB9E8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010673FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBA08);
    }
    uint64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl widthForSegmentAtIndex:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 343, 0, "Tried to get width for out of bounds segment index: %lu", a3);

    return 0.0;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a3];
    [v5 width];
    double v7 = v6;

    return v7;
  }
}

- (void)setEdgeInsets:(UIEdgeInsets)a3 forSegmentAtIndex:(unint64_t)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if ((unint64_t)[(NSMutableArray *)self->_segments count] <= a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBA28);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067484();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBA48);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl setEdgeInsets:forSegmentAtIndex:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 352, 0, "Tried to set edge insets for out of bounds segment index: %lu", a4);
  }
  else
  {
    id v13 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a4];
    [v13 setEdgeInsets:top, left, bottom, right];
    [(CRLiOSMultipaneSegmentedControl *)self p_updateButtonForSegment:v13];
  }
}

- (UIEdgeInsets)edgeInsetsForSegmentAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_segments count] <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBA68);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106750C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBA88);
    }
    v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v14);
    }
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl edgeInsetsForSegmentAtIndex:]");
    v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 364, 0, "Tried to get edge insets for out of bounds segment index: %lu", a3);

    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }
  else
  {
    v5 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a3];
    [v5 edgeInsets];
    CGFloat top = v6;
    CGFloat left = v8;
    CGFloat bottom = v10;
    CGFloat right = v12;
  }
  double v17 = top;
  double v18 = left;
  double v19 = bottom;
  double v20 = right;
  result.CGFloat right = v20;
  result.CGFloat bottom = v19;
  result.CGFloat left = v18;
  result.CGFloat top = v17;
  return result;
}

- (void)setAllEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if ([(NSMutableArray *)self->_segments count])
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:v8];
      [v9 setEdgeInsets:top, left, bottom, right];
      [(CRLiOSMultipaneSegmentedControl *)self p_updateButtonForSegment:v9];

      ++v8;
    }
    while (v8 < (unint64_t)[(NSMutableArray *)self->_segments count]);
  }
  self->_defaultEdgeInsets.double top = top;
  self->_defaultEdgeInsets.double left = left;
  self->_defaultEdgeInsets.double bottom = bottom;
  self->_defaultEdgeInsets.double right = right;
}

- (void)setEnabled:(BOOL)a3 forSegmentAtIndex:(unint64_t)a4
{
  BOOL v5 = a3;
  if ((unint64_t)[(NSMutableArray *)self->_segments count] <= a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBAA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101067594();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBAC8);
    }
    double v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    unint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl setEnabled:forSegmentAtIndex:]");
    uint64_t v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 384, 0, "Tried to set enabled state for out of bounds segment index: %lu", a4);
  }
  else
  {
    id v10 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a4];
    [v10 setEnabled:v5];
    [(CRLiOSMultipaneSegmentedControl *)self p_updateButtonForSegment:v10];
  }
}

- (BOOL)isEnabledForSegmentAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_segments count] <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBAE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106761C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CBB08);
    }
    unint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    uint64_t v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl isEnabledForSegmentAtIndex:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 396, 0, "Tried to get enabled state for out of bounds segment index: %lu", a3);

    return 0;
  }
  else
  {
    BOOL v5 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a3];
    unsigned __int8 v6 = [v5 isEnabled];

    return v6;
  }
}

- (void)setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      [(CRLiOSMultipaneSegmentedControl *)self setOverrideNormalTitleAttributes:v6];
      break;
    case 1uLL:
      [(CRLiOSMultipaneSegmentedControl *)self setOverrideHighlightedTitleAttributes:v6];
      break;
    case 2uLL:
      [(CRLiOSMultipaneSegmentedControl *)self setOverrideDisabledTitleAttributes:v6];
      break;
    case 4uLL:
      [(CRLiOSMultipaneSegmentedControl *)self setOverrideSelectedTitleAttributes:v6];
      break;
    default:
      break;
  }
  self->_needsUpdateTitles = 1;
  [(CRLiOSMultipaneSegmentedControl *)self p_updateAllButtons];
}

- (id)titleTextAttributesForState:(unint64_t)a3
{
  id v4 = 0;
  switch(a3)
  {
    case 0uLL:
      id v4 = [(CRLiOSMultipaneSegmentedControl *)self overrideNormalTitleAttributes];
      break;
    case 1uLL:
      id v4 = [(CRLiOSMultipaneSegmentedControl *)self overrideHighlightedTitleAttributes];
      break;
    case 2uLL:
      id v4 = [(CRLiOSMultipaneSegmentedControl *)self overrideDisabledTitleAttributes];
      break;
    case 4uLL:
      id v4 = [(CRLiOSMultipaneSegmentedControl *)self overrideSelectedTitleAttributes];
      break;
    default:
      break;
  }

  return v4;
}

- (void)setButtonHighlightedColorPreset:(int64_t)a3
{
  if (self->_buttonHighlightedColorPreset != a3)
  {
    self->_buttonHighlightedColorPreset = a3;
    [(CRLiOSMultipaneSegmentedControl *)self p_updateBackgroundImagesForAllButtons];
  }
}

- (void)setButtonSelectedColorPreset:(int64_t)a3
{
  if (self->_buttonSelectedColorPreset != a3)
  {
    self->_buttonSelectedColorPreset = a3;
    [(CRLiOSMultipaneSegmentedControl *)self p_updateBackgroundImagesForAllButtons];
  }
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSMultipaneSegmentedControl;
  [(CRLiOSMultipaneSegmentedControl *)&v3 updateConstraints];
  if (self->_needsRemoveAllConstraints)
  {
    [(CRLiOSMultipaneSegmentedControl *)self p_removeAllConstraints];
    self->_needsRemoveAllConstraints = 0;
  }
  if (self->_segmentHuggingEnabled) {
    [(CRLiOSMultipaneSegmentedControl *)self p_updateConstraintsHugging];
  }
  else {
    [(CRLiOSMultipaneSegmentedControl *)self p_updateConstraintsNormal];
  }
}

- (void)p_removeAllConstraints
{
  objc_super v3 = (char *)[(NSMutableArray *)self->_segments count];
  if (v3)
  {
    id v4 = v3;
    BOOL v5 = 0;
    id v6 = 0;
    do
    {
      double v7 = v6;
      id v15 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:v5];

      unint64_t v8 = [v15 button];
      LODWORD(v9) = 1132068864;
      [v8 setContentHuggingPriority:0 forAxis:v9];

      id v10 = [v15 leadingConstraint];
      [v10 setActive:0];

      [v15 setLeadingConstraint:0];
      v11 = [v15 trailingConstraint];
      [v11 setActive:0];

      [v15 setTrailingConstraint:0];
      double v12 = [v15 widthConstraint];
      [v12 setActive:0];

      [v15 setWidthConstraint:0];
      id v13 = [v15 equalWidthConstraint];
      [v13 setActive:0];

      [v15 setEqualWidthConstraint:0];
      [v15 setPreviousTrailingAnchor:0];
      [v15 setDistanceToPreviousTrailingAnchor:0];
      v14 = [v15 distanceBetweenPreviousAndNextSegmentConstraint];
      [v14 setActive:0];

      [v15 setDistanceBetweenPreviousAndNextSegmentConstraint:0];
      id v6 = v15;
      ++v5;
    }
    while (v4 != v5);
  }
}

- (void)p_updateConstraintsNormal
{
  objc_super v3 = (char *)[(NSMutableArray *)self->_segments count];
  if (v3)
  {
    id v67 = 0;
    id v4 = 0;
    BOOL v5 = 0;
    v65 = v3 - 1;
    v66 = v3;
    while (1)
    {
      id v6 = -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", v5, v65);

      double v7 = [v6 button];
      [v6 width];
      double v9 = v8;
      uint64_t v10 = [v6 leadingConstraint];
      v11 = (void *)v10;
      if (v5)
      {
        if (v10)
        {
          double v12 = [v6 leadingConstraint];
          id v13 = [v12 secondItem];
          v14 = [v67 button];
          id v15 = [v14 trailingAnchor];

          if (v13 != v15)
          {
            v16 = [v6 leadingConstraint];
            [v16 setActive:0];

            [v6 setLeadingConstraint:0];
          }
        }
        double v17 = [v6 leadingConstraint];

        if (!v17)
        {
          double v18 = [v7 leadingAnchor];
          double v19 = [v67 button];
          double v20 = [v19 trailingAnchor];
          v21 = [v18 constraintEqualToAnchor:v20];
          [v6 setLeadingConstraint:v21];

LABEL_14:
          uint64_t v27 = [v6 leadingConstraint];
          LODWORD(v28) = 1148846080;
          [v27 setPriority:v28];

          id v29 = [v6 leadingConstraint];
          [v29 setActive:1];
        }
      }
      else
      {
        if (v10)
        {
          id v22 = [v6 leadingConstraint];
          id v23 = [v22 secondItem];
          id v24 = [(CRLiOSMultipaneSegmentedControl *)self leadingAnchor];

          if (v23 != v24)
          {
            uint64_t v25 = [v6 leadingConstraint];
            [v25 setActive:0];

            [v6 setLeadingConstraint:0];
          }
        }
        v26 = [v6 leadingConstraint];

        if (!v26)
        {
          double v18 = [v7 leadingAnchor];
          double v19 = [(CRLiOSMultipaneSegmentedControl *)self leadingAnchor];
          double v20 = [v18 constraintEqualToAnchor:v19];
          [v6 setLeadingConstraint:v20];
          goto LABEL_14;
        }
      }
      v30 = [v6 trailingConstraint];

      if (v65 == v5)
      {
        if (!v30)
        {
          v31 = [v7 trailingAnchor];
          id v32 = [(CRLiOSMultipaneSegmentedControl *)self trailingAnchor];
          long long v33 = [v31 constraintEqualToAnchor:v32];
          [v6 setTrailingConstraint:v33];

          long long v34 = [v6 trailingConstraint];
          LODWORD(v35) = 1148846080;
          [v34 setPriority:v35];

          long long v36 = [v6 trailingConstraint];
          [v36 setActive:1];
        }
      }
      else if (v30)
      {
        objc_super v37 = [v6 trailingConstraint];
        [v37 setActive:0];

        [v6 setTrailingConstraint:0];
      }
      v38 = [v6 equalWidthConstraint];

      v39 = [v6 widthConstraint];

      if (v9 == 0.0)
      {
        if (v39)
        {
          v40 = [v6 widthConstraint];
          [v40 setActive:0];

          [v6 setWidthConstraint:0];
        }
        if (v38)
        {
          v41 = [v6 equalWidthConstraint];
          v42 = [v41 firstItem];
          v43 = [v4 button];
          v44 = [v43 widthAnchor];
          BOOL v45 = v42 == v44;

          if (v4 && v42 == v44
            || ([v6 equalWidthConstraint],
                v46 = objc_claimAutoreleasedReturnValue(),
                [v46 setActive:0],
                v46,
                [v6 setEqualWidthConstraint:0],
                !v4))
          {
LABEL_36:
            v52 = v67;
            id v67 = v4;
            id v4 = v6;
            goto LABEL_37;
          }
        }
        else
        {
          BOOL v45 = 0;
          if (!v4) {
            goto LABEL_36;
          }
        }
        if (!v45)
        {
          v53 = [v4 button];
          v54 = [v53 widthAnchor];
          v55 = [v7 widthAnchor];
          v56 = [v54 constraintEqualToAnchor:v55];
          [v6 setEqualWidthConstraint:v56];

          v57 = [v6 equalWidthConstraint];
          LODWORD(v58) = 1148846080;
          [v57 setPriority:v58];

          v59 = [v6 equalWidthConstraint];
          [v59 setActive:1];
        }
        goto LABEL_36;
      }
      if (v38)
      {
        v47 = [v6 equalWidthConstraint];
        [v47 setActive:0];

        [v6 setEqualWidthConstraint:0];
      }
      double v48 = fabs(v9);
      if (!v39)
      {
        v61 = [v7 widthAnchor];
        v62 = [v61 constraintEqualToConstant:v48];
        [v6 setWidthConstraint:v62];

        v63 = [v6 widthConstraint];
        LODWORD(v64) = 1148829696;
        [v63 setPriority:v64];

        v52 = [v6 widthConstraint];
        [v52 setActive:1];
        goto LABEL_37;
      }
      v49 = [v6 widthConstraint];
      [v49 constant];
      double v51 = v50;

      if (v51 != v48)
      {
        v52 = [v6 widthConstraint];
        [v52 setConstant:v48];
LABEL_37:
      }
      v60 = v67;
      id v67 = v6;

      if (v66 == ++v5)
      {

        return;
      }
    }
  }
}

- (void)p_updateConstraintsHugging
{
  v2 = self;
  objc_super v3 = (char *)[(NSMutableArray *)self->_segments count];
  if (v3)
  {
    id v4 = 0;
    BOOL v5 = 0;
    id v6 = 0;
    v70 = v3 - 1;
    v69 = v2;
    v68 = v3;
    while (1)
    {
      double v7 = [(NSMutableArray *)v2->_segments objectAtIndexedSubscript:v5];

      double v8 = [v7 button];
      if (v70 == v5)
      {
        double v9 = 0;
      }
      else
      {
        double v9 = [(NSMutableArray *)v2->_segments objectAtIndexedSubscript:v5 + 1];
      }

      LODWORD(v10) = 1148846080;
      [v8 setContentHuggingPriority:0 forAxis:v10];
      LODWORD(v11) = 1148829696;
      [v8 setContentCompressionResistancePriority:0 forAxis:v11];
      double v12 = [v8 titleLabel];
      [v12 setAdjustsFontSizeToFitWidth:1];

      uint64_t v13 = [v7 leadingConstraint];
      v14 = (void *)v13;
      if (v5)
      {
        if (v13)
        {
          id v15 = [v7 leadingConstraint];
          v16 = [v15 secondItem];
          double v17 = [v4 button];
          double v18 = [v17 trailingAnchor];

          v2 = v69;
          if (v16 != v18)
          {
            double v19 = [v7 leadingConstraint];
            [v19 setActive:0];

            [v7 setLeadingConstraint:0];
          }
        }
        double v20 = [v7 leadingConstraint];

        if (!v20)
        {
          v21 = [v8 leadingAnchor];
          id v22 = [v4 button];
          id v23 = [v22 trailingAnchor];
          id v24 = [v21 constraintGreaterThanOrEqualToAnchor:v23];
          [v7 setLeadingConstraint:v24];

LABEL_17:
          v31 = [v7 leadingConstraint];
          LODWORD(v32) = 1148846080;
          [v31 setPriority:v32];

          long long v33 = [v7 leadingConstraint];
          [v33 setActive:1];

          v2 = v69;
        }
      }
      else
      {
        if (v13)
        {
          uint64_t v25 = [v7 leadingConstraint];
          v26 = [v25 secondItem];
          uint64_t v27 = [(CRLiOSMultipaneSegmentedControl *)v69 leadingAnchor];

          BOOL v28 = v26 == v27;
          v2 = v69;
          if (!v28)
          {
            id v29 = [v7 leadingConstraint];
            [v29 setActive:0];

            [v7 setLeadingConstraint:0];
          }
        }
        v30 = [v7 leadingConstraint];

        if (!v30)
        {
          v21 = [v8 leadingAnchor];
          id v22 = [(CRLiOSMultipaneSegmentedControl *)v2 leadingAnchor];
          id v23 = [v21 constraintEqualToAnchor:v22];
          [v7 setLeadingConstraint:v23];
          goto LABEL_17;
        }
      }
      long long v34 = [v7 trailingConstraint];

      if (v70 == v5)
      {
        if (!v34)
        {
          double v35 = [v8 trailingAnchor];
          long long v36 = [(CRLiOSMultipaneSegmentedControl *)v2 trailingAnchor];
          objc_super v37 = [v35 constraintEqualToAnchor:v36];
          [v7 setTrailingConstraint:v37];

          v38 = [v7 trailingConstraint];
          LODWORD(v39) = 1148846080;
          [v38 setPriority:v39];

          v40 = [v7 trailingConstraint];
          [v40 setActive:1];
        }
      }
      else if (v34)
      {
        v41 = [v7 trailingConstraint];
        [v41 setActive:0];

        [v7 setTrailingConstraint:0];
      }
      if (v4)
      {
        uint64_t v42 = [v7 previousTrailingAnchor];
        if (!v42) {
          goto LABEL_27;
        }
        v43 = (void *)v42;
        v44 = [v4 button];
        BOOL v45 = [v44 trailingAnchor];

        if (v43 != v45)
        {
          [v7 setPreviousTrailingAnchor:0];
          [v7 setDistanceToPreviousTrailingAnchor:0];

LABEL_27:
          v46 = [v4 button];
          v43 = [v46 trailingAnchor];

          [v7 setPreviousTrailingAnchor:v43];
          v47 = [v8 leadingAnchor];
          double v48 = [v43 anchorWithOffsetToAnchor:v47];
          [v7 setDistanceToPreviousTrailingAnchor:v48];
        }
        if (!v9) {
          goto LABEL_40;
        }
        goto LABEL_29;
      }
      [v7 setPreviousTrailingAnchor:0];
      [v7 setDistanceToPreviousTrailingAnchor:0];
      v65 = [v7 distanceBetweenPreviousAndNextSegmentConstraint];
      [v65 setActive:0];

      [v7 setDistanceBetweenPreviousAndNextSegmentConstraint:0];
      if (!v9)
      {
LABEL_40:
        [v7 setPreviousTrailingAnchor:0];
        [v7 setDistanceToPreviousTrailingAnchor:0];
        v66 = [v7 distanceBetweenPreviousAndNextSegmentConstraint];
        [v66 setActive:0];

        [v7 setDistanceBetweenPreviousAndNextSegmentConstraint:0];
        goto LABEL_41;
      }
LABEL_29:
      uint64_t v49 = [v9 previousTrailingAnchor];
      if (v49)
      {
        double v50 = (void *)v49;
        double v51 = [v8 trailingAnchor];

        if (v50 == v51) {
          goto LABEL_33;
        }
        [v9 setPreviousTrailingAnchor:0];
        [v9 setDistanceToPreviousTrailingAnchor:0];
      }
      double v50 = [v8 trailingAnchor];
      [v9 setPreviousTrailingAnchor:v50];
      v52 = [v9 button];
      v53 = [v52 leadingAnchor];
      v54 = [v50 anchorWithOffsetToAnchor:v53];
      [v9 setDistanceToPreviousTrailingAnchor:v54];

LABEL_33:
      if (v4)
      {
        v55 = [v7 distanceBetweenPreviousAndNextSegmentConstraint];
        if (!v55) {
          goto LABEL_38;
        }
        v56 = v55;
        v57 = [v55 firstItem];
        uint64_t v58 = [v7 distanceToPreviousTrailingAnchor];
        if (v57 != (void *)v58)
        {
          v59 = (void *)v58;
          v60 = [v56 secondItem];
          v61 = [v9 distanceToPreviousTrailingAnchor];

          if (v60 == v61)
          {
            v2 = v69;
          }
          else
          {
            [v56 setActive:0];

            v2 = v69;
LABEL_38:
            v62 = [v7 distanceToPreviousTrailingAnchor];
            v63 = [v9 distanceToPreviousTrailingAnchor];
            double v64 = [v62 constraintEqualToAnchor:v63];
            [v7 setDistanceBetweenPreviousAndNextSegmentConstraint:v64];

            v57 = [v7 distanceBetweenPreviousAndNextSegmentConstraint];
            [v57 setActive:1];
            v56 = 0;
LABEL_43:
          }
          goto LABEL_45;
        }

        v2 = v69;
        goto LABEL_43;
      }
LABEL_41:
      id v67 = [v7 distanceBetweenPreviousAndNextSegmentConstraint];
      [v67 setActive:0];

      [v7 setDistanceBetweenPreviousAndNextSegmentConstraint:0];
LABEL_45:
      id v71 = v7;

      ++v5;
      id v4 = v71;
      id v6 = v9;
      if (v68 == v5)
      {

        return;
      }
    }
  }
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSMultipaneSegmentedControl;
  [(CRLiOSMultipaneSegmentedControl *)&v7 tintColorDidChange];
  defaultNormalTitleAttributes = self->_defaultNormalTitleAttributes;
  self->_defaultNormalTitleAttributes = 0;

  defaultHighlightedTitleAttributes = self->_defaultHighlightedTitleAttributes;
  self->_defaultHighlightedTitleAttributes = 0;

  defaultSelectedTitleAttributes = self->_defaultSelectedTitleAttributes;
  self->_defaultSelectedTitleAttributes = 0;

  defaultDisabledTitleAttributes = self->_defaultDisabledTitleAttributes;
  self->_defaultDisabledTitleAttributes = 0;

  self->_needsUpdateTitles = 1;
  [(CRLiOSMultipaneSegmentedControl *)self p_updateAllButtons];
}

- (double)p_fontSize
{
  v2 = +[CRLLocale currentLocale];
  objc_super v3 = [v2 locale];
  id v4 = [v3 languageCode];

  if ([v4 isEqualToString:@"en"]) {
    double v5 = 14.0;
  }
  else {
    double v5 = 13.0;
  }

  return v5;
}

- (NSDictionary)defaultNormalTitleAttributes
{
  defaultNormalTitleAttributes = self->_defaultNormalTitleAttributes;
  if (!defaultNormalTitleAttributes)
  {
    v9[0] = NSForegroundColorAttributeName;
    id v4 = [(CRLiOSMultipaneSegmentedControl *)self tintColor];
    v10[0] = v4;
    v9[1] = NSFontAttributeName;
    [(CRLiOSMultipaneSegmentedControl *)self p_fontSize];
    double v5 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    v10[1] = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    objc_super v7 = self->_defaultNormalTitleAttributes;
    self->_defaultNormalTitleAttributes = v6;

    defaultNormalTitleAttributes = self->_defaultNormalTitleAttributes;
  }

  return defaultNormalTitleAttributes;
}

- (NSDictionary)defaultSelectedTitleAttributes
{
  defaultSelectedTitleAttributes = self->_defaultSelectedTitleAttributes;
  if (!defaultSelectedTitleAttributes)
  {
    v9[0] = NSForegroundColorAttributeName;
    id v4 = +[UIColor whiteColor];
    v10[0] = v4;
    v9[1] = NSFontAttributeName;
    [(CRLiOSMultipaneSegmentedControl *)self p_fontSize];
    double v5 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
    v10[1] = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    objc_super v7 = self->_defaultSelectedTitleAttributes;
    self->_defaultSelectedTitleAttributes = v6;

    defaultSelectedTitleAttributes = self->_defaultSelectedTitleAttributes;
  }

  return defaultSelectedTitleAttributes;
}

- (NSDictionary)defaultDisabledTitleAttributes
{
  defaultDisabledTitleAttributes = self->_defaultDisabledTitleAttributes;
  if (!defaultDisabledTitleAttributes)
  {
    id v4 = [(CRLiOSMultipaneSegmentedControl *)self tintColor];
    double v10 = 0.0;
    double v11 = 0.0;
    [v4 getWhite:&v11 alpha:&v10];
    double v5 = +[UIColor colorWithWhite:v11 alpha:v10 * 0.35];

    v13[0] = v5;
    v12[0] = NSForegroundColorAttributeName;
    v12[1] = NSFontAttributeName;
    id v6 = +[UIFont systemFontOfSize:14.0 weight:UIFontWeightMedium];
    v13[1] = v6;
    objc_super v7 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    double v8 = self->_defaultDisabledTitleAttributes;
    self->_defaultDisabledTitleAttributes = v7;

    defaultDisabledTitleAttributes = self->_defaultDisabledTitleAttributes;
  }

  return defaultDisabledTitleAttributes;
}

- (id)effectiveTitleAttributesForState:(unint64_t)a3
{
  double v5 = -[CRLiOSMultipaneSegmentedControl titleTextAttributesForState:](self, "titleTextAttributesForState:");
  if (!v5)
  {
    switch(a3)
    {
      case 0uLL:
        double v5 = [(CRLiOSMultipaneSegmentedControl *)self defaultNormalTitleAttributes];
        break;
      case 1uLL:
        double v5 = [(CRLiOSMultipaneSegmentedControl *)self defaultHighlightedTitleAttributes];
        break;
      case 2uLL:
        double v5 = [(CRLiOSMultipaneSegmentedControl *)self defaultDisabledTitleAttributes];
        break;
      case 4uLL:
        double v5 = [(CRLiOSMultipaneSegmentedControl *)self defaultSelectedTitleAttributes];
        break;
      default:
        break;
    }
  }

  return v5;
}

- (id)p_segmentForButton:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v5 = [(CRLiOSMultipaneSegmentedControl *)self segments];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      double v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      id v11 = [v10 button];

      if (v11 == v4) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v10;

    if (v12) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_9:
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CBB28);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010676A4();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014CBB48);
  }
  uint64_t v13 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v13);
  }
  v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl p_segmentForButton:]");
  id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 876, 0, "invalid nil value for '%{public}s'", "segment");

  id v12 = 0;
LABEL_20:

  return v12;
}

- (void)p_insertSegment:(id)a3 atIndex:(unint64_t)a4
{
  segments = self->_segments;
  id v7 = a3;
  id v8 = [(NSMutableArray *)segments count];
  if ((unint64_t)v8 >= a4) {
    unint64_t v9 = a4;
  }
  else {
    unint64_t v9 = (unint64_t)v8;
  }
  [(NSMutableArray *)self->_segments insertObject:v7 atIndex:v9];
  self->_needsUpdateTitles = 1;
  [(CRLiOSMultipaneSegmentedControl *)self p_updateButtonForSegment:v7];

  self->_needsUpdateTitles = 0;
  self->_needsRemoveAllConstraints = 1;

  [(CRLiOSMultipaneSegmentedControl *)self setNeedsUpdateConstraints];
}

- (void)p_setSelectedSegmentIndex:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5
{
  if (self->_selectedSegmentIndex != a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    id v9 = [(NSMutableArray *)self->_segments count];
    if ((uint64_t)v9 <= a3)
    {
      unsigned int v15 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CBB68);
      }
      double v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        unsigned int v18 = v15;
        __int16 v19 = 2082;
        long long v20 = "-[CRLiOSMultipaneSegmentedControl p_setSelectedSegmentIndex:animated:notify:]";
        __int16 v21 = 2082;
        id v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m";
        __int16 v23 = 1024;
        int v24 = 901;
        __int16 v25 = 2048;
        int64_t v26 = a3;
        __int16 v27 = 2048;
        id v28 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Selecting out of bounds segment in segmented control: %li (count: %li)", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CBB88);
      }
      id v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v11);
      }
      id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSMultipaneSegmentedControl p_setSelectedSegmentIndex:animated:notify:]");
      uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Controls/CRLiOSMultipaneSegmentedControl.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 901, 0, "Selecting out of bounds segment in segmented control: %li (count: %li)", a3, v9);
    }
    int64_t v14 = (int64_t)v9 - 1;
    if ((uint64_t)v9 - 1 >= a3) {
      int64_t v14 = a3;
    }
    self->_int64_t selectedSegmentIndex = v14;
    if (v6)
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100016780;
      v16[3] = &unk_1014CBBB0;
      v16[4] = self;
      +[UIView animateWithDuration:0 delay:v16 usingSpringWithDamping:0 initialSpringVelocity:0.2 options:0.0 animations:0.95 completion:0.0];
      if (!v5) {
        return;
      }
    }
    else
    {
      [(CRLiOSMultipaneSegmentedControl *)self p_updateAllButtons];
      [(CRLiOSMultipaneSegmentedControl *)self setNeedsUpdateConstraints];
      if (!v5) {
        return;
      }
    }
    [(CRLiOSMultipaneSegmentedControl *)self sendActionsForControlEvents:4096];
  }
}

- (void)p_updateAllButtons
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = self->_segments;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[CRLiOSMultipaneSegmentedControl p_updateButtonForSegment:](self, "p_updateButtonForSegment:", *(void *)(*((void *)&v8 + 1) + 8 * (void)v7), (void)v8);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  self->_needsUpdateTitles = 0;
}

- (void)p_updateButtonForSegment:(id)a3
{
  id v54 = a3;
  id v4 = [v54 button];
  BOOL needsUpdateTitles = self->_needsUpdateTitles;
  id v6 = [(NSMutableArray *)self->_segments indexOfObject:v54];
  BOOL v7 = needsUpdateTitles;
  if (!v4)
  {
    id v4 = [(CRLiOSMultipaneSegmentedControl *)self p_newButton];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    long long v8 = [(CRLiOSMultipaneSegmentedControl *)self backdropView];
    [(CRLiOSMultipaneSegmentedControl *)self insertSubview:v4 aboveSubview:v8];

    long long v9 = [v4 titleLabel];
    [v9 setMinimumScaleFactor:0.5];

    [(CRLiOSMultipaneSegmentedControl *)self edgeInsetsForSegmentAtIndex:v6];
    [v4 setContentEdgeInsets:];
    [(CRLiOSMultipaneSegmentedControl *)self edgeInsetsForSegmentAtIndex:v6];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    uint64_t v18 = objc_opt_class();
    __int16 v19 = sub_1002469D0(v18, v4);
    [v19 setInsets:v11, v13, v15, v17];

    long long v20 = [v4 topAnchor];
    __int16 v21 = [(CRLiOSMultipaneSegmentedControl *)self topAnchor];
    id v22 = [v20 constraintEqualToAnchor:v21];
    BOOL v7 = 1;
    [v22 setActive:1];

    __int16 v23 = [v4 bottomAnchor];
    int v24 = [(CRLiOSMultipaneSegmentedControl *)self bottomAnchor];
    __int16 v25 = [v23 constraintEqualToAnchor:v24];
    [v25 setActive:1];

    [v4 addTarget:self action:"p_buttonTouchDown:" forControlEvents:1];
    [v4 addTarget:self action:"p_buttonTouchUpInside:" forControlEvents:64];
    [v4 addTarget:self action:"p_buttonTouchUpOutside:" forControlEvents:128];
    [v4 addTarget:self action:"p_buttonTouchCancel:" forControlEvents:256];
    [v4 setShowsLargeContentViewer:1];
    [(CRLiOSMultipaneSegmentedControl *)self p_updateBackgroundImagesForButton:v4];
    [v54 setButton:v4];
  }
  [v4 setSelected:v6 == self->_selectedSegmentIndex];
  [v4 setEnabled:[v54 isEnabled]];
  [v54 edgeInsets];
  [v4 setContentEdgeInsets:];
  [v54 edgeInsets];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  uint64_t v34 = objc_opt_class();
  double v35 = sub_1002469D0(v34, v4);
  [v35 setInsets:v27, v29, v31, v33];

  if ([v54 type])
  {
    [v4 setAttributedTitle:0 forState:0];
    [v4 setAttributedTitle:0 forState:1];
    [v4 setAttributedTitle:0 forState:4];
    [v4 setAttributedTitle:0 forState:2];
    long long v36 = [v54 image];
    [v4 setImage:v36 forState:0];

    [v4 setAdjustsImageWhenHighlighted:1];
    if ([v4 isEnabled])
    {
      if ([v4 isSelected])
      {
        objc_super v37 = [(CRLiOSMultipaneSegmentedControl *)self effectiveTitleAttributesForState:4];
        v38 = [v37 objectForKeyedSubscript:NSForegroundColorAttributeName];
        [v4 setTintColor:v38];

        double v39 = v4;
        uint64_t v40 = 0;
      }
      else
      {
        v46 = [(CRLiOSMultipaneSegmentedControl *)self effectiveTitleAttributesForState:0];
        v47 = [v46 objectForKeyedSubscript:NSForegroundColorAttributeName];
        [v4 setTintColor:v47];

        double v39 = v4;
        uint64_t v40 = 1;
      }
      [v39 setAdjustsImageWhenHighlighted:v40];
    }
    else
    {
      v44 = [(CRLiOSMultipaneSegmentedControl *)self effectiveTitleAttributesForState:2];
      BOOL v45 = [v44 objectForKeyedSubscript:NSForegroundColorAttributeName];
      [v4 setTintColor:v45];
    }
  }
  else
  {
    [v4 setImage:0 forState:0];
    v41 = v54;
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v42 = [v54 title];
    if (v42)
    {
      v43 = [v54 title];
    }
    else
    {
      v43 = &stru_101538650;
    }

    double v48 = [v4 configuration];
    [v48 setTitle:v43];

    uint64_t v49 = [(CRLiOSMultipaneSegmentedControl *)self p_attributedStringForTitle:v43 forState:0];
    double v50 = [(CRLiOSMultipaneSegmentedControl *)self p_attributedStringForTitle:v43 forState:1];
    double v51 = [(CRLiOSMultipaneSegmentedControl *)self p_attributedStringForTitle:v43 forState:4];
    v52 = [(CRLiOSMultipaneSegmentedControl *)self p_attributedStringForTitle:v43 forState:2];
    [v4 setAttributedTitle:v49 forState:0];
    [v4 setAttributedTitle:v50 forState:1];
    [v4 setAttributedTitle:v51 forState:4];
    [v4 setAttributedTitle:v51 forState:5];
    [v4 setAttributedTitle:v52 forState:2];
  }
  v41 = v54;
LABEL_16:
  v53 = [v41 accessibilityLabel];
  [v4 setAccessibilityLabel:v53];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
}

- (void)p_updateBackgroundImagesForButton:(id)a3
{
  id v4 = a3;
  id v5 = +[CRLiOSVisualEffectHelper sharedHelper];
  int64_t buttonHighlightedColorPreset = self->_buttonHighlightedColorPreset;
  BOOL v7 = [(CRLiOSMultipaneSegmentedControl *)self traitCollection];
  id v12 = [v5 resizableCornerImageWithRadius:5 corners:buttonHighlightedColorPreset colorPreset:v7 forTraitCollection:7.5];

  long long v8 = +[CRLiOSVisualEffectHelper sharedHelper];
  int64_t buttonSelectedColorPreset = self->_buttonSelectedColorPreset;
  double v10 = [(CRLiOSMultipaneSegmentedControl *)self traitCollection];
  double v11 = [v8 resizableCornerImageWithRadius:5 corners:buttonSelectedColorPreset colorPreset:v10 forTraitCollection:7.5];

  [v4 setBackgroundImage:v12 forState:1];
  [v4 setBackgroundImage:v11 forState:4];
  [v4 setBackgroundImage:v11 forState:5];
}

- (void)p_updateBackgroundImagesForAllButtons
{
  objc_super v3 = (char *)[(NSMutableArray *)self->_segments count];
  if (v3)
  {
    id v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      id v6 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:i];
      BOOL v7 = [v6 button];
      [(CRLiOSMultipaneSegmentedControl *)self p_updateBackgroundImagesForButton:v7];
    }
  }
}

- (void)p_buttonTouchDown:(id)a3
{
  id v4 = a3;
  [(CRLiOSMultipaneSegmentedControl *)self sendActionsForControlEvents:1];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = +[CRLiOSVisualEffectHelper sharedHelper];
    id v7 = v4;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v5 applyTouchDownAnimationToViews:v6];
  }
}

- (void)p_buttonTouchUpInside:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = +[CRLiOSVisualEffectHelper sharedHelper];
    id v12 = v4;
    id v6 = +[NSArray arrayWithObjects:&v12 count:1];
    [v5 applyTouchUpAnimationToViews:v6];
  }
  id v7 = [(NSMutableArray *)self->_segments count];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      double v10 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:v9];
      id v11 = [v10 button];

      if (v11 == v4) {
        break;
      }
      if (v8 == (id)++v9) {
        goto LABEL_9;
      }
    }
    [(CRLiOSMultipaneSegmentedControl *)self p_setSelectedSegmentIndex:v9 animated:1 notify:1];
  }
LABEL_9:
  [(CRLiOSMultipaneSegmentedControl *)self sendActionsForControlEvents:64];
}

- (void)p_buttonTouchUpOutside:(id)a3
{
  id v4 = a3;
  [(CRLiOSMultipaneSegmentedControl *)self sendActionsForControlEvents:128];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = +[CRLiOSVisualEffectHelper sharedHelper];
    id v7 = v4;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v5 applyTouchUpAnimationToViews:v6];
  }
}

- (void)p_buttonTouchCancel:(id)a3
{
  id v4 = a3;
  [(CRLiOSMultipaneSegmentedControl *)self sendActionsForControlEvents:256];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = +[CRLiOSVisualEffectHelper sharedHelper];
    id v7 = v4;
    id v6 = +[NSArray arrayWithObjects:&v7 count:1];
    [v5 applyTouchUpAnimationToViews:v6];
  }
}

- (id)p_attributedStringForTitle:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)NSAttributedString);
  id v8 = [(CRLiOSMultipaneSegmentedControl *)self effectiveTitleAttributesForState:a4];
  id v9 = [v7 initWithString:v6 attributes:v8];

  return v9;
}

- (id)p_newButton
{
  v2 = -[CRLiOSPageTitleButton initWithTitle:insets:]([_TtC8Freeform21CRLiOSPageTitleButton alloc], "initWithTitle:insets:", &stru_101538650, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  return v2;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[(CRLiOSMultipaneSegmentedControl *)self numberOfSegments] < 1)
  {
LABEL_5:
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v5 = 0;
    while (1)
    {
      id v6 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:v5];
      id v7 = [v6 button];

      if (v7 == v4) {
        break;
      }
      if (++v5 >= (uint64_t)[(CRLiOSMultipaneSegmentedControl *)self numberOfSegments]) {
        goto LABEL_5;
      }
    }
  }

  return v5;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  if (a3 < 0 || (uint64_t)[(CRLiOSMultipaneSegmentedControl *)self numberOfSegments] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    int64_t v5 = [(NSMutableArray *)self->_segments objectAtIndexedSubscript:a3];
    id v6 = [v5 button];
  }

  return v6;
}

- (id)p_viewControllerForPresentingAccessibilityHUD
{
  v2 = [(CRLiOSMultipaneSegmentedControl *)self nextResponder];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 nextResponder];

      v2 = (void *)v3;
    }
    while (v3);
  }
  uint64_t v4 = objc_opt_class();
  int64_t v5 = sub_1002469D0(v4, v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
LABEL_8:
    id v8 = v6;
    goto LABEL_10;
  }
  id v7 = [v5 navigationController];

  if (v7)
  {
    id v6 = [v5 navigationController];
    goto LABEL_8;
  }
  id v9 = +[UIApplication sharedApplication];
  double v10 = [v9 keyWindow];
  id v8 = [v10 rootViewController];

LABEL_10:

  return v8;
}

- (int64_t)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (BOOL)isSegmentHuggingEnabled
{
  return self->_segmentHuggingEnabled;
}

- (int64_t)buttonHighlightedColorPreset
{
  return self->_buttonHighlightedColorPreset;
}

- (int64_t)buttonSelectedColorPreset
{
  return self->_buttonSelectedColorPreset;
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (void)setDefaultNormalTitleAttributes:(id)a3
{
}

- (void)setDefaultHighlightedTitleAttributes:(id)a3
{
}

- (void)setDefaultDisabledTitleAttributes:(id)a3
{
}

- (void)setDefaultSelectedTitleAttributes:(id)a3
{
}

- (NSDictionary)overrideNormalTitleAttributes
{
  return self->_overrideNormalTitleAttributes;
}

- (void)setOverrideNormalTitleAttributes:(id)a3
{
}

- (NSDictionary)overrideHighlightedTitleAttributes
{
  return self->_overrideHighlightedTitleAttributes;
}

- (void)setOverrideHighlightedTitleAttributes:(id)a3
{
}

- (NSDictionary)overrideDisabledTitleAttributes
{
  return self->_overrideDisabledTitleAttributes;
}

- (void)setOverrideDisabledTitleAttributes:(id)a3
{
}

- (NSDictionary)overrideSelectedTitleAttributes
{
  return self->_overrideSelectedTitleAttributes;
}

- (void)setOverrideSelectedTitleAttributes:(id)a3
{
}

- (CRLiOSVibrantBackdropView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (BOOL)needsUpdateTitles
{
  return self->_needsUpdateTitles;
}

- (void)setNeedsUpdateTitles:(BOOL)a3
{
  self->_BOOL needsUpdateTitles = a3;
}

- (BOOL)needsRemoveAllConstraints
{
  return self->_needsRemoveAllConstraints;
}

- (void)setNeedsRemoveAllConstraints:(BOOL)a3
{
  self->_needsRemoveAllConstraints = a3;
}

- (UIEdgeInsets)defaultEdgeInsets
{
  double top = self->_defaultEdgeInsets.top;
  double left = self->_defaultEdgeInsets.left;
  double bottom = self->_defaultEdgeInsets.bottom;
  double right = self->_defaultEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setDefaultEdgeInsets:(UIEdgeInsets)a3
{
  self->_defaultEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_overrideSelectedTitleAttributes, 0);
  objc_storeStrong((id *)&self->_overrideDisabledTitleAttributes, 0);
  objc_storeStrong((id *)&self->_overrideHighlightedTitleAttributes, 0);
  objc_storeStrong((id *)&self->_overrideNormalTitleAttributes, 0);
  objc_storeStrong((id *)&self->_defaultSelectedTitleAttributes, 0);
  objc_storeStrong((id *)&self->_defaultDisabledTitleAttributes, 0);
  objc_storeStrong((id *)&self->_defaultHighlightedTitleAttributes, 0);
  objc_storeStrong((id *)&self->_defaultNormalTitleAttributes, 0);

  objc_storeStrong((id *)&self->_segments, 0);
}

@end