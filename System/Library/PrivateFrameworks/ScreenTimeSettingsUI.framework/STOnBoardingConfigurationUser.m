@interface STOnBoardingConfigurationUser
- (BOOL)isChild;
- (NSNumber)ageBridge;
- (NSNumber)dsid;
- (NSString)altDSID;
- (NSString)childName;
- (STOnBoardingConfigurationUser)init;
- (int64_t)demographic;
@end

@implementation STOnBoardingConfigurationUser

- (NSString)altDSID
{
  return (NSString *)sub_225BFE498((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STOnBoardingConfigurationUser_altDSID);
}

- (NSString)childName
{
  return (NSString *)sub_225BFE498((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___STOnBoardingConfigurationUser_childName);
}

- (int64_t)demographic
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___STOnBoardingConfigurationUser_demographic);
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___STOnBoardingConfigurationUser_dsid));
}

- (BOOL)isChild
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___STOnBoardingConfigurationUser_demographic) == 0;
}

- (NSNumber)ageBridge
{
  if (self->age[OBJC_IVAR___STOnBoardingConfigurationUser_age]) {
    id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_init);
  }
  else {
    id v2 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithInteger_, *(Class *)((char *)&self->super.isa + OBJC_IVAR___STOnBoardingConfigurationUser_age));
  }

  return (NSNumber *)v2;
}

- (STOnBoardingConfigurationUser)init
{
  result = (STOnBoardingConfigurationUser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___STOnBoardingConfigurationUser_dsid);
}

@end