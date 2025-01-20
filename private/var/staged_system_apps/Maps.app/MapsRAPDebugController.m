@interface MapsRAPDebugController
+ (id)navigationDestinationTitle;
- (MapsDebugReadOnlyValueRow)deviceVersionNumberRow;
- (MapsDebugReadOnlyValueRow)serverVersionNumberRow;
- (MapsRAPDebugController)init;
- (MapsUGCEnvironmentSectionController)environmentsSectionController;
- (void)_refreshServerVersionNumber;
- (void)displayMessage:(id)a3 titled:(id)a4;
- (void)openAnalyticsWithURL:(id)a3;
- (void)prepareContent;
- (void)prepareDefaultSimJanaURL;
- (void)setDeviceVersionNumberRow:(id)a3;
- (void)setEnvironmentsSectionController:(id)a3;
- (void)setServerVersionNumberRow:(id)a3;
- (void)simulateFixForProblemWithID:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)webBundleEncounteredError:(id)a3;
- (void)webBundleHadNoChanges;
- (void)webBundleUpdatedWithWebBundlePath:(id)a3;
@end

@implementation MapsRAPDebugController

- (MapsRAPDebugController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MapsRAPDebugController;
  v2 = [(MapsDebugValuesViewController *)&v5 init];
  if (v2)
  {
    v3 = [[MapsUGCEnvironmentSectionController alloc] initWithSubmissionURL:42 lookupURL:43];
    [(MapsRAPDebugController *)v2 setEnvironmentsSectionController:v3];
  }
  return v2;
}

+ (id)navigationDestinationTitle
{
  return @"Report an Issue";
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MapsRAPDebugController;
  [(MapsDebugValuesViewController *)&v4 viewWillAppear:a3];
  [(MapsRAPDebugController *)self _viewWillAppear];
  [(MapsRAPDebugController *)self _refreshServerVersionNumber];
}

- (void)prepareDefaultSimJanaURL
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  v2 = [v3 objectForKey:@"RAPDebugSimJanaURL"];

  if (!v2)
  {
    [v3 setObject:@"http://sim-jana-qa1.geo.apple.com/" forKey:@"RAPDebugSimJanaURL"];
    [v3 synchronize];
  }
}

- (void)prepareContent
{
  [(MapsRAPDebugController *)self prepareDefaultSimJanaURL];
  objc_initWeak(&location, self);
  id v3 = objc_alloc_init(RAPWebBundleConfigurationManager);
  objc_super v4 = [(RAPWebBundleConfigurationManager *)v3 configuration];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10094EC54;
  v29[3] = &unk_1012EE3E8;
  objc_copyWeak(&v31, &location);
  id v5 = v4;
  id v30 = v5;
  id v6 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v29];
  v7 = [(MapsRAPDebugController *)self environmentsSectionController];
  [v7 appendEnvironmentSectionToDebugController:self];

  id v8 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Submission Debug Settings" content:&stru_101302ED0];
  id v9 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Notification" content:&stru_101302EF0];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10094EFE4;
  v27[3] = &unk_1012E7EF8;
  objc_copyWeak(&v28, &location);
  id v10 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"RAP Config Default Value" content:v27];
  id v11 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Submitted RAP Status" content:&stru_101302F70];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10094F318;
  v25[3] = &unk_1012E7EF8;
  objc_copyWeak(&v26, &location);
  id v12 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v25];
  id v13 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Server Controlled UI" content:&stru_101302FB0];
  id v14 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Client Overrides For Server Controller UI" content:&stru_101302FF0];
  id v15 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"SimJana" content:&stru_101303010];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10094F990;
  v23[3] = &unk_1012E7EF8;
  objc_copyWeak(&v24, &location);
  id v16 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Submitted Raps" content:v23];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10094FB1C;
  v21[3] = &unk_1012E7EF8;
  objc_copyWeak(&v22, &location);
  id v17 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10094FD14;
  v19[3] = &unk_1012E7EF8;
  objc_copyWeak(&v20, &location);
  id v18 = [(MapsDebugValuesViewController *)self addSectionWithTitle:0 content:v19];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (void)openAnalyticsWithURL:(id)a3
{
  id v3 = a3;
  id v5 = +[UIApplication sharedApplication];
  objc_super v4 = +[NSURL URLWithString:v3];

  [v5 openURL:v4 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)simulateFixForProblemWithID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 stringForKey:@"RAPDebugSimJanaURL"];

  v7 = +[NSURL URLWithString:v6];
  id v8 = [v7 URLByAppendingPathComponent:@"simulator/fix"];

  id v9 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v8];
  [v9 setHTTPMethod:@"POST"];
  id v10 = +[NSString stringWithFormat:@"problem_id=%@", v4];
  id v11 = [v10 dataUsingEncoding:4];
  [v9 setHTTPBody:v11];

  id v12 = +[NSURLSession sharedSession];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10095014C;
  v15[3] = &unk_101303038;
  v15[4] = self;
  id v16 = v4;
  id v13 = v4;
  id v14 = [v12 dataTaskWithRequest:v9 completionHandler:v15];

  [v14 resume];
}

- (void)displayMessage:(id)a3 titled:(id)a4
{
}

- (void)webBundleUpdatedWithWebBundlePath:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:@"Web Bundle Updated with Path:%@", v4];
  [(MapsRAPDebugController *)self displayMessage:v5 titled:@"RAP Web Bundle Downloaded"];

  id v6 = [v4 absoluteString];

  v7 = [(MapsRAPDebugController *)self deviceVersionNumberRow];
  [v7 setSubtitle:v6];

  [(MapsDebugValuesViewController *)self reloadData];
}

- (void)webBundleEncounteredError:(id)a3
{
  id v4 = [a3 localizedDescription];
  [(MapsRAPDebugController *)self displayMessage:v4 titled:@"RAP Web Bundle Download Error"];
}

- (void)webBundleHadNoChanges
{
}

- (void)_refreshServerVersionNumber
{
  objc_initWeak(&location, self);
  v2 = +[RAPWebBundleDownloadManager sharedInstance];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1009505B0;
  v3[3] = &unk_101303060;
  objc_copyWeak(&v4, &location);
  [v2 _downloadManifestWithForce:1 completion:v3];

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (MapsUGCEnvironmentSectionController)environmentsSectionController
{
  return self->_environmentsSectionController;
}

- (void)setEnvironmentsSectionController:(id)a3
{
}

- (MapsDebugReadOnlyValueRow)serverVersionNumberRow
{
  return self->_serverVersionNumberRow;
}

- (void)setServerVersionNumberRow:(id)a3
{
}

- (MapsDebugReadOnlyValueRow)deviceVersionNumberRow
{
  return self->_deviceVersionNumberRow;
}

- (void)setDeviceVersionNumberRow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceVersionNumberRow, 0);
  objc_storeStrong((id *)&self->_serverVersionNumberRow, 0);

  objc_storeStrong((id *)&self->_environmentsSectionController, 0);
}

@end