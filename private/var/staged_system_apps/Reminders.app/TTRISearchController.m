@interface TTRISearchController
- (_TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController)initWithCoder:(id)a3;
- (_TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController)initWithSearchResultsController:(id)a3;
@end

@implementation TTRISearchController

- (_TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController)initWithSearchResultsController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController_ttri_isBeingDismissed) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(TTRISearchController *)&v7 initWithSearchResultsController:a3];
}

- (_TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController_ttri_isBeingDismissed) = 0;
    id v8 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController_ttri_isBeingDismissed) = 0;
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(TTRISearchController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController_ttri_isBeingDismissed) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(TTRISearchController *)&v7 initWithCoder:a3];
}

@end