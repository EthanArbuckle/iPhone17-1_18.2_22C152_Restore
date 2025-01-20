@interface FTWidgetUpdateEventTracker
- (FTWidgetUpdateEventTracker)init;
- (PETDistributionEventTracker)widgetUpdateEventTracker;
- (PETScalarEventTracker)widgetUpdateFailureEventTracker;
- (void)setWidgetUpdateEventTracker:(id)a3;
- (void)setWidgetUpdateFailureEventTracker:(id)a3;
- (void)trackUpdateWithTodaySource:(id)a3 appConfigTreatmentID:(id)a4 error:(id)a5 updateFetchDuration:(double)a6 wifiReachable:(BOOL)a7 cellularRadioAccessTechnology:(int64_t)a8;
@end

@implementation FTWidgetUpdateEventTracker

- (FTWidgetUpdateEventTracker)init
{
  v24.receiver = self;
  v24.super_class = (Class)FTWidgetUpdateEventTracker;
  v2 = [(FTWidgetUpdateEventTracker *)&v24 init];
  if (v2)
  {
    v3 = +[PETEventProperty ft_headlineSourceProperty];
    v29[0] = &off_1001296B0;
    v29[1] = &off_1001296C8;
    v30[0] = @"new";
    v30[1] = @"no";
    v29[2] = &off_1001296E0;
    v30[2] = @"failed";
    v4 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];
    v20 = +[PETEventProperty propertyWithName:@"updateResult" enumMapping:v4 autoSanitizeValues:0];

    v22 = +[PETEventProperty ft_BOOLeanPropertyWithName:@"widgetVisible"];
    v23 = +[PETEventProperty ft_BOOLeanPropertyWithName:@"wifiReachable"];
    v27[0] = &off_1001296F8;
    v27[1] = &off_100129710;
    v28[0] = @"unknown";
    v28[1] = @"GPRS";
    v27[2] = &off_100129728;
    v27[3] = &off_100129740;
    v28[2] = @"Edge";
    v28[3] = @"WCDMA";
    v27[4] = &off_100129758;
    v27[5] = &off_100129770;
    v28[4] = @"HSDPA";
    v28[5] = @"HSUPA";
    v27[6] = &off_100129788;
    v27[7] = &off_1001297A0;
    v28[6] = @"CDMA1x";
    v28[7] = @"CDMAEVDORev0";
    v27[8] = &off_1001297B8;
    v27[9] = &off_1001297D0;
    v28[8] = @"CDMAEVDORevA";
    v28[9] = @"CDMAEVDORevB";
    v27[10] = &off_1001297E8;
    v27[11] = &off_100129800;
    v28[10] = @"HRPD";
    v28[11] = @"LTE";
    v5 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:12];
    v19 = +[PETEventProperty propertyWithName:@"cellTechName" enumMapping:v5];

    v6 = +[PETEventProperty ft_userGroupProperty];
    v21 = +[NSArray fc_array:&stru_100123F58];
    v18 = +[PETEventProperty propertyWithName:@"errorDomain" possibleValues:v21];
    v17 = +[PETEventProperty ft_BOOLeanPropertyWithName:@"errorCodeValid"];
    v7 = +[PETEventProperty propertyWithName:@"errorCode", 0, 50, 1 range clampValues];
    id v8 = objc_alloc((Class)PETDistributionEventTracker);
    v26[0] = v3;
    v26[1] = v20;
    v26[2] = v22;
    v26[3] = v23;
    v26[4] = v19;
    v26[5] = v6;
    v9 = +[NSArray arrayWithObjects:v26 count:6];
    v10 = (PETDistributionEventTracker *)[v8 initWithFeatureId:@"NewsWidget" event:@"wdgtUpdate" registerProperties:v9];
    widgetUpdateEventTracker = v2->_widgetUpdateEventTracker;
    v2->_widgetUpdateEventTracker = v10;

    id v12 = objc_alloc((Class)PETScalarEventTracker);
    v25[0] = v3;
    v25[1] = v6;
    v25[2] = v18;
    v25[3] = v17;
    v25[4] = v7;
    v13 = +[NSArray arrayWithObjects:v25 count:5];
    v14 = (PETScalarEventTracker *)[v12 initWithFeatureId:@"NewsWidget" event:@"wdgtUpdateFailure" registerProperties:v13];
    widgetUpdateFailureEventTracker = v2->_widgetUpdateFailureEventTracker;
    v2->_widgetUpdateFailureEventTracker = v14;
  }
  return v2;
}

- (void)trackUpdateWithTodaySource:(id)a3 appConfigTreatmentID:(id)a4 error:(id)a5 updateFetchDuration:(double)a6 wifiReachable:(BOOL)a7 cellularRadioAccessTechnology:(int64_t)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (!v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E7460();
  }
  if (a6 < 0.0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000E7380();
  }
  v36 = v14;
  v17 = FTHeadlineSourcePropertyValueWithTodaySource(v14);
  v37 = v15;
  v18 = FTUserGroupPropertyValueWithAppConfigTreatmentID(v15);
  v19 = [(FTWidgetUpdateEventTracker *)self widgetUpdateEventTracker];
  v39[0] = v17;
  v20 = +[NSNumber numberWithUnsignedInteger:2 * (v16 != 0)];
  v39[1] = v20;
  v21 = FTBooleanPropertyValue(0);
  v39[2] = v21;
  v22 = FTBooleanPropertyValue(v9);
  v39[3] = v22;
  v23 = +[NSNumber numberWithInteger:a8];
  v39[4] = v23;
  v39[5] = v18;
  +[NSArray arrayWithObjects:v39 count:6];
  v25 = objc_super v24 = self;
  [v19 trackEventWithPropertyValues:v25 value:a6];

  if (v16)
  {
    [v16 domain:v36, v37];
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v27 = sub_100014590();
    unsigned int v28 = [v27 containsObject:v26];
    v29 = @"other";
    if (v28) {
      v29 = v26;
    }
    v30 = v29;

    id v31 = [v16 code];
    v32 = [(FTWidgetUpdateEventTracker *)v24 widgetUpdateFailureEventTracker];
    v38[0] = v17;
    v38[1] = v18;
    v38[2] = v30;
    v33 = FTBooleanPropertyValue((unint64_t)v31 < 0x32);
    v38[3] = v33;
    v34 = +[NSNumber numberWithInteger:v31];
    v38[4] = v34;
    v35 = +[NSArray arrayWithObjects:v38 count:5];

    [v32 trackEventWithPropertyValues:v35];
  }
}

- (PETDistributionEventTracker)widgetUpdateEventTracker
{
  return self->_widgetUpdateEventTracker;
}

- (void)setWidgetUpdateEventTracker:(id)a3
{
}

- (PETScalarEventTracker)widgetUpdateFailureEventTracker
{
  return self->_widgetUpdateFailureEventTracker;
}

- (void)setWidgetUpdateFailureEventTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUpdateFailureEventTracker, 0);

  objc_storeStrong((id *)&self->_widgetUpdateEventTracker, 0);
}

@end