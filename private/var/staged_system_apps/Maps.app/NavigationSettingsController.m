@interface NavigationSettingsController
+ (id)navigationDestinationTitle;
- (void)_addAudioSettings:(id)a3;
- (void)_addCustomRoutesSettings:(id)a3;
- (void)_addETAUpdatesSettings:(id)a3;
- (void)_addEVRoutingSettings:(id)a3;
- (void)_addLicensePlateRestrictionsSettings:(id)a3;
- (void)_addLocationsSettings:(id)a3;
- (void)_addManeuverArrowSettings:(id)a3;
- (void)_addNavigationRowWithTitle:(id)a3 section:(id)a4 handler:(id)a5;
- (void)_addNavigationServiceSettings:(id)a3;
- (void)_addParkingNavigationSettings:(id)a3;
- (void)_addPreloadingSettings:(id)a3;
- (void)_addRoutePlanningRefreshingSettings:(id)a3;
- (void)_addRoutingSettings:(id)a3;
- (void)_addThermalMitigationsSettings:(id)a3;
- (void)_addTimeToLeaveSettings:(id)a3;
- (void)_addTracesAndSimulationSettings:(id)a3;
- (void)_addTrafficOverrideSettings:(id)a3;
- (void)_addTransitSettings:(id)a3;
- (void)_addVisualFeaturesSettings:(id)a3;
- (void)_addVisualizationSettings:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)prepareContent;
@end

@implementation NavigationSettingsController

+ (id)navigationDestinationTitle
{
  return @"Navigation";
}

- (void)prepareContent
{
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10090CDEC;
  v10[3] = &unk_1012E7EF8;
  objc_copyWeak(&v11, &location);
  id v3 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Settings" content:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10090D800;
  v8[3] = &unk_1012E7EF8;
  objc_copyWeak(&v9, &location);
  id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Features" content:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10090DC68;
  v6[3] = &unk_1012E7EF8;
  objc_copyWeak(&v7, &location);
  id v5 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Debugging" content:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_addNavigationRowWithTitle:(id)a3 section:(id)a4 handler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10090DE8C;
  v10[3] = &unk_101300880;
  id v11 = a3;
  id v12 = a5;
  id v7 = v12;
  id v8 = v11;
  id v9 = [a4 addNavigationRowWithTitle:v8 viewControllerContent:v10];
}

- (void)_addVisualizationSettings:(id)a3
{
  id v5 = a3;
  id v3 = [v5 addSectionWithTitle:0 content:&stru_1013008A0];
  id v4 = [v5 addSectionWithTitle:@"Arrival Regions" content:&stru_1013008C0];
}

- (void)_addLocationsSettings:(id)a3
{
  id v6 = a3;
  id v3 = [v6 addSectionWithTitle:0 content:&stru_1013008E0];
  id v4 = [v6 addSectionWithTitle:@"Location Projection" content:&stru_101300900];
  id v5 = [v6 addSectionWithTitle:@"Probe Crumbs" content:&stru_101300960];
}

- (void)_addRoutingSettings:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10090E864;
  v13 = &unk_1012E7EF8;
  objc_copyWeak(&v14, &location);
  id v5 = [v4 addSectionWithTitle:0 content:&v10];
  id v6 = [v4 addSectionWithTitle:@"Arrival" content:&stru_101300A00 v10, v11, v12, v13];
  id v7 = [v4 addSectionWithTitle:@"Departure From Waypoint" content:&stru_101300A20];
  id v8 = [v4 addSectionWithTitle:@"Logging" content:&stru_101300B00];
  id v9 = [v4 addSectionWithTitle:0 content:&stru_101300B20];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_addTrafficOverrideSettings:(id)a3
{
  id v5 = a3;
  id v3 = [v5 addSectionWithTitle:@"Override Color" content:&stru_101300B40];
  id v4 = [v5 addSectionWithTitle:@"Override Section" content:&stru_101300B80];
}

- (void)_addETAUpdatesSettings:(id)a3
{
  id v3 = [a3 addSectionWithTitle:0 content:&stru_101300BC0];
}

- (void)_addAudioSettings:(id)a3
{
  id v5 = a3;
  id v3 = [v5 addSectionWithTitle:0 content:&stru_101300F40];
  id v4 = [v5 addSectionWithTitle:@"Server Side Instructions" content:&stru_101300FA0];
}

- (void)_addTransitSettings:(id)a3
{
  id v3 = [a3 addSectionWithTitle:0 content:&stru_101300FC0];
}

- (void)_addCustomRoutesSettings:(id)a3
{
  id v5 = a3;
  id v3 = [v5 addSectionWithTitle:0 content:&stru_101300FE0];
  [v3 setFooter:@"Enables navigation on a custom route as long as location is near the route, even if current location is not near the origin."];

  id v4 = [v5 addSectionWithTitle:0 content:&stru_101301000];
}

- (void)_addTimeToLeaveSettings:(id)a3
{
  id v3 = [a3 addSectionWithTitle:0 content:&stru_101301040];
}

- (void)_addNavigationServiceSettings:(id)a3
{
  id v3 = [a3 addSectionWithTitle:0 content:&stru_101301060];
}

- (void)_addPreloadingSettings:(id)a3
{
  id v5 = a3;
  id v3 = [v5 addSectionWithTitle:0 content:&stru_101301100];
  id v4 = [v5 addSectionWithTitle:0 content:&stru_101301120];
}

- (void)_addThermalMitigationsSettings:(id)a3
{
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100911260;
  v21[3] = &unk_1012E9618;
  id v15 = a3;
  id v22 = v15;
  id v3 = objc_retainBlock(v21);
  id v14 = +[MapsThermalPressureController mitigations];
  id v4 = [v14 allKeys];
  id v5 = [v4 sortedArrayUsingSelector:"compare:"];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v11 isEqualToString:@"NavigationDisableLockScreen"])
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_100911430;
          v16[3] = &unk_1012EE018;
          v16[4] = v11;
          id v12 = [v15 addSectionWithTitle:v11 content:v16];
        }
        else
        {
          v13 = [v14 objectForKeyedSubscript:v11];
          ((void (*)(void *, void *, void *))v3[2])(v3, v13, v11);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)_addVisualFeaturesSettings:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100911810;
  v20[3] = &unk_1012FD470;
  objc_copyWeak(&v21, &from);
  objc_copyWeak(&v22, &location);
  id v5 = [v4 addSectionWithTitle:@"General" content:v20];
  if (sub_100105DB4())
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100912390;
    v18[3] = &unk_1012E7EF8;
    objc_copyWeak(&v19, &from);
    id v6 = [v4 addSectionWithTitle:@"Pedestrian AR" content:v18];
    objc_destroyWeak(&v19);
  }
  if (sub_1000D4BB8())
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100914384;
    v15[3] = &unk_1012FD470;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, &from);
    id v7 = [v4 addSectionWithTitle:@"VLF" content:v15];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
  }
  if ((sub_1000D4BB8() || sub_100105DB4()) && MapsFeature_IsAvailable_VisualLocalizationCrowdsourcing())
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100916DCC;
    v12[3] = &unk_1012FD470;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    id v8 = [v4 addSectionWithTitle:@"VLF Crowdsourcing" content:v12];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
  }
  if (qword_1016123E8 != -1) {
    dispatch_once(&qword_1016123E8, &stru_1012F7EA8);
  }
  if ((byte_1016123E0 & 1) == 0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100917124;
    v10[3] = &unk_1012E7EF8;
    objc_copyWeak(&v11, &from);
    id v9 = [v4 addSectionWithTitle:@"MarcoLite" content:v10];
    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_addRoutePlanningRefreshingSettings:(id)a3
{
  id v3 = [a3 addSectionWithTitle:0 content:&stru_101301BA8];
}

- (void)_addEVRoutingSettings:(id)a3
{
  id v3 = [a3 addSectionWithTitle:@"EV Routing" content:&stru_101301BC8];
}

- (void)_addLicensePlateRestrictionsSettings:(id)a3
{
  id v3 = [a3 addSectionWithTitle:@"LPR" content:&stru_101301E08];
}

- (void)_addManeuverArrowSettings:(id)a3
{
  id v3 = [a3 addSectionWithTitle:@"Maneuver Arrows" content:&stru_101301E48];
}

- (void)_addParkingNavigationSettings:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [v4 addSectionWithTitle:0 content:&stru_101301E68];
  id v6 = [v4 addSectionWithTitle:@"Background Walking Route Thresholds" content:&stru_101301E88];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100919720;
  v8[3] = &unk_1012E7EF8;
  objc_copyWeak(&v9, &location);
  id v7 = [v4 addSectionWithTitle:0 content:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_addTracesAndSimulationSettings:(id)a3
{
  id v6 = a3;
  id v3 = [v6 addSectionWithTitle:@"Trace Playback" content:&stru_101301EC8];
  id v4 = [v6 addSectionWithTitle:@"Trace Recording" content:&stru_101301F88];
  id v5 = [v6 addSectionWithTitle:@"Simulation" content:&stru_101301FA8];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:UIImagePickerControllerPHAsset];
  if (v7)
  {
    uint64_t v19 = 0;
    long long v20 = &v19;
    uint64_t v21 = 0x2050000000;
    id v8 = (void *)qword_101610000;
    uint64_t v22 = qword_101610000;
    if (!qword_101610000)
    {
      id v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472;
      id v16 = sub_10091B03C;
      id v17 = &unk_1012E9390;
      long long v18 = &v19;
      sub_10091B03C((uint64_t)&v14);
      id v8 = (void *)v20[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v19, 8);
    id v10 = objc_alloc_init(v9);
    [v10 setVersion:1];
    uint64_t v19 = 0;
    long long v20 = &v19;
    uint64_t v21 = 0x2050000000;
    id v11 = (void *)qword_101610008;
    uint64_t v22 = qword_101610008;
    if (!qword_101610008)
    {
      id v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472;
      id v16 = sub_10091B22C;
      id v17 = &unk_1012E9390;
      long long v18 = &v19;
      sub_10091B22C((uint64_t)&v14);
      id v11 = (void *)v20[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v19, 8);
    id v13 = [v12 defaultManager];
    [v13 requestAVAssetForVideo:v7 options:v10 resultHandler:&stru_101301FE8];
  }
  else
  {
    _GEOConfigRemoveValue();
  }
  [v5 dismissViewControllerAnimated:1 completion:0];
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v3 = a3;
  _GEOConfigRemoveValue();
  [v3 dismissViewControllerAnimated:1 completion:0];
}

@end