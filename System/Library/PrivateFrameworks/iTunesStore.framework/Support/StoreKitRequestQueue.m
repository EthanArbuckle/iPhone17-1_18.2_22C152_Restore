@interface StoreKitRequestQueue
+ (id)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (StoreKitRequestQueue)init;
- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5;
- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6;
- (void)requestProductsWithMessage:(id)a3 connection:(id)a4;
@end

@implementation StoreKitRequestQueue

- (StoreKitRequestQueue)init
{
  v4.receiver = self;
  v4.super_class = (Class)StoreKitRequestQueue;
  v2 = [(RequestQueue *)&v4 init];
  if (v2)
  {
    if (qword_100401CD0 != -1) {
      dispatch_once(&qword_100401CD0, &stru_1003A4358);
    }
    [(RequestQueue *)v2 setOperationQueue:qword_100401CC8];
  }
  return v2;
}

+ (void)setSharedInstance:(id)a3
{
  if ((id)qword_100401CC0 != a3)
  {

    qword_100401CC0 = (uint64_t)a3;
  }
}

+ (id)sharedInstance
{
  id result = (id)qword_100401CC0;
  if (!qword_100401CC0)
  {
    id result = objc_alloc_init((Class)a1);
    qword_100401CC0 = (uint64_t)result;
  }
  return result;
}

- (void)requestProductsWithMessage:(id)a3 connection:(id)a4
{
  objc_opt_class();
  CFDictionaryRef v7 = sub_100174DC8(a3, "1");
  v8 = [[LoadMicroPaymentProductsOperation alloc] initWithProductIdentifiers:v7];
  if ((SSXPCConnectionHasEntitlement() & 1) == 0 && !SSXPCConnectionHasEntitlement()
    || (id v9 = objc_alloc((Class)sub_100174E00()),
        (id v10 = objc_msgSend(v9, "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "2"))) == 0)
    || (v11 = v10,
        v12 = objc_alloc_init(StoreKitClientIdentity),
        [(StoreKitClientIdentity *)v12 setValuesWithPaymentQueueClient:v11],
        v11,
        !v12))
  {
    v13 = [[XPCClient alloc] initWithInputConnection:a4];
    v12 = objc_alloc_init(StoreKitClientIdentity);
    [(StoreKitClientIdentity *)v12 setBundleIdentifier:[(XPCClient *)v13 clientIdentifier]];
    [(StoreKitClientIdentity *)v12 setSandboxed:[(XPCClient *)v13 isAppleSigned] ^ 1];
  }
  [(LoadMicroPaymentProductsOperation *)v8 setClientIdentity:v12];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004FEDC;
  v14[3] = &unk_1003A4310;
  v14[4] = v8;
  [(StoreKitRequestQueue *)self addOperation:v8 forMessage:a3 connection:a4 replyBlock:v14];
}

- (void)addOperation:(id)a3 forClient:(id)a4 withMessageBlock:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004FFE0;
  v6[3] = &unk_1003A4338;
  v6[4] = a5;
  v5.receiver = self;
  v5.super_class = (Class)StoreKitRequestQueue;
  [(RequestQueue *)&v5 addOperation:a3 forClient:a4 withMessageBlock:v6];
}

- (void)addOperation:(id)a3 forMessage:(id)a4 connection:(id)a5 replyBlock:(id)a6
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000500CC;
  v7[3] = &unk_1003A4338;
  v7[4] = a6;
  v6.receiver = self;
  v6.super_class = (Class)StoreKitRequestQueue;
  [(RequestQueue *)&v6 addOperation:a3 forMessage:a4 connection:a5 replyBlock:v7];
}

@end