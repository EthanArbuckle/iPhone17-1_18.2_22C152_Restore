@interface _ButtonsGroupViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hasShownControls;
- (BOOL)hasVisibleControls;
- (NSArray)floatingButtonItems;
- (NSString)blurGroupName;
- (_ButtonsGroupViewController)initWithFloatingButtonItems:(id)a3;
- (_ButtonsGroupViewController)initWithFloatingButtonItems:(id)a3 visualEffectDisabled:(BOOL)a4;
- (void)_enumerateButtonsWithControls:(int64_t)a3 usingBlock:(id)a4;
- (void)applyBorderAndShadow;
- (void)hideNonVisibleControls:(int64_t)a3;
- (void)loadView;
- (void)refreshControls;
- (void)setBlurGroupName:(id)a3;
- (void)setVisibleControls:(int64_t)a3;
- (void)showVisibleControls:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation _ButtonsGroupViewController

- (_ButtonsGroupViewController)initWithFloatingButtonItems:(id)a3 visualEffectDisabled:(BOOL)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_ButtonsGroupViewController;
  v7 = [(_ButtonsGroupViewController *)&v13 initWithNibName:0 bundle:0];
  if (v7)
  {
    v8 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    stackView = v7->_stackView;
    v7->_stackView = v8;

    [(UIStackView *)v7->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7->_visualEffectDisabled = a4;
    v10 = (NSArray *)[v6 copy];
    floatingButtonItems = v7->_floatingButtonItems;
    v7->_floatingButtonItems = v10;

    [(_ButtonsGroupViewController *)v7 refreshControls];
  }

  return v7;
}

- (void)loadView
{
  v3 = [[CardView alloc] initAllowingBlurredForButton:!self->_visualEffectDisabled];
  [(CardView *)v3 setLayoutStyle:6];
  [(CardView *)v3 setBlurGroupName:self->_blurGroupName];
  cardview = self->_cardview;
  self->_cardview = v3;
  v5 = v3;

  [(_ButtonsGroupViewController *)self setView:self->_cardview];

  [(_ButtonsGroupViewController *)self applyBorderAndShadow];
}

- (BOOL)hasShownControls
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_floatingButtonItems;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) button:v9];
        v7 = v6;
        if (v6 && ([v6 isHidden] & 1) == 0)
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)hasVisibleControls
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_floatingButtonItems;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v10 + 1) + 8 * i) button:v10];
        v7 = v6;
        if (v6)
        {
          [v6 alpha];
          if (v8 > 0.0)
          {

            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (void)_enumerateButtonsWithControls:(int64_t)a3 usingBlock:(id)a4
{
  v5 = (void (**)(id, void *, void *, BOOL, void))a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v23 = self;
  obj = self->_floatingButtonItems;
  id v6 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v25;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v10);
        long long v12 = [v11 button];
        if (v12)
        {
          unint64_t v13 = (unint64_t)[v11 option];
          v14 = [(UIStackView *)v23->_stackView arrangedSubviews];
          v15 = (char *)[v14 indexOfObject:v12];

          if (v15) {
            BOOL v16 = v15 == (char *)0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16)
          {
            v19 = 0;
          }
          else
          {
            v18 = [(UIStackView *)v23->_stackView arrangedSubviews];
            v19 = [v18 objectAtIndexedSubscript:v15 - 1];

            if (!(v8 & 1 | (v19 == 0))) {
              [v19 setAlpha:0.0];
            }
          }
          BOOL v17 = (v13 & a3) != 0;
          v5[2](v5, v12, v19, v17, v8 & 1);
          v8 |= v17;
        }
        long long v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v20 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v7 = v20;
    }
    while (v20);
  }
}

- (void)hideNonVisibleControls:(int64_t)a3
{
}

- (void)showVisibleControls:(int64_t)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_ButtonsGroupViewController;
  id v4 = a3;
  [(MapsThemeViewController *)&v8 traitCollectionDidChange:v4];
  v5 = [(_ButtonsGroupViewController *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(_ButtonsGroupViewController *)self applyBorderAndShadow];
  }
}

- (void)refreshControls
{
  id v3 = +[NSMutableArray array];
  id v4 = [(UIStackView *)self->_stackView arrangedSubviews];
  v5 = +[NSPredicate predicateWithBlock:&stru_1013231E8];
  id v6 = [v4 filteredArrayUsingPredicate:v5];
  id v7 = [v6 mutableCopy];

  floatingButtonItems = self->_floatingButtonItems;
  long long v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  unint64_t v13 = sub_10009E448;
  v14 = &unk_101323210;
  id v15 = v3;
  id v16 = v7;
  id v9 = v7;
  id v10 = v3;
  [(NSArray *)floatingButtonItems enumerateObjectsUsingBlock:&v11];
  -[UIStackView _maps_setArrangedSubviews:](self->_stackView, "_maps_setArrangedSubviews:", v10, v11, v12, v13, v14);
}

- (void)applyBorderAndShadow
{
  id v3 = [(_ButtonsGroupViewController *)self traitCollection];
  [v3 userInterfaceStyle];

  id v15 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
  id v4 = [v15 CGColor];
  v5 = [(CardView *)self->_cardview layer];
  [v5 setBorderColor:v4];

  id v6 = [(CardView *)self->_cardview layer];
  [v6 setCornerRadius:8.0];

  id v7 = [(CardView *)self->_cardview layer];
  [v7 setBorderWidth:0.5];

  id v8 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
  id v9 = [v8 CGColor];
  id v10 = [(CardView *)self->_cardview layer];
  [v10 setShadowColor:v9];

  long long v11 = [(CardView *)self->_cardview layer];
  LODWORD(v12) = *(_DWORD *)"\nף=";
  [v11 setShadowOpacity:v12];

  unint64_t v13 = [(CardView *)self->_cardview layer];
  [v13 setShadowOffset:0.0, -2.0];

  v14 = [(CardView *)self->_cardview layer];
  [v14 setShadowPathIsBounds:1];
}

- (void)setVisibleControls:(int64_t)a3
{
}

- (void)setBlurGroupName:(id)a3
{
  id v6 = a3;
  id v4 = (NSString *)[v6 copy];
  blurGroupName = self->_blurGroupName;
  self->_blurGroupName = v4;

  [(CardView *)self->_cardview setBlurGroupName:v6];
}

- (void)viewDidLoad
{
  v32.receiver = self;
  v32.super_class = (Class)_ButtonsGroupViewController;
  [(_ButtonsGroupViewController *)&v32 viewDidLoad];
  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [(_ButtonsGroupViewController *)self view];
  id v4 = [v3 window];
  v5 = [v4 screen];
  if (v5)
  {
    id v6 = [v3 window];
    id v7 = [v6 screen];
    [v7 nativeScale];
    double v9 = v8;
  }
  else
  {
    id v6 = +[UIScreen mainScreen];
    [v6 nativeScale];
    double v9 = v10;
  }

  double v11 = 1.0;
  if (v9 > 0.0) {
    double v11 = 1.0 / v9;
  }
  [(UIStackView *)self->_stackView setSpacing:v11];

  [(UIStackView *)self->_stackView setAlignment:0];
  [(UIStackView *)self->_stackView setAxis:1];
  LODWORD(v12) = 1148829696;
  [(UIStackView *)self->_stackView setContentHuggingPriority:0 forAxis:v12];
  LODWORD(v13) = 1148829696;
  [(UIStackView *)self->_stackView setContentCompressionResistancePriority:0 forAxis:v13];
  v14 = [(CardView *)self->_cardview contentView];
  [v14 addSubview:self->_stackView];

  v30 = [(UIStackView *)self->_stackView leadingAnchor];
  v31 = [(_ButtonsGroupViewController *)self view];
  v29 = [v31 leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v33[0] = v28;
  long long v26 = [(UIStackView *)self->_stackView trailingAnchor];
  long long v27 = [(_ButtonsGroupViewController *)self view];
  long long v25 = [v27 trailingAnchor];
  id v15 = [v26 constraintEqualToAnchor:v25];
  v33[1] = v15;
  id v16 = [(UIStackView *)self->_stackView topAnchor];
  BOOL v17 = [(_ButtonsGroupViewController *)self view];
  v18 = [v17 topAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v33[2] = v19;
  id v20 = [(UIStackView *)self->_stackView bottomAnchor];
  v21 = [(_ButtonsGroupViewController *)self view];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v33[3] = v23;
  long long v24 = +[NSArray arrayWithObjects:v33 count:4];
  +[NSLayoutConstraint activateConstraints:v24];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_ButtonsGroupViewController)initWithFloatingButtonItems:(id)a3
{
  return [(_ButtonsGroupViewController *)self initWithFloatingButtonItems:a3 visualEffectDisabled:0];
}

- (NSString)blurGroupName
{
  return self->_blurGroupName;
}

- (NSArray)floatingButtonItems
{
  return self->_floatingButtonItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingButtonItems, 0);
  objc_storeStrong((id *)&self->_blurGroupName, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_storeStrong((id *)&self->_cardview, 0);
}

@end