@interface SFShowAirDropUserSafetyIntervention
+ (BOOL)supportsSecureCoding;
- (SFShowAirDropUserSafetyIntervention)init;
- (SFShowAirDropUserSafetyIntervention)initWithCoder:(id)a3;
@end

@implementation SFShowAirDropUserSafetyIntervention

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFShowAirDropUserSafetyIntervention)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SFXPCInvocation *)&v3 init];
}

- (SFShowAirDropUserSafetyIntervention)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (SFShowAirDropUserSafetyIntervention *)sub_1A55B2384(v3);

  return v4;
}

@end