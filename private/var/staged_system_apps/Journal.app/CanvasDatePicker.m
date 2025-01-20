@interface CanvasDatePicker
- (BOOL)accessibilityPerformEscape;
- (_TtC7Journal16CanvasDatePicker)initWithCoder:(id)a3;
- (_TtC7Journal16CanvasDatePicker)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancelClickedWithSender:(id)a3;
- (void)doneClickedWithSender:(id)a3;
- (void)viewDidLoad;
@end

@implementation CanvasDatePicker

- (_TtC7Journal16CanvasDatePicker)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Journal16CanvasDatePicker_datePicker;
  id v6 = objc_allocWithZone((Class)UIDatePicker);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(void *)&self->datePicker[OBJC_IVAR____TtC7Journal16CanvasDatePicker_delegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC7Journal16CanvasDatePicker *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1001D8150();
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3 = sub_100010218(&qword_1007FABA8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (char *)self + OBJC_IVAR____TtC7Journal16CanvasDatePicker_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v9 = sub_100010218((uint64_t *)&unk_100804070);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v5, 1, 1, v9);
    v10 = self;
    sub_100062EC0((uint64_t)v5, ObjectType, v7);
    swift_unknownObjectRelease();
    sub_1001DA500((uint64_t)v5);
  }
  return 1;
}

- (void)doneClickedWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001DA560();
}

- (void)cancelClickedWithSender:(id)a3
{
  uint64_t v5 = sub_100010218(&qword_1007FABA8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC7Journal16CanvasDatePicker_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v11 = sub_100010218((uint64_t *)&unk_100804070);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
    id v12 = a3;
    v13 = self;
    sub_100062EC0((uint64_t)v7, ObjectType, v9);
    swift_unknownObjectRelease();
    sub_1001DA500((uint64_t)v7);
  }
}

- (_TtC7Journal16CanvasDatePicker)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal16CanvasDatePicker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC7Journal16CanvasDatePicker_preselectedDate;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  uint64_t v5 = (char *)self + OBJC_IVAR____TtC7Journal16CanvasDatePicker_delegate;

  sub_1000109BC((uint64_t)v5);
}

@end