@interface WCM_AirplayController
- (BOOL)mAirplayIsCritical;
- (WCM_AirplayController)init;
- (unsigned)mAirplayCriticalityPercentage;
- (unsigned)mAirplayDuration;
- (void)dealloc;
- (void)handleAirplayCritical:(id)a3;
- (void)handleMessage:(id)a3;
- (void)setMAirplayCriticalityPercentage:(unsigned __int16)a3;
- (void)setMAirplayDuration:(unsigned int)a3;
- (void)setMAirplayIsCritical:(BOOL)a3;
@end

@implementation WCM_AirplayController

- (WCM_AirplayController)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_AirplayController;
  v2 = [(WCM_Controller *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *((unsigned char *)&v2->super.mProcessId + 4) = 0;
    *(_DWORD *)&v2->_mAirplayIsCritical = 0;
    *((_WORD *)&v2->super.mProcessId + 3) = 0;
  }
  +[WCM_Logging logLevel:2 message:@"AirplayController Init"];
  return v3;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:2 message:@"AirplayController Dealloc. Force send critical false."];
  [(WCM_AirplayController *)self setMAirplayIsCritical:0];
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") updateControllerState:1901];
  v3.receiver = self;
  v3.super_class = (Class)WCM_AirplayController;
  [(WCM_Controller *)&v3 dealloc];
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64)
  {
    +[WCM_Logging logLevel:2, @"Received airplay message-id: %lld", uint64 message];
    if (uint64 == 1900)
    {
      [(WCM_AirplayController *)self handleAirplayCritical:a3];
    }
    else
    {
      +[WCM_Logging logLevel:0, @"Airplay controller dropping message-id %lld", uint64 message];
    }
  }
  else
  {
    +[WCM_Logging logLevel:0 message:@"Received empty airplay messageId."];
  }
}

- (void)handleAirplayCritical:(id)a3
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a3, "kMessageArgs");
  [(WCM_AirplayController *)self setMAirplayIsCritical:xpc_dictionary_get_BOOL(dictionary, "kWCMAirplayCritical")];
  if (xpc_dictionary_get_value(dictionary, "kWCMAirplayDuration")) {
    [(WCM_AirplayController *)self setMAirplayDuration:xpc_dictionary_get_uint64(dictionary, "kWCMAirplayDuration")];
  }
  if (xpc_dictionary_get_value(dictionary, "kWCMAirplayCriticalityPercentage")) {
    [(WCM_AirplayController *)self setMAirplayCriticalityPercentage:(unsigned __int16)xpc_dictionary_get_uint64(dictionary, "kWCMAirplayCriticalityPercentage")];
  }
  +[WCM_Logging logLevel:2, @"Received from Airplay Controller critical = (%d) duration (ms) = (%d) criticality percentage = (%d)", [(WCM_AirplayController *)self mAirplayIsCritical], [(WCM_AirplayController *)self mAirplayDuration], [(WCM_AirplayController *)self mAirplayCriticalityPercentage] message];
  id v5 = +[WCM_PolicyManager singleton];

  [v5 updateControllerState:1901];
}

- (BOOL)mAirplayIsCritical
{
  return *((unsigned char *)&self->super.mProcessId + 4);
}

- (void)setMAirplayIsCritical:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 4) = a3;
}

- (unsigned)mAirplayDuration
{
  return *(_DWORD *)&self->_mAirplayIsCritical;
}

- (void)setMAirplayDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_mAirplayIsCritical = a3;
}

- (unsigned)mAirplayCriticalityPercentage
{
  return *((_WORD *)&self->super.mProcessId + 3);
}

- (void)setMAirplayCriticalityPercentage:(unsigned __int16)a3
{
  *((_WORD *)&self->super.mProcessId + 3) = a3;
}

@end