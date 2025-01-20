@interface Journaling.EntryViewModel.AutosaveManager
- (void)receivedNotificationWithNotification:(id)a3;
- (void)startAutosaveTimer;
- (void)stopAutosaveTimer;
@end

@implementation Journaling.EntryViewModel.AutosaveManager

- (void)receivedNotificationWithNotification:(id)a3
{
  uint64_t v3 = type metadata accessor for Notification();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_10010A740();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)stopAutosaveTimer
{
  if (*(void *)self->autosaveTask)
  {
    swift_retain();
    swift_retain();
    sub_100010218((uint64_t *)&unk_1007FC0D0);
    Task.cancel()();
    swift_release();
    swift_release();
  }
}

- (void)startAutosaveTimer
{
  swift_retain();
  sub_10010B088();

  swift_release();
}

@end