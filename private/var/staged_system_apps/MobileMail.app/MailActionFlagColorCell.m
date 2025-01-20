@interface MailActionFlagColorCell
+ (id)reusableIdentifier;
- (BOOL)_disableRasterizeInAnimations;
- (MailActionFlagColorCell)initWithFrame:(CGRect)a3;
- (MailActionFlagColorCellDelegate)delegate;
- (NSArray)buttonPairs;
- (NSArray)buttons;
- (NSArray)pointerRegions;
- (UIStackView)stackView;
- (id)_arrangedSubviewsRespectingLayoutDirection;
- (id)_flagColorButtons;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)targetedPreviewForView:(id)a3;
- (id)titleLabel;
- (void)_buttonTapped:(id)a3;
- (void)_setupViews;
- (void)selectColor:(id)a3;
- (void)setButtonPairs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPointerRegions:(id)a3;
- (void)setStackView:(id)a3;
- (void)updateConstraints;
@end

@implementation MailActionFlagColorCell

+ (id)reusableIdentifier
{
  return @"MailActionFlagColorCellIdentifier";
}

- (MailActionFlagColorCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MailActionFlagColorCell;
  v3 = -[MailActionVerticalGroupedCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MailActionFlagColorCell *)v3 _setupViews];
  }
  return v4;
}

- (NSArray)buttons
{
  v2 = [(MailActionFlagColorCell *)self buttonPairs];
  v3 = [v2 ef_map:&stru_100607148];

  return (NSArray *)v3;
}

- (void)_setupViews
{
  v3 = [(MailActionFlagColorCell *)self contentView];
  v4 = [(MailActionFlagColorCell *)self _flagColorButtons];
  [(MailActionFlagColorCell *)self setButtonPairs:v4];

  v5 = +[UIStackView mf_equalSpacingHorizontalStackView];
  [v5 setAlignment:3];
  [v3 addSubview:v5];
  if (+[EMInternalPreferences preferenceEnabled:10])
  {
    id v6 = [objc_alloc((Class)UIPointerInteraction) initWithDelegate:self];
    [v5 addInteraction:v6];
  }
  [(MailActionFlagColorCell *)self setStackView:v5];
  v7 = [(MailActionFlagColorCell *)self buttons];
  id v32 = [v7 mutableCopy];

  v8 = objc_opt_new();
  v33 = [(MailActionCell *)self imageView];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v32;
  id v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v35;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v13 setTranslatesAutoresizingMaskIntoConstraints:0 v32];
        [v5 addArrangedSubview:v13];
        v14 = [v13 widthAnchor];
        v15 = [v14 constraintEqualToConstant:28.0];
        [v8 addObject:v15];

        v16 = [v13 widthAnchor];
        v17 = [v13 heightAnchor];
        v18 = [v16 constraintEqualToAnchor:v17];
        [v8 addObject:v18];
      }
      id v10 = [v9 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v10);
  }

  v19 = [v9 firstObject];
  v20 = [v19 leadingAnchor];
  v21 = [v3 layoutMarginsGuide];
  v22 = [v21 leadingAnchor];
  [v3 layoutMargins];
  v24 = [v20 constraintEqualToAnchor:v22 constant:v23];
  [v8 addObject:v24];

  v25 = [v9 lastObject];
  v26 = [v25 centerXAnchor];
  v27 = [v33 centerXAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v8 addObject:v28];

  v29 = [v5 centerYAnchor];
  v30 = [v3 centerYAnchor];
  v31 = [v29 constraintEqualToAnchor:v30];
  [v8 addObject:v31];

  +[NSLayoutConstraint activateConstraints:v8];
}

- (id)_flagColorButtons
{
  +[NSMutableArray arrayWithCapacity:8];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C8ED4;
  v8[3] = &unk_100607170;
  v8[4] = self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v3;
  v4 = objc_retainBlock(v8);
  uint64_t v5 = MFImageGlyphFlagColor;
  ((void (*)(void *, void, uint64_t))v4[2])(v4, MFImageGlyphFlagColor, 1);
  ((void (*)(void *, uint64_t, void))v4[2])(v4, v5, 0);
  ((void (*)(void *, uint64_t, uint64_t))v4[2])(v4, v5, 5);
  ((void (*)(void *, uint64_t, uint64_t))v4[2])(v4, v5, 4);
  ((void (*)(void *, uint64_t, uint64_t))v4[2])(v4, v5, 2);
  ((void (*)(void *, uint64_t, uint64_t))v4[2])(v4, v5, 3);
  ((void (*)(void *, uint64_t, uint64_t))v4[2])(v4, v5, 6);
  id v6 = v3;

  return v6;
}

- (void)_buttonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MailActionFlagColorCell *)self buttons];
  id v6 = [v5 indexOfObject:v4];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(void *)v13 = 0xE00000001;
    int v14 = 1;
    pid_t v15 = getpid();
    size_t v11 = 648;
    if (!sysctl(v13, 4u, __b, &v11, 0, 0) && (__b[8] & 0x800) != 0)
    {
      __debugbreak();
      JUMPOUT(0x1000C90BCLL);
    }
  }
  else
  {
    v7 = [(MailActionFlagColorCell *)self delegate];
    if (v7)
    {
      v8 = [(MailActionFlagColorCell *)self buttonPairs];
      id v9 = [v8 objectAtIndexedSubscript:v6];
      id v10 = [v9 first];

      [v7 mailActionFlagColorCell:self didTapOnFlagColor:v10];
    }
  }
}

- (void)selectColor:(id)a3
{
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(MailActionFlagColorCell *)self buttonPairs];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v9);
        if (v5)
        {
          id v3 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) first];
          id v11 = [v3 isEqualToNumber:v5];
        }
        else
        {
          id v11 = 0;
        }
        v12 = [v10 second];
        [v12 setSelected:v11];

        if (v5) {
        id v9 = (char *)v9 + 1;
        }
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (id)titleLabel
{
  return 0;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  id v7 = [(MailActionFlagColorCell *)self pointerRegions];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C946C;
  v11[3] = &unk_100607198;
  id v8 = v6;
  id v12 = v8;
  id v9 = [v7 ef_firstObjectPassingTest:v11];

  return v9;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  id v6 = [(MailActionFlagColorCell *)self pointerRegions];
  id v7 = [v6 indexOfObject:v5];

  id v8 = [(MailActionFlagColorCell *)self _arrangedSubviewsRespectingLayoutDirection];
  id v9 = [v8 objectAtIndexedSubscript:v7];
  id v10 = [(MailActionFlagColorCell *)self targetedPreviewForView:v9];
  id v11 = +[UIPointerLiftEffect effectWithPreview:v10];
  id v12 = +[UIPointerStyle styleWithEffect:v11 shape:0];

  return v12;
}

- (id)targetedPreviewForView:(id)a3
{
  id v4 = a3;
  id v5 = [(MailActionFlagColorCell *)self delegate];
  id v6 = [v5 targetedPreviewContainer];

  if (v6)
  {
    [v4 bounds];
    UIRectGetCenter();
    [v4 convertPoint:v6 toView:];
    id v9 = [objc_alloc((Class)UIPreviewTarget) initWithContainer:v6 center:v7];
  }
  else
  {
    id v9 = 0;
  }
  id v10 = objc_alloc_init((Class)UIPreviewParameters);
  if (v9) {
    id v11 = [objc_alloc((Class)UITargetedPreview) initWithView:v4 parameters:v10 target:v9];
  }
  else {
    id v11 = [objc_alloc((Class)UITargetedPreview) initWithView:v4 parameters:v10];
  }
  id v12 = v11;

  return v12;
}

- (NSArray)pointerRegions
{
  pointerRegions = self->_pointerRegions;
  if (!pointerRegions)
  {
    long long v35 = self;
    v33 = [(MailActionFlagColorCell *)self stackView];
    long long v34 = [(MailActionFlagColorCell *)v35 _arrangedSubviewsRespectingLayoutDirection];
    id v4 = [(MailActionFlagColorCell *)v35 stackView];
    [v4 frame];
    double Width = CGRectGetWidth(v47);

    id v6 = [(MailActionFlagColorCell *)v35 stackView];
    [v6 frame];
    double Height = CGRectGetHeight(v48);

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    double v8 = [v33 arrangedSubviews];
    id v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v41;
      double v11 = 0.0;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v40 + 1) + 8 * i) frame];
          double v11 = v11 + CGRectGetWidth(v49);
        }
        id v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v9);
    }
    else
    {
      double v11 = 0.0;
    }

    id v13 = [v34 count];
    id v14 = objc_alloc_init((Class)NSMutableArray);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v15 = v34;
    id v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v16)
    {
      double v17 = (Width - v11) / (double)((unint64_t)v13 - 1);
      uint64_t v18 = *(void *)v37;
      double MaxX = 0.0;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v37 != v18) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
          v22 = [v15 firstObject];
          if (v21 == v22)
          {

LABEL_20:
            double v25 = v17 * 0.5;
            goto LABEL_21;
          }
          double v23 = [v15 lastObject];
          BOOL v24 = v21 == v23;

          double v25 = v17;
          if (v24) {
            goto LABEL_20;
          }
LABEL_21:
          [v21 frame];
          double v26 = CGRectGetWidth(v50);
          v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"FlagColor-%lu", [v14 count]);
          CGFloat v28 = v25 + v26;
          v29 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v27, MaxX, 0.0, v28, Height);
          [v14 addObject:v29];
          v51.origin.y = 0.0;
          v51.origin.x = MaxX;
          v51.size.width = v28;
          v51.size.height = Height;
          double MaxX = CGRectGetMaxX(v51);
        }
        id v16 = [v15 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v16);
    }

    v30 = (NSArray *)[v14 copy];
    v31 = v35->_pointerRegions;
    v35->_pointerRegions = v30;

    pointerRegions = v35->_pointerRegions;
  }

  return pointerRegions;
}

- (id)_arrangedSubviewsRespectingLayoutDirection
{
  id v3 = [(MailActionFlagColorCell *)self stackView];
  id v4 = [v3 arrangedSubviews];

  id v5 = [(MailActionFlagColorCell *)self traitCollection];
  id v6 = [v5 layoutDirection];

  if (v6 == (id)1)
  {
    uint64_t v7 = [v4 ef_reverse];

    id v4 = (void *)v7;
  }

  return v4;
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)MailActionFlagColorCell;
  [(MailActionFlagColorCell *)&v3 updateConstraints];
  [(MailActionFlagColorCell *)self setPointerRegions:0];
}

- (MailActionFlagColorCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MailActionFlagColorCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)buttonPairs
{
  return self->_buttonPairs;
}

- (void)setButtonPairs:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void)setPointerRegions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerRegions, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_buttonPairs, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end