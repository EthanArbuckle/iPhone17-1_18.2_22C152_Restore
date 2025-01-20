@interface WCM_AriCoexCommandDriver
+ (id)singleton;
- (WCM_AriCoexCommandDriver)init;
- (void)connectBaseband;
- (void)createCommandHandlerForAriVersion:(unsigned int)a3;
- (void)handleEvent:(id)a3;
- (void)handleRc1DynamicPolicy:(id)a3 SubId:(unsigned int)a4;
- (void)setAntennaBlockingPolicyForPlatformId:(unint64_t)a3 activeSubId:(unint64_t)a4;
- (void)setCellularController:(id)a3;
@end

@implementation WCM_AriCoexCommandDriver

+ (id)singleton
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = dlopen("/usr/lib/libARI.dylib", 1);
  v4 = dlopen("/usr/lib/libICEClient.dylib", 1);
  id v5 = 0;
  if (v3 && v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B5030;
    block[3] = &unk_10020DB30;
    block[4] = v2;
    if (qword_10027D148 != -1) {
      dispatch_once(&qword_10027D148, block);
    }
    id v5 = (id)qword_10027D140;
  }
  objc_sync_exit(v2);

  return v5;
}

- (WCM_AriCoexCommandDriver)init
{
  v7.receiver = self;
  v7.super_class = (Class)WCM_AriCoexCommandDriver;
  id v2 = [(WCM_AriCoexCommandDriver *)&v7 init];
  v3 = v2;
  if (v2)
  {
    mAriCoexCommandHandler = v2->mAriCoexCommandHandler;
    v2->mAriCoexCommandHandler = 0;

    mCellularController = v3->mCellularController;
    v3->mCellularController = 0;
  }
  return v3;
}

- (void)createCommandHandlerForAriVersion:(unsigned int)a3
{
  if (a3 == 2)
  {
    v4 = WCM_AriCoexCommandHandlerV2;
  }
  else
  {
    if (a3 != 1)
    {
      mAriCoexCommandHandler = self->mAriCoexCommandHandler;
      self->mAriCoexCommandHandler = 0;
      goto LABEL_7;
    }
    v4 = WCM_AriCoexCommandHandler;
  }
  id v5 = (WCM_AriCoexCommandHandler *)objc_alloc_init(v4);
  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  self->mAriCoexCommandHandler = v5;
LABEL_7:

  objc_super v7 = self->mAriCoexCommandHandler;
  if (v7 && self->mCellularController)
  {
    -[WCM_AriCoexCommandHandler setCellularController:](v7, "setCellularController:");
  }
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  id v6 = v4;
  if (mAriCoexCommandHandler) {
    [(WCM_AriCoexCommandHandler *)mAriCoexCommandHandler handleEvent:v4];
  }
  else {
    +[WCM_Logging logLevel:0 message:@"Error: ARI driver handle event -- WCM_AriCoexCommandHandler is NULL..."];
  }
}

- (void)setCellularController:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->mCellularController, a3);
  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  if (mAriCoexCommandHandler) {
    [(WCM_AriCoexCommandHandler *)mAriCoexCommandHandler setCellularController:v6];
  }
  else {
    +[WCM_Logging logLevel:0 message:@"Warning: ARI driver set cellular controller-- WCM_AriCoexCommandHandler is NULL. Will set it later..."];
  }
}

- (void)connectBaseband
{
  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  if (mAriCoexCommandHandler) {
    [(WCM_AriCoexCommandHandler *)mAriCoexCommandHandler connectBaseband];
  }
  else {
    +[WCM_Logging logLevel:0 message:@"Error: ARI driver connect baseband -- WCM_AriCoexCommandHandler is NULL..."];
  }
}

- (void)handleRc1DynamicPolicy:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  id v8 = v6;
  if (mAriCoexCommandHandler) {
    [(WCM_AriCoexCommandHandler *)mAriCoexCommandHandler handleRc1DynamicPolicy:v6 SubId:v4];
  }
  else {
    +[WCM_Logging logLevel:0 message:@"Error: ARI driver set RC1 policy -- WCM_AriCoexCommandHandler is NULL..."];
  }
}

- (void)setAntennaBlockingPolicyForPlatformId:(unint64_t)a3 activeSubId:(unint64_t)a4
{
  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  if (mAriCoexCommandHandler) {
    [(WCM_AriCoexCommandHandler *)mAriCoexCommandHandler setAntennaBlockingPolicyForPlatformId:a3 activeSubId:a4];
  }
  else {
    +[WCM_Logging logLevel:0 message:@"Error: ARI driver set antenna blocking policy -- WCM_AriCoexCommandHandler is NULL..."];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCellularController, 0);

  objc_storeStrong((id *)&self->mAriCoexCommandHandler, 0);
}

@end