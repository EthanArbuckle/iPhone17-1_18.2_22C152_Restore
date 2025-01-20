@interface MKAPIServer
+ (BOOL)isPhotosBenchmarkEnabled;
+ (void)benchmark:(id)a3;
+ (void)clean;
+ (void)test;
- (MKAPIServer)init;
- (MKAPIServerDelegate)delegate;
- (MKClient)client;
- (MKDiscoverabilitySignals)discoverabilitySignals;
- (int64_t)preferredChannel;
- (void)cancel;
- (void)dealloc;
- (void)import;
- (void)migratorDidComplete:(id)a3;
- (void)migratorDidExecuteOperation:(id)a3;
- (void)migratorWillExecuteOperation:(id)a3;
- (void)processPerformanceMetrics;
- (void)router:(id)a3 didReceiveAccessibilitySettingEncodedInJSON:(id)a4;
- (void)router:(id)a3 didReceiveAccountEncodedInJSON:(id)a4;
- (void)router:(id)a3 didReceiveApplicationEncodedInJSON:(id)a4;
- (void)router:(id)a3 didReceiveAudioChunk:(id)a4 identifier:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 filename:(id)a9 originalFilename:(id)a10 dateAdded:(id)a11 complete:(BOOL)a12;
- (void)router:(id)a3 didReceiveBookmarkEncodedInJSON:(id)a4;
- (void)router:(id)a3 didReceiveCallHistoryEncodedInJSON:(id)a4;
- (void)router:(id)a3 didReceiveCertifciate:(id)a4;
- (void)router:(id)a3 didReceiveClient:(id)a4;
- (void)router:(id)a3 didReceiveContainer:(id)a4 signature:(id)a5 chunk:(id)a6 filename:(id)a7 offset:(unint64_t)a8 length:(unint64_t)a9 total:(unint64_t)a10 required:(BOOL)a11 excludedFromBackup:(BOOL)a12 complete:(BOOL)a13;
- (void)router:(id)a3 didReceiveDiagnosticsFile:(id)a4 filename:(id)a5;
- (void)router:(id)a3 didReceiveDisplaySettingEncodedInJSON:(id)a4;
- (void)router:(id)a3 didReceiveFileChunk:(id)a4 filename:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 complete:(BOOL)a9;
- (void)router:(id)a3 didReceiveICal:(id)a4;
- (void)router:(id)a3 didReceiveImageChunk:(id)a4 identifier:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 filename:(id)a9 collection:(id)a10 originalFilename:(id)a11 complete:(BOOL)a12;
- (void)router:(id)a3 didReceiveMessageEncodedInJSON:(id)a4;
- (void)router:(id)a3 didReceivePerformanceMetrics:(id)a4;
- (void)router:(id)a3 didReceivePlaceholderEncodedInJSON:(id)a4;
- (void)router:(id)a3 didReceiveSIMEncodedInJSON:(id)a4;
- (void)router:(id)a3 didReceiveVCard:(id)a4;
- (void)router:(id)a3 didReceiveVideoChunk:(id)a4 identifier:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 filename:(id)a9 collection:(id)a10 originalFilename:(id)a11 complete:(BOOL)a12;
- (void)router:(id)a3 didUpdateProgress:(float)a4 remainingTime:(unint64_t)a5 state:(int)a6;
- (void)routerDidAuthenticateClient:(id)a3;
- (void)routerDidDeleteSIM:(id)a3;
- (void)routerDidRejectClient:(id)a3;
- (void)routerDidRevokeEncryptionKey:(id)a3;
- (void)runHTTP;
- (void)runHTTPS:(id)a3;
- (void)server:(id)a3 didOpen:(int64_t)a4;
- (void)serverDidCancel:(id)a3;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoverabilitySignals:(id)a3;
- (void)setImportContext:(id)a3;
- (void)setImportContexts;
- (void)setPreferredChannel:(int64_t)a3;
- (void)setSwitcherFlags;
- (void)usbHTTPServerDidClose:(id)a3;
@end

@implementation MKAPIServer

- (MKAPIServer)init
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  v59.receiver = self;
  v59.super_class = (Class)MKAPIServer;
  v2 = [(MKAPIServer *)&v59 init];
  if (v2)
  {
    v3 = objc_alloc_init(MKCertificate);
    certificate = v2->_certificate;
    v2->_certificate = v3;

    v5 = objc_alloc_init(MKProgress);
    progress = v2->_progress;
    v2->_progress = v5;

    v7 = objc_alloc_init(MKContext);
    context = v2->_context;
    v2->_context = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:0];
    migrators = v2->_migrators;
    v2->_migrators = (NSHashTable *)v9;

    v11 = objc_alloc_init(MKAccountMigrator);
    accountMigrator = v2->_accountMigrator;
    v2->_accountMigrator = v11;

    v13 = objc_alloc_init(MKMessageMigrator);
    messageMigrator = v2->_messageMigrator;
    v2->_messageMigrator = v13;

    v15 = objc_alloc_init(MKBookmarkMigrator);
    bookmarkMigrator = v2->_bookmarkMigrator;
    v2->_bookmarkMigrator = v15;

    v17 = objc_alloc_init(MKApplicationMigrator);
    applicationMigrator = v2->_applicationMigrator;
    v2->_applicationMigrator = v17;

    v19 = objc_alloc_init(MKAccessibilitySettingMigrator);
    accessibilitySettingMigrator = v2->_accessibilitySettingMigrator;
    v2->_accessibilitySettingMigrator = v19;

    v21 = objc_alloc_init(MKDisplaySettingMigrator);
    displaySettingMigrator = v2->_displaySettingMigrator;
    v2->_displaySettingMigrator = v21;

    v23 = objc_alloc_init(MKContactMigrator);
    contactMigrator = v2->_contactMigrator;
    v2->_contactMigrator = v23;

    v25 = objc_alloc_init(MKCallHistoryMigrator);
    callHistoryMigrator = v2->_callHistoryMigrator;
    v2->_callHistoryMigrator = v25;

    v27 = objc_alloc_init(MKCalendarMigrator);
    calendarMigrator = v2->_calendarMigrator;
    v2->_calendarMigrator = v27;

    v29 = objc_alloc_init(MKPhotoLibraryAlbumMigrator);
    photoLibraryAlbumMigrator = v2->_photoLibraryAlbumMigrator;
    v2->_photoLibraryAlbumMigrator = v29;

    v31 = [[MKPhotoLibraryMigrator alloc] initWithType:0];
    photoLibraryImageMigrator = v2->_photoLibraryImageMigrator;
    v2->_photoLibraryImageMigrator = v31;

    v33 = [[MKPhotoLibraryMigrator alloc] initWithType:1];
    photoLibraryVideoMigrator = v2->_photoLibraryVideoMigrator;
    v2->_photoLibraryVideoMigrator = v33;

    [(MKPhotoLibraryMigrator *)v2->_photoLibraryImageMigrator setAlbumMigrator:v2->_photoLibraryAlbumMigrator];
    [(MKPhotoLibraryMigrator *)v2->_photoLibraryVideoMigrator setAlbumMigrator:v2->_photoLibraryAlbumMigrator];
    v35 = objc_alloc_init(MKVoiceMemoMigrator);
    voiceMemoMigrator = v2->_voiceMemoMigrator;
    v2->_voiceMemoMigrator = v35;

    v37 = objc_alloc_init(MKFileMigrator);
    fileMigrator = v2->_fileMigrator;
    v2->_fileMigrator = v37;

    v39 = objc_alloc_init(MKPlaceholderMigrator);
    placeholderMigrator = v2->_placeholderMigrator;
    v2->_placeholderMigrator = v39;

    v41 = objc_alloc_init(MKContainerMigrator);
    containerMigrator = v2->_containerMigrator;
    v2->_containerMigrator = v41;

    v43 = objc_alloc_init(MKDiagnosticsMigrator);
    diagnosticsMigrator = v2->_diagnosticsMigrator;
    v2->_diagnosticsMigrator = v43;

    v45 = objc_alloc_init(MKSIMMigrator);
    simMigrator = v2->_simMigrator;
    v2->_simMigrator = v45;

    [(MKCallHistoryMigrator *)v2->_callHistoryMigrator setLabel:v2->_simMigrator];
    v47 = v2->_applicationMigrator;
    v48 = [(MKContainerMigrator *)v2->_containerMigrator signatures];
    [(MKApplicationMigrator *)v47 setSignatures:v48];

    [(NSHashTable *)v2->_migrators addObject:v2->_accountMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_messageMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_bookmarkMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_applicationMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_accessibilitySettingMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_displaySettingMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_contactMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_callHistoryMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_calendarMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_photoLibraryImageMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_photoLibraryVideoMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_photoLibraryAlbumMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_voiceMemoMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_fileMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_containerMigrator];
    [(NSHashTable *)v2->_migrators addObject:v2->_simMigrator];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v49 = v2->_migrators;
    uint64_t v50 = [(NSHashTable *)v49 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v56;
      do
      {
        uint64_t v53 = 0;
        do
        {
          if (*(void *)v56 != v52) {
            objc_enumerationMutation(v49);
          }
          objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * v53++), "setDelegate:", v2, (void)v55);
        }
        while (v51 != v53);
        uint64_t v51 = [(NSHashTable *)v49 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v51);
    }
  }
  return v2;
}

- (void)dealloc
{
  [(MKAPIServer *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)MKAPIServer;
  [(MKAPIServer *)&v3 dealloc];
}

- (void)cancel
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(MKHTTPServer *)self->_http cancel];
  [(MKHTTPServer *)self->_https cancel];
  [(MKUSBHTTPServer *)self->_usb cancel];
  if (self->_https)
  {
    objc_super v3 = self;
    objc_sync_enter(v3);
    if (!v3->_success)
    {
      [(MKAPIServer *)v3 setImportContexts];
      id WeakRetained = objc_loadWeakRetained((id *)&v3->_delegate);
      [WeakRetained server:v3 didChangeState:2 withContext:v3->_context];

      [(MKAPIServer *)v3 setDelegate:0];
      [(MKSIMMigrator *)v3->_simMigrator remove];
      [(MKPlaceholderMigrator *)v3->_placeholderMigrator remove];
      id v5 = +[MKAnalytics sharedInstance];
      objc_sync_enter(v5);
      v6 = [v5 payload];
      [v6 setState:@"com.apple.migrationkit.canceled"];

      v7 = [MEMORY[0x263EFF910] date];
      [v7 timeIntervalSinceDate:v3->_startDate];
      double v9 = v8;
      v10 = [v5 payload];
      [v10 setElapsedTime:(unint64_t)v9];

      [v5 send];
      [v5 reset];
      objc_sync_exit(v5);
    }
    objc_sync_exit(v3);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v11 = self->_migrators;
  uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "cancel", (void)v15);
      }
      uint64_t v12 = [(NSHashTable *)v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

- (void)import
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSHashTable *)self->_migrators allObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) import];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)runHTTP
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  [(MKHTTPServer *)self->_http cancel];
  [(MKUSBHTTPServer *)self->_usb cancel];
  uint64_t v3 = objc_alloc_init(MKSRPServer);
  v28 = [[MKGETSRPRouter alloc] initWithSRP:v3];
  [(MKGETSRPRouter *)v28 setDelegate:self];
  v27 = [[MKPOSTSRPRouter alloc] initWithSRP:v3];
  [(MKPOSTSRPRouter *)v27 setDelegate:self];
  uint64_t v4 = [MKSRPPrecheck alloc];
  uint64_t v5 = [(MKSRPServer *)v3 password];
  uint64_t v6 = [(MKSRPPrecheck *)v4 initWithPassword:v5];

  v26 = [[MKGETSRPPrecheckRouter alloc] initWithPrecheck:v6];
  v22 = (void *)v6;
  v25 = [[MKPOSTSRPPrecheckRouter alloc] initWithPrecheck:v6];
  v24 = [[MKGETCertificateRouter alloc] initWithSRP:v3 certificate:self->_certificate];
  [(MKGETCertificateRouter *)v24 setDelegate:self];
  v23 = [[MKPOSTCertificateRouter alloc] initWithSRP:v3];
  [(MKPOSTCertificateRouter *)v23 setDelegate:self];
  long long v7 = objc_alloc_init(MKGETStatusRouter);
  getStatusRouter = self->_getStatusRouter;
  self->_getStatusRouter = v7;

  long long v9 = objc_alloc_init(MKHTTPServer);
  http = self->_http;
  self->_http = v9;

  [(MKHTTPServer *)self->_http setDelegate:self];
  v11 = objc_alloc_init(MKUSBHTTPServer);
  usb = self->_usb;
  self->_usb = v11;

  [(MKUSBHTTPServer *)self->_usb setDelegate:self];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v13 = self->_usb;
  v33[0] = self->_http;
  v33[1] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v19 addRouter:v28 method:1 path:@"/srp"];
        [v19 addRouter:v27 method:3 path:@"/srp"];
        [v19 addRouter:v26 method:1 path:@"/srp/precheck"];
        [v19 addRouter:v25 method:3 path:@"/srp/precheck"];
        [v19 addRouter:v24 method:1 path:@"/certificate"];
        [v19 addRouter:v23 method:3 path:@"/certificate"];
        [v19 addRouter:self->_getStatusRouter method:1 path:@"/status"];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v16);
  }

  [(MKHTTPServer *)self->_http setService:@"com.apple.migrationkit.http"];
  [(MKHTTPServer *)self->_http run];
  [(MKUSBHTTPServer *)self->_usb run];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = [(MKSRPServer *)v3 password];
  [WeakRetained server:self didCreateCode:v21];
}

- (void)setPreferredChannel:(int64_t)a3
{
  self->_preferredChannel = a3;
  -[MKGETStatusRouter setPreferredChannel:](self->_getStatusRouter, "setPreferredChannel:");
}

- (void)runHTTPS:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(MKHTTPServer *)self->_https cancel];
  long long v29 = objc_alloc_init(MKPOSTClientRouter);
  [(MKPOSTClientRouter *)v29 setDelegate:self];
  uint64_t v5 = objc_alloc_init(MKPUTRouter);
  [(MKPUTRouter *)v5 setDelegate:self];
  v28 = objc_alloc_init(MKPOSTProgressRouter);
  [(MKPOSTProgressRouter *)v28 setDelegate:self];
  uint64_t v6 = objc_alloc_init(MKGETSecuredStatusRouter);
  [(MKGETSecuredStatusRouter *)v6 setGetStatusRouter:self->_getStatusRouter];
  long long v7 = [(MKPUTRouter *)v5 supportedContentTypes];
  [(MKGETSecuredStatusRouter *)v6 setSupportedContentTypes:v7];

  long long v8 = [(MKPUTRouter *)v5 supportedTransferEncodings];
  [(MKGETSecuredStatusRouter *)v6 setSupportedTransferEncodings:v8];

  long long v9 = [(MKContainerMigrator *)self->_containerMigrator signatures];
  [(MKGETSecuredStatusRouter *)v6 setSignatures:v9];

  v27 = objc_alloc_init(MKGETPlaceholderRouter);
  v26 = objc_alloc_init(MKDELETEPlaceholderRouter);
  v25 = objc_alloc_init(MKGETMigratorRouter);
  [(MKGETMigratorRouter *)v25 setMigrators:self->_migrators];
  v24 = objc_alloc_init(MKDELETESIMRouter);
  [(MKDELETESIMRouter *)v24 setDelegate:self];
  long long v10 = objc_alloc_init(MKHTTPServer);
  https = self->_https;
  self->_https = v10;

  [(MKHTTPServer *)self->_https setDelegate:self];
  [(MKHTTPServer *)self->_https setCertificate:self->_certificate];
  v22 = v4;
  [(MKHTTPServer *)self->_https setClientCertificate:v4];
  [(MKHTTPServer *)self->_https setUseHTTPS:1];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  usb = self->_usb;
  v21 = self;
  v34[0] = self->_https;
  v34[1] = usb;
  id obj = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        [v17 addRouter:v29 method:3 path:@"/client"];
        [v17 addRouter:v5 method:4 path:@"/"];
        [v17 addRouter:v28 method:3 path:@"/progress"];
        [v17 addRouter:v6 method:1 path:@"/status"];
        [v17 addRouter:v27 method:1 path:@"/placeholder"];
        [v17 addRouter:v26 method:5 path:@"/placeholder"];
        [v17 addRouter:v25 method:1 path:@"/migrator"];
        [v17 addRouter:v24 method:5 path:@"/sim"];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v14);
  }

  [(MKHTTPServer *)v21->_https setService:@"com.apple.migrationkit.https"];
  [(MKHTTPServer *)v21->_https run];
  uint64_t v18 = [MEMORY[0x263EFF910] date];
  startDate = v21->_startDate;
  v21->_startDate = (NSDate *)v18;

  uint64_t v20 = v21;
  objc_sync_enter(v20);
  v20->_isImporting = 0;
  objc_sync_exit(v20);
}

- (void)server:(id)a3 didOpen:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = (MKHTTPServer *)a3;
  long long v7 = +[MKLog log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    v11 = v6;
    __int16 v12 = 2048;
    int64_t v13 = a4;
    _os_log_impl(&dword_22BFAC000, v7, OS_LOG_TYPE_INFO, "%@ open %ld port.", (uint8_t *)&v10, 0x16u);
  }

  long long v8 = self;
  objc_sync_enter(v8);
  if (v8->_http == v6)
  {
    uint64_t v9 = 1;
    goto LABEL_7;
  }
  if (v8->_https == v6)
  {
    uint64_t v9 = 2;
LABEL_7:
    [(MKGETStatusRouter *)v8->_getStatusRouter setState:v9];
  }
  objc_sync_exit(v8);
}

- (void)serverDidCancel:(id)a3
{
  uint64_t v5 = (MKHTTPServer *)a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_https == v5) {
    [(MKGETStatusRouter *)v4->_getStatusRouter setState:3];
  }
  objc_sync_exit(v4);
}

- (void)usbHTTPServerDidClose:(id)a3
{
  if (!self->_isImporting) {
    [(MKAPIServer *)self cancel];
  }
}

- (void)routerDidRevokeEncryptionKey:(id)a3
{
}

- (void)routerDidAuthenticateClient:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained serverDidAuthenticateClient:self];
}

- (void)routerDidRejectClient:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained serverDidRejectClient:self];

  id v5 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v5);
  uint64_t v6 = [v5 payload];
  [v6 setState:@"com.apple.migrationkit.rejected"];

  [v5 send];
  [v5 reset];
  objc_sync_exit(v5);
}

- (void)router:(id)a3 didReceiveCertifciate:(id)a4
{
}

- (void)router:(id)a3 didReceiveClient:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v31 = a3;
  id v6 = a4;
  id v7 = +[MKLog log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    long long v30 = [v6 hostname];
    long long v8 = [v6 brand];
    uint64_t v9 = [v6 model];
    int v10 = [v6 name];
    v11 = [v6 os];
    __int16 v12 = [v6 version];
    int64_t v13 = [v6 locale];
    uint64_t v14 = [v6 inputMethodLanguages];
    *(_DWORD *)buf = 138414594;
    long long v33 = self;
    __int16 v34 = 2112;
    uint64_t v35 = v30;
    __int16 v36 = 2112;
    v37 = v8;
    __int16 v38 = 2112;
    v39 = v9;
    __int16 v40 = 2112;
    v41 = v10;
    __int16 v42 = 2112;
    v43 = v11;
    __int16 v44 = 2112;
    v45 = v12;
    __int16 v46 = 2112;
    v47 = v13;
    __int16 v48 = 2112;
    v49 = v14;
    __int16 v50 = 2048;
    uint64_t v51 = [v6 activatedCellularPlans];
    _os_log_impl(&dword_22BFAC000, v7, OS_LOG_TYPE_INFO, "%@ did receive a client. hostname=%@, brand=%@, model=%@, name=%@, os=%@, version=%@, locale=%@, inputMethodLanguages=%@ activatedCellularPlans=%lu", buf, 0x66u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained server:self didReceiveClient:v6];

  uint64_t v16 = self;
  objc_sync_enter(v16);
  [(MKAPIServer *)v16 setClient:v6];
  -[MKSIMMigrator setActivatedCellularPlansCount:](v16->_simMigrator, "setActivatedCellularPlansCount:", [v6 activatedCellularPlans]);
  uint64_t v17 = objc_alloc_init(MKDiscoverabilitySignals);
  [(MKAPIServer *)v16 setDiscoverabilitySignals:v17];

  uint64_t v18 = [(MKAPIServer *)v16 discoverabilitySignals];
  [v18 addSignalsForClient:v6];

  objc_sync_exit(v16);
  id v19 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v19);
  uint64_t v20 = [v6 os];
  v21 = [v19 payload];
  [v21 setAndroidAPILevel:v20];

  v22 = [v6 brand];
  v23 = [v19 payload];
  [v23 setAndroidBrand:v22];

  v24 = [v6 locale];
  v25 = [v19 payload];
  [v25 setAndroidLocale:v24];

  v26 = [v6 model];
  v27 = [v19 payload];
  [v27 setAndroidModel:v26];

  v28 = [v6 version];
  long long v29 = [v19 payload];
  [v29 setAndroidVersion:v28];

  objc_sync_exit(v19);
}

- (void)router:(id)a3 didUpdateProgress:(float)a4 remainingTime:(unint64_t)a5 state:(int)a6
{
  id v10 = a3;
  unint64_t v36 = a5;
  if (a4 <= 0.99) {
    float v11 = a4;
  }
  else {
    float v11 = 0.99;
  }
  __int16 v12 = self;
  objc_sync_enter(v12);
  uint64_t v13 = [(MKProgress *)v12->_progress completedOperationCount];
  uint64_t v14 = [(MKProgress *)v12->_progress totalOperationCount];
  uint64_t v15 = v14;
  BOOL v16 = a4 < 1.0 || v14 == 0;
  char v17 = v16;
  if (v16)
  {
    if (a4 >= 1.0)
    {
LABEL_22:
      [(MKAPIServer *)v12 import];
      objc_sync_exit(v12);

      goto LABEL_29;
    }
  }
  else
  {
    v12->_isImporting = 1;
    [(MKProgress *)v12->_progress progress:&v36];
    float v11 = (float)(v32 * 0.01) + 0.99;
    unint64_t v36 = 0;
    if (v11 >= 1.0) {
      goto LABEL_22;
    }
  }
  if (a4 < 0.0)
  {
    [(MKAPIServer *)v12 setImportContexts];
    v12->_success = 0;
    id v18 = +[MKAnalytics sharedInstance];
    objc_sync_enter(v18);
    id v19 = [v18 payload];
    uint64_t v20 = v19;
    if (a6 == 2) {
      v21 = @"com.apple.migrationkit.android.canceled";
    }
    else {
      v21 = @"com.apple.migrationkit.failed";
    }
    [v19 setState:v21];

    v22 = [MEMORY[0x263EFF910] date];
    [v22 timeIntervalSinceDate:v12->_startDate];
    double v24 = v23;
    v25 = [v18 payload];
    [v25 setElapsedTime:(unint64_t)v24];

    [v18 send];
    [v18 reset];
    objc_sync_exit(v18);
  }
  objc_sync_exit(v12);

  p_delegate = (id *)&v12->_delegate;
  if (a6 == 3)
  {
    id WeakRetained = objc_loadWeakRetained(p_delegate);
    v28 = WeakRetained;
    context = v12->_context;
    long long v30 = v12;
    uint64_t v31 = 3;
    goto LABEL_24;
  }
  if (a6 == 2)
  {
    id WeakRetained = objc_loadWeakRetained(p_delegate);
    v28 = WeakRetained;
    context = v12->_context;
    long long v30 = v12;
    uint64_t v31 = 2;
LABEL_24:
    [WeakRetained server:v30 didChangeState:v31 withContext:context];

    [(MKAPIServer *)v12 setDelegate:0];
    goto LABEL_29;
  }
  id v33 = objc_loadWeakRetained(p_delegate);
  uint64_t v35 = v33;
  if (v17)
  {
    *(float *)&double v34 = v11;
    [v33 server:v12 didUpdateProgress:v36 remainingTime:v13 completedOperationCount:v15 totalOperationCount:v34];
  }
  else
  {
    [v33 serverWillImport:v12];
  }

LABEL_29:
}

- (void)migratorWillExecuteOperation:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(MKProgress *)v4->_progress addTotalOperationCount:1];
  objc_sync_exit(v4);
}

- (void)migratorDidExecuteOperation:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v5 = self;
  objc_sync_enter(v5);
  [(MKProgress *)v5->_progress addCompletedOerationCount:1];
  uint64_t v6 = [(MKProgress *)v5->_progress completedOperationCount];
  uint64_t v7 = [(MKProgress *)v5->_progress totalOperationCount];
  if (!v7 || !v5->_isImporting) {
    goto LABEL_6;
  }
  [(MKProgress *)v5->_progress progress:&v12];
  float v9 = (float)(v8 * 0.01) + 0.99;
  uint64_t v12 = 0;
  if (v9 >= 1.0)
  {
    [(MKAPIServer *)v5 import];
LABEL_6:
    objc_sync_exit(v5);
    goto LABEL_7;
  }
  objc_sync_exit(v5);

  id WeakRetained = (MKAPIServer *)objc_loadWeakRetained((id *)&v5->_delegate);
  *(float *)&double v11 = v9;
  [(MKAPIServer *)WeakRetained server:v5 didUpdateProgress:v12 remainingTime:v6 completedOperationCount:v7 totalOperationCount:v11];
  id v5 = WeakRetained;
LABEL_7:
}

- (void)migratorDidComplete:(id)a3
{
  id v15 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(MKAPIServer *)v4 setImportContext:v15];
  [(NSHashTable *)v4->_migrators removeObject:v15];
  uint64_t v5 = [(NSHashTable *)v4->_migrators count];
  uint64_t v6 = [(MKAPIServer *)v4 discoverabilitySignals];
  [v6 addSignalsForMigrator:v15];

  if (!v5)
  {
    v4->_success = 1;
    uint64_t v7 = [(MKAPIServer *)v4 discoverabilitySignals];
    [v7 donateSignals];

    id v8 = +[MKAnalytics sharedInstance];
    objc_sync_enter(v8);
    float v9 = [v8 payload];
    [v9 setState:@"com.apple.migrationkit.completed"];

    id v10 = [MEMORY[0x263EFF910] date];
    [v10 timeIntervalSinceDate:v4->_startDate];
    double v12 = v11;
    uint64_t v13 = [v8 payload];
    [v13 setElapsedTime:(unint64_t)v12];

    [(MKAPIServer *)v4 processPerformanceMetrics];
    [v8 send];
    [v8 reset];
    objc_sync_exit(v8);

    id WeakRetained = objc_loadWeakRetained((id *)&v4->_delegate);
    [WeakRetained server:v4 didImportWithContext:v4->_context];

    [(MKAPIServer *)v4 setDelegate:0];
    [(MKAPIServer *)v4 setSwitcherFlags];
  }
  objc_sync_exit(v4);
}

- (void)setImportContexts
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_migrators;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MKAPIServer setImportContext:](self, "setImportContext:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setImportContext:(id)a3
{
  id v4 = a3;
  switch([v4 type])
  {
    case 0:
      uint64_t v5 = [(MKContext *)self->_context accessibilitySetting];
      goto LABEL_20;
    case 1:
      uint64_t v5 = [(MKContext *)self->_context account];
      goto LABEL_20;
    case 2:
      uint64_t v5 = [(MKContext *)self->_context application];
      goto LABEL_20;
    case 3:
      uint64_t v5 = [(MKContext *)self->_context bookmark];
      goto LABEL_20;
    case 4:
      uint64_t v5 = [(MKContext *)self->_context calendar];
      goto LABEL_20;
    case 5:
      uint64_t v5 = [(MKContext *)self->_context contact];
      goto LABEL_20;
    case 6:
      uint64_t v5 = [(MKContext *)self->_context callHistory];
      goto LABEL_20;
    case 7:
      uint64_t v5 = [(MKContext *)self->_context container];
      goto LABEL_20;
    case 8:
      uint64_t v5 = [(MKContext *)self->_context displaySetting];
      goto LABEL_20;
    case 9:
      uint64_t v5 = [(MKContext *)self->_context file];
      goto LABEL_20;
    case 10:
      uint64_t v5 = [(MKContext *)self->_context message];
      goto LABEL_20;
    case 11:
      uint64_t v5 = [(MKContext *)self->_context image];
      goto LABEL_20;
    case 12:
      uint64_t v5 = [(MKContext *)self->_context video];
      goto LABEL_20;
    case 13:
      uint64_t v5 = [(MKContext *)self->_context album];
      goto LABEL_20;
    case 14:
      uint64_t v5 = [(MKContext *)self->_context voiceMemo];
      goto LABEL_20;
    case 15:
      uint64_t v5 = [(MKContext *)self->_context placeholder];
      goto LABEL_20;
    case 16:
      uint64_t v5 = [(MKContext *)self->_context sim];
LABEL_20:
      id v7 = (id)v5;
      break;
    default:
      id v7 = 0;
      break;
  }
  objc_msgSend(v7, "setImportCount:", objc_msgSend(v4, "importCount"));
  objc_msgSend(v7, "setImportErrorCount:", objc_msgSend(v4, "importErrorCount"));
  uint64_t v6 = [v4 size];

  [v7 setSize:v6];
}

- (void)router:(id)a3 didReceiveAccountEncodedInJSON:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [(MKAccountMigrator *)self->_accountMigrator importDataEncodedInJSON:v6];
  id v7 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v7);
  long long v8 = [v7 payload];
  long long v9 = [v8 accounts];
  [v9 setEnabled:1];

  long long v10 = [v7 payload];
  long long v11 = [v10 accounts];
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  double v12 = [v7 payload];
  uint64_t v13 = [v12 accounts];
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveMessageEncodedInJSON:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [(MKMessageMigrator *)self->_messageMigrator importDataEncodedInJSON:v6];
  id v7 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v7);
  long long v8 = [v7 payload];
  long long v9 = [v8 messages];
  [v9 setEnabled:1];

  long long v10 = [v7 payload];
  long long v11 = [v10 messages];
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  double v12 = [v7 payload];
  uint64_t v13 = [v12 messages];
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveBookmarkEncodedInJSON:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [(MKBookmarkMigrator *)self->_bookmarkMigrator importDataEncodedInJSON:v6];
  id v7 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v7);
  long long v8 = [v7 payload];
  long long v9 = [v8 bookmarks];
  [v9 setEnabled:1];

  long long v10 = [v7 payload];
  long long v11 = [v10 bookmarks];
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  double v12 = [v7 payload];
  uint64_t v13 = [v12 bookmarks];
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveApplicationEncodedInJSON:(id)a4
{
}

- (void)router:(id)a3 didReceivePlaceholderEncodedInJSON:(id)a4
{
}

- (void)router:(id)a3 didReceiveAccessibilitySettingEncodedInJSON:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [(MKAccessibilitySettingMigrator *)self->_accessibilitySettingMigrator importDataEncodedInJSON:v6];
  id v7 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v7);
  long long v8 = [v7 payload];
  long long v9 = [v8 accessibilitySettings];
  [v9 setEnabled:1];

  long long v10 = [v7 payload];
  long long v11 = [v10 accessibilitySettings];
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  double v12 = [v7 payload];
  uint64_t v13 = [v12 accessibilitySettings];
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveDisplaySettingEncodedInJSON:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [(MKDisplaySettingMigrator *)self->_displaySettingMigrator importDataEncodedInJSON:v6];
  id v7 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v7);
  long long v8 = [v7 payload];
  long long v9 = [v8 displaySettings];
  [v9 setEnabled:1];

  long long v10 = [v7 payload];
  long long v11 = [v10 displaySettings];
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  double v12 = [v7 payload];
  uint64_t v13 = [v12 displaySettings];
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveSIMEncodedInJSON:(id)a4
{
}

- (void)router:(id)a3 didReceiveCallHistoryEncodedInJSON:(id)a4
{
}

- (void)router:(id)a3 didReceiveVCard:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [(MKContactMigrator *)self->_contactMigrator importVCard:v6];
  id v7 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v7);
  long long v8 = [v7 payload];
  long long v9 = [v8 contacts];
  [v9 setEnabled:1];

  long long v10 = [v7 payload];
  long long v11 = [v10 contacts];
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  double v12 = [v7 payload];
  uint64_t v13 = [v12 contacts];
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveICal:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [(MKCalendarMigrator *)self->_calendarMigrator importiCal:v6];
  id v7 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v7);
  long long v8 = [v7 payload];
  long long v9 = [v8 calendars];
  [v9 setEnabled:1];

  long long v10 = [v7 payload];
  long long v11 = [v10 calendars];
  objc_msgSend(v11, "setCount:", objc_msgSend(v11, "count") + 1);

  double v12 = [v7 payload];
  uint64_t v13 = [v12 calendars];
  objc_msgSend(v13, "setSize:", objc_msgSend(v13, "size") + objc_msgSend(v6, "length"));

  objc_sync_exit(v7);
}

- (void)router:(id)a3 didReceiveImageChunk:(id)a4 identifier:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 filename:(id)a9 collection:(id)a10 originalFilename:(id)a11 complete:(BOOL)a12
{
  id v31 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  LOBYTE(v30) = a12;
  [(MKPhotoLibraryMigrator *)self->_photoLibraryImageMigrator importChunk:v18 identifier:v19 offset:a6 length:a7 total:a8 filename:v20 collection:v21 originalFilename:v22 complete:v30];
  if (!a6)
  {
    id v23 = +[MKAnalytics sharedInstance];
    objc_sync_enter(v23);
    double v24 = [v23 payload];
    v25 = [v24 photos];
    [v25 setEnabled:1];

    v26 = [v23 payload];
    v27 = [v26 photos];
    objc_msgSend(v27, "setCount:", objc_msgSend(v27, "count") + 1);

    v28 = [v23 payload];
    long long v29 = [v28 photos];
    objc_msgSend(v29, "setSize:", objc_msgSend(v29, "size") + a8);

    objc_sync_exit(v23);
  }
}

- (void)router:(id)a3 didReceiveVideoChunk:(id)a4 identifier:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 filename:(id)a9 collection:(id)a10 originalFilename:(id)a11 complete:(BOOL)a12
{
  id v31 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  LOBYTE(v30) = a12;
  [(MKPhotoLibraryMigrator *)self->_photoLibraryVideoMigrator importChunk:v18 identifier:v19 offset:a6 length:a7 total:a8 filename:v20 collection:v21 originalFilename:v22 complete:v30];
  if (!a6)
  {
    id v23 = +[MKAnalytics sharedInstance];
    objc_sync_enter(v23);
    double v24 = [v23 payload];
    v25 = [v24 videos];
    [v25 setEnabled:1];

    v26 = [v23 payload];
    v27 = [v26 videos];
    objc_msgSend(v27, "setCount:", objc_msgSend(v27, "count") + 1);

    v28 = [v23 payload];
    long long v29 = [v28 videos];
    objc_msgSend(v29, "setSize:", objc_msgSend(v29, "size") + a8);

    objc_sync_exit(v23);
  }
}

- (void)router:(id)a3 didReceiveAudioChunk:(id)a4 identifier:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 filename:(id)a9 originalFilename:(id)a10 dateAdded:(id)a11 complete:(BOOL)a12
{
}

- (void)router:(id)a3 didReceiveFileChunk:(id)a4 filename:(id)a5 offset:(unint64_t)a6 length:(unint64_t)a7 total:(unint64_t)a8 complete:(BOOL)a9
{
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  [(MKFileMigrator *)self->_fileMigrator importChunk:v15 filename:v16 offset:a6 length:a7 total:a8 complete:a9];
  if (!a6)
  {
    id v17 = +[MKAnalytics sharedInstance];
    objc_sync_enter(v17);
    id v18 = [v17 payload];
    id v19 = [v18 files];
    [v19 setEnabled:1];

    id v20 = [v17 payload];
    id v21 = [v20 files];
    objc_msgSend(v21, "setCount:", objc_msgSend(v21, "count") + 1);

    id v22 = [v17 payload];
    id v23 = [v22 files];
    objc_msgSend(v23, "setSize:", objc_msgSend(v23, "size") + a8);

    objc_sync_exit(v17);
  }
}

- (void)routerDidDeleteSIM:(id)a3
{
}

- (void)router:(id)a3 didReceiveContainer:(id)a4 signature:(id)a5 chunk:(id)a6 filename:(id)a7 offset:(unint64_t)a8 length:(unint64_t)a9 total:(unint64_t)a10 required:(BOOL)a11 excludedFromBackup:(BOOL)a12 complete:(BOOL)a13
{
}

- (void)router:(id)a3 didReceiveDiagnosticsFile:(id)a4 filename:(id)a5
{
}

- (void)router:(id)a3 didReceivePerformanceMetrics:(id)a4
{
}

- (void)processPerformanceMetrics
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_22BFAC000, v0, v1, "%@: Failed to delete performance metrics file; error=%@");
}

- (void)setSwitcherFlags
{
  v45[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = +[MKLog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "will set switcher flags.", buf, 2u);
  }

  id v4 = NSString;
  uint64_t v5 = [(MKAPIServer *)self client];
  id v6 = [v5 brand];
  id v7 = [(MKAPIServer *)self client];
  long long v8 = [v7 model];
  long long v9 = [(MKAPIServer *)self client];
  long long v10 = [v9 brand];
  uint64_t v11 = [v4 stringWithFormat:@"%@/%@/Android/%@/Android", v6, v8, v10];

  v45[0] = MEMORY[0x263EFFA88];
  v44[0] = @"MigratedFromAndroid";
  v44[1] = @"MigratedFromAndroidToiOSVersion";
  double v12 = +[MKSystem version];
  v45[1] = v12;
  v45[2] = v11;
  float v32 = (void *)v11;
  v44[2] = @"MigratedFromAndroidDeviceType";
  v44[3] = @"MigratedFromAndroidOSVersion";
  uint64_t v13 = [(MKAPIServer *)self client];
  id v14 = [v13 os];
  v45[3] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    CFStringRef v20 = (const __CFString *)*MEMORY[0x263EFFE48];
    CFStringRef v21 = (const __CFString *)*MEMORY[0x263EFFE70];
    CFStringRef v22 = (const __CFString *)*MEMORY[0x263EFFE50];
    double v34 = (const void *)*MEMORY[0x263EFFB40];
    id v33 = (const void *)*MEMORY[0x263EFFB38];
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        CFStringRef v24 = *(const __CFString **)(*((void *)&v35 + 1) + 8 * i);
        v25 = [v16 objectForKeyedSubscript:v24];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v25 BOOLValue]) {
            v26 = v34;
          }
          else {
            v26 = v33;
          }
          CFPreferencesSetValue(v24, v26, v20, v21, v22);
          v27 = +[MKLog log];
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
            goto LABEL_18;
          }
          int v28 = [v25 BOOLValue];
          *(_DWORD *)buf = 138412546;
          CFStringRef v40 = v24;
          __int16 v41 = 1024;
          LODWORD(v42) = v28;
          long long v29 = v27;
          uint64_t v30 = "%@ is set to %d.";
          uint32_t v31 = 18;
          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_19;
        }
        CFPreferencesSetValue(v24, v25, v20, v21, v22);
        v27 = +[MKLog log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v40 = v24;
          __int16 v41 = 2112;
          __int16 v42 = v25;
          long long v29 = v27;
          uint64_t v30 = "%@ is set to %@.";
          uint32_t v31 = 22;
LABEL_17:
          _os_log_impl(&dword_22BFAC000, v29, OS_LOG_TYPE_INFO, v30, buf, v31);
        }
LABEL_18:

LABEL_19:
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v18);
  }
}

+ (void)clean
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "could not delete the workspace. error=%@", (uint8_t *)&v2, 0xCu);
}

intptr_t __20__MKAPIServer_clean__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) importAndWait];
  [*(id *)(a1 + 32) import];
  int v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

+ (void)test
{
  int v2 = objc_alloc_init(MKApplicationMigrator);
  [(MKApplicationMigrator *)v2 purchase2];
}

+ (void)benchmark:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v4 appendString:@"(Internal Only)"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
  CFDictionaryRef v7 = (const __CFDictionary *)v5;
  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v8 = v6;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(v5);
      }
      double v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      [v4 appendString:@"\n"];
      uint64_t v13 = [v12 benchmark];
      [v4 appendString:v13];

      v9 += [v12 count];
    }
    uint64_t v8 = [v5 countByEnumeratingWithState:&v26 objects:v32 count:16];
  }
  while (v8);

  if (v9)
  {
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    uint64_t v15 = *MEMORY[0x263EFFFD8];
    v30[0] = *MEMORY[0x263EFFFC8];
    v30[1] = v15;
    v31[0] = @"Import Complete";
    v31[1] = v4;
    v30[2] = *MEMORY[0x263F00000];
    v31[2] = @"OK";
    CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    CFUserNotificationRef v25 = 0;
    CFUserNotificationRef v25 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, v7);
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    char v23 = 0;
    id v16 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __25__MKAPIServer_benchmark___block_invoke;
    block[3] = &unk_264905F90;
    CFStringRef v20 = v24;
    CFStringRef v21 = v22;
    dispatch_semaphore_t v19 = v14;
    uint64_t v17 = v14;
    dispatch_async(v16, block);

    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
LABEL_10:
  }
}

intptr_t __25__MKAPIServer_benchmark___block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = responseFlags == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)isPhotosBenchmarkEnabled
{
  return +[MKPreferences BOOLForKey:@"enable_photos_benchmark"] == 1;
}

- (MKAPIServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKAPIServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)preferredChannel
{
  return self->_preferredChannel;
}

- (MKClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (MKDiscoverabilitySignals)discoverabilitySignals
{
  return self->_discoverabilitySignals;
}

- (void)setDiscoverabilitySignals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverabilitySignals, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_migrators, 0);
  objc_storeStrong((id *)&self->_simMigrator, 0);
  objc_storeStrong((id *)&self->_diagnosticsMigrator, 0);
  objc_storeStrong((id *)&self->_containerMigrator, 0);
  objc_storeStrong((id *)&self->_placeholderMigrator, 0);
  objc_storeStrong((id *)&self->_fileMigrator, 0);
  objc_storeStrong((id *)&self->_voiceMemoMigrator, 0);
  objc_storeStrong((id *)&self->_photoLibraryAlbumMigrator, 0);
  objc_storeStrong((id *)&self->_photoLibraryVideoMigrator, 0);
  objc_storeStrong((id *)&self->_photoLibraryImageMigrator, 0);
  objc_storeStrong((id *)&self->_calendarMigrator, 0);
  objc_storeStrong((id *)&self->_callHistoryMigrator, 0);
  objc_storeStrong((id *)&self->_contactMigrator, 0);
  objc_storeStrong((id *)&self->_displaySettingMigrator, 0);
  objc_storeStrong((id *)&self->_accessibilitySettingMigrator, 0);
  objc_storeStrong((id *)&self->_applicationMigrator, 0);
  objc_storeStrong((id *)&self->_bookmarkMigrator, 0);
  objc_storeStrong((id *)&self->_messageMigrator, 0);
  objc_storeStrong((id *)&self->_accountMigrator, 0);
  objc_storeStrong((id *)&self->_getStatusRouter, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_usb, 0);
  objc_storeStrong((id *)&self->_https, 0);
  objc_storeStrong((id *)&self->_http, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
}

@end