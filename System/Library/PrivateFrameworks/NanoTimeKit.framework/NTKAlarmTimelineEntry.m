@interface NTKAlarmTimelineEntry
+ (id)companionModelWithDevice:(id)a3;
- (BOOL)_pairedDeviceSupportsComplicationSymbols;
- (NSDate)fireDate;
- (NSDate)snoozeDate;
- (NSString)alarmLabel;
- (NTKAlarmTimelineEntry)initWithDevice:(id)a3;
- (id)_activeStateTimeRelativeDateTextProvider;
- (id)_activeStateTimeTextProvider;
- (id)_circularTemplateForAlarm:(BOOL)a3;
- (id)_extraLargeAlarmInactiveImageProvider;
- (id)_getAlarmImageProviderWithActiveStatus:(BOOL)a3;
- (id)_largeUtilityInactiveImageProvider;
- (id)_modularSmallAlarmInactiveImageProvider;
- (id)_newCircularMediumTemplate;
- (id)_newCircularSmallTemplate;
- (id)_newExtraLargeTemplate;
- (id)_newLargeModularTemplate;
- (id)_newLargeUtilityTemplate;
- (id)_newSignatureBezelTemplate;
- (id)_newSignatureCircularTemplate;
- (id)_newSignatureCornerTemplate;
- (id)_newSignatureExtraLargeCircularTemplate;
- (id)_newSignatureRectangularTemplate;
- (id)_newSmallFlatUtilityTemplate;
- (id)_newSmallModularTemplate;
- (id)_richCircularMetadata;
- (id)_snoozeStateDateTextProvider;
- (id)description;
- (id)templateForComplicationFamily:(int64_t)a3;
- (unint64_t)entryType;
- (void)_makeAlarmStackTextTimeProvider:(id *)a3 designatorProvider:(id *)a4 designatorExists:(BOOL *)a5 designatorLeads:(BOOL *)a6;
- (void)setAlarmLabel:(id)a3;
- (void)setEntryType:(unint64_t)a3;
- (void)setFireDate:(id)a3;
- (void)setSnoozeDate:(id)a3;
@end

@implementation NTKAlarmTimelineEntry

+ (id)companionModelWithDevice:(id)a3
{
  id v3 = a3;
  v4 = [[NTKAlarmTimelineEntry alloc] initWithDevice:v3];

  [(NTKAlarmTimelineEntry *)v4 setEntryType:4];
  v5 = NTKClockFaceLocalizedString(@"ALARMS_TITLE", 0);
  [(NTKAlarmTimelineEntry *)v4 setAlarmLabel:v5];

  v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v7 = +[CLKDate unmodifiedDate];
  v8 = [v6 dateBySettingHour:7 minute:0 second:0 ofDate:v7 options:0];
  [(NTKAlarmTimelineEntry *)v4 setFireDate:v8];

  return v4;
}

- (NTKAlarmTimelineEntry)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKAlarmTimelineEntry;
  v6 = [(NTKAlarmTimelineEntry *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  id v5 = 0;
  switch(a3)
  {
    case 0:
      id v6 = [(NTKAlarmTimelineEntry *)self _newSmallModularTemplate];
      goto LABEL_13;
    case 1:
      id v6 = [(NTKAlarmTimelineEntry *)self _newLargeModularTemplate];
      goto LABEL_13;
    case 2:
    case 6:
      id v6 = [(NTKAlarmTimelineEntry *)self _newSmallFlatUtilityTemplate];
      goto LABEL_13;
    case 3:
      id v6 = [(NTKAlarmTimelineEntry *)self _newLargeUtilityTemplate];
      goto LABEL_13;
    case 4:
      id v6 = [(NTKAlarmTimelineEntry *)self _newCircularSmallTemplate];
      goto LABEL_13;
    case 7:
      id v6 = [(NTKAlarmTimelineEntry *)self _newExtraLargeTemplate];
      goto LABEL_13;
    case 8:
      id v6 = [(NTKAlarmTimelineEntry *)self _newSignatureCornerTemplate];
      goto LABEL_13;
    case 9:
      id v6 = [(NTKAlarmTimelineEntry *)self _newSignatureBezelTemplate];
      goto LABEL_13;
    case 10:
      id v6 = [(NTKAlarmTimelineEntry *)self _newSignatureCircularTemplate];
      goto LABEL_13;
    case 11:
      id v6 = [(NTKAlarmTimelineEntry *)self _newSignatureRectangularTemplate];
      goto LABEL_13;
    case 12:
      id v6 = [(NTKAlarmTimelineEntry *)self _newSignatureExtraLargeCircularTemplate];
LABEL_13:
      id v5 = v6;
      break;
    default:
      break;
  }
  if (*MEMORY[0x1E4F19648] == a3)
  {
    id v7 = [(NTKAlarmTimelineEntry *)self _newCircularMediumTemplate];

    id v5 = v7;
  }
  v8 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v5 setTintColor:v8];

  return v5;
}

- (id)_newSmallModularTemplate
{
  switch([(NTKAlarmTimelineEntry *)self entryType])
  {
    case 0uLL:
      id v3 = [(NTKAlarmTimelineEntry *)self _modularSmallAlarmInactiveImageProvider];
      v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"UNKNOWN_TIME";
      id v6 = @"‒‒:‒‒";
      goto LABEL_6;
    case 1uLL:
    case 3uLL:
      id v3 = [(NTKAlarmTimelineEntry *)self _modularSmallAlarmInactiveImageProvider];
      v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"ALARMS_NONE_SMALL";
      id v6 = @"NONE";
      goto LABEL_6;
    case 2uLL:
      id v3 = [(NTKAlarmTimelineEntry *)self _modularSmallAlarmInactiveImageProvider];
      v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"ALARMS_OFF_SMALL";
      id v6 = @"OFF";
LABEL_6:
      v8 = NTKClockFaceLocalizedString(v5, v6);
      id v7 = [v4 textProviderWithText:v8];

      break;
    case 4uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"modularAlarmActive"); {
      id v3 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm.waves.left.and.right.fill"];
      }
      v11 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v3 setTintColor:v11];

      uint64_t v10 = [(NTKAlarmTimelineEntry *)self _activeStateTimeTextProvider];
      goto LABEL_13;
    case 5uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"modularAlarmSnoozing"); {
      id v3 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"zzz"];
      }
      objc_super v9 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v3 setTintColor:v9];

      uint64_t v10 = [(NTKAlarmTimelineEntry *)self _snoozeStateDateTextProvider];
LABEL_13:
      id v7 = (void *)v10;
      break;
    default:
      id v3 = 0;
      id v7 = 0;
      break;
  }
  v12 = [MEMORY[0x1E4F199C8] templateWithLine1ImageProvider:v3 line2TextProvider:v7];

  return v12;
}

- (id)_newLargeModularTemplate
{
  switch([(NTKAlarmTimelineEntry *)self entryType])
  {
    case 0uLL:
      id v3 = (void *)MEMORY[0x1E4F19AB0];
      v4 = NTKClockFaceLocalizedString(@"ALARMS_TITLE", @"Alarm");
      id v5 = [v3 textProviderWithText:v4];

      id v6 = (void *)MEMORY[0x1E4F19AB0];
      id v7 = NTKClockFaceLocalizedString(@"UNKNOWN_TIME", @"‒‒:‒‒");
      v8 = [v6 textProviderWithText:v7];

      break;
    case 1uLL:
      objc_super v9 = (void *)MEMORY[0x1E4F19AB0];
      uint64_t v10 = NTKClockFaceLocalizedString(@"ALARMS_TITLE", @"Alarm");
      id v5 = [v9 textProviderWithText:v10];

      v11 = (void *)MEMORY[0x1E4F19AB0];
      v12 = @"ALARMS_NONE_LARGE";
      v13 = @"No Alarms";
      goto LABEL_7;
    case 2uLL:
      v14 = (void *)MEMORY[0x1E4F19AB0];
      v15 = NTKClockFaceLocalizedString(@"ALARMS_TITLE", @"Alarm");
      id v5 = [v14 textProviderWithText:v15];

      v11 = (void *)MEMORY[0x1E4F19AB0];
      v12 = @"ALARMS_OFF_LARGE";
      v13 = @"All alarms off";
      goto LABEL_7;
    case 3uLL:
      v16 = (void *)MEMORY[0x1E4F19AB0];
      v17 = NTKClockFaceLocalizedString(@"ALARMS_TITLE", @"Alarm");
      id v5 = [v16 textProviderWithText:v17];

      v11 = (void *)MEMORY[0x1E4F19AB0];
      v12 = @"ALARMS_NOT_UPCOMING_LARGE";
      v13 = @"None upcoming";
LABEL_7:
      v18 = NTKClockFaceLocalizedString(v12, v13);
      v8 = [v11 textProviderWithText:v18];

      uint64_t v19 = [MEMORY[0x1E4F19978] templateWithHeaderTextProvider:v5 body1TextProvider:v8];
      goto LABEL_12;
    case 4uLL:
      v20 = (void *)MEMORY[0x1E4F19AB0];
      v21 = NTKClockFaceLocalizedString(@"ALARMS_TITLE", @"Alarm");
      id v5 = [v20 textProviderWithText:v21];

      uint64_t v22 = [(NTKAlarmTimelineEntry *)self _activeStateTimeTextProvider];
      goto LABEL_10;
    case 5uLL:
      v23 = (void *)MEMORY[0x1E4F19AB0];
      v24 = NTKClockFaceLocalizedString(@"ALARMS_SNOOZE", @"Snooze");
      id v5 = [v23 textProviderWithText:v24];

      uint64_t v22 = [(NTKAlarmTimelineEntry *)self _snoozeStateDateTextProvider];
LABEL_10:
      v8 = (void *)v22;
      break;
    default:
      id v5 = 0;
      v8 = 0;
      break;
  }
  uint64_t v19 = [MEMORY[0x1E4F19988] templateWithHeaderTextProvider:v5 bodyTextProvider:v8];
LABEL_12:
  v25 = (void *)v19;

  return v25;
}

- (id)_circularTemplateForAlarm:(BOOL)a3
{
  BOOL v3 = a3;
  __int16 v19 = 0;
  id v17 = 0;
  id v18 = 0;
  [(NTKAlarmTimelineEntry *)self _makeAlarmStackTextTimeProvider:&v18 designatorProvider:&v17 designatorExists:(char *)&v19 + 1 designatorLeads:&v19];
  id v4 = v18;
  id v5 = v17;
  id v6 = v5;
  if (HIBYTE(v19)) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || v5 == 0)
  {
    if (v3) {
      objc_super v9 = (void *)MEMORY[0x1E4F19708];
    }
    else {
      objc_super v9 = (void *)MEMORY[0x1E4F19748];
    }
    v15 = [v9 templateWithTextProvider:v4];
  }
  else
  {
    if ((_BYTE)v19) {
      uint64_t v10 = v5;
    }
    else {
      uint64_t v10 = v4;
    }
    v11 = (void **)0x1E4F19718;
    if ((_BYTE)v19) {
      id v12 = v4;
    }
    else {
      id v12 = v5;
    }
    if (!v3) {
      v11 = (void **)0x1E4F19758;
    }
    v13 = *v11;
    id v14 = v10;
    v15 = [v13 templateWithLine1TextProvider:v14 line2TextProvider:v12];
  }

  return v15;
}

- (void)_makeAlarmStackTextTimeProvider:(id *)a3 designatorProvider:(id *)a4 designatorExists:(BOOL *)a5 designatorLeads:(BOOL *)a6
{
  id v18 = (id)objc_opt_new();
  v11 = [(NTKAlarmTimelineEntry *)self fireDate];
  [v18 setOverrideDate:v11];

  [v18 _setUseNarrowDesignatorTextForGerman:1];
  if (a3)
  {
    id v12 = (void *)MEMORY[0x1E4F19AB0];
    v13 = [v18 timeText];
    *a3 = [v12 textProviderWithText:v13];
  }
  if (a4)
  {
    id v14 = (void *)MEMORY[0x1E4F19AB0];
    v15 = [v18 designatorText];
    *a4 = [v14 textProviderWithText:v15];
  }
  v16 = v18;
  if (a5)
  {
    *a5 = [v18 timeAndDesignatorTextHasDesignator];
    v16 = v18;
  }
  if (a6)
  {
    int v17 = [v16 timeAndDesignatorTextHasDesignator];
    if (v17) {
      LOBYTE(v17) = [v18 timeAndDesignatorTextStartsWithDesignator];
    }
    *a6 = v17;
    v16 = v18;
  }
}

- (id)_newCircularSmallTemplate
{
  unint64_t v3 = [(NTKAlarmTimelineEntry *)self entryType];
  if (v3 >= 4)
  {
    if (v3 == 5)
    {
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"colorAnalogAlarmSnooze"); {
      v8 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"zzz"];
      }
      objc_super v9 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v8 setTintColor:v9];

      uint64_t v10 = [(NTKAlarmTimelineEntry *)self _snoozeStateDateTextProvider];
      id v6 = [MEMORY[0x1E4F19750] templateWithLine1ImageProvider:v8 line2TextProvider:v10];
    }
    else if (v3 == 4)
    {
      [(NTKAlarmTimelineEntry *)self _circularTemplateForAlarm:0];
      return (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"colorAnalogAlarm"); {
    id v4 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm"];
    }
    id v5 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    [v4 setTintColor:v5];

    id v6 = [MEMORY[0x1E4F19740] templateWithImageProvider:v4];
  }
  return v6;
}

- (id)_newCircularMediumTemplate
{
  unint64_t v3 = [(NTKAlarmTimelineEntry *)self entryType];
  if (v3 >= 4)
  {
    if (v3 == 5)
    {
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"victoryNTKAlarmSnooze"); {
      v8 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"zzz"];
      }
      objc_super v9 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v8 setTintColor:v9];

      uint64_t v10 = [(NTKAlarmTimelineEntry *)self _snoozeStateDateTextProvider];
      id v6 = [MEMORY[0x1E4F19710] templateWithLine1ImageProvider:v8 line2TextProvider:v10];
    }
    else if (v3 == 4)
    {
      [(NTKAlarmTimelineEntry *)self _circularTemplateForAlarm:1];
      return (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"victoryNTKAlarm"); {
    id v4 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm"];
    }
    id v5 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    [v4 setTintColor:v5];

    id v6 = [MEMORY[0x1E4F19700] templateWithImageProvider:v4];
  }
  return v6;
}

- (id)_newSmallFlatUtilityTemplate
{
  switch([(NTKAlarmTimelineEntry *)self entryType])
  {
    case 0uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"analogAlarmInactive"); {
      unint64_t v3 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm"];
      }
      id v5 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v3 setTintColor:v5];

      id v6 = (void *)MEMORY[0x1E4F19AB0];
      BOOL v7 = @"UNKNOWN_TIME";
      v8 = @"‒‒:‒‒";
      goto LABEL_18;
    case 1uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"analogAlarmInactive"); {
      goto LABEL_9;
      }
    case 2uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"analogAlarmInactive"); {
      unint64_t v3 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm"];
      }
      objc_super v9 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v3 setTintColor:v9];

      id v6 = (void *)MEMORY[0x1E4F19AB0];
      BOOL v7 = @"ALARMS_OFF_SMALL";
      v8 = @"OFF";
      goto LABEL_18;
    case 3uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"analogAlarmInactive"); {
LABEL_9:
      }
      unint64_t v3 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm"];
      uint64_t v10 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v3 setTintColor:v10];

      id v6 = (void *)MEMORY[0x1E4F19AB0];
      BOOL v7 = @"ALARMS_NONE_SMALL";
      v8 = @"NONE";
LABEL_18:
      v11 = NTKClockFaceLocalizedString(v7, v8);
      id v4 = [v6 textProviderWithText:v11];

      break;
    case 4uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"analogAlarmActive"); {
      unint64_t v3 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm.waves.left.and.right.fill"];
      }
      id v12 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v3 setTintColor:v12];

      uint64_t v13 = [(NTKAlarmTimelineEntry *)self _activeStateTimeTextProvider];
      goto LABEL_21;
    case 5uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"analogAlarmSnooze"); {
      unint64_t v3 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"zzz"];
      }
      id v14 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v3 setTintColor:v14];

      uint64_t v13 = [(NTKAlarmTimelineEntry *)self _snoozeStateDateTextProvider];
LABEL_21:
      id v4 = (void *)v13;
      break;
    default:
      unint64_t v3 = 0;
      id v4 = 0;
      break;
  }
  v15 = [MEMORY[0x1E4F199E8] templateWithTextProvider:v4 imageProvider:v3];

  return v15;
}

- (id)_newLargeUtilityTemplate
{
  switch([(NTKAlarmTimelineEntry *)self entryType])
  {
    case 0uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _largeUtilityInactiveImageProvider];
      id v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"UNKNOWN_TIME";
      id v6 = @"‒‒:‒‒";
      goto LABEL_6;
    case 1uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _largeUtilityInactiveImageProvider];
      id v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"ALARMS_NONE_LARGE_ALL_CAPS";
      id v6 = @"NO ALARMS";
      goto LABEL_6;
    case 2uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _largeUtilityInactiveImageProvider];
      BOOL v7 = (void *)MEMORY[0x1E4F19AB0];
      v8 = NTKClockFaceLocalizedString(@"ALARMS_OFF_LARGE_ALL_CAPS", @"ALL ALARMS OFF");
      objc_super v9 = NTKClockFaceLocalizedString(@"ALARMS_OFF_LARGE_ALL_CAPS_SHORT", @"ALARMS OFF");
      uint64_t v10 = [v7 textProviderWithText:v8 shortText:v9];

      goto LABEL_7;
    case 3uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _largeUtilityInactiveImageProvider];
      id v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"ALARMS_NOT_UPCOMING_LARGE_ALL_CAPS";
      id v6 = @"NONE UPCOMING";
LABEL_6:
      v8 = NTKClockFaceLocalizedString(v5, v6);
      uint64_t v10 = [v4 textProviderWithText:v8];
LABEL_7:

      break;
    case 4uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"analogAlarmActive"); {
      unint64_t v3 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm.waves.left.and.right.fill"];
      }
      v11 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v3 setTintColor:v11];

      uint64_t v12 = [(NTKAlarmTimelineEntry *)self _activeStateTimeTextProvider];
      goto LABEL_15;
    case 5uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"analogAlarmSnooze"); {
      unint64_t v3 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"zzz"];
      }
      uint64_t v13 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v3 setTintColor:v13];

      uint64_t v12 = [(NTKAlarmTimelineEntry *)self _snoozeStateDateTextProvider];
LABEL_15:
      uint64_t v10 = (void *)v12;
      break;
    default:
      unint64_t v3 = 0;
      uint64_t v10 = 0;
      break;
  }
  id v14 = [MEMORY[0x1E4F199E0] templateWithTextProvider:v10 imageProvider:v3];

  return v14;
}

- (id)_newExtraLargeTemplate
{
  switch([(NTKAlarmTimelineEntry *)self entryType])
  {
    case 0uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _extraLargeAlarmInactiveImageProvider];
      id v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"UNKNOWN_TIME";
      id v6 = @"‒‒:‒‒";
      goto LABEL_6;
    case 1uLL:
    case 3uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _extraLargeAlarmInactiveImageProvider];
      id v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"ALARMS_NONE_SMALL";
      id v6 = @"NONE";
      goto LABEL_6;
    case 2uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _extraLargeAlarmInactiveImageProvider];
      id v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"ALARMS_OFF_SMALL";
      id v6 = @"OFF";
LABEL_6:
      v8 = NTKClockFaceLocalizedString(v5, v6);
      BOOL v7 = [v4 textProviderWithText:v8];

      break;
    case 4uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"XLmodularAlarmActive"); {
      unint64_t v3 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm.waves.left.and.right.fill"];
      }
      v11 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v3 setTintColor:v11];

      uint64_t v10 = [(NTKAlarmTimelineEntry *)self _activeStateTimeTextProvider];
      goto LABEL_13;
    case 5uLL:
      if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"XLmodularAlarmSnoozing"); {
      unint64_t v3 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"zzz"];
      }
      objc_super v9 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      [v3 setTintColor:v9];

      uint64_t v10 = [(NTKAlarmTimelineEntry *)self _snoozeStateDateTextProvider];
LABEL_13:
      BOOL v7 = (void *)v10;
      break;
    default:
      unint64_t v3 = 0;
      BOOL v7 = 0;
      break;
  }
  uint64_t v12 = [MEMORY[0x1E4F197A8] templateWithLine1ImageProvider:v3 line2TextProvider:v7];

  return v12;
}

- (id)_newSignatureCornerTemplate
{
  switch([(NTKAlarmTimelineEntry *)self entryType])
  {
    case 0uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _getAlarmImageProviderWithActiveStatus:0];
      id v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"UNKNOWN_TIME";
      id v6 = @"‒‒:‒‒";
      goto LABEL_7;
    case 1uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _getAlarmImageProviderWithActiveStatus:0];
      id v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"ALARMS_NONE_CORNER";
      id v6 = @"NO ALARMS";
      goto LABEL_7;
    case 2uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _getAlarmImageProviderWithActiveStatus:0];
      v8 = (void *)MEMORY[0x1E4F19AB0];
      objc_super v9 = NTKClockFaceLocalizedString(@"ALARMS_OFF_CORNER", @"ALL ALARMS OFF");
      uint64_t v10 = NTKClockFaceLocalizedString(@"ALARMS_OFF_CORNER_SHORT", @"ALARMS OFF");
      BOOL v7 = [v8 textProviderWithText:v9 shortText:v10];

      goto LABEL_11;
    case 3uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _getAlarmImageProviderWithActiveStatus:0];
      id v4 = (void *)MEMORY[0x1E4F19AB0];
      id v5 = @"ALARMS_NOT_UPCOMING_CORNER";
      id v6 = @"NONE UPCOMING";
LABEL_7:
      objc_super v9 = NTKClockFaceLocalizedString(v5, v6);
      BOOL v7 = [v4 textProviderWithText:v9];
      goto LABEL_11;
    case 4uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _getAlarmImageProviderWithActiveStatus:1];
      v11 = (void *)MEMORY[0x1E4F19AC0];
      objc_super v9 = NTKClockFaceLocalizedString(@"ALARM_LABEL_CORNER_FORMAT", @"ALARM %@");
      uint64_t v12 = [(NTKAlarmTimelineEntry *)self _activeStateTimeTextProvider];
      goto LABEL_10;
    case 5uLL:
      unint64_t v3 = [(NTKAlarmTimelineEntry *)self _getAlarmImageProviderWithActiveStatus:1];
      v11 = (void *)MEMORY[0x1E4F19AC0];
      objc_super v9 = NTKClockFaceLocalizedString(@"SNOOZING_LABEL_CORNER_FORMAT", @"SNOOZING %@");
      uint64_t v12 = [(NTKAlarmTimelineEntry *)self _snoozeStateDateTextProvider];
LABEL_10:
      uint64_t v13 = (void *)v12;
      BOOL v7 = objc_msgSend(v11, "textProviderWithFormat:", v9, v12);

LABEL_11:
      break;
    default:
      unint64_t v3 = 0;
      BOOL v7 = 0;
      break;
  }
  id v14 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v7 setTintColor:v14];

  v15 = [MEMORY[0x1E4F19888] templateWithTextProvider:v7 imageProvider:v3];

  return v15;
}

- (id)_getAlarmImageProviderWithActiveStatus:(BOOL)a3
{
  BOOL v3 = a3;
  v19[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    v19[0] = v5;
    id v6 = [MEMORY[0x1E4FB1618] whiteColor];
    v19[1] = v6;
    BOOL v7 = v19;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] whiteColor];
    v18[0] = v5;
    id v6 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    v18[1] = v6;
    BOOL v7 = v18;
  }
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  objc_super v9 = [MEMORY[0x1E4FB1830] _configurationWithHierarchicalColors:v8];
  uint64_t v10 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
  v11 = [v10 configurationByApplyingConfiguration:v9];
  uint64_t v12 = [MEMORY[0x1E4FB1818] systemImageNamed:@"alarm.waves.left.and.right.fill" withConfiguration:v11];
  uint64_t v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"alarm" withConfiguration:v11];
  if (![(NTKAlarmTimelineEntry *)self _pairedDeviceSupportsComplicationSymbols])NTKImageNamed(@"fullColorAnalogAlarm"); {
  if (v3)
  }
    id v14 = v12;
  else {
    id v14 = v13;
  }
  id v15 = v14;
  v16 = [MEMORY[0x1E4F19A58] providerWithFullColorImage:v15 monochromeFilterType:1 applyScalingAndCircularMasking:0];

  return v16;
}

- (id)_richCircularMetadata
{
  v19[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v4 = [(NTKAlarmTimelineEntry *)self entryType];
  if (v4 == 4)
  {
    [v3 setObject:@"NTKAlarmComplicationMetadataStateValue_Set" forKeyedSubscript:@"NTKAlarmComplicationMetadataStateKey"];
    __int16 v18 = 0;
    id v16 = 0;
    id v17 = 0;
    [(NTKAlarmTimelineEntry *)self _makeAlarmStackTextTimeProvider:&v17 designatorProvider:&v16 designatorExists:(char *)&v18 + 1 designatorLeads:&v18];
    id v6 = v17;
    id v12 = v16;
    [v3 setObject:v6 forKeyedSubscript:@"NTKAlarmComplicationMetadataTimeTextProviderKey"];
    [v3 setObject:v12 forKeyedSubscript:@"NTKAlarmComplicationMetadataDesignatorTextProviderKey"];

    uint64_t v13 = [NSNumber numberWithBool:HIBYTE(v18)];
    [v3 setObject:v13 forKeyedSubscript:@"NTKAlarmComplicationMetadataDesignatorExistsKey"];

    id v14 = [NSNumber numberWithBool:v18];
    [v3 setObject:v14 forKeyedSubscript:@"NTKAlarmComplicationMetadataDesignatorLeadsKey"];

    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F19698]];
    goto LABEL_5;
  }
  if (v4 == 5)
  {
    [v3 setObject:@"NTKAlarmComplicationMetadataStateValue_Snooze" forKeyedSubscript:@"NTKAlarmComplicationMetadataStateKey"];
    id v5 = [(NTKAlarmTimelineEntry *)self _snoozeStateDateTextProvider];
    [v3 setObject:v5 forKeyedSubscript:@"NTKAlarmComplicationMetadataTimeTextProviderKey"];

    id v6 = [(NTKAlarmTimelineEntry *)self snoozeDate];
    BOOL v7 = [v6 dateByAddingTimeInterval:-540.0];
    v8 = (void *)MEMORY[0x1E4F19AD8];
    objc_super v9 = [MEMORY[0x1E4FB1618] systemOrangeColor];
    v19[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    v11 = [v8 gaugeProviderWithStyle:1 gaugeColors:v10 gaugeColorLocations:0 startDate:v7 endDate:v6];
    [v3 setObject:v11 forKeyedSubscript:@"NTKAlarmComplicationMetadataGaugeProviderKey"];

LABEL_5:
    goto LABEL_7;
  }
  [v3 setObject:@"NTKAlarmComplicationMetadataStateValue_Idle" forKeyedSubscript:@"NTKAlarmComplicationMetadataStateKey"];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F19698]];
LABEL_7:

  return v3;
}

- (id)_newSignatureCircularTemplate
{
  v2 = (void *)MEMORY[0x1E4F197E8];
  BOOL v3 = [(NTKAlarmTimelineEntry *)self _richCircularMetadata];
  unint64_t v4 = [v2 templateWithMetadata:v3];

  return v4;
}

- (id)_newSignatureExtraLargeCircularTemplate
{
  v2 = (void *)MEMORY[0x1E4F198B8];
  BOOL v3 = [(NTKAlarmTimelineEntry *)self _richCircularMetadata];
  unint64_t v4 = [v2 templateWithMetadata:v3];

  return v4;
}

- (id)_newSignatureBezelTemplate
{
  v2 = (void *)MEMORY[0x1E4F197B8];
  id v3 = [(NTKAlarmTimelineEntry *)self _newSignatureCircularTemplate];
  unint64_t v4 = [v2 templateWithCircularTemplate:v3];

  return v4;
}

- (id)_newSignatureRectangularTemplate
{
  switch([(NTKAlarmTimelineEntry *)self entryType])
  {
    case 0uLL:
      id v3 = (void *)MEMORY[0x1E4F19AB0];
      unint64_t v4 = @"UNKNOWN_TIME";
      id v5 = @"‒‒:‒‒";
      goto LABEL_6;
    case 1uLL:
      id v3 = (void *)MEMORY[0x1E4F19AB0];
      unint64_t v4 = @"ALARMS_NONE_LARGE";
      id v5 = @"No Alarms";
      goto LABEL_6;
    case 2uLL:
      id v3 = (void *)MEMORY[0x1E4F19AB0];
      unint64_t v4 = @"ALARMS_OFF_LARGE";
      id v5 = @"All alarms off";
      goto LABEL_6;
    case 3uLL:
      id v3 = (void *)MEMORY[0x1E4F19AB0];
      unint64_t v4 = @"ALARMS_NOT_UPCOMING_LARGE";
      id v5 = @"None upcoming";
LABEL_6:
      id v6 = NTKClockFaceLocalizedString(v4, v5);
      [v3 textProviderWithText:v6];
      objc_claimAutoreleasedReturnValue();

      break;
    case 4uLL:
      [(NTKAlarmTimelineEntry *)self _activeStateTimeTextProvider];
      objc_claimAutoreleasedReturnValue();
      [(NTKAlarmTimelineEntry *)self _activeStateTimeRelativeDateTextProvider];
      objc_claimAutoreleasedReturnValue();
      break;
    case 5uLL:
      BOOL v7 = (void *)MEMORY[0x1E4F19AB0];
      v8 = NTKClockFaceLocalizedString(@"ALARMS_SNOOZE", @"Snooze");
      [v7 textProviderWithText:v8];
      objc_claimAutoreleasedReturnValue();

      [(NTKAlarmTimelineEntry *)self _snoozeStateDateTextProvider];
      objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  NTKImageNamed(@"fullColorRectangularAlarm");
}

- (id)_activeStateTimeTextProvider
{
  v2 = (void *)MEMORY[0x1E4F19AE0];
  id v3 = [(NTKAlarmTimelineEntry *)self fireDate];
  unint64_t v4 = [v2 textProviderWithDate:v3];

  [v4 setDisallowBothMinutesAndDesignator:0];

  return v4;
}

- (id)_activeStateTimeRelativeDateTextProvider
{
  v2 = (void *)MEMORY[0x1E4F19A88];
  id v3 = [(NTKAlarmTimelineEntry *)self fireDate];
  unint64_t v4 = [v2 textProviderWithDate:v3 style:0 units:96];

  return v4;
}

- (id)_snoozeStateDateTextProvider
{
  v2 = (void *)MEMORY[0x1E4F19A88];
  id v3 = [(NTKAlarmTimelineEntry *)self snoozeDate];
  unint64_t v4 = [v2 textProviderWithDate:v3 style:2 units:224];

  return v4;
}

- (id)_modularSmallAlarmInactiveImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_modularSmallAlarmInactiveImageProvider___lock);
  id WeakRetained = objc_loadWeakRetained(&_modularSmallAlarmInactiveImageProvider___cachedDevice);
  if (WeakRetained)
  {
    unint64_t v4 = WeakRetained;
    id v5 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    id v6 = [v5 device];
    id v7 = objc_loadWeakRetained(&_modularSmallAlarmInactiveImageProvider___cachedDevice);
    if (v6 == v7)
    {
      v8 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      objc_super v9 = [v8 device];
      uint64_t v10 = [v9 version];
      uint64_t v11 = _modularSmallAlarmInactiveImageProvider___previousCLKDeviceVersion;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v12 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  uint64_t v13 = [v12 device];
  objc_storeWeak(&_modularSmallAlarmInactiveImageProvider___cachedDevice, v13);

  id v14 = objc_loadWeakRetained(&_modularSmallAlarmInactiveImageProvider___cachedDevice);
  _modularSmallAlarmInactiveImageProvider___previousCLKDeviceVersion = [v14 version];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __64__NTKAlarmTimelineEntry__modularSmallAlarmInactiveImageProvider__block_invoke;
  void v19[3] = &unk_1E62C26B8;
  v19[4] = self;
  id v15 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v16 = [v15 device];
  ((void (*)(void *, void *))__64__NTKAlarmTimelineEntry__modularSmallAlarmInactiveImageProvider__block_invoke)(v19, v16);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_modularSmallAlarmInactiveImageProvider___lock);
  id v17 = (void *)_modularSmallAlarmInactiveImageProvider_glyphImageProvider;

  return v17;
}

void __64__NTKAlarmTimelineEntry__modularSmallAlarmInactiveImageProvider__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _pairedDeviceSupportsComplicationSymbols] & 1) == 0) {
    NTKImageNamed(@"modularAlarmInactive");
  }
  uint64_t v1 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm"];
  v2 = (void *)_modularSmallAlarmInactiveImageProvider_glyphImageProvider;
  _modularSmallAlarmInactiveImageProvider_glyphImageProvider = v1;

  id v3 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [(id)_modularSmallAlarmInactiveImageProvider_glyphImageProvider setTintColor:v3];
}

- (id)_extraLargeAlarmInactiveImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_extraLargeAlarmInactiveImageProvider___lock);
  id WeakRetained = objc_loadWeakRetained(&_extraLargeAlarmInactiveImageProvider___cachedDevice);
  if (WeakRetained)
  {
    unint64_t v4 = WeakRetained;
    id v5 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    id v6 = [v5 device];
    id v7 = objc_loadWeakRetained(&_extraLargeAlarmInactiveImageProvider___cachedDevice);
    if (v6 == v7)
    {
      v8 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      objc_super v9 = [v8 device];
      uint64_t v10 = [v9 version];
      uint64_t v11 = _extraLargeAlarmInactiveImageProvider___previousCLKDeviceVersion;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v12 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  uint64_t v13 = [v12 device];
  objc_storeWeak(&_extraLargeAlarmInactiveImageProvider___cachedDevice, v13);

  id v14 = objc_loadWeakRetained(&_extraLargeAlarmInactiveImageProvider___cachedDevice);
  _extraLargeAlarmInactiveImageProvider___previousCLKDeviceVersion = [v14 version];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __62__NTKAlarmTimelineEntry__extraLargeAlarmInactiveImageProvider__block_invoke;
  void v19[3] = &unk_1E62C26B8;
  v19[4] = self;
  id v15 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v16 = [v15 device];
  ((void (*)(void *, void *))__62__NTKAlarmTimelineEntry__extraLargeAlarmInactiveImageProvider__block_invoke)(v19, v16);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_extraLargeAlarmInactiveImageProvider___lock);
  id v17 = (void *)_extraLargeAlarmInactiveImageProvider_glyphImageProvider;

  return v17;
}

void __62__NTKAlarmTimelineEntry__extraLargeAlarmInactiveImageProvider__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _pairedDeviceSupportsComplicationSymbols] & 1) == 0) {
    NTKImageNamed(@"XLmodularAlarmInactive");
  }
  uint64_t v1 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm"];
  v2 = (void *)_extraLargeAlarmInactiveImageProvider_glyphImageProvider;
  _extraLargeAlarmInactiveImageProvider_glyphImageProvider = v1;

  id v3 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [(id)_extraLargeAlarmInactiveImageProvider_glyphImageProvider setTintColor:v3];
}

- (id)_largeUtilityInactiveImageProvider
{
  os_unfair_lock_lock((os_unfair_lock_t)&_largeUtilityInactiveImageProvider___lock);
  id WeakRetained = objc_loadWeakRetained(&_largeUtilityInactiveImageProvider___cachedDevice);
  if (WeakRetained)
  {
    unint64_t v4 = WeakRetained;
    id v5 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    id v6 = [v5 device];
    id v7 = objc_loadWeakRetained(&_largeUtilityInactiveImageProvider___cachedDevice);
    if (v6 == v7)
    {
      v8 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
      objc_super v9 = [v8 device];
      uint64_t v10 = [v9 version];
      uint64_t v11 = _largeUtilityInactiveImageProvider___previousCLKDeviceVersion;

      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v12 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  uint64_t v13 = [v12 device];
  objc_storeWeak(&_largeUtilityInactiveImageProvider___cachedDevice, v13);

  id v14 = objc_loadWeakRetained(&_largeUtilityInactiveImageProvider___cachedDevice);
  _largeUtilityInactiveImageProvider___previousCLKDeviceVersion = [v14 version];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __59__NTKAlarmTimelineEntry__largeUtilityInactiveImageProvider__block_invoke;
  void v19[3] = &unk_1E62C26B8;
  v19[4] = self;
  id v15 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v16 = [v15 device];
  ((void (*)(void *, void *))__59__NTKAlarmTimelineEntry__largeUtilityInactiveImageProvider__block_invoke)(v19, v16);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_largeUtilityInactiveImageProvider___lock);
  id v17 = (void *)_largeUtilityInactiveImageProvider_glyphImageProvider;

  return v17;
}

void __59__NTKAlarmTimelineEntry__largeUtilityInactiveImageProvider__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _pairedDeviceSupportsComplicationSymbols] & 1) == 0) {
    NTKImageNamed(@"analogAlarmInactive");
  }
  uint64_t v1 = [MEMORY[0x1E4F19AB8] symbolImageProviderWithSystemName:@"alarm"];
  v2 = (void *)_largeUtilityInactiveImageProvider_glyphImageProvider;
  _largeUtilityInactiveImageProvider_glyphImageProvider = v1;

  id v3 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [(id)_largeUtilityInactiveImageProvider_glyphImageProvider setTintColor:v3];
}

- (BOOL)_pairedDeviceSupportsComplicationSymbols
{
  return [(CLKDevice *)self->_device isRunningGloryGMOrLater];
}

- (id)description
{
  if (description_onceToken != -1) {
    dispatch_once(&description_onceToken, &__block_literal_global_35);
  }
  id v3 = NSString;
  unint64_t v4 = [(NTKTimelineEntryModel *)self entryDate];
  id v5 = _FormattedDate(v4);
  id v6 = objc_msgSend((id)description_typeNames, "objectAtIndexedSubscript:", -[NTKAlarmTimelineEntry entryType](self, "entryType"));
  id v7 = [(NTKAlarmTimelineEntry *)self alarmLabel];
  v8 = [(NTKAlarmTimelineEntry *)self fireDate];
  objc_super v9 = _FormattedDate(v8);
  uint64_t v10 = [(NTKAlarmTimelineEntry *)self snoozeDate];
  uint64_t v11 = _FormattedDate(v10);
  id v12 = [v3 stringWithFormat:@"EntryDate: %@\tType: %@\tLabel: %@\tFireDate: %@\tSnoozeDate: %@", v5, v6, v7, v9, v11];

  return v12;
}

void __36__NTKAlarmTimelineEntry_description__block_invoke()
{
  v0 = (void *)description_typeNames;
  description_typeNames = (uint64_t)&unk_1F16E9718;
}

- (unint64_t)entryType
{
  return self->_entryType;
}

- (void)setEntryType:(unint64_t)a3
{
  self->_entryType = a3;
}

- (NSString)alarmLabel
{
  return self->_alarmLabel;
}

- (void)setAlarmLabel:(id)a3
{
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
}

- (NSDate)snoozeDate
{
  return self->_snoozeDate;
}

- (void)setSnoozeDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snoozeDate, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_alarmLabel, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end