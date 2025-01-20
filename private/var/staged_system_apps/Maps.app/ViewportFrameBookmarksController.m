@interface ViewportFrameBookmarksController
+ (id)navigationDestinationTitle;
- (void)prepareContent;
- (void)saveFileAndReload;
@end

@implementation ViewportFrameBookmarksController

+ (id)navigationDestinationTitle
{
  return @"Viewport Frames";
}

- (void)prepareContent
{
  v3 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v4 = [v3 objectAtIndex:0];
  v5 = [v4 stringByAppendingPathComponent:@"ViewportBookmarks.json"];
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
  v17[2] = sub_1003C6E5C;
  v17[3] = &unk_1012E7EF8;
  objc_copyWeak(&v18, &location);
  id v13 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Bookmarks" content:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003C72F4;
  v15[3] = &unk_1012E7EF8;
  objc_copyWeak(&v16, &location);
  id v14 = [(MapsDebugValuesViewController *)self addSectionWithTitle:&stru_101324E70 content:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
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