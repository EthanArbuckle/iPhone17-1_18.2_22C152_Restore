@interface CLAccessoryLocationProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLAccessoryLocationProviderAdapter)init;
- (id)syncgetConnectedAccessory;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchAccessoryBitSetWithReply:(id)a3;
- (void)fetchAccessoryPASCDTransmissionStateWithReply:(id)a3;
- (void)fetchIsAccessoryConnectedWithReply:(id)a3;
- (void)syncSetNavigationStateChange:(int)a3;
@end

@implementation CLAccessoryLocationProviderAdapter

- (void)fetchIsAccessoryConnectedWithReply:(id)a3
{
  uint64_t v4 = *((unsigned __int8 *)[(CLAccessoryLocationProviderAdapter *)self adaptee] + 1362);
  v5 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

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
  if (qword_10247D250 != -1) {
    dispatch_once(&qword_10247D250, &stru_1022C5680);
  }
  return (id)qword_10247D248;
}

- (CLAccessoryLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLAccessoryLocationProviderAdapter;
  return [(CLAccessoryLocationProviderAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLAccessoryLocationProviderProtocol outboundProtocol:&OBJC_PROTOCOL___CLAccessoryLocationProviderClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A6C074();
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  uint64_t v4 = [(CLAccessoryLocationProviderAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLAccessoryLocationProviderAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)fetchAccessoryBitSetWithReply:(id)a3
{
  uint64_t v4 = sub_10070B478((uint64_t)[(CLAccessoryLocationProviderAdapter *)self adaptee], 1);
  unint64_t v5 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)fetchAccessoryPASCDTransmissionStateWithReply:(id)a3
{
  HIDWORD(v5) = *((_DWORD *)[(CLAccessoryLocationProviderAdapter *)self adaptee] + 248);
  LODWORD(v5) = HIDWORD(v5) - 68;
  unsigned int v4 = v5 >> 1;
  if (v4 > 7) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = dword_101D2B218[v4];
  }
  v7 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v7(a3, v6);
}

- (void)syncSetNavigationStateChange:(int)a3
{
  if ([(CLAccessoryLocationProviderAdapter *)self adaptee])
  {
    unint64_t v5 = [(CLAccessoryLocationProviderAdapter *)self adaptee];
    sub_10070B6E8((uint64_t)v5, a3);
  }
}

- (id)syncgetConnectedAccessory
{
  return [(id)qword_10247D258 activeAccessory];
}

+ (BOOL)isSupported
{
  if (qword_10247D268 != -1) {
    dispatch_once(&qword_10247D268, &stru_1022C56A0);
  }
  return byte_10247D260;
}

@end