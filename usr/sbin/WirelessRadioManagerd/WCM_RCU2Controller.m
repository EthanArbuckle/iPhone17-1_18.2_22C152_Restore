@interface WCM_RCU2Controller
- (BOOL)mRCU2PowerOn;
- (WCM_CtrXPCClient)threadClient;
- (WCM_RCU2Controller)init;
- (id)getRC2BTTimingParam;
- (id)getRC2CoexMode;
- (id)getRC2PMProtectionMode;
- (id)getRC2WiFiTimingParam;
- (unint64_t)mRCU2ChannelActivity;
- (unsigned)mRCU2ChannelNum;
- (void)dealloc;
- (void)setMRCU2ChannelActivity:(unint64_t)a3;
- (void)setMRCU2ChannelNum:(unsigned int)a3;
- (void)setMRCU2PowerOn:(BOOL)a3;
- (void)setThreadClient:(id)a3;
- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4;
@end

@implementation WCM_RCU2Controller

- (WCM_CtrXPCClient)threadClient
{
  return *(WCM_CtrXPCClient **)((char *)&self->_mRCU2ChannelActivity + 4);
}

- (WCM_RCU2Controller)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_RCU2Controller;
  v2 = [(WCM_Controller *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *((unsigned char *)&v2->super.mProcessId + 4) = 0;
    *(_DWORD *)&v2->_mRCU2PowerOn = 0;
  }
  +[WCM_Logging logLevel:2 message:@"RCU2Controller Init"];
  return v3;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:2 message:@"RCU2Controller Dealloc"];
  v3.receiver = self;
  v3.super_class = (Class)WCM_RCU2Controller;
  [(WCM_Controller *)&v3 dealloc];
}

- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4
{
}

- (id)getRC2CoexMode
{
  return 0;
}

- (id)getRC2PMProtectionMode
{
  return 0;
}

- (id)getRC2WiFiTimingParam
{
  return 0;
}

- (id)getRC2BTTimingParam
{
  return 0;
}

- (BOOL)mRCU2PowerOn
{
  return *((unsigned char *)&self->super.mProcessId + 4);
}

- (void)setMRCU2PowerOn:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 4) = a3;
}

- (unsigned)mRCU2ChannelNum
{
  return *(_DWORD *)&self->_mRCU2PowerOn;
}

- (void)setMRCU2ChannelNum:(unsigned int)a3
{
  *(_DWORD *)&self->_mRCU2PowerOn = a3;
}

- (unint64_t)mRCU2ChannelActivity
{
  return *(void *)&self->_mRCU2ChannelNum;
}

- (void)setMRCU2ChannelActivity:(unint64_t)a3
{
  *(void *)&self->_mRCU2ChannelNum = a3;
}

- (void)setThreadClient:(id)a3
{
}

@end