@interface NRDiscoveryClient
- (NSString)description;
- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5;
- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)dataSessionRequestStarted:(id)a3;
- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6;
- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5;
- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6;
- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)publisherStarted:(id)a3;
- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5;
- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4;
- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)subscriberStarted:(id)a3;
@end

@implementation NRDiscoveryClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisementData, 0);
  objc_storeStrong((id *)&self->_wfaNANPeers, 0);
  objc_storeStrong((id *)&self->_wfaSubscriber, 0);
  objc_storeStrong((id *)&self->_wfaPublisher, 0);
  objc_storeStrong((id *)&self->_cbDiscovery, 0);
  objc_storeStrong((id *)&self->_cbAdvertiser, 0);
  objc_storeStrong((id *)&self->_bonjourServiceType, 0);
  objc_storeStrong((id *)&self->_candidateServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_rpSelfIdentity, 0);
  objc_storeStrong((id *)&self->_rpClient, 0);
  objc_storeStrong((id *)&self->_resolvers, 0);
  objc_storeStrong((id *)&self->_browsers, 0);
  objc_storeStrong((id *)&self->_advertisers, 0);
  objc_storeStrong((id *)&self->_initialKeyData, 0);
  objc_storeStrong((id *)&self->_pskDataForAuthTag, 0);
  objc_storeStrong((id *)&self->_advertisingNonceData, 0);
  objc_storeStrong((id *)&self->_advertisingDeviceTypeHash, 0);
  objc_storeStrong((id *)&self->_advertisingAuthTag, 0);
  objc_storeStrong((id *)&self->_advertisingServiceName, 0);
  objc_storeStrong((id *)&self->_nrldmLinkTypesForDiscovery, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
  objc_storeStrong(&self->_deviceChangedBlock, 0);
  objc_storeStrong(&self->_deviceLostBlock, 0);
  objc_storeStrong(&self->_deviceFoundBlock, 0);
  objc_storeStrong((id *)&self->_rapportQueryClients, 0);
  objc_storeStrong((id *)&self->_rapportBrowser, 0);
  objc_storeStrong((id *)&self->_rapportAdvertiser, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_nrUUID, 0);
}

- (void)dataSessionRequestStarted:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001228F4;
  v7[3] = &unk_1001C8840;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100122BE4;
  block[3] = &unk_1001C8368;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100122E5C;
  v9[3] = &unk_1001C8840;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);
}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100123EA8;
  block[3] = &unk_1001C8368;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100124088;
  block[3] = &unk_1001C8868;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100125A28;
  v13[3] = &unk_1001C83E0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unsigned __int8 v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100125D64;
  block[3] = &unk_1001C8368;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100125F0C;
  block[3] = &unk_1001C8368;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)subscriberStarted:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001260A4;
  v7[3] = &unk_1001C8840;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100126268;
  v14[3] = &unk_1001C83B8;
  id v15 = v9;
  unsigned __int8 v16 = self;
  id v17 = v10;
  unsigned int v18 = a5;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(queue, v14);
}

- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100126520;
  v13[3] = &unk_1001C8390;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  int64_t v17 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6
{
  id v14 = a4;
  if (v14)
  {
    id v6 = [[NRNANServiceInfo alloc] initWithData:v14];
    if (v6)
    {
      id v7 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (!IsLevelEnabled)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      id v12 = (void *)_NRCopyLogObjectForNRUUID();
      int v13 = _NRLogIsLevelEnabled();

      if (!v13)
      {
        id v6 = 0;
        goto LABEL_5;
      }
    }
    id v9 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();

    goto LABEL_5;
  }
  id v10 = sub_100122450();
  int v11 = _NRLogIsLevelEnabled();

  if (v11)
  {
    id v6 = (NRNANServiceInfo *)sub_100122450();
    _NRLogWithArgs();
    goto LABEL_5;
  }
LABEL_6:
}

- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126928;
  block[3] = &unk_1001C8368;
  id v10 = v6;
  int v11 = self;
  int64_t v12 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4
{
  id v6 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126AC0;
  block[3] = &unk_1001C8368;
  id v10 = v6;
  int v11 = self;
  int64_t v12 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)publisherStarted:(id)a3
{
  v3 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v5 = (id)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();
  }
}

- (NSString)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"NRDiscoveryClient[%llu, %@]", self->_identifier, self->_candidateServiceIdentifier];

  return (NSString *)v2;
}

@end