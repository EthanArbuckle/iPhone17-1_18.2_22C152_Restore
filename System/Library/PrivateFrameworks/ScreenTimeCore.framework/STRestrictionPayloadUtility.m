@interface STRestrictionPayloadUtility
+ (id)create;
- (STRestrictionPayloadUtility)init;
- (id)buildUpdatedDeclarationsWithImageGenerationAllowed:(BOOL)a3 originalDeclarations:(id)a4;
- (id)getAppsRatingFromPayloadPlist:(id)a3 error:(id *)a4;
@end

@implementation STRestrictionPayloadUtility

+ (id)create
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)STRestrictionPayloadUtility), sel_init);
  return v2;
}

- (id)buildUpdatedDeclarationsWithImageGenerationAllowed:(BOOL)a3 originalDeclarations:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DC4B8);
  uint64_t v6 = sub_1DA5ABBE0();
  v7 = self;
  _sSo27STRestrictionPayloadUtilityC14ScreenTimeCoreE24buildUpdatedDeclarations26withImageGenerationAllowed08originalI0SaySDys11AnyHashableVypGGSb_AJtF_0(a3, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1DA5ABBD0();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)getAppsRatingFromPayloadPlist:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = sub_1DA5AB880();
  unint64_t v9 = v8;

  id v10 = sub_1DA594C84();
  sub_1DA594E50(v7, v9);
  return v10;
}

- (STRestrictionPayloadUtility)init
{
  v3.receiver = self;
  v3.super_class = (Class)STRestrictionPayloadUtility;
  return [(STRestrictionPayloadUtility *)&v3 init];
}

@end