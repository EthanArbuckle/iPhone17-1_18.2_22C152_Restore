@interface SDAirDropReceiveManager
- (NSString)description;
- (SDAirDropAlertManagerProtocol)alertManager;
- (SDAirDropReceiveManager)init;
- (void)alertManager:(id)a3 acceptingTransferWithRecordID:(id)a4 withDestinationURL:(id)a5 shouldExtractMediaFromPhotosBundlesForRecordID:(BOOL)a6;
- (void)alertManager:(id)a3 cancelingTransferWithRecordID:(id)a4 withFailureReason:(unint64_t)a5;
- (void)listener:(id)a3 didReceiveError:(id)a4;
- (void)listener:(id)a3 didReceiveNewRequest:(id)a4;
- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)setAlertManager:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDAirDropReceiveManager

- (SDAirDropReceiveManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SDAirDropReceiveManager;
  v2 = [(SDAirDropReceiveManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    listener = v2->_listener;
    v2->_listener = 0;

    uint64_t v5 = objc_opt_new();
    transferIdentifierToNetworkOperation = v3->_transferIdentifierToNetworkOperation;
    v3->_transferIdentifierToNetworkOperation = (NSMutableDictionary *)v5;
  }
  return v3;
}

- (void)start
{
  if (!self->_listener)
  {
    v3 = objc_alloc_init(SDAirDropListener);
    listener = self->_listener;
    self->_listener = v3;

    [(SDAirDropListener *)self->_listener setDelegate:self];
    [(SDAirDropListener *)self->_listener start];
    id v7 = +[SDStatusMonitor sharedMonitor];
    if ([v7 enableDebugMode])
    {
      int v5 = IsAppleInternalBuild();

      if (!v5) {
        return;
      }
      v6 = +[SDAirDropFakeTransfer sharedFakeTransfer];
      [v6 setTransferManager:self->_alertManager];

      id v7 = +[SDAirDropFakeTransfer sharedFakeTransfer];
      [v7 setDebugModeEnabled:1];
    }
  }
}

- (void)stop
{
  listener = self->_listener;
  if (listener)
  {
    [(SDAirDropListener *)listener setDelegate:0];
    [(SDAirDropListener *)self->_listener stop];
    v4 = self->_listener;
    self->_listener = 0;

    id v6 = +[SDStatusMonitor sharedMonitor];
    if ([v6 enableDebugMode])
    {
      int v5 = IsAppleInternalBuild();

      if (!v5) {
        return;
      }
      id v6 = +[SDAirDropFakeTransfer sharedFakeTransfer];
      [v6 setDebugModeEnabled:0];
    }
  }
}

- (void)listener:(id)a3 didReceiveNewRequest:(id)a4
{
  id v5 = a4;
  id v6 = [v5 objectKey];
  id v7 = airdrop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000CEF50();
  }

  [(NSMutableDictionary *)self->_transferIdentifierToNetworkOperation setObject:v5 forKeyedSubscript:v6];
  [v5 setDelegate:self];
  [v5 resume];
}

- (void)listener:(id)a3 didReceiveError:(id)a4
{
  id v4 = a4;
  id v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000CEFD0((uint64_t)v4, v5);
  }
}

- (void)networkOperation:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 objectKey];
  if (a4 == 7)
  {
LABEL_2:
    v11 = airdrop_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000CF048((uint64_t)v10, v9, v11);
    }

    [(SDAirDropAlertManagerProtocol *)self->_alertManager progressEventForRecordID:v10 withResults:v9];
  }
  else
  {
    v12 = airdrop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(a4 - 1) > 0xE) {
        CFStringRef v13 = @"?";
      }
      else {
        CFStringRef v13 = *(&off_1008CC9F8 + a4 - 1);
      }
      int v19 = 138412546;
      CFStringRef v20 = v13;
      __int16 v21 = 2112;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "SDAirDropReceiveManager: Received event %@ for transfer %@", (uint8_t *)&v19, 0x16u);
    }

    switch(a4)
    {
      case 2:
        [(SDAirDropAlertManagerProtocol *)self->_alertManager askEventForRecordID:v10 withResults:v9];
        break;
      case 4:
        [(SDAirDropAlertManagerProtocol *)self->_alertManager cancelEventForRecordID:v10 withResults:v9];
        [(NSMutableDictionary *)self->_transferIdentifierToNetworkOperation removeObjectForKey:v10];
        [v8 invalidate];
        break;
      case 5:
      case 6:
      case 8:
      case 13:
        break;
      case 7:
        goto LABEL_2;
      case 9:
        [(SDAirDropAlertManagerProtocol *)self->_alertManager finishedEventForRecordID:v10 withResults:v9];
        [(NSMutableDictionary *)self->_transferIdentifierToNetworkOperation removeObjectForKey:v10];
        break;
      case 10:
        v15 = [v9 objectForKeyedSubscript:kSFOperationErrorKey];
        id v16 = [v15 code];
        v17 = [v15 domain];
        if ((![v17 isEqual:NSPOSIXErrorDomain] || v16 != (id)89)
          && (![v17 isEqual:NSOSStatusErrorDomain] || v16 != (id)-128))
        {
          v18 = airdrop_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            sub_1000CF20C();
          }

          [(SDAirDropAlertManagerProtocol *)self->_alertManager errorEventForRecordID:v10 withResults:v9];
        }
        [(NSMutableDictionary *)self->_transferIdentifierToNetworkOperation removeObjectForKey:v10];
        [v8 invalidate];

        break;
      default:
        v14 = airdrop_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000CF158(a4, (uint64_t)v9, v14);
        }

        break;
    }
  }
}

- (void)alertManager:(id)a3 acceptingTransferWithRecordID:(id)a4 withDestinationURL:(id)a5 shouldExtractMediaFromPhotosBundlesForRecordID:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  v10 = [(NSMutableDictionary *)self->_transferIdentifierToNetworkOperation objectForKeyedSubscript:a4];
  if (v10)
  {
    if (v9)
    {
      uint64_t v11 = kSFOperationDestinationURLKey;
      v16[0] = kSFOperationDestinationURLKey;
      v17[0] = v9;
      v12 = [v9 absoluteString];
      v16[1] = v12;
      CFStringRef v13 = +[NSNull null];
      v17[1] = v13;
      v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

      [v10 setProperty:v14 forKey:v11];
    }
    v15 = +[NSNumber numberWithBool:v6];
    [v10 setProperty:v15 forKey:kSFOperationExtractPhotosBundleMediaKey];

    [v10 resume];
  }
}

- (void)alertManager:(id)a3 cancelingTransferWithRecordID:(id)a4 withFailureReason:(unint64_t)a5
{
  id v7 = a4;
  BOOL v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_transferIdentifierToNetworkOperation, "objectForKeyedSubscript:");
  if (v6)
  {
    [(NSMutableDictionary *)self->_transferIdentifierToNetworkOperation removeObjectForKey:v7];
    [v6 invalidate];
  }
}

- (NSString)description
{
  listener = self->_listener;
  if (listener)
  {
    id v5 = [(SDAirDropListener *)listener description];
    NSAppendPrintF();
    id v3 = 0;
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (SDAirDropAlertManagerProtocol)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertManager, 0);
  objc_storeStrong((id *)&self->_transferIdentifierToNetworkOperation, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end