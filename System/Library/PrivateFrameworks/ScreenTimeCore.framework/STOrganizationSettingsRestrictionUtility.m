@interface STOrganizationSettingsRestrictionUtility
- (STOrganizationSettingsRestrictionUtility)init;
- (STOrganizationSettingsRestrictionUtility)initWithPersistenceController:(id)a3 restrictionPayloadUtility:(id)a4;
- (STOrganizationSettingsRestrictionUtility)initWithPersistenceController:(id)a3 restrictionPayloadUtility:(id)a4 userDefaults:(id)a5;
- (id)isImageGenerationAllowedForUserDSID:(id)a3 error:(id *)a4;
- (void)isImageGenerationAllowedForUserDSID:(id)a3 completionHandler:(id)a4;
@end

@implementation STOrganizationSettingsRestrictionUtility

- (STOrganizationSettingsRestrictionUtility)initWithPersistenceController:(id)a3 restrictionPayloadUtility:(id)a4
{
  swift_unknownObjectRetain_n();
  swift_unknownObjectRetain_n();
  v7 = self;
  *(Class *)((char *)&v7->super.isa + OBJC_IVAR___STOrganizationSettingsRestrictionUtility_implementation) = (Class)sub_1DA596FC0((uint64_t)a3, (uint64_t)a4);

  v10.receiver = v7;
  v10.super_class = (Class)STOrganizationSettingsRestrictionUtility;
  v8 = [(STOrganizationSettingsRestrictionUtility *)&v10 init];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v8;
}

- (STOrganizationSettingsRestrictionUtility)initWithPersistenceController:(id)a3 restrictionPayloadUtility:(id)a4 userDefaults:(id)a5
{
  v9 = (objc_class *)type metadata accessor for STOrganizationSettingsRestrictionUtilityImplementation();
  objc_super v10 = (char *)objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR____TtC14ScreenTimeCoreP33_85746A119BB273F4CF13C31ED127C55054STOrganizationSettingsRestrictionUtilityImplementation_persistenceController] = a3;
  *(void *)&v10[OBJC_IVAR____TtC14ScreenTimeCoreP33_85746A119BB273F4CF13C31ED127C55054STOrganizationSettingsRestrictionUtilityImplementation_restrictionPayloadUtility] = a4;
  *(void *)&v10[OBJC_IVAR____TtC14ScreenTimeCoreP33_85746A119BB273F4CF13C31ED127C55054STOrganizationSettingsRestrictionUtilityImplementation_userDefaults] = a5;
  v16.receiver = v10;
  v16.super_class = v9;
  swift_unknownObjectRetain_n();
  swift_unknownObjectRetain_n();
  id v11 = a5;
  v12 = self;
  *(Class *)((char *)&v12->super.isa + OBJC_IVAR___STOrganizationSettingsRestrictionUtility_implementation) = (Class)[(STOrganizationSettingsRestrictionUtility *)&v16 init];

  v15.receiver = v12;
  v15.super_class = (Class)STOrganizationSettingsRestrictionUtility;
  v13 = [(STOrganizationSettingsRestrictionUtility *)&v15 init];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v13;
}

- (void)isImageGenerationAllowedForUserDSID:(id)a3 completionHandler:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA8DC530);
  MEMORY[0x1F4188790]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = sub_1DA5ABC40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = a3;
  v12[6] = sub_1DA597E6C;
  v12[7] = v10;
  id v13 = a3;
  v14 = self;
  id v15 = v13;
  swift_retain();
  sub_1DA595B24((uint64_t)v8, (uint64_t)&unk_1EA8DC5F0, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (id)isImageGenerationAllowedForUserDSID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, sub_1DA596714() & 1);

  return v7;
}

- (STOrganizationSettingsRestrictionUtility)init
{
  result = (STOrganizationSettingsRestrictionUtility *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end