@interface PageAlertController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC9SeymourUI19PageAlertController)initWithCoder:(id)a3;
- (_TtC9SeymourUI19PageAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChangeSelection:(id)a3;
@end

@implementation PageAlertController

- (unint64_t)supportedInterfaceOrientations
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  id v5 = [(PageAlertController *)v4 presentingViewController];
  if (v5)
  {
    v6 = v5;
    id v7 = objc_msgSend(v5, sel_supportedInterfaceOrientations);
  }
  else
  {
    v9.receiver = v4;
    v9.super_class = ObjectType;
    id v7 = [(PageAlertController *)&v9 supportedInterfaceOrientations];
  }
  return (unint64_t)v7;
}

- (_TtC9SeymourUI19PageAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_23A7FF988();
    v8 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    void *v8 = 0;
    v8[1] = 0;
    id v9 = a4;
    a3 = (id)sub_23A7FF948();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    void *v10 = 0;
    v10[1] = 0;
    id v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = [(PageAlertController *)&v14 initWithNibName:a3 bundle:a4];

  return v12;
}

- (_TtC9SeymourUI19PageAlertController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
  void *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(PageAlertController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

- (void)textFieldDidBeginEditing:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter))
  {
    uint64_t v5 = *(void *)((char *)&self->super.super.super._responderFlags
                   + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    uint64_t ObjectType = swift_getObjectType();
    id v7 = *(void (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v5 + 56);
    id v8 = a3;
    id v9 = self;
    swift_unknownObjectRetain();
    v7(v8, &off_26ED90430, ObjectType, v5);

    swift_unknownObjectRelease();
  }
}

- (void)textFieldDidChangeSelection:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter))
  {
    uint64_t v5 = *(void *)((char *)&self->super.super.super._responderFlags
                   + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    uint64_t ObjectType = swift_getObjectType();
    id v7 = *(void (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v5 + 64);
    id v8 = a3;
    id v9 = self;
    swift_unknownObjectRetain();
    v7(v8, &off_26ED90430, ObjectType, v5);

    swift_unknownObjectRelease();
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = sub_23A7FF988();
  uint64_t v11 = v10;
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter))
  {
    uint64_t v12 = *(void *)((char *)&self->super.super.super._responderFlags
                    + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    uint64_t v13 = v9;
    uint64_t ObjectType = swift_getObjectType();
    v19 = *(uint64_t (**)(id, _UNKNOWN **, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 72);
    id v15 = a3;
    v16 = self;
    swift_unknownObjectRetain();
    char v17 = v19(v15, &off_26ED90430, location, length, v13, v11, ObjectType, v12);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    char v17 = 1;
  }
  return v17 & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter))
  {
    uint64_t v5 = *(void *)((char *)&self->super.super.super._responderFlags
                   + OBJC_IVAR____TtC9SeymourUI19PageAlertController_presenter);
    uint64_t ObjectType = swift_getObjectType();
    id v7 = *(uint64_t (**)(id, _UNKNOWN **, uint64_t, uint64_t))(v5 + 80);
    id v8 = a3;
    uint64_t v9 = self;
    swift_unknownObjectRetain();
    char v10 = v7(v8, &off_26ED90430, ObjectType, v5);

    swift_unknownObjectRelease();
  }
  else
  {
    char v10 = 1;
  }
  return v10 & 1;
}

@end