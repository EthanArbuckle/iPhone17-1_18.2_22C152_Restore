@interface TTRReminderLocationPickerLocalSearchResultItemProvider
- (_TtC15RemindersUICore54TTRReminderLocationPickerLocalSearchResultItemProvider)init;
- (void)completer:(id)a3 didFailWithError:(id)a4;
- (void)completerDidUpdateResults:(id)a3;
@end

@implementation TTRReminderLocationPickerLocalSearchResultItemProvider

- (_TtC15RemindersUICore54TTRReminderLocationPickerLocalSearchResultItemProvider)init
{
  return (_TtC15RemindersUICore54TTRReminderLocationPickerLocalSearchResultItemProvider *)TTRReminderLocationPickerLocalSearchResultItemProvider.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore54TTRReminderLocationPickerLocalSearchResultItemProvider_localSearchCompleter));
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)completerDidUpdateResults:(id)a3
{
  id v4 = a3;
  v5 = self;
  TTRReminderLocationPickerLocalSearchResultItemProvider.completerDidUpdateResults(_:)((MKLocalSearchCompleter)v4);
}

- (void)completer:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1B928D034((uint64_t)v8);
}

@end