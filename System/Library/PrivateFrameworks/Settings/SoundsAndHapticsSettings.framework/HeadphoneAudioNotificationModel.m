@interface HeadphoneAudioNotificationModel
+ (_TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel)shared;
- (_TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel)init;
- (void)setData:(id)a3;
@end

@implementation HeadphoneAudioNotificationModel

+ (_TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel)shared
{
  if (qword_2689176C8 != -1) {
    swift_once();
  }
  v2 = (void *)static HeadphoneAudioNotificationModel.shared;
  return (_TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel *)v2;
}

- (_TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel)init
{
  swift_beginAccess();
  uint64_t v6 = MEMORY[0x263F8EE78];
  v3 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2689176D8);
  sub_237322950();
  swift_endAccess();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for HeadphoneAudioNotificationModel();
  return [(HeadphoneAudioNotificationModel *)&v5 init];
}

- (void)setData:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268917728);
  uint64_t v4 = sub_237322D30();
  objc_super v5 = self;
  HeadphoneAudioNotificationModel.setData(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC24SoundsAndHapticsSettings31HeadphoneAudioNotificationModel__data;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268917730);
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end