@interface STUIStatusBarBluetoothItem
+ (BOOL)alwaysShowRegulatoryBluetoothIndicator;
+ (STUIStatusBarIdentifier)batteryDisplayIdentifier;
- (STUIStatusBarImageView)batteryImageView;
- (id)_batteryFillColorForEntry:(id)a3 usingTintColor:(id)a4;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (void)_create_batteryImageView;
- (void)setBatteryImageView:(id)a3;
@end

@implementation STUIStatusBarBluetoothItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA9730];
}

+ (STUIStatusBarIdentifier)batteryDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"batteryDisplayIdentifier"];
}

- (void).cxx_destruct
{
}

- (id)systemImageNameForUpdate:(id)a3
{
  v3 = [a3 data];
  v4 = [v3 bluetoothEntry];
  unint64_t v5 = [v4 state];

  if (v5 > 2) {
    return 0;
  }
  else {
    return off_1E6AA4D80[v5];
  }
}

+ (BOOL)alwaysShowRegulatoryBluetoothIndicator
{
  if (qword_1EC05EF60 != -1) {
    dispatch_once(&qword_1EC05EF60, &__block_literal_global_12);
  }
  return _MergedGlobals_47;
}

uint64_t __68__STUIStatusBarBluetoothItem_alwaysShowRegulatoryBluetoothIndicator__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _MergedGlobals_47 = result;
  return result;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)STUIStatusBarBluetoothItem;
  v8 = [(STUIStatusBarIndicatorItem *)&v43 applyUpdate:v6 toDisplayItem:v7];
  v9 = [v6 data];
  v10 = [v9 bluetoothEntry];

  v11 = [v7 identifier];
  v12 = +[STUIStatusBarItem defaultDisplayIdentifier];

  if (v11 == v12)
  {
    if (![v6 dataChanged]) {
      goto LABEL_24;
    }
    v17 = [v10 batteryEntry];
    if (([(id)objc_opt_class() alwaysShowRegulatoryBluetoothIndicator] & 1) == 0
      && [v10 state] != 2
      && ([v17 isEnabled] & 1) == 0)
    {
      [v7 setEnabled:0];
    }
  }
  else
  {
    v13 = [v7 identifier];
    v14 = +[STUIStatusBarBluetoothItem batteryDisplayIdentifier];

    if (v13 != v14) {
      goto LABEL_24;
    }
    if (([v6 dataChanged] & 1) != 0 || objc_msgSend(v6, "styleAttributesChanged"))
    {
      v15 = [v10 batteryEntry];
      if ([v7 isEnabled]) {
        uint64_t v16 = [v15 isEnabled];
      }
      else {
        uint64_t v16 = 0;
      }
      [v7 setEnabled:v16];
      if ([v7 isEnabled])
      {
        v36 = +[STUIStatusBarImageProvider sharedProvider];
        v18 = [v6 styleAttributes];
        v19 = [v36 imageNamed:@"HeadsetBatteryBG" styleAttributes:v18];
        [v6 styleAttributes];
        v20 = v37 = v15;
        v21 = [v20 imageTintColor];
        v22 = [v19 _flatImageWithColor:v21];

        id v23 = objc_alloc(MEMORY[0x1E4FB17D8]);
        [v22 size];
        v24 = objc_msgSend(v23, "initWithSize:");
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __56__STUIStatusBarBluetoothItem_applyUpdate_toDisplayItem___block_invoke;
        v38[3] = &unk_1E6AA4D60;
        id v39 = v22;
        id v40 = v37;
        id v25 = v6;
        id v41 = v25;
        v42 = self;
        id v26 = v22;
        v27 = [v24 imageWithActions:v38];
        v28 = [v25 styleAttributes];
        uint64_t v29 = [v28 effectiveLayoutDirection];

        if (v29) {
          double v30 = 0.0;
        }
        else {
          double v30 = 2.0;
        }
        if (v29) {
          double v31 = 2.0;
        }
        else {
          double v31 = 0.0;
        }
        v32 = objc_msgSend(v27, "imageWithAlignmentRectInsets:", 0.0, v30, 0.0, v31);

        v33 = [(STUIStatusBarBluetoothItem *)self batteryImageView];
        [v33 setImage:v32];

        v15 = v37;
      }
    }
    BOOL v34 = [v10 state] == 0;
    v17 = [(STUIStatusBarIndicatorItem *)self imageView];
    [v17 setUseDisabledAppearanceForAccessibilityHUD:v34];
  }

LABEL_24:
  return v8;
}

void __56__STUIStatusBarBluetoothItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v6 = a2;
  objc_msgSend(v3, "drawAtPoint:", v4, v5);
  id v7 = [v6 format];

  [v7 bounds];
  UIRectInset();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v32.origin.x = v9;
  v32.origin.y = v11;
  v32.size.width = v13;
  v32.size.height = v15;
  CGRectGetHeight(v32);
  [*(id *)(a1 + 40) capacity];
  v33.origin.x = v9;
  v33.origin.y = v11;
  v33.size.width = v13;
  v33.size.height = v15;
  CGRectGetHeight(v33);
  uint64_t v16 = [*(id *)(a1 + 48) styleAttributes];
  v17 = [v16 traitCollection];
  [v17 displayScale];
  UIRectIntegralWithScale();
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  id v26 = *(void **)(a1 + 56);
  uint64_t v27 = *(void *)(a1 + 40);
  v28 = [*(id *)(a1 + 48) styleAttributes];
  uint64_t v29 = [v28 imageTintColor];
  id v30 = [v26 _batteryFillColorForEntry:v27 usingTintColor:v29];

  [v30 setFill];
  v34.origin.x = v19;
  v34.origin.y = v21;
  v34.size.width = v23;
  v34.size.height = v25;
  UIRectFill(v34);
}

- (id)_batteryFillColorForEntry:(id)a3 usingTintColor:(id)a4
{
  id v5 = a3;
  id v6 = [a4 colorWithAlphaComponent:1.0];
  uint64_t v7 = [v5 capacity];

  if (v7 > 26)
  {
    if (!v6)
    {
      id v6 = [MEMORY[0x1E4FB1618] blackColor];
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FB1618] systemRedColor];

    id v6 = (void *)v8;
  }
  return v6;
}

- (STUIStatusBarImageView)batteryImageView
{
  batteryImageView = self->_batteryImageView;
  if (!batteryImageView)
  {
    [(STUIStatusBarBluetoothItem *)self _create_batteryImageView];
    batteryImageView = self->_batteryImageView;
  }
  return batteryImageView;
}

- (void)_create_batteryImageView
{
  v3 = [STUIStatusBarImageView alloc];
  double v4 = -[STUIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  batteryImageView = self->_batteryImageView;
  self->_batteryImageView = v4;
  MEMORY[0x1F41817F8](v4, batteryImageView);
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[STUIStatusBarBluetoothItem batteryDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v6 = [(STUIStatusBarBluetoothItem *)self batteryImageView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUIStatusBarBluetoothItem;
    uint64_t v6 = [(STUIStatusBarIndicatorItem *)&v9 viewForIdentifier:v4];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (void)setBatteryImageView:(id)a3
{
}

@end