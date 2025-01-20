@interface GMDeviceSceneViewController
+ (void)prepareSceneWithCompletionHandler:(id)a3;
- (_TtC14VoiceTriggerUI27GMDeviceSceneViewController)initWithCoder:(id)a3;
- (_TtC14VoiceTriggerUI27GMDeviceSceneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation GMDeviceSceneViewController

- (_TtC14VoiceTriggerUI27GMDeviceSceneViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2388C85B0();
}

- (void)viewDidLoad
{
  v2 = self;
  GMDeviceSceneViewController.viewDidLoad()();
}

+ (void)prepareSceneWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26897CFB0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_2388E0848();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26897D078;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26897D088;
  v12[5] = v11;
  sub_2388C80A8((uint64_t)v7, (uint64_t)&unk_26897D098, (uint64_t)v12);
  swift_release();
}

- (_TtC14VoiceTriggerUI27GMDeviceSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC14VoiceTriggerUI27GMDeviceSceneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__sceneView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__cameraNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__deviceModelNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__deviceDisplayLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__wallpaperBlockingLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__keyboardLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__homeIndicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__intelligentLightLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__edgeLightMask));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__displayCAView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__pressAndHoldEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14VoiceTriggerUI27GMDeviceSceneViewController__doubleTapEffectView));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end