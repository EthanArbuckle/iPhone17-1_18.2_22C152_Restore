@interface SBSAbstractApplicationService
+ (Class)serviceFacilityClientClass;
- (SBSApplicationClient)client;
@end

@implementation SBSAbstractApplicationService

- (SBSApplicationClient)client
{
  v4.receiver = self;
  v4.super_class = (Class)SBSAbstractApplicationService;
  v2 = [(SBSAbstractFacilityService *)&v4 client];
  return (SBSApplicationClient *)v2;
}

+ (Class)serviceFacilityClientClass
{
  return (Class)objc_opt_class();
}

@end