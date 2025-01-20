@interface NTKWidgetComplicationMigrationDefines
+ (BOOL)hasMigratedComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5;
+ (BOOL)hasMigratedComplicationType:(unint64_t)a3 forDevice:(id)a4;
+ (id)_complicationTypeToWidgetMigrations;
+ (id)migrateComplication:(id)a3 forFamily:(int64_t)a4;
@end

@implementation NTKWidgetComplicationMigrationDefines

+ (id)migrateComplication:(id)a3 forFamily:(int64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 complication];

    id v6 = (id)v7;
  }
  v8 = [a1 _complicationTypeToWidgetMigrations];
  v9 = [v8 migrationMap];
  v10 = [NTKWidgetComplicationMigrationKey alloc];
  uint64_t v11 = [v6 complicationType];
  v12 = [NSNumber numberWithInteger:a4];
  v13 = [(NTKWidgetComplicationMigrationKey *)v10 initWithComplicationType:v11 family:v12];
  v14 = [v9 objectForKey:v13];

  if (v14) {
    goto LABEL_5;
  }
  v15 = [a1 _complicationTypeToWidgetMigrations];
  v16 = [v15 migrationMap];
  v17 = -[NTKWidgetComplicationMigrationKey initWithComplicationType:family:]([NTKWidgetComplicationMigrationKey alloc], "initWithComplicationType:family:", [v6 complicationType], 0);
  v14 = [v16 objectForKey:v17];

  if (v14)
  {
LABEL_5:
    v18 = +[NTKWidgetComplication complicationWithDescriptor:v14];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)hasMigratedComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  char v7 = [v6 supportsWidgetMigration];
  v8 = [a1 _complicationTypeToWidgetMigrations];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v9 = [v8 migrationMap];
  v10 = [v9 allKeys];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__NTKWidgetComplicationMigrationDefines_hasMigratedComplicationType_forDevice___block_invoke;
  v14[3] = &unk_1E62C3A90;
  unint64_t v19 = a3;
  v17 = &v24;
  id v11 = v8;
  id v15 = v11;
  v18 = &v20;
  id v12 = v6;
  id v16 = v12;
  [v10 enumerateObjectsUsingBlock:v14];

  if (*((unsigned char *)v25 + 24))
  {
    if (!*((unsigned char *)v21 + 24)) {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v7;
}

void __79__NTKWidgetComplicationMigrationDefines_hasMigratedComplicationType_forDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if ([v8 complicationType] == *(void *)(a1 + 64))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
    id v6 = [*(id *)(a1 + 32) deviceCapabilityMap];
    char v7 = [v6 objectForKey:v8];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) supportsCapability:v7];
  }
}

+ (BOOL)hasMigratedComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v8 = a5;
  char v9 = [v8 supportsWidgetMigration];
  v10 = [a1 _complicationTypeToWidgetMigrations];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v11 = [v10 migrationMap];
  id v12 = [v11 allKeys];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__NTKWidgetComplicationMigrationDefines_hasMigratedComplicationType_family_forDevice___block_invoke;
  v16[3] = &unk_1E62C3AB8;
  unint64_t v21 = a3;
  int64_t v22 = a4;
  unint64_t v19 = &v27;
  id v13 = v10;
  id v17 = v13;
  uint64_t v20 = &v23;
  id v14 = v8;
  id v18 = v14;
  [v12 enumerateObjectsUsingBlock:v16];

  if (*((unsigned char *)v28 + 24))
  {
    if (!*((unsigned char *)v24 + 24)) {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v9;
}

void __86__NTKWidgetComplicationMigrationDefines_hasMigratedComplicationType_family_forDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  if ([v13 complicationType] == *(void *)(a1 + 64))
  {
    uint64_t v6 = [v13 family];
    if (!v6
      || (char v7 = (void *)v6,
          [v13 family],
          id v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 integerValue],
          uint64_t v10 = *(void *)(a1 + 72),
          v8,
          v7,
          v9 == v10))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
      id v11 = [*(id *)(a1 + 32) deviceCapabilityMap];
      id v12 = [v11 objectForKey:v13];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) supportsCapability:v12];
    }
  }
}

+ (id)_complicationTypeToWidgetMigrations
{
  if (_complicationTypeToWidgetMigrations_onceToken != -1) {
    dispatch_once(&_complicationTypeToWidgetMigrations_onceToken, &__block_literal_global_54);
  }
  v2 = objc_alloc_init(NTKWidgetComplicationMigrationInfo);
  [(NTKWidgetComplicationMigrationInfo *)v2 setMigrationMap:_complicationTypeToWidgetMigrations_typeToDescriptor];
  [(NTKWidgetComplicationMigrationInfo *)v2 setDeviceCapabilityMap:_complicationTypeToWidgetMigrations_typeToCapability];
  return v2;
}

void __76__NTKWidgetComplicationMigrationDefines__complicationTypeToWidgetMigrations__block_invoke()
{
  id v55 = (id)objc_opt_new();
  v0 = objc_opt_new();
  v1 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:28 family:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v1, @"com.apple.NanoHome.NanoHomeWidgets", @"com.apple.NanoHome", @"NanoHomeWidget", v2);

  v3 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:27 family:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v3, @"com.apple.NanoMail.NanoMailComplications", @"com.apple.NanoMail", @"NanoMailAppLauncher", v4);

  v5 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:33 family:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v5, @"com.apple.tincan.TinCan-Widget", @"com.apple.tincan", @"TinCan_Widget", v6);

  char v7 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:46 family:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v7, @"com.apple.NanoHeartRhythm.NanoElectrocardiogramWidgetExtension", @"com.apple.NanoHeartRhythm", @"NanoElectrocardiogramWidgetExtension", v8);

  uint64_t v9 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:21 family:0];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v9, @"com.apple.NanoRemote.NanoRemoteWidget", @"com.apple.NanoRemote", @"NanoRemoteWidget", v10);

  id v11 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:24 family:0];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v11, @"com.apple.NanoPhone.Complication", @"com.apple.NanoPhone", @"Complication", v12);

  if (_os_feature_enabled_impl())
  {
    id v13 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:20 family:0];
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
    _AddWidgetMigration(v55, v0, v13, @"com.apple.NanoReminders.WidgetExtension", @"com.apple.NanoReminders", @"com.apple.reminders.widget.today", v14);
  }
  id v15 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:26 family:&unk_1F16E13F8];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v15, @"com.apple.nanonews.widget", @"com.apple.nanonews", @"NewsButtonWidget", v16);

  id v17 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:26 family:&unk_1F16E1410];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v17, @"com.apple.nanonews.widget", @"com.apple.nanonews", @"NewsButtonWidget", v18);

  unint64_t v19 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:26 family:&unk_1F16E1428];
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v19, @"com.apple.nanonews.widget", @"com.apple.nanonews", @"NewsButtonWidget", v20);

  unint64_t v21 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:26 family:&unk_1F16E1440];
  int64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v21, @"com.apple.nanonews.widget", @"com.apple.nanonews", @"NewsButtonWidget", v22);

  uint64_t v23 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:26 family:&unk_1F16E1458];
  uint64_t v24 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v23, @"com.apple.nanonews.widget", @"com.apple.nanonews", @"NewsArticleWidget", v24);

  uint64_t v25 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:26 family:&unk_1F16E1470];
  char v26 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v25, @"com.apple.nanonews.widget", @"com.apple.nanonews", @"NewsArticleWidget", v26);

  uint64_t v27 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:26 family:&unk_1F16E1488];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v27, @"com.apple.nanonews.widget", @"com.apple.nanonews", @"NewsArticleWidget", v28);

  uint64_t v29 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:15 family:0];
  char v30 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v29, @"com.apple.HeartRate.HeartRateWidgetExtension", @"com.apple.HeartRate", @"HeartRateWidgetExtension", v30);

  v31 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:25 family:0];
  v32 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v31, @"com.apple.NanoMaps.NanoMapsWidgetKitComplications", @"com.apple.NanoMaps", @"MapsLauncherComplication", v32);

  v33 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:2 family:0];
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"9107296E-53BE-49DA-88A8-8C9A1BF81CFD"];
  _AddWidgetMigration(v55, v0, v33, @"com.apple.NanoAlarm.NanoAlarmWidgetExtension", @"com.apple.NanoAlarm", @"NanoAlarmComplication", v34);

  v35 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:34 family:&unk_1F16E1458];
  v36 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"];
  _AddWidgetMigration(v55, v0, v35, @"com.apple.NanoNowPlaying.widgets", @"com.apple.NanoNowPlaying", @"com.apple.NanoNowPlaying.widgets.media-suggestions", v36);

  v37 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:34 family:&unk_1F16E14A0];
  v38 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"];
  _AddWidgetMigration(v55, v0, v37, @"com.apple.NanoNowPlaying.widgets", @"com.apple.NanoNowPlaying", @"com.apple.NanoNowPlaying.widgets.media-suggestions", v38);

  v39 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:17 family:&unk_1F16E1488];
  v40 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"];
  _AddWidgetMigration(v55, v0, v39, @"com.apple.NanoMusic.widgets", @"com.apple.NanoMusic", @"com.apple.NanoMusic.widgets.recently-played", v40);

  v41 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:17 family:&unk_1F16E1458];
  v42 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"];
  _AddWidgetMigration(v55, v0, v41, @"com.apple.NanoMusic.widgets", @"com.apple.NanoMusic", @"com.apple.NanoMusic.widgets.recently-played", v42);

  v43 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:17 family:&unk_1F16E1470];
  v44 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"];
  _AddWidgetMigration(v55, v0, v43, @"com.apple.NanoMusic.widgets", @"com.apple.NanoMusic", @"com.apple.NanoMusic.widgets.recently-played", v44);

  v45 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:42 family:&unk_1F16E1488];
  v46 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"];
  _AddWidgetMigration(v55, v0, v45, @"com.apple.podcasts.widget", @"com.apple.podcasts", @"com.apple.podcasts.widget.upnext", v46);

  v47 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:42 family:&unk_1F16E1458];
  v48 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"];
  _AddWidgetMigration(v55, v0, v47, @"com.apple.podcasts.widget", @"com.apple.podcasts", @"com.apple.podcasts.widget.upnext", v48);

  v49 = [[NTKWidgetComplicationMigrationKey alloc] initWithComplicationType:42 family:&unk_1F16E1470];
  v50 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"742C60A6-F1CF-4368-8F2B-2AC6ED2C020E"];
  _AddWidgetMigration(v55, v0, v49, @"com.apple.podcasts.widget", @"com.apple.podcasts", @"com.apple.podcasts.widget.upnext", v50);

  uint64_t v51 = [v55 copy];
  v52 = (void *)_complicationTypeToWidgetMigrations_typeToDescriptor;
  _complicationTypeToWidgetMigrations_typeToDescriptor = v51;

  uint64_t v53 = [v0 copy];
  v54 = (void *)_complicationTypeToWidgetMigrations_typeToCapability;
  _complicationTypeToWidgetMigrations_typeToCapability = v53;
}

@end