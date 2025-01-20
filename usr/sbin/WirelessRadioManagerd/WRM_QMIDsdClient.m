@interface WRM_QMIDsdClient
- (BOOL)qmiClientRunning;
- (WRM_QMIDsdClient)initWithSub:(int64_t)a3;
- (void)bindQMIClientToSlotType:(int)a3;
- (void)dealloc;
- (void)errored;
- (void)handleBandwidthEstimationInd:(Indication *)a3;
- (void)handleDataSystemStatusInd:(Indication *)a3;
- (void)initNewClient;
- (void)sendRegisterIndicationRequest;
- (void)start;
- (void)started;
- (void)stop;
- (void)stopped;
@end

@implementation WRM_QMIDsdClient

- (WRM_QMIDsdClient)initWithSub:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WRM_QMIDsdClient;
  v4 = [(WRM_QMIDsdClient *)&v7 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.WirelessRadioManager.QMIDsdClient", 0);
    v4->mQueue = (OS_dispatch_queue *)v5;
    if (!v5)
    {
      +[WCM_Logging logLevel:16 message:@"QMI.DSD failed to create the DSD client queue, use main_queue instead."];
      v4->mQueue = (OS_dispatch_queue *)&_dispatch_main_q;
    }
    v4->mSub = a3;
    [(WRM_QMIDsdClient *)v4 initNewClient];
    v4->mQmiClientRunning = 0;
    v4->mSlotOneCellID = 0;
    v4->mSlotTwoCellID = 0;
  }
  return v4;
}

- (void)dealloc
{
  mQueue = self->mQueue;
  if (mQueue) {
    dispatch_release(mQueue);
  }
  if (self->mClient)
  {
    [(WRM_QMIDsdClient *)self stop];
    qmi::Client::release((qmi::Client *)self->mClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)WRM_QMIDsdClient;
  [(WRM_QMIDsdClient *)&v4 dealloc];
}

- (void)start
{
  mClient = (qmi::Client *)self->mClient;
  if (mClient) {
    qmi::Client::start(mClient);
  }
}

- (void)stop
{
  mClient = self->mClient;
  if (mClient) {
    qmi::Client::stop(mClient, a2);
  }
}

- (BOOL)qmiClientRunning
{
  return self->mQmiClientRunning;
}

- (void)initNewClient
{
}

- (void)started
{
  +[WCM_Logging logLevel:22 message:@"QMI.DSD client started.\n"];
  if (self->mSub == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(WRM_QMIDsdClient *)self bindQMIClientToSlotType:v3];
  self->mQmiClientRunning = 1;
}

- (void)stopped
{
  id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getCTService];
  +[WCM_Logging logLevel:22 message:@"QMI.DSD client stopped.\n"];
  self->mQmiClientRunning = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005F6EC;
  v4[3] = &unk_10020DAB0;
  v4[4] = v3;
  v4[5] = self;
  dispatch_async([+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getQueue], v4);
}

- (void)errored
{
}

- (void)handleDataSystemStatusInd:(Indication *)a3
{
  +[WCM_Logging logLevel:22 message:@"QMI.DSD client system status report received\n"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005F7B4;
  v5[3] = &unk_10020E778;
  v5[4] = self;
  v6 = v5;
  sub_100061214((qmi::MessageBase *)a3, 16, (unint64_t)&v6);
}

- (void)handleBandwidthEstimationInd:(Indication *)a3
{
  id v5 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
  id v6 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  int v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  +[WCM_Logging logLevel:22 message:@"==========QMI.DSD client Bandwidth Estimation received=========\n"];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005FD18;
  v13[3] = &unk_10020E7A0;
  v13[4] = v14;
  v13[5] = v16;
  v13[6] = &v22;
  v26 = v13;
  sub_100061344((qmi::MessageBase *)a3, 22, (unint64_t)&v26);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005FD88;
  v12[3] = &unk_10020E7C8;
  v12[8] = v14;
  v12[9] = v16;
  v12[4] = self;
  v12[5] = v6;
  v12[10] = v20;
  v12[11] = v18;
  v12[6] = v5;
  v12[7] = &v22;
  v26 = v12;
  sub_100061448((qmi::MessageBase *)a3, 1, (unint64_t)&v26);
  +[WCM_Logging logLevel:22, @"===QMI.DSD.%u Configured Max Bandwidth===\n", *((unsigned __int8 *)v23 + 24) message];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000600E4;
  v11[3] = &unk_10020E7F0;
  v11[4] = v6;
  v11[5] = &v22;
  v26 = v11;
  sub_10006154C((qmi::MessageBase *)a3, 16, &v26);
  +[WCM_Logging logLevel:22, @"===QMI.DSD.%u Downlink Bandwidth Estimation===\n", *((unsigned __int8 *)v23 + 24) message];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000601A0;
  v10[3] = &unk_10020E818;
  v10[5] = v5;
  v10[6] = &v22;
  v10[4] = v6;
  v26 = v10;
  sub_100061650((qmi::MessageBase *)a3, 17, &v26);
  +[WCM_Logging logLevel:22, @"===QMI.DSD.%u Uplink Bandwidth Estimation===\n", *((unsigned __int8 *)v23 + 24) message];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000602D0;
  v9[3] = &unk_10020E840;
  v9[5] = v5;
  v9[6] = &v22;
  v9[4] = v6;
  v26 = v9;
  sub_100061754((qmi::MessageBase *)a3, 18, &v26);
  +[WCM_Logging logLevel:22, @"===QMI.DSD.%u Connected State Summary===\n", *((unsigned __int8 *)v23 + 24) message];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000603D4;
  v8[3] = &unk_10020E868;
  v8[6] = &v22;
  v8[7] = v20;
  v8[4] = v6;
  v8[5] = v5;
  v8[8] = v18;
  v26 = v8;
  sub_100061858((qmi::MessageBase *)a3, 19, (unint64_t)&v26);
  +[WCM_Logging logLevel:22, @"===QMI.DSD.%u RLGS Info===\n", *((unsigned __int8 *)v23 + 24) message];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100060884;
  v7[3] = &unk_10020E890;
  v7[5] = v5;
  v7[6] = &v22;
  v7[4] = v6;
  v26 = v7;
  sub_10006195C((qmi::MessageBase *)a3, 20, (unint64_t)&v26);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
}

- (void)sendRegisterIndicationRequest
{
  +[WCM_Logging logLevel:22 message:@"QMI.DSD send dsd::RegisterIndication::Request\n"];
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v6, 0x38u);
  *sub_100061A60((uint64_t)v6, 161) = 1;
  uint64_t v4 = QMIServiceMsg::create((QMIServiceMsg *)v6, v2);
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_100061D50;
  aBlock[3] = &unk_10020E918;
  aBlock[4] = &stru_10020E8D0;
  id v3 = _Block_copy(aBlock);
  id v5 = v3;
  if (v4)
  {
    qmi::Client::send();
    id v3 = v5;
  }
  if (v3) {
    _Block_release(v3);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v6);
}

- (void)bindQMIClientToSlotType:(int)a3
{
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v15, 0x27u);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100060CC8;
  v13[3] = &unk_10020E8F0;
  int v14 = a3;
  id v5 = sub_100061EF0((uint64_t)v15, 1);
  sub_100060CC8((uint64_t)v13, v5);
  v8[5] = self->mClient;
  uint64_t v9 = QMIServiceMsg::create((QMIServiceMsg *)v15, v6);
  int v10 = 25000;
  uint64_t v11 = 0;
  v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100060CD4;
  v8[3] = &unk_10020E778;
  v8[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000621B0;
  aBlock[3] = &unk_10020E918;
  aBlock[4] = v8;
  objc_super v7 = _Block_copy(aBlock);
  v12 = v7;
  if (v9)
  {
    qmi::Client::send();
    objc_super v7 = v12;
  }
  if (v7) {
    _Block_release(v7);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v15);
}

@end