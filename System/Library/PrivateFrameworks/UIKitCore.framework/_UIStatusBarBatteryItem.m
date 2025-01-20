@interface _UIStatusBarBatteryItem
+ (_UIStatusBarIdentifier)chargingDisplayIdentifier;
+ (_UIStatusBarIdentifier)iconDisplayIdentifier;
+ (_UIStatusBarIdentifier)percentDisplayIdentifier;
+ (_UIStatusBarIdentifier)staticIconDisplayIdentifier;
- (BOOL)highlighted;
- (BOOL)usesCondensedPercentageDisplay;
- (_UIStatusBarBatteryView)batteryView;
- (_UIStatusBarImageView)chargingView;
- (_UIStatusBarStaticBatteryView)staticBatteryView;
- (_UIStatusBarStringView)percentView;
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

@implementation _UIStatusBarBatteryItem

+ (_UIStatusBarIdentifier)iconDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"iconDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)staticIconDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"staticIconDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)chargingDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"chargingDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)percentDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"percentDisplayIdentifier"];
}

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"mainBatteryEntry"];
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)_UIStatusBarBatteryItem;
  v8 = [(_UIStatusBarItem *)&v54 applyUpdate:v6 toDisplayItem:v7];
  v9 = [v6 data];
  v10 = [v9 mainBatteryEntry];

  v11 = [v7 identifier];
  uint64_t v12 = [(id)objc_opt_class() iconDisplayIdentifier];
  if (v11 == (void *)v12)
  {

    goto LABEL_12;
  }
  v13 = (void *)v12;
  v14 = [v7 identifier];
  v15 = [(id)objc_opt_class() staticIconDisplayIdentifier];

  if (v14 == v15)
  {
LABEL_12:
    v24 = [v7 identifier];
    v25 = [(id)objc_opt_class() iconDisplayIdentifier];
    if (v24 == v25) {
      [(_UIStatusBarBatteryItem *)self batteryView];
    }
    else {
    v20 = [(_UIStatusBarBatteryItem *)self staticBatteryView];
    }

    v26 = [v6 styleAttributes];
    if ([v6 dataChanged])
    {
      uint64_t v27 = [v10 capacity];
      if ((double)v27 / 100.0 <= 0.01) {
        double v28 = 0.0;
      }
      else {
        double v28 = (double)v27 / 100.0;
      }
      unint64_t v29 = [v10 state];
      if (v29 <= 3) {
        [v20 setChargingState:qword_186B9C348[v29]];
      }
      if ([(_UIStatusBarBatteryItem *)self usesCondensedPercentageDisplay]
        && [v26 mode] != 1)
      {
        if ([v10 prominentlyShowsDetailString])
        {
          uint64_t v30 = 1;
        }
        else
        {
          if (_UIInternalPreferencesRevisionOnce != -1) {
            dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
          }
          if (_UIInternalPreferencesRevisionVar < 1
            || (int v52 = _UIInternalPreference_StatusBarBatteryCondensedPercentageForceEnabled,
                _UIInternalPreferencesRevisionVar == _UIInternalPreference_StatusBarBatteryCondensedPercentageForceEnabled))
          {
            BOOL v47 = 0;
          }
          else
          {
            int v53 = _UIInternalPreferencesRevisionVar;
            do
            {
              BOOL v47 = v53 < v52;
              if (v53 < v52) {
                break;
              }
              _UIInternalPreferenceSync(v53, &_UIInternalPreference_StatusBarBatteryCondensedPercentageForceEnabled, @"StatusBarBatteryCondensedPercentageForceEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
              int v52 = _UIInternalPreference_StatusBarBatteryCondensedPercentageForceEnabled;
            }
            while (v53 != _UIInternalPreference_StatusBarBatteryCondensedPercentageForceEnabled);
          }
          if (byte_1E8FD5444) {
            uint64_t v30 = v47;
          }
          else {
            uint64_t v30 = 0;
          }
        }
      }
      else
      {
        uint64_t v30 = 0;
      }
      [v20 setShowsPercentage:v30];
      [v20 setChargePercent:v28];
      objc_msgSend(v20, "setSaverModeActive:", objc_msgSend(v10, "saverModeActive"));
    }
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
    goto LABEL_31;
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
      goto LABEL_33;
    }
    v43 = [(_UIStatusBarBatteryItem *)self chargingView];
    v44 = [v43 image];

    if (v44) {
      goto LABEL_33;
    }
    v20 = +[_UIStatusBarImageProvider sharedProvider];
    v26 = [v6 styleAttributes];
    v45 = [v20 imageNamed:@"Large_Bolt" styleAttributes:v26];
    v46 = [(_UIStatusBarBatteryItem *)self chargingView];
    [v46 setImage:v45];

    goto LABEL_31;
  }
  v18 = [v7 identifier];
  v19 = [(id)objc_opt_class() percentDisplayIdentifier];

  if (v18 != v19) {
    goto LABEL_33;
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
    v23 = [(_UIStatusBarBatteryItem *)self percentView];
    [v23 setText:v20];
  }
  else
  {
    [v7 setEnabled:0];
  }
  if (![v6 styleAttributesChanged]) {
    goto LABEL_32;
  }
  v48 = [v6 styleAttributes];
  uint64_t v49 = [v48 effectiveLayoutDirection];

  if (v49 == 1) {
    double v50 = 2.0;
  }
  else {
    double v50 = 0.0;
  }
  if (v49 == 1) {
    double v51 = 0.0;
  }
  else {
    double v51 = 2.0;
  }
  v26 = [(_UIStatusBarBatteryItem *)self percentView];
  objc_msgSend(v26, "setAlignmentRectInsets:", 0.0, v50, 0.0, v51);
LABEL_31:

LABEL_32:
LABEL_33:

  return v8;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    BOOL v3 = a3;
    self->_highlighted = a3;
    v4 = [(_UIStatusBarBatteryItem *)self batteryView];
    id v7 = v4;
    double v5 = 0.4;
    if (v3)
    {
      double v5 = 0.8;
      double v6 = 0.9;
    }
    else
    {
      double v6 = 0.5;
    }
    [v4 setBodyColorAlpha:v5];
    [v7 setPinColorAlpha:v6];
    [v7 setShowsInlineChargingIndicator:!v3];
  }
}

- (_UIStatusBarBatteryView)batteryView
{
  batteryView = self->_batteryView;
  if (!batteryView)
  {
    [(_UIStatusBarBatteryItem *)self _create_batteryView];
    batteryView = self->_batteryView;
  }
  return batteryView;
}

- (void)_create_batteryView
{
  BOOL v3 = [_UIStatusBarBatteryView alloc];
  v4 = -[_UIStatusBarBatteryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  batteryView = self->_batteryView;
  self->_batteryView = v4;

  [(_UIStatusBarBatteryView *)self->_batteryView setInternalSizeCategory:0];
  double v6 = self->_batteryView;
  [(_UIStatusBarBatteryView *)v6 setShowsInlineChargingIndicator:1];
}

- (_UIStatusBarStaticBatteryView)staticBatteryView
{
  staticBatteryView = self->_staticBatteryView;
  if (!staticBatteryView)
  {
    [(_UIStatusBarBatteryItem *)self _create_staticBatteryView];
    staticBatteryView = self->_staticBatteryView;
  }
  return staticBatteryView;
}

- (void)_create_staticBatteryView
{
  BOOL v3 = [_UIStatusBarStaticBatteryView alloc];
  v4 = -[_UIStatusBarBatteryView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  staticBatteryView = self->_staticBatteryView;
  self->_staticBatteryView = v4;

  [(_UIStatusBarBatteryView *)self->_staticBatteryView setInternalSizeCategory:0];
  double v6 = self->_staticBatteryView;
  [(_UIStatusBarBatteryView *)v6 setShowsInlineChargingIndicator:1];
}

- (_UIStatusBarImageView)chargingView
{
  chargingView = self->_chargingView;
  if (!chargingView)
  {
    [(_UIStatusBarBatteryItem *)self _create_chargingView];
    chargingView = self->_chargingView;
  }
  return chargingView;
}

- (void)_create_chargingView
{
  BOOL v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  chargingView = self->_chargingView;
  self->_chargingView = v4;

  id v6 = +[UIImage kitImageNamed:@"Black_lightning"];
  [(_UIStatusBarImageView *)self->_chargingView setAccessibilityHUDImage:v6];
}

- (_UIStatusBarStringView)percentView
{
  percentView = self->_percentView;
  if (!percentView)
  {
    [(_UIStatusBarBatteryItem *)self _create_percentView];
    percentView = self->_percentView;
  }
  return percentView;
}

- (void)_create_percentView
{
  BOOL v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  percentView = self->_percentView;
  self->_percentView = v4;
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() iconDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v9 = [(_UIStatusBarBatteryItem *)self batteryView];
  }
  else
  {
    id v6 = [(id)objc_opt_class() staticIconDisplayIdentifier];

    if (v6 == v4)
    {
      uint64_t v9 = [(_UIStatusBarBatteryItem *)self staticBatteryView];
    }
    else
    {
      id v7 = [(id)objc_opt_class() chargingDisplayIdentifier];

      if (v7 == v4)
      {
        uint64_t v9 = [(_UIStatusBarBatteryItem *)self chargingView];
      }
      else
      {
        id v8 = [(id)objc_opt_class() percentDisplayIdentifier];

        if (v8 == v4)
        {
          uint64_t v9 = [(_UIStatusBarBatteryItem *)self percentView];
        }
        else
        {
          v12.receiver = self;
          v12.super_class = (Class)_UIStatusBarBatteryItem;
          uint64_t v9 = [(_UIStatusBarItem *)&v12 viewForIdentifier:v4];
        }
      }
    }
  }
  v10 = (void *)v9;

  return v10;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (BOOL)usesCondensedPercentageDisplay
{
  return self->_usesCondensedPercentageDisplay;
}

- (void)setUsesCondensedPercentageDisplay:(BOOL)a3
{
  self->_usesCondensedPercentageDisplay = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentView, 0);
  objc_storeStrong((id *)&self->_chargingView, 0);
  objc_storeStrong((id *)&self->_staticBatteryView, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
}

@end