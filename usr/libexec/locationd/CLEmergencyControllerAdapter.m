@interface CLEmergencyControllerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLEmergencyControllerAdapter)init;
- (void)beginService;
- (void)callEventHandler:(id)a3;
- (void)checkEmergencyCallStatus;
- (void)endService;
- (void)getEEDCloakingKeyWithReply:(id)a3;
- (void)getEEDEmergencyContactNamesWithReply:(id)a3;
- (void)interactiveStateChangedNotification:(id)a3;
- (void)onCLEmergencyEnablementAssertion:(BOOL)a3;
- (void)shouldDisplayEEDUIWithReply:(id)a3;
- (void)startMonitoringEmergencyState:(id)a3;
- (void)stopMonitoringEmergencyState:(id)a3;
@end

@implementation CLEmergencyControllerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102482980 != -1) {
    dispatch_once(&qword_102482980, &stru_10230B538);
  }
  return (id)qword_102482978;
}

+ (BOOL)isSupported
{
  if (qword_102482990 != -1) {
    dispatch_once(&qword_102482990, &stru_10230B558);
  }
  return (byte_102482988 & 1) == 0;
}

- (CLEmergencyControllerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLEmergencyControllerAdapter;
  return [(CLEmergencyControllerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLEmergencyControllerProtocol outboundProtocol:&OBJC_PROTOCOL___CLEmergencyClientProtocol];
}

- (void)beginService
{
}

- (void)endService
{
  qword_10248B158 = 0;
  uint64_t v2 = qword_10248B150;
  sub_10101B250(qword_10248B150, 0);
  uint64_t v3 = *(void *)(v2 + 552);

  __CTServerConnectionSendBarrier(v3, &stru_10230B578);
}

- (void)startMonitoringEmergencyState:(id)a3
{
}

- (void)stopMonitoringEmergencyState:(id)a3
{
}

- (void)onCLEmergencyEnablementAssertion:(BOOL)a3
{
}

- (void)shouldDisplayEEDUIWithReply:(id)a3
{
  uint64_t v4 = sub_101479BAC(*(void *)(qword_10248B150 + 688));
  unint64_t v5 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)getEEDCloakingKeyWithReply:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v4 = sub_101479D94(*(void *)(qword_10248B150 + 688), &v5);
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v5, v4);
}

- (void)getEEDEmergencyContactNamesWithReply:(id)a3
{
  uint64_t v5 = 0;
  uint64_t v4 = sub_101479D9C(*(void *)(qword_10248B150 + 688), &v5);
  (*((void (**)(id, uint64_t, uint64_t))a3 + 2))(a3, v5, v4);
}

- (void)callEventHandler:(id)a3
{
  if (a3)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_101015684;
    v3[3] = &unk_10229FEB0;
    v3[4] = a3;
    v3[5] = self;
    [objc_msgSend(-[CLEmergencyControllerAdapter universe](self, "universe"), "silo") async:v3];
  }
}

- (void)checkEmergencyCallStatus
{
  id v2 = [(id)qword_10248B158 currentCalls];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(v2);
      }
      v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
      if (v7)
      {
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) isEmergency]) {
          break;
        }
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v7 = 0;
  }
  sub_101015CB0(qword_10248B150, v7);
}

- (void)interactiveStateChangedNotification:(id)a3
{
}

@end