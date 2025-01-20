@interface MapsActivityItemsConfiguration
- (BOOL)_hasItemsForActivityItemsConfiguration;
- (BOOL)activityItemsConfigurationSupportsInteraction:(id)a3;
- (NSArray)itemProvidersForActivityItemsConfiguration;
- (NSTimer)invalidationTimer;
- (ShareItemSource)shareItemSource;
- (UIActivityItemsConfiguration)internalActivityItemsConfiguration;
- (id)_excludedInteractions;
- (id)urlForMapActivity:(id)a3;
- (void)setInternalActivityItemsConfiguration:(id)a3;
- (void)setInvalidationTimer:(id)a3;
- (void)setShareItemSource:(id)a3;
@end

@implementation MapsActivityItemsConfiguration

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  v3 = sub_100576B34();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getItemProviders", "", buf, 2u);
  }

  v4 = [(MapsActivityItemsConfiguration *)self internalActivityItemsConfiguration];
  v5 = [v4 itemProvidersForActivityItemsConfiguration];

  v6 = sub_100576B34();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getItemProviders", "", v8, 2u);
  }

  return (NSArray *)v5;
}

- (BOOL)_hasItemsForActivityItemsConfiguration
{
  v3 = sub_100576B34();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "checkHasActivityItems", "", buf, 2u);
  }

  v4 = [(MapsActivityItemsConfiguration *)self internalActivityItemsConfiguration];
  unsigned __int8 v5 = [v4 _hasItemsForActivityItemsConfiguration];

  v6 = sub_100576B34();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "checkHasActivityItems", "", v8, 2u);
  }

  return v5;
}

- (UIActivityItemsConfiguration)internalActivityItemsConfiguration
{
  internalActivityItemsConfiguration = self->_internalActivityItemsConfiguration;
  if (!internalActivityItemsConfiguration)
  {
    v4 = [(MapsActivityItemsConfiguration *)self shareItemSource];

    if (v4)
    {
      unsigned __int8 v5 = [(MapsActivityItemsConfiguration *)self shareItemSource];
    }
    else
    {
      v6 = +[UIApplication _maps_keyMapsSceneDelegate];
      v7 = [v6 chromeViewController];

      unsigned __int8 v5 = [v7 currentShareItemSource];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100A5054C;
      v17[3] = &unk_1012F9170;
      v17[4] = self;
      v8 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v17 block:0.0];
      invalidationTimer = self->_invalidationTimer;
      self->_invalidationTimer = v8;
    }
    id v10 = objc_alloc((Class)UIActivityItemsConfiguration);
    v11 = [v5 activityProviders];
    v12 = [v5 applicationActivities];
    v13 = (UIActivityItemsConfiguration *)[v10 _initWithActivityItems:v11 applicationActivities:v12];
    v14 = self->_internalActivityItemsConfiguration;
    self->_internalActivityItemsConfiguration = v13;

    v15 = [v5 excludedActivityTypes];
    [(UIActivityItemsConfiguration *)self->_internalActivityItemsConfiguration _setExcludedActivityTypes:v15];

    internalActivityItemsConfiguration = self->_internalActivityItemsConfiguration;
  }

  return internalActivityItemsConfiguration;
}

- (BOOL)activityItemsConfigurationSupportsInteraction:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MapsActivityItemsConfiguration *)self internalActivityItemsConfiguration];
  unsigned __int8 v6 = [v5 activityItemsConfigurationSupportsInteraction:v4];

  return v6;
}

- (void)setShareItemSource:(id)a3
{
  objc_storeStrong((id *)&self->_shareItemSource, a3);
  id v6 = a3;
  [(ShareItemSource *)self->_shareItemSource setActivityProviderDelegate:self];
  internalActivityItemsConfiguration = self->_internalActivityItemsConfiguration;
  self->_internalActivityItemsConfiguration = 0;

  [(NSTimer *)self->_invalidationTimer invalidate];
}

- (id)_excludedInteractions
{
  v4[0] = _UIActivityItemsConfigurationInteractionServicesMenu;
  v4[1] = _UIActivityItemsConfigurationInteractionShare;
  v2 = +[NSArray arrayWithObjects:v4 count:2];

  return v2;
}

- (id)urlForMapActivity:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned __int8 v5 = +[UIApplication _maps_keyMapsSceneDelegate];
    id v6 = [v5 chromeViewController];

    v7 = [(MapsActivityItemsConfiguration *)self shareItemSource];
    v8 = [v7 searchResult];

    if (v8)
    {
      v9 = [v6 mapView];
      id v10 = [v8 mapsURLfromMapView:v9];
      v11 = +[NSURL URLWithString:v10];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (ShareItemSource)shareItemSource
{
  return self->_shareItemSource;
}

- (void)setInternalActivityItemsConfiguration:(id)a3
{
}

- (NSTimer)invalidationTimer
{
  return self->_invalidationTimer;
}

- (void)setInvalidationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_internalActivityItemsConfiguration, 0);

  objc_storeStrong((id *)&self->_shareItemSource, 0);
}

@end