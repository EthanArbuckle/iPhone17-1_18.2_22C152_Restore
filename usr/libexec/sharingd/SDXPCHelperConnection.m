@interface SDXPCHelperConnection
+ (id)identifierForColor:(id)a3;
+ (id)makeActivatedConnection;
+ (void)updateCacheFromSFCGImageData:(id)a3 cacheKey:(id)a4 contactIDs:(id)a5;
- (CGImage)CGImageWithCacheKey:(id)a3 contactIDs:(id)a4 type:(id)a5;
- (CGImage)CGImgForActionPlatterWithTitle:(id)a3 tintColor:(id)a4;
- (CGImage)CGImgForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7 processOppositeColor:(BOOL)a8;
- (CGImage)CGImgForNearbyBadgeWithCount:(int64_t)a3;
- (NSMutableArray)queuedBlocks;
- (NSString)serviceName;
- (SDXPCHelperConnection)initWithQueue:(id)a3;
- (SDXPCHelperConnection)initWithQueue:(id)a3 serviceName:(id)a4;
- (SDXPCHelperConnection)initWithQueue:(id)a3 xrRenderingMode:(unint64_t)a4;
- (id)CGImgDataForActivityMoreListEntryForActivityTitle:(id)a3 labelColor:(id)a4 processOppositeColor:(BOOL)a5 activityCategory:(int64_t)a6;
- (id)CGImgForUIActivityTitles:(id)a3 foregroundColor:(id)a4 processOppositeColor:(BOOL)a5;
- (id)MD5HashOfStrings:(id)a3;
- (id)_loadGroupContactIdentityImage:(id)a3;
- (id)copyConversationIdentityImageIconDataForImage:(id)a3 forConversationIdentifier:(id)a4 style:(int64_t)a5 diameter:(double)a6 monogramsAsFlatImages:(BOOL)a7 isContactImage:(BOOL *)a8;
- (id)getOppositeColor:(id)a3;
- (id)groupMonogramImageDataForContacts:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6 processOppositeBackgroundStyle:(BOOL)a7;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)keyDerivedFromRelevantTraitCollectionProperties;
- (id)keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle;
- (id)loadBatchImageCacheData:(id)a3 cacheKey:(id)a4 mapCacheHitImage:(id)a5 runProxy:(id)a6 type:(id)a7;
- (id)monogramImageDataForContact:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6 isContactImage:(BOOL *)a7;
- (id)monogramImagesForMultipleContacts:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6;
- (id)perspectiveDataForActionPlatterWithTitle:(id)a3 tintColor:(id)a4;
- (id)perspectiveDataForActivityMoreListEntryForActivityTitle:(id)a3 labelColor:(id)a4 activityCategory:(int64_t)a5;
- (id)perspectiveDataForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7;
- (id)perspectiveDataForNearbyBadgeWithCount:(int64_t)a3;
- (id)perspectiveDataForUIActivityTitle:(id)a3 textColor:(id)a4;
- (id)urlToCGImgDataForCallHandoffIconWithAppIconImageData:(id)a3 contact:(id)a4;
- (id)whitelistedDownloadsFolderURL;
- (unint64_t)getContactBackgroundStyle;
- (unint64_t)getOppositeBackgroundStyle:(unint64_t)a3;
- (void)_updateShareSheetHostConfiguration;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)sendShareSheetInvocationMetricsWithAppBundleID:(id)a3 numSuggestions:(int64_t)a4 suggestionDisplayNames:(id)a5 extensionsCacheResult:(id)a6 isDarkMode:(BOOL)a7 duration:(int64_t)a8 isCollaborative:(BOOL)a9;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setQueuedBlocks:(id)a3;
- (void)setSessionKeepAliveTransactionIdentifier:(id)a3;
- (void)updateShareSheetHostConfiguration:(id)a3;
@end

@implementation SDXPCHelperConnection

+ (void)updateCacheFromSFCGImageData:(id)a3 cacheKey:(id)a4 contactIDs:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v12 = v7;
  if (v12)
  {
    uint64_t v10 = SFCreateCGImageFromData();
    if (v10)
    {
      v11 = (const void *)v10;
      +[SDXPCHelperImageCache setImage:v10 forKey:v8 contactIDs:v9];
      CFRelease(v11);
    }
  }
}

- (SDXPCHelperConnection)initWithQueue:(id)a3 serviceName:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SDXPCHelperConnection;
  id v7 = [(SDXPCHelperConnection *)&v16 init];
  if (v7)
  {
    id v8 = sharingXPCHelperLog();
    v7->_intervalID = os_signpost_id_generate(v8);

    uint64_t v9 = [(SDXPCHelperConnection *)v7 description];
    signpostName = v7->_signpostName;
    v7->_signpostName = (NSString *)v9;

    v7->_cacheAccessCount = 0;
    uint64_t v11 = objc_opt_new();
    cacheAccessDict = v7->_cacheAccessDict;
    v7->_cacheAccessDict = (NSMutableDictionary *)v11;

    v7->_cacheAccessLock._os_unfair_lock_opaque = 0;
    uint64_t v13 = objc_opt_new();
    queuedBlocks = v7->_queuedBlocks;
    v7->_queuedBlocks = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v7->_serviceName, a4);
  }

  return v7;
}

- (SDXPCHelperConnection)initWithQueue:(id)a3
{
  return [(SDXPCHelperConnection *)self initWithQueue:a3 serviceName:@"com.apple.SharingXPCHelper"];
}

- (SDXPCHelperConnection)initWithQueue:(id)a3 xrRenderingMode:(unint64_t)a4
{
  return [(SDXPCHelperConnection *)self initWithQueue:a3 serviceName:@"com.apple.SharingXPCHelper"];
}

- (void)activate
{
  if (!self->_activated)
  {
    self->_activated = 1;
    id v3 = objc_alloc((Class)NSXPCConnection);
    v4 = [(SDXPCHelperConnection *)self serviceName];
    v5 = (NSXPCConnection *)[v3 initWithServiceName:v4];
    connectionToService = self->_connectionToService;
    self->_connectionToService = v5;

    if (self->_queue) {
      -[NSXPCConnection _setQueue:](self->_connectionToService, "_setQueue:");
    }
    id v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SharingXPCHelperProtocol];
    [(NSXPCConnection *)self->_connectionToService setRemoteObjectInterface:v7];

    [(NSXPCConnection *)self->_connectionToService setInvalidationHandler:self->_invalidationHandler];
    [(NSXPCConnection *)self->_connectionToService setInterruptionHandler:self->_interruptionHandler];
    id v8 = [(NSXPCConnection *)self->_connectionToService remoteObjectInterface];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
    [v8 setClasses:v10 forSelector:"monogramImagesForMultipleContactsSync:style:diameter:monogramAsFlatImages:replyHandler:" argumentIndex:0 ofReply:1];

    uint64_t v11 = [(NSXPCConnection *)self->_connectionToService remoteObjectInterface];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    [v11 setClasses:v13 forSelector:"CGImgDataForUIActivityTitles:foregroundColor:replyHandler:" argumentIndex:0 ofReply:1];

    v14 = [(NSXPCConnection *)self->_connectionToService remoteObjectInterface];
    uint64_t v15 = objc_opt_class();
    objc_super v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(), 0);
    [v14 setClasses:v16 forSelector:"groupMonogramImageDataForContactsSync:style:diameter:backgroundStyle:monogramsAsFlatImages:replyHandler:" argumentIndex:0 ofReply:1];

    v17 = self->_connectionToService;
    [(NSXPCConnection *)v17 resume];
  }
}

- (void)invalidate
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001D73A8;
  v15[3] = &unk_1008CA4B8;
  v15[4] = self;
  id v3 = objc_retainBlock(v15);
  v4 = [(SDXPCHelperConnection *)self queuedBlocks];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = [(SDXPCHelperConnection *)self queuedBlocks];
    id v7 = objc_retainBlock(v3);
    [v6 addObject:v7];

    id v8 = [(SDXPCHelperConnection *)self queuedBlocks];
    id v9 = [v8 copy];

    uint64_t v10 = [(SDXPCHelperConnection *)self queuedBlocks];
    [v10 removeAllObjects];

    uint64_t v11 = dispatch_get_global_queue(-32768, 0);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001D7444;
    v13[3] = &unk_1008CA4B8;
    id v14 = v9;
    id v12 = v9;
    dispatch_async(v11, v13);
  }
  else
  {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (void)dealloc
{
  if (!self->_invalidateCalled)
  {
    v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SDXPCHelperConnection.m" lineNumber:198 description:@"SDXPCHelperConnection deallocated without -invalidate call"];

    if (!self->_invalidateCalled)
    {
      id v5 = daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        sub_1001DCE00();
      }
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SDXPCHelperConnection;
  [(SDXPCHelperConnection *)&v6 dealloc];
}

+ (id)makeActivatedConnection
{
  v2 = [[SDXPCHelperConnection alloc] initWithQueue:0];
  [(SDXPCHelperConnection *)v2 setInvalidationHandler:&stru_1008D00C8];
  [(SDXPCHelperConnection *)v2 activate];

  return v2;
}

- (id)whitelistedDownloadsFolderURL
{
  return 0;
}

- (id)monogramImageDataForContact:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6 isContactImage:(BOOL *)a7
{
  BOOL v7 = a6;
  id v38 = a3;
  uint64_t v11 = sharingXPCHelperLog();
  id v12 = v11;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = intervalID;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "monogramImageDataForContact", "%llu", (uint8_t *)&buf, 0xCu);
  }

  id v14 = v38;
  if (!v38)
  {
    uint64_t v15 = sharingXPCHelperLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "monogramImageDataForContact called with nil contact, will use fallback.", (uint8_t *)&buf, 2u);
    }

    id v14 = 0;
  }
  uint64_t v16 = [v14 identifier:a7];
  v17 = (void *)v16;
  v18 = @"FALLBACK";
  if (v16) {
    v18 = (__CFString *)v16;
  }
  v19 = v18;

  v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDXPCHelperConnection monogramImageDataForContact:style:diameter:monogramsAsFlatImages:isContactImage:]");
  v49[0] = v20;
  v49[1] = v19;
  v21 = +[NSNumber numberWithInteger:a4];
  v49[2] = v21;
  v22 = +[NSNumber numberWithDouble:floor(a5)];
  v49[3] = v22;
  v23 = +[NSNumber numberWithBool:v7];
  v49[4] = v23;
  v24 = +[NSArray arrayWithObjects:v49 count:5];

  v25 = [v24 componentsJoinedByString:@","];
  v48 = v19;
  v26 = +[NSArray arrayWithObjects:&v48 count:1];
  v27 = [(SDXPCHelperConnection *)self CGImageWithCacheKey:v25 contactIDs:v26 type:@"contact"];

  if (v27)
  {
    SFDataFromCGImage();
    id v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v44 = 0x3032000000;
    v45 = sub_1001D7B10;
    v46 = sub_1001D7B20;
    id v47 = 0;
    v29 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D00E8];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1001D7B7C;
    v39[3] = &unk_1008D0110;
    v39[4] = &buf;
    v39[5] = v37;
    [v29 monogramImageDataForContactSync:v38 style:a4 diameter:v7 monogramsAsFlatImages:v39 replyHandler:a5];

    uint64_t v30 = *(void *)(*((void *)&buf + 1) + 40);
    v42 = v19;
    v31 = +[NSArray arrayWithObjects:&v42 count:1];
    +[SDXPCHelperConnection updateCacheFromSFCGImageData:v30 cacheKey:v25 contactIDs:v31];

    v32 = sharingXPCHelperLog();
    v33 = v32;
    os_signpost_id_t v34 = self->_intervalID;
    if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_DWORD *)v40 = 134217984;
      os_signpost_id_t v41 = v34;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v34, "monogramImageDataForContact", "%llu", v40, 0xCu);
    }

    id v28 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);
  }

  return v28;
}

- (id)copyConversationIdentityImageIconDataForImage:(id)a3 forConversationIdentifier:(id)a4 style:(int64_t)a5 diameter:(double)a6 monogramsAsFlatImages:(BOOL)a7 isContactImage:(BOOL *)a8
{
  BOOL v51 = a7;
  id v11 = a3;
  id v12 = a4;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_1001D7B10;
  v57 = sub_1001D7B20;
  id v58 = 0;
  uint64_t v13 = [v11 _uri];
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[SDXPCHelperConnection copyConversationIdentityImageIconDataForImage:forConversationIdentifier:style:diameter:monogramsAsFlatImages:isContactImage:]");
  uint64_t v15 = sharingXPCHelperLog();
  uint64_t v16 = v15;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v62 = intervalID;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "copyConversationIdentityImageIconDataForImage", "%llu", buf, 0xCu);
  }

  v18 = sharingXPCHelperLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [v11 _identifier];
    *(_DWORD *)long long buf = 138412290;
    os_signpost_id_t v62 = (os_signpost_id_t)v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Fetching donated contact icon for image %@", buf, 0xCu);
  }
  if (![v13 isFileURL])
  {
    v25 = [v11 _identifier];
    v31 = [v14 stringByAppendingFormat:@",%@,%@,%f", v12, v25, floor(a6)];
    goto LABEL_10;
  }
  v20 = +[NSFileManager defaultManager];
  v21 = [v13 path];
  unsigned __int8 v22 = [v20 fileExistsAtPath:v21];

  if (v22)
  {
    v23 = +[NSFileManager defaultManager];
    v24 = [v13 path];
    v25 = [v23 attributesOfItemAtPath:v24 error:0];

    v26 = [v25 objectForKey:NSFileModificationDate];
    v27 = [v13 path];
    id v28 = [v27 componentsSeparatedByString:@"/"];
    v29 = [v28 lastObject];

    [v26 timeIntervalSince1970];
    v31 = [v14 stringByAppendingFormat:@",%@,%@,%f,%f", v29, v12, v30, floor(a6)];

LABEL_10:
    v32 = sharingXPCHelperLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      os_signpost_id_t v62 = (os_signpost_id_t)v31;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "copyConversationIdentityImageIconDataForImage: cache key {%@}", buf, 0xCu);
    }

    id v60 = v12;
    v33 = +[NSArray arrayWithObjects:&v60 count:1];
    os_signpost_id_t v34 = [(SDXPCHelperConnection *)self CGImageWithCacheKey:v31 contactIDs:v33 type:@"contact"];

    if (v34)
    {
      v35 = sharingXPCHelperLog();
      v36 = v35;
      os_signpost_id_t v37 = self->_intervalID;
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_DWORD *)long long buf = 134217984;
        os_signpost_id_t v62 = v37;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, v37, "copyConversationIdentityImageIconDataForImage", "%llu", buf, 0xCu);
      }

      SFDataFromCGImage();
      id v38 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = sharingXPCHelperLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "copyConversationIdentityImageIconDataForImage: image not found in cache", buf, 2u);
      }

      [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
      v40 = [(SDXPCHelperConnection *)self _loadGroupContactIdentityImage:v11];
      os_signpost_id_t v41 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D0130];
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1001D82F0;
      v52[3] = &unk_1008D0110;
      v52[4] = &v53;
      v52[5] = a8;
      [v41 monogramImageDataForContactSync:v40 style:a5 diameter:v51 monogramsAsFlatImages:v52 replyHandler:a6];

      uint64_t v42 = v54[5];
      id v59 = v12;
      v43 = +[NSArray arrayWithObjects:&v59 count:1];
      +[SDXPCHelperConnection updateCacheFromSFCGImageData:v42 cacheKey:v31 contactIDs:v43];

      uint64_t v44 = sharingXPCHelperLog();
      v45 = v44;
      os_signpost_id_t v46 = self->_intervalID;
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_DWORD *)long long buf = 134217984;
        os_signpost_id_t v62 = v46;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_END, v46, "copyConversationIdentityImageIconDataForImage", "%llu", buf, 0xCu);
      }

      id v38 = (id)v54[5];
    }
    goto LABEL_26;
  }
  v31 = sharingXPCHelperLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    id v47 = [v13 absoluteString];
    sub_1001DCEE8(v47, buf, v31);
  }
  id v38 = 0;
LABEL_26:

  _Block_object_dispose(&v53, 8);
  return v38;
}

- (unint64_t)getContactBackgroundStyle
{
  latestHostConfig = self->_latestHostConfig;
  if (latestHostConfig)
  {
    id v3 = [(UISUIActivityViewControllerConfiguration *)latestHostConfig hostTraitCollection];
    id v4 = [v3 userInterfaceStyle];

    if (v4 == (id)2) {
      return 3;
    }
    else {
      return 2;
    }
  }
  else
  {
    objc_super v6 = sharingXPCHelperLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1001DCFB4();
    }

    return 2;
  }
}

- (unint64_t)getOppositeBackgroundStyle:(unint64_t)a3
{
  if (((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)groupMonogramImageDataForContacts:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6 processOppositeBackgroundStyle:(BOOL)a7
{
  id v12 = a3;
  uint64_t v13 = sharingXPCHelperLog();
  id v14 = v13;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v34 = intervalID;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "groupMonogramImageDataForContacts", "%llu", buf, 0xCu);
  }

  uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[SDXPCHelperConnection groupMonogramImageDataForContacts:style:diameter:monogramsAsFlatImages:processOppositeBackgroundStyle:]");
  unint64_t v17 = [(SDXPCHelperConnection *)self getContactBackgroundStyle];
  if (!a7) {
    unint64_t v17 = [(SDXPCHelperConnection *)self getOppositeBackgroundStyle:v17];
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1001D86A8;
  v27[3] = &unk_1008D0158;
  id v28 = v16;
  int64_t v29 = a4;
  double v30 = a5;
  BOOL v32 = a6;
  unint64_t v31 = v17;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1001D8800;
  v24[3] = &unk_1008D0230;
  v24[4] = self;
  v24[5] = a4;
  *(double *)&v24[6] = a5;
  v24[7] = v17;
  BOOL v25 = a6;
  BOOL v26 = a7;
  id v18 = v16;
  v19 = [(SDXPCHelperConnection *)self loadBatchImageCacheData:v12 cacheKey:v27 mapCacheHitImage:&stru_1008D0198 runProxy:v24 type:@"groupContacts"];

  v20 = sharingXPCHelperLog();
  v21 = v20;
  os_signpost_id_t v22 = self->_intervalID;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v34 = v22;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_END, v22, "groupMonogramImageDataForContacts", "%llu", buf, 0xCu);
  }

  return v19;
}

- (id)urlToCGImgDataForCallHandoffIconWithAppIconImageData:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  os_signpost_id_t v22 = sub_1001D7B10;
  v23 = sub_1001D7B20;
  id v24 = 0;
  id v8 = sharingXPCHelperLog();
  id v9 = v8;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "urlToCGImgDataForCallHandoffIconWithAppIconImageData", "", buf, 2u);
  }

  id v11 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D0250];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001D8DAC;
  v17[3] = &unk_1008D0278;
  v17[4] = &v19;
  [v11 urlToCGImgDataForCallHandoffIconWithAppIconImageData:v6 contact:v7 replyHandler:v17];

  id v12 = sharingXPCHelperLog();
  uint64_t v13 = v12;
  os_signpost_id_t v14 = self->_intervalID;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v14, "urlToCGImgDataForCallHandoffIconWithAppIconImageData", "", buf, 2u);
  }

  id v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v15;
}

- (id)monogramImagesForMultipleContacts:(id)a3 style:(int64_t)a4 diameter:(double)a5 monogramsAsFlatImages:(BOOL)a6
{
  id v10 = a3;
  id v11 = sharingXPCHelperLog();
  id v12 = v11;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v28 = intervalID;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "monogramImagesForMultipleContacts", "%llu", buf, 0xCu);
  }

  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[SDXPCHelperConnection monogramImagesForMultipleContacts:style:diameter:monogramsAsFlatImages:]");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1001D9034;
  v22[3] = &unk_1008D02A0;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v24 = a4;
  double v25 = a5;
  BOOL v26 = a6;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001D9214;
  v20[3] = &unk_1008D0330;
  v20[4] = self;
  v20[5] = a4;
  *(double *)&v20[6] = a5;
  BOOL v21 = a6;
  id v14 = v23;
  id v15 = [(SDXPCHelperConnection *)self loadBatchImageCacheData:v10 cacheKey:v22 mapCacheHitImage:&stru_1008D02C0 runProxy:v20 type:@"multipleContacts"];

  uint64_t v16 = sharingXPCHelperLog();
  unint64_t v17 = v16;
  os_signpost_id_t v18 = self->_intervalID;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)long long buf = 134217984;
    os_signpost_id_t v28 = v18;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v18, "monogramImagesForMultipleContacts", "%llu", buf, 0xCu);
  }

  return v15;
}

- (id)_loadGroupContactIdentityImage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _imageData];
  if (v4) {
    goto LABEL_15;
  }
  id v5 = [v3 _uri];
  if (![v5 isFileURL])
  {
LABEL_5:
    id v9 = [(objc_class *)off_100969298() sharedConnection];
    id v18 = 0;
    id v10 = [v9 loadDataImageFromImage:v3 scaledSize:&v18 error:off_1009692A0()];
    id v11 = v18;

    if (v10) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      id v4 = [v10 _imageData];
      uint64_t v13 = sharingXPCHelperLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [v3 _identifier];
        *(_DWORD *)long long buf = 138412290;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Successfully fetched identity image {%@}", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v13 = sharingXPCHelperLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001DD1B8();
      }
      id v4 = 0;
    }

    if (!v4)
    {
      id v15 = 0;
      goto LABEL_16;
    }
LABEL_15:
    id v15 = objc_alloc_init((Class)CNMutableContact);
    [v15 setImageData:v4];
LABEL_16:
    id v6 = v15;
    uint64_t v16 = v6;
    goto LABEL_17;
  }
  id v6 = v5;
  [v6 fileSystemRepresentation];
  id v7 = (const char *)sandbox_extension_issue_file();
  if (v7)
  {
    id v8 = +[NSData dataWithBytesNoCopy:v7 length:strlen(v7) + 1 freeWhenDone:1];
    [v3 _setSandboxExtensionData:v8];

    goto LABEL_5;
  }
  id v4 = sharingXPCHelperLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100023F44(v6, v4);
  }
  uint64_t v16 = 0;
LABEL_17:

  return v16;
}

- (id)getOppositeColor:(id)a3
{
  id v3 = a3;
  id v4 = +[UIColor blackColor];
  unsigned __int8 v5 = [v3 isEqual:v4];

  id v6 = +[UIColor whiteColor];
  if ((v5 & 1) == 0)
  {
    unsigned int v7 = [v3 isEqual:v6];

    if (v7)
    {
      id v6 = +[UIColor blackColor];
    }
    else
    {
      id v8 = (CGColor *)[v3 CGColor];
      id v9 = +[UIColor colorWithRed:0.235294118 green:0.235294118 blue:0.262745098 alpha:0.6];
      id v10 = +[UIColor colorWithRed:0.921568627 green:0.921568627 blue:0.960784314 alpha:0.6];
      id v11 = v9;
      BOOL v12 = CGColorEqualToColor(v8, (CGColorRef)[v11 CGColor]);
      uint64_t v13 = v10;
      if (v12
        || (BOOL v14 = CGColorEqualToColor(v8, (CGColorRef)[v10 CGColor]),
            uint64_t v13 = v11,
            v14))
      {
        id v6 = v13;
      }
      else
      {
        id v6 = 0;
      }
    }
  }

  return v6;
}

- (id)CGImgForUIActivityTitles:(id)a3 foregroundColor:(id)a4 processOppositeColor:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = sharingXPCHelperLog();
  id v11 = v10;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "CGImgDataForUIActivityTitle", "", buf, 2u);
  }

  uint64_t v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", "-[SDXPCHelperConnection CGImgForUIActivityTitles:foregroundColor:processOppositeColor:]");
  [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1001D9CA8;
  v32[3] = &unk_1008CFB40;
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id v33 = v14;
  [v9 enumerateObjectsUsingBlock:v32];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001D9D20;
  v28[3] = &unk_1008D0358;
  BOOL v31 = a5;
  v28[4] = self;
  id v15 = v13;
  id v29 = v15;
  id v30 = v8;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1001D9E9C;
  v25[3] = &unk_1008D03E8;
  v25[4] = self;
  id v16 = v30;
  id v26 = v16;
  BOOL v27 = a5;
  unint64_t v17 = [(SDXPCHelperConnection *)self loadBatchImageCacheData:v14 cacheKey:v28 mapCacheHitImage:&stru_1008D0378 runProxy:v25 type:@"activityTitles"];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001DA2AC;
  v23[3] = &unk_1008D03C0;
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  id v24 = v18;
  [v17 enumerateObjectsUsingBlock:v23];
  uint64_t v19 = sharingXPCHelperLog();
  v20 = v19;
  os_signpost_id_t v21 = self->_intervalID;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, v21, "CGImgDataForUIActivityTitle", "", buf, 2u);
  }

  return v18;
}

- (CGImage)CGImageWithCacheKey:(id)a3 contactIDs:(id)a4 type:(id)a5
{
  id v8 = a5;
  id v9 = +[SDXPCHelperImageCache imageForKey:a3 contactIDs:a4];
  if (v9) {
    CFStringRef v10 = @"CacheHits";
  }
  else {
    CFStringRef v10 = @"CacheMisses";
  }
  id v11 = [v8 stringByAppendingString:v10];

  p_cacheAccessLock = &self->_cacheAccessLock;
  os_unfair_lock_lock(&self->_cacheAccessLock);
  cacheAccessDict = self->_cacheAccessDict;
  ++self->_cacheAccessCount;
  id v14 = [(NSMutableDictionary *)cacheAccessDict objectForKeyedSubscript:v11];
  id v15 = self->_cacheAccessDict;
  id v16 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v14 intValue] + 1);
  [(NSMutableDictionary *)v15 setObject:v16 forKey:v11];

  os_unfair_lock_unlock(p_cacheAccessLock);
  return v9;
}

- (id)MD5HashOfStrings:(id)a3
{
  id v3 = a3;
  int8x16_t v20 = 0uLL;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    int8x16_t v13 = v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = (const char *)[*(id *)(*((void *)&v14 + 1) + 8 * i) UTF8String];
        memset(md, 0, sizeof(md));
        CC_LONG v9 = strlen(v8);
        CC_MD5(v8, v9, md);
        int8x16_t v13 = veorq_s8(v13, *(int8x16_t *)md);
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v5);
    int8x16_t v20 = v13;
  }
  id v10 = [objc_alloc((Class)NSMutableString) initWithCapacity:32];
  for (uint64_t j = 0; j != 16; ++j)
    [v10 appendFormat:@"%02x", v20.u8[j]];

  return v10;
}

- (void)sendShareSheetInvocationMetricsWithAppBundleID:(id)a3 numSuggestions:(int64_t)a4 suggestionDisplayNames:(id)a5 extensionsCacheResult:(id)a6 isDarkMode:(BOOL)a7 duration:(int64_t)a8 isCollaborative:(BOOL)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  if (self->_cacheAccessCount >= 1)
  {
    id v18 = dispatch_get_global_queue(-32768, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001DA718;
    block[3] = &unk_1008D0410;
    block[4] = self;
    id v20 = v16;
    id v21 = v17;
    id v22 = v15;
    int64_t v23 = a4;
    int64_t v24 = a8;
    BOOL v25 = a7;
    BOOL v26 = a9;
    dispatch_async(v18, block);
  }
}

- (CGImage)CGImgForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7 processOppositeColor:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v37 = a4;
  id v15 = v14;
  if (v15)
  {
    id v16 = sharingXPCHelperLog();
    id v17 = v16;
    os_signpost_id_t intervalID = self->_intervalID;
    if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = intervalID;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "CGImgForNameLabelWithStringDaemon", "%llu", (uint8_t *)&buf, 0xCu);
    }

    if (v8) {
      [(SDXPCHelperConnection *)self keyDerivedFromRelevantTraitCollectionProperties];
    }
    else {
    uint64_t v19 = [(SDXPCHelperConnection *)self keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle];
    }
    id v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDXPCHelperConnection CGImgForNameLabelWithString:textColor:maxNumberOfLines:isAirDrop:ignoreNameWrapping:processOppositeColor:]");
    id v22 = +[SDXPCHelperConnection identifierForColor:v37];
    int64_t v23 = [v21 stringByAppendingFormat:@",%@,%@,%lu,%i,%i,%@,", v15, v22, a5, v10, v9, v19];

    int64_t v24 = [(SDXPCHelperConnection *)self CGImageWithCacheKey:v23 contactIDs:&__NSArray0__struct type:@"nameLabel"];
    if (v24)
    {
      BOOL v25 = sharingXPCHelperLog();
      BOOL v26 = v25;
      os_signpost_id_t v27 = self->_intervalID;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v27;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v27, "CGImgForNameLabelWithStringDaemon", "%llu", (uint8_t *)&buf, 0xCu);
      }

      if (v8) {
        id v20 = v24;
      }
      else {
        id v20 = 0;
      }
    }
    else
    {
      [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v48 = 0x3032000000;
      v49 = sub_1001D7B10;
      v50 = sub_1001D7B20;
      id v51 = 0;
      os_signpost_id_t v28 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D0430];
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1001DADA4;
      v44[3] = &unk_1008D0458;
      v44[4] = &buf;
      [v28 CGImgDataForNameLabelWithString:v15 textColor:v37 maxNumberOfLines:a5 isAirDrop:v10 ignoreNameWrapping:v9 replyHandler:v44];

      +[SDXPCHelperConnection updateCacheFromSFCGImageData:*(void *)(*((void *)&buf + 1) + 40) cacheKey:v23 contactIDs:&__NSArray0__struct];
      if (v8)
      {
        id v29 = self;
        id v30 = [(SDXPCHelperConnection *)v29 queuedBlocks];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_1001DADB4;
        v38[3] = &unk_1008D0480;
        v38[4] = v29;
        id v39 = v37;
        id v40 = v15;
        unint64_t v41 = a5;
        BOOL v42 = v10;
        BOOL v43 = v9;
        BOOL v31 = objc_retainBlock(v38);
        [v30 addObject:v31];
      }
      BOOL v32 = sharingXPCHelperLog();
      id v33 = v32;
      os_signpost_id_t v34 = self->_intervalID;
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_DWORD *)v45 = 134217984;
        os_signpost_id_t v46 = v34;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_END, v34, "CGImgForNameLabelWithString", "%llu", v45, 0xCu);
      }

      if (*(void *)(*((void *)&buf + 1) + 40))
      {
        v35 = (const void *)SFCreateCGImageFromData();
        id v20 = (CGImage *)CFAutorelease(v35);
      }
      else
      {
        id v20 = 0;
      }
      _Block_object_dispose(&buf, 8);
    }
  }
  else
  {
    uint64_t v19 = daemon_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_1001DD2B0();
    }
    id v20 = 0;
  }

  return v20;
}

- (id)CGImgDataForActivityMoreListEntryForActivityTitle:(id)a3 labelColor:(id)a4 processOppositeColor:(BOOL)a5 activityCategory:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = sharingXPCHelperLog();
  int8x16_t v13 = v12;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "CGImgDataForActivityMoreListEntryForActivityTitle", "", buf, 2u);
  }

  if (v7) {
    [(SDXPCHelperConnection *)self keyDerivedFromRelevantTraitCollectionProperties];
  }
  else {
  id v15 = [(SDXPCHelperConnection *)self keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle];
  }
  id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDXPCHelperConnection CGImgDataForActivityMoreListEntryForActivityTitle:labelColor:processOppositeColor:activityCategory:]");
  id v17 = +[SDXPCHelperConnection identifierForColor:v11];
  id v18 = [v16 stringByAppendingFormat:@",%@,%@,%@,", v10, v17, v15];

  if ([(SDXPCHelperConnection *)self CGImageWithCacheKey:v18 contactIDs:&__NSArray0__struct type:@"activityTitle"])
  {
    if (v7)
    {
      SFDataFromCGImage();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v19 = 0;
    }
  }
  else
  {
    [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
    *(void *)long long buf = 0;
    v35 = buf;
    uint64_t v36 = 0x3032000000;
    id v37 = sub_1001D7B10;
    id v38 = sub_1001D7B20;
    id v39 = 0;
    id v20 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D04A0];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1001DB2B0;
    v33[3] = &unk_1008D0458;
    v33[4] = buf;
    [v20 CGImgDataForActivityMoreListEntryForActivityTitle:v10 labelColor:v11 activityCategory:a6 replyHandler:v33];

    +[SDXPCHelperConnection updateCacheFromSFCGImageData:*((void *)v35 + 5) cacheKey:v18 contactIDs:&__NSArray0__struct];
    if (v7)
    {
      id v21 = self;
      id v22 = [(SDXPCHelperConnection *)v21 queuedBlocks];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1001DB2C0;
      v29[3] = &unk_1008CC9D8;
      v29[4] = v21;
      id v30 = v11;
      id v31 = v10;
      int64_t v32 = a6;
      int64_t v23 = objc_retainBlock(v29);
      [v22 addObject:v23];
    }
    int64_t v24 = sharingXPCHelperLog();
    BOOL v25 = v24;
    os_signpost_id_t v26 = self->_intervalID;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)os_signpost_id_t v28 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, v26, "CGImgDataForActivityMoreListEntryForActivityTitle", "", v28, 2u);
    }

    id v19 = *((id *)v35 + 5);
    _Block_object_dispose(buf, 8);
  }

  return v19;
}

- (CGImage)CGImgForActionPlatterWithTitle:(id)a3 tintColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = sharingXPCHelperLog();
  BOOL v9 = v8;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "CGImgForActionPlatterWithTitle", "", buf, 2u);
  }

  id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDXPCHelperConnection CGImgForActionPlatterWithTitle:tintColor:]");
  BOOL v12 = +[SDXPCHelperConnection identifierForColor:v7];
  int8x16_t v13 = [(SDXPCHelperConnection *)self keyDerivedFromRelevantTraitCollectionProperties];
  id v14 = [v11 stringByAppendingFormat:@",%@,%@,%@,", v6, v12, v13];

  id v15 = [(SDXPCHelperConnection *)self CGImageWithCacheKey:v14 contactIDs:&__NSArray0__struct type:@"actionPlatter"];
  if (!v15)
  {
    [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
    *(void *)long long buf = 0;
    BOOL v25 = buf;
    uint64_t v26 = 0x3032000000;
    os_signpost_id_t v27 = sub_1001D7B10;
    os_signpost_id_t v28 = sub_1001D7B20;
    id v29 = 0;
    id v16 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D04C0];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001DB6D8;
    v23[3] = &unk_1008D0458;
    void v23[4] = buf;
    [v16 CGImgDataForActionPlatterWithTitle:v6 tintColor:v7 replyHandler:v23];

    +[SDXPCHelperConnection updateCacheFromSFCGImageData:*((void *)v25 + 5) cacheKey:v14 contactIDs:&__NSArray0__struct];
    id v17 = sharingXPCHelperLog();
    id v18 = v17;
    os_signpost_id_t v19 = self->_intervalID;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)id v22 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v19, "CGImgForActionPlatterWithTitle", "", v22, 2u);
    }

    if (*((void *)v25 + 5))
    {
      id v20 = (const void *)SFCreateCGImageFromData();
      id v15 = (CGImage *)CFAutorelease(v20);
    }
    else
    {
      id v15 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  return v15;
}

- (CGImage)CGImgForNearbyBadgeWithCount:(int64_t)a3
{
  id v5 = sharingXPCHelperLog();
  id v6 = v5;
  os_signpost_id_t intervalID = self->_intervalID;
  if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "CGImgForNearbyBadgeWithCount", "", buf, 2u);
  }

  BOOL v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SDXPCHelperConnection CGImgForNearbyBadgeWithCount:]");
  BOOL v9 = [(SDXPCHelperConnection *)self keyDerivedFromRelevantTraitCollectionProperties];
  id v10 = [v8 stringByAppendingFormat:@"%li,%@", a3, v9];

  id v11 = [(SDXPCHelperConnection *)self CGImageWithCacheKey:v10 contactIDs:&__NSArray0__struct type:@"nearbyBadge"];
  if (!v11)
  {
    [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
    *(void *)long long buf = 0;
    id v21 = buf;
    uint64_t v22 = 0x3032000000;
    int64_t v23 = sub_1001D7B10;
    int64_t v24 = sub_1001D7B20;
    id v25 = 0;
    BOOL v12 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D04E0];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001DB9D8;
    v19[3] = &unk_1008D0458;
    v19[4] = buf;
    [v12 CGImgDataForNearbyBadgeWithCount:a3 replyHandler:v19];

    +[SDXPCHelperConnection updateCacheFromSFCGImageData:*((void *)v21 + 5) cacheKey:v10 contactIDs:&__NSArray0__struct];
    int8x16_t v13 = sharingXPCHelperLog();
    id v14 = v13;
    os_signpost_id_t v15 = self->_intervalID;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)id v18 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v15, "CGImgForNearbyBadgeWithCount", "", v18, 2u);
    }

    if (*((void *)v21 + 5))
    {
      id v16 = (const void *)SFCreateCGImageFromData();
      id v11 = (CGImage *)CFAutorelease(v16);
    }
    else
    {
      id v11 = 0;
    }
    _Block_object_dispose(buf, 8);
  }
  return v11;
}

- (id)loadBatchImageCacheData:(id)a3 cacheKey:(id)a4 mapCacheHitImage:(id)a5 runProxy:(id)a6 type:(id)a7
{
  id v11 = a3;
  BOOL v12 = (void (**)(id, void *))a4;
  unint64_t v41 = (void (**)(id, void *, CGImage *))a5;
  id v38 = (void (**)(id, void *))a6;
  id v43 = a7;
  id v39 = +[NSMutableArray array];
  id v44 = +[NSMutableArray array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = v11;
  id v13 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v50;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        id v18 = v12[2](v12, v17);
        [v17 setCacheLookupKey:v18];

        os_signpost_id_t v19 = [v17 cacheLookupKey];
        id v20 = [v17 contactIDs];
        id v21 = [(SDXPCHelperConnection *)self CGImageWithCacheKey:v19 contactIDs:v20 type:v43];

        if (v21)
        {
          uint64_t v22 = v41[2](v41, v17, v21);
          [v44 addObject:v22];
        }
        else
        {
          [v39 addObject:v17];
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v14);
  }

  if ([v39 count])
  {
    [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
    v38[2](v38, v39);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    int64_t v23 = v48 = 0u;
    id v24 = [v23 countByEnumeratingWithState:&v45 objects:v59 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v25; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v46 != v26) {
            objc_enumerationMutation(v23);
          }
          os_signpost_id_t v28 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
          id v29 = [v28 imageData];

          if (v29)
          {
            id v30 = [v28 imageData];
            id v31 = [v28 cacheLookupKey];
            int64_t v32 = [v28 contactIDs];
            +[SDXPCHelperConnection updateCacheFromSFCGImageData:v30 cacheKey:v31 contactIDs:v32];
          }
          [v44 addObject:v28];
        }
        id v25 = [v23 countByEnumeratingWithState:&v45 objects:v59 count:16];
      }
      while (v25);
    }
  }
  id v33 = sharingXPCHelperLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = [obj count];
    id v35 = [v39 count];
    id v36 = [v44 count];
    *(_DWORD *)long long buf = 134218496;
    id v54 = v34;
    __int16 v55 = 2048;
    id v56 = v35;
    __int16 v57 = 2048;
    id v58 = v36;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Need image data for %lu images, %lu are not in cache, return %lu image data.", buf, 0x20u);
  }

  return v44;
}

+ (id)identifierForColor:(id)a3
{
  id v4 = a3;
  if (a3)
  {
    uint64_t v8 = 0;
    var8[0] = 0;
    uint64_t v7 = 0;
    uint64_t v6 = 0;
    [a3 getRed:var8 green:&v8 blue:&v7 alpha:&v6];
    id v4 = +[NSString stringWithFormat:@"(UIColor %.1f,%.1f,%.1f,%.1f)", var8[0], v8, v7, v6];
    uint64_t v3 = var8[2];
  }
  return v4;
}

- (id)keyDerivedFromRelevantTraitCollectionProperties
{
  v2 = self->_latestHostConfig;
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [(UISUIActivityViewControllerConfiguration *)v2 hostTraitCollection];
    id v5 = [v4 userInterfaceStyle];
    uint64_t v6 = [(UISUIActivityViewControllerConfiguration *)v3 hostTraitCollection];
    uint64_t v7 = [v6 preferredContentSizeCategory];
    uint64_t v8 = [(UISUIActivityViewControllerConfiguration *)v3 hostTraitCollection];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @",%li,%@,%li,", v5, v7, [v8 layoutDirection]);
    BOOL v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = sharingXPCHelperLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1001DCFB4();
    }

    BOOL v9 = @"NULL";
  }

  return v9;
}

- (id)keyDerivedFromRelevantTraitCollectionPropertiesWithOppositeUserInterfaceStyle
{
  v2 = self->_latestHostConfig;
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [(UISUIActivityViewControllerConfiguration *)v2 hostTraitCollection];
    if ([v4 userInterfaceStyle] == (id)1) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }

    uint64_t v6 = [(UISUIActivityViewControllerConfiguration *)v3 hostTraitCollection];
    uint64_t v7 = [v6 preferredContentSizeCategory];
    uint64_t v8 = [(UISUIActivityViewControllerConfiguration *)v3 hostTraitCollection];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @",%li,%@,%li,", v5, v7, [v8 layoutDirection]);
    BOOL v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = sharingXPCHelperLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1001DCFB4();
    }

    BOOL v9 = @"NULL";
  }

  return v9;
}

- (id)perspectiveDataForUIActivityTitle:(id)a3 textColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1001D7B10;
  id v16 = sub_1001D7B20;
  id v17 = 0;
  uint64_t v8 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D0500];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001DC244;
  v11[3] = &unk_1008D0528;
  v11[4] = &v12;
  [v8 perspectiveDataForUIActivityTitle:v6 textColor:v7 replyHandler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)perspectiveDataForNameLabelWithString:(id)a3 textColor:(id)a4 maxNumberOfLines:(unint64_t)a5 isAirDrop:(BOOL)a6 ignoreNameWrapping:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
  uint64_t v18 = 0;
  os_signpost_id_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_1001D7B10;
  uint64_t v22 = sub_1001D7B20;
  id v23 = 0;
  uint64_t v14 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D0548];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001DC424;
  v17[3] = &unk_1008D0528;
  v17[4] = &v18;
  [v14 perspectiveDataForNameLabelWithString:v12 textColor:v13 maxNumberOfLines:a5 isAirDrop:v8 ignoreNameWrapping:v7 replyHandler:v17];

  id v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v15;
}

- (id)perspectiveDataForActionPlatterWithTitle:(id)a3 tintColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1001D7B10;
  id v16 = sub_1001D7B20;
  id v17 = 0;
  BOOL v8 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D0568];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001DC5DC;
  v11[3] = &unk_1008D0528;
  v11[4] = &v12;
  [v8 perspectiveDataForActionPlatterWithTitle:v6 tintColor:v7 replyHandler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)perspectiveDataForActivityMoreListEntryForActivityTitle:(id)a3 labelColor:(id)a4 activityCategory:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_1001D7B10;
  uint64_t v18 = sub_1001D7B20;
  id v19 = 0;
  id v10 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D0588];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001DC7A4;
  v13[3] = &unk_1008D0528;
  void v13[4] = &v14;
  [v10 perspectiveDataForActivityMoreListEntryForActivityTitle:v8 labelColor:v9 activityCategory:a5 replyHandler:v13];

  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (id)perspectiveDataForNearbyBadgeWithCount:(int64_t)a3
{
  [(SDXPCHelperConnection *)self _updateShareSheetHostConfiguration];
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_1001D7B10;
  id v13 = sub_1001D7B20;
  id v14 = 0;
  uint64_t v5 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D05A8];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001DC93C;
  v8[3] = &unk_1008D0528;
  v8[4] = &v9;
  [v5 perspectiveDataForNearbyBadgeWithCount:a3 replyHandler:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)updateShareSheetHostConfiguration:(id)a3
{
}

- (void)_updateShareSheetHostConfiguration
{
  uint64_t v3 = self->_latestHostConfig;
  if (v3)
  {
    id v4 = sharingXPCHelperLog();
    uint64_t v5 = v4;
    os_signpost_id_t intervalID = self->_intervalID;
    if (intervalID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, intervalID, "updateShareSheetHostConfiguration", "", buf, 2u);
    }

    id v7 = [(NSXPCConnection *)self->_connectionToService synchronousRemoteObjectProxyWithErrorHandler:&stru_1008D05C8];
    [v7 updateShareSheetHostConfiguration:v3];

    id v8 = sharingXPCHelperLog();
    uint64_t v9 = v8;
    os_signpost_id_t v10 = self->_intervalID;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "updateShareSheetHostConfiguration", "", v11, 2u);
    }
  }
  else
  {
    uint64_t v9 = daemon_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1001DD6F8();
    }
  }
}

- (void)setSessionKeepAliveTransactionIdentifier:(id)a3
{
  id v4 = a3;
  self->_needsTransactionRelease = v4 != 0;
  id v8 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[NSNull null];
  }
  id v6 = v5;
  id v7 = [(NSXPCConnection *)self->_connectionToService remoteObjectProxyWithErrorHandler:&stru_1008D05E8];
  [v7 setSessionKeepAliveTransactionIdentifier:v6];
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSMutableArray)queuedBlocks
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setQueuedBlocks:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_queuedBlocks, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_latestHostConfig, 0);
  objc_storeStrong((id *)&self->_cacheAccessDict, 0);
  objc_storeStrong((id *)&self->_signpostName, 0);
  objc_storeStrong((id *)&self->_connectionToService, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end