@interface UASharedPasteboardDataRequester
- (SFActivityScanner)scanner;
- (SFPeerDevice)peer;
- (void)requestRemotePasteboardInfo:(id)a3;
- (void)requestStreamEndpointData:(id)a3;
- (void)requestStreamEndpointDataV2:(id)a3;
- (void)setPeer:(id)a3;
- (void)setScanner:(id)a3;
@end

@implementation UASharedPasteboardDataRequester

- (void)requestStreamEndpointData:(id)a3
{
  id v4 = a3;
  strcpy(v27, "pbpaste!");
  v5 = +[NSData dataWithBytes:v27 length:8];
  v6 = +[UAUserActivityDefaults sharedDefaults];
  [v6 pasteboardPasteRequestTimeout];
  double v8 = v7;

  v9 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(UASharedPasteboardDataRequester *)self peer];
    v11 = +[NSNumber numberWithDouble:v8];
    *(_DWORD *)buf = 138412546;
    v24 = v10;
    __int16 v25 = 2114;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DATA REQUESTER] Requesting payload from: %@, with timeout: %{public}@", buf, 0x16u);
  }
  v12 = +[UAUserActivityDefaults sharedDefaults];
  [v12 payloadFetchResponseDelay];
  double v14 = v13;

  v15 = +[NSDate dateWithTimeIntervalSinceNow:v14];
  v16 = [(UASharedPasteboardDataRequester *)self scanner];
  v17 = [(UASharedPasteboardDataRequester *)self peer];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004A948;
  v20[3] = &unk_1000C5CC8;
  id v21 = v15;
  id v22 = v4;
  id v18 = v4;
  id v19 = v15;
  [v16 activityPayloadFromDevice:v17 forAdvertisementPayload:v5 command:@"pbpaste" timeout:(uint64_t)v8 withCompletionHandler:v20];
}

- (void)requestStreamEndpointDataV2:(id)a3
{
  id v4 = a3;
  strcpy(v27, "pbpaste!");
  v5 = +[NSData dataWithBytes:v27 length:8];
  v6 = +[UAUserActivityDefaults sharedDefaults];
  [v6 pasteboardPasteRequestTimeout];
  double v8 = v7;

  v9 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(UASharedPasteboardDataRequester *)self peer];
    v11 = +[NSNumber numberWithDouble:v8];
    *(_DWORD *)buf = 138412546;
    v24 = v10;
    __int16 v25 = 2114;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DATA REQUESTER] Requesting payload from: %@, with timeout: %{public}@, version: 2", buf, 0x16u);
  }
  v12 = +[UAUserActivityDefaults sharedDefaults];
  [v12 payloadFetchResponseDelay];
  double v14 = v13;

  v15 = +[NSDate dateWithTimeIntervalSinceNow:v14];
  v16 = [(UASharedPasteboardDataRequester *)self scanner];
  v17 = [(UASharedPasteboardDataRequester *)self peer];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004AD14;
  v20[3] = &unk_1000C5CC8;
  id v21 = v15;
  id v22 = v4;
  id v18 = v4;
  id v19 = v15;
  [v16 activityPayloadFromDevice:v17 forAdvertisementPayload:v5 command:@"pbpaste2" timeout:(uint64_t)v8 withCompletionHandler:v20];
}

- (void)requestRemotePasteboardInfo:(id)a3
{
  id v4 = a3;
  strcpy(v27, "pbtypes!");
  v5 = +[NSData dataWithBytes:v27 length:8];
  v6 = +[UAUserActivityDefaults sharedDefaults];
  [v6 pasteboardTypeRequestTimeout];
  double v8 = v7;

  v9 = sub_10000BA18(@"pasteboard-server");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(UASharedPasteboardDataRequester *)self peer];
    v11 = +[NSNumber numberWithDouble:v8];
    *(_DWORD *)buf = 138412546;
    v24 = v10;
    __int16 v25 = 2114;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DATA REQUESTER] Requesting pbinfo from: %@, with timeout: %{public}@", buf, 0x16u);
  }
  v12 = +[UAUserActivityDefaults sharedDefaults];
  [v12 payloadFetchResponseDelay];
  double v14 = v13;

  v15 = +[NSDate dateWithTimeIntervalSinceNow:v14];
  v16 = [(UASharedPasteboardDataRequester *)self scanner];
  v17 = [(UASharedPasteboardDataRequester *)self peer];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10004B0E0;
  v20[3] = &unk_1000C5CC8;
  id v21 = v15;
  id v22 = v4;
  id v18 = v4;
  id v19 = v15;
  [v16 activityPayloadFromDevice:v17 forAdvertisementPayload:v5 command:@"pbtypes" timeout:(uint64_t)v8 withCompletionHandler:v20];
}

- (SFPeerDevice)peer
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPeer:(id)a3
{
}

- (SFActivityScanner)scanner
{
  return (SFActivityScanner *)objc_getProperty(self, a2, 16, 1);
}

- (void)setScanner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanner, 0);

  objc_storeStrong((id *)&self->_peer, 0);
}

@end