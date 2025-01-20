@interface VoiceVolumeControlView
- (CGSize)intrinsicContentSize;
- (VoiceVolumeControlView)initWithDelegate:(id)a3;
- (VoiceVolumeControlViewDelegate)delegate;
- (double)_buttonLabelVerticalMarginForTrait:(id)a3;
- (id)_accessibilityIdenfifierPrefixForVolumeOption:(int64_t)a3;
- (id)_accessibilityTextForVolumeOption:(int64_t)a3;
- (id)_buttonForVolumeOption:(int64_t)a3;
- (id)_effectiveTraitCollection;
- (id)_imageForVolumeOption:(int64_t)a3;
- (id)_labelForVolumeOption:(int64_t)a3;
- (id)_maximumContentSizeCategory;
- (void)_addShadows;
- (void)_animateContentUpdate;
- (void)_setup;
- (void)_updateContent;
- (void)buttonSwiped:(id)a3;
- (void)buttonTapped:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation VoiceVolumeControlView

- (VoiceVolumeControlView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VoiceVolumeControlView;
  v5 = -[VoiceVolumeControlView initWithFrame:](&v9, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(VoiceVolumeControlView *)v5 setAccessibilityIdentifier:v7];

    objc_storeWeak((id *)&v5->_delegate, v4);
    [(VoiceVolumeControlView *)v5 _setup];
  }

  return v5;
}

- (void)dealloc
{
  GEOConfigRemoveDelegateListenerForKey();
  v3.receiver = self;
  v3.super_class = (Class)VoiceVolumeControlView;
  [(VoiceVolumeControlView *)&v3 dealloc];
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = [(UIStackView *)self->_labelStackView arrangedSubviews];
  id v4 = [v3 firstObject];
  v5 = [v4 font];
  [v5 lineHeight];
  double v7 = v6;

  double v8 = ceil(v7);
  objc_super v9 = [(VoiceVolumeControlView *)self traitCollection];
  [(VoiceVolumeControlView *)self _buttonLabelVerticalMarginForTrait:v9];
  double v11 = v10;

  double v12 = v8 + v11 + 88.0;
  double v13 = 324.0;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VoiceVolumeControlView;
  [(VoiceVolumeControlView *)&v3 layoutSubviews];
  [(UIView *)self->_buttonStackViewContainer layoutSubviews];
  [(VoiceVolumeControlView *)self _addShadows];
}

- (void)_setup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  self->_currentSelection = (int64_t)[WeakRetained currentSelectionForAudioControlView:self];

  id v4 = objc_opt_new();
  id v5 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v9 = (UIView *)[v5 initWithFrame:CGRectZero.origin.x, y, width, height];
  buttonStackViewContainer = self->_buttonStackViewContainer;
  self->_buttonStackViewContainer = v9;

  [(UIView *)self->_buttonStackViewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_buttonStackViewContainer setAccessibilityLabel:@"buttonStackViewContainer"];
  [(UIView *)self->_buttonStackViewContainer setClipsToBounds:1];
  double v11 = [(UIView *)self->_buttonStackViewContainer layer];
  [v11 setCornerRadius:44.0];

  double v12 = +[UIColor tertiarySystemFillColor];
  [(UIView *)self->_buttonStackViewContainer setBackgroundColor:v12];

  double v13 = [(UIView *)self->_buttonStackViewContainer widthAnchor];
  v14 = [v13 constraintEqualToConstant:324.0];

  LODWORD(v15) = 1144750080;
  [v14 setPriority:v15];
  v97 = v4;
  v92 = v14;
  [v4 addObject:v14];
  [(VoiceVolumeControlView *)self addSubview:self->_buttonStackViewContainer];
  v16 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
  selectionBadge = self->_selectionBadge;
  self->_selectionBadge = v16;

  [(UIView *)self->_selectionBadge setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [(UIView *)self->_selectionBadge layer];
  [v18 setCornerRadius:40.0];

  v19 = +[UIColor systemWhiteColor];
  [(UIView *)self->_selectionBadge setBackgroundColor:v19];

  [(UIView *)self->_buttonStackViewContainer addSubview:self->_selectionBadge];
  v20 = objc_opt_new();
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id v21 = [&off_1013AD5C0 countByEnumeratingWithState:&v115 objects:v123 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v116;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v116 != v23) {
          objc_enumerationMutation(&off_1013AD5C0);
        }
        v25 = -[VoiceVolumeControlView _buttonForVolumeOption:](self, "_buttonForVolumeOption:", [*(id *)(*((void *)&v115 + 1) + 8 * i) integerValue]);
        [v20 addObject:v25];
      }
      id v22 = [&off_1013AD5C0 countByEnumeratingWithState:&v115 objects:v123 count:16];
    }
    while (v22);
  }
  v91 = v20;
  objc_storeStrong((id *)&self->_buttons, v20);
  v26 = (UIStackView *)[objc_alloc((Class)UIStackView) initWithArrangedSubviews:self->_buttons];
  buttonStackView = self->_buttonStackView;
  self->_buttonStackView = v26;

  [(UIStackView *)self->_buttonStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_buttonStackView setAlignment:3];
  [(UIStackView *)self->_buttonStackView setAxis:0];
  [(UIStackView *)self->_buttonStackView setDistribution:3];
  v99 = self;
  [(UIView *)self->_buttonStackViewContainer addSubview:self->_buttonStackView];
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  obj = self->_buttons;
  id v100 = [(NSArray *)obj countByEnumeratingWithState:&v111 objects:v122 count:16];
  if (v100)
  {
    uint64_t v95 = *(void *)v112;
    do
    {
      for (j = 0; j != v100; j = (char *)j + 1)
      {
        if (*(void *)v112 != v95) {
          objc_enumerationMutation(obj);
        }
        v29 = *(void **)(*((void *)&v111 + 1) + 8 * (void)j);
        [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
        v102 = [v29 widthAnchor];
        v30 = [v29 heightAnchor];
        v31 = [v102 constraintEqualToAnchor:v30];
        v121[0] = v31;
        v32 = [v29 topAnchor];
        v33 = [(UIStackView *)v99->_buttonStackView topAnchor];
        v34 = [v32 constraintEqualToAnchor:v33];
        v121[1] = v34;
        v35 = [v29 bottomAnchor];
        v36 = [(UIStackView *)v99->_buttonStackView bottomAnchor];
        v37 = [v35 constraintEqualToAnchor:v36];
        v121[2] = v37;
        v38 = +[NSArray arrayWithObjects:v121 count:3];
        [v97 addObjectsFromArray:v38];
      }
      id v100 = [(NSArray *)obj countByEnumeratingWithState:&v111 objects:v122 count:16];
    }
    while (v100);
  }

  v39 = objc_opt_new();
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v40 = [&off_1013AD5C0 countByEnumeratingWithState:&v107 objects:v120 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v108;
    do
    {
      for (k = 0; k != v41; k = (char *)k + 1)
      {
        if (*(void *)v108 != v42) {
          objc_enumerationMutation(&off_1013AD5C0);
        }
        v44 = -[VoiceVolumeControlView _labelForVolumeOption:](v99, "_labelForVolumeOption:", [*(id *)(*((void *)&v107 + 1) + 8 * (void)k) integerValue]);
        [v39 addObject:v44];
      }
      id v41 = [&off_1013AD5C0 countByEnumeratingWithState:&v107 objects:v120 count:16];
    }
    while (v41);
  }
  v45 = (UIStackView *)[objc_alloc((Class)UIStackView) initWithArrangedSubviews:v39];
  labelStackView = v99->_labelStackView;
  v99->_labelStackView = v45;

  [(UIStackView *)v99->_labelStackView setSpacing:10.0];
  [(UIStackView *)v99->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)v99->_labelStackView setAlignment:5];
  [(UIStackView *)v99->_labelStackView setAxis:0];
  [(UIStackView *)v99->_labelStackView setDistribution:3];
  [(VoiceVolumeControlView *)v99 addSubview:v99->_labelStackView];
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_1004941D4;
  v104[3] = &unk_1012EBD30;
  id v105 = v97;
  v106 = v99;
  id v103 = v97;
  [v39 enumerateObjectsUsingBlock:v104];
  v101 = [(UIView *)v99->_buttonStackViewContainer topAnchor];
  v98 = [(VoiceVolumeControlView *)v99 topAnchor];
  v96 = [v101 constraintEqualToAnchor:v98];
  v119[0] = v96;
  id obja = [(UIView *)v99->_buttonStackViewContainer heightAnchor];
  v89 = [obja constraintEqualToConstant:88.0];
  v119[1] = v89;
  v88 = [(UIView *)v99->_buttonStackViewContainer leftAnchor];
  v87 = [(VoiceVolumeControlView *)v99 leftAnchor];
  v86 = [v88 constraintEqualToAnchor:v87];
  v119[2] = v86;
  v85 = [(UIView *)v99->_buttonStackViewContainer rightAnchor];
  v84 = [(VoiceVolumeControlView *)v99 rightAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v119[3] = v83;
  v82 = [(UIView *)v99->_selectionBadge topAnchor];
  v81 = [(UIView *)v99->_buttonStackViewContainer topAnchor];
  v80 = [v82 constraintEqualToAnchor:v81 constant:4.0];
  v119[4] = v80;
  v79 = [(UIView *)v99->_selectionBadge bottomAnchor];
  v78 = [(UIView *)v99->_buttonStackViewContainer bottomAnchor];
  v77 = [v79 constraintEqualToAnchor:v78 constant:-4.0];
  v119[5] = v77;
  v76 = [(UIView *)v99->_selectionBadge widthAnchor];
  v90 = [(UIView *)v99->_selectionBadge heightAnchor];
  v75 = [v76 constraintEqualToAnchor:v90];
  v119[6] = v75;
  v74 = [(UIStackView *)v99->_buttonStackView topAnchor];
  v73 = [(UIView *)v99->_buttonStackViewContainer topAnchor];
  v72 = [v74 constraintEqualToAnchor:v73 constant:4.0];
  v119[7] = v72;
  v71 = [(UIStackView *)v99->_buttonStackView bottomAnchor];
  v70 = [(UIView *)v99->_buttonStackViewContainer bottomAnchor];
  v69 = [v71 constraintEqualToAnchor:v70 constant:-4.0];
  v119[8] = v69;
  v68 = [(UIStackView *)v99->_buttonStackView leftAnchor];
  v67 = [(UIView *)v99->_buttonStackViewContainer leftAnchor];
  v66 = [v68 constraintEqualToAnchor:v67 constant:4.0];
  v119[9] = v66;
  v65 = [(UIStackView *)v99->_buttonStackView rightAnchor];
  v64 = [(UIView *)v99->_buttonStackViewContainer rightAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:-4.0];
  v119[10] = v63;
  v62 = [(UIStackView *)v99->_labelStackView topAnchor];
  v61 = [(UIView *)v99->_buttonStackViewContainer bottomAnchor];
  v60 = [v62 constraintLessThanOrEqualToAnchor:v61 constant:10.0];
  v119[11] = v60;
  v59 = [(UIStackView *)v99->_labelStackView topAnchor];
  v58 = [(UIView *)v99->_buttonStackViewContainer bottomAnchor];
  v57 = [v59 constraintGreaterThanOrEqualToAnchor:v58 constant:8.0];
  v119[12] = v57;
  v56 = [(UIStackView *)v99->_labelStackView leftAnchor];
  v47 = [(UIStackView *)v99->_buttonStackView leftAnchor];
  v48 = [v56 constraintEqualToAnchor:v47];
  v119[13] = v48;
  v49 = [(UIStackView *)v99->_labelStackView rightAnchor];
  v50 = [(UIStackView *)v99->_buttonStackView rightAnchor];
  v51 = [v49 constraintEqualToAnchor:v50];
  v119[14] = v51;
  v52 = [(VoiceVolumeControlView *)v99 topAnchor];
  v53 = [(UIView *)v99->_buttonStackViewContainer topAnchor];
  v54 = [v52 constraintEqualToAnchor:v53];
  v119[15] = v54;
  v55 = +[NSArray arrayWithObjects:v119 count:16];
  [v103 addObjectsFromArray:v55];

  +[NSLayoutConstraint activateConstraints:v103];
  [(VoiceVolumeControlView *)v99 _updateContent];
  _GEOConfigAddDelegateListenerForKey();
}

- (void)_updateContent
{
  buttons = self->_buttons;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100494408;
  v3[3] = &unk_1012EBD58;
  v3[4] = self;
  [(NSArray *)buttons enumerateObjectsUsingBlock:v3];
}

- (id)_imageForVolumeOption:(int64_t)a3
{
  if (qword_10160EDB8 != -1) {
    dispatch_once(&qword_10160EDB8, &stru_1012EBD78);
  }
  if ((unint64_t)a3 <= 2)
  {
    self = +[UIImage systemImageNamed:off_1012EBDB8[a3] withConfiguration:qword_10160EDC0];
  }

  return self;
}

- (id)_labelForVolumeOption:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      objc_super v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Louder volume [Nav Tray]";
      goto LABEL_7;
    case 1:
      objc_super v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Normal volume [Nav Tray]";
      goto LABEL_7;
    case 0:
      objc_super v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"Softer volume [Nav Tray]";
LABEL_7:
      double v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      goto LABEL_9;
  }
  double v6 = 0;
LABEL_9:
  double v7 = objc_opt_new();
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setTextAlignment:1];
  LODWORD(v8) = 1148846080;
  [v7 setContentHuggingPriority:1 forAxis:v8];
  objc_super v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [v7 setFont:v9];

  double v10 = +[UIColor labelColor];
  [v7 setTextColor:v10];

  [v7 setText:v6];

  return v7;
}

- (id)_buttonForVolumeOption:(int64_t)a3
{
  CFStringRef v5 = objc_opt_new();
  [v5 setTag:a3];
  double v6 = [(VoiceVolumeControlView *)self _accessibilityIdenfifierPrefixForVolumeOption:a3];
  [v5 setAccessibilityIdentifier:v6];

  double v7 = [(VoiceVolumeControlView *)self _accessibilityTextForVolumeOption:a3];
  [v5 setAccessibilityLabel:v7];

  double v8 = [(VoiceVolumeControlView *)self _imageForVolumeOption:a3];
  [v5 setImage:v8 forState:0];

  [v5 addTarget:self action:"buttonTapped:" forControlEvents:64];
  id v9 = [objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:self action:"buttonSwiped:"];
  [v9 setDirection:2];
  [v9 setNumberOfTouchesRequired:1];
  [v5 addGestureRecognizer:v9];
  id v10 = [objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:self action:"buttonSwiped:"];

  [v10 setDirection:1];
  [v10 setNumberOfTouchesRequired:1];
  [v5 addGestureRecognizer:v10];

  return v5;
}

- (void)buttonTapped:(id)a3
{
  self->_currentSelection = (int64_t)[a3 tag];
  id v4 = [(VoiceVolumeControlView *)self delegate];
  [v4 audioControlView:self didSelectAudioType:self->_currentSelection];

  [(VoiceVolumeControlView *)self _animateContentUpdate];
}

- (void)buttonSwiped:(id)a3
{
  id v12 = a3;
  id v4 = [v12 view];
  id v5 = [v4 tag];
  int64_t currentSelection = self->_currentSelection;

  if (v5 == (id)currentSelection)
  {
    id v7 = [v12 direction];
    double v8 = [v12 view];
    id v9 = (char *)[v8 tag];
    unint64_t v10 = (unint64_t)(v7 == (id)2 ? v9 - 1 : v9 + 1);

    if (v10 <= 2)
    {
      self->_int64_t currentSelection = v10;
      double v11 = [(VoiceVolumeControlView *)self delegate];
      [v11 audioControlView:self didSelectAudioType:self->_currentSelection];

      [(VoiceVolumeControlView *)self _animateContentUpdate];
    }
  }
}

- (void)_animateContentUpdate
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100494AD8;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  +[UIView animateWithDuration:v2 animations:0.25];
}

- (id)_accessibilityIdenfifierPrefixForVolumeOption:(int64_t)a3
{
  CFStringRef v3 = @"VolumeSoft";
  if (a3 == 1) {
    CFStringRef v3 = @"VolumeNormal";
  }
  if (a3 == 2) {
    return @"VolumeLoud";
  }
  else {
    return (id)v3;
  }
}

- (id)_accessibilityTextForVolumeOption:(int64_t)a3
{
  if (a3 == 2)
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = v4;
    CFStringRef v6 = @"[Audio] Loud volume";
  }
  else if (a3 == 1)
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = v4;
    CFStringRef v6 = @"[Audio] Normal volume";
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    id v4 = +[NSBundle mainBundle];
    id v5 = v4;
    CFStringRef v6 = @"[Audio] Soft volume";
  }
  CFStringRef v3 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

LABEL_8:

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VoiceVolumeControlView;
  [(VoiceVolumeControlView *)&v21 traitCollectionDidChange:v4];
  id v5 = [(VoiceVolumeControlView *)self traitCollection];
  CFStringRef v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];
  uint64_t v8 = sub_1000E93B0(v6, v7);

  if (v8)
  {
    id v9 = [(VoiceVolumeControlView *)self _effectiveTraitCollection];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unint64_t v10 = [(UIStackView *)self->_labelStackView arrangedSubviews];
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v14);
          v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline compatibleWithTraitCollection:v9];
          [v15 setFont:v16];

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }
  }
}

- (id)_maximumContentSizeCategory
{
  return UIContentSizeCategoryAccessibilityLarge;
}

- (id)_effectiveTraitCollection
{
  CFStringRef v3 = [(VoiceVolumeControlView *)self traitCollection];
  id v4 = [(VoiceVolumeControlView *)self _maximumContentSizeCategory];
  id v5 = [v3 _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:0 maximumContentSizeCategory:v4];

  return v5;
}

- (double)_buttonLabelVerticalMarginForTrait:(id)a3
{
  CFStringRef v3 = [a3 preferredContentSizeCategory];
  if (UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryMedium) == NSOrderedDescending) {
    double v4 = 10.0;
  }
  else {
    double v4 = 8.0;
  }

  return v4;
}

- (void)_addShadows
{
  if (!self->_shadowImageView)
  {
    CFStringRef v3 = [(UIImageView *)objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    shadowImageView = self->_shadowImageView;
    self->_shadowImageView = v3;

    [(UIView *)self->_selectionBadge addSubview:self->_shadowImageView];
  }
  [(UIView *)self->_selectionBadge frame];
  double v6 = v5 * 0.5;
  id v7 = [(VoiceVolumeControlView *)self traitCollection];
  [v7 displayScale];
  CGFloat v9 = v8;

  id v14 = +[UIColor systemBlackColor];
  unint64_t v10 = sub_100495090(v14, v6, 8.0, 0.119999997, v9);
  [(UIImageView *)self->_shadowImageView setImage:v10];
  if (self->_shadowImageView)
  {
    [(UIView *)self->_selectionBadge bounds];
    CGRect v17 = CGRectInset(v16, -8.0, -8.0);
    -[UIImageView setFrame:](self->_shadowImageView, "setFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  }
  if (!self->_shadowImageView2)
  {
    id v11 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    shadowImageView2 = self->_shadowImageView2;
    self->_shadowImageView2 = v11;

    [(UIView *)self->_selectionBadge addSubview:self->_shadowImageView2];
  }
  uint64_t v13 = sub_100495090(v14, v6, 1.0, 0.0399999991, v9);

  [(UIImageView *)self->_shadowImageView2 setImage:v13];
  if (self->_shadowImageView2)
  {
    [(UIView *)self->_selectionBadge bounds];
    CGRect v19 = CGRectInset(v18, -1.0, -1.0);
    -[UIImageView setFrame:](self->_shadowImageView2, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  }
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsConfig_PreferencesUniqueEntityDidUpdate && a3.var1 == off_1015F1418)
  {
    self->_int64_t currentSelection = GEOConfigGetInteger();
    [(VoiceVolumeControlView *)self _animateContentUpdate];
  }
}

- (VoiceVolumeControlViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VoiceVolumeControlViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shadowImageView2, 0);
  objc_storeStrong((id *)&self->_shadowImageView, 0);
  objc_storeStrong((id *)&self->_selectionBadgeXContraint, 0);
  objc_storeStrong((id *)&self->_selectionBadge, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_buttonStackView, 0);

  objc_storeStrong((id *)&self->_buttonStackViewContainer, 0);
}

@end