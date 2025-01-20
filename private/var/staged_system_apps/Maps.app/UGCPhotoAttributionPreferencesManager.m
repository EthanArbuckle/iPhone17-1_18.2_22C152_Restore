@interface UGCPhotoAttributionPreferencesManager
+ (id)sharedManager;
- (GEORPPhotoAttributionPreferences)fetchedPreferences;
- (NSDate)dateOfFetchedPreferences;
- (NSString)updateError;
- (UGCPhotoAttributionPreferencesManager)init;
- (id)_errorMessageForError:(int)a3;
- (id)_errorsInResponse:(id)a3;
- (id)observers;
- (void)_fetchPhotoAttributionPreferencesWithCompletion:(id)a3;
- (void)_finishWithPreferences:(id)a3 serverError:(id)a4 errorAsString:(id)a5 callback:(id)a6;
- (void)_storeFetchedPreferences:(id)a3;
- (void)addObserver:(id)a3;
- (void)photoAttributionPreferencesWithCompletion:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setDateOfFetchedPreferences:(id)a3;
- (void)setFetchedPreferences:(id)a3;
- (void)setUpdateError:(id)a3;
- (void)updatePhotoAttributionPreferencesAttributePhotos:(BOOL)a3 attributionName:(id)a4 completion:(id)a5;
@end

@implementation UGCPhotoAttributionPreferencesManager

+ (id)sharedManager
{
  if (qword_10160F7F0 != -1) {
    dispatch_once(&qword_10160F7F0, &stru_1012F7A00);
  }
  v2 = (void *)qword_10160F7E8;

  return v2;
}

- (UGCPhotoAttributionPreferencesManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)UGCPhotoAttributionPreferencesManager;
  v2 = [(UGCPhotoAttributionPreferencesManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.Maps.UGCPhotoAttributionPreferencesManagerQueue", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = geo_isolater_create();
    observersIsolator = v2->_observersIsolator;
    v2->_observersIsolator = (geo_isolater *)v6;
  }
  return v2;
}

- (void)photoAttributionPreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100765D24;
  v7[3] = &unk_1012E76E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)_storeFetchedPreferences:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  [(UGCPhotoAttributionPreferencesManager *)self setFetchedPreferences:v5];

  id v6 = +[NSDate now];
  [(UGCPhotoAttributionPreferencesManager *)self setDateOfFetchedPreferences:v6];

  id v8 = [(UGCPhotoAttributionPreferencesManager *)self observers];
  v7 = [(UGCPhotoAttributionPreferencesManager *)self fetchedPreferences];
  [v8 photoAttributionPreferencesDidChange:v7];
}

- (void)_fetchPhotoAttributionPreferencesWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v5 = objc_alloc_init((Class)GEORPFeedbackRequestParameters);
  id v6 = objc_alloc_init((Class)GEORPFeedbackQueryParameters);
  [v5 setQueryParameters:v6];

  v7 = [v5 queryParameters];
  [v7 addFeedbackComponentType:7];

  id v8 = objc_alloc((Class)GEORPFeedbackRequest);
  objc_super v9 = +[GEOMapService sharedService];
  v10 = [v9 defaultTraits];
  id v11 = [v8 initWithFeedbackRequestParameters:v5 traits:v10];

  id v28 = 0;
  v12 = +[UGCCredentialsBuilder buildICloudUserCredentialsWithError:&v28];
  id v13 = v28;
  if (v13)
  {
    v14 = sub_100765ED0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to create iCloud user info with error %@.  Will not perform submission lookup.", buf, 0xCu);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100766394;
    block[3] = &unk_1012E5F78;
    id v27 = v4;
    id v26 = v13;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [v11 setUserInfo:v12];
    v15 = sub_100765ED0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Created request %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    [(MSPFeedbackSubmissionTicket *)self->_ticket cancel];
    v16 = +[GEOMapService sharedService];
    v17 = [v16 defaultTraits];
    uint64_t v18 = +[MSPFeedbackSubmissionTicket ticketForFeedbackRequest:v11 traits:v17];
    ticket = self->_ticket;
    p_ticket = &self->_ticket;
    *p_ticket = (MSPFeedbackSubmissionTicket *)v18;

    v21 = *p_ticket;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1007663B0;
    v22[3] = &unk_1012F71B0;
    objc_copyWeak(&v24, (id *)buf);
    id v23 = v4;
    [(MSPFeedbackSubmissionTicket *)v21 submitWithHandler:v22 networkActivity:0];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
}

- (void)updatePhotoAttributionPreferencesAttributePhotos:(BOOL)a3 attributionName:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1007666F4;
  v13[3] = &unk_1012F7A50;
  BOOL v17 = a3;
  id v14 = v8;
  v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(workQueue, v13);
}

- (void)_finishWithPreferences:(id)a3 serverError:(id)a4 errorAsString:(id)a5 callback:(id)a6
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100766F80;
  v13[3] = &unk_1012F7A78;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v9 = v16;
  id v10 = v15;
  id v11 = v14;
  id v12 = v17;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

- (id)_errorsInResponse:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  id v6 = [v5 feedbackResult];

  v7 = [v6 submissionResult];

  id v8 = [v7 photoAttributionPreferencesUpdateResult];
  if ([v8 errors])
  {
    id v9 = (unsigned int *)[v8 errors];
    id v10 = sub_100765ED0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = *v9;
      int v16 = 138412546;
      id v17 = v8;
      __int16 v18 = 1024;
      unsigned int v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Photo Preference update complete: %@ with update error %d", (uint8_t *)&v16, 0x12u);
    }

    id v12 = [(UGCPhotoAttributionPreferencesManager *)self _errorMessageForError:*v9];
    [(UGCPhotoAttributionPreferencesManager *)self setUpdateError:v12];

    id v13 = [(UGCPhotoAttributionPreferencesManager *)self updateError];
  }
  else
  {
    [(UGCPhotoAttributionPreferencesManager *)self setUpdateError:0];
    id v14 = sub_100765ED0();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Photo Preference update complete %@ with no update error", (uint8_t *)&v16, 0xCu);
    }

    id v13 = 0;
  }

  return v13;
}

- (id)_errorMessageForError:(int)a3
{
  if (a3 >= 2)
  {
    if (a3 != 2) {
      goto LABEL_6;
    }
    id v4 = +[NSBundle mainBundle];
    id v5 = v4;
    CFStringRef v6 = @"[Photo Credit] Photo Credit name unavailable update error";
  }
  else
  {
    id v4 = +[NSBundle mainBundle];
    id v5 = v4;
    CFStringRef v6 = @"[Photo Credit] Photo Credit update error";
  }
  v3 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

LABEL_6:

  return v3;
}

- (id)observers
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_100103EFC;
  id v8 = sub_100104808;
  id v9 = 0;
  geo_isolate_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(UGCPhotoAttributionPreferencesManager *)self observers];
  [v5 registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(UGCPhotoAttributionPreferencesManager *)self observers];
  [v5 unregisterObserver:v4];
}

- (GEORPPhotoAttributionPreferences)fetchedPreferences
{
  return self->_fetchedPreferences;
}

- (void)setFetchedPreferences:(id)a3
{
}

- (NSDate)dateOfFetchedPreferences
{
  return self->_dateOfFetchedPreferences;
}

- (void)setDateOfFetchedPreferences:(id)a3
{
}

- (NSString)updateError
{
  return self->_updateError;
}

- (void)setUpdateError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateError, 0);
  objc_storeStrong((id *)&self->_dateOfFetchedPreferences, 0);
  objc_storeStrong((id *)&self->_fetchedPreferences, 0);
  objc_storeStrong((id *)&self->_observersIsolator, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_ticket, 0);
}

@end