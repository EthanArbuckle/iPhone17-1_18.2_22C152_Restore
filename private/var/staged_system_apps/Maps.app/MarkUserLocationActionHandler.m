@interface MarkUserLocationActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation MarkUserLocationActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100CD6E90;
    v18[3] = &unk_101321040;
    id v19 = v5;
    v8 = objc_retainBlock(v18);
    v9 = +[MKLocationManager sharedLocationManager];
    if ([v9 isAuthorizedForPreciseLocation])
    {
    }
    else
    {
      v10 = +[MKLocationManager sharedLocationManager];
      unsigned int v11 = [v10 isLocationServicesApproved];

      if (v11)
      {
        v12 = +[MKMapService sharedService];
        [v12 captureUserAction:56 onTarget:691 eventValue:0];

        v13 = +[MKLocationManager sharedLocationManager];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100CD70E0;
        v16[3] = &unk_1012E76C0;
        v17 = v8;
        [v13 requestTemporaryPreciseLocationAuthorizationWithPurposeKey:@"AppInfoTemporaryPreciseLocationAuthorizationForMarkLocationPurposeKey" completion:v16];

        v14 = v17;
LABEL_7:

        goto LABEL_8;
      }
    }
    v14 = +[MKLocationManager sharedLocationManager];
    v15 = [v14 lastLocation];
    ((void (*)(void *, void *))v8[2])(v8, v15);

    goto LABEL_7;
  }
LABEL_8:
}

@end