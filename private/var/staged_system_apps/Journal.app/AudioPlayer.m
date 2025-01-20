@interface AudioPlayer
- (void)didPlayToEndWithNotification:(id)a3;
- (void)handleAudioSessionInterruption:(id)a3;
@end

@implementation AudioPlayer

- (void)didPlayToEndWithNotification:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1002DB4E0(v3);

  swift_release();
}

- (void)handleAudioSessionInterruption:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_1002DC8B0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end