@interface _UIStatusBarCellularItem
+ (_UIStatusBarIdentifier)callForwardingDisplayIdentifier;
+ (_UIStatusBarIdentifier)nameDisplayIdentifier;
+ (_UIStatusBarIdentifier)rawDisplayIdentifier;
+ (_UIStatusBarIdentifier)signalStrengthDisplayIdentifier;
+ (_UIStatusBarIdentifier)typeDisplayIdentifier;
+ (_UIStatusBarIdentifier)warningDisplayIdentifier;
+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6;
- (BOOL)_showCallFowardingForEntry:(id)a3;
- (BOOL)_updateSignalView:(id)a3 withUpdate:(id)a4 entry:(id)a5 forceShowingDisabledSignalBars:(BOOL)a6;
- (BOOL)marqueeServiceName;
- (BOOL)showsDisabledSignalBars;
- (NSString)cellularDataEntryKey;
- (_UIStatusBarCellularItem)initWithIdentifier:(id)a3 statusBar:(id)a4;
- (_UIStatusBarCellularItemTypeStringProvider)typeStringProvider;
- (_UIStatusBarCellularSignalView)signalView;
- (_UIStatusBarImageView)callForwardingView;
- (_UIStatusBarImageView)warningView;
- (_UIStatusBarStringView)networkTypeView;
- (_UIStatusBarStringView)rawStringView;
- (_UIStatusBarStringView)serviceNameView;
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
- (void)_create_warningView;
- (void)prepareAnimation:(id)a3 forDisplayItem:(id)a4;
- (void)setCallForwardingView:(id)a3;
- (void)setMarqueeServiceName:(BOOL)a3;
- (void)setNetworkTypeView:(id)a3;
- (void)setRawStringView:(id)a3;
- (void)setServiceNameView:(id)a3;
- (void)setShowsDisabledSignalBars:(BOOL)a3;
- (void)setSignalView:(id)a3;
- (void)setTypeStringProvider:(id)a3;
- (void)setWarningView:(id)a3;
- (void)setmarqueeServiceName:(BOOL)a3;
@end

@implementation _UIStatusBarCellularItem

+ (_UIStatusBarIdentifier)signalStrengthDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"signalStrengthDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)warningDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"warningDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)nameDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"nameDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)typeDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"typeDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)callForwardingDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"callForwardingDisplayIdentifier"];
}

+ (_UIStatusBarIdentifier)rawDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"rawDisplayIdentifier"];
}

- (_UIStatusBarCellularItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarCellularItem;
  v4 = [(_UIStatusBarItem *)&v6 initWithIdentifier:a3 statusBar:a4];
  [(_UIStatusBarCellularItem *)v4 setShowsDisabledSignalBars:1];
  [(_UIStatusBarCellularItem *)v4 setMarqueeServiceName:1];
  return v4;
}

- (NSString)cellularDataEntryKey
{
  return (NSString *)@"cellularEntry";
}

- (id)dependentEntryKeys
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(_UIStatusBarCellularItem *)self cellularDataEntryKey];
  v4 = objc_msgSend(v2, "setWithObjects:", v3, 0);

  return v4;
}

- (id)_fillColorForUpdate:(id)a3 entry:(id)a4
{
  id v5 = a3;
  if ([a4 lowDataModeActive])
  {
    objc_super v6 = +[UIColor systemYellowColor];
  }
  else
  {
    v7 = [v5 styleAttributes];
    v8 = [v7 imageTintColor];
    objc_super v6 = [v8 colorWithAlphaComponent:1.0];
  }
  return v6;
}

- (id)_backgroundColorForUpdate:(id)a3 entry:(id)a4
{
  id v5 = a3;
  if ([a4 lowDataModeActive])
  {
    objc_super v6 = +[UIColor systemYellowColor];
    [v6 colorWithAlphaComponent:0.3];
  }
  else
  {
    objc_super v6 = [v5 styleAttributes];
    [v6 imageDimmedTintColor];
  v7 = };

  return v7;
}

- (BOOL)_updateSignalView:(id)a3 withUpdate:(id)a4 entry:(id)a5 forceShowingDisabledSignalBars:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([v11 styleAttributesChanged] & 1) != 0 || objc_msgSend(v11, "dataChanged"))
  {
    v13 = [(_UIStatusBarCellularItem *)self _backgroundColorForUpdate:v11 entry:v12];
    [v10 setInactiveColor:v13];

    v14 = [(_UIStatusBarCellularItem *)self _fillColorForUpdate:v11 entry:v12];
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

- (id)entryForDisplayItemWithIdentifier:(id)a3
{
  v4 = [(_UIStatusBarItem *)self statusBar];
  id v5 = [v4 currentAggregatedData];
  BOOL v6 = [(_UIStatusBarCellularItem *)self cellularDataEntryKey];
  v7 = [v5 valueForKey:v6];

  return v7;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)_UIStatusBarCellularItem;
  v8 = [(_UIStatusBarItem *)&v41 applyUpdate:v6 toDisplayItem:v7];
  v9 = [v7 identifier];
  id v10 = [(_UIStatusBarCellularItem *)self entryForDisplayItemWithIdentifier:v9];

  id v11 = [v7 identifier];
  id v12 = [(id)objc_opt_class() signalStrengthDisplayIdentifier];

  if (v11 != v12)
  {
    v13 = [v7 identifier];
    v14 = [(id)objc_opt_class() nameDisplayIdentifier];

    if (v13 == v14)
    {
      v26 = [v10 string];
      if ([v7 isEnabled] && objc_msgSend(v26, "length")) {
        uint64_t v27 = [v10 isBootstrapCellular] ^ 1;
      }
      else {
        uint64_t v27 = 0;
      }
      [v7 setEnabled:v27];
      if (![v7 isEnabled]) {
        goto LABEL_42;
      }
      v28 = [(_UIStatusBarCellularItem *)self serviceNameView];
      [v28 setText:v26];
      v29 = [v10 crossfadeString];
      [v28 setAlternateText:v29];

      [v28 setMarqueeRunning:1];
LABEL_41:

LABEL_42:
      goto LABEL_43;
    }
    int v15 = [v7 identifier];
    uint64_t v16 = [(id)objc_opt_class() typeDisplayIdentifier];

    if (v15 != v16)
    {
      int v17 = [v7 identifier];
      BOOL v18 = [(id)objc_opt_class() warningDisplayIdentifier];

      if (v17 == v18)
      {
        if (!v10) {
          goto LABEL_43;
        }
        BOOL v32 = [v7 isEnabled] && (unint64_t)(objc_msgSend(v10, "status") == 4);
        [v7 setEnabled:v32];
        if (![v7 isEnabled]) {
          goto LABEL_43;
        }
        v35 = [(_UIStatusBarCellularItem *)self warningView];
        v36 = [v35 image];

        if (v36) {
          goto LABEL_43;
        }
        v26 = +[UIImage systemImageNamed:@"exclamationmark.triangle.fill"];
        v37 = [(_UIStatusBarCellularItem *)self warningView];
      }
      else
      {
        v19 = [v7 identifier];
        v20 = [(id)objc_opt_class() callForwardingDisplayIdentifier];

        if (v19 != v20)
        {
          v21 = [v7 identifier];
          v22 = [(id)objc_opt_class() rawDisplayIdentifier];

          if (v21 != v22 || !v10) {
            goto LABEL_43;
          }
          uint64_t v23 = [v7 isEnabled] ? objc_msgSend(v10, "displayRawValue") : 0;
          [v7 setEnabled:v23];
          if (![v7 isEnabled]) {
            goto LABEL_43;
          }
          v26 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(v10, "rawValue"));
          v34 = [(_UIStatusBarCellularItem *)self rawStringView];
LABEL_40:
          v28 = v34;
          [v34 setText:v26];
          goto LABEL_41;
        }
        if (!v10) {
          goto LABEL_43;
        }
        BOOL v33 = [v7 isEnabled]
           && [(_UIStatusBarCellularItem *)self _showCallFowardingForEntry:v10];
        [v7 setEnabled:v33];
        if (![v7 isEnabled]) {
          goto LABEL_43;
        }
        v39 = [(_UIStatusBarCellularItem *)self callForwardingView];
        v40 = [v39 image];

        if (v40) {
          goto LABEL_43;
        }
        v26 = +[UIImage systemImageNamed:@"phone.fill.arrow.right"];
        v37 = [(_UIStatusBarCellularItem *)self callForwardingView];
      }
      v28 = v37;
      [v37 setImage:v26];
      goto LABEL_41;
    }
    if (!v10) {
      goto LABEL_43;
    }
    if ([v10 isEnabled])
    {
      v26 = -[_UIStatusBarCellularItem _stringForCellularType:](self, "_stringForCellularType:", [v10 type]);
      int v30 = [v7 isEnabled];
      uint64_t v31 = 0;
      if (v30 && v26) {
        uint64_t v31 = objc_msgSend(v10, "isBootstrapCellular", 0) ^ 1;
      }
    }
    else
    {
      [v7 isEnabled];
      v26 = 0;
      uint64_t v31 = 0;
    }
    [v7 setEnabled:v31];
    if (![v7 isEnabled]) {
      goto LABEL_42;
    }
    v34 = [(_UIStatusBarCellularItem *)self networkTypeView];
    goto LABEL_40;
  }
  v24 = [(_UIStatusBarCellularItem *)self signalView];
  BOOL v25 = [(_UIStatusBarCellularItem *)self _updateSignalView:v24 withUpdate:v6 entry:v10 forceShowingDisabledSignalBars:0];

  if ([v6 dataChanged] && v10) {
    [v7 setEnabled:v25];
  }
LABEL_43:

  return v8;
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
    switch(a3)
    {
      case 1:
        v8 = @"1x[statusBarDataNetwork]";
        v9 = @"1x";
        goto LABEL_17;
      case 2:
        v8 = @"GPRS";
        goto LABEL_16;
      case 3:
        v8 = @"EDGE";
        goto LABEL_16;
      case 4:
        v8 = @"3G";
        goto LABEL_16;
      case 5:
        v8 = @"4G";
        goto LABEL_16;
      case 6:
        v8 = @"LTE";
        goto LABEL_16;
      case 7:
        v8 = @"5GE";
        v9 = @"5G   ";
        goto LABEL_17;
      case 8:
        v8 = @"LTE-A";
        goto LABEL_16;
      case 9:
        v8 = @"LTE+";
        goto LABEL_16;
      case 10:
        v8 = @"5G";
        goto LABEL_16;
      case 11:
        v8 = @"5G+";
LABEL_16:
        v9 = v8;
        goto LABEL_17;
      case 12:
        v8 = @"5GUW";
        v9 = @"5G";
        goto LABEL_17;
      case 13:
        v8 = @"5GUC";
        v9 = @"5G";
LABEL_17:
        id v7 = _UINSLocalizedStringWithDefaultValue(v8, v9);
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
    v8 = [v7 identifier];
    v9 = [(id)objc_opt_class() nameDisplayIdentifier];

    if (v8 == v9)
    {
      id v10 = [(_UIStatusBarCellularItem *)self serviceNameView];
      [v10 setMarqueeRunning:0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __60___UIStatusBarCellularItem_prepareAnimation_forDisplayItem___block_invoke;
      v12[3] = &unk_1E52DC698;
      id v13 = v10;
      id v11 = v10;
      [v6 addCompletionHandler:v12];
    }
  }
}

- (_UIStatusBarCellularSignalView)signalView
{
  signalView = self->_signalView;
  if (!signalView)
  {
    [(_UIStatusBarCellularItem *)self _create_signalView];
    signalView = self->_signalView;
  }
  return signalView;
}

- (void)_create_signalView
{
  v3 = [_UIStatusBarCellularSignalView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  signalView = self->_signalView;
  self->_signalView = v4;

  id v6 = self->_signalView;
  [(_UIStatusBarSignalView *)v6 setNumberOfBars:4];
}

- (_UIStatusBarStringView)serviceNameView
{
  serviceNameView = self->_serviceNameView;
  if (!serviceNameView)
  {
    [(_UIStatusBarCellularItem *)self _create_serviceNameView];
    serviceNameView = self->_serviceNameView;
  }
  return serviceNameView;
}

- (void)_create_serviceNameView
{
  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  serviceNameView = self->_serviceNameView;
  self->_serviceNameView = v4;

  [(UILabel *)self->_serviceNameView setNumberOfLines:1];
  [(_UIStatusBarStringView *)self->_serviceNameView setFontStyle:0];
  id v6 = self->_serviceNameView;
  if (self->_marqueeServiceName) {
    [(UILabel *)v6 setMarqueeEnabled:1];
  }
  else {
    [(UILabel *)v6 setLineBreakMode:4];
  }
  v8 = self->_serviceNameView;
  LODWORD(v7) = 1132068864;
  [(UIView *)v8 setContentCompressionResistancePriority:0 forAxis:v7];
}

- (_UIStatusBarStringView)networkTypeView
{
  networkTypeView = self->_networkTypeView;
  if (!networkTypeView)
  {
    [(_UIStatusBarCellularItem *)self _create_networkTypeView];
    networkTypeView = self->_networkTypeView;
  }
  return networkTypeView;
}

- (void)_create_networkTypeView
{
  v3 = [_UIStatusBarStringView alloc];
  v4 = -[_UIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  networkTypeView = self->_networkTypeView;
  self->_networkTypeView = v4;

  id v6 = self->_networkTypeView;
  [(UILabel *)v6 setLineBreakMode:2];
}

- (_UIStatusBarImageView)warningView
{
  warningView = self->_warningView;
  if (!warningView)
  {
    [(_UIStatusBarCellularItem *)self _create_warningView];
    warningView = self->_warningView;
  }
  return warningView;
}

- (void)_create_warningView
{
  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  warningView = self->_warningView;
  self->_warningView = v4;
}

- (_UIStatusBarImageView)callForwardingView
{
  callForwardingView = self->_callForwardingView;
  if (!callForwardingView)
  {
    [(_UIStatusBarCellularItem *)self _create_callForwardingView];
    callForwardingView = self->_callForwardingView;
  }
  return callForwardingView;
}

- (void)_create_callForwardingView
{
  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  callForwardingView = self->_callForwardingView;
  self->_callForwardingView = v4;
}

- (_UIStatusBarStringView)rawStringView
{
  rawStringView = self->_rawStringView;
  if (!rawStringView)
  {
    [(_UIStatusBarCellularItem *)self _create_rawStringView];
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
        [(UILabel *)serviceNameView setMarqueeEnabled:1];
      }
      else
      {
        -[UILabel setMarqueeEnabled:](serviceNameView, "setMarqueeEnabled:");
        id v5 = self->_serviceNameView;
        [(UILabel *)v5 setLineBreakMode:4];
      }
    }
  }
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() signalStrengthDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v11 = [(_UIStatusBarCellularItem *)self signalView];
  }
  else
  {
    id v6 = [(id)objc_opt_class() nameDisplayIdentifier];

    if (v6 == v4)
    {
      uint64_t v11 = [(_UIStatusBarCellularItem *)self serviceNameView];
    }
    else
    {
      id v7 = [(id)objc_opt_class() typeDisplayIdentifier];

      if (v7 == v4)
      {
        uint64_t v11 = [(_UIStatusBarCellularItem *)self networkTypeView];
      }
      else
      {
        id v8 = [(id)objc_opt_class() warningDisplayIdentifier];

        if (v8 == v4)
        {
          uint64_t v11 = [(_UIStatusBarCellularItem *)self warningView];
        }
        else
        {
          id v9 = [(id)objc_opt_class() callForwardingDisplayIdentifier];

          if (v9 == v4)
          {
            uint64_t v11 = [(_UIStatusBarCellularItem *)self callForwardingView];
          }
          else
          {
            id v10 = [(id)objc_opt_class() rawDisplayIdentifier];

            if (v10 == v4)
            {
              uint64_t v11 = [(_UIStatusBarCellularItem *)self rawStringView];
            }
            else
            {
              v14.receiver = self;
              v14.super_class = (Class)_UIStatusBarCellularItem;
              uint64_t v11 = [(_UIStatusBarItem *)&v14 viewForIdentifier:v4];
            }
          }
        }
      }
    }
  }
  id v12 = (void *)v11;

  return v12;
}

- (BOOL)showsDisabledSignalBars
{
  return self->_showsDisabledSignalBars;
}

- (void)setShowsDisabledSignalBars:(BOOL)a3
{
  self->_showsDisabledSignalBars = a3;
}

- (BOOL)marqueeServiceName
{
  return self->_marqueeServiceName;
}

- (void)setMarqueeServiceName:(BOOL)a3
{
  self->_marqueeServiceName = a3;
}

- (_UIStatusBarCellularItemTypeStringProvider)typeStringProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_typeStringProvider);
  return (_UIStatusBarCellularItemTypeStringProvider *)WeakRetained;
}

- (void)setTypeStringProvider:(id)a3
{
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

- (void)setWarningView:(id)a3
{
}

- (void)setCallForwardingView:(id)a3
{
}

- (void)setRawStringView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawStringView, 0);
  objc_storeStrong((id *)&self->_callForwardingView, 0);
  objc_storeStrong((id *)&self->_warningView, 0);
  objc_storeStrong((id *)&self->_networkTypeView, 0);
  objc_storeStrong((id *)&self->_signalView, 0);
  objc_storeStrong((id *)&self->_serviceNameView, 0);
  objc_destroyWeak((id *)&self->_typeStringProvider);
}

+ (id)groupWithHighPriority:(int64_t)a3 lowPriority:(int64_t)a4 typeClass:(Class)a5 allowDualNetwork:(BOOL)a6
{
  v32[1] = *MEMORY[0x1E4F143B8];
  int64_t v8 = a3 - a4;
  if (a3 <= a4)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:a1 file:@"_UIStatusBarDisplayItemPlacementCellularGroup.m" lineNumber:35 description:@"The lowPriority should be smaller than the highPriority"];
  }
  id v9 = [a1 signalStrengthDisplayIdentifier];
  id v10 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v9 priority:v8 + 6];

  uint64_t v11 = [a1 warningDisplayIdentifier];
  id v12 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v11 priority:v8 + 8];

  id v13 = [a1 nameDisplayIdentifier];
  objc_super v14 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v13 priority:v8 + 2];

  int v15 = [(objc_class *)a5 typeDisplayIdentifier];
  uint64_t v16 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v15 priority:v8 + 4];
  v32[0] = v10;
  int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  BOOL v18 = [v16 requiringAnyPlacements:v17];

  v19 = [a1 callForwardingDisplayIdentifier];
  v20 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v19 priority:2];

  v21 = [a1 rawDisplayIdentifier];
  v22 = +[_UIStatusBarDisplayItemPlacement placementWithIdentifier:v21 priority:1];

  v31[0] = v10;
  v31[1] = v12;
  v31[2] = v22;
  v31[3] = v14;
  v31[4] = v18;
  v31[5] = v20;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:6];
  v24 = +[_UIStatusBarDisplayItemPlacementGroup groupWithPriority:a4 placements:v23];

  [v24 setSignalStrengthPlacement:v10];
  [v24 setWarningPlacement:v12];
  [v24 setNamePlacement:v14];
  [v24 setTypePlacement:v18];
  [v24 setCallForwardingPlacement:v20];
  [v24 setRawPlacement:v22];
  v30[0] = v10;
  v30[1] = v12;
  v30[2] = v22;
  v30[3] = v18;
  BOOL v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  [v24 setPlacementsAffectedByAirplaneMode:v25];

  return v24;
}

@end