@interface _SpotlightPunchInURLHandlingTask
- (_SpotlightPunchInURLHandlingTask)initWithURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 sceneOptions:(id)a6 mkOptions:(id)a7;
- (void)performTask;
@end

@implementation _SpotlightPunchInURLHandlingTask

- (_SpotlightPunchInURLHandlingTask)initWithURL:(id)a3 referringURL:(id)a4 sourceApplication:(id)a5 sceneOptions:(id)a6 mkOptions:(id)a7
{
  id v12 = a3;
  v33.receiver = self;
  v33.super_class = (Class)_SpotlightPunchInURLHandlingTask;
  v13 = [(URLHandlingTask *)&v33 initWithURL:v12 referringURL:a4 sourceApplication:a5 sceneOptions:a6 mkOptions:a7];
  if (v13)
  {
    v14 = [v12 absoluteString];
    v15 = +[NSURLComponents componentsWithString:v14];

    v28 = v15;
    [v15 queryItems];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = [v16 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v30;
LABEL_4:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v29 + 1) + 8 * v20);
        v22 = [v21 name];
        unsigned __int8 v23 = [v22 isEqualToString:@"pm"];

        if (v23) {
          break;
        }
        if (v18 == (id)++v20)
        {
          id v18 = [v16 countByEnumeratingWithState:&v29 objects:v36 count:16];
          if (v18) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      v24 = [v21 value];

      if (!v24) {
        goto LABEL_13;
      }
      v25 = (GEOSpotlightSearchPunchIn *)[objc_alloc((Class)GEOSpotlightSearchPunchIn) initWithEncodedString:v24];
      punchInDetails = v13->_punchInDetails;
      v13->_punchInDetails = v25;
    }
    else
    {
LABEL_10:

LABEL_13:
      v24 = sub_1000A930C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v12;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "_SpotlightPunchInURLHandlingTask open url: %@", buf, 0xCu);
      }
    }
  }
  return v13;
}

- (void)performTask
{
  [(RichMapsActivityCreatingTaskImpl *)self taskStarted];
  v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_SpotlightPunchInURLHandlingTask has been started", v12, 2u);
  }

  v4 = objc_alloc_init(SearchFieldItem);
  punchInDetails = self->_punchInDetails;
  v6 = [(GEOSpotlightSearchPunchIn *)punchInDetails completedSearchQuery];
  [(SearchFieldItem *)v4 setPunchInDetails:punchInDetails searchString:v6];

  v7 = [[SearchAction alloc] initWithSearchItem:v4 alongRoute:0];
  [(MapsAction *)v7 setUserLocationAccuracy:kCLLocationAccuracyKilometer];
  v8 = objc_alloc_init(MapsActivity);
  id v9 = objc_alloc_init((Class)GEOURLOptions);
  [(MapsActivity *)v8 setDisplayOptions:v9];

  v10 = [(MapsActivity *)v8 displayOptions];
  [v10 setUserTrackingMode:1];

  v11 = [[RichMapsActivity alloc] initWithMapsActivity:v8 mapsAction:v7];
  [(URLHandlingTask *)self taskFinished:v11];
}

- (void).cxx_destruct
{
}

@end