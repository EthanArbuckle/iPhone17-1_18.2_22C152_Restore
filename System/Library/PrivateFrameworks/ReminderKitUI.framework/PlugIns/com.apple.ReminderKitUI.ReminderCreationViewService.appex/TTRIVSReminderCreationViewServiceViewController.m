@interface TTRIVSReminderCreationViewServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (TTRIVSReminderCreationViewServiceViewController)initWithCoder:(id)a3;
- (TTRIVSReminderCreationViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)displayForCreationWithContext:(id)a3 completion:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)viewDidLoad;
- (void)viewHostDidDismiss;
@end

@implementation TTRIVSReminderCreationViewServiceViewController

- (TTRIVSReminderCreationViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100022510();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (TTRIVSReminderCreationViewServiceViewController *)sub_1000134F4(v5, v7, a4);
}

- (TTRIVSReminderCreationViewServiceViewController)initWithCoder:(id)a3
{
  uint64_t v5 = sub_1000224A0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (_OWORD *)((char *)self + OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_currentEventHandler);
  _OWORD *v9 = 0u;
  v9[1] = 0u;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_contentNavigationController) = 0;
  v10 = (Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_extensionCreateReminderInterface);
  void *v10 = 0;
  v10[1] = 0;
  id v11 = a3;

  if (qword_10002D7B8 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100012A58(v5, (uint64_t)qword_10002E028);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  sub_1000124C4((uint64_t)&_swiftEmptyArrayStorage);
  sub_1000124C4((uint64_t)&_swiftEmptyArrayStorage);
  sub_100015AC8((uint64_t)"init(coder:) has not been implemented", 37, 2);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIVSReminderCreationViewServiceViewController();
  id v2 = v9.receiver;
  [(TTRIVSReminderCreationViewServiceViewController *)&v9 viewDidLoad];
  id v3 = objc_msgSend(v2, "view", v9.receiver, v9.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    double v6 = v5;
    double v8 = v7;

    objc_msgSend(v2, "setPreferredContentSize:", v6, v8);
  }
  else
  {
    __break(1u);
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRIVSReminderCreationViewServiceViewController();
  swift_unknownObjectRetain();
  id v4 = v7.receiver;
  [(TTRIVSReminderCreationViewServiceViewController *)&v7 preferredContentSizeDidChangeForChildContentContainer:a3];
  sub_100013988();
  double v6 = v5;
  objc_msgSend(a3, "preferredContentSize", v7.receiver, v7.super_class);
  objc_msgSend(v6, "viewServicePreferredSizeDidChange:");
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

+ (id)_exportedInterface
{
  id v2 = objc_msgSend(self, "rem_reminderCreationViewServiceViewControllerExportedInterface");

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  id v2 = [self interfaceWithProtocol:&OBJC_PROTOCOL___REMReminderCreationRemoteViewController];

  return v2;
}

- (void).cxx_destruct
{
  sub_1000154C4((uint64_t)self + OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_currentEventHandler);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___TTRIVSReminderCreationViewServiceViewController_contentNavigationController));

  swift_unknownObjectRelease();
}

- (void)displayForCreationWithContext:(id)a3 completion:(id)a4
{
  double v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  double v8 = self;
  sub_100014DA8(v7, (uint64_t)v8, (void (**)(void, void, double, double))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)viewHostDidDismiss
{
  uint64_t v2 = qword_10002D7B8;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_1000224A0();
  sub_100012A58(v4, (uint64_t)qword_10002E028);
  oslog = sub_100022490();
  os_log_type_t v5 = sub_100022600();
  if (os_log_type_enabled(oslog, v5))
  {
    double v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v5, "Tearing down TTRIVSReminderCreationViewServiceViewController", v6, 2u);
    swift_slowDealloc();
  }
}

@end