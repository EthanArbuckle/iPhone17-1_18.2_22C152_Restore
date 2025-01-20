@interface WCM_FTController
- (BOOL)getFTState;
- (WCM_FTController)init;
- (id)description;
- (unint64_t)currentBitRate;
- (unint64_t)currentCallTargetBitRate;
- (void)dealloc;
- (void)getFaceTimeCallConfig;
- (void)handleFaceTimeCallConfig:(id)a3;
- (void)handleMessage:(id)a3;
- (void)setCurrentBitRate:(unint64_t)a3;
- (void)setCurrentCallTargetBitRate:(unint64_t)a3;
- (void)updateFTRate:(unint64_t)a3;
@end

@implementation WCM_FTController

- (WCM_FTController)init
{
  v3.receiver = self;
  v3.super_class = (Class)WCM_FTController;
  result = [(WCM_Controller *)&v3 init];
  *(unint64_t *)((char *)&result->_currentCallTargetBitRate + 4) = 0;
  *(void *)(&result->super.mProcessId + 1) = 0;
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WCM_FTController;
  [(WCM_Controller *)&v2 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"FT Current Bit Rates Target: %lld", [(WCM_FTController *)self currentCallTargetBitRate]];
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 == 200)
  {
    [(WCM_FTController *)self handleFaceTimeCallConfig:a3];
  }
  else
  {
    +[WCM_Logging logLevel:0, @"Unknown FT Message id: %lld", uint64 message];
  }
}

- (void)handleFaceTimeCallConfig:(id)a3
{
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value) {
    [(WCM_FTController *)self setCurrentCallTargetBitRate:xpc_dictionary_get_uint64(value, "kWCMFTCallConfig_TargetBitRate")];
  }
  +[WCM_Logging logLevel:2, @"FT Current Bit RateTarget: %lld", [(WCM_FTController *)self currentCallTargetBitRate] message];
  id v5 = +[WCM_PolicyManager singleton];

  [v5 updateControllerState:200];
}

- (void)updateFTRate:(unint64_t)a3
{
  if ([(WCM_FTController *)self currentBitRate] == a3)
  {
    +[WCM_Logging logLevel:4, @"Already at FT Rate :%lld", a3 message];
  }
  else
  {
    [(WCM_FTController *)self setCurrentBitRate:a3];
    +[WCM_Logging logLevel:2, @"Modulating FT data rate to %lld", a3 message];
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_uint64(v5, "kWCMFTCallConfig_BitrateCapability", a3);
      xpc_dictionary_set_uint64(v6, "kWCMFTCallConfig_InterferenceLevel", 0);
      [(WCM_Controller *)self sendMessage:1101 withArgs:v6];
      xpc_release(v6);
    }
  }
}

- (void)getFaceTimeCallConfig
{
  +[WCM_Logging logLevel:3 message:@"Asking for FT data rate"];

  [(WCM_Controller *)self sendMessage:1100 withArgs:0];
}

- (BOOL)getFTState
{
  return 1;
}

- (unint64_t)currentCallTargetBitRate
{
  return *(void *)(&self->super.mProcessId + 1);
}

- (void)setCurrentCallTargetBitRate:(unint64_t)a3
{
  *(void *)(&self->super.mProcessId + 1) = a3;
}

- (unint64_t)currentBitRate
{
  return *(unint64_t *)((char *)&self->_currentCallTargetBitRate + 4);
}

- (void)setCurrentBitRate:(unint64_t)a3
{
  *(unint64_t *)((char *)&self->_currentCallTargetBitRate + 4) = a3;
}

@end