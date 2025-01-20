@interface _UIStatusBarWifiItem
+ (_UIStatusBarIdentifier)iconDisplayIdentifier;
+ (_UIStatusBarIdentifier)rawDisplayIdentifier;
+ (_UIStatusBarIdentifier)signalStrengthDisplayIdentifier;
+ (id)groupWithPriority:(int64_t)a3;
- (_UIStatusBarImageView)networkIconView;
- (_UIStatusBarStringView)rawStringView;
- (_UIStatusBarWifiSignalView)signalView;
- (double)_barThicknessForUpdate:(id)a3;
- (double)_interspaceForUpdate:(id)a3;
- (double)_totalWidthForUpdate:(id)a3;
- (id)_backgroundColorForUpdate:(id)a3 entry:(id)a4;
- (id)_fillColorForUpdate:(id)a3 entry:(id)a4;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (id)viewForIdentifier:(id)a3;
- (int64_t)_barCountForUpdate:(id)a3;
- (void)_create_networkIconView;
- (void)_create_rawStringView;
- (void)_create_signalView;
- (void)setNetworkIconView:(id)a3;
- (void)setRawStringView:(id)a3;
- (void)setSignalView:(id)a3;
@end

@implementation _UIStatusBarWifiItem

+ (_UIStatusBarIdentifier)signalStrengthDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"signalStrengthDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)iconDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"iconDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)rawDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"rawDisplayIdentifier"];
}

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"wifiEntry"];
}

- (int64_t)_barCountForUpdate:(id)a3
{
  return 3;
}

- (double)_barThicknessForUpdate:(id)a3
{
  v3 = [a3 styleAttributes];
  v4 = [v3 traitCollection];
  [v4 displayScale];
  double v6 = v5;

  double result = 2.5;
  if (v6 > 2.5) {
    return 2.66666667;
  }
  return result;
}

- (double)_interspaceForUpdate:(id)a3
{
  v3 = [a3 styleAttributes];
  v4 = [v3 traitCollection];
  [v4 displayScale];
  double v6 = v5;

  double result = 1.66666667;
  if (v6 <= 2.5) {
    return 1.5;
  }
  return result;
}

- (double)_totalWidthForUpdate:(id)a3
{
  v3 = [a3 styleAttributes];
  v4 = [v3 traitCollection];
  [v4 displayScale];
  BOOL v6 = v5 > 2.5;

  return dbl_186B9C380[v6];
}

- (id)_fillColorForUpdate:(id)a3 entry:(id)a4
{
  id v5 = a3;
  if ([a4 lowDataModeActive])
  {
    BOOL v6 = +[UIColor systemYellowColor];
  }
  else
  {
    v7 = [v5 styleAttributes];
    v8 = [v7 imageTintColor];
    BOOL v6 = [v8 colorWithAlphaComponent:1.0];
  }
  return v6;
}

- (id)_backgroundColorForUpdate:(id)a3 entry:(id)a4
{
  id v5 = a3;
  if ([a4 lowDataModeActive])
  {
    BOOL v6 = +[UIColor systemYellowColor];
    [v6 colorWithAlphaComponent:0.3];
  }
  else
  {
    BOOL v6 = [v5 styleAttributes];
    [v6 imageDimmedTintColor];
  v7 = };

  return v7;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)_UIStatusBarWifiItem;
  v8 = [(_UIStatusBarItem *)&v33 applyUpdate:v6 toDisplayItem:v7];
  v9 = [v6 data];
  v10 = [v9 wifiEntry];

  v11 = [v7 identifier];
  v12 = [(id)objc_opt_class() signalStrengthDisplayIdentifier];

  if (v11 == v12)
  {
    BOOL v18 = [v7 isEnabled]
       && [v10 isEnabled]
       && [v10 type] != 1;
    [v7 setEnabled:v18];
    v19 = [(_UIStatusBarWifiItem *)self signalView];
    if ([v7 isEnabled])
    {
      if (([v6 styleAttributesChanged] & 1) != 0 || objc_msgSend(v6, "dataChanged"))
      {
        v20 = [(_UIStatusBarWifiItem *)self _backgroundColorForUpdate:v6 entry:v10];
        [v19 setInactiveColor:v20];

        v21 = [(_UIStatusBarWifiItem *)self _fillColorForUpdate:v6 entry:v10];
        [v19 setActiveColor:v21];
      }
      if ([v6 styleAttributesChanged])
      {
        v22 = [v6 styleAttributes];
        uint64_t v23 = [v22 mode];
        double v24 = -0.666666667;
        if (v23 != 1) {
          double v24 = 0.0;
        }
        [v7 setBaselineOffset:v24];
      }
      if ([v6 dataChanged])
      {
        uint64_t v25 = 0;
        int v26 = 0;
        switch([v10 status])
        {
          case 0:
          case 1:
          case 4:
            [v7 setEnabled:0];
            int v26 = 0;
            uint64_t v25 = 0;
            break;
          case 3:
            int v26 = 0;
            uint64_t v25 = 1;
            break;
          case 5:
            int v26 = 1;
            uint64_t v25 = 2;
            break;
          default:
            break;
        }
        if ([v7 isEnabled])
        {
          uint64_t v31 = [v10 displayValue];
          if (v26) {
            [v19 setNumberOfActiveBars:v31];
          }
          [v19 setSignalMode:v25];
        }
      }
    }
    goto LABEL_45;
  }
  v13 = [v7 identifier];
  v14 = [(id)objc_opt_class() iconDisplayIdentifier];

  if (v13 == v14)
  {
    if ([v7 isEnabled]) {
      uint64_t v27 = [v10 isEnabled];
    }
    else {
      uint64_t v27 = 0;
    }
    [v7 setEnabled:v27];
    if (![v7 isEnabled]) {
      goto LABEL_46;
    }
    uint64_t v28 = [v10 status];
    switch(v28)
    {
      case 5:
        if ([v10 type] == 1)
        {
          v29 = @"personalhotspot";
          goto LABEL_36;
        }
        break;
      case 4:
        v29 = @"wifi.exclamationmark";
        goto LABEL_36;
      case 1:
        v29 = @"wifi.slash";
LABEL_36:
        v19 = +[UIImage systemImageNamed:v29];
        v30 = [(_UIStatusBarWifiItem *)self networkIconView];
        [v30 setImage:v19];
        goto LABEL_37;
    }
    [v7 setEnabled:0];
    goto LABEL_46;
  }
  v15 = [v7 identifier];
  v16 = [(id)objc_opt_class() rawDisplayIdentifier];

  if (v15 == v16)
  {
    uint64_t v17 = [v7 isEnabled] && objc_msgSend(v10, "isEnabled")
        ? [v10 displayRawValue]
        : 0;
    [v7 setEnabled:v17];
    if ([v7 isEnabled])
    {
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v10, "rawValue"));
      v30 = [(_UIStatusBarWifiItem *)self rawStringView];
      [v30 setText:v19];
LABEL_37:

LABEL_45:
    }
  }
LABEL_46:

  return v8;
}

- (_UIStatusBarWifiSignalView)signalView
{
  signalView = self->_signalView;
  if (!signalView)
  {
    [(_UIStatusBarWifiItem *)self _create_signalView];
    signalView = self->_signalView;
  }
  return signalView;
}

- (void)_create_signalView
{
  v3 = [_UIStatusBarWifiSignalView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  signalView = self->_signalView;
  self->_signalView = v4;

  id v6 = self->_signalView;
  [(_UIStatusBarSignalView *)v6 setNumberOfBars:3];
}

- (_UIStatusBarImageView)networkIconView
{
  networkIconView = self->_networkIconView;
  if (!networkIconView)
  {
    [(_UIStatusBarWifiItem *)self _create_networkIconView];
    networkIconView = self->_networkIconView;
  }
  return networkIconView;
}

- (void)_create_networkIconView
{
  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  networkIconView = self->_networkIconView;
  self->_networkIconView = v4;
}

- (_UIStatusBarStringView)rawStringView
{
  rawStringView = self->_rawStringView;
  if (!rawStringView)
  {
    [(_UIStatusBarWifiItem *)self _create_rawStringView];
    rawStringView = self->_rawStringView;
  }
  return rawStringView;
}

- (void)_create_rawStringView
{
  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  rawStringView = self->_rawStringView;
  self->_rawStringView = v4;
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() signalStrengthDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v8 = [(_UIStatusBarWifiItem *)self signalView];
  }
  else
  {
    id v6 = [(id)objc_opt_class() iconDisplayIdentifier];

    if (v6 == v4)
    {
      uint64_t v8 = [(_UIStatusBarWifiItem *)self networkIconView];
    }
    else
    {
      id v7 = [(id)objc_opt_class() rawDisplayIdentifier];

      if (v7 == v4)
      {
        uint64_t v8 = [(_UIStatusBarWifiItem *)self rawStringView];
      }
      else
      {
        v11.receiver = self;
        v11.super_class = (Class)_UIStatusBarWifiItem;
        uint64_t v8 = [(_UIStatusBarItem *)&v11 viewForIdentifier:v4];
      }
    }
  }
  v9 = (void *)v8;

  return v9;
}

- (void)setSignalView:(id)a3
{
}

- (void)setNetworkIconView:(id)a3
{
}

- (void)setRawStringView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawStringView, 0);
  objc_storeStrong((id *)&self->_networkIconView, 0);
  objc_storeStrong((id *)&self->_signalView, 0);
}

+ (id)groupWithPriority:(int64_t)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = [a1 signalStrengthDisplayIdentifier];
  id v6 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v5 priority:2];

  id v7 = [a1 iconDisplayIdentifier];
  uint64_t v8 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v7 priority:3];
  v17[0] = v6;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v10 = [v8 excludingPlacements:v9];

  objc_super v11 = [a1 rawDisplayIdentifier];
  v12 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v11 priority:1];

  v16[0] = v6;
  v16[1] = v10;
  v16[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
  v14 = +[_UIStatusBarDisplayItemPlacementGroup groupWithPriority:a3 placements:v13];

  [v14 setSignalStrengthPlacement:v6];
  [v14 setIconPlacement:v10];
  [v14 setRawPlacement:v12];

  return v14;
}

@end