@interface FMDRealDeviceIdentity
+ (id)sharedInstance;
- (FMDRealDeviceIdentity)init;
- (OS_dispatch_queue)reissueUCRTQueue;
- (void)attestSigningRequest:(id)a3 completion:(id)a4;
- (void)setReissueUCRTQueue:(id)a3;
@end

@implementation FMDRealDeviceIdentity

+ (id)sharedInstance
{
  if (qword_10031EB60 != -1) {
    dispatch_once(&qword_10031EB60, &stru_1002DC5A0);
  }
  v2 = (void *)qword_10031EB58;

  return v2;
}

- (FMDRealDeviceIdentity)init
{
  v6.receiver = self;
  v6.super_class = (Class)FMDRealDeviceIdentity;
  v2 = [(FMDRealDeviceIdentity *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("FMDReissueUCRTQueue", 0);
    reissueUCRTQueue = v2->_reissueUCRTQueue;
    v2->_reissueUCRTQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)attestSigningRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)FMDDeviceIdentityFactory);
  [v7 baaIdentityAttestationForSigningRequest:v6 completion:v5];
}

- (OS_dispatch_queue)reissueUCRTQueue
{
  return self->_reissueUCRTQueue;
}

- (void)setReissueUCRTQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end