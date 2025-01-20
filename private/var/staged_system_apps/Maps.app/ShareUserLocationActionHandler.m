@interface ShareUserLocationActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation ShareUserLocationActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v5 chrome];
    v9 = [v8 mapView];
    if ([v9 isUserLocationVisible])
    {
      v10 = [v5 chrome];
      v11 = [v10 userLocationView];
    }
    else
    {
      v11 = 0;
    }

    [v5 appCoordinator];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1006DA270;
    v21[3] = &unk_1012ECE20;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = v12;
    id v13 = v11;
    id v23 = v13;
    v14 = objc_retainBlock(v21);
    v15 = +[MKLocationManager sharedLocationManager];
    unsigned __int8 v16 = [v15 isAuthorizedForPreciseLocation];

    if (v16)
    {
      ((void (*)(void *, void))v14[2])(v14, 0);
    }
    else
    {
      v17 = +[MKMapService sharedService];
      [v17 captureUserAction:56 onTarget:690 eventValue:0];

      v18 = +[MKLocationManager sharedLocationManager];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1006DA2D8;
      v19[3] = &unk_1012E76C0;
      v20 = v14;
      [v18 requestTemporaryPreciseLocationAuthorizationWithPurposeKey:@"AppInfoTemporaryPreciseLocationAuthorizationForShareLocationPurposeKey" completion:v19];
    }
  }
}

@end