@interface TTRIntentHandler
- (_TtC25RemindersIntentsExtension16TTRIntentHandler)init;
- (id)handlerForIntent:(id)a3;
@end

@implementation TTRIntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4 = a3;
  v5 = self;
  TTRIntentHandler.handler(for:)(v4, v8);

  sub_10000A024(v8, v8[3]);
  v6 = (void *)sub_100035C50();
  sub_10000A4D4((uint64_t)v8);

  return v6;
}

- (_TtC25RemindersIntentsExtension16TTRIntentHandler)init
{
  return (_TtC25RemindersIntentsExtension16TTRIntentHandler *)TTRIntentHandler.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_store));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler_queue));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___contactStore));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC25RemindersIntentsExtension16TTRIntentHandler____lazy_storage___widgetListHandler);
}

@end