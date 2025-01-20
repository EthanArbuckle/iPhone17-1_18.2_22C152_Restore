@interface KeyFrameAnimatorDebugController
+ (id)navigationDestinationTitle;
- (void)_animationToIndex:(unint64_t)a3;
- (void)prepareContent;
- (void)saveFileAndReload;
@end

@implementation KeyFrameAnimatorDebugController

+ (id)navigationDestinationTitle
{
  return @"Key Frame Animator";
}

- (void)prepareContent
{
  v3 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v4 = [v3 objectAtIndex:0];
  v5 = [v4 stringByAppendingPathComponent:@"KeyFrameList.json"];
  filePath = self->_filePath;
  self->_filePath = v5;

  v7 = +[NSData dataWithContentsOfFile:self->_filePath];
  if (v7)
  {
    id v20 = 0;
    v8 = +[NSJSONSerialization JSONObjectWithData:v7 options:1 error:&v20];
    id v9 = v20;
    items = self->_items;
    self->_items = v8;
  }
  if (!self->_items)
  {
    v11 = (NSMutableArray *)objc_opt_new();
    v12 = self->_items;
    self->_items = v11;
  }
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100B1E120;
  v17[3] = &unk_1012E7EF8;
  objc_copyWeak(&v18, &location);
  id v13 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Bookmarks" content:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100B1E3B0;
  v15[3] = &unk_1012E7EF8;
  objc_copyWeak(&v16, &location);
  id v14 = [(MapsDebugValuesViewController *)self addSectionWithTitle:&stru_101324E70 content:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_animationToIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_items count] > a3)
  {
    v5 = [(NSMutableArray *)self->_items objectAtIndex:a3];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 objectForKeyedSubscript:@"latitude"];
      [v7 doubleValue];
      double v9 = v8;

      v10 = [v6 objectForKeyedSubscript:@"longitude"];
      [v10 doubleValue];
      double v12 = v11;

      id v13 = [v6 objectForKeyedSubscript:@"heading"];
      [v13 doubleValue];
      double v15 = v14;

      id v16 = [v6 objectForKeyedSubscript:@"pitch"];
      [v16 doubleValue];
      double v18 = v17;

      v19 = [v6 objectForKeyedSubscript:@"zoom"];
      [v19 doubleValue];
      double v21 = v20;

      v22 = [v6 objectForKeyedSubscript:@"animationDuration"];
      [v22 doubleValue];
      double v24 = v23;

      v25 = [(MapsDebugValuesViewController *)self delegate];
      v26 = [v25 allVisibleMapViewsForDebugController:self];
      v27 = [v26 firstObject];

      v28 = +[MKMapCamera cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:](MKMapCamera, "cameraLookingAtCenterCoordinate:fromDistance:pitch:heading:", v9, v12, v21, v18, v15);
      objc_initWeak(&location, self);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100B1F034;
      v33[3] = &unk_1012E5D58;
      id v29 = v27;
      id v34 = v29;
      id v30 = v28;
      id v35 = v30;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100B1F040;
      v31[3] = &unk_1012EB0A0;
      objc_copyWeak(v32, &location);
      v32[1] = (id)a3;
      +[UIView animateWithDuration:v33 animations:v31 completion:v24];
      objc_destroyWeak(v32);

      objc_destroyWeak(&location);
    }
  }
}

- (void)saveFileAndReload
{
  id v3 = [objc_alloc((Class)NSOutputStream) initToFileAtPath:self->_filePath append:0];
  [v3 open];
  items = self->_items;
  id v7 = 0;
  +[NSJSONSerialization writeJSONObject:items toStream:v3 options:0 error:&v7];
  id v5 = v7;
  [v3 close];
  if (!v5)
  {
    v6 = +[NSURL fileURLWithPath:self->_filePath];
    [v6 setResourceValue:&__kCFBooleanTrue forKey:NSURLIsExcludedFromBackupKey error:0];
    [(MapsDebugValuesViewController *)self rebuildSections];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end