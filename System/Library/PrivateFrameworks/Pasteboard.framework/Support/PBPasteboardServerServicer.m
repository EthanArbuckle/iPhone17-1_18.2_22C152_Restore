@interface PBPasteboardServerServicer
+ (id)newServicerForConnection:(id)a3 detectiveAgency:(id)a4 pasteButtonSlotMachine:(id)a5 pasteAuthority:(id)a6 pasteNotifier:(id)a7;
- (NSMutableDictionary)activeAnnouncers;
- (NSMutableDictionary)authorizationReplyBlocks;
- (NSUUID)dataOwnerCollectionUUID;
- (NSXPCConnection)clientToServerConnection;
- (NSXPCConnection)serverToClientConnection;
- (PBDataDetectiveAgency)detectiveAgency;
- (PBPasteAuthority)pasteAuthority;
- (PBPasteNotifying)pasteNotifier;
- (PBPasteboardServerServicer)initWithConnection:(id)a3 detectiveAgency:(id)a4 pasteButtonSlotMachine:(id)a5 pasteAuthority:(id)a6 pasteNotifier:(id)a7;
- (UISSlotMachine)pasteButtonSlotMachine;
- (id)hangAssertionForAuditTokenInfo:(id)a3;
- (id)pasteAnnoucementForPasteboard:(id)a3 auditTokenInfo:(id)a4 loadContext:(id)a5 timeout:(double)a6;
- (void)_pasteboardWithName:(id)a3 localOnly:(BOOL)a4 createIfNeeded:(BOOL)a5 deviceIsLocked:(BOOL)a6 completionBlock:(id)a7;
- (void)announcePasteDenied;
- (void)announcePasteForPasteboard:(id)a3 auditTokenInfo:(id)a4;
- (void)connectionWasInvalidated;
- (void)deletePersistentPasteboardWithName:(id)a3 completionBlock:(id)a4;
- (void)didInvalidateItemCollectionWithUUID:(id)a3;
- (void)didPasteContentsFromPasteboardWithName:(id)a3 UUID:(id)a4 completionBlock:(id)a5;
- (void)getAllPasteboardsCompletionBlock:(id)a3;
- (void)getRemoteContentForLayerContextWithId:(unint64_t)a3 slotStyle:(id)a4 pasteButtonTag:(id)a5 completionBlock:(id)a6;
- (void)helloCompletionBlock:(id)a3;
- (void)invalidateActiveAnnouncers;
- (void)localGeneralPasteboardCompletionBlock:(id)a3;
- (void)pasteboardWithName:(id)a3 createIfNeeded:(BOOL)a4 completionBlock:(id)a5;
- (void)performJanitorialTasksCompletionBlock:(id)a3;
- (void)removeActiveAuthorizationAnnouncer:(id)a3 collection:(id)a4;
- (void)requestFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 needData:(BOOL)a7 dataOwner:(int64_t)a8 loadContext:(id)a9 errorBlock:(id)a10 pasteboardItemBlock:(id)a11;
- (void)requestItemFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 typeIdentifier:(id)a7 dataOwner:(int64_t)a8 loadContext:(id)a9 completionBlock:(id)a10;
- (void)requestPatternDetectionsFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 patterns:(id)a7 needValues:(BOOL)a8 dataOwner:(int64_t)a9 completionBlock:(id)a10;
- (void)requestSecurePasteAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 completionBlock:(id)a5;
- (void)requestUserAuthorizationForPasteboard:(id)a3 auditTokenInfo:(id)a4 loadContext:(id)a5 completionHandler:(id)a6;
- (void)savePasteboard:(id)a3 dataProviderEndpoint:(id)a4 completionBlock:(id)a5;
- (void)setActiveAuthorizationAnnouncer:(id)a3 collection:(id)a4;
- (void)setClientToServerConnection:(id)a3;
- (void)setDataOwnerCollectionUUID:(id)a3;
- (void)setDetectiveAgency:(id)a3;
- (void)setPasteAuthority:(id)a3;
- (void)setPasteButtonSlotMachine:(id)a3;
- (void)setPasteNotifier:(id)a3;
- (void)setServerToClientConnection:(id)a3;
@end

@implementation PBPasteboardServerServicer

+ (id)newServicerForConnection:(id)a3 detectiveAgency:(id)a4 pasteButtonSlotMachine:(id)a5 pasteAuthority:(id)a6 pasteNotifier:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[PBPasteboardServerServicer alloc] initWithConnection:v15 detectiveAgency:v14 pasteButtonSlotMachine:v13 pasteAuthority:v12 pasteNotifier:v11];

  return v16;
}

- (PBPasteboardServerServicer)initWithConnection:(id)a3 detectiveAgency:(id)a4 pasteButtonSlotMachine:(id)a5 pasteAuthority:(id)a6 pasteNotifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)PBPasteboardServerServicer;
  v17 = [(PBPasteboardServerServicer *)&v31 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_clientToServerConnection, v12);
    [v12 setExportedObject:v18];
    PBNewClientToServerXPCInterface();
    id v28 = v15;
    id v19 = v14;
    v21 = id v20 = v13;
    [v12 setExportedInterface:v21];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000AFE4;
    v29[3] = &unk_100030D58;
    v22 = v18;
    v30 = v22;
    [v12 setInvalidationHandler:v29];
    objc_storeStrong((id *)&v22->_detectiveAgency, a4);
    objc_storeStrong((id *)&v22->_pasteButtonSlotMachine, a5);
    objc_storeStrong((id *)&v22->_pasteAuthority, a6);
    objc_storeStrong((id *)&v22->_pasteNotifier, a7);
    uint64_t v23 = +[NSMutableDictionary dictionary];
    activeAnnouncers = v22->_activeAnnouncers;
    v22->_activeAnnouncers = (NSMutableDictionary *)v23;

    uint64_t v25 = +[NSMutableDictionary dictionary];
    authorizationReplyBlocks = v22->_authorizationReplyBlocks;
    v22->_authorizationReplyBlocks = (NSMutableDictionary *)v25;
    id v13 = v20;
    id v14 = v19;
    id v15 = v28;
  }
  return v18;
}

- (void)connectionWasInvalidated
{
}

- (void)helloCompletionBlock:(id)a3
{
}

- (void)_pasteboardWithName:(id)a3 localOnly:(BOOL)a4 createIfNeeded:(BOOL)a5 deviceIsLocked:(BOOL)a6 completionBlock:(id)a7
{
  BOOL v42 = a6;
  BOOL v43 = a4;
  BOOL v8 = a5;
  id v10 = a3;
  id v11 = a7;
  id v12 = _PBLog();
  os_signpost_id_t v13 = os_signpost_id_generate(v12);

  id v14 = _PBLog();
  id v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PasteboardWithName", "", buf, 2u);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  id v16 = [(PBPasteboardServerServicer *)self clientToServerConnection];
  v17 = v16;
  if (v16)
  {
    [v16 auditToken];
  }
  else
  {
    long long v59 = 0u;
    long long v60 = 0u;
  }

  *(_OWORD *)buf = v59;
  *(_OWORD *)&buf[16] = v60;
  v18 = sub_100011628((uint64_t)buf);
  id v19 = _PBLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = [v18 bundleID];
    v21 = [v18 teamID];
    unsigned int v22 = [v18 pid];
    *(_DWORD *)buf = 138413058;
    *(void *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v22;
    *(_WORD *)&buf[28] = 2112;
    *(void *)&buf[30] = v10;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "BundleID %@ from team %@ (pid %d) is requesting pasteboard %@", buf, 0x26u);
  }
  if (v43)
  {
    uint64_t v23 = _PBLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = [v18 bundleID];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Requesting local only pasteboard for %@", buf, 0xCu);
    }
  }
  v58[2] = 0;
  int v25 = PBIsPasteboardNameAllowed();
  id v26 = 0;
  if (v25)
  {
    if (v42)
    {
      if (([v10 isEqualToString:PBGeneralPasteboardName] & 1) == 0)
      {
        v36 = _PBLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v10;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Access to pasteboard named %@ is not allowed while the device is locked.", buf, 0xCu);
        }

        if (v11)
        {
          v53 = _NSConcreteStackBlock;
          uint64_t v54 = 3221225472;
          v55 = sub_10000B684;
          v56 = &unk_1000311E0;
          v29 = (id *)v58;
          v58[0] = v11;
          v30 = &v57;
          id v57 = v10;
          v58[1] = v13;
          goto LABEL_34;
        }
        goto LABEL_36;
      }
      if (sub_100011D3C(v10, v18, 0))
      {
        v27 = _PBLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Client will receive device-locked general pasteboard.", buf, 2u);
        }

        goto LABEL_25;
      }
    }
    else if (sub_100011D3C(v10, v18, 0))
    {
LABEL_25:
      v41 = +[PBPasteboardModel sharedModel];
      v40 = [v18 bundleID];
      v39 = [v18 teamID];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10000B744;
      v48[3] = &unk_100031208;
      v29 = &v49;
      BOOL v38 = v8;
      id v31 = v26;
      os_signpost_id_t v32 = v13;
      id v33 = v18;
      id v49 = v33;
      v30 = &v50;
      id v34 = v10;
      id v50 = v34;
      id v51 = v11;
      os_signpost_id_t v52 = v32;
      id v26 = v31;
      LOBYTE(v37) = v42;
      [v41 getPasteboardNamed:v34 bundleID:v40 teamID:v39 createIfNeeded:v38 localOnly:v43 processInfo:v33 deviceIsLocked:v37 completionBlock:v48];

LABEL_35:
      goto LABEL_36;
    }
    v35 = _PBLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "...client not allowed to request pasteboard %@. Error: %@", buf, 0x16u);
    }

    if (v11)
    {
      v45[2] = _NSConcreteStackBlock;
      v45[3] = 3221225472;
      v45[4] = sub_10000B998;
      v45[5] = &unk_1000311E0;
      v29 = (id *)v47;
      v47[0] = v11;
      v30 = &v46;
      id v46 = v10;
      v47[1] = v13;
      goto LABEL_34;
    }
  }
  else
  {
    id v28 = _PBLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "...pasteboard name %@ is not allowed. Error: %@", buf, 0x16u);
    }

    if (v11)
    {
      v29 = (id *)v45;
      v45[0] = v11;
      v30 = &v44;
      id v44 = v26;
      v45[1] = v13;
LABEL_34:
      PBDispatchAsyncCallback();
      goto LABEL_35;
    }
  }
LABEL_36:
}

- (void)pasteboardWithName:(id)a3 createIfNeeded:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v13 = a3;
  uint64_t v9 = PBIsPasteboardNameGeneralPasteboard() | v5;
  int v10 = MKBGetDeviceLockState();
  BOOL v12 = v10 != 3 && v10 != 0;
  [(PBPasteboardServerServicer *)self _pasteboardWithName:v13 localOnly:0 createIfNeeded:v9 deviceIsLocked:v12 completionBlock:v8];
}

- (void)localGeneralPasteboardCompletionBlock:(id)a3
{
  uint64_t v4 = PBGeneralPasteboardName;
  id v8 = a3;
  int v5 = MKBGetDeviceLockState();
  BOOL v7 = v5 != 3 && v5 != 0;
  [(PBPasteboardServerServicer *)self _pasteboardWithName:v4 localOnly:1 createIfNeeded:1 deviceIsLocked:v7 completionBlock:v8];
}

- (void)savePasteboard:(id)a3 dataProviderEndpoint:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = MKBGetDeviceLockState();
  BOOL v13 = v11 != 3 && v11 != 0;
  if (!v11
    || v11 == 3
    || ([v8 name],
        id v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = PBIsPasteboardNameGeneralPasteboard(),
        v14,
        (v15 & 1) != 0))
  {
    id v16 = [v8 name];
    uint64_t v58 = 0;
    int v17 = PBIsPasteboardNameAllowed();
    id v18 = 0;

    if (v17)
    {
      memset(buf, 0, 32);
      id v19 = [(PBPasteboardServerServicer *)self clientToServerConnection];
      id v20 = v19;
      if (v19) {
        [v19 auditToken];
      }
      else {
        memset(buf, 0, 32);
      }

      *(_OWORD *)v65 = *(_OWORD *)buf;
      *(_OWORD *)&v65[16] = *(_OWORD *)&buf[16];
      v24 = sub_100011628((uint64_t)v65);
      int v25 = [v8 name];
      int v26 = sub_100011D3C(v25, v24, 0);

      if (v26)
      {
        [v8 setDataProviderEndpoint:v9];
        v27 = sub_100012AA0();
        [v8 setSaveBootSession:v27];

        [v8 setSaveTimestamp:mach_continuous_time()];
        id v28 = objc_opt_new();
        [v8 setSharingToken:v28];

        v29 = [v24 persistentIdentifier];
        [v8 setOriginatorPersistentID:v29];

        v30 = [v24 bundleID];
        [v8 setOriginatorBundleID:v30];

        id v31 = [v24 teamID];
        [v8 setOriginatorTeamID:v31];

        os_signpost_id_t v32 = [v24 localizedName];
        [v8 setOriginatorLocalizedName:v32];

        objc_msgSend(v8, "setOriginatorAllowedToCopyOnPaste:", objc_msgSend(v24, "isAllowedToCopyOnPaste"));
        id v33 = _PBLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          id v34 = [v24 bundleID];
          v35 = [v24 teamID];
          v36 = [v8 name];
          *(_DWORD *)v65 = 138412802;
          *(void *)&v65[4] = v34;
          *(_WORD *)&v65[12] = 2112;
          *(void *)&v65[14] = v35;
          *(_WORD *)&v65[22] = 2112;
          *(void *)&v65[24] = v36;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Bundle ID %@ from team %@ is saving pasteboard named %@", v65, 0x20u);
        }
        uint64_t v37 = +[MCProfileConnection sharedConnection];
        BOOL v38 = [v8 originatorBundleID];
        id v39 = objc_msgSend(v37, "dataOwnerForBundleID:requestedDataOwner:", v38, objc_msgSend(v8, "originatorDataOwner"));

        [v8 setOriginatorDataOwner:v39];
        if (([v37 isContinuityPasteboardWithManagedDataAllowed] & 1) == 0 && v39 == (id)2) {
          [v8 setLocalOnly:1];
        }
        v40 = [v8 name];
        int v41 = PBIsPasteboardNameGeneralPasteboard();

        if (v41)
        {
          _PBDefaultMaxGeneralPasteboardAgeForLockState();
          if (v42 > 0.0)
          {
            BOOL v43 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");
            id v44 = [v8 expirationDate];
            v45 = v44;
            if (!v44 || [v44 compare:v43] == (id)1)
            {
              [v8 setExpirationDate:v43];
              id v46 = _PBLog();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)v65 = 138412290;
                *(void *)&v65[4] = v43;
                _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Forcing pasteboard expiration date to %@", v65, 0xCu);
              }
            }
          }
        }
        v47 = +[PBPasteboardModel sharedModel];
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_10000C458;
        v55[3] = &unk_100031230;
        id v56 = v8;
        id v57 = v10;
        [v47 savePasteboard:v56 deviceIslocked:v13 completionBlock:v55];
      }
      else
      {
        v48 = _PBLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          os_signpost_id_t v52 = [v8 name];
          *(_DWORD *)v65 = 138412290;
          *(void *)&v65[4] = v52;
          _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "...client is not allowed to access pasteboard named %@", v65, 0xCu);
        }
        id v49 = [v8 name];
        id v50 = PBPasteboardNameInvalidError();

        if (!v10)
        {
          id v18 = v50;
          goto LABEL_43;
        }
        id v54 = v10;
        id v18 = v50;
        PBDispatchAsyncCallback();

        uint64_t v37 = v54;
      }

LABEL_43:
      goto LABEL_44;
    }
    v21 = _PBLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v51 = [v8 name];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "...pasteboard name %@ is not allowed. Error: %@", buf, 0x16u);
    }
    if (v10)
    {
      id v53 = v10;
      id v18 = v18;
      PBDispatchAsyncCallback();
    }
  }
  else
  {
    unsigned int v22 = _PBLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [v8 name];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Access to pasteboard named %@ is not allowed while the device is locked.", buf, 0xCu);
    }
    if (v10)
    {
      long long v59 = _NSConcreteStackBlock;
      uint64_t v60 = 3221225472;
      v61 = sub_10000C3E4;
      v62 = &unk_100030B10;
      id v64 = v10;
      id v63 = v8;
      PBDispatchAsyncCallback();
    }
    id v18 = 0;
  }
LABEL_44:
}

- (void)deletePersistentPasteboardWithName:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = [(PBPasteboardServerServicer *)self clientToServerConnection];
  id v9 = v8;
  if (v8)
  {
    [v8 auditToken];
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
  }

  *(_OWORD *)buf = v30;
  *(_OWORD *)&buf[16] = v31;
  id v10 = sub_100011628((uint64_t)buf);
  uint64_t v29 = 0;
  int v11 = PBIsPasteboardNameAllowed();
  id v12 = 0;
  BOOL v13 = _PBLog();
  id v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      char v15 = [v10 bundleID];
      id v16 = [v10 teamID];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Bundle ID %@ from team %@ is deleting persistent pasteboard named %@", buf, 0x20u);
    }
    int v17 = +[PBPasteboardModel sharedModel];
    id v18 = [v10 bundleID];
    id v19 = [v10 teamID];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000C924;
    v25[3] = &unk_100031258;
    id v20 = &v26;
    id v26 = v12;
    v21 = &v27;
    id v22 = v6;
    id v27 = v22;
    id v28 = v7;
    [v17 deletePasteboardNamed:v22 bundleID:v18 teamID:v19 completionBlock:v25];

    goto LABEL_12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "...pasteboard name %@ is not allowed. Error: %@", buf, 0x16u);
  }

  if (v7)
  {
    id v20 = &v24;
    id v24 = v7;
    v21 = &v23;
    id v23 = v12;
    PBDispatchAsyncCallback();
LABEL_12:
  }
}

- (void)announcePasteDenied
{
}

- (id)hangAssertionForAuditTokenInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", [v3 pid]);
  int v5 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.frontboard" name:@"DisableWatchdog"];
  id v6 = objc_alloc((Class)RBSAssertion);
  id v19 = v5;
  id v7 = +[NSArray arrayWithObjects:&v19 count:1];
  id v8 = [v6 initWithExplanation:@"Prevent watchdog termination while blocking on OOP authorization" target:v4 attributes:v7];

  id v14 = 0;
  unsigned __int8 v9 = [v8 acquireWithError:&v14];
  id v10 = v14;
  if ((v9 & 1) == 0)
  {
    int v11 = _PBLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = [v3 pid];
      *(_DWORD *)buf = 67109378;
      unsigned int v16 = v13;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to acquire watchog disable assertion for pid %d with error: %@", buf, 0x12u);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)announcePasteForPasteboard:(id)a3 auditTokenInfo:(id)a4
{
  id v5 = [(PBPasteboardServerServicer *)self pasteAnnoucementForPasteboard:a3 auditTokenInfo:a4 loadContext:0 timeout:0.0];
  [(PBPasteNotifying *)self->_pasteNotifier notifyPaste:v5];
}

- (void)requestUserAuthorizationForPasteboard:(id)a3 auditTokenInfo:(id)a4 loadContext:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = 0.0;
  if ([v12 isFromUIFramework] && objc_msgSend(v12, "isBlockingMainThread"))
  {
    char v15 = [(PBPasteboardServerServicer *)self hangAssertionForAuditTokenInfo:v11];
    if (v15) {
      double v14 = 0.0;
    }
    else {
      double v14 = PBAuthorizationTimeoutInterval;
    }
  }
  else
  {
    char v15 = 0;
  }
  id v27 = v11;
  id v26 = [(PBPasteboardServerServicer *)self pasteAnnoucementForPasteboard:v10 auditTokenInfo:v11 loadContext:v12 timeout:v14];
  unsigned int v16 = [v10 UUID];
  __int16 v17 = [(PBPasteboardServerServicer *)self activeAnnouncers];
  id v18 = [v17 objectForKeyedSubscript:v16];

  id v19 = [(PBPasteboardServerServicer *)self authorizationReplyBlocks];
  id v20 = [v19 objectForKeyedSubscript:v16];

  if (!v20)
  {
    id v20 = +[NSMutableArray array];
    v21 = [(PBPasteboardServerServicer *)self authorizationReplyBlocks];
    [v21 setObject:v20 forKeyedSubscript:v16];
  }
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10000D0A8;
  v38[3] = &unk_100031280;
  id v22 = v13;
  id v40 = v22;
  id v23 = v15;
  id v39 = v23;
  id v24 = objc_retainBlock(v38);
  int v25 = objc_retainBlock(v24);
  [v20 addObject:v25];

  if (!v18)
  {
    id v18 = [[PBCFUserNotificationPasteAnnouncer alloc] initWithAuditTokenInfo:v27];
    [(PBPasteboardServerServicer *)self setActiveAuthorizationAnnouncer:v18 collection:v10];
    objc_initWeak(&location, v10);
    objc_initWeak(&v36, v18);
    objc_initWeak(&from, self);
    [(PBPasteAuthority *)self->_pasteAuthority recordInteractivePasteAuthorizationPromptActivityForAuditTokenInfo:v27];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000D0EC;
    v28[3] = &unk_1000312A8;
    objc_copyWeak(&v32, &from);
    objc_copyWeak(&v33, &v36);
    objc_copyWeak(&v34, &location);
    id v29 = v27;
    id v30 = v20;
    id v31 = v16;
    [(PBCFUserNotificationPasteAnnouncer *)v18 requestAuthorizationForPaste:v26 replyHandler:v28];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
}

- (void)invalidateActiveAnnouncers
{
}

- (void)didInvalidateItemCollectionWithUUID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PBDispatchAsyncCallback();
}

- (void)setActiveAuthorizationAnnouncer:(id)a3 collection:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(PBPasteboardServerServicer *)self activeAnnouncers];
  id v8 = [v9 UUID];
  [v7 setObject:v6 forKey:v8];

  [v9 addInvalidationDelegate:self];
}

- (void)removeActiveAuthorizationAnnouncer:(id)a3 collection:(id)a4
{
  id v7 = a4;
  id v5 = [(PBPasteboardServerServicer *)self activeAnnouncers];
  id v6 = [v7 UUID];
  [v5 removeObjectForKey:v6];

  [v7 removeInvalidationDelegate:self];
}

- (id)pasteAnnoucementForPasteboard:(id)a3 auditTokenInfo:(id)a4 loadContext:(id)a5 timeout:(double)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 originatorPersistentID];
  if (v10
    && (id v11 = [objc_alloc((Class)LSBundleRecord) initWithPersistentIdentifier:v10]) != 0)
  {
    id v12 = v11;
    uint64_t v13 = [v11 localizedName];
  }
  else
  {
    double v14 = [v8 originatorBundleID];
    id v12 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v14 allowPlaceholder:0 error:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v15 = [v12 teamIdentifier];
      unsigned int v16 = [v8 originatorTeamID];
      unsigned int v17 = [v15 isEqualToString:v16];

      if (v17)
      {
        id v18 = +[NSLocale preferredLanguages];
        id v19 = [v12 localizedNameWithPreferredLocalizations:v18];

        uint64_t v20 = [v12 persistentIdentifier];

        id v10 = (void *)v20;
        goto LABEL_9;
      }
    }
    uint64_t v13 = [v8 originatorLocalizedName];
  }
  id v19 = (void *)v13;
LABEL_9:
  if ([v8 isOrWasRemote])
  {
    id v21 = objc_alloc((Class)DRPasteAnnouncementContinuityEndpoint);
    id v22 = [v8 remoteDeviceName];
    id v23 = [v21 initWithDeviceName:v22];
  }
  else
  {
    id v24 = [v12 bundleIdentifier];
    unsigned int v25 = [v24 isEqualToString:@"com.apple.springboard"];

    if (v25)
    {
      id v26 = +[DRPasteAnnouncementApplicationEndpoint homeScreenEndpoint];
    }
    else
    {
      id v26 = [objc_alloc((Class)DRPasteAnnouncementApplicationEndpoint) initWithLocalizedName:v19 persistentIdentifier:v10];
    }
    id v23 = v26;
  }
  id v27 = [v9 bundleID];
  unsigned int v28 = [v27 isEqualToString:@"com.apple.springboard"];

  if (v28)
  {
    id v29 = +[DRPasteAnnouncementApplicationEndpoint homeScreenEndpoint];
  }
  else
  {
    id v30 = objc_alloc((Class)DRPasteAnnouncementApplicationEndpoint);
    id v31 = [v9 localizedName];
    id v32 = [v9 persistentIdentifier];
    id v29 = [v30 initWithLocalizedName:v31 persistentIdentifier:v32];
  }
  id v33 = objc_alloc((Class)DRPasteAnnouncement);
  id v34 = [v8 UUID];
  id v35 = [v33 initWithSource:v23 destination:v29 pasteboardUUID:v34 timeout:a6];

  return v35;
}

- (void)requestFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 needData:(BOOL)a7 dataOwner:(int64_t)a8 loadContext:(id)a9 errorBlock:(id)a10 pasteboardItemBlock:(id)a11
{
  BOOL v12 = a7;
  id v15 = a3;
  id v16 = a4;
  id v51 = a5;
  id v17 = a9;
  id v18 = a10;
  id v52 = a11;
  int v19 = MKBGetDeviceLockState();
  uint64_t v86 = 0;
  char v20 = PBIsPasteboardNameAllowed();
  id v21 = 0;
  if (v20)
  {
    if (!v19 || v19 == 3 || (PBIsPasteboardNameGeneralPasteboard() & 1) != 0)
    {
      long long v72 = 0u;
      long long v73 = 0u;
      id v22 = [(PBPasteboardServerServicer *)self clientToServerConnection];
      id v23 = v22;
      v47 = v16;
      if (v22)
      {
        [v22 auditToken];
      }
      else
      {
        long long v72 = 0u;
        long long v73 = 0u;
      }

      *(_OWORD *)buf = v72;
      *(_OWORD *)&buf[16] = v73;
      id v27 = sub_100011628((uint64_t)buf);
      char v71 = 0;
      unsigned int v28 = _PBLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = [v27 bundleID];
        [v27 teamID];
        int64_t v30 = a8;
        id v31 = v21;
        v33 = id v32 = v17;
        *(_DWORD *)buf = 138413314;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = a6;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v15;
        __int16 v88 = 2112;
        v89 = v47;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Bundle ID %@ from team %@ is requesting item %u from pasteboard named %@ with UUID %@", buf, 0x30u);

        id v17 = v32;
        id v21 = v31;
        a8 = v30;
      }
      if (sub_100011D3C(v15, v27, &v71))
      {
        int64_t v44 = a8;
        v45 = v17;
        BOOL v34 = v12;
        if (v12
          && PBPreferencesBoolValue()
          && [v15 isEqualToString:PBGeneralPasteboardName]
          && v71)
        {
          id v35 = sub_10001042C();
          dispatch_sync(v35, &stru_100031330);
        }
        id v36 = [v27 bundleID];
        uint64_t v37 = [v27 teamID];
        uint64_t v46 = PBPasteboardPersistenceName();

        BOOL v38 = self->_pasteAuthority;
        id v39 = +[PBPasteboardModel sharedModel];
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_10000E0D0;
        v53[3] = &unk_100031410;
        id v60 = v18;
        id v54 = v47;
        unint64_t v62 = a6;
        id v61 = v52;
        BOOL v64 = v34;
        id v55 = v27;
        id v56 = v38;
        unsigned int v25 = v51;
        id v57 = v51;
        id v17 = v45;
        int64_t v63 = v44;
        id v58 = v45;
        long long v59 = self;
        id v50 = v38;
        id v40 = (void *)v46;
        [v39 getExistingPasteboardWithPersistenceName:v46 name:v15 UUID:v54 processInfo:v55 completionBlock:v53];
      }
      else
      {
        int v41 = _PBLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          [v27 bundleID];
          v43 = id v42 = v21;
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v43;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v42;
          _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "...bundle ID %@ is not allowed to access the pasteboard. Error: %@", buf, 0x16u);

          id v21 = v42;
        }

        unsigned int v25 = v51;
        if (!v18) {
          goto LABEL_27;
        }
        v65 = _NSConcreteStackBlock;
        uint64_t v66 = 3221225472;
        v67 = sub_10000DF98;
        v68 = &unk_100030B10;
        id v70 = v18;
        id v69 = v15;
        PBDispatchAsyncCallback();

        id v40 = v70;
      }

LABEL_27:
      id v16 = v47;
      goto LABEL_28;
    }
    unsigned int v25 = v51;
    if (!v18) {
      goto LABEL_28;
    }
    v74 = _NSConcreteStackBlock;
    uint64_t v75 = 3221225472;
    v76 = sub_10000DF34;
    v77 = &unk_100030B10;
    id v79 = v18;
    id v78 = v15;
    PBDispatchAsyncCallback();

    id v26 = v79;
    goto LABEL_11;
  }
  id v24 = _PBLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "...pasteboard name %@ is not allowed. Error: %@", buf, 0x16u);
  }

  unsigned int v25 = v51;
  if (v18)
  {
    v80 = _NSConcreteStackBlock;
    uint64_t v81 = 3221225472;
    v82 = sub_10000DF1C;
    v83 = &unk_100030B10;
    id v85 = v18;
    id v84 = v21;
    PBDispatchAsyncCallback();

    id v26 = v85;
LABEL_11:
  }
LABEL_28:
}

- (void)requestItemFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 typeIdentifier:(id)a7 dataOwner:(int64_t)a8 loadContext:(id)a9 completionBlock:(id)a10
{
  id v13 = a7;
  id v14 = a10;
  id v15 = a9;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  int v19 = _PBLog();
  os_signpost_id_t v20 = os_signpost_id_generate(v19);

  id v21 = _PBLog();
  id v22 = v21;
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "RequestItem", "", buf, 2u);
  }

  if (v14)
  {
    id v23 = v37;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000EA78;
    v37[3] = &unk_100031438;
    unsigned int v28 = &v38;
    id v38 = v14;
  }
  else
  {
    id v23 = 0;
  }
  id v24 = objc_retainBlock(v23);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10000EA98;
  v32[3] = &unk_100031488;
  id v25 = v13;
  id v33 = v25;
  id v34 = v24;
  os_signpost_id_t v36 = v20;
  id v26 = v14;
  id v35 = v26;
  id v27 = v24;
  [(PBPasteboardServerServicer *)self requestFromPasteboardWithName:v18 UUID:v17 authenticationMessage:v16 itemIndex:a6 needData:1 dataOwner:a8 loadContext:v15 errorBlock:v27 pasteboardItemBlock:v32];

  if (v14) {
}
  }

- (void)requestPatternDetectionsFromPasteboardWithName:(id)a3 UUID:(id)a4 authenticationMessage:(id)a5 itemIndex:(unint64_t)a6 patterns:(id)a7 needValues:(BOOL)a8 dataOwner:(int64_t)a9 completionBlock:(id)a10
{
  BOOL v29 = a8;
  id v27 = a7;
  id v14 = a10;
  id v15 = v14;
  if (v14)
  {
    id v16 = v36;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000F14C;
    v36[3] = &unk_100031438;
    id v26 = &v37;
    id v37 = v14;
  }
  else
  {
    id v16 = 0;
  }
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  os_signpost_id_t v20 = objc_retainBlock(v16);
  id v21 = self->_detectiveAgency;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10000F160;
  v30[3] = &unk_100031560;
  id v22 = v15;
  id v33 = v22;
  BOOL v35 = v29;
  id v23 = v27;
  id v34 = v20;
  id v31 = v23;
  id v32 = v21;
  id v24 = v21;
  id v25 = v20;
  [(PBPasteboardServerServicer *)self requestFromPasteboardWithName:v19 UUID:v18 authenticationMessage:v17 itemIndex:a6 needData:v29 dataOwner:a9 loadContext:0 errorBlock:v25 pasteboardItemBlock:v30];

  if (v15) {
}
  }

- (void)didPasteContentsFromPasteboardWithName:(id)a3 UUID:(id)a4 completionBlock:(id)a5
{
  if (a5) {
    PBDispatchAsyncCallback();
  }
}

- (void)performJanitorialTasksCompletionBlock:(id)a3
{
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(PBPasteboardServerServicer *)self clientToServerConnection];
  id v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }

  *(_OWORD *)buf = v18;
  *(_OWORD *)&uint8_t buf[16] = v19;
  id v7 = sub_100011628((uint64_t)buf);
  unsigned int v8 = [v7 isAllowedToPerformJanitorialTasks];
  id v9 = _PBLog();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = [v7 bundleID];
      BOOL v12 = [v7 teamID];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Bundle ID %@ from team %@ is requesting to perform janitorial tasks.", buf, 0x16u);
    }
    id v13 = +[PBPasteboardModel sharedModel];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000FBB4;
    v16[3] = &unk_100031588;
    id v17 = v4;
    [v13 deleteOrphanedPasteboardFilesCompletionBlock:v16];
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v14 = [v7 bundleID];
      id v15 = [v7 teamID];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Bundle ID %@ from team %@ is not allowed to perform janitorial tasks.", buf, 0x16u);
    }
    if (v4) {
      PBDispatchAsyncCallback();
    }
  }
}

- (void)getAllPasteboardsCompletionBlock:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(PBPasteboardServerServicer *)self clientToServerConnection];
  id v6 = v5;
  if (v5)
  {
    [v5 auditToken];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
  }

  *(_OWORD *)buf = v20;
  *(_OWORD *)&uint8_t buf[16] = v21;
  id v7 = sub_100011628((uint64_t)buf);
  unsigned int v8 = [v7 isAllowedToPerformJanitorialTasks];
  id v9 = _PBLog();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = [v7 bundleID];
      BOOL v12 = [v7 teamID];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Bundle ID %@ from team %@ is enumerating all pasteboards", buf, 0x16u);
    }
    id v13 = +[PBPasteboardModel sharedModel];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000FED8;
    v18[3] = &unk_1000315B0;
    id v14 = &v19;
    id v19 = v4;
    [v13 getAllPasteboardsCompletionBlock:v18];

    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v15 = [v7 bundleID];
    id v16 = [v7 teamID];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Bundle ID %@ from team %@ is not allowed to enumerate all pasteboards.", buf, 0x16u);
  }
  if (v4)
  {
    id v14 = &v17;
    id v17 = v4;
    PBDispatchAsyncCallback();
LABEL_12:
  }
}

- (void)getRemoteContentForLayerContextWithId:(unint64_t)a3 slotStyle:(id)a4 pasteButtonTag:(id)a5 completionBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = (void (**)(id, uint64_t, void))a6;
  if (!a3 || !v10 || !v11)
  {
    id v15 = _PBLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17[0] = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Remote contents missing parameters.", (uint8_t *)v17, 2u);
    }

    if (!v12) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v13 = [(UISSlotMachine *)self->_pasteButtonSlotMachine remoteContentForLayerContextWithId:a3 style:v10 tag:v11];
  id v14 = (void *)v13;
  if (v12)
  {
    if (v13)
    {
      v12[2](v12, v13, 0);
      goto LABEL_12;
    }
LABEL_10:
    id v16 = PBNotAuthorizedError();
    ((void (**)(id, uint64_t, void *))v12)[2](v12, 0, v16);

LABEL_11:
    id v14 = 0;
  }
LABEL_12:
}

- (void)requestSecurePasteAuthenticationMessageWithContext:(unint64_t)a3 forClientVersionedPID:(int64_t)a4 completionBlock:(id)a5
{
  long long v17 = 0u;
  long long v18 = 0u;
  unsigned int v8 = (void (**)(id, void *, id))a5;
  id v9 = [(PBPasteboardServerServicer *)self clientToServerConnection];
  id v10 = v9;
  if (v9)
  {
    [v9 auditToken];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }

  v16[0] = v17;
  v16[1] = v18;
  id v11 = sub_100011628((uint64_t)v16);
  BOOL v12 = +[PBSecurePasteAuthenticationMessageGenerator sharedInstance];
  id v15 = 0;
  uint64_t v13 = [v12 generateAuthenticationMessageWithContext:a3 forClientVersionedPID:a4 requesterAuditTokenInfo:v11 error:&v15];
  id v14 = v15;

  v8[2](v8, v13, v14);
}

- (NSXPCConnection)clientToServerConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientToServerConnection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setClientToServerConnection:(id)a3
{
}

- (NSXPCConnection)serverToClientConnection
{
  return self->_serverToClientConnection;
}

- (void)setServerToClientConnection:(id)a3
{
}

- (NSUUID)dataOwnerCollectionUUID
{
  return self->_dataOwnerCollectionUUID;
}

- (void)setDataOwnerCollectionUUID:(id)a3
{
}

- (PBDataDetectiveAgency)detectiveAgency
{
  return self->_detectiveAgency;
}

- (void)setDetectiveAgency:(id)a3
{
}

- (UISSlotMachine)pasteButtonSlotMachine
{
  return self->_pasteButtonSlotMachine;
}

- (void)setPasteButtonSlotMachine:(id)a3
{
}

- (PBPasteAuthority)pasteAuthority
{
  return self->_pasteAuthority;
}

- (void)setPasteAuthority:(id)a3
{
}

- (PBPasteNotifying)pasteNotifier
{
  return self->_pasteNotifier;
}

- (void)setPasteNotifier:(id)a3
{
}

- (NSMutableDictionary)activeAnnouncers
{
  return self->_activeAnnouncers;
}

- (NSMutableDictionary)authorizationReplyBlocks
{
  return self->_authorizationReplyBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationReplyBlocks, 0);
  objc_storeStrong((id *)&self->_activeAnnouncers, 0);
  objc_storeStrong((id *)&self->_pasteNotifier, 0);
  objc_storeStrong((id *)&self->_pasteAuthority, 0);
  objc_storeStrong((id *)&self->_pasteButtonSlotMachine, 0);
  objc_storeStrong((id *)&self->_detectiveAgency, 0);
  objc_storeStrong((id *)&self->_dataOwnerCollectionUUID, 0);
  objc_storeStrong((id *)&self->_serverToClientConnection, 0);
  objc_destroyWeak((id *)&self->_clientToServerConnection);
}

@end