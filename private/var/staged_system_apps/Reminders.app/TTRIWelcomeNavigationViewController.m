@interface TTRIWelcomeNavigationViewController
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithCoder:(id)a3;
- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithRootViewController:(id)a3;
- (void)dealloc;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)viewDidLoad;
@end

@implementation TTRIWelcomeNavigationViewController

- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithCoder:(id)a3
{
  result = (_TtC9Reminders35TTRIWelcomeNavigationViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_100785390;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100018BF8(v6, (uint64_t)qword_100793D50);
  v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "TTRIWelcomeNavigationViewController dealloc", v9, 2u);
    swift_slowDealloc();
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(TTRIWelcomeNavigationViewController *)&v10 dealloc];
}

- (void).cxx_destruct
{
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(TTRIWelcomeNavigationViewController *)&v5 viewDidLoad];
  [v2 setModalPresentationStyle:2];
  [v2 setNavigationBarHidden:1];
  id v3 = [v2 presentationController];
  if (v3)
  {
    id v4 = v3;
    [v3 setDelegate:v2];

    id v2 = v4;
  }
}

- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC9Reminders35TTRIWelcomeNavigationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC9Reminders35TTRIWelcomeNavigationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders35TTRIWelcomeNavigationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders35TTRIWelcomeNavigationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return (unint64_t)(*(void *)(*(void *)&self->OBNavigationController_opaque[OBJC_IVAR____TtC9Reminders35TTRIWelcomeNavigationViewController_presenter]
                                      + 48)
                          - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v5 = *(void *)&self->OBNavigationController_opaque[OBJC_IVAR____TtC9Reminders35TTRIWelcomeNavigationViewController_presenter];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = Strong;
    id v8 = a3;
    v9 = self;
    sub_100432EBC(v5, v7);

    swift_unknownObjectRelease();
  }
}

@end