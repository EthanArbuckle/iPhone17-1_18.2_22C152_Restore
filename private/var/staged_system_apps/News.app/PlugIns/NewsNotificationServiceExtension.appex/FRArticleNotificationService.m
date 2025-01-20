@interface FRArticleNotificationService
- (BOOL)supportsHandling:(id)a3;
- (FRArticleNotificationPersonalizer)personalizer;
- (FRArticleNotificationPostProcessingCoordinator)postProcessCoordinator;
- (FRArticleNotificationService)init;
- (FRArticleNotificationServiceArticleSource)articleSource;
- (UNMutableNotificationContent)bestAttemptContent;
- (id)cachesDirectory;
- (id)contentHandler;
- (id)notificationAttachmentsWithThumbnailFileURL:(id)a3 publisherLogoFileURL:(id)a4 publisherLogoMaskFileURL:(id)a5 publisherLogoCompactFileURL:(id)a6 isKettleDigestEnabled:(BOOL)a7;
- (void)didReceive:(id)a3 withContentHandler:(id)a4;
- (void)finalizeContent:(id)a3;
- (void)processDidReceiveSingleArticleNotificationRequest:(id)a3 withContentHandler:(id)a4;
- (void)serviceExtensionTimeWillExpire;
- (void)setArticleSource:(id)a3;
- (void)setBestAttemptContent:(id)a3;
- (void)setContentHandler:(id)a3;
- (void)setPersonalizer:(id)a3;
- (void)setPostProcessCoordinator:(id)a3;
@end

@implementation FRArticleNotificationService

- (FRArticleNotificationService)init
{
  v13.receiver = self;
  v13.super_class = (Class)FRArticleNotificationService;
  v2 = [(FRArticleNotificationService *)&v13 init];
  if (v2)
  {
    v3 = [[FRArticleNotificationFeedPersonalizerFactory alloc] initWithTranslationProvider:0];
    v4 = FCURLForAppConfigurationMirror();
    v5 = +[FCAppleAccount sharedAccount];
    v6 = [v5 supportedContentStoreFrontID];

    id v7 = [objc_alloc((Class)FCFileCoordinatedAppConfigurationManager) initWithFileURL:v4 storefrontID:v6];
    v8 = [[FRArticleNotificationPersonalizer alloc] initWithAppConfigurationManager:v7 feedPersonalizerFactory:v3];
    personalizer = v2->_personalizer;
    v2->_personalizer = v8;

    v10 = objc_alloc_init(FRArticleNotificationPostProcessingCoordinator);
    postProcessCoordinator = v2->_postProcessCoordinator;
    v2->_postProcessCoordinator = v10;
  }
  return v2;
}

- (BOOL)supportsHandling:(id)a3
{
  v3 = [a3 content];
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:FCNotificationPayloadApsKey];

  v6 = [v5 objectForKeyedSubscript:FCNotificationPayloadCategoryKey];
  LOBYTE(v4) = [v6 isEqualToString:FCNotificationArticleCategory];

  return (char)v4;
}

- (void)didReceive:(id)a3 withContentHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(FRArticleNotificationServiceArticleSource);
  [(FRArticleNotificationService *)self setArticleSource:v8];

  [(FRArticleNotificationService *)self setContentHandler:v7];
  v9 = [v6 content];
  id v10 = [v9 mutableCopy];
  [(FRArticleNotificationService *)self setBestAttemptContent:v10];

  v11 = [v6 content];
  v12 = [v11 userInfo];
  id v13 = [v12 mutableCopy];

  v14 = [v13 objectForKeyedSubscript:FCNotificationPayloadApsKey];
  id v15 = [v14 mutableCopy];

  v16 = [v15 objectForKeyedSubscript:FCNotificationPayloadCategoryKey];
  unsigned int v17 = [v16 isEqualToString:FCNotificationArticleCategory];
  v18 = FRArticleNotificationServiceSharedLog();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "extension-article category notification received.", (uint8_t *)&v20, 2u);
    }

    [(FRArticleNotificationService *)self processDidReceiveSingleArticleNotificationRequest:v6 withContentHandler:v7];
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412290;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "FRArticleNotificationService cannot preprocess a notification of this category: %@", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)processDidReceiveSingleArticleNotificationRequest:(id)a3 withContentHandler:(id)a4
{
  id v4 = a3;
  v5 = [v4 content];
  id v6 = [v5 userInfo];

  v42 = v6;
  id v7 = [v6 objectForKeyedSubscript:FCNotificationPayloadNewsKey];
  v41 = +[UNUserNotificationCenter currentNotificationCenter];
  v8 = [v41 notificationSettings];
  id v9 = [v8 scheduledDeliverySetting];
  BOOL v40 = v9 == (id)2;
  id v10 = [v7 objectForKeyedSubscript:FCNotificationPayloadNotificationBehaviorFlagsKey];
  unsigned __int8 v11 = [v10 intValue];

  v12 = NewsCoreUserDefaults();
  unsigned int v13 = [v12 BOOLForKey:@"notificationEnableAssetPrefetching"];
  unsigned int v14 = [v12 BOOLForKey:@"notificationAssetPrefetchingRequiresWatch"];
  id v15 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned int v16 = [v15 isPaired];

  int v17 = v11 & 1;
  v18 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v53 = v13;
    *(_WORD *)&v53[4] = 1024;
    *(_DWORD *)&v53[6] = v14;
    LOWORD(v54) = 1024;
    *(_DWORD *)((char *)&v54 + 2) = v9 == (id)2;
    HIWORD(v54) = 1024;
    *(_DWORD *)v55 = v17;
    *(_WORD *)&v55[4] = 1024;
    *(_DWORD *)&v55[6] = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "isAssetPrefetchingEnabled=%d, doesAssetPrefetchingRequireWatch=%d, isKettleDigestEnabled=%d, isBehaviorFlagSetToDisableFetchingKettleImage=%d, doesDeviceHaveWatchPaired=%d", buf, 0x20u);
  }

  v19 = FRArticleNotificationServiceSharedLog();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (v9 != (id)2)
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Running Kettle-disabled logic to determine whether to fetch assets.", buf, 2u);
    }

    if ((v13 & 1) == 0)
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_1000062E8;
      v49[3] = &unk_100028D50;
      v49[4] = self;
      sub_1000062E8((uint64_t)v49);
      goto LABEL_40;
    }
    if (((v14 ^ 1 | v16) & 1) == 0)
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100006378;
      v48[3] = &unk_100028D50;
      v48[4] = self;
      sub_100006378((uint64_t)v48);
      goto LABEL_40;
    }
    v23 = FRArticleNotificationServiceSharedLog();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v24 = "Continuing with prefetch since device does have watch paired or that check is not required by config";
    goto LABEL_26;
  }
  if (v20)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Running Kettle-enabled logic to determine whether to fetch assets.", buf, 2u);
  }

  if (v17)
  {
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000061C8;
    v51[3] = &unk_100028D50;
    v51[4] = self;
    sub_1000061C8((uint64_t)v51);
    goto LABEL_40;
  }
  if ([v8 timeSensitiveSetting] == (id)2)
  {
    v21 = [v4 content];
    BOOL v22 = [v21 interruptionLevel] == (id)2;
  }
  else
  {
    BOOL v22 = 0;
  }
  if ([v8 criticalAlertSetting] == (id)2)
  {
    v25 = [v4 content];
    BOOL v26 = [v25 interruptionLevel] == (id)3;
  }
  else
  {
    BOOL v26 = 0;
  }
  if (v26 || v22)
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100006258;
    v50[3] = &unk_100028D50;
    v50[4] = self;
    sub_100006258((uint64_t)v50);
    goto LABEL_40;
  }
  v23 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v24 = "Continuing with kettle image prefetch";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v24, buf, 2u);
  }
LABEL_27:

  v27 = [v7 objectForKeyedSubscript:FCNotificationPayloadThumbnailURLKey];
  v28 = [v7 objectForKeyedSubscript:FCNotificationPayloadPublisherLogoURLKey];
  v39 = [v7 objectForKeyedSubscript:FCNotificationPayloadPublisherLogoMaskURLKey];
  v29 = [v7 objectForKeyedSubscript:FCNotificationPayloadPublisherLogoCompactURLKey];
  v38 = [v7 objectForKeyedSubscript:FCNotificationPayloadFlintDocumentAssetURLKey];
  v30 = [(FRArticleNotificationService *)self cachesDirectory];
  v31 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = [v30 absoluteString];
    *(_DWORD *)buf = 138413314;
    *(void *)v53 = v27;
    *(_WORD *)&v53[8] = 2112;
    v54 = v28;
    *(_WORD *)v55 = 2112;
    *(void *)&v55[2] = v39;
    __int16 v56 = 2112;
    v57 = v29;
    __int16 v58 = 2112;
    v59 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Fetching the thumbnail and publisherLogo using the provided URLs, thumbnailURL: %@, publisherLogoURL: %@, publisherLogoMaskURLString: %@, publisherLogoCompactURL: %@, cachesDirectory: %@", buf, 0x34u);
  }
  if (v30 && (v27 || v28 || v29))
  {
    v35 = FRArticleNotificationServiceSharedLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v36 = [(FRArticleNotificationService *)self articleSource];
      *(_DWORD *)buf = 138412290;
      *(void *)v53 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Using article source %@", buf, 0xCu);
    }
    v37 = [(FRArticleNotificationService *)self articleSource];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100006408;
    v44[3] = &unk_100028D78;
    v44[4] = self;
    BOOL v47 = v40;
    id v45 = v7;
    id v46 = v42;
    [v37 fetchAssetsWithCachesDirectory:v30 thumbnailURLString:v27 publisherLogoURLString:v28 publisherLogoMaskURLString:v39 publisherLogoCompactURLString:v29 flintDocumentURLString:v38 completion:v44];
  }
  else
  {
    v33 = FRArticleNotificationServiceSharedLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Skipping prefetch since thumbnailURLString, publisherLogoURLString & publisherLogoCompactURLString are all nil.", buf, 2u);
    }

    v34 = [(FRArticleNotificationService *)self bestAttemptContent];
    [(FRArticleNotificationService *)self finalizeContent:v34];
  }
LABEL_40:
}

- (id)notificationAttachmentsWithThumbnailFileURL:(id)a3 publisherLogoFileURL:(id)a4 publisherLogoMaskFileURL:(id)a5 publisherLogoCompactFileURL:(id)a6 isKettleDigestEnabled:(BOOL)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unsigned int v13 = +[NSMutableArray array];
  unsigned int v14 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
  if (v10)
  {
    v35 = UNNotificationAttachmentOptionsTypeHintKey;
    CFStringRef v36 = kUTTypeJPEG;
    id v15 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    if (!a7)
    {
      v33[0] = UNNotificationAttachmentOptionsTypeHintKey;
      v33[1] = UNNotificationAttachmentOptionsThumbnailHiddenKey;
      v34[0] = kUTTypeJPEG;
      v34[1] = &__kCFBooleanTrue;
      uint64_t v16 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];

      id v15 = (void *)v16;
    }
    unsigned int v14 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    id v28 = 0;
    int v17 = +[UNNotificationAttachment attachmentWithIdentifier:@"thumbnail-attachment" URL:v10 options:v15 error:&v28];
    id v18 = v28;
    if (v17)
    {
      [v13 addObject:v17];
      v19 = FRArticleNotificationServiceSharedLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Added an attachment for the thumbnail. %@", buf, 0xCu);
      }

      unsigned int v14 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    }
  }
  if (v12)
  {
    v29[0] = UNNotificationAttachmentOptionsTypeHintKey;
    v29[1] = UNNotificationAttachmentOptionsThumbnailHiddenKey;
    v30[0] = kUTTypePNG;
    v30[1] = &__kCFBooleanTrue;
    BOOL v20 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    v21 = v14[312];
    id v27 = 0;
    BOOL v22 = [v21 attachmentWithIdentifier:@"publisherLogoCompact-attachment" URL:v12 options:v20 error:&v27];
    id v23 = v27;
    if (v22)
    {
      [v13 addObject:v22];
      v24 = FRArticleNotificationServiceSharedLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v11;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Added an attachment for the publisher COMPACT logo. %@", buf, 0xCu);
      }
    }
  }
  id v25 = [v13 copy];

  return v25;
}

- (id)cachesDirectory
{
  v2 = +[NSFileManager defaultManager];
  v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.news"];

  id v4 = [v3 URLByAppendingPathComponent:@"Notifications"];
  v5 = [v4 path];
  id v6 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Using cache directory at %@", buf, 0xCu);
  }

  id v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:v5];

  if ((v8 & 1) == 0)
  {
    id v9 = +[NSFileManager defaultManager];
    id v18 = 0;
    unsigned int v10 = [v9 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v18];
    id v11 = v18;

    id v12 = FRArticleNotificationServiceSharedLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        BOOL v20 = v5;
        unsigned int v14 = "Created cache directory at %@";
        id v15 = v12;
        uint32_t v16 = 12;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138412546;
      BOOL v20 = v5;
      __int16 v21 = 2112;
      id v22 = v11;
      unsigned int v14 = "Failed to create directory at %@ due to %@";
      id v15 = v12;
      uint32_t v16 = 22;
      goto LABEL_9;
    }
  }

  return v4;
}

- (void)serviceExtensionTimeWillExpire
{
  v3 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "The operation took too long, serviceExtensionTimeWillExpire was called", v6, 2u);
  }

  id v4 = [(FRArticleNotificationService *)self contentHandler];
  v5 = [(FRArticleNotificationService *)self bestAttemptContent];
  ((void (**)(void, void *))v4)[2](v4, v5);
}

- (void)finalizeContent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  [(FRArticleNotificationService *)self setBestAttemptContent:v5];

  id v6 = [v4 userInfo];
  id v7 = [v6 objectForKeyedSubscript:FCNotificationPayloadNewsKey];

  id v8 = [objc_alloc((Class)FCNotificationArticleHeadline) initWithArticlePayload:v7 sourceChannel:0 assetManager:0];
  if (!v8)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100006F04;
    v23[3] = &unk_100028DA0;
    v23[4] = self;
    id v24 = v4;
    sub_100006F04((uint64_t)v23);
    BOOL v13 = v24;
    goto LABEL_5;
  }
  id v9 = [v7 objectForKeyedSubscript:FCNotificationPayloadNotificationBehaviorFlagsKey];
  unsigned __int8 v10 = [v9 intValue];

  if ((v10 & 2) == 0)
  {
    id v11 = [(FRArticleNotificationService *)self personalizer];
    id v25 = v8;
    id v12 = +[NSArray arrayWithObjects:&v25 count:1];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100007080;
    v18[3] = &unk_100028DC8;
    id v19 = v8;
    BOOL v20 = self;
    [v11 sortItems:v12 completion:v18];

    BOOL v13 = v19;
LABEL_5:

    goto LABEL_9;
  }
  unsigned int v14 = FRArticleNotificationServiceSharedLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Skipping personalizer to assign highest score.", buf, 2u);
  }

  id v15 = [(FRArticleNotificationService *)self bestAttemptContent];
  [v15 setRelevanceScore:1.0];

  uint32_t v16 = [(FRArticleNotificationService *)self postProcessCoordinator];
  int v17 = [(FRArticleNotificationService *)self bestAttemptContent];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100006F94;
  v21[3] = &unk_100028D50;
  v21[4] = self;
  [v16 notificationArrived:v17 completionHandler:v21];

LABEL_9:
}

- (id)contentHandler
{
  return self->_contentHandler;
}

- (void)setContentHandler:(id)a3
{
}

- (UNMutableNotificationContent)bestAttemptContent
{
  return self->_bestAttemptContent;
}

- (void)setBestAttemptContent:(id)a3
{
}

- (FRArticleNotificationServiceArticleSource)articleSource
{
  return self->_articleSource;
}

- (void)setArticleSource:(id)a3
{
}

- (FRArticleNotificationPersonalizer)personalizer
{
  return self->_personalizer;
}

- (void)setPersonalizer:(id)a3
{
}

- (FRArticleNotificationPostProcessingCoordinator)postProcessCoordinator
{
  return self->_postProcessCoordinator;
}

- (void)setPostProcessCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessCoordinator, 0);
  objc_storeStrong((id *)&self->_personalizer, 0);
  objc_storeStrong((id *)&self->_articleSource, 0);
  objc_storeStrong((id *)&self->_bestAttemptContent, 0);

  objc_storeStrong(&self->_contentHandler, 0);
}

@end