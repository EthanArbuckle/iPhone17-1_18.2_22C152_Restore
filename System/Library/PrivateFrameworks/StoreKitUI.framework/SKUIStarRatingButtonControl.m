@interface SKUIStarRatingButtonControl
- (NSMutableArray)buttons;
- (SKUIStarRatingButtonControl)init;
- (SKUIStarRatingButtonControlDelegate)delegate;
- (float)value;
- (void)_starButtonTapped:(id)a3;
- (void)_updateForButtonIdentifier:(unint64_t)a3;
- (void)populate;
- (void)setButtons:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setValue:(float)a3;
@end

@implementation SKUIStarRatingButtonControl

- (SKUIStarRatingButtonControl)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIStarRatingButtonControl;
  v2 = -[SKUIStarRatingButtonControl initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
    [(SKUIStarRatingButtonControl *)v2 setButtons:v3];

    [(SKUIStarRatingButtonControl *)v2 populate];
  }
  return v2;
}

- (void)populate
{
  [(SKUIStarRatingButtonControl *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  id v79 = (id)objc_opt_new();
  [v79 setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v79 setBackgroundColor:v3];

  v4 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:11.0];
  objc_super v5 = objc_msgSend(v4, "systemFontOfSize:");
  [v79 setFont:v5];

  v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v79 setTextColor:v6];

  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"RATING_EXPLANATION" value:&stru_1F1C879E8 table:0];
  [v79 setText:v8];

  [(SKUIStarRatingButtonControl *)self addSubview:v79];
  v9 = [v79 topAnchor];
  v10 = [(SKUIStarRatingButtonControl *)self topAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  uint64_t v12 = 1;
  [v11 setActive:1];

  v13 = [v79 centerXAnchor];
  v14 = [(SKUIStarRatingButtonControl *)self centerXAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  do
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4FB14D0]);
    v17 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
    v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"star" withConfiguration:v17];
    [v16 setImage:v18 forState:0];
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v12);
    [v16 setAccessibilityIdentifier:v19];

    [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:8.0];
    double v21 = v20;
    v22 = [v16 layer];
    [v22 setCornerRadius:v21];

    v23 = [MEMORY[0x1E4FB1618] whiteColor];
    [v16 setTintColor:v23];

    [v16 setUserInteractionEnabled:1];
    [v16 addTarget:self action:sel__starButtonTapped_ forControlEvents:64];
    v24 = [(SKUIStarRatingButtonControl *)self buttons];
    [v24 addObject:v16];

    ++v12;
  }
  while (v12 != 6);
  v25 = [(SKUIStarRatingButtonControl *)self buttons];
  v26 = [v25 objectAtIndex:0];

  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SKUIStarRatingButtonControl *)self addSubview:v26];
  v27 = [v26 leadingAnchor];
  v28 = [(SKUIStarRatingButtonControl *)self leadingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  uint64_t v30 = 1;
  [v29 setActive:1];

  v31 = [v26 topAnchor];
  v32 = [v79 bottomAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:12.0];
  v33 = objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32);
  [v33 setActive:1];

  v34 = [v26 bottomAnchor];
  v35 = [(SKUIStarRatingButtonControl *)self bottomAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:8.0];
  v37 = [v34 constraintEqualToAnchor:v35 constant:-v36];
  [v37 setActive:1];

  v38 = [v26 widthAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:36.0 newValue:44.0];
  v39 = objc_msgSend(v38, "constraintEqualToConstant:");
  [v39 setActive:1];

  v40 = [v26 heightAnchor];
  [MEMORY[0x1E4F3C2C8] PPMConfirmedValueWithValue:36.0 newValue:44.0];
  v41 = objc_msgSend(v40, "constraintEqualToConstant:");
  [v41 setActive:1];

  do
  {
    v42 = [(SKUIStarRatingButtonControl *)self buttons];
    v43 = [v42 objectAtIndex:v30 - 1];

    v44 = [(SKUIStarRatingButtonControl *)self buttons];
    v45 = [v44 objectAtIndex:v30];

    [v45 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SKUIStarRatingButtonControl *)self addSubview:v45];
    v46 = [v45 leadingAnchor];
    v47 = [v43 trailingAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    [v48 setActive:1];

    v49 = [v45 topAnchor];
    v50 = [v43 topAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v51 setActive:1];

    v52 = [v45 bottomAnchor];
    v53 = [v43 bottomAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    [v54 setActive:1];

    v55 = [v45 widthAnchor];
    [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:36.0];
    v56 = objc_msgSend(v55, "constraintEqualToConstant:");
    [v56 setActive:1];

    v57 = [v45 heightAnchor];
    [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:36.0];
    v58 = objc_msgSend(v57, "constraintEqualToConstant:");
    [v58 setActive:1];

    ++v30;
  }
  while (v30 != 4);
  v59 = [(SKUIStarRatingButtonControl *)self buttons];
  v60 = [v59 objectAtIndex:3];

  v61 = [(SKUIStarRatingButtonControl *)self buttons];
  v62 = [v61 objectAtIndex:4];

  [v62 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SKUIStarRatingButtonControl *)self addSubview:v62];
  v63 = [v62 leadingAnchor];
  v64 = [v60 trailingAnchor];
  v65 = [v63 constraintEqualToAnchor:v64];
  [v65 setActive:1];

  v66 = [v62 topAnchor];
  v67 = [v60 topAnchor];
  v68 = [v66 constraintEqualToAnchor:v67];
  [v68 setActive:1];

  v69 = [v62 bottomAnchor];
  v70 = [v60 bottomAnchor];
  v71 = [v69 constraintEqualToAnchor:v70];
  [v71 setActive:1];

  v72 = [v62 trailingAnchor];
  v73 = [(SKUIStarRatingButtonControl *)self trailingAnchor];
  v74 = [v72 constraintEqualToAnchor:v73];
  [v74 setActive:1];

  v75 = [v62 widthAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:36.0];
  v76 = objc_msgSend(v75, "constraintEqualToConstant:");
  [v76 setActive:1];

  v77 = [v62 heightAnchor];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:36.0];
  v78 = objc_msgSend(v77, "constraintEqualToConstant:");
  [v78 setActive:1];
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
}

- (void)_starButtonTapped:(id)a3
{
  v4 = [a3 accessibilityIdentifier];
  uint64_t v5 = [v4 integerValue];

  [(SKUIStarRatingButtonControl *)self _updateForButtonIdentifier:v5];
  id v6 = [(SKUIStarRatingButtonControl *)self delegate];
  [v6 starRatingButtonControlDidUpdateValues];
}

- (void)_updateForButtonIdentifier:(unint64_t)a3
{
  uint64_t v5 = [(SKUIStarRatingButtonControl *)self buttons];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      v8 = [(SKUIStarRatingButtonControl *)self buttons];
      v9 = [v8 objectAtIndex:v7];

      v10 = [MEMORY[0x1E4FB1830] configurationWithScale:2];
      if (v7 >= a3) {
        v11 = @"star";
      }
      else {
        v11 = @"star.fill";
      }
      uint64_t v12 = [MEMORY[0x1E4FB1818] systemImageNamed:v11 withConfiguration:v10];
      [v9 setImage:v12 forState:0];

      ++v7;
      v13 = [(SKUIStarRatingButtonControl *)self buttons];
      unint64_t v14 = [v13 count];
    }
    while (v7 < v14);
  }
  self->_value = (float)a3 / 5.0;
}

- (SKUIStarRatingButtonControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIStarRatingButtonControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end