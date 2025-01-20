@interface RemindersInCalendarUtilities.ReminderDragItem
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3;
- (_TtCO19RemindersAppIntents28RemindersInCalendarUtilities16ReminderDragItem)init;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
@end

@implementation RemindersInCalendarUtilities.ReminderDragItem

- (_TtCO19RemindersAppIntents28RemindersInCalendarUtilities16ReminderDragItem)init
{
  result = (_TtCO19RemindersAppIntents28RemindersInCalendarUtilities16ReminderDragItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  id v2 = objc_msgSend(self, sel_writableTypeIdentifiersForItemProvider);
  sub_25AEFA240();

  v3 = (void *)sub_25AEFA230();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

+ (int64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:(id)a3
{
  return 0;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_25AEFA080();
  uint64_t v8 = v7;
  _Block_copy(v5);
  v9 = self;
  id v10 = sub_25AE094CC(v6, v8, (uint64_t)v9, (void (**)(void, void, void))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
  return v10;
}

@end