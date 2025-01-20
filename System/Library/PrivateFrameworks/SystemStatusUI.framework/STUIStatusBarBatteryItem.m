@interface STUIStatusBarBatteryItem
+ (STUIStatusBarIdentifier)chargingDisplayIdentifier;
+ (STUIStatusBarIdentifier)iconDisplayIdentifier;
+ (STUIStatusBarIdentifier)percentDisplayIdentifier;
+ (STUIStatusBarIdentifier)staticIconDisplayIdentifier;
- (BOOL)highlighted;
- (BOOL)usesCondensedPercentageDisplay;
- (STUIStatusBarBatteryView)batteryView;
- (STUIStatusBarImageView)chargingView;
- (STUIStatusBarStaticBatteryView)staticBatteryView;
- (STUIStatusBarStringView)percentView;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (id)viewForIdentifier:(id)a3;
- (void)_create_batteryView;
- (void)_create_chargingView;
- (void)_create_percentView;
- (void)_create_staticBatteryView;
- (void)setBatteryView:(id)a3;
- (void)setChargingView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPercentView:(id)a3;
- (void)setStaticBatteryView:(id)a3;
- (void)setUsesCondensedPercentageDisplay:(BOOL)a3;
@end

@implementation STUIStatusBarBatteryItem

+ (STUIStatusBarIdentifier)iconDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"iconDisplayIdentifier"];
}

+ (STUIStatusBarIdentifier)staticIconDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"staticIconDisplayIdentifier"];
}

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA9790]];
}

- (void)setUsesCondensedPercentageDisplay:(BOOL)a3
{
  self->_usesCondensedPercentageDisplay = a3;
}

+ (STUIStatusBarIdentifier)percentDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"percentDisplayIdentifier"];
}

- (STUIStatusBarStringView)percentView
{
  percentView = self->_percentView;
  if (!percentView)
  {
    [(STUIStatusBarBatteryItem *)self _create_percentView];
    percentView = self->_percentView;
  }
  return percentView;
}

- (void)_create_percentView
{
  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  percentView = self->_percentView;
  self->_percentView = v4;
  MEMORY[0x1F41817F8](v4, percentView);
}

+ (STUIStatusBarIdentifier)chargingDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"chargingDisplayIdentifier"];
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() iconDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v9 = [(STUIStatusBarBatteryItem *)self batteryView];
  }
  else
  {
    id v6 = [(id)objc_opt_class() staticIconDisplayIdentifier];

    if (v6 == v4)
    {
      uint64_t v9 = [(STUIStatusBarBatteryItem *)self staticBatteryView];
    }
    else
    {
      id v7 = [(id)objc_opt_class() chargingDisplayIdentifier];

      if (v7 == v4)
      {
        uint64_t v9 = [(STUIStatusBarBatteryItem *)self chargingView];
      }
      else
      {
        id v8 = [(id)objc_opt_class() percentDisplayIdentifier];

        if (v8 == v4)
        {
          uint64_t v9 = [(STUIStatusBarBatteryItem *)self percentView];
        }
        else
        {
          v12.receiver = self;
          v12.super_class = (Class)STUIStatusBarBatteryItem;
          uint64_t v9 = [(STUIStatusBarItem *)&v12 viewForIdentifier:v4];
        }
      }
    }
  }
  v10 = (void *)v9;

  return v10;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v55.receiver = self;
  v55.super_class = (Class)STUIStatusBarBatteryItem;
  id v8 = [(STUIStatusBarItem *)&v55 applyUpdate:v6 toDisplayItem:v7];
  uint64_t v9 = [v6 data];
  v10 = [v9 mainBatteryEntry];

  v11 = [v7 identifier];
  uint64_t v12 = [(id)objc_opt_class() iconDisplayIdentifier];
  if (v11 == (void *)v12)
  {

LABEL_12:
    v24 = [v7 identifier];
    v25 = [(id)objc_opt_class() iconDisplayIdentifier];
    if (v24 == v25) {
      [(STUIStatusBarBatteryItem *)self batteryView];
    }
    else {
    v20 = [(STUIStatusBarBatteryItem *)self staticBatteryView];
    }

    v26 = [v6 styleAttributes];
    if (![v6 dataChanged])
    {
LABEL_26:
      if ([v6 styleAttributesChanged])
      {
        v31 = [v26 imageTintColor];
        [v20 setFillColor:v31];

        v32 = [v7 identifier];
        v33 = [(id)objc_opt_class() iconDisplayIdentifier];

        if (v32 == v33)
        {
          v34 = [v20 layer];
          [v34 setShouldRasterize:1];

          v35 = [v26 traitCollection];
          [v35 displayScale];
          double v37 = v36;
          v38 = [v20 layer];
          [v38 setRasterizationScale:v37];
        }
        uint64_t v39 = [v26 mode];
        double v40 = -0.333333333;
        if (v39 == 1) {
          double v40 = -1.0;
        }
        [v7 setBaselineOffset:v40];
      }
      goto LABEL_32;
    }
    uint64_t v27 = [v10 capacity];
    if ((double)v27 / 100.0 <= 0.01) {
      double v28 = 0.0;
    }
    else {
      double v28 = (double)v27 / 100.0;
    }
    unint64_t v29 = [v10 state];
    if (v29 <= 3) {
      [v20 setChargingState:qword_1D7ED63F0[v29]];
    }
    if ([(STUIStatusBarBatteryItem *)self usesCondensedPercentageDisplay]
      && [v26 mode] != 1)
    {
      if (![v10 prominentlyShowsDetailString])
      {
        v47 = +[STUIStatusBarSettingsDomain rootSettings];
        v48 = [v47 itemSettings];
        objc_msgSend(v20, "setShowsPercentage:", objc_msgSend(v48, "batteryCondensedPercentageForceEnabled"));

        goto LABEL_25;
      }
      uint64_t v30 = 1;
    }
    else
    {
      uint64_t v30 = 0;
    }
    [v20 setShowsPercentage:v30];
LABEL_25:
    [v20 setChargePercent:v28];
    objc_msgSend(v20, "setSaverModeActive:", objc_msgSend(v10, "saverModeActive"));
    goto LABEL_26;
  }
  v13 = (void *)v12;
  v14 = [v7 identifier];
  v15 = [(id)objc_opt_class() staticIconDisplayIdentifier];

  if (v14 == v15) {
    goto LABEL_12;
  }
  v16 = [v7 identifier];
  v17 = [(id)objc_opt_class() chargingDisplayIdentifier];

  if (v16 == v17)
  {
    if ([v7 isEnabled]) {
      BOOL v42 = [v10 state] == 1;
    }
    else {
      BOOL v42 = 0;
    }
    [v7 setEnabled:v42];
    if (![v7 isEnabled]) {
      goto LABEL_34;
    }
    v43 = [(STUIStatusBarBatteryItem *)self chargingView];
    v44 = [v43 image];

    if (v44) {
      goto LABEL_34;
    }
    v20 = +[STUIStatusBarImageProvider sharedProvider];
    v26 = [v6 styleAttributes];
    v45 = [v20 imageNamed:@"Large_Bolt" styleAttributes:v26];
    v46 = [(STUIStatusBarBatteryItem *)self chargingView];
    [v46 setImage:v45];

    goto LABEL_32;
  }
  v18 = [v7 identifier];
  v19 = [(id)objc_opt_class() percentDisplayIdentifier];

  if (v18 != v19) {
    goto LABEL_34;
  }
  v20 = [v10 detailString];
  v21 = [v6 styleAttributes];
  if ([v21 mode] == 1) {
    goto LABEL_8;
  }
  char v22 = [v10 prominentlyShowsDetailString];

  if ((v22 & 1) == 0)
  {
    v21 = v20;
    v20 = 0;
LABEL_8:
  }
  if ([v20 length])
  {
    v23 = [(STUIStatusBarBatteryItem *)self percentView];
    [v23 setText:v20];
  }
  else
  {
    [v7 setEnabled:0];
  }
  if (![v6 styleAttributesChanged]) {
    goto LABEL_33;
  }
  double v49 = *MEMORY[0x1E4FB2848];
  double v50 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v51 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v52 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v53 = [v6 styleAttributes];
  uint64_t v54 = [v53 effectiveLayoutDirection];

  if (v54 == 1) {
    double v50 = 2.0;
  }
  else {
    double v52 = 2.0;
  }
  v26 = [(STUIStatusBarBatteryItem *)self percentView];
  objc_msgSend(v26, "setAlignmentRectInsets:", v49, v50, v51, v52);
LABEL_32:

LABEL_33:
LABEL_34:

  return v8;
}

- (STUIStatusBarStaticBatteryView)staticBatteryView
{
  staticBatteryView = self->_staticBatteryView;
  if (!staticBatteryView)
  {
    [(STUIStatusBarBatteryItem *)self _create_staticBatteryView];
    staticBatteryView = self->_staticBatteryView;
  }
  return staticBatteryView;
}

- (BOOL)usesCondensedPercentageDisplay
{
  return self->_usesCondensedPercentageDisplay;
}

- (void)_create_staticBatteryView
{
  v3 = [STUIStatusBarStaticBatteryView alloc];
  id v4 = -[_UIBatteryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  staticBatteryView = self->_staticBatteryView;
  self->_staticBatteryView = v4;

  [(_UIBatteryView *)self->_staticBatteryView setInternalSizeCategory:0];
  id v6 = self->_staticBatteryView;
  [(_UIBatteryView *)v6 setShowsInlineChargingIndicator:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentView, 0);
  objc_storeStrong((id *)&self->_chargingView, 0);
  objc_storeStrong((id *)&self->_staticBatteryView, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    BOOL v3 = a3;
    self->_highlighted = a3;
    id v5 = [(STUIStatusBarBatteryItem *)self batteryView];
    if (v3)
    {
      [v5 setBodyColorAlpha:0.8];
      double v4 = 0.9;
    }
    else
    {
      [v5 setBodyColorAlpha:*MEMORY[0x1E4FB31A8]];
      double v4 = *MEMORY[0x1E4FB31B0];
    }
    [v5 setPinColorAlpha:v4];
    [v5 setShowsInlineChargingIndicator:!v3];
  }
}

- (STUIStatusBarBatteryView)batteryView
{
  batteryView = self->_batteryView;
  if (!batteryView)
  {
    [(STUIStatusBarBatteryItem *)self _create_batteryView];
    batteryView = self->_batteryView;
  }
  return batteryView;
}

- (void)_create_batteryView
{
  BOOL v3 = [STUIStatusBarBatteryView alloc];
  double v4 = -[_UIBatteryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  batteryView = self->_batteryView;
  self->_batteryView = v4;

  [(_UIBatteryView *)self->_batteryView setInternalSizeCategory:0];
  id v6 = self->_batteryView;
  [(_UIBatteryView *)v6 setShowsInlineChargingIndicator:1];
}

- (STUIStatusBarImageView)chargingView
{
  chargingView = self->_chargingView;
  if (!chargingView)
  {
    [(STUIStatusBarBatteryItem *)self _create_chargingView];
    chargingView = self->_chargingView;
  }
  return chargingView;
}

- (void)_create_chargingView
{
  BOOL v3 = [STUIStatusBarImageView alloc];
  double v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  chargingView = self->_chargingView;
  self->_chargingView = v4;

  id v6 = [MEMORY[0x1E4FB1818] kitImageNamed:@"Black_lightning"];
  [(STUIStatusBarImageView *)self->_chargingView setAccessibilityHUDImage:v6];
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setBatteryView:(id)a3
{
}

- (void)setStaticBatteryView:(id)a3
{
}

- (void)setChargingView:(id)a3
{
}

- (void)setPercentView:(id)a3
{
}

@end