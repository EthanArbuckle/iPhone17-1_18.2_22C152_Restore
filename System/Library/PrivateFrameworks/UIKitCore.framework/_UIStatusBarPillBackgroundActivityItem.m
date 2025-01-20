@interface _UIStatusBarPillBackgroundActivityItem
+ (BOOL)_identifierContainsItemImage:(id)a3;
+ (BOOL)_identifierContainsSecondaryItemImage:(id)a3;
+ (BOOL)shouldKeepIconVisibleForActivityType:(int64_t)a3;
+ (_UIStatusBarIdentifier)pillCombinedDisplayIdentifier;
- (BOOL)_shouldBounceWhenTransitioningFromType:(int64_t)a3 toType:(int64_t)a4;
- (BOOL)shouldUpdateIndicatorForIdentifier:(id)a3;
- (CGSize)pillSize;
- (_UIStatusBarDisplayableContainerView)iconsView;
- (_UIStatusBarPillView)combinedView;
- (id)_backgroundActivityViewForIdentifier:(id)a3;
- (id)_backgroundColorForActivityType:(int64_t)a3;
- (id)_textLabelForActivityType:(int64_t)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)createDisplayItemForIdentifier:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (void)_create_combinedView;
- (void)_create_iconsView;
- (void)setCombinedView:(id)a3;
- (void)setIconsView:(id)a3;
- (void)setPillSize:(CGSize)a3;
@end

@implementation _UIStatusBarPillBackgroundActivityItem

+ (_UIStatusBarIdentifier)pillCombinedDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"pillCombinedDisplayIdentifier"];
}

+ (BOOL)_identifierContainsItemImage:(id)a3
{
  id v4 = a3;
  id v5 = [a1 pillCombinedDisplayIdentifier];
  if (v5 == v4)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS____UIStatusBarPillBackgroundActivityItem;
    unsigned __int8 v6 = objc_msgSendSuper2(&v8, sel__identifierContainsItemImage_, v4);
  }

  return v6;
}

+ (BOOL)_identifierContainsSecondaryItemImage:(id)a3
{
  id v4 = a3;
  id v5 = [a1 pillCombinedDisplayIdentifier];
  if (v5 == v4)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS____UIStatusBarPillBackgroundActivityItem;
    unsigned __int8 v6 = objc_msgSendSuper2(&v8, sel__identifierContainsItemImage_, v4);
  }

  return v6;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  v49[9] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
  id v4 = [(_UIStatusBarBackgroundActivityItem *)&v48 createDisplayItemForIdentifier:a3];
  id v5 = [v4 identifier];
  unsigned __int8 v6 = [(id)objc_opt_class() pillCombinedDisplayIdentifier];

  if (v5 == v6)
  {
    [(_UIStatusBarPillBackgroundActivityItem *)self pillSize];
    double v8 = v7;
    double v10 = v9;
    objc_msgSend(v4, "setActionInsets:", -10.0, -10.0, -10.0, -10.0);
    v47 = +[_UIStatusBarStyleAttributes overriddenStyleAttributes];
    v11 = +[UIColor whiteColor];
    [v47 setImageTintColor:v11];

    [v4 setOverriddenStyleAttributes:v47];
    v12 = [(_UIStatusBarPillBackgroundActivityItem *)self combinedView];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(_UIStatusBarPillBackgroundActivityItem *)self iconsView];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(_UIStatusBarBackgroundActivityItem *)self imageView];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 addSubview:v14];
    v15 = [(_UIStatusBarBackgroundActivityItem *)self secondaryIconView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 addSubview:v15];
    [v12 addSubview:v13];
    v46 = [v14 leadingAnchor];
    v45 = [v13 leadingAnchor];
    v43 = [v46 constraintEqualToAnchor:v45];
    v44 = v14;
    v49[0] = v43;
    v42 = [v14 centerYAnchor];
    v41 = [v13 centerYAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v49[1] = v40;
    v38 = [v15 leadingAnchor];
    v37 = [v14 trailingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v49[2] = v36;
    v39 = v15;
    v35 = [v15 centerYAnchor];
    v34 = [v13 centerYAnchor];
    v32 = [v35 constraintEqualToAnchor:v34];
    v49[3] = v32;
    v31 = [v15 trailingAnchor];
    v30 = [v13 trailingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v49[4] = v29;
    v27 = [v13 centerXAnchor];
    v16 = v12;
    v26 = [v12 centerXAnchor];
    v17 = [v27 constraintEqualToAnchor:v26];
    v49[5] = v17;
    v18 = [v13 centerYAnchor];
    v19 = [v12 centerYAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v49[6] = v20;
    v33 = v12;
    v21 = [v12 widthAnchor];
    v22 = [v21 constraintEqualToConstant:v8];
    v49[7] = v22;
    v23 = [v16 heightAnchor];
    v24 = [v23 constraintEqualToConstant:v10];
    v49[8] = v24;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:9];

    [MEMORY[0x1E4F5B268] activateConstraints:v28];
  }
  return v4;
}

- (id)_textLabelForActivityType:(int64_t)a3
{
  if (a3 == 33)
  {
    id v5 = @"Siri";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
    -[_UIStatusBarBackgroundActivityItem _textLabelForActivityType:](&v7, sel__textLabelForActivityType_);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_backgroundActivityViewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() pillCombinedDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v6 = [(_UIStatusBarPillBackgroundActivityItem *)self combinedView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
    uint64_t v6 = [(_UIStatusBarBackgroundActivityItem *)&v9 _backgroundActivityViewForIdentifier:v4];
  }
  objc_super v7 = (void *)v6;

  return v7;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
  id v7 = a3;
  uint64_t v8 = [(_UIStatusBarBackgroundActivityItem *)&v17 applyUpdate:v7 toDisplayItem:v6];
  objc_super v9 = objc_msgSend(v7, "data", v17.receiver, v17.super_class);
  double v10 = [v9 backgroundActivityEntry];

  LODWORD(v9) = [v7 dataChanged];
  if (v9)
  {
    uint64_t v11 = [v10 type];
    v12 = [v6 identifier];
    v13 = [(id)objc_opt_class() pillCombinedDisplayIdentifier];

    if (v12 == v13)
    {
      v14 = +[_UIStatusBarActivityAction actionForBackgroundActivityType:v11];
      [v6 setAction:v14];
    }
    if ([(_UIStatusBarPillBackgroundActivityItem *)self _shouldBounceWhenTransitioningFromType:[(_UIStatusBarBackgroundActivityItem *)self previousType] toType:v11])
    {
      uint64_t v15 = +[_UIStatusBarAnimationFactory pulseAnimationWithDuration:0.333 scale:1.333];

      uint64_t v8 = (void *)v15;
    }
  }

  return v8;
}

- (id)_backgroundColorForActivityType:(int64_t)a3
{
  if (a3 == 33)
  {
    uint64_t v3 = +[UIImage kitImageNamed:@"BackgroundTask_siri-pill"];
    id v4 = +[UIColor colorWithPatternImage:v3];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
    id v4 = -[_UIStatusBarBackgroundActivityItem _backgroundColorForActivityType:](&v6, sel__backgroundColorForActivityType_);
  }
  return v4;
}

- (BOOL)_shouldBounceWhenTransitioningFromType:(int64_t)a3 toType:(int64_t)a4
{
  return a3 == 27 && a4 == 28;
}

+ (BOOL)shouldKeepIconVisibleForActivityType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x20) & (0x9800013F >> a3);
}

- (_UIStatusBarPillView)combinedView
{
  combinedView = self->_combinedView;
  if (!combinedView)
  {
    [(_UIStatusBarPillBackgroundActivityItem *)self _create_combinedView];
    combinedView = self->_combinedView;
  }
  return combinedView;
}

- (void)_create_combinedView
{
  uint64_t v3 = [_UIStatusBarPillView alloc];
  id v4 = -[_UIStatusBarPillView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  combinedView = self->_combinedView;
  self->_combinedView = v4;
}

- (_UIStatusBarDisplayableContainerView)iconsView
{
  iconsView = self->_iconsView;
  if (!iconsView)
  {
    [(_UIStatusBarPillBackgroundActivityItem *)self _create_iconsView];
    iconsView = self->_iconsView;
  }
  return iconsView;
}

- (void)_create_iconsView
{
  uint64_t v3 = [_UIStatusBarDisplayableContainerView alloc];
  id v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  iconsView = self->_iconsView;
  self->_iconsView = v4;
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() pillCombinedDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v6 = [(_UIStatusBarPillBackgroundActivityItem *)self combinedView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
    uint64_t v6 = [(_UIStatusBarBackgroundActivityItem *)&v9 viewForIdentifier:v4];
  }
  id v7 = (void *)v6;

  return v7;
}

- (BOOL)shouldUpdateIndicatorForIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIStatusBarPillBackgroundActivityItem;
  if ([(_UIStatusBarIndicatorItem *)&v8 shouldUpdateIndicatorForIdentifier:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(id)objc_opt_class() pillCombinedDisplayIdentifier];
    BOOL v5 = v6 == v4;
  }
  return v5;
}

- (CGSize)pillSize
{
  double width = self->_pillSize.width;
  double height = self->_pillSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPillSize:(CGSize)a3
{
  self->_pillSize = a3;
}

- (void)setCombinedView:(id)a3
{
}

- (void)setIconsView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconsView, 0);
  objc_storeStrong((id *)&self->_combinedView, 0);
}

@end