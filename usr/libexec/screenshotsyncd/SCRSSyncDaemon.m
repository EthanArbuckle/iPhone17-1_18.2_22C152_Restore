@interface SCRSSyncDaemon
- (SCRSSyncDaemon)init;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8;
@end

@implementation SCRSSyncDaemon

- (SCRSSyncDaemon)init
{
  v8.receiver = self;
  v8.super_class = (Class)SCRSSyncDaemon;
  v2 = [(SCRSSyncDaemon *)&v8 init];
  if (v2)
  {
    v3 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.screenshotter"];
    idsService = v2->_idsService;
    v2->_idsService = v3;

    [(IDSService *)v2->_idsService addDelegate:v2 queue:&_dispatch_main_q];
    os_log_t v5 = os_log_create("com.apple.screenshotsync", "screenshot");
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v5;
  }
  return v2;
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v43 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v17 = logger;
    v18 = [v15 outgoingResponseIdentifier];
    *(_DWORD *)buf = 138412290;
    v50 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received message with ID: %@,", buf, 0xCu);
  }
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v19, v20, v21, v22, objc_opt_class(), 0);
  id v48 = 0;
  v24 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v23 fromData:v13 error:&v48];
  id v25 = v48;
  if (v25)
  {
    v26 = self->_logger;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR)) {
      sub_100002288((uint64_t)v25, v26);
    }
  }
  v27 = [v24 objectForKeyedSubscript:@"t"];
  id v28 = [v27 integerValue];

  if (v28 == (id)1)
  {
    v36 = self->_logger;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR)) {
      sub_100002200((uint64_t)v14, (uint64_t)v15, (os_log_t)v36);
    }
    goto LABEL_16;
  }
  if (v28)
  {
LABEL_16:
    id v35 = 0;
    goto LABEL_21;
  }
  id v42 = v14;
  id v29 = v12;
  v30 = self->_logger;
  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_INFO, "Message is screenshot.", buf, 2u);
  }
  v31 = [v24 objectForKeyedSubscript:@"d"];
  v32 = +[UIImage imageWithData:v31];

  v33 = self->_logger;
  if (v32)
  {
    id v12 = v29;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v33, OS_LOG_TYPE_INFO, "Generated image, sending to PhotoLibrary.", buf, 2u);
    }
    v34 = +[PHPhotoLibrary sharedPhotoLibrary];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_1000018D0;
    v45[3] = &unk_100004208;
    id v35 = v32;
    id v46 = v35;
    id v47 = v24;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10000194C;
    v44[3] = &unk_100004230;
    v44[4] = self;
    [v34 performChanges:v45 completionHandler:v44];
  }
  else
  {
    id v12 = v29;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR)) {
      sub_1000021BC((os_log_t)v33);
    }
    id v35 = 0;
  }
  id v14 = v42;
LABEL_21:
  v37 = self->_logger;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = v37;
    [v15 outgoingResponseIdentifier];
    id v39 = v14;
    v41 = id v40 = v12;
    *(_DWORD *)buf = 138412290;
    v50 = v41;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Finished processing image from message with ID: %@,", buf, 0xCu);

    id v12 = v40;
    id v14 = v39;
  }
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 metadata:(id)a6 fromID:(id)a7 context:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = logger;
    uint64_t v22 = [v19 outgoingResponseIdentifier];
    *(_DWORD *)buf = 138412290;
    v38 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received message with ID: %@,", buf, 0xCu);
  }
  v23 = [v17 objectForKeyedSubscript:@"t"];
  id v24 = [v23 integerValue];

  if (v24 == (id)2)
  {
    id v25 = self->_logger;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_INFO, "Message is screen recording. Sending to PhotoLibrary", buf, 2u);
    }
    v26 = [[SCRSIncomingFile alloc] initWithIDSURL:v16];
    v27 = +[PHPhotoLibrary sharedPhotoLibrary];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100001D18;
    v34[3] = &unk_100004208;
    id v35 = v26;
    id v36 = v17;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100001DB8;
    v32[3] = &unk_100004258;
    v32[4] = self;
    v33 = v35;
    id v28 = v35;
    [v27 performChanges:v34 completionHandler:v32];
  }
  id v29 = self->_logger;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = v29;
    v31 = [v19 outgoingResponseIdentifier];
    *(_DWORD *)buf = 138412290;
    v38 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Finished processing video from message with ID: %@,", buf, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end