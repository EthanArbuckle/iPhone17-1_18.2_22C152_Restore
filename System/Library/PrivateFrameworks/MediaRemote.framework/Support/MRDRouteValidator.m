@interface MRDRouteValidator
- (MRAVEndpoint)activeSystemEndpoint;
- (MRAVEndpoint)localEndpoint;
- (MRDRouteRecommendationDemotionController)demotionController;
- (MRDRouteRecommendationOutputContextLogic)outputContextLogic;
- (MRDRouteRecommendationSuppressionController)suppressionController;
- (MRDRouteValidator)init;
- (NSLock)activeSystemEndpointLock;
- (OS_dispatch_queue)queue;
- (void)_bestRecommendationIn:(id)a3 primaryBundleIdentifier:(id)a4 activeSystemEndpoint:(id)a5 completion:(id)a6;
- (void)_fetchActiveSystemEndpoint:(id)a3;
- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3;
- (void)_refreshActiveSystemEndpoint:(id)a3;
- (void)bestRecommendationIn:(id)a3 primaryBundleIdentifier:(id)a4 eligibleToShowRecommendationsOutsideApp:(BOOL)a5 completion:(id)a6;
- (void)evaluateRecommendations:(id)a3 localOutputContextHasAirPlay:(BOOL)a4 primaryBundleIdentifier:(id)a5 activeSystemEndpoint:(id)a6 completion:(id)a7;
- (void)setActiveSystemEndpoint:(id)a3;
- (void)setActiveSystemEndpointLock:(id)a3;
- (void)setDemotionController:(id)a3;
- (void)setOutputContextLogic:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSuppressionController:(id)a3;
@end

@implementation MRDRouteValidator

- (void)bestRecommendationIn:(id)a3 primaryBundleIdentifier:(id)a4 eligibleToShowRecommendationsOutsideApp:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = _MRLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v10 count];
    CFStringRef v15 = @"NO";
    *(_DWORD *)buf = 134218498;
    id v23 = v14;
    __int16 v24 = 2112;
    if (v7) {
      CFStringRef v15 = @"YES";
    }
    id v25 = v11;
    __int16 v26 = 2112;
    CFStringRef v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RV bestRecommendationIn: %lu recommendation(s) | bundleID: %@ | outsideApp: %@ ", buf, 0x20u);
  }

  if ([v10 count])
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100080E98;
    v17[3] = &unk_1004190A8;
    v17[4] = self;
    BOOL v21 = v7;
    id v20 = v12;
    id v18 = v10;
    id v19 = v11;
    [(MRDRouteValidator *)self _fetchActiveSystemEndpoint:v17];
  }
  else
  {
    v16 = _MRLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RV received 0 interactive recommendations.", buf, 2u);
    }
  }
}

- (MRDRouteValidator)init
{
  v16.receiver = self;
  v16.super_class = (Class)MRDRouteValidator;
  v2 = [(MRDRouteValidator *)&v16 init];
  if (v2)
  {
    v3 = objc_alloc_init(MRDRouteRecommendationOutputContextLogic);
    outputContextLogic = v2->_outputContextLogic;
    v2->_outputContextLogic = v3;

    uint64_t v5 = +[MRDRouteRecommendationSuppressionController controller];
    suppressionController = v2->_suppressionController;
    v2->_suppressionController = (MRDRouteRecommendationSuppressionController *)v5;

    uint64_t v7 = +[MRDRouteRecommendationDemotionController controller];
    demotionController = v2->_demotionController;
    v2->_demotionController = (MRDRouteRecommendationDemotionController *)v7;

    v9 = (NSLock *)objc_alloc_init((Class)NSLock);
    activeSystemEndpointLock = v2->_activeSystemEndpointLock;
    v2->_activeSystemEndpointLock = v9;

    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediaremote.MRDRouteValidator", v11);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v12;

    id v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v2 selector:"_handleActiveSystemEndpointDidChangeNotification:" name:kMRMediaRemoteActiveSystemEndpointDidChangeNotification object:0];
  }
  return v2;
}

- (MRAVEndpoint)activeSystemEndpoint
{
  [(NSLock *)self->_activeSystemEndpointLock lock];
  v3 = self->_activeSystemEndpoint;
  [(NSLock *)self->_activeSystemEndpointLock unlock];

  return v3;
}

- (void)_fetchActiveSystemEndpoint:(id)a3
{
  uint64_t v5 = (void (**)(id, void *))a3;
  v4 = [(MRDRouteValidator *)self activeSystemEndpoint];
  if (v4)
  {
    if (v5) {
      v5[2](v5, v4);
    }
  }
  else
  {
    [(MRDRouteValidator *)self _refreshActiveSystemEndpoint:v5];
  }
}

- (void)_refreshActiveSystemEndpoint:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRDRouteValidator *)self activeSystemEndpointLock];
  [v5 lock];

  v6 = [(MRDRouteValidator *)self queue];
  id v7 = v4;
  MRAVEndpointResolveActiveSystemEndpointWithType();
}

- (void)_bestRecommendationIn:(id)a3 primaryBundleIdentifier:(id)a4 activeSystemEndpoint:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  id v14 = [(MRDRouteValidator *)self localEndpoint];
  CFStringRef v15 = +[MRIRRoute routeWithEndpoint:v14];
  objc_super v16 = [v15 nodes];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100081684;
  v33[3] = &unk_100419138;
  id v34 = v16;
  id v17 = v16;
  id v18 = objc_msgSend(v13, "msv_filter:", v33);

  BOOL v19 = [(MRDRouteRecommendationOutputContextLogic *)self->_outputContextLogic localOutputContextHasDeviceOfType:1];
  __int16 v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  __int16 v26 = sub_1000819F4;
  CFStringRef v27 = &unk_100419180;
  id v28 = v10;
  id v29 = v11;
  BOOL v32 = v19;
  v30 = self;
  id v31 = v12;
  id v20 = v12;
  id v21 = v11;
  id v22 = v10;
  id v23 = objc_retainBlock(&v24);
  -[MRDRouteValidator evaluateRecommendations:localOutputContextHasAirPlay:primaryBundleIdentifier:activeSystemEndpoint:completion:](self, "evaluateRecommendations:localOutputContextHasAirPlay:primaryBundleIdentifier:activeSystemEndpoint:completion:", v18, v19, v22, v21, v23, v24, v25, v26, v27);
}

- (void)evaluateRecommendations:(id)a3 localOutputContextHasAirPlay:(BOOL)a4 primaryBundleIdentifier:(id)a5 activeSystemEndpoint:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  objc_super v16 = [v12 firstObject];
  if (v16)
  {
    id v37 = v12;
    objc_msgSend(v12, "msv_suffixFromIndex:", 1);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100082284;
    v46[3] = &unk_1004191A8;
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    id v47 = v34;
    v48 = self;
    BOOL v52 = a4;
    id v36 = v13;
    id v49 = v13;
    id v35 = v14;
    id v17 = v14;
    id v50 = v17;
    id v33 = v15;
    id v18 = v15;
    id v51 = v18;
    BOOL v19 = objc_retainBlock(v46);
    id v20 = [v16 route];
    id v21 = [v20 routeIdentifier];
    id v22 = [v21 componentsSeparatedByString:@"|"];

    id v23 = [v16 route];
    __int16 v24 = [v23 nodes];

    uint64_t v25 = +[MRIRRoute routeWithEndpoint:v17];
    __int16 v26 = [v25 nodes];

    if ([v24 isEqualToSet:v26])
    {
      CFStringRef v27 = _MRLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RV ase is routed to same devices in recommendation. skipping recommendation.", buf, 2u);
      }

      id v28 = v19;
      ((void (*)(void *))v19[2])(v19);
      id v14 = v35;
      id v13 = v36;
      id v29 = v34;
    }
    else
    {
      id v32 = objc_alloc_init((Class)MRAVLightweightReconnaissanceSession);
      id v31 = [(MRDRouteValidator *)self queue];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100082358;
      v38[3] = &unk_100419218;
      id v39 = v22;
      id v40 = v17;
      BOOL v45 = a4;
      v43 = v19;
      id v41 = v24;
      id v44 = v18;
      id v42 = v16;
      [v32 searchOutputDevices:v39 reason:@"coriander" timeout:v31 queue:v38 completion:7.0];

      id v14 = v35;
      id v13 = v36;
      id v29 = v34;
      id v28 = v19;
    }
    id v15 = v33;

    id v12 = v37;
  }
  else
  {
    v30 = _MRLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RV no recommendations left. giving up", buf, 2u);
    }

    (*((void (**)(id, void, void, void, void, void, void, void))v15 + 2))(v15, 0, 0, 0, 0, 0, 0, 0);
  }
}

- (void)_handleActiveSystemEndpointDidChangeNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:kMRMediaRemoteActiveEndpointTypeUserInfoKey];
  unsigned int v7 = [v6 intValue];

  if (!v7)
  {
    v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[MRDRRC].RV _handleActiveSystemEndpointDidChangeNotification: %@", (uint8_t *)&v9, 0xCu);
    }

    [(MRDRouteValidator *)self _refreshActiveSystemEndpoint:0];
  }
}

- (MRAVEndpoint)localEndpoint
{
  return (MRAVEndpoint *)+[MRAVLocalEndpoint sharedLocalEndpoint];
}

- (void)setActiveSystemEndpoint:(id)a3
{
}

- (NSLock)activeSystemEndpointLock
{
  return self->_activeSystemEndpointLock;
}

- (void)setActiveSystemEndpointLock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (MRDRouteRecommendationOutputContextLogic)outputContextLogic
{
  return self->_outputContextLogic;
}

- (void)setOutputContextLogic:(id)a3
{
}

- (MRDRouteRecommendationSuppressionController)suppressionController
{
  return self->_suppressionController;
}

- (void)setSuppressionController:(id)a3
{
}

- (MRDRouteRecommendationDemotionController)demotionController
{
  return self->_demotionController;
}

- (void)setDemotionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demotionController, 0);
  objc_storeStrong((id *)&self->_suppressionController, 0);
  objc_storeStrong((id *)&self->_outputContextLogic, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeSystemEndpointLock, 0);

  objc_storeStrong((id *)&self->_activeSystemEndpoint, 0);
}

@end