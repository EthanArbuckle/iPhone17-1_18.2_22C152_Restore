@interface RideBookingApplication
- (BOOL)enabled;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (NSString)uniqueName;
- (NSString)version;
- (RideBookingApplication)initWithExtension:(id)a3;
- (RideBookingApplicationRideStatusDelegate)delegate;
- (_MXExtension)extension;
- (id)_connectionWithIntent:(id)a3;
- (id)_passengersChoiceFromAvailablePartySizeOptions:(id)a3 optionPriceRange:(id)a4;
- (id)_statusWithGetRideStatusIntentResponse:(id)a3;
- (id)_statusWithListRideOptionsResponse:(id)a3;
- (id)_statusWithRequestRideStatusIntentResponse:(id)a3;
- (id)_statusWithRideOption:(id)a3 requestRideIntent:(id)a4 requestRideEtaResponse:(id)a5;
- (id)appBundleID;
- (id)iconWithFormat:(int)a3;
- (void)cancelRideWithRideStatus:(id)a3 completion:(id)a4;
- (void)checkIfCanCancelRideWithRideStatus:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didChangeProtectionStatusForBundleId:(id)a3;
- (void)enableForUse;
- (void)getRequestRideStatusWithPickupLocation:(id)a3 dropOffLocation:(id)a4 rideOption:(id)a5 completion:(id)a6;
- (void)getRideOptionStatusWithPickupLocation:(id)a3 dropOffLocation:(id)a4 completion:(id)a5;
- (void)getRideStatusWithCompletion:(id)a3;
- (void)getRideStatusWithPickupLocation:(id)a3 dropOffLocation:(id)a4 rideOption:(id)a5 partySize:(unint64_t)a6 paymentMethod:(id)a7 completion:(id)a8;
- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4;
- (void)openWithActivity:(id)a3;
- (void)sendFeedbackForRideStatus:(id)a3 feedbackRating:(id)a4 feedbackTip:(id)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setVersion:(id)a3;
- (void)startUpdates;
- (void)stopUpdates;
@end

@implementation RideBookingApplication

- (RideBookingApplication)initWithExtension:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RideBookingApplication;
  v6 = [(RideBookingApplication *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    v8 = [v5 _containingAppIdentifer];
    v9 = (NSString *)[v8 copy];
    identifier = v7->_identifier;
    v7->_identifier = v9;

    v11 = v7->_identifier;
    if (v11)
    {
      v12 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v11 allowPlaceholder:0 error:0];
    }
    else
    {
      v12 = 0;
    }
    uint64_t v13 = [v12 bundleVersion];
    version = v7->_version;
    v7->_version = (NSString *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("RideBookingApplication", v15);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v16;

    v18 = sub_100018584();
    uint64_t v19 = [v18 oneAppGuardian];
    appGuardian = v7->_appGuardian;
    v7->_appGuardian = (MapsSuggestionsAppGuardian *)v19;

    [(MapsSuggestionsAppGuardian *)v7->_appGuardian registerAppTracker:v7];
  }

  return v7;
}

- (NSString)description
{
  identifier = self->_identifier;
  v4 = [(RideBookingApplication *)self name];
  id v5 = +[NSString stringWithFormat:@"Pointer: %p, Identifier: %@, Name: %@", self, identifier, v4];

  return (NSString *)v5;
}

- (void)enableForUse
{
  id v2 = [(RideBookingApplication *)self extension];
  [v2 _setEnabled:1 error:0];
}

- (BOOL)enabled
{
  id v2 = [(RideBookingApplication *)self extension];
  unsigned __int8 v3 = [v2 isEnabled];

  return v3;
}

- (NSString)name
{
  unsigned __int8 v3 = [(RideBookingApplication *)self identifier];

  if (!v3) {
    goto LABEL_3;
  }
  v4 = [(RideBookingApplication *)self identifier];
  id v5 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  v6 = [v5 localizedName];
  id v7 = [v6 copy];

  if (!v7)
  {
LABEL_3:
    v8 = [(RideBookingApplication *)self extension];
    v9 = [v8 displayName];
    id v7 = [v9 copy];
  }

  return (NSString *)v7;
}

- (id)_connectionWithIntent:(id)a3
{
  id v4 = a3;
  id v5 = [(RideBookingApplication *)self identifier];
  [v4 _setLaunchId:v5];

  id v6 = [objc_alloc((Class)INCExtensionConnection) initWithIntent:v4];
  [v6 setRequiresTCC:0];

  return v6;
}

- (void)getRideOptionStatusWithPickupLocation:(id)a3 dropOffLocation:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      id v13 = objc_alloc((Class)NSString);
      v14 = [(RideBookingApplication *)self identifier];
      id v15 = [v13 initWithFormat:@"%@ handling ListRideOptions", v14];
      *(_DWORD *)buf = 136315394;
      v35 = v12;
      __int16 v36 = 2112;
      *(void *)v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak(&location, self);
    dispatch_queue_t v16 = [(RideBookingApplication *)self identifier];
    int v17 = isExtensionLocked();

    if (v17)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1004BEF20;
      block[3] = &unk_1012E9950;
      objc_copyWeak(&v32, &location);
      id v31 = v10;
      dispatch_async(queue, block);

      objc_destroyWeak(&v32);
    }
    else
    {
      id v20 = [objc_alloc((Class)INListRideOptionsIntent) initWithPickupLocation:v8 dropOffLocation:v9];
      v21 = [(RideBookingApplication *)self _connectionWithIntent:v20];
      GEOFindOrCreateLog();
      objc_super v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = [(RideBookingApplication *)self uniqueName];
        *(_DWORD *)buf = 138412546;
        v35 = v23;
        __int16 v36 = 2080;
        *(void *)v37 = "listRideOptions_resumeWithCompletionHandler";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
      }
      v24 = GEOFindOrCreateLog();
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "listRideOptions_resumeWithCompletionHandler", "", buf, 2u);
      }

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1004BF064;
      v26[3] = &unk_1012EC818;
      objc_copyWeak(&v29, &location);
      id v28 = v10;
      id v25 = v21;
      id v27 = v25;
      [v25 resumeWithCompletionHandler:v26];

      objc_destroyWeak(&v29);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v19 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      __int16 v36 = 1024;
      *(_DWORD *)v37 = 137;
      *(_WORD *)&v37[4] = 2082;
      *(void *)&v37[6] = "-[RideBookingApplication getRideOptionStatusWithPickupLocation:dropOffLocation:completion:]";
      __int16 v38 = 2082;
      v39 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)getRequestRideStatusWithPickupLocation:(id)a3 dropOffLocation:(id)a4 rideOption:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v27 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [v11 name];
    id v25 = [objc_alloc((Class)INSpeakableString) initWithVocabularyIdentifier:v13 spokenPhrase:v13 pronunciationHint:v13];
    id v14 = [objc_alloc((Class)INRequestRideIntent) initWithPickupLocation:v10 dropOffLocation:v27 rideOptionName:v25 partySize:0 paymentMethod:0 scheduledPickupTime:0];
    v26 = [(RideBookingApplication *)self _connectionWithIntent:v14];
    id v15 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      dispatch_queue_t v16 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      id v17 = objc_alloc((Class)NSString);
      v18 = [(RideBookingApplication *)self identifier];
      id v19 = [v17 initWithFormat:@"%@ confirming RequestRide: %@", v18, v14];
      *(_DWORD *)buf = 136315394;
      v37 = v16;
      __int16 v38 = 2112;
      *(void *)v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = [(RideBookingApplication *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      v37 = v21;
      __int16 v38 = 2080;
      *(void *)v39 = "requestRideStatus_resumeWithCompletionHandler";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    objc_super v22 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestRideStatus_resumeWithCompletionHandler", "", buf, 2u);
    }

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1004C0154;
    v28[3] = &unk_1012EC890;
    objc_copyWeak(&v34, &location);
    id v33 = v12;
    id v29 = v10;
    id v23 = v14;
    id v30 = v23;
    id v31 = v11;
    id v24 = v26;
    id v32 = v24;
    [v24 resumeWithCompletionHandler:v28];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    id v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v37 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      __int16 v38 = 1024;
      *(_DWORD *)v39 = 200;
      *(_WORD *)&v39[4] = 2082;
      *(void *)&v39[6] = "-[RideBookingApplication getRequestRideStatusWithPickupLocation:dropOffLocation:rideOption:completion:]";
      __int16 v40 = 2082;
      v41 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)getRideStatusWithPickupLocation:(id)a3 dropOffLocation:(id)a4 rideOption:(id)a5 partySize:(unint64_t)a6 paymentMethod:(id)a7 completion:(id)a8
{
  id v33 = a3;
  id v34 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v32 = v14;
  if (v16)
  {
    id v17 = [v14 name];
    id v31 = [objc_alloc((Class)INSpeakableString) initWithVocabularyIdentifier:v17 spokenPhrase:v17 pronunciationHint:v17];
    id v18 = objc_alloc((Class)INRequestRideIntent);
    id v19 = +[NSNumber numberWithUnsignedInteger:a6];
    id v20 = [v15 intentsPaymentMethod];
    id v21 = [v18 initWithPickupLocation:v33 dropOffLocation:v34 rideOptionName:v31 partySize:v19 paymentMethod:v20 scheduledPickupTime:0];

    objc_super v22 = [(RideBookingApplication *)self _connectionWithIntent:v21];
    id v23 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      id v24 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      id v25 = objc_alloc((Class)NSString);
      v26 = [(RideBookingApplication *)self identifier];
      id v27 = [v25 initWithFormat:@"%@ handling RequestRide: %@", v26, v21];
      *(_DWORD *)buf = 136315394;
      __int16 v40 = v24;
      __int16 v41 = 2112;
      *(void *)v42 = v27;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      id v29 = [(RideBookingApplication *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      __int16 v40 = v29;
      __int16 v41 = 2080;
      *(void *)v42 = "getRideStatus_resumeWithCompletionHandler";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v30 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getRideStatus_resumeWithCompletionHandler", "", buf, 2u);
    }

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1004C1468;
    v35[3] = &unk_1012EC908;
    objc_copyWeak(&v37, &location);
    id v36 = v16;
    [v22 resumeWithCompletionHandler:v35];

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  else
  {
    id v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v40 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      __int16 v41 = 1024;
      *(_DWORD *)v42 = 278;
      *(_WORD *)&v42[4] = 2082;
      *(void *)&v42[6] = "-[RideBookingApplication getRideStatusWithPickupLocation:dropOffLocation:rideOption:partySize"
                           ":paymentMethod:completion:]";
      __int16 v43 = 2082;
      v44 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)getRideStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      id v7 = objc_alloc((Class)NSString);
      id v8 = [(RideBookingApplication *)self identifier];
      id v9 = [v7 initWithFormat:@"%@ handling GetRideStatus", v8];
      *(_DWORD *)buf = 136315394;
      id v20 = v6;
      __int16 v21 = 2112;
      *(void *)objc_super v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    id v10 = objc_opt_new();
    id v11 = [(RideBookingApplication *)self _connectionWithIntent:v10];

    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [(RideBookingApplication *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      id v20 = v13;
      __int16 v21 = 2080;
      *(void *)objc_super v22 = "getRideStatusWithCompletion_resumeWithCompletionHandler";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v14 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getRideStatusWithCompletion_resumeWithCompletionHandler", "", buf, 2u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1004C251C;
    v15[3] = &unk_1012EC908;
    objc_copyWeak(&v17, &location);
    id v16 = v4;
    [v11 resumeWithCompletionHandler:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      __int16 v21 = 1024;
      *(_DWORD *)objc_super v22 = 343;
      *(_WORD *)&v22[4] = 2082;
      *(void *)&v22[6] = "-[RideBookingApplication getRideStatusWithCompletion:]";
      __int16 v23 = 2082;
      id v24 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)startUpdates
{
  unsigned __int8 v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
    id v5 = objc_alloc((Class)NSString);
    id v6 = [(RideBookingApplication *)self identifier];
    id v7 = (char *)[v5 initWithFormat:@"%@ starting updates", v6];
    *(_DWORD *)buf = 136315394;
    __int16 v21 = v4;
    __int16 v22 = 2112;
    __int16 v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  if (!self->_getRideStatusConnection)
  {
    id v8 = objc_alloc((Class)INCExtensionConnection);
    id v9 = objc_opt_new();
    id v10 = (INCExtensionConnection *)[v8 initWithIntent:v9];
    getRideStatusConnection = self->_getRideStatusConnection;
    self->_getRideStatusConnection = v10;

    [(INCExtensionConnection *)self->_getRideStatusConnection setRequiresTCC:0];
    id v12 = [(RideBookingApplication *)self identifier];
    id v13 = [(INCExtensionConnection *)self->_getRideStatusConnection intent];
    [v13 _setLaunchId:v12];
  }
  id v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [(RideBookingApplication *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    __int16 v21 = v15;
    __int16 v22 = 2080;
    __int16 v23 = "startGetRideStatusUpdates_resumeWithCompletionHandler";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v16 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "startGetRideStatusUpdates_resumeWithCompletionHandler", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  id v17 = self->_getRideStatusConnection;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1004C3554;
  v18[3] = &unk_1012EC958;
  objc_copyWeak(&v19, (id *)buf);
  [(INCExtensionConnection *)v17 resumeWithCompletionHandler:v18];
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)stopUpdates
{
  unsigned __int8 v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
    id v5 = objc_alloc((Class)NSString);
    id v6 = [(RideBookingApplication *)self identifier];
    id v7 = (char *)[v5 initWithFormat:@"%@ stopping updates", v6];
    *(_DWORD *)buf = 136315394;
    __int16 v21 = v4;
    __int16 v22 = 2112;
    __int16 v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  if (!self->_getRideStatusConnection)
  {
    id v8 = objc_alloc((Class)INCExtensionConnection);
    id v9 = objc_opt_new();
    id v10 = (INCExtensionConnection *)[v8 initWithIntent:v9];
    getRideStatusConnection = self->_getRideStatusConnection;
    self->_getRideStatusConnection = v10;

    [(INCExtensionConnection *)self->_getRideStatusConnection setRequiresTCC:0];
    id v12 = [(RideBookingApplication *)self identifier];
    id v13 = [(INCExtensionConnection *)self->_getRideStatusConnection intent];
    [v13 _setLaunchId:v12];
  }
  id v14 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [(RideBookingApplication *)self uniqueName];
    *(_DWORD *)buf = 138412546;
    __int16 v21 = v15;
    __int16 v22 = 2080;
    __int16 v23 = "stopGetRideStatusUpdates_resumeWithCompletionHandler";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
  }
  id v16 = GEOFindOrCreateLog();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "stopGetRideStatusUpdates_resumeWithCompletionHandler", "", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  id v17 = self->_getRideStatusConnection;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1004C3AC4;
  v18[3] = &unk_1012EC958;
  objc_copyWeak(&v19, (id *)buf);
  [(INCExtensionConnection *)v17 resumeWithCompletionHandler:v18];
  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004C3DAC;
  v8[3] = &unk_1012E9340;
  objc_copyWeak(&v11, &location);
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)sendFeedbackForRideStatus:(id)a3 feedbackRating:(id)a4 feedbackTip:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v31 = v10;
  if (v13)
  {
    id v14 = objc_alloc((Class)INSendRideFeedbackIntent);
    id v15 = [v10 identifier];
    id v16 = [v14 initWithRideIdentifier:v15];

    if (v11)
    {
      [v16 setRating:v11];
      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
      id v17 = [v16 rating];
      [v16 setRating:v17];

      if (!v12)
      {
LABEL_9:
        __int16 v22 = [(RideBookingApplication *)self _connectionWithIntent:v16];
        __int16 v23 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          id v24 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
          id v25 = objc_alloc((Class)NSString);
          v26 = [(RideBookingApplication *)self identifier];
          id v27 = [v25 initWithFormat:@"%@ handling SendRideFeeback: %@", v26, v16, v31];
          *(_DWORD *)buf = 136315394;
          id v37 = v24;
          __int16 v38 = 2112;
          *(void *)v39 = v27;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
        }
        objc_initWeak(&location, self);
        GEOFindOrCreateLog();
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          id v29 = [(RideBookingApplication *)self uniqueName];
          *(_DWORD *)buf = 138412546;
          id v37 = v29;
          __int16 v38 = 2080;
          *(void *)v39 = "sendFeedbackForRide_resumeWithCompletionHandler";
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
        }
        id v30 = GEOFindOrCreateLog();
        if (os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v30, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "sendFeedbackForRide_resumeWithCompletionHandler", "", buf, 2u);
        }

        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1004C44E4;
        v32[3] = &unk_1012EC908;
        objc_copyWeak(&v34, &location);
        id v33 = v13;
        [v22 resumeWithCompletionHandler:v32];

        objc_destroyWeak(&v34);
        objc_destroyWeak(&location);

        goto LABEL_16;
      }
    }
    id v18 = objc_alloc((Class)INCurrencyAmount);
    id v19 = [v12 amount];
    id v20 = [v12 currencyCode];
    id v21 = [v18 initWithAmount:v19 currencyCode:v20];
    [v16 setTip:v21];

    goto LABEL_9;
  }
  id v16 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    id v37 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
    __int16 v38 = 1024;
    *(_DWORD *)v39 = 465;
    *(_WORD *)&v39[4] = 2082;
    *(void *)&v39[6] = "-[RideBookingApplication sendFeedbackForRideStatus:feedbackRating:feedbackTip:completion:]";
    __int16 v40 = 2082;
    __int16 v41 = "nil == (completion)";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
  }
LABEL_16:
}

- (void)checkIfCanCancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc((Class)INCancelRideIntent);
    id v9 = [v6 identifier];
    id v10 = [v8 initWithRideIdentifier:v9];

    id v11 = [(RideBookingApplication *)self _connectionWithIntent:v10];
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      id v14 = objc_alloc((Class)NSString);
      id v15 = [(RideBookingApplication *)self identifier];
      id v16 = [v14 initWithFormat:@"%@ confirming CancelRide: %@", v15, v10];
      *(_DWORD *)buf = 136315394;
      id v27 = v13;
      __int16 v28 = 2112;
      *(void *)id v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = [(RideBookingApplication *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      id v27 = v18;
      __int16 v28 = 2080;
      *(void *)id v29 = "checkIfCanCancelRide_resumeWithCompletionHandler";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v19 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "checkIfCanCancelRide_resumeWithCompletionHandler", "", buf, 2u);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1004C54D0;
    v21[3] = &unk_1012EC818;
    objc_copyWeak(&v24, &location);
    id v23 = v7;
    id v20 = v11;
    id v22 = v20;
    [v20 resumeWithCompletionHandler:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      __int16 v28 = 1024;
      *(_DWORD *)id v29 = 522;
      *(_WORD *)&v29[4] = 2082;
      *(void *)&v29[6] = "-[RideBookingApplication checkIfCanCancelRideWithRideStatus:completion:]";
      __int16 v30 = 2082;
      id v31 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)cancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc((Class)INCancelRideIntent);
    id v9 = [v6 identifier];
    id v10 = [v8 initWithRideIdentifier:v9];

    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      id v13 = objc_alloc((Class)NSString);
      id v14 = [(RideBookingApplication *)self identifier];
      id v15 = [v13 initWithFormat:@"%@ handling CancelRide: %@", v14, v10];
      *(_DWORD *)buf = 136315394;
      id v27 = v12;
      __int16 v28 = 2112;
      *(void *)id v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
    }
    id v16 = [(RideBookingApplication *)self _connectionWithIntent:v10];
    objc_initWeak(&location, self);
    GEOFindOrCreateLog();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      id v18 = [(RideBookingApplication *)self uniqueName];
      *(_DWORD *)buf = 138412546;
      id v27 = v18;
      __int16 v28 = 2080;
      *(void *)id v29 = "cancelRide_resumeWithCompletionHandler";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);
    }
    id v19 = GEOFindOrCreateLog();
    if (os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cancelRide_resumeWithCompletionHandler", "", buf, 2u);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1004C66EC;
    v21[3] = &unk_1012EC818;
    objc_copyWeak(&v24, &location);
    id v23 = v7;
    id v20 = v16;
    id v22 = v20;
    [v20 resumeWithCompletionHandler:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      id v27 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      __int16 v28 = 1024;
      *(_DWORD *)id v29 = 590;
      *(_WORD *)&v29[4] = 2082;
      *(void *)&v29[6] = "-[RideBookingApplication cancelRideWithRideStatus:completion:]";
      __int16 v30 = 2082;
      id v31 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }
}

- (void)openWithActivity:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004C74C0;
  block[3] = &unk_1012E6690;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_passengersChoiceFromAvailablePartySizeOptions:(id)a3 optionPriceRange:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1004C7890;
    v8[3] = &unk_1012EC9F8;
    id v9 = v5;
    sub_100099700(a3, v8);
    a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return a3;
}

- (id)_statusWithGetRideStatusIntentResponse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 code];
  if (v5 > 7) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = qword_100F6F7E8[v5];
  }
  id v6 = [v4 rideStatus];
  id v7 = [v6 rideOption];

  id v8 = [v4 rideStatus];
  id v9 = [v7 availablePartySizeOptions];
  id v10 = [v7 priceRange];
  __int16 v28 = [(RideBookingApplication *)self _passengersChoiceFromAvailablePartySizeOptions:v9 optionPriceRange:v10];

  id v11 = [RideBookingRideOption alloc];
  id v12 = [v7 name];
  id v13 = [v7 estimatedPickupDate];
  id v14 = [(RideBookingRideOption *)v11 initWithApplication:self optionName:v12 paymentMethods:&__NSArray0__struct estimatedPickupDate:v13 passengersChoice:v28];

  [(RideBookingRideOption *)v14 setIntentsRideOption:v7];
  id v27 = [RideBookingRideStatus alloc];
  id v15 = [v8 completionStatus];
  unsigned int v26 = [v15 isCanceled];
  id v16 = [v8 completionStatus];
  id v17 = [v16 isCanceledByService];
  [v8 userActivityForCancelingInApplication];
  id v19 = v18 = self;
  id v20 = [v8 rideIdentifier];
  id v21 = (char *)[v8 phase];
  if ((unint64_t)(v21 - 1) >= 6) {
    id v22 = 0;
  }
  else {
    id v22 = v21;
  }
  uint64_t v23 = 3;
  if (v4) {
    uint64_t v23 = v29;
  }
  id v24 = [(RideBookingRideStatus *)v27 initWithApplication:v18 rideOption:v14 canceled:v26 canceledByService:v17 userActivityForCanceling:v19 identifier:v20 phase:v22 error:v23];

  [(RideBookingRideStatus *)v24 setIntentsRideStatus:v8];
  [(RideBookingRideStatus *)v24 setGetRideStatusIntentResponse:v4];

  return v24;
}

- (id)_statusWithRequestRideStatusIntentResponse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[v4 code];
  if (v5 > 0xA) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = qword_100F6F828[v5];
  }
  id v6 = [v4 rideStatus];
  id v7 = [v6 rideOption];

  id v8 = [v4 rideStatus];
  id v9 = [v7 availablePartySizeOptions];
  id v10 = [v7 priceRange];
  __int16 v28 = [(RideBookingApplication *)self _passengersChoiceFromAvailablePartySizeOptions:v9 optionPriceRange:v10];

  id v11 = [RideBookingRideOption alloc];
  id v12 = [v7 name];
  id v13 = [v7 estimatedPickupDate];
  id v14 = [(RideBookingRideOption *)v11 initWithApplication:self optionName:v12 paymentMethods:&__NSArray0__struct estimatedPickupDate:v13 passengersChoice:v28];

  [(RideBookingRideOption *)v14 setIntentsRideOption:v7];
  id v27 = [RideBookingRideStatus alloc];
  id v15 = [v8 completionStatus];
  unsigned int v26 = [v15 isCanceled];
  id v16 = [v8 completionStatus];
  id v17 = [v16 isCanceledByService];
  [v8 userActivityForCancelingInApplication];
  id v19 = v18 = self;
  id v20 = [v8 rideIdentifier];
  id v21 = (char *)[v8 phase];
  if ((unint64_t)(v21 - 1) >= 6) {
    id v22 = 0;
  }
  else {
    id v22 = v21;
  }
  uint64_t v23 = 3;
  if (v4) {
    uint64_t v23 = v29;
  }
  id v24 = [(RideBookingRideStatus *)v27 initWithApplication:v18 rideOption:v14 canceled:v26 canceledByService:v17 userActivityForCanceling:v19 identifier:v20 phase:v22 error:v23];

  [(RideBookingRideStatus *)v24 setIntentsRideStatus:v8];
  [(RideBookingRideStatus *)v24 setRequestRideIntentResponse:v4];

  return v24;
}

- (id)_statusWithRideOption:(id)a3 requestRideIntent:(id)a4 requestRideEtaResponse:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (!v8)
  {
    id v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      __int16 v47 = 1024;
      int v48 = 878;
      __int16 v49 = 2082;
      v50 = "-[RideBookingApplication _statusWithRideOption:requestRideIntent:requestRideEtaResponse:]";
      __int16 v51 = 2082;
      v52 = "rideOption==nil";
      id v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. rideOption should not be nil";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, v18, buf, 0x26u);
    }
LABEL_13:

    id v19 = 0;
    goto LABEL_24;
  }
  if (!v9)
  {
    id v17 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v46 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      __int16 v47 = 1024;
      int v48 = 879;
      __int16 v49 = 2082;
      v50 = "-[RideBookingApplication _statusWithRideOption:requestRideIntent:requestRideEtaResponse:]";
      __int16 v51 = 2082;
      v52 = "requestRideIntent==nil";
      id v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. requestRideIntent should not be nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if ([v10 code] != (id)1 && objc_msgSend(v11, "code") != (id)3)
  {
    id v20 = self;
    uint64_t v21 = 3;
    goto LABEL_16;
  }
  if (!v11)
  {
    id v20 = self;
    uint64_t v21 = 2;
LABEL_16:
    id v19 = +[RideBookingRequestRideStatus statusWithApplication:v20 error:v21];
    goto LABEL_24;
  }
  id v12 = [v11 rideStatus];
  id v13 = [v12 estimatedPickupDate];
  id v14 = [v13 copy];

  v44 = v14;
  if (v14)
  {
    [v14 timeIntervalSinceNow];
    id v16 = +[NSNumber numberWithUnsignedInteger:vcvtpd_u64_f64(v15 / 60.0)];
  }
  else
  {
    id v16 = 0;
  }
  id v22 = [v11 rideStatus];
  uint64_t v23 = [v22 rideOption];

  id v24 = [v23 name];
  if (![v24 length])
  {

    goto LABEL_22;
  }
  id v25 = [v23 estimatedPickupDate];

  if (!v25)
  {
LABEL_22:
    id v19 = +[RideBookingRequestRideStatus statusWithApplication:self error:3];
    goto LABEL_23;
  }
  unsigned int v26 = [v23 availablePartySizeOptions];
  id v27 = [v23 priceRange];
  v42 = [(RideBookingApplication *)self _passengersChoiceFromAvailablePartySizeOptions:v26 optionPriceRange:v27];

  __int16 v28 = [RideBookingRideOption alloc];
  uint64_t v29 = [v23 name];
  __int16 v30 = [v8 paymentMethods];
  [v23 estimatedPickupDate];
  id v31 = v43 = v16;
  id v32 = [(RideBookingRideOption *)v28 initWithApplication:self optionName:v29 paymentMethods:v30 estimatedPickupDate:v31 passengersChoice:v42];

  [(RideBookingRideOption *)v32 setIntentsRideOption:v23];
  id v33 = [v9 pickupLocation];
  id v34 = [v33 location];
  [v34 coordinate];
  double v36 = v35;
  double v38 = v37;
  v39 = [v9 pickupLocation];
  __int16 v40 = [v9 dropOffLocation];
  id v19 = +[RideBookingRequestRideStatus statusWithApplication:rideOption:startingWaypointCoordinate:origin:destination:loadingRequestRideStatus:etaMinutesAtStartWaypoint:](RideBookingRequestRideStatus, "statusWithApplication:rideOption:startingWaypointCoordinate:origin:destination:loadingRequestRideStatus:etaMinutesAtStartWaypoint:", self, v32, v39, v40, 0, v43, v36, v38);

  id v16 = v43;
LABEL_23:

LABEL_24:

  return v19;
}

- (id)_statusWithListRideOptionsResponse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 code];
    uint64_t v7 = 0;
    char v8 = 1;
    v59 = self;
    switch((unint64_t)v6)
    {
      case 0uLL:
      case 4uLL:
        char v8 = 0;
        uint64_t v7 = 5;
        break;
      case 5uLL:
        char v8 = 0;
        uint64_t v7 = 6;
        break;
      case 6uLL:
        char v8 = 0;
        uint64_t v7 = 7;
        break;
      case 7uLL:
        char v8 = 0;
        uint64_t v7 = 8;
        break;
      case 8uLL:
        char v8 = 0;
        uint64_t v7 = 9;
        break;
      case 9uLL:
        char v8 = 0;
        uint64_t v7 = 10;
        break;
      case 0xAuLL:
        char v8 = 0;
        uint64_t v7 = 11;
        break;
      default:
        break;
    }
    uint64_t v56 = v7;
    char v57 = v8;
    v63 = objc_opt_new();
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v58 = v5;
    id v10 = [v5 paymentMethods];
    id v11 = [v10 countByEnumeratingWithState:&v68 objects:v77 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v69;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v69 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          if ([v15 type] == (id)8)
          {
            id v16 = +[PKPaymentRequest availableNetworks];
            unsigned int v17 = +[PKPaymentAuthorizationController canMakePaymentsUsingNetworks:v16];

            if (!v17) {
              continue;
            }
          }
          id v18 = objc_alloc_init(RideBookingPaymentMethod);
          [(RideBookingPaymentMethod *)v18 setIntentsPaymentMethod:v15];
          [v63 addObject:v18];
        }
        id v12 = [v10 countByEnumeratingWithState:&v68 objects:v77 count:16];
      }
      while (v12);
    }

    v60 = objc_opt_new();
    id v19 = [v58 rideOptions];
    id v20 = [v19 sortedArrayUsingComparator:&stru_1012ECA38];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v21 = v20;
    id v22 = [v21 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v65;
      id v25 = NSCollectionLayoutEdgeSpacing_ptr;
      uint64_t v61 = *(void *)v65;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v65 != v24) {
            objc_enumerationMutation(v21);
          }
          id v27 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
          __int16 v28 = [v27 name];
          if (![v28 length]) {
            goto LABEL_35;
          }
          uint64_t v29 = [v27 estimatedPickupDate];

          if (!v29) {
            continue;
          }
          __int16 v30 = [v27 priceRange];
          id v31 = [v30 minimumPrice];
          id v32 = [v25[16] notANumber];
          if ([v31 isEqualToNumber:v32])
          {

LABEL_31:
            __int16 v28 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              double v38 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
              id v39 = [objc_alloc((Class)NSString) initWithFormat:@"Skipping INRideOption because the pricing is malformed: %@", v27];
              *(_DWORD *)buf = 136315394;
              v73 = v38;
              __int16 v74 = 2112;
              id v75 = v39;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
            }
            goto LABEL_34;
          }
          id v33 = [v27 priceRange];
          id v34 = [v33 maximumPrice];
          [v25[16] notANumber];
          id v35 = v23;
          v37 = id v36 = v21;
          unsigned int v62 = [v34 isEqualToNumber:v37];

          id v21 = v36;
          id v23 = v35;

          uint64_t v24 = v61;
          if (v62) {
            goto LABEL_31;
          }
          __int16 v40 = [v27 availablePartySizeOptions];
          __int16 v41 = [v27 priceRange];
          __int16 v28 = [(RideBookingApplication *)v59 _passengersChoiceFromAvailablePartySizeOptions:v40 optionPriceRange:v41];

          v42 = [RideBookingRideOption alloc];
          __int16 v43 = [v27 name];
          v44 = [v27 estimatedPickupDate];
          v45 = [(RideBookingRideOption *)v42 initWithApplication:v59 optionName:v43 paymentMethods:v63 estimatedPickupDate:v44 passengersChoice:v28];

          [(RideBookingRideOption *)v45 setIntentsRideOption:v27];
          [v60 addObject:v45];

LABEL_34:
          id v25 = NSCollectionLayoutEdgeSpacing_ptr;
LABEL_35:
        }
        id v23 = [v21 countByEnumeratingWithState:&v64 objects:v76 count:16];
      }
      while (v23);
    }

    if ((v57 & ([v60 count] == 0)) != 0) {
      uint64_t v46 = 3;
    }
    else {
      uint64_t v46 = v56;
    }
    unint64_t v5 = v58;
    id v47 = [v58 expirationDate];
    if (!v47)
    {
      id v48 = objc_alloc((Class)NSDate);
      GEOConfigGetDouble();
      id v47 = [v48 initWithTimeIntervalSinceNow:];
    }
    [v47 timeIntervalSinceNow];
    double v50 = v49;
    GEOConfigGetDouble();
    if (v50 < v51)
    {
      id v52 = objc_alloc((Class)NSDate);
      GEOConfigGetDouble();
      id v53 = [v52 initWithTimeIntervalSinceNow:];

      id v47 = v53;
    }
    v54 = [v58 userActivity];
    id v9 = +[RideBookingRideOptionStatus statusWithApplication:v59 rideOptions:v60 expirationDate:v47 userActivity:v54 rideOptionStatusError:v46];
  }
  else
  {
    id v9 = +[RideBookingRideOptionStatus statusWithApplication:self error:4];
  }

  return v9;
}

- (NSString)uniqueName
{
  id v2 = objc_opt_class();

  return (NSString *)[v2 description];
}

- (id)appBundleID
{
  return self->_identifier;
}

- (void)didChangeProtectionStatusForBundleId:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unint64_t v5 = [(RideBookingApplication *)self identifier];
  int v6 = isExtensionLocked();

  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004C8AE8;
    block[3] = &unk_1012E6690;
    objc_copyWeak(&v9, &location);
    void block[4] = self;
    dispatch_async(queue, block);
    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  [(MapsSuggestionsAppGuardian *)self->_appGuardian unregisterAppTracker:self];
  v3.receiver = self;
  v3.super_class = (Class)RideBookingApplication;
  [(RideBookingApplication *)&v3 dealloc];
}

- (RideBookingApplicationRideStatusDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (RideBookingApplicationRideStatusDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_MXExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_appGuardian, 0);
  objc_storeStrong((id *)&self->_getRideStatusConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)iconWithFormat:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(RideBookingApplication *)self extension];
  unint64_t v5 = [v4 _iconWithFormat:v3];

  return v5;
}

@end