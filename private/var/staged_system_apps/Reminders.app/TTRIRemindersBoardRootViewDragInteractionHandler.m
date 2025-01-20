@interface TTRIRemindersBoardRootViewDragInteractionHandler
- (_TtC9Reminders48TTRIRemindersBoardRootViewDragInteractionHandler)init;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
@end

@implementation TTRIRemindersBoardRootViewDragInteractionHandler

- (_TtC9Reminders48TTRIRemindersBoardRootViewDragInteractionHandler)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->delegate[OBJC_IVAR____TtC9Reminders48TTRIRemindersBoardRootViewDragInteractionHandler_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(TTRIRemindersBoardRootViewDragInteractionHandler *)&v5 init];
}

- (void).cxx_destruct
{
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_100556B1C();

  swift_unknownObjectRelease();
  sub_100055B3C();
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v8 = a3;
    id v9 = a4;
    swift_unknownObjectRetain();
    v10 = self;
    id v11 = sub_1000558F8();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end