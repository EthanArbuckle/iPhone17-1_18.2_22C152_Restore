@interface SBSAbstractSystemService
+ (Class)serviceFacilityClientClass;
- (SBSSystemServiceClient)client;
@end

@implementation SBSAbstractSystemService

+ (Class)serviceFacilityClientClass
{
  return (Class)objc_opt_class();
}

- (SBSSystemServiceClient)client
{
  v4.receiver = self;
  v4.super_class = (Class)SBSAbstractSystemService;
  v2 = [(SBSAbstractFacilityService *)&v4 client];
  return (SBSSystemServiceClient *)v2;
}

@end