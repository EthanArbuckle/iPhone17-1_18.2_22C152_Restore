@interface STIntroPresetsViewController
- (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController)initWithIntroductionModel:(id)a3 settingsPresetViewModel:(id)a4 name:(id)a5 updateExistingSettings:(BOOL)a6 onContinue:(id)a7;
- (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continue;
- (void)notNow;
- (void)viewDidLoad;
@end

@implementation STIntroPresetsViewController

- (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController)initWithIntroductionModel:(id)a3 settingsPresetViewModel:(id)a4 name:(id)a5 updateExistingSettings:(BOOL)a6 onContinue:(id)a7
{
  v10 = _Block_copy(a7);
  uint64_t v11 = sub_225C08420();
  unint64_t v13 = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  swift_unknownObjectRetain();
  return (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController *)STIntroPresetsViewController.init(introductionModel:settingsPresetViewModel:name:updateExistingSettings:onContinue:)((uint64_t)a3, a4, v11, v13, a6, (uint64_t)sub_225BE5340, v14);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_225BE3D44();
}

- (void)continue
{
  v2 = self;
  sub_225BE4680();
}

- (void)notNow
{
  v2 = self;
  sub_225BE4854();
}

- (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC20ScreenTimeSettingsUI28STIntroPresetsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ScreenTimeSettingsUI28STIntroPresetsViewController_settingsPresetViewModel));
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ScreenTimeSettingsUI28STIntroPresetsViewController_presetsVC);
}

@end