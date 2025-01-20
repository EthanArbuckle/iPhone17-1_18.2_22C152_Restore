@interface TTRILearnMoreCSLViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (UIImageView)filterImageView;
- (UIStackView)smartListStackView;
- (UITextView)addRemindersTextView;
- (UITextView)filteringTagsExampleBodyTextView;
- (UITextView)filteringTagsTextView;
- (UITextView)howToSmartListBodyTextView;
- (UITextView)makeSmartListBodyTextView;
- (UITextView)whySmartListsExampleBodyTextView;
- (UITextView)whySmartListsTextView;
- (_TtC9Reminders30TTRILearnMoreCSLViewController)initWithCoder:(id)a3;
- (_TtC9Reminders30TTRILearnMoreCSLViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapDoneButton:(id)a3;
- (void)setAddRemindersTextView:(id)a3;
- (void)setFilterImageView:(id)a3;
- (void)setFilteringTagsExampleBodyTextView:(id)a3;
- (void)setFilteringTagsTextView:(id)a3;
- (void)setHowToSmartListBodyTextView:(id)a3;
- (void)setMakeSmartListBodyTextView:(id)a3;
- (void)setSmartListStackView:(id)a3;
- (void)setWhySmartListsExampleBodyTextView:(id)a3;
- (void)setWhySmartListsTextView:(id)a3;
- (void)viewDidLoad;
@end

@implementation TTRILearnMoreCSLViewController

- (_TtC9Reminders30TTRILearnMoreCSLViewController)initWithCoder:(id)a3
{
  return (_TtC9Reminders30TTRILearnMoreCSLViewController *)sub_1002C937C(a3);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TTRILearnMoreCSLViewController *)&v3 viewDidLoad];
  sub_1002C95C8();
}

- (UIStackView)smartListStackView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIStackView *)Strong;
}

- (void)setSmartListStackView:(id)a3
{
}

- (UITextView)whySmartListsTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setWhySmartListsTextView:(id)a3
{
}

- (UITextView)whySmartListsExampleBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setWhySmartListsExampleBodyTextView:(id)a3
{
}

- (UITextView)makeSmartListBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setMakeSmartListBodyTextView:(id)a3
{
}

- (UITextView)filteringTagsTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setFilteringTagsTextView:(id)a3
{
}

- (UITextView)filteringTagsExampleBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setFilteringTagsExampleBodyTextView:(id)a3
{
}

- (UITextView)addRemindersTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setAddRemindersTextView:(id)a3
{
}

- (UITextView)howToSmartListBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setHowToSmartListBodyTextView:(id)a3
{
}

- (UIImageView)filterImageView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIImageView *)Strong;
}

- (void)setFilterImageView:(id)a3
{
}

- (void)didTapDoneButton:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1001135BC();

  sub_10003D3BC((uint64_t)v6);
}

- (_TtC9Reminders30TTRILearnMoreCSLViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders30TTRILearnMoreCSLViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  uint64_t v3 = *(void *)&self->filteringTagsExampleBodyTextView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor];
  uint64_t v4 = *(void *)&self->addRemindersTextView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor];
  sub_100245D94(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor), *(void *)&self->smartListStackView[OBJC_IVAR____TtC9Reminders30TTRILearnMoreCSLViewController_cslHelpAnchor]);
  sub_1001D8FF8(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  v12 = self;
  LOBYTE(self) = sub_1002CAC0C(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

@end