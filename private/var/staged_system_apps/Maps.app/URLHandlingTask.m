@interface URLHandlingTask
+ (id)taskForURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 sceneOptions:(id)a6 mkOptions:(id)a7 windowSize:(CGSize)a8;
- (BOOL)launchedFromTTL;
- (CGSize)windowSize;
- (NSDate)ttlEventTime;
- (NSDictionary)mkOptions;
- (NSString)sourceApplication;
- (NSURL)referringURL;
- (NSURL)url;
- (UISceneOpenURLOptions)sceneOptions;
- (URLHandlingTask)initWithURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 sceneOptions:(id)a6 mkOptions:(id)a7;
- (id)urlScheme;
- (void)_populateSessionAnalytics;
- (void)setLaunchedFromTTL:(BOOL)a3;
- (void)setMkOptions:(id)a3;
- (void)setReferringURL:(id)a3;
- (void)setSceneOptions:(id)a3;
- (void)setSourceApplication:(id)a3;
- (void)setTtlEventTime:(id)a3;
- (void)setUrl:(id)a3;
- (void)setWindowSize:(CGSize)a3;
- (void)taskFailed;
- (void)taskFinished:(id)a3;
@end

@implementation URLHandlingTask

+ (id)taskForURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 sceneOptions:(id)a6 mkOptions:(id)a7 windowSize:(CGSize)a8
{
  double height = a8.height;
  double width = a8.width;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = sub_1000A930C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v47 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "taskForURL %{private}@", buf, 0xCu);
  }

  v20 = [v14 scheme];
  v21 = [v20 lowercaseString];

  v22 = [v14 query];
  unsigned __int8 v23 = [v22 isEqualToString:@"reset=1"];

  if (v23)
  {
    v24 = off_1012D4D70;
LABEL_31:
    v37 = (_MKHandlerURLHandlingTask *)[objc_alloc(*v24) initWithURL:v14 referringURL:v15 sourceApplication:v16 sceneOptions:v17 mkOptions:v18];
LABEL_32:
    -[URLHandlingTask setWindowSize:](v37, "setWindowSize:", width, height);
    v32 = v37;
    goto LABEL_33;
  }
  if ([v21 isEqualToString:@"x-maps-ac-auth"])
  {
    v24 = off_1012D4C68;
    goto LABEL_31;
  }
  if ([v21 isEqualToString:@"x-maps-reopen"])
  {
    v24 = off_1012D4D78;
    goto LABEL_31;
  }
  if ([v21 isEqualToString:@"x-maps-punchinhint"])
  {
    v24 = off_1012D4D80;
    goto LABEL_31;
  }
  if (+[MKDirectionsRequest isDirectionsRequestURL:v14])
  {
    id v25 = [objc_alloc((Class)MKDirectionsRequest) initWithContentsOfURL:v14];
    v26 = [v25 source];
    uint64_t v27 = [v25 destination];
    if (!v27)
    {

      v32 = 0;
      goto LABEL_33;
    }
    v40 = v26;
    v41 = (void *)v27;
    if (v26)
    {
      v44[0] = v26;
      v44[1] = v27;
      v28 = v44;
      uint64_t v29 = 2;
    }
    else
    {
      uint64_t v45 = v27;
      v28 = &v45;
      uint64_t v29 = 1;
    }
    v39 = +[NSArray arrayWithObjects:v28 count:v29];
    v42 = MKLaunchOptionsDirectionsModeKey;
    v43 = MKLaunchOptionsDirectionsModeDefault;
    v35 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v36 = +[MKMapItem urlForMapItems:v39 options:v35];

    v32 = [[_MKHandlerURLHandlingTask alloc] initWithURL:v36 referringURL:v15 sourceApplication:v16 sceneOptions:v17 mkOptions:v18];
    goto LABEL_24;
  }
  if ([v21 isEqualToString:@"x-maps-bulletin"])
  {
    v24 = &off_1012D4C70;
    goto LABEL_31;
  }
  v30 = [v14 absoluteString];
  unsigned __int8 v31 = [v30 containsString:@"add-license-plate"];

  if (v31)
  {
    v24 = &off_1012D4CB0;
    goto LABEL_31;
  }
  v33 = [v14 absoluteString];
  unsigned __int8 v34 = [v33 containsString:@"vehicles"];

  if (v34)
  {
    v24 = off_1012D4D68;
    goto LABEL_31;
  }
  if (![v21 caseInsensitiveCompare:@"file"])
  {
    v24 = &off_1012D4CA0;
    goto LABEL_31;
  }
  if (![v21 caseInsensitiveCompare:@"x-maps-category"])
  {
    v24 = off_1012D4C98;
    goto LABEL_31;
  }
  if (+[_MKURLHandler canHandleURL:v14])
  {
    v32 = [[_MKHandlerURLHandlingTask alloc] initWithURL:v14 referringURL:v15 sourceApplication:v16 sceneOptions:v17 mkOptions:v18];
LABEL_24:
    -[URLHandlingTask setWindowSize:](v32, "setWindowSize:", width, height);
    +[MKSiriInteraction generateHashForNavigationURL:v14];
    goto LABEL_33;
  }
  v37 = 0;
  v32 = 0;
  if (([v21 isEqualToString:@"test"] & 1) == 0) {
    goto LABEL_32;
  }
LABEL_33:

  return v32;
}

- (URLHandlingTask)initWithURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 sceneOptions:(id)a6 mkOptions:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v20 = a7;
  v21.receiver = self;
  v21.super_class = (Class)URLHandlingTask;
  id v17 = [(URLHandlingTask *)&v21 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_url, a3);
    objc_storeStrong((id *)&v18->_referringURL, a4);
    objc_storeStrong((id *)&v18->_sourceApplication, a5);
    objc_storeStrong((id *)&v18->_sceneOptions, a6);
    objc_storeStrong((id *)&v18->_mkOptions, a7);
    [(URLHandlingTask *)v18 _populateSessionAnalytics];
  }

  return v18;
}

- (void)_populateSessionAnalytics
{
  v3 = [(URLHandlingTask *)self referringURL];
  id v12 = [v3 host];

  v4 = [v12 componentsSeparatedByString:@"."];
  if ((unint64_t)[v4 count] < 2)
  {
    v6 = 0;
  }
  else
  {
    v5 = [v4 subarrayWithRange:[v4 count] - 2, 2];
    v6 = [v5 componentsJoinedByString:@"."];
  }
  v7 = [(URLHandlingTask *)self sourceApplication];
  v8 = +[GEOAPSharedStateData sharedData];
  [v8 setMapLaunchSourceAppId:v7];

  v9 = [(URLHandlingTask *)self urlScheme];
  v10 = +[GEOAPSharedStateData sharedData];
  [v10 setMapLaunchLaunchUri:v9];

  v11 = +[GEOAPSharedStateData sharedData];
  [v11 setMapLaunchReferringWebsite:v6];
}

- (id)urlScheme
{
  v2 = [(NSURL *)self->_url scheme];
  v3 = [v2 lowercaseString];

  return v3;
}

- (NSString)sourceApplication
{
  sourceApplication = self->_sourceApplication;
  if (sourceApplication)
  {
    v4 = sourceApplication;
  }
  else
  {
    v4 = [(UISceneOpenURLOptions *)self->_sceneOptions sourceApplication];
  }
  v5 = self->_sourceApplication;
  self->_sourceApplication = v4;

  v6 = self->_sourceApplication;
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v7 = +[MKMapItem _sourceAppIdFromLaunchURL:self->_url];
  }
  v8 = self->_sourceApplication;
  self->_sourceApplication = v7;

  v9 = self->_sourceApplication;

  return v9;
}

- (void)taskFinished:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)URLHandlingTask;
  [(RichMapsActivityCreatingTaskImpl *)&v4 taskFinished:a3];
  [(URLHandlingTask *)self _sendAnalytics];
}

- (void)taskFailed
{
  v3.receiver = self;
  v3.super_class = (Class)URLHandlingTask;
  [(RichMapsActivityCreatingTaskImpl *)&v3 taskFailed];
  [(URLHandlingTask *)self _sendAnalytics];
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSURL)referringURL
{
  return self->_referringURL;
}

- (void)setReferringURL:(id)a3
{
}

- (UISceneOpenURLOptions)sceneOptions
{
  return self->_sceneOptions;
}

- (void)setSceneOptions:(id)a3
{
}

- (NSDictionary)mkOptions
{
  return self->_mkOptions;
}

- (void)setMkOptions:(id)a3
{
}

- (BOOL)launchedFromTTL
{
  return self->_launchedFromTTL;
}

- (void)setLaunchedFromTTL:(BOOL)a3
{
  self->_launchedFromTTL = a3;
}

- (NSDate)ttlEventTime
{
  return self->_ttlEventTime;
}

- (void)setTtlEventTime:(id)a3
{
}

- (CGSize)windowSize
{
  double width = self->_windowSize.width;
  double height = self->_windowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWindowSize:(CGSize)a3
{
  self->_windowSize = a3;
}

- (void)setSourceApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_ttlEventTime, 0);
  objc_storeStrong((id *)&self->_mkOptions, 0);
  objc_storeStrong((id *)&self->_sceneOptions, 0);
  objc_storeStrong((id *)&self->_referringURL, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end