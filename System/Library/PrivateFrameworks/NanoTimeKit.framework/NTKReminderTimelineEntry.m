@interface NTKReminderTimelineEntry
+ (id)_analogReminderImageProvider;
+ (id)_cornerReminderImageProvider;
+ (id)_reminderImageAnalog;
+ (id)_reminderImageCorner;
+ (id)loadingEntryForFamily:(int64_t)a3;
+ (id)lockedEntryForFamily:(int64_t)a3;
- (BOOL)displayAsConflicting;
- (NSDate)dueDate;
- (NSString)primaryReminderId;
- (NSString)primaryReminderTitle;
- (NSString)secondaryReminderTitle;
- (UIColor)primaryReminderParentListColor;
- (id)_createLargeModularTemplate;
- (id)_createLargeUtilityTemplate;
- (id)_createSignatureCornerTemplate;
- (id)description;
- (id)templateForComplicationFamily:(int64_t)a3;
- (unint64_t)overlappingReminderCount;
- (void)setDisplayAsConflicting:(BOOL)a3;
- (void)setDueDate:(id)a3;
- (void)setOverlappingReminderCount:(unint64_t)a3;
- (void)setPrimaryReminderId:(id)a3;
- (void)setPrimaryReminderParentListColor:(id)a3;
- (void)setPrimaryReminderTitle:(id)a3;
- (void)setSecondaryReminderTitle:(id)a3;
@end

@implementation NTKReminderTimelineEntry

- (id)description
{
  v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)NTKReminderTimelineEntry;
  v4 = [(NTKReminderTimelineEntry *)&v12 description];
  v5 = [(NTKTimelineEntryModel *)self entryDate];
  v6 = [(NTKReminderTimelineEntry *)self primaryReminderTitle];
  v7 = [(NTKReminderTimelineEntry *)self primaryReminderId];
  v8 = [(NTKReminderTimelineEntry *)self secondaryReminderTitle];
  v9 = [(NTKReminderTimelineEntry *)self dueDate];
  v10 = [v3 stringWithFormat:@"%@ entryDate %@ title 1 %@ reminderId %@ title 2 %@ dueDate %@", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  switch(a3)
  {
    case 104:
      goto LABEL_6;
    case 8:
      v3 = [(NTKReminderTimelineEntry *)self _createSignatureCornerTemplate];
      break;
    case 3:
LABEL_6:
      v3 = [(NTKReminderTimelineEntry *)self _createLargeUtilityTemplate];
      break;
    case 1:
      v3 = [(NTKReminderTimelineEntry *)self _createLargeModularTemplate];
      break;
    default:
      v3 = 0;
      break;
  }

  return v3;
}

+ (id)_reminderImageAnalog
{
  os_unfair_lock_lock((os_unfair_lock_t)&_reminderImageAnalog___lock);
  id WeakRetained = objc_loadWeakRetained(&_reminderImageAnalog___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  v4 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v5 = [v4 device];
  id v6 = objc_loadWeakRetained(&_reminderImageAnalog___cachedDevice);
  if (v5 != v6)
  {

    goto LABEL_5;
  }
  v7 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  v8 = [v7 device];
  uint64_t v9 = [v8 version];
  uint64_t v10 = _reminderImageAnalog___previousCLKDeviceVersion;

  if (v9 != v10)
  {
LABEL_5:
    v11 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    objc_super v12 = [v11 device];
    objc_storeWeak(&_reminderImageAnalog___cachedDevice, v12);

    id v13 = objc_loadWeakRetained(&_reminderImageAnalog___cachedDevice);
    _reminderImageAnalog___previousCLKDeviceVersion = [v13 version];

    [MEMORY[0x1E4F19A90] sharedRenderingContext];
    [(id)objc_claimAutoreleasedReturnValue() device];
    objc_claimAutoreleasedReturnValue();
    __48__NTKReminderTimelineEntry__reminderImageAnalog__block_invoke();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_reminderImageAnalog___lock);
  v14 = (void *)_reminderImageAnalog_reminderImage;

  return v14;
}

void __48__NTKReminderTimelineEntry__reminderImageAnalog__block_invoke()
{
}

+ (id)_reminderImageCorner
{
  os_unfair_lock_lock((os_unfair_lock_t)&_reminderImageCorner___lock);
  id WeakRetained = objc_loadWeakRetained(&_reminderImageCorner___cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  v4 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v5 = [v4 device];
  id v6 = objc_loadWeakRetained(&_reminderImageCorner___cachedDevice);
  if (v5 != v6)
  {

    goto LABEL_5;
  }
  v7 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  v8 = [v7 device];
  uint64_t v9 = [v8 version];
  uint64_t v10 = _reminderImageCorner___previousCLKDeviceVersion;

  if (v9 != v10)
  {
LABEL_5:
    v11 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    objc_super v12 = [v11 device];
    objc_storeWeak(&_reminderImageCorner___cachedDevice, v12);

    id v13 = objc_loadWeakRetained(&_reminderImageCorner___cachedDevice);
    _reminderImageCorner___previousCLKDeviceVersion = [v13 version];

    [MEMORY[0x1E4F19A90] sharedRenderingContext];
    [(id)objc_claimAutoreleasedReturnValue() device];
    objc_claimAutoreleasedReturnValue();
    __48__NTKReminderTimelineEntry__reminderImageCorner__block_invoke();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_reminderImageCorner___lock);
  v14 = (void *)_reminderImageCorner_reminderImage;

  return v14;
}

void __48__NTKReminderTimelineEntry__reminderImageCorner__block_invoke()
{
}

+ (id)_cornerReminderImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_cornerReminderImageProvider___lock);
  id WeakRetained = objc_loadWeakRetained(&_cornerReminderImageProvider___cachedDevice);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    id v6 = [v5 device];
    id v7 = objc_loadWeakRetained(&_cornerReminderImageProvider___cachedDevice);
    if (v6 == v7)
    {
      v8 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      uint64_t v9 = [v8 device];
      uint64_t v10 = [v9 version];
      uint64_t v11 = _cornerReminderImageProvider___previousCLKDeviceVersion;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  objc_super v12 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v13 = [v12 device];
  objc_storeWeak(&_cornerReminderImageProvider___cachedDevice, v13);

  id v14 = objc_loadWeakRetained(&_cornerReminderImageProvider___cachedDevice);
  _cornerReminderImageProvider___previousCLKDeviceVersion = [v14 version];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__NTKReminderTimelineEntry__cornerReminderImageProvider__block_invoke;
  v19[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
  v19[4] = a1;
  v15 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  v16 = [v15 device];
  ((void (*)(void *, void *))__56__NTKReminderTimelineEntry__cornerReminderImageProvider__block_invoke)(v19, v16);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_cornerReminderImageProvider___lock);
  v17 = (void *)_cornerReminderImageProvider_imageProvider;

  return v17;
}

void __56__NTKReminderTimelineEntry__cornerReminderImageProvider__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F19A58];
  id v3 = [(id)objc_opt_class() _reminderImageCorner];
  uint64_t v1 = [v0 providerWithFullColorImage:v3 monochromeFilterType:1 applyScalingAndCircularMasking:0];
  v2 = (void *)_cornerReminderImageProvider_imageProvider;
  _cornerReminderImageProvider_imageProvider = v1;
}

- (id)_createSignatureCornerTemplate
{
  if ([(NTKReminderTimelineEntry *)self overlappingReminderCount])
  {
    id v3 = [(NTKReminderTimelineEntry *)self primaryReminderParentListColor];
    v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    uint64_t v9 = v5;

    if (CLKLanguageIsTallScript())
    {
      id v13 = (void *)MEMORY[0x1E4F19AB0];
      id v14 = [(NTKReminderTimelineEntry *)self primaryReminderTitle];
      uint64_t v11 = [v13 finalizedTextProviderWithText:v14];

      [v11 setTintColor:v9];
      v15 = [(id)objc_opt_class() _cornerReminderImageProvider];
      [MEMORY[0x1E4F19888] templateWithTextProvider:v11 imageProvider:v15];
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F19AE0];
      v17 = [(NTKReminderTimelineEntry *)self dueDate];
      uint64_t v11 = [v16 textProviderWithDate:v17];

      v18 = (void *)MEMORY[0x1E4F19AB0];
      v19 = [(NTKReminderTimelineEntry *)self primaryReminderTitle];
      v15 = [v18 finalizedTextProviderWithText:v19];

      [v15 setTintColor:v9];
      [MEMORY[0x1E4F19880] templateWithInnerTextProvider:v15 outerTextProvider:v11];
    objc_super v12 = };
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F19AB0];
    id v7 = NTKClockFaceLocalizedString(@"REMINDERS_NONE_CORNER", @"No Reminders Due");
    v8 = NTKClockFaceLocalizedString(@"REMINDERS_NONE_CORNER_SHORT", @"No Reminders");
    uint64_t v9 = [v6 textProviderWithText:v7 shortText:v8];

    uint64_t v10 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v9 setTintColor:v10];

    uint64_t v11 = [(id)objc_opt_class() _cornerReminderImageProvider];
    objc_super v12 = [MEMORY[0x1E4F19888] templateWithTextProvider:v9 imageProvider:v11];
  }

  return v12;
}

- (id)_createLargeModularTemplate
{
  if ([(NTKReminderTimelineEntry *)self overlappingReminderCount])
  {
    id v3 = (void *)MEMORY[0x1E4F19AE0];
    v4 = [(NTKReminderTimelineEntry *)self dueDate];
    id v5 = [v3 textProviderWithDate:v4];

    id v6 = (void *)MEMORY[0x1E4F19AB0];
    id v7 = [(NTKReminderTimelineEntry *)self primaryReminderTitle];
    v8 = [v6 finalizedTextProviderWithText:v7];
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F19AB0];
    uint64_t v10 = NTKClockFaceLocalizedString(@"REMINDERS_TITLE", @"Reminders");
    id v5 = [v9 textProviderWithText:v10];

    uint64_t v11 = (void *)MEMORY[0x1E4F19AB0];
    objc_super v12 = NTKClockFaceLocalizedString(@"REMINDERS_NO_SCHEDULED_REMINDERS_LARGE_MODULAR", @"No scheduled reminders");
    v8 = [v11 textProviderWithText:v12];
  }
  id v13 = [MEMORY[0x1E4F19978] templateWithHeaderTextProvider:v5 body1TextProvider:v8];

  id v14 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v13 setTintColor:v14];

  return v13;
}

- (id)_createLargeUtilityTemplate
{
  if ([(NTKReminderTimelineEntry *)self overlappingReminderCount])
  {
    id v3 = [(NTKReminderTimelineEntry *)self dueDate];
    v4 = [(NTKReminderTimelineEntry *)self primaryReminderTitle];
    if (v4)
    {
      id v5 = [(NTKReminderTimelineEntry *)self primaryReminderTitle];
      id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
      id v7 = [v5 uppercaseStringWithLocale:v6];
    }
    else
    {
      id v7 = &stru_1F1635E90;
    }

    uint64_t v10 = [MEMORY[0x1E4F19AE0] textProviderWithDate:v3];
    [v10 setPrefersDesignatorToMinutes:1];
    uint64_t v11 = (void *)MEMORY[0x1E4F19AC0];
    objc_super v12 = [MEMORY[0x1E4F19AB0] textProviderWithText:v7];
    uint64_t v9 = [v11 textProviderWithFormat:@"%@ %@", v10, v12];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F19AB0];
    id v3 = NTKClockFaceLocalizedString(@"REMINDERS_NO_SCHEDULED_REMINDERS_LONG_UTILITY", @"NO REMINDERS DUE");
    uint64_t v9 = [v8 textProviderWithText:v3];
  }

  id v13 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v9];

  return v13;
}

+ (id)_analogReminderImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_analogReminderImageProvider___lock);
  id WeakRetained = objc_loadWeakRetained(&_analogReminderImageProvider___cachedDevice);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    id v5 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    id v6 = [v5 device];
    id v7 = objc_loadWeakRetained(&_analogReminderImageProvider___cachedDevice);
    if (v6 == v7)
    {
      v8 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      uint64_t v9 = [v8 device];
      uint64_t v10 = [v9 version];
      uint64_t v11 = _analogReminderImageProvider___previousCLKDeviceVersion;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  objc_super v12 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v13 = [v12 device];
  objc_storeWeak(&_analogReminderImageProvider___cachedDevice, v13);

  id v14 = objc_loadWeakRetained(&_analogReminderImageProvider___cachedDevice);
  _analogReminderImageProvider___previousCLKDeviceVersion = [v14 version];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__NTKReminderTimelineEntry__analogReminderImageProvider__block_invoke;
  v19[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
  v19[4] = a1;
  v15 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  v16 = [v15 device];
  ((void (*)(void *, void *))__56__NTKReminderTimelineEntry__analogReminderImageProvider__block_invoke)(v19, v16);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_analogReminderImageProvider___lock);
  v17 = (void *)_analogReminderImageProvider_imageProvider;

  return v17;
}

void __56__NTKReminderTimelineEntry__analogReminderImageProvider__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F19A68];
  uint64_t v1 = [(id)objc_opt_class() _reminderImageAnalog];
  uint64_t v2 = [v0 imageProviderWithOnePieceImage:v1];
  id v3 = (void *)_analogReminderImageProvider_imageProvider;
  _analogReminderImageProvider_imageProvider = v2;

  v4 = (void *)_analogReminderImageProvider_imageProvider;
  id v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v4 setTintColor:v5];
}

+ (id)lockedEntryForFamily:(int64_t)a3
{
  switch(a3)
  {
    case 104:
      id v3 = (void *)MEMORY[0x1E4F19AB0];
      v4 = NTKClockFaceLocalizedString(@"COMPLICATION_LOCKED_PLACEHOLDER_LONG_UTILITY", 0);
      id v5 = [v3 textProviderWithText:v4];

      id v6 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v5];
      goto LABEL_10;
    case 8:
      id v13 = (void *)MEMORY[0x1E4F19AB0];
      id v14 = NTKClockFaceLocalizedString(@"COMPLICATION_LOCKED_PLACEHOLDER_CORNER", 0);
      id v5 = [v13 textProviderWithText:v14];

      v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [v5 setTintColor:v15];

      v16 = [(id)objc_opt_class() _cornerReminderImageProvider];
      v17 = (void *)MEMORY[0x1E4F19888];
LABEL_9:
      id v6 = [v17 templateWithTextProvider:v5 imageProvider:v16];

      goto LABEL_10;
    case 3:
      v18 = (void *)MEMORY[0x1E4F19AB0];
      v19 = NTKClockFaceLocalizedString(@"COMPLICATION_LOCKED_PLACEHOLDER_LONG_UTILITY", 0);
      id v5 = [v18 textProviderWithText:v19];

      v16 = [a1 _analogReminderImageProvider];
      v17 = (void *)MEMORY[0x1E4F199E0];
      goto LABEL_9;
  }
  if (a3 != 1)
  {
    id v6 = 0;
    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x1E4F19AB0];
  uint64_t v9 = NTKClockFaceLocalizedString(@"REMINDERS_TITLE", @"Reminders");
  id v5 = [v8 textProviderWithText:v9];

  uint64_t v10 = (void *)MEMORY[0x1E4F19AB0];
  uint64_t v11 = NTKClockFaceLocalizedString(@"COMPLICATION_LOCKED_PLACEHOLDER_LARGE_MODULAR", 0);
  objc_super v12 = [v10 textProviderWithText:v11];

  id v6 = [MEMORY[0x1E4F19978] templateWithHeaderTextProvider:v5 body1TextProvider:v12];

LABEL_10:
  if (v6)
  {
    [v6 finalize];
    v20 = (void *)MEMORY[0x1E4F19A10];
    v21 = [MEMORY[0x1E4F1C9C8] date];
    v22 = [v20 entryWithDate:v21 complicationTemplate:v6];

    goto LABEL_14;
  }
LABEL_13:
  v22 = 0;
LABEL_14:

  return v22;
}

+ (id)loadingEntryForFamily:(int64_t)a3
{
  switch(a3)
  {
    case 104:
      id v3 = (void *)MEMORY[0x1E4F19AB0];
      v4 = NTKClockFaceLocalizedString(@"REMINDERS_FETCHING_LARGE_UTILITY", @"GETTING REMINDERS...");
      id v5 = [v3 textProviderWithText:v4];

      id v6 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v5];
      goto LABEL_10;
    case 8:
      id v13 = (void *)MEMORY[0x1E4F19AB0];
      id v14 = NTKClockFaceLocalizedString(@"REMINDERS_FETCHING_CORNER", @"Getting reminders...");
      v15 = NTKClockFaceLocalizedString(@"REMINDERS_FETCHING_CORNER_SHORT", @"Loading...");
      id v5 = [v13 textProviderWithText:v14 shortText:v15];

      v16 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [v5 setTintColor:v16];

      v17 = [(id)objc_opt_class() _cornerReminderImageProvider];
      v18 = (void *)MEMORY[0x1E4F19888];
LABEL_9:
      id v6 = [v18 templateWithTextProvider:v5 imageProvider:v17];

      goto LABEL_10;
    case 3:
      v19 = (void *)MEMORY[0x1E4F19AB0];
      v20 = NTKClockFaceLocalizedString(@"REMINDERS_FETCHING_LARGE_UTILITY", @"GETTING REMINDERS...");
      id v5 = [v19 textProviderWithText:v20];

      v17 = [a1 _analogReminderImageProvider];
      v18 = (void *)MEMORY[0x1E4F199E0];
      goto LABEL_9;
  }
  if (a3 != 1)
  {
    id v6 = 0;
    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x1E4F19AB0];
  uint64_t v9 = NTKClockFaceLocalizedString(@"REMINDERS_TITLE", @"Reminders");
  id v5 = [v8 textProviderWithText:v9];

  uint64_t v10 = (void *)MEMORY[0x1E4F19AB0];
  uint64_t v11 = NTKClockFaceLocalizedString(@"REMINDERS_FETCHING_LARGE_MODULAR", @"Getting reminders...");
  objc_super v12 = [v10 textProviderWithText:v11];

  id v6 = [MEMORY[0x1E4F19978] templateWithHeaderTextProvider:v5 body1TextProvider:v12];

LABEL_10:
  if (v6)
  {
    [v6 finalize];
    v21 = (void *)MEMORY[0x1E4F19A10];
    v22 = [MEMORY[0x1E4F1C9C8] date];
    v23 = [v21 entryWithDate:v22 complicationTemplate:v6];

    goto LABEL_14;
  }
LABEL_13:
  v23 = 0;
LABEL_14:

  return v23;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
}

- (NSString)primaryReminderTitle
{
  return self->_primaryReminderTitle;
}

- (void)setPrimaryReminderTitle:(id)a3
{
}

- (NSString)primaryReminderId
{
  return self->_primaryReminderId;
}

- (void)setPrimaryReminderId:(id)a3
{
}

- (NSString)secondaryReminderTitle
{
  return self->_secondaryReminderTitle;
}

- (void)setSecondaryReminderTitle:(id)a3
{
}

- (BOOL)displayAsConflicting
{
  return self->_displayAsConflicting;
}

- (void)setDisplayAsConflicting:(BOOL)a3
{
  self->_displayAsConflicting = a3;
}

- (unint64_t)overlappingReminderCount
{
  return self->_overlappingReminderCount;
}

- (void)setOverlappingReminderCount:(unint64_t)a3
{
  self->_overlappingReminderCount = a3;
}

- (UIColor)primaryReminderParentListColor
{
  return self->_primaryReminderParentListColor;
}

- (void)setPrimaryReminderParentListColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryReminderParentListColor, 0);
  objc_storeStrong((id *)&self->_secondaryReminderTitle, 0);
  objc_storeStrong((id *)&self->_primaryReminderId, 0);
  objc_storeStrong((id *)&self->_primaryReminderTitle, 0);

  objc_storeStrong((id *)&self->_dueDate, 0);
}

@end