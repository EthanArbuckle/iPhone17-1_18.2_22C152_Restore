@interface _UIStatusBarBluetoothItem
+ (BOOL)alwaysShowRegulatoryBluetoothIndicator;
+ (_UIStatusBarIdentifier)batteryDisplayIdentifier;
- (_UIStatusBarImageView)batteryImageView;
- (id)_batteryFillColorForEntry:(id)a3 usingTintColor:(id)a4;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (void)_create_batteryImageView;
- (void)setBatteryImageView:(id)a3;
@end

@implementation _UIStatusBarBluetoothItem

+ (_UIStatusBarIdentifier)batteryDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:@"batteryDisplayIdentifier"];
}

- (id)indicatorEntryKey
{
  return @"bluetoothEntry";
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
    return off_1E5305508[v5];
  }
}

+ (BOOL)alwaysShowRegulatoryBluetoothIndicator
{
  if (qword_1EB262E88 != -1) {
    dispatch_once(&qword_1EB262E88, &__block_literal_global_481);
  }
  return _MergedGlobals_1219;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43.receiver = self;
  v43.super_class = (Class)_UIStatusBarBluetoothItem;
  v8 = [(_UIStatusBarIndicatorItem *)&v43 applyUpdate:v6 toDisplayItem:v7];
  v9 = [v6 data];
  v10 = [v9 bluetoothEntry];

  v11 = [v7 identifier];
  v12 = +[_UIStatusBarItem defaultDisplayIdentifier];

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
    v14 = +[_UIStatusBarBluetoothItem batteryDisplayIdentifier];

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
        v36 = +[_UIStatusBarImageProvider sharedProvider];
        v18 = [v6 styleAttributes];
        v19 = [v36 imageNamed:@"HeadsetBatteryBG" styleAttributes:v18];
        [v6 styleAttributes];
        v20 = v37 = v15;
        v21 = [v20 imageTintColor];
        v22 = [v19 _flatImageWithColor:v21];

        v23 = [UIGraphicsImageRenderer alloc];
        [v22 size];
        v24 = -[UIGraphicsImageRenderer initWithSize:](v23, "initWithSize:");
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __55___UIStatusBarBluetoothItem_applyUpdate_toDisplayItem___block_invoke;
        v38[3] = &unk_1E53054E8;
        id v39 = v22;
        id v40 = v37;
        id v25 = v6;
        id v41 = v25;
        v42 = self;
        id v26 = v22;
        v27 = [(UIGraphicsImageRenderer *)v24 imageWithActions:v38];
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

        v33 = [(_UIStatusBarBluetoothItem *)self batteryImageView];
        [v33 setImage:v32];

        v15 = v37;
      }
    }
    BOOL v34 = [v10 state] == 0;
    v17 = [(_UIStatusBarIndicatorItem *)self imageView];
    [v17 setUseDisabledAppearanceForAccessibilityHUD:v34];
  }

LABEL_24:
  return v8;
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
      id v6 = +[UIColor blackColor];
    }
  }
  else
  {
    uint64_t v8 = +[UIColor systemRedColor];

    id v6 = (void *)v8;
  }
  return v6;
}

- (_UIStatusBarImageView)batteryImageView
{
  batteryImageView = self->_batteryImageView;
  if (!batteryImageView)
  {
    [(_UIStatusBarBluetoothItem *)self _create_batteryImageView];
    batteryImageView = self->_batteryImageView;
  }
  return batteryImageView;
}

- (void)_create_batteryImageView
{
  v3 = [_UIStatusBarImageView alloc];
  v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  batteryImageView = self->_batteryImageView;
  self->_batteryImageView = v4;
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[_UIStatusBarBluetoothItem batteryDisplayIdentifier];

  if (v5 == v4)
  {
    uint64_t v6 = [(_UIStatusBarBluetoothItem *)self batteryImageView];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_UIStatusBarBluetoothItem;
    uint64_t v6 = [(_UIStatusBarIndicatorItem *)&v9 viewForIdentifier:v4];
  }
  uint64_t v7 = (void *)v6;

  return v7;
}

- (void)setBatteryImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end