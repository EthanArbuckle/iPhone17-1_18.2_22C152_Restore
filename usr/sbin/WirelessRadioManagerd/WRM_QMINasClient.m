@interface WRM_QMINasClient
- (BOOL)qmiClientRunning;
- (WRM_QMINasClient)initWithSub:(int64_t)a3;
- (id).cxx_construct;
- (void)bindQMIClientToSlotType:(int64_t)a3;
- (void)dealloc;
- (void)errored;
- (void)initNewClient;
- (void)notifyAVStatus:(unsigned __int8)a3 :(unsigned __int16)a4;
- (void)notifyBBCallState:(unsigned __int8)a3 :(unsigned __int8)a4 :(unsigned __int8)a5 :(unsigned __int8)a6;
- (void)notifyBBLockState:(unsigned __int8)a3 :(unsigned __int8)a4;
- (void)notifyFTDupelicationState:(unsigned __int8)a3;
- (void)notifyStreamingEBHState:(unsigned __int8)a3;
- (void)querySignalSinr;
- (void)registerQmiIndHandler;
- (void)sendNasConfigSigInfo2Request;
- (void)sendNasIndicationRegister;
- (void)sendSisNrAvailableRequest;
- (void)sendWrmSdmLocationDbInfo:(int64_t)a3 dbAvailable:(BOOL)a4 mcc:(unsigned int)a5 mnc:(unsigned int)a6 cellId:(unint64_t)a7;
- (void)setBBSAState:(BOOL)a3 :(unsigned __int8)a4;
- (void)setHandlerLocationDbInfo;
- (void)setHandlerNasSigInfoInd;
- (void)setHandlerNasVoiceLqmInd;
- (void)setHandlerSisNrAvailableInfoInd;
- (void)setWrmSdmLocationDbPushOneEntryForCellType:(int64_t)a3 cellType:(int)a4 anchorCellBandwidth:(unsigned int)a5 mmWavePresent:(BOOL)a6 downlinkThroughput:(unsigned int)a7 sampleCount:(unsigned int)a8 deploymentCount:(unsigned int)a9;
- (void)start;
- (void)started;
- (void)stop;
- (void)stopped;
@end

@implementation WRM_QMINasClient

- (WRM_QMINasClient)initWithSub:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WRM_QMINasClient;
  v4 = [(WRM_QMINasClient *)&v7 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.WirelessRadioManager.QMINasClient", 0);
    v4->mQueue = (OS_dispatch_queue *)v5;
    if (!v5)
    {
      +[WCM_Logging logLevel:16 message:@"QMI: failed to create the client queue, use main_queue instead."];
      v4->mQueue = (OS_dispatch_queue *)&_dispatch_main_q;
    }
    v4->mSub = a3;
    [(WRM_QMINasClient *)v4 initNewClient];
    v4->mQmiClientRunning = 0;
    v4->mIsEnhancedSisSupported = 0;
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
    [(WRM_QMINasClient *)self stop];
    qmi::Client::release((qmi::Client *)self->mClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)WRM_QMINasClient;
  [(WRM_QMINasClient *)&v4 dealloc];
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

- (void)registerQmiIndHandler
{
  [(WRM_QMINasClient *)self bindQMIClientToSlotType:self->mSub];
  [(WRM_QMINasClient *)self sendNasIndicationRegister];
  [(WRM_QMINasClient *)self sendNasConfigSigInfo2Request];
  [(WRM_QMINasClient *)self setHandlerNasSigInfoInd];
  [(WRM_QMINasClient *)self setHandlerNasVoiceLqmInd];
  [(WRM_QMINasClient *)self setHandlerSisNrAvailableInfoInd];

  [(WRM_QMINasClient *)self setHandlerLocationDbInfo];
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
  id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getCTService];
  self->mIsEnhancedSisSupported = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") isEnhancedSisSupported];
  +[WCM_Logging logLevel:22, @"QMI.NAS.%d: client started.\n", self->mSub message];
  [(WRM_QMINasClient *)self registerQmiIndHandler];
  +[WCM_Logging logLevel:22, @"QMI.NAS.%d: client register sig info.\n", self->mSub message];
  self->mQmiClientRunning = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A6558;
  block[3] = &unk_10020DAB0;
  block[4] = v3;
  block[5] = self;
  dispatch_async([+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getQueue], block);
}

- (void)stopped
{
  id v3 = [[+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getCTService];
  +[WCM_Logging logLevel:22, @"QMI.NAS.%d: client stopped.\n", self->mSub message];
  self->mQmiClientRunning = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A6684;
  block[3] = &unk_10020DAB0;
  block[4] = v3;
  block[5] = self;
  dispatch_async([+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") getQueue], block);
}

- (void)errored
{
}

- (void)sendNasIndicationRegister
{
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v10, 3u);
  *sub_1000AB364((uint64_t)v10, 25) = 1;
  *sub_1000AB61C((uint64_t)v10, 224) = 1;
  if (self->mIsEnhancedSisSupported) {
    *sub_1000AB8D4((uint64_t)v10, 225) = 1;
  }
  *sub_1000ABB8C((uint64_t)v10, 226) = 1;
  v5[5] = self->mClient;
  uint64_t v6 = QMIServiceMsg::create((QMIServiceMsg *)v10, v3);
  int v7 = 25000;
  uint64_t v8 = 0;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A6864;
  v5[3] = &unk_10020E778;
  v5[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000ABE44;
  aBlock[3] = &unk_10020E918;
  aBlock[4] = v5;
  objc_super v4 = _Block_copy(aBlock);
  v9 = v4;
  if (v6)
  {
    qmi::Client::send();
    objc_super v4 = v9;
  }
  if (v4) {
    _Block_release(v4);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v10);
}

- (void)sendSisNrAvailableRequest
{
  if (self->mClient && self->mIsEnhancedSisSupported)
  {
    qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v10, 0x5570u);
    +[WCM_Logging logLevel:22, @"QMI.NAS.%d: nas::SisNrAvailable::Request sent.", self->mSub message];
    v5[5] = self->mClient;
    uint64_t v6 = QMIServiceMsg::create((QMIServiceMsg *)v10, v3);
    int v7 = 25000;
    uint64_t v8 = 0;
    v9 = 0;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000A6A50;
    v5[3] = &unk_10020E778;
    v5[4] = self;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1000ABFE4;
    aBlock[3] = &unk_10020E918;
    aBlock[4] = v5;
    objc_super v4 = _Block_copy(aBlock);
    v9 = v4;
    if (v6)
    {
      qmi::Client::send();
      objc_super v4 = v9;
    }
    if (v4) {
      _Block_release(v4);
    }
    qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v10);
  }
}

- (void)sendNasConfigSigInfo2Request
{
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v19, 0x6Cu);
  id v3 = sub_1000AC184((uint64_t)v19, 34);
  sub_1000A6CE4((uint64_t)v3, (char **)v3);
  objc_super v4 = sub_1000AC5E8((uint64_t)v19, 36);
  sub_1000A6E6C((uint64_t)v4, (char **)v4);
  dispatch_queue_t v5 = sub_1000AC990((uint64_t)v19, 38);
  sub_1000A713C((uint64_t)v5, (char **)v5);
  uint64_t v6 = sub_1000ACD38((uint64_t)v19, 40);
  sub_1000A7414((uint64_t)v6, (char **)v6);
  int v7 = sub_1000AD0E0((uint64_t)v19, 51);
  sub_1000A6E6C((uint64_t)v7, (char **)v7);
  uint64_t v8 = sub_1000AD488((uint64_t)v19, 56);
  sub_1000A713C((uint64_t)v8, (char **)v8);
  v9 = sub_1000AD830((uint64_t)v19, 53);
  sub_1000A7414((uint64_t)v9, (char **)v9);
  v10 = sub_1000ADBD8((uint64_t)v19, 30);
  sub_1000A6CE4((uint64_t)v10, (char **)v10);
  v11 = sub_1000ADF80((uint64_t)v19, 32);
  sub_1000A7ADC((uint64_t)v11, (char **)v11);
  *(_WORD *)sub_1000AE328((uint64_t)v19, 42) = 769;
  *(_WORD *)sub_1000AE5E8((uint64_t)v19, 55) = 769;
  v14[5] = self->mClient;
  uint64_t v15 = QMIServiceMsg::create((QMIServiceMsg *)v19, v12);
  int v16 = 25000;
  uint64_t v17 = 0;
  v18 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A7F04;
  v14[3] = &unk_10020E778;
  v14[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000AE8A8;
  aBlock[3] = &unk_10020E918;
  aBlock[4] = v14;
  v13 = _Block_copy(aBlock);
  v18 = v13;
  if (v15)
  {
    qmi::Client::send();
    v13 = v18;
  }
  if (v13) {
    _Block_release(v13);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v19);
}

- (void)setHandlerNasSigInfoInd
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A811C;
  v5[3] = &unk_10020FF58;
  v5[4] = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton];
  v5[5] = self;
  keys[0] = (char *)_NSConcreteStackBlock;
  keys[1] = (char *)3221225472;
  uint64_t v8 = sub_1000AEE60;
  v9 = &unk_10020E918;
  v10 = v5;
  qmi::Client::setIndHandler();
  if (self->mSub == 1)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    *(_OWORD *)keys = *(_OWORD *)off_10020FF78;
    values[0] = xpc_uint64_create(0x198uLL);
    values[1] = v3;
    xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") updateControllerState:v4];
    xpc_release(values[0]);
    xpc_release(v4);
    xpc_release(v3);
  }
  else
  {
    +[WCM_Logging logLevel:22, @"QMI.NAS.%d: Non primary sub, skip update WRMCoreTelephonyRawLinkQuality", self->mSub message];
  }
}

- (void)setHandlerSisNrAvailableInfoInd
{
  if (self->mClient)
  {
    if (self->mIsEnhancedSisSupported)
    {
      v2[0] = _NSConcreteStackBlock;
      v2[1] = 3221225472;
      v2[2] = sub_1000A87D8;
      v2[3] = &unk_10020E778;
      v2[4] = self;
      v2[5] = _NSConcreteStackBlock;
      v2[6] = 3221225472;
      v2[7] = sub_1000AF104;
      v2[8] = &unk_10020E918;
      v2[9] = v2;
      qmi::Client::setIndHandler();
    }
  }
}

- (void)setHandlerNasVoiceLqmInd
{
  if (self->mSub == 1) {
    qmi::Client::setIndHandler();
  }
}

- (void)bindQMIClientToSlotType:(int64_t)a3
{
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v14, 0x45u);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000A8D64;
  v13[3] = &unk_10020FFF8;
  v13[4] = a3;
  dispatch_queue_t v5 = (BOOL *)sub_1000AF548((uint64_t)v14, 1);
  sub_1000A8D64((uint64_t)v13, v5);
  v8[5] = self->mClient;
  uint64_t v9 = QMIServiceMsg::create((QMIServiceMsg *)v14, v6);
  int v10 = 25000;
  uint64_t v11 = 0;
  v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000A8D78;
  v8[3] = &unk_10020E778;
  v8[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000AF800;
  aBlock[3] = &unk_10020E918;
  aBlock[4] = v8;
  int v7 = _Block_copy(aBlock);
  v12 = v7;
  if (v9)
  {
    qmi::Client::send();
    int v7 = v12;
  }
  if (v7) {
    _Block_release(v7);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v14);
}

- (void)querySignalSinr
{
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v6, 2u);
  *sub_1000AF9A0((uint64_t)v6, 19) = 0;
  *sub_1000AFC60((uint64_t)v6, 20) = 0;
  *sub_1000AFF20((uint64_t)v6, 21) = 0;
  *sub_1000B01E0((uint64_t)v6, 24) = 0;
  *sub_1000B04A0((uint64_t)v6, 27) = 0;
  *sub_1000B0764((uint64_t)v6, 28) = 0;
  uint64_t v4 = QMIServiceMsg::create((QMIServiceMsg *)v6, v2);
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000B0A24;
  aBlock[3] = &unk_10020E918;
  aBlock[4] = &stru_100210018;
  xpc_object_t v3 = _Block_copy(aBlock);
  dispatch_queue_t v5 = v3;
  if (v4)
  {
    qmi::Client::send();
    xpc_object_t v3 = v5;
  }
  if (v3) {
    _Block_release(v3);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v6);
}

- (void)notifyBBCallState:(unsigned __int8)a3 :(unsigned __int8)a4 :(unsigned __int8)a5 :(unsigned __int8)a6
{
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v24, 0x5568u);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000A919C;
  v19[3] = &unk_100210040;
  unsigned __int8 v20 = a3;
  unsigned __int8 v21 = a4;
  unsigned __int8 v22 = a5;
  unsigned __int8 v23 = a6;
  v19[4] = self;
  uint64_t v11 = sub_1000B0BC4((uint64_t)v24, 16);
  sub_1000A919C((uint64_t)v19, v11);
  v14[5] = self->mClient;
  uint64_t v15 = QMIServiceMsg::create((QMIServiceMsg *)v24, v12);
  int v16 = 25000;
  uint64_t v17 = 0;
  v18 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A9208;
  v14[3] = &unk_10020E778;
  v14[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000B0E84;
  aBlock[3] = &unk_10020E918;
  aBlock[4] = v14;
  v13 = _Block_copy(aBlock);
  v18 = v13;
  if (v15)
  {
    qmi::Client::send();
    v13 = v18;
  }
  if (v13) {
    _Block_release(v13);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v24);
}

- (void)notifyBBLockState:(unsigned __int8)a3 :(unsigned __int8)a4
{
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v18, 0x5568u);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A945C;
  v15[3] = &unk_100210068;
  unsigned __int8 v16 = a3;
  unsigned __int8 v17 = a4;
  v15[4] = self;
  int v7 = sub_1000B1024((uint64_t)v18, 17);
  sub_1000A945C((uint64_t)v15, v7);
  v10[5] = self->mClient;
  uint64_t v11 = QMIServiceMsg::create((QMIServiceMsg *)v18, v8);
  int v12 = 25000;
  uint64_t v13 = 0;
  v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A94B4;
  v10[3] = &unk_10020E778;
  v10[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000B0E84;
  aBlock[3] = &unk_10020E918;
  aBlock[4] = v10;
  uint64_t v9 = _Block_copy(aBlock);
  v14 = v9;
  if (v11)
  {
    qmi::Client::send();
    uint64_t v9 = v14;
  }
  if (v9) {
    _Block_release(v9);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v18);
}

- (void)notifyAVStatus:(unsigned __int8)a3 :(unsigned __int16)a4
{
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v18, 0x5568u);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000A9708;
  v15[3] = &unk_100210090;
  unsigned __int8 v17 = a3;
  unsigned __int16 v16 = a4;
  v15[4] = self;
  int v7 = sub_1000B12E4((uint64_t)v18, 18);
  sub_1000A9708((uint64_t)v15, (uint64_t)v7);
  v10[5] = self->mClient;
  uint64_t v11 = QMIServiceMsg::create((QMIServiceMsg *)v18, v8);
  int v12 = 25000;
  uint64_t v13 = 0;
  v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A9760;
  v10[3] = &unk_10020E778;
  v10[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000B0E84;
  aBlock[3] = &unk_10020E918;
  aBlock[4] = v10;
  uint64_t v9 = _Block_copy(aBlock);
  v14 = v9;
  if (v11)
  {
    qmi::Client::send();
    uint64_t v9 = v14;
  }
  if (v9) {
    _Block_release(v9);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v18);
}

- (void)notifyFTDupelicationState:(unsigned __int8)a3
{
  uint64_t v5 = qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v16, 0x5568u);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A99A0;
  v14[3] = &unk_1002100B8;
  unsigned __int8 v15 = a3;
  v14[4] = self;
  uint64_t v6 = sub_1000B15A8(v5, 19);
  sub_1000A99A0((uint64_t)v14, v6);
  v9[5] = self->mClient;
  uint64_t v10 = QMIServiceMsg::create((QMIServiceMsg *)v16, v7);
  int v11 = 25000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A99EC;
  v9[3] = &unk_10020E778;
  v9[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000B0E84;
  aBlock[3] = &unk_10020E918;
  aBlock[4] = v9;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v13 = v8;
  if (v10)
  {
    qmi::Client::send();
    uint64_t v8 = v13;
  }
  if (v8) {
    _Block_release(v8);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v16);
}

- (void)notifyStreamingEBHState:(unsigned __int8)a3
{
  uint64_t v5 = qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v16, 0x5568u);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A9C2C;
  v14[3] = &unk_1002100E0;
  unsigned __int8 v15 = a3;
  v14[4] = self;
  uint64_t v6 = sub_1000B1860(v5, 20);
  sub_1000A9C2C((uint64_t)v14, v6);
  v9[5] = self->mClient;
  uint64_t v10 = QMIServiceMsg::create((QMIServiceMsg *)v16, v7);
  int v11 = 25000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000A9C78;
  v9[3] = &unk_10020E778;
  v9[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000B0E84;
  aBlock[3] = &unk_10020E918;
  aBlock[4] = v9;
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v13 = v8;
  if (v10)
  {
    qmi::Client::send();
    uint64_t v8 = v13;
  }
  if (v8) {
    _Block_release(v8);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v16);
}

- (void)setBBSAState:(BOOL)a3 :(unsigned __int8)a4
{
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v20, 0x556Au);
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isSaAllowedOnWiFiAssociation:", self->mSub))
  {
    +[WCM_Logging logLevel:22, @"QMI.NAS.%d: setBBSAState SaAllowedOnWiFiAssociation", self->mSub message];
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000A9F64;
    v18[3] = &unk_100210108;
    BOOL v19 = a3;
    v18[4] = self;
    int v7 = sub_1000B1B18((uint64_t)v20, 16);
    sub_1000A9F64((uint64_t)v18, v7);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A9FB0;
    v16[3] = &unk_100210130;
    unsigned __int8 v17 = a4;
    v16[4] = self;
    uint64_t v8 = sub_1000B1DD0((uint64_t)v20, 18);
    sub_1000A9FB0((uint64_t)v16, v8);
    v11[5] = self->mClient;
    uint64_t v12 = QMIServiceMsg::create((QMIServiceMsg *)v20, v9);
    int v13 = 25000;
    uint64_t v14 = 0;
    unsigned __int8 v15 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A9FFC;
    v11[3] = &unk_10020E778;
    v11[4] = self;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1000B2088;
    aBlock[3] = &unk_10020E918;
    aBlock[4] = v11;
    uint64_t v10 = _Block_copy(aBlock);
    unsigned __int8 v15 = v10;
    if (v12)
    {
      qmi::Client::send();
      uint64_t v10 = v15;
    }
    if (v10) {
      _Block_release(v10);
    }
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v20);
}

- (void)setHandlerLocationDbInfo
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000AA2EC;
  v12[3] = &unk_10020E778;
  v12[4] = self;
  aBlock = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  unsigned __int8 v15 = sub_1000B232C;
  unsigned __int16 v16 = &unk_10020E918;
  unsigned __int8 v17 = v12;
  qmi::Client::setIndHandler();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000AA3E0;
  v11[3] = &unk_10020E778;
  v11[4] = self;
  aBlock = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  unsigned __int8 v15 = sub_1000B26D4;
  unsigned __int16 v16 = &unk_10020E918;
  unsigned __int8 v17 = v11;
  qmi::Client::setIndHandler();
  +[WCM_Logging logLevel:22, @"QMI.NAS.%d: send nas::WrmSdmLocationDbInfoRegister::Request", self->mSub message];
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v10, 0x556Cu);
  v5[5] = self->mClient;
  uint64_t v6 = QMIServiceMsg::create((QMIServiceMsg *)v10, v3);
  int v7 = 25000;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AA608;
  v5[3] = &unk_10020E778;
  v5[4] = self;
  aBlock = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  unsigned __int8 v15 = sub_1000B2978;
  unsigned __int16 v16 = &unk_10020E918;
  unsigned __int8 v17 = v5;
  uint64_t v4 = _Block_copy(&aBlock);
  uint64_t v9 = v4;
  if (v6)
  {
    qmi::Client::send();
    uint64_t v4 = v9;
  }
  if (v4) {
    _Block_release(v4);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v10);
}

- (void)setWrmSdmLocationDbPushOneEntryForCellType:(int64_t)a3 cellType:(int)a4 anchorCellBandwidth:(unsigned int)a5 mmWavePresent:(BOOL)a6 downlinkThroughput:(unsigned int)a7 sampleCount:(unsigned int)a8 deploymentCount:(unsigned int)a9
{
  mQueue = self->mQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000AA7D4;
  v10[3] = &unk_10020E6A0;
  v10[4] = self;
  int v11 = a4;
  unsigned int v12 = a5;
  BOOL v16 = a6;
  unsigned int v13 = a7;
  unsigned int v14 = a8;
  unsigned int v15 = a9;
  dispatch_async(mQueue, v10);
}

- (void)sendWrmSdmLocationDbInfo:(int64_t)a3 dbAvailable:(BOOL)a4 mcc:(unsigned int)a5 mnc:(unsigned int)a6 cellId:(unint64_t)a7
{
  mQueue = self->mQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000AAB5C;
  v8[3] = &unk_100210310;
  BOOL v11 = a4;
  unsigned int v9 = a5;
  unsigned int v10 = a6;
  v8[4] = self;
  v8[5] = a7;
  dispatch_async(mQueue, v8);
}

- (void).cxx_destruct
{
  begin = self->mLocationDbInfo.sadcCellInfoList.__begin_;
  if (begin)
  {
    self->mLocationDbInfo.sadcCellInfoList.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v4 = self->mLocationDbInfo.saCellInfoList.__begin_;
  if (v4)
  {
    self->mLocationDbInfo.saCellInfoList.__end_ = v4;
    operator delete(v4);
  }
  uint64_t v5 = self->mLocationDbInfo.lteNsaCellInfoList.__begin_;
  if (v5)
  {
    self->mLocationDbInfo.lteNsaCellInfoList.__end_ = v5;
    operator delete(v5);
  }
  uint64_t v6 = self->mLocationDbInfo.lteCellInfoList.__begin_;
  if (v6)
  {
    self->mLocationDbInfo.lteCellInfoList.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  return self;
}

@end