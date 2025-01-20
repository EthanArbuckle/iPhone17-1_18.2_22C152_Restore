@interface SBSAbstractFacilityService
+ (Class)serviceFacilityClientClass;
- (OS_dispatch_queue)callbackQueue;
- (SBSAbstractFacilityService)init;
- (SBSServiceFacilityClient)client;
- (void)dealloc;
@end

@implementation SBSAbstractFacilityService

- (void)dealloc
{
  +[SBSServiceFacilityClient checkInClient:self->_client];
  v3.receiver = self;
  v3.super_class = (Class)SBSAbstractFacilityService;
  [(SBSAbstractFacilityService *)&v3 dealloc];
}

- (SBSServiceFacilityClient)client
{
  return self->_client;
}

- (SBSAbstractFacilityService)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBSAbstractFacilityService;
  v2 = [(SBSAbstractFacilityService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SBSServiceFacilityClient checkOutClientWithClass:](SBSServiceFacilityClient, "checkOutClientWithClass:", [(id)objc_opt_class() serviceFacilityClientClass]);
    client = v2->_client;
    v2->_client = (SBSServiceFacilityClient *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

+ (Class)serviceFacilityClientClass
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"SBSAbstractFacilityService.m" lineNumber:42 description:@"A service identifier must be provided."];

  return 0;
}

- (OS_dispatch_queue)callbackQueue
{
  v2 = [(SBSAbstractFacilityService *)self client];
  uint64_t v3 = [v2 calloutQueue];

  return (OS_dispatch_queue *)v3;
}

@end