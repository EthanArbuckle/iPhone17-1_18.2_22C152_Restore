@interface HeadphoneAudioNotificationModel
+ (_TtC6Bridge31HeadphoneAudioNotificationModel)shared;
- (_TtC6Bridge31HeadphoneAudioNotificationModel)init;
- (void)setData:(id)a3;
@end

@implementation HeadphoneAudioNotificationModel

+ (_TtC6Bridge31HeadphoneAudioNotificationModel)shared
{
  if (qword_10029B4E0 != -1) {
    swift_once();
  }
  v2 = (void *)static HeadphoneAudioNotificationModel.shared;

  return (_TtC6Bridge31HeadphoneAudioNotificationModel *)v2;
}

- (_TtC6Bridge31HeadphoneAudioNotificationModel)init
{
  swift_beginAccess();
  v6 = &_swiftEmptyArrayStorage;
  v3 = self;
  sub_10013385C(&qword_10029A450);
  Published.init(initialValue:)();
  swift_endAccess();

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for HeadphoneAudioNotificationModel();
  return [(HeadphoneAudioNotificationModel *)&v5 init];
}

- (void)setData:(id)a3
{
  sub_10013385C(&qword_10029A4B8);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  objc_super v5 = self;
  HeadphoneAudioNotificationModel.setData(_:)((Swift::OpaquePointer)v4);
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC6Bridge31HeadphoneAudioNotificationModel__data;
  uint64_t v3 = sub_10013385C(&qword_10029A478);
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end