@interface RCPlaybackSettingsCollectionViewController
- (BOOL)showLayerMixSlider;
- (RCPlaybackSettings)playbackSettings;
- (RCPlaybackSettingsCollectionViewController)init;
- (RCPlaybackSettingsDelegate)delegate;
- (id)_cellForGeneralSettingsSectionAtIndexPath:(id)a3;
- (id)_cellForMultitrackSettingsSectionAtIndexPath:(id)a3;
- (id)_cellForPlaybackSpeedSectionAtIndexPath:(id)a3;
- (id)_createCollectionViewLayout;
- (id)_indexPathForEnhancedSwitch;
- (id)_indexPathForLayerMixSlider;
- (id)_indexPathForPlaybackSpeedSlider;
- (id)_indexPathForRemoveSilenceSwitch;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)didToggleSwitch:(id)a3 toState:(BOOL)a4;
- (void)didUpdateSlider:(id)a3 toValue:(double)a4;
- (void)setDelegate:(id)a3;
- (void)setPlaybackSettings:(id)a3;
- (void)setShowLayerMixSlider:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RCPlaybackSettingsCollectionViewController

- (RCPlaybackSettingsCollectionViewController)init
{
  v3 = [(RCPlaybackSettingsCollectionViewController *)self _createCollectionViewLayout];
  v6.receiver = self;
  v6.super_class = (Class)RCPlaybackSettingsCollectionViewController;
  v4 = [(RCPlaybackSettingsCollectionViewController *)&v6 initWithCollectionViewLayout:v3];

  return v4;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)RCPlaybackSettingsCollectionViewController;
  [(RCPlaybackSettingsCollectionViewController *)&v4 viewDidLoad];
  v3 = [(RCPlaybackSettingsCollectionViewController *)self collectionView];
  [v3 setAllowsSelection:0];
  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kPlaybackSettingSpeedSectionHeaderCellIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kPlaybackSettingSpeedCellIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kPlaybackSettingEnhanceCellIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kPlaybackSettingRemoveSilenceCellIdentifier"];
  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"kPlaybackSettingMultitrackSectionHeaderCellIdentifier"];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"kPlaybackSettingLayerMixCellIdentifier"];
}

- (void)setPlaybackSettings:(id)a3
{
  id v28 = a3;
  objc_storeStrong((id *)&self->_playbackSettings, a3);
  unsigned int v5 = [v28 hasMultipleTracks];
  if (v5) {
    LOBYTE(v5) = RCOverdubRecordingFeatureFlagIsEnabled();
  }
  self->_showLayerMixSlider = v5;
  if ([(RCPlaybackSettingsCollectionViewController *)self isViewLoaded])
  {
    objc_super v6 = +[NSMutableArray array];
    v7 = [(RCPlaybackSettingsCollectionViewController *)self _indexPathForEnhancedSwitch];
    v8 = [(RCPlaybackSettingsCollectionViewController *)self collectionView];
    v9 = [v8 cellForItemAtIndexPath:v7];

    LODWORD(v8) = [v9 isSwitchON];
    if (v8 != [v28 enhanced]) {
      [v6 addObject:v7];
    }
    v10 = [(RCPlaybackSettingsCollectionViewController *)self _indexPathForRemoveSilenceSwitch];
    v11 = [(RCPlaybackSettingsCollectionViewController *)self collectionView];
    v12 = [v11 cellForItemAtIndexPath:v10];

    LODWORD(v11) = [v12 isSwitchON];
    if (v11 != [v28 silenceRemoved]) {
      [v6 addObject:v10];
    }
    v13 = [(RCPlaybackSettingsCollectionViewController *)self _indexPathForPlaybackSpeedSlider];
    v14 = [(RCPlaybackSettingsCollectionViewController *)self collectionView];
    v15 = [v14 cellForItemAtIndexPath:v13];

    [v15 sliderValue];
    double v17 = v16;
    [v28 playbackSpeed];
    if (v17 != v18) {
      [v6 addObject:v13];
    }
    if (self->_showLayerMixSlider)
    {
      v27 = v7;
      v19 = v9;
      v20 = [(RCPlaybackSettingsCollectionViewController *)self _indexPathForLayerMixSlider];
      v21 = [(RCPlaybackSettingsCollectionViewController *)self collectionView];
      v22 = [v21 cellForItemAtIndexPath:v20];

      [v22 sliderValue];
      double v24 = v23;
      [v28 layerMix];
      if (v24 != v25) {
        [v6 addObject:v20];
      }

      v9 = v19;
      v7 = v27;
    }
    if ([v6 count])
    {
      v26 = [(RCPlaybackSettingsCollectionViewController *)self collectionView];
      [v26 reloadItemsAtIndexPaths:v6];
    }
  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (self->_showLayerMixSlider) {
    return 3;
  }
  else {
    return 2;
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (!a4) {
    return 2;
  }
  if (a4 == 2) {
    return self->_showLayerMixSlider;
  }
  return a4 == 1;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 section];
  id v7 = [v5 section];
  id v8 = [v5 section];
  if (!v6)
  {
    uint64_t v9 = [(RCPlaybackSettingsCollectionViewController *)self _cellForPlaybackSpeedSectionAtIndexPath:v5];
    goto LABEL_7;
  }
  if (v7 == (id)1)
  {
    uint64_t v9 = [(RCPlaybackSettingsCollectionViewController *)self _cellForGeneralSettingsSectionAtIndexPath:v5];
LABEL_7:
    v10 = (void *)v9;
    goto LABEL_8;
  }
  if (v8 == (id)2)
  {
    uint64_t v9 = [(RCPlaybackSettingsCollectionViewController *)self _cellForMultitrackSettingsSectionAtIndexPath:v5];
    goto LABEL_7;
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [v8 isEqualToString:UICollectionElementKindSectionHeader];
  id v11 = [v9 section];
  id v12 = [v9 section];
  if (v11) {
    BOOL v13 = v12 == (id)2;
  }
  else {
    BOOL v13 = 1;
  }
  char v14 = v13;
  if (v10 && (v14 & 1) != 0)
  {
    if (v11)
    {
      if (v12 != (id)2)
      {
        CFStringRef v17 = 0;
        double v16 = 0;
        goto LABEL_18;
      }
      v15 = +[NSBundle mainBundle];
      double v16 = [v15 localizedStringForKey:@"LAYER_MIX_HEADER" value:&stru_100228BC8 table:0];
      CFStringRef v17 = @"kPlaybackSettingMultitrackSectionHeaderCellIdentifier";
    }
    else
    {
      v15 = +[NSBundle mainBundle];
      double v16 = [v15 localizedStringForKey:@"PLAYBACK_SPEED" value:&stru_100228BC8 table:0];
      CFStringRef v17 = @"kPlaybackSettingSpeedSectionHeaderCellIdentifier";
    }

LABEL_18:
    v19 = [v7 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v17 forIndexPath:v9];
    v20 = +[UIListContentConfiguration headerConfiguration];
    [v20 setText:v16];
    [v19 setContentConfiguration:v20];

    goto LABEL_19;
  }
  float v18 = OSLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_10016B158();
  }

  v19 = 0;
LABEL_19:

  return v19;
}

- (id)_cellForPlaybackSpeedSectionAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(RCPlaybackSettingsCollectionViewController *)self _indexPathForPlaybackSpeedSlider];

  id v6 = [(RCPlaybackSettingsCollectionViewController *)self _indexPathForRemoveSilenceSwitch];

  if (v5 != v4 && v6 != v4)
  {
    id v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10016B1CC();
    }
  }
  id v8 = [(RCPlaybackSettingsCollectionViewController *)self collectionView];
  id v9 = v8;
  if (v5 == v4)
  {
    unsigned int v10 = [v8 dequeueReusableCellWithReuseIdentifier:@"kPlaybackSettingSpeedCellIdentifier" forIndexPath:v4];

    BOOL v13 = [(RCPlaybackSettingsCollectionViewController *)self playbackSettings];
    [v13 playbackSpeed];
    [v10 setSliderValue:v14];
  }
  else
  {
    unsigned int v10 = [v8 dequeueReusableCellWithReuseIdentifier:@"kPlaybackSettingRemoveSilenceCellIdentifier" forIndexPath:v4];

    id v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"SKIP_SILENCE_SETTING" value:&stru_100228BC8 table:0];
    [v10 setTitle:v12];

    BOOL v13 = [(RCPlaybackSettingsCollectionViewController *)self playbackSettings];
    [v10 setSwitchState:[v13 silenceRemoved]];
  }

  [v10 setCellActionsDelegate:self];

  return v10;
}

- (id)_cellForGeneralSettingsSectionAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 item])
  {
    id v5 = OSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10016B240();
    }

    id v6 = 0;
  }
  else
  {
    id v7 = [(RCPlaybackSettingsCollectionViewController *)self collectionView];
    id v6 = [v7 dequeueReusableCellWithReuseIdentifier:@"kPlaybackSettingEnhanceCellIdentifier" forIndexPath:v4];

    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"ENHANCE_RECORDING_SETTING" value:&stru_100228BC8 table:0];
    [v6 setTitle:v9];

    unsigned int v10 = [(RCPlaybackSettingsCollectionViewController *)self playbackSettings];
    [v6 setSwitchState:[v10 enhanced]];
  }
  [v6 setCellActionsDelegate:self];

  return v6;
}

- (id)_cellForMultitrackSettingsSectionAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 item])
  {
    id v5 = OSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10016B2B4();
    }

    id v6 = 0;
  }
  else
  {
    id v7 = [(RCPlaybackSettingsCollectionViewController *)self collectionView];
    id v6 = [v7 dequeueReusableCellWithReuseIdentifier:@"kPlaybackSettingLayerMixCellIdentifier" forIndexPath:v4];

    id v8 = [(RCPlaybackSettingsCollectionViewController *)self playbackSettings];
    [v8 layerMix];
    [v6 setSliderValue:v9];
  }
  [v6 setCellActionsDelegate:self];

  return v6;
}

- (id)_createCollectionViewLayout
{
  id v2 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:&stru_1002218E8];

  return v2;
}

- (void)didToggleSwitch:(id)a3 toState:(BOOL)a4
{
  BOOL v4 = a4;
  id v18 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v18;
  if (isKindOfClass)
  {
    id v8 = v18;
    float v9 = [(RCPlaybackSettingsCollectionViewController *)self collectionView];
    unsigned int v10 = [v9 indexPathForCell:v8];

    id v11 = [(RCPlaybackSettingsCollectionViewController *)self _indexPathForEnhancedSwitch];
    unsigned int v12 = [v11 isEqual:v10];

    BOOL v13 = [(RCPlaybackSettingsCollectionViewController *)self _indexPathForRemoveSilenceSwitch];
    unsigned int v14 = [v13 isEqual:v10];

    v15 = [(RCPlaybackSettingsCollectionViewController *)self playbackSettings];
    double v16 = [v15 uuid];

    if (v12)
    {
      CFStringRef v17 = [(RCPlaybackSettingsCollectionViewController *)self delegate];
      [v17 setEnhanced:v4 forUUID:v16];
    }
    else
    {
      if (!v14)
      {
LABEL_7:

        id v7 = v18;
        goto LABEL_8;
      }
      CFStringRef v17 = [(RCPlaybackSettingsCollectionViewController *)self delegate];
      [v17 setRemoveSilence:v4 forUUID:v16];
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (void)didUpdateSlider:(id)a3 toValue:(double)a4
{
  id v18 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = v18;
  if (isKindOfClass)
  {
    id v8 = v18;
    float v9 = [(RCPlaybackSettingsCollectionViewController *)self collectionView];
    unsigned int v10 = [v9 indexPathForCell:v8];

    id v11 = [(RCPlaybackSettingsCollectionViewController *)self _indexPathForPlaybackSpeedSlider];
    unsigned int v12 = [v11 isEqual:v10];

    BOOL v13 = [(RCPlaybackSettingsCollectionViewController *)self _indexPathForLayerMixSlider];
    unsigned int v14 = [v13 isEqual:v10];

    v15 = [(RCPlaybackSettingsCollectionViewController *)self playbackSettings];
    double v16 = [v15 uuid];

    if (v12)
    {
      CFStringRef v17 = [(RCPlaybackSettingsCollectionViewController *)self delegate];
      [v17 setPlaybackSpeed:v16 forUUID:a4];
    }
    else
    {
      if (!v14)
      {
LABEL_7:

        id v7 = v18;
        goto LABEL_8;
      }
      CFStringRef v17 = [(RCPlaybackSettingsCollectionViewController *)self delegate];
      [v17 setLayerMix:v16 forUUID:a4];
    }

    goto LABEL_7;
  }
LABEL_8:
}

- (id)_indexPathForPlaybackSpeedSlider
{
  return +[NSIndexPath indexPathForItem:0 inSection:0];
}

- (id)_indexPathForRemoveSilenceSwitch
{
  return +[NSIndexPath indexPathForItem:1 inSection:0];
}

- (id)_indexPathForEnhancedSwitch
{
  return +[NSIndexPath indexPathForItem:0 inSection:1];
}

- (id)_indexPathForLayerMixSlider
{
  return +[NSIndexPath indexPathForItem:0 inSection:2];
}

- (RCPlaybackSettingsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCPlaybackSettingsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RCPlaybackSettings)playbackSettings
{
  return self->_playbackSettings;
}

- (BOOL)showLayerMixSlider
{
  return self->_showLayerMixSlider;
}

- (void)setShowLayerMixSlider:(BOOL)a3
{
  self->_showLayerMixSlider = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackSettings, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end