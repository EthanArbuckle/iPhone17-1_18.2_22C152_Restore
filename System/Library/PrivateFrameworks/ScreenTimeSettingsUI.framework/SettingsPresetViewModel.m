@interface SettingsPresetViewModel
- (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel)init;
- (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel)initWithDsid:(id)a3 childAge:(id)a4 isInitialSetup:(BOOL)a5 restrictionsToPresetMappingViewModel:(id)a6 restrictionsDataSource:(id)a7 agePresetsAnalytics:(id)a8;
- (void)loadWithCompletionHandler:(id)a3;
@end

@implementation SettingsPresetViewModel

- (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel)initWithDsid:(id)a3 childAge:(id)a4 isInitialSetup:(BOOL)a5 restrictionsToPresetMappingViewModel:(id)a6 restrictionsDataSource:(id)a7 agePresetsAnalytics:(id)a8
{
  BOOL v11 = a5;
  id v13 = a3;
  id v14 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v15 = (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *)sub_225BF3A84(v13, a4, v11, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v15;
}

- (void)loadWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268116D60);
  MEMORY[0x270FA5388](v5 - 8, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = sub_225C085A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_268116D70;
  v12[5] = v10;
  id v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268116D80;
  v13[5] = v12;
  id v14 = self;
  sub_225BEDF8C((uint64_t)v8, (uint64_t)&unk_268116D90, (uint64_t)v13);
  swift_release();
}

- (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel)init
{
  result = (_TtC20ScreenTimeSettingsUI23SettingsPresetViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23SettingsPresetViewModel__availablePresets;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268116DA8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23SettingsPresetViewModel__ratings;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268116DB0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23SettingsPresetViewModel__selectedPresetIndex;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268116DB8);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23SettingsPresetViewModel__restrictions;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268116DC0);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = (char *)self + OBJC_IVAR____TtC20ScreenTimeSettingsUI23SettingsPresetViewModel__showLoadingIndicator;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268116568);
  id v13 = *(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8);

  v13(v11, v12);
}

@end