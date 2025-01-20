@interface STUIStatusBarCellularItem
+ (STUIStatusBarIdentifier)callForwardingDisplayIdentifier;
+ (STUIStatusBarIdentifier)nameDisplayIdentifier;
+ (STUIStatusBarIdentifier)rawDisplayIdentifier;
+ (STUIStatusBarIdentifier)signalStrengthDisplayIdentifier;
+ (STUIStatusBarIdentifier)sosDisplayIdentifier;
+ (STUIStatusBarIdentifier)typeDisplayIdentifier;
+ (STUIStatusBarIdentifier)warningDisplayIdentifier;
+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6;
- (BOOL)_showCallFowardingForEntry:(id)a3;
- (BOOL)_updateSignalView:(id)a3 withUpdate:(id)a4 entry:(id)a5 forceShowingDisabledSignalBars:(BOOL)a6;
- (BOOL)marqueeServiceName;
- (BOOL)showsDisabledSignalBars;
- (NSString)cellularDataEntryKey;
- (STUIStatusBarCellularItem)initWithIdentifier:(id)a3 statusBar:(id)a4;
- (STUIStatusBarCellularItemTypeStringProvider)typeStringProvider;
- (STUIStatusBarCellularSignalView)signalView;
- (STUIStatusBarImageView)callForwardingView;
- (STUIStatusBarImageView)sosView;
- (STUIStatusBarImageView)warningView;
- (STUIStatusBarStringView)networkTypeView;
- (STUIStatusBarStringView)rawStringView;
- (STUIStatusBarStringView)serviceNameView;
- (id)_backgroundColorForUpdate:(id)a3 entry:(id)a4;
- (id)_fillColorForUpdate:(id)a3 entry:(id)a4;
- (id)_stringForCellularType:(int64_t)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (id)entryForDisplayItemWithIdentifier:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (void)_create_callForwardingView;
- (void)_create_networkTypeView;
- (void)_create_rawStringView;
- (void)_create_serviceNameView;
- (void)_create_signalView;
- (void)_create_sosView;
- (void)_create_warningView;
- (void)prepareAnimation:(id)a3 forDisplayItem:(id)a4;
- (void)setCallForwardingView:(id)a3;
- (void)setMarqueeServiceName:(BOOL)a3;
- (void)setNetworkTypeView:(id)a3;
- (void)setRawStringView:(id)a3;
- (void)setServiceNameView:(id)a3;
- (void)setShowsDisabledSignalBars:(BOOL)a3;
- (void)setSignalView:(id)a3;
- (void)setSosView:(id)a3;
- (void)setTypeStringProvider:(id)a3;
- (void)setWarningView:(id)a3;
- (void)setmarqueeServiceName:(BOOL)a3;
@end

@implementation STUIStatusBarCellularItem

- (id)dependentEntryKeys
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(STUIStatusBarCellularItem *)self cellularDataEntryKey];
  v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  int64_t v9 = a3 - a4;
  v10 = [a1 signalStrengthDisplayIdentifier];
  v11 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v10 priority:v9 + 6];

  v12 = [a1 warningDisplayIdentifier];
  v13 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v12 priority:v9 + 8];

  v14 = [a1 nameDisplayIdentifier];
  v15 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v14 priority:v9 + 2];

  v16 = [(objc_class *)a5 typeDisplayIdentifier];
  v17 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v16 priority:v9 + 4];
  v30[0] = v11;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v19 = [v17 requiringAnyPlacements:v18];

  v20 = [a1 callForwardingDisplayIdentifier];
  v21 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v20 priority:2];

  v22 = [a1 rawDisplayIdentifier];
  v23 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v22 priority:1];

  v29[0] = v11;
  v29[1] = v13;
  v29[2] = v23;
  v29[3] = v15;
  v29[4] = v19;
  v29[5] = v21;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:6];
  v25 = +[STUIStatusBarDisplayItemPlacementGroup groupWithPriority:a4 placements:v24];

  [v25 setSignalStrengthPlacement:v11];
  [v25 setWarningPlacement:v13];
  [v25 setNamePlacement:v15];
  [v25 setTypePlacement:v19];
  [v25 setCallForwardingPlacement:v21];
  [v25 setRawPlacement:v23];
  v28[0] = v11;
  v28[1] = v13;
  v28[2] = v23;
  v28[3] = v19;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  [v25 setPlacementsAffectedByAirplaneMode:v26];

  return v25;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)STUIStatusBarCellularItem;
  v8 = [(STUIStatusBarItem *)&v51 applyUpdate:v6 toDisplayItem:v7];
  int64_t v9 = [v7 identifier];
  v10 = [(STUIStatusBarCellularItem *)self entryForDisplayItemWithIdentifier:v9];

  v11 = [v7 identifier];
  v12 = [(id)objc_opt_class() signalStrengthDisplayIdentifier];

  if (v11 == v12)
  {
    v26 = [(STUIStatusBarCellularItem *)self signalView];
    BOOL v27 = [(STUIStatusBarCellularItem *)self _updateSignalView:v26 withUpdate:v6 entry:v10 forceShowingDisabledSignalBars:0];

    if ([v6 dataChanged] && v10) {
      [v7 setEnabled:v27];
    }
  }
  else
  {
    v13 = [v7 identifier];
    v14 = [(id)objc_opt_class() nameDisplayIdentifier];

    if (v13 == v14)
    {
      v28 = [v10 string];
      if ([v7 isEnabled] && objc_msgSend(v28, "length")) {
        uint64_t v29 = [v10 isBootstrapCellular] ^ 1;
      }
      else {
        uint64_t v29 = 0;
      }
      [v7 setEnabled:v29];
      if (![v7 isEnabled]) {
        goto LABEL_54;
      }
      v30 = [(STUIStatusBarCellularItem *)self serviceNameView];
      [v30 setText:v28];
      v31 = [v10 crossfadeString];
      [v30 setAlternateText:v31];

      [v30 setMarqueeRunning:1];
LABEL_53:

LABEL_54:
      goto LABEL_55;
    }
    v15 = [v7 identifier];
    v16 = [(id)objc_opt_class() typeDisplayIdentifier];

    if (v15 == v16)
    {
      if (!v10) {
        goto LABEL_55;
      }
      if ([v10 isEnabled])
      {
        v28 = -[STUIStatusBarCellularItem _stringForCellularType:](self, "_stringForCellularType:", [v10 type]);
        int v32 = [v7 isEnabled];
        uint64_t v33 = 0;
        if (v32 && v28) {
          uint64_t v33 = objc_msgSend(v10, "isBootstrapCellular", 0) ^ 1;
        }
      }
      else
      {
        [v7 isEnabled];
        v28 = 0;
        uint64_t v33 = 0;
      }
      [v7 setEnabled:v33];
      if (![v7 isEnabled]) {
        goto LABEL_54;
      }
      v36 = [(STUIStatusBarCellularItem *)self networkTypeView];
      goto LABEL_52;
    }
    v17 = [v7 identifier];
    v18 = [(id)objc_opt_class() sosDisplayIdentifier];

    if (v17 != v18)
    {
      v19 = [v7 identifier];
      v20 = [(id)objc_opt_class() warningDisplayIdentifier];

      if (v19 == v20)
      {
        if (!v10) {
          goto LABEL_55;
        }
        BOOL v35 = [v7 isEnabled] && (unint64_t)(objc_msgSend(v10, "status") == 4);
        [v7 setEnabled:v35];
        if (![v7 isEnabled]) {
          goto LABEL_55;
        }
        v45 = [(STUIStatusBarCellularItem *)self warningView];
        v46 = [v45 image];

        if (v46) {
          goto LABEL_55;
        }
        v28 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle.fill"];
        v47 = [(STUIStatusBarCellularItem *)self warningView];
      }
      else
      {
        v21 = [v7 identifier];
        v22 = [(id)objc_opt_class() callForwardingDisplayIdentifier];

        if (v21 != v22)
        {
          v23 = [v7 identifier];
          v24 = [(id)objc_opt_class() rawDisplayIdentifier];

          if (v23 != v24 || !v10) {
            goto LABEL_55;
          }
          uint64_t v25 = [v7 isEnabled] ? objc_msgSend(v10, "displayRawValue") : 0;
          [v7 setEnabled:v25];
          if (![v7 isEnabled]) {
            goto LABEL_55;
          }
          v28 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v10, "rawValue"));
          v36 = [(STUIStatusBarCellularItem *)self rawStringView];
LABEL_52:
          v30 = v36;
          [v36 setText:v28];
          goto LABEL_53;
        }
        if (!v10) {
          goto LABEL_55;
        }
        BOOL v44 = [v7 isEnabled]
           && [(STUIStatusBarCellularItem *)self _showCallFowardingForEntry:v10];
        [v7 setEnabled:v44];
        if (![v7 isEnabled]) {
          goto LABEL_55;
        }
        v49 = [(STUIStatusBarCellularItem *)self callForwardingView];
        v50 = [v49 image];

        if (v50) {
          goto LABEL_55;
        }
        v28 = [MEMORY[0x1E4FB1818] systemImageNamed:@"phone.fill.arrow.right"];
        v47 = [(STUIStatusBarCellularItem *)self callForwardingView];
      }
      v30 = v47;
      [v47 setImage:v28];
      goto LABEL_53;
    }
    if (v10)
    {
      BOOL v34 = [v7 isEnabled]
         && [v10 showsSOSWhenDisabled]
         && (unint64_t)([v10 status] == 1);
      [v7 setEnabled:v34];
      if ([v7 isEnabled])
      {
        v37 = [(STUIStatusBarCellularItem *)self sosView];
        v38 = [v37 image];

        if (!v38)
        {
          v39 = [MEMORY[0x1E4FB1818] systemImageNamed:@"sos"];
          v40 = [(STUIStatusBarCellularItem *)self sosView];
          [v40 setImage:v39];
        }
        int v41 = [v10 sosAvailable];
        double v42 = 0.3;
        if (v41) {
          double v42 = 1.0;
        }
        [v7 setViewAlpha:v42];
        v43 = [(STUIStatusBarCellularItem *)self sosView];
        [v43 setUseDisabledAppearanceForAccessibilityHUD:v41 ^ 1u];
      }
    }
  }
LABEL_55:

  return v8;
}

+ (STUIStatusBarIdentifier)signalStrengthDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"signalStrengthDisplayIdentifier"];
}

+ (STUIStatusBarIdentifier)warningDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"warningDisplayIdentifier"];
}

+ (STUIStatusBarIdentifier)nameDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"nameDisplayIdentifier"];
}

+ (STUIStatusBarIdentifier)typeDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"typeDisplayIdentifier"];
}

- (id)entryForDisplayItemWithIdentifier:(id)a3
{
  v4 = [(STUIStatusBarItem *)self statusBar];
  v5 = [v4 currentAggregatedData];
  id v6 = [(STUIStatusBarCellularItem *)self cellularDataEntryKey];
  id v7 = [v5 valueForKey:v6];

  return v7;
}

- (NSString)cellularDataEntryKey
{
  return (NSString *)(id)*MEMORY[0x1E4FA9740];
}

+ (STUIStatusBarIdentifier)sosDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"sosDisplayIdentifier"];
}

+ (STUIStatusBarIdentifier)rawDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"rawDisplayIdentifier"];
}

+ (STUIStatusBarIdentifier)callForwardingDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"callForwardingDisplayIdentifier"];
}

- (BOOL)_updateSignalView:(id)a3 withUpdate:(id)a4 entry:(id)a5 forceShowingDisabledSignalBars:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v11 styleAttributesChanged] & 1) != 0 || objc_msgSend(v11, "dataChanged"))
  {
    v13 = [(STUIStatusBarCellularItem *)self _backgroundColorForUpdate:v11 entry:v12];
    [v10 setInactiveColor:v13];

    v14 = [(STUIStatusBarCellularItem *)self _fillColorForUpdate:v11 entry:v12];
    [v10 setActiveColor:v14];
  }
  if (![v11 dataChanged]) {
    goto LABEL_22;
  }
  if ([v12 isEnabled]) {
    int v15 = [v12 status] != 4;
  }
  else {
    int v15 = 0;
  }
  uint64_t v16 = [v10 signalMode];
  switch([v12 status])
  {
    case 0:
      [v12 isBootstrapCellular];
      goto LABEL_22;
    case 1:
      int v17 = self->_showsDisabledSignalBars || v6;
      v15 &= v17;
      if (v17) {
        uint64_t v16 = 0;
      }
      break;
    case 2:
      uint64_t v16 = 0;
      break;
    case 3:
      uint64_t v16 = 1;
      break;
    case 5:
      uint64_t v16 = 2;
      break;
    default:
      break;
  }
  if (![v12 isBootstrapCellular] || !v15)
  {
    if (!v15) {
      goto LABEL_22;
    }
LABEL_24:
    [v10 setSignalMode:v16];
    objc_msgSend(v10, "setNumberOfActiveBars:", objc_msgSend(v12, "displayValue"));
    BOOL v18 = 1;
    goto LABEL_25;
  }
  if ([v12 status] == 5) {
    goto LABEL_24;
  }
LABEL_22:
  BOOL v18 = 0;
LABEL_25:

  return v18;
}

- (id)_fillColorForUpdate:(id)a3 entry:(id)a4
{
  id v5 = a3;
  if ([a4 lowDataModeActive])
  {
    BOOL v6 = [MEMORY[0x1E4FB1618] systemYellowColor];
  }
  else
  {
    id v7 = [v5 styleAttributes];
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
    BOOL v6 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [v6 colorWithAlphaComponent:0.3];
  }
  else
  {
    BOOL v6 = [v5 styleAttributes];
    [v6 imageDimmedTintColor];
  id v7 = };

  return v7;
}

- (void)setTypeStringProvider:(id)a3
{
}

- (STUIStatusBarImageView)sosView
{
  sosView = self->_sosView;
  if (!sosView)
  {
    [(STUIStatusBarCellularItem *)self _create_sosView];
    sosView = self->_sosView;
  }
  return sosView;
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() signalStrengthDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v12 = [(STUIStatusBarCellularItem *)self signalView];
  }
  else
  {
    id v6 = [(id)objc_opt_class() nameDisplayIdentifier];

    if (v6 == v4)
    {
      uint64_t v12 = [(STUIStatusBarCellularItem *)self serviceNameView];
    }
    else
    {
      id v7 = [(id)objc_opt_class() typeDisplayIdentifier];

      if (v7 == v4)
      {
        uint64_t v12 = [(STUIStatusBarCellularItem *)self networkTypeView];
      }
      else
      {
        id v8 = [(id)objc_opt_class() sosDisplayIdentifier];

        if (v8 == v4)
        {
          uint64_t v12 = [(STUIStatusBarCellularItem *)self sosView];
        }
        else
        {
          id v9 = [(id)objc_opt_class() warningDisplayIdentifier];

          if (v9 == v4)
          {
            uint64_t v12 = [(STUIStatusBarCellularItem *)self warningView];
          }
          else
          {
            id v10 = [(id)objc_opt_class() callForwardingDisplayIdentifier];

            if (v10 == v4)
            {
              uint64_t v12 = [(STUIStatusBarCellularItem *)self callForwardingView];
            }
            else
            {
              id v11 = [(id)objc_opt_class() rawDisplayIdentifier];

              if (v11 == v4)
              {
                uint64_t v12 = [(STUIStatusBarCellularItem *)self rawStringView];
              }
              else
              {
                v15.receiver = self;
                v15.super_class = (Class)STUIStatusBarCellularItem;
                uint64_t v12 = [(STUIStatusBarItem *)&v15 viewForIdentifier:v4];
              }
            }
          }
        }
      }
    }
  }
  v13 = (void *)v12;

  return v13;
}

- (void)_create_sosView
{
  v3 = [STUIStatusBarImageView alloc];
  id v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  sosView = self->_sosView;
  self->_sosView = v4;
  MEMORY[0x1F41817F8](v4, sosView);
}

- (STUIStatusBarCellularSignalView)signalView
{
  signalView = self->_signalView;
  if (!signalView)
  {
    [(STUIStatusBarCellularItem *)self _create_signalView];
    signalView = self->_signalView;
  }
  return signalView;
}

- (void)_create_signalView
{
  v3 = [STUIStatusBarCellularSignalView alloc];
  id v4 = -[STUIStatusBarCellularSignalView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  signalView = self->_signalView;
  self->_signalView = v4;

  id v6 = self->_signalView;
  [(STUIStatusBarSignalView *)v6 setNumberOfBars:4];
}

- (STUIStatusBarCellularItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarCellularItem;
  id v4 = [(STUIStatusBarItem *)&v6 initWithIdentifier:a3 statusBar:a4];
  [(STUIStatusBarCellularItem *)v4 setShowsDisabledSignalBars:1];
  [(STUIStatusBarCellularItem *)v4 setMarqueeServiceName:1];
  return v4;
}

- (void)setShowsDisabledSignalBars:(BOOL)a3
{
  self->_showsDisabledSignalBars = a3;
}

- (void)setMarqueeServiceName:(BOOL)a3
{
  self->_marqueeServiceName = a3;
}

- (STUIStatusBarStringView)networkTypeView
{
  networkTypeView = self->_networkTypeView;
  if (!networkTypeView)
  {
    [(STUIStatusBarCellularItem *)self _create_networkTypeView];
    networkTypeView = self->_networkTypeView;
  }
  return networkTypeView;
}

- (void)_create_networkTypeView
{
  v3 = [STUIStatusBarStringView alloc];
  id v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  networkTypeView = self->_networkTypeView;
  self->_networkTypeView = v4;

  objc_super v6 = self->_networkTypeView;
  [(STUIStatusBarStringView *)v6 setLineBreakMode:2];
}

- (STUIStatusBarImageView)callForwardingView
{
  callForwardingView = self->_callForwardingView;
  if (!callForwardingView)
  {
    [(STUIStatusBarCellularItem *)self _create_callForwardingView];
    callForwardingView = self->_callForwardingView;
  }
  return callForwardingView;
}

- (void)_create_callForwardingView
{
  v3 = [STUIStatusBarImageView alloc];
  id v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  callForwardingView = self->_callForwardingView;
  self->_callForwardingView = v4;
  MEMORY[0x1F41817F8](v4, callForwardingView);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawStringView, 0);
  objc_storeStrong((id *)&self->_callForwardingView, 0);
  objc_storeStrong((id *)&self->_warningView, 0);
  objc_storeStrong((id *)&self->_sosView, 0);
  objc_storeStrong((id *)&self->_networkTypeView, 0);
  objc_storeStrong((id *)&self->_signalView, 0);
  objc_storeStrong((id *)&self->_serviceNameView, 0);
  objc_destroyWeak((id *)&self->_typeStringProvider);
}

- (id)_stringForCellularType:(int64_t)a3
{
  p_typeStringProvider = &self->_typeStringProvider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_typeStringProvider);

  if (!WeakRetained
    || (id v6 = objc_loadWeakRetained((id *)p_typeStringProvider),
        [v6 stringForCellularType:a3 condensed:0],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v9 = v8;
    switch(a3)
    {
      case 1:
        id v10 = @"1x[statusBarDataNetwork]";
        id v11 = @"1x";
        goto LABEL_20;
      case 2:
        id v10 = @"GPRS";
        goto LABEL_19;
      case 3:
        id v10 = @"EDGE";
        goto LABEL_19;
      case 4:
        id v10 = @"3G";
        goto LABEL_19;
      case 5:
        id v10 = @"4G";
        goto LABEL_19;
      case 6:
        id v10 = @"LTE";
        goto LABEL_19;
      case 7:
        id v10 = @"5GE";
        id v11 = @"5G   ";
        goto LABEL_20;
      case 8:
        id v10 = @"LTE-A";
        goto LABEL_19;
      case 9:
        id v10 = @"LTE+";
        goto LABEL_19;
      case 10:
        id v10 = @"5G";
        goto LABEL_19;
      case 11:
        id v10 = @"5G+";
        goto LABEL_19;
      case 12:
        id v10 = @"5GUW";
        id v11 = @"5G";
        goto LABEL_20;
      case 13:
        id v10 = @"5GUC";
        id v11 = @"5G";
        goto LABEL_20;
      case 14:
        id v10 = @"SAT";
LABEL_19:
        id v11 = &stru_1F2F86950;
        goto LABEL_20;
      case 15:
        id v10 = @"5GA";
        id v11 = @"5Gᴀ";
LABEL_20:
        id v7 = [v8 localizedStringForKey:v10 value:v11 table:0];
        break;
      default:
        id v7 = 0;
        break;
    }
  }
  return v7;
}

- (BOOL)_showCallFowardingForEntry:(id)a3
{
  return [a3 callForwardingEnabled];
}

- (void)prepareAnimation:(id)a3 forDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] == 1)
  {
    id v8 = [v7 identifier];
    id v9 = [(id)objc_opt_class() nameDisplayIdentifier];

    if (v8 == v9)
    {
      id v10 = [(STUIStatusBarCellularItem *)self serviceNameView];
      [v10 setMarqueeRunning:0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __61__STUIStatusBarCellularItem_prepareAnimation_forDisplayItem___block_invoke;
      v12[3] = &unk_1E6AA36C8;
      id v13 = v10;
      id v11 = v10;
      [v6 addCompletionHandler:v12];
    }
  }
}

uint64_t __61__STUIStatusBarCellularItem_prepareAnimation_forDisplayItem___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) setMarqueeRunning:1];
  }
  return result;
}

- (STUIStatusBarStringView)serviceNameView
{
  serviceNameView = self->_serviceNameView;
  if (!serviceNameView)
  {
    [(STUIStatusBarCellularItem *)self _create_serviceNameView];
    serviceNameView = self->_serviceNameView;
  }
  return serviceNameView;
}

- (void)_create_serviceNameView
{
  v3 = [STUIStatusBarStringView alloc];
  id v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  serviceNameView = self->_serviceNameView;
  self->_serviceNameView = v4;

  [(STUIStatusBarStringView *)self->_serviceNameView setNumberOfLines:1];
  [(STUIStatusBarStringView *)self->_serviceNameView setFontStyle:0];
  id v6 = self->_serviceNameView;
  if (self->_marqueeServiceName) {
    [(STUIStatusBarStringView *)v6 setMarqueeEnabled:1];
  }
  else {
    [(STUIStatusBarStringView *)v6 setLineBreakMode:4];
  }
  id v8 = self->_serviceNameView;
  LODWORD(v7) = 1132068864;
  [(STUIStatusBarStringView *)v8 setContentCompressionResistancePriority:0 forAxis:v7];
}

- (STUIStatusBarImageView)warningView
{
  warningView = self->_warningView;
  if (!warningView)
  {
    [(STUIStatusBarCellularItem *)self _create_warningView];
    warningView = self->_warningView;
  }
  return warningView;
}

- (void)_create_warningView
{
  v3 = [STUIStatusBarImageView alloc];
  id v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  warningView = self->_warningView;
  self->_warningView = v4;
  MEMORY[0x1F41817F8](v4, warningView);
}

- (STUIStatusBarStringView)rawStringView
{
  rawStringView = self->_rawStringView;
  if (!rawStringView)
  {
    [(STUIStatusBarCellularItem *)self _create_rawStringView];
    rawStringView = self->_rawStringView;
  }
  return rawStringView;
}

- (void)_create_rawStringView
{
  v3 = [STUIStatusBarStringView alloc];
  id v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  rawStringView = self->_rawStringView;
  self->_rawStringView = v4;
  MEMORY[0x1F41817F8](v4, rawStringView);
}

- (void)setmarqueeServiceName:(BOOL)a3
{
  if (self->_marqueeServiceName != a3)
  {
    self->_marqueeServiceName = a3;
    serviceNameView = self->_serviceNameView;
    if (serviceNameView)
    {
      if (a3)
      {
        [(STUIStatusBarStringView *)serviceNameView setMarqueeEnabled:1];
      }
      else
      {
        -[STUIStatusBarStringView setMarqueeEnabled:](serviceNameView, "setMarqueeEnabled:");
        id v5 = self->_serviceNameView;
        [(STUIStatusBarStringView *)v5 setLineBreakMode:4];
      }
    }
  }
}

- (BOOL)showsDisabledSignalBars
{
  return self->_showsDisabledSignalBars;
}

- (BOOL)marqueeServiceName
{
  return self->_marqueeServiceName;
}

- (STUIStatusBarCellularItemTypeStringProvider)typeStringProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_typeStringProvider);
  return (STUIStatusBarCellularItemTypeStringProvider *)WeakRetained;
}

- (void)setServiceNameView:(id)a3
{
}

- (void)setSignalView:(id)a3
{
}

- (void)setNetworkTypeView:(id)a3
{
}

- (void)setSosView:(id)a3
{
}

- (void)setWarningView:(id)a3
{
}

- (void)setCallForwardingView:(id)a3
{
}

- (void)setRawStringView:(id)a3
{
}

@end