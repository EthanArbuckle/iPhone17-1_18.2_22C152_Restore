@interface RDNotificationViewController
- (NSLayoutConstraint)appLinkSpacingConstraint;
- (NSLayoutConstraint)appLinkWidthConstraint;
- (UIButton)appLinkButton;
- (UILabel)footnoteLabel;
- (UILabel)label;
- (_TtC37RemindersNotificationContentExtension28RDNotificationViewController)initWithCoder:(id)a3;
- (_TtC37RemindersNotificationContentExtension28RDNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveNotification:(id)a3;
- (void)didTapAppLinkButton:(id)a3;
- (void)setAppLinkButton:(id)a3;
- (void)setAppLinkSpacingConstraint:(id)a3;
- (void)setAppLinkWidthConstraint:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setLabel:(id)a3;
- (void)viewDidLoad;
@end

@implementation RDNotificationViewController

- (UILabel)label
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setLabel:(id)a3
{
}

- (UILabel)footnoteLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setFootnoteLabel:(id)a3
{
}

- (UIButton)appLinkButton
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIButton *)Strong;
}

- (void)setAppLinkButton:(id)a3
{
}

- (NSLayoutConstraint)appLinkSpacingConstraint
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (NSLayoutConstraint *)Strong;
}

- (void)setAppLinkSpacingConstraint:(id)a3
{
}

- (NSLayoutConstraint)appLinkWidthConstraint
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (NSLayoutConstraint *)Strong;
}

- (void)setAppLinkWidthConstraint:(id)a3
{
}

- (void)viewDidLoad
{
  uint64_t v2 = qword_10000CA38;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_100006620();
  sub_10000350C(v4, (uint64_t)qword_10000CA60);
  v5 = sub_100006610();
  os_log_type_t v6 = sub_1000066F0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "ContentExtension viewDidLoad", v7, 2u);
    swift_slowDealloc();
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for RDNotificationViewController();
  [(RDNotificationViewController *)&v8 viewDidLoad];
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100003878(v4);
}

- (void)didTapAppLinkButton:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1000067D0();
  swift_unknownObjectRelease();
  sub_100004FC4();

  sub_100005F64(v5);
}

- (_TtC37RemindersNotificationContentExtension28RDNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100006690();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC37RemindersNotificationContentExtension28RDNotificationViewController *)sub_100005150(v5, v7, a4);
}

- (_TtC37RemindersNotificationContentExtension28RDNotificationViewController)initWithCoder:(id)a3
{
  return (_TtC37RemindersNotificationContentExtension28RDNotificationViewController *)sub_1000052AC(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC37RemindersNotificationContentExtension28RDNotificationViewController_notificationUserActivity);
}

@end