@interface CLPencilStateAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLPencilStateAdapter)init;
- (CLPencilStateAdapter)initWithPencilState:(void *)a3;
- (void)adaptee;
- (void)beginService;
- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7;
- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLPencilStateAdapter

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
  if (qword_102485F60 != -1) {
    dispatch_once(&qword_102485F60, &stru_102317AA8);
  }
  return (id)qword_102485F58;
}

- (CLPencilStateAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLPencilStateAdapter;
  return [(CLPencilStateAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLPencilStateProtocol outboundProtocol:&OBJC_PROTOCOL___CLPencilStateClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101AA5A14();
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
  }
  return result;
}

- (void)doAsync:(id)a3
{
  v4 = [(CLPencilStateAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLPencilStateAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  if (qword_102485F70 != -1) {
    dispatch_once(&qword_102485F70, &stru_102317AC8);
  }
  return byte_102485F68;
}

- (CLPencilStateAdapter)initWithPencilState:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLPencilStateAdapter;
  result = [(CLNotifierServiceAdapter *)&v5 init];
  if (result) {
    result->_pencilState = a3;
  }
  return result;
}

- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7
{
  pencilState = self->_pencilState;
  v8 = (void *)pencilState[5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1011E3D60;
  v9[3] = &unk_1022BBA18;
  v9[4] = pencilState;
  char v10 = 1;
  [v8 async:v9, a4, a5, a6, a7];
}

- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5
{
  pencilState = self->_pencilState;
  v6 = (void *)pencilState[5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1011E3D60;
  v7[3] = &unk_1022BBA18;
  v7[4] = pencilState;
  char v8 = 0;
  [v6 async:v7 a4, a5];
}

@end