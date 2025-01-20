@interface MapsCrossPlatformFeaturesDebugController
+ (id)navigationDestinationTitle;
- (BOOL)recordsContinuously;
- (id)_mapsAppStateCreateActivity:(unint64_t)a3;
- (void)_copyStateWithFidelity:(unint64_t)a3;
- (void)_mapsAppStateRestoreActivity:(id)a3 withAssumedSourceFidelity:(unint64_t)a4;
- (void)_pasteStateWithAssumedSourceFidelity:(unint64_t)a3;
- (void)_promptForRestart;
- (void)_record;
- (void)_requestTerminationForRestart;
- (void)prepareContent;
- (void)setRecordsContinuously:(BOOL)a3;
@end

@implementation MapsCrossPlatformFeaturesDebugController

+ (id)navigationDestinationTitle
{
  return @"Cross-Platform Features";
}

- (void)_requestTerminationForRestart
{
  id v5 = objc_alloc_init((Class)UIAlertController);
  [v5 setTitle:@"Applying this change requires Maps to restart."];
  v3 = +[UIAlertAction actionWithTitle:@"Later" style:1 handler:0];
  [v5 addAction:v3];

  v4 = +[UIAlertAction actionWithTitle:@"Quit Maps" style:2 handler:&stru_1012E9110];
  [v5 addAction:v4];

  [(MapsCrossPlatformFeaturesDebugController *)self presentViewController:v5 animated:1 completion:0];
}

- (id)_mapsAppStateCreateActivity:(unint64_t)a3
{
  v4 = [(MapsCrossPlatformFeaturesDebugController *)self _maps_mapsSceneDelegate];
  id v5 = [v4 mapsActivityWithFidelity:a3];

  return v5;
}

- (void)_mapsAppStateRestoreActivity:(id)a3 withAssumedSourceFidelity:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(MapsCrossPlatformFeaturesDebugController *)self _maps_mapsSceneDelegate];
  [v7 setMapsActivity:v6 assumedSourceFidelity:a4 source:1];
}

- (void)prepareContent
{
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003FBCD0;
  v15[3] = &unk_1012E7EF8;
  objc_copyWeak(&v16, &location);
  id v3 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Placecard" content:v15];
  id v4 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"URLs" content:&stru_1012E91D0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003FBFAC;
  v13[3] = &unk_1012E7EF8;
  objc_copyWeak(&v14, &location);
  id v5 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Handoff" content:v13];
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_1003FC3A4;
  v11 = &unk_1012E7EF8;
  objc_copyWeak(&v12, &location);
  id v6 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Full State" content:&v8];
  id v7 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Default Transportation Mode", &stru_1012E9210, v8, v9, v10, v11 content];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_copyStateWithFidelity:(unint64_t)a3
{
  id v3 = [(MapsCrossPlatformFeaturesDebugController *)self _mapsAppStateCreateActivity:a3];
  if (v3)
  {
    id v10 = v3;
    NSLog(@"About to copy the current state of the app: %@", v3);
    id v4 = [v10 data];
    id v5 = [v4 base64EncodedStringWithOptions:0];
    NSLog(@"The size of the payload is %lu", [v4 length]);
    id v6 = [v10 bzip2CompressedData];
    id v7 = v6;
    if (v6) {
      NSLog(@"The size of the Bzip2-compressed payload is %lu", [v6 length]);
    }
    else {
      NSLog(@"The compressed data could not be created", v9);
    }
    v8 = +[UIPasteboard generalPasteboard];
    [v8 setString:v5];

    id v3 = v10;
  }
}

- (void)_pasteStateWithAssumedSourceFidelity:(unint64_t)a3
{
  id v5 = +[UIPasteboard generalPasteboard];
  id v10 = [v5 string];

  if (v10)
  {
    id v6 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v10 options:1];
    if (v6)
    {
      id v7 = [[MapsActivity alloc] initWithData:v6];
      v8 = v7;
      if (v7)
      {
        NSLog(@"About to restore the state of the app from activity: %@", v7);
        [(MapsCrossPlatformFeaturesDebugController *)self _mapsAppStateRestoreActivity:v8 withAssumedSourceFidelity:a3];
      }
    }
  }
  uint64_t v9 = [(MapsCrossPlatformFeaturesDebugController *)self presentingViewController];
  [v9 dismissViewControllerAnimated:0 completion:0];
}

- (BOOL)recordsContinuously
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingTimer);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

- (void)setRecordsContinuously:(BOOL)a3
{
  BOOL v3 = a3;
  p_recordingTimer = &self->_recordingTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingTimer);

  if (v3)
  {
    if (!WeakRetained)
    {
      id v8 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_record" selector:0 userInfo:1 repeats:0.5];
      objc_storeWeak((id *)p_recordingTimer, v8);
    }
  }
  else if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_recordingTimer);
    [v7 invalidate];

    objc_storeWeak((id *)p_recordingTimer, 0);
    self->_recordingCounter = 0;
  }
}

- (void)_record
{
  unint64_t recordingCounter = self->_recordingCounter;
  id v4 = NSTemporaryDirectory();
  id v5 = [v4 stringByAppendingPathComponent:@"com.apple.Maps.StateRecording"];
  uint64_t v6 = +[NSString stringWithFormat:@"%ld", self->_recordingCounter];
  id v7 = [v5 stringByAppendingPathComponent:v6];

  id v8 = +[NSFileManager defaultManager];
  id v29 = 0;
  LOBYTE(v6) = [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v29];
  id v9 = v29;

  if (v6)
  {
    if (recordingCounter + 1 <= 0xF0) {
      unint64_t v10 = recordingCounter + 1;
    }
    else {
      unint64_t v10 = 1;
    }
    v11 = [(MapsCrossPlatformFeaturesDebugController *)self _mapsAppStateCreateActivity:0xFFFFFFFLL];
    id v12 = [v11 description];
    v13 = [v7 stringByAppendingPathComponent:@"Activity Description.txt"];
    [v12 writeToFile:v13 atomically:1 encoding:4 error:0];

    id v14 = [v11 data];
    v15 = [v14 base64EncodedStringWithOptions:0];
    id v16 = [v7 stringByAppendingPathComponent:@"Base64 Activity Data.txt"];
    [v15 writeToFile:v16 atomically:1 encoding:4 error:0];

    v17 = +[UIApplication _maps_keyMapsWindow];
    [v17 bounds];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    v22 = [v17 screen];
    if (v22) {
      [v17 screen];
    }
    else {
    v23 = +[UIScreen mainScreen];
    }
    [v23 scale];
    CGFloat v25 = v24;
    v30.width = v19;
    v30.height = v21;
    UIGraphicsBeginImageContextWithOptions(v30, 0, v25);

    [v17 bounds];
    [v17 drawViewHierarchyInRect:1];
    UIGraphicsGetImageFromCurrentImageContext();
    v26 = (UIImage *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v27 = UIImagePNGRepresentation(v26);

    v28 = [v7 stringByAppendingPathComponent:@"Screenshot.png"];
    [v27 writeToFile:v28 atomically:1];

    NSLog(@"Saved app state snapshot at %@", v7);
    self->_unint64_t recordingCounter = v10;
  }
  else
  {
    NSLog(@"Could not create snapshot directory at %@", v7);
  }
}

- (void)_promptForRestart
{
  id v5 = objc_alloc_init((Class)UIAlertController);
  [v5 setTitle:@"This change will be effective once Maps restarts"];
  BOOL v3 = +[UIAlertAction actionWithTitle:@"Later" style:1 handler:0];
  [v5 addAction:v3];

  id v4 = +[UIAlertAction actionWithTitle:@"Quit Maps" style:2 handler:&stru_1012E9230];
  [v5 addAction:v4];

  [(MapsCrossPlatformFeaturesDebugController *)self presentViewController:v5 animated:1 completion:0];
}

- (void).cxx_destruct
{
}

@end