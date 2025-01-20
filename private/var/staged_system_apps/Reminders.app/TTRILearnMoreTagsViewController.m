@interface TTRILearnMoreTagsViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
- (UIScrollView)tagsView;
- (UIStackView)tagsStackView;
- (UITextView)smartListsBodyTextView;
- (UITextView)tagsAddingTextView;
- (UITextView)tagsBrowserTextView;
- (UITextView)tagsCreatingTextView;
- (UITextView)tagsSummaryTextView;
- (UITextView)tagsTapTextView;
- (UITextView)usingTagsAndListsTogetherBodyTextView;
- (UITextView)whyTagsExampleBodyTextView;
- (_TtC9Reminders31TTRILearnMoreTagsViewController)initWithCoder:(id)a3;
- (_TtC9Reminders31TTRILearnMoreTagsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapDoneButton:(id)a3;
- (void)setSmartListsBodyTextView:(id)a3;
- (void)setTagsAddingTextView:(id)a3;
- (void)setTagsBrowserTextView:(id)a3;
- (void)setTagsCreatingTextView:(id)a3;
- (void)setTagsStackView:(id)a3;
- (void)setTagsSummaryTextView:(id)a3;
- (void)setTagsTapTextView:(id)a3;
- (void)setTagsView:(id)a3;
- (void)setUsingTagsAndListsTogetherBodyTextView:(id)a3;
- (void)setWhyTagsExampleBodyTextView:(id)a3;
- (void)viewDidLoad;
@end

@implementation TTRILearnMoreTagsViewController

- (_TtC9Reminders31TTRILearnMoreTagsViewController)initWithCoder:(id)a3
{
  return (_TtC9Reminders31TTRILearnMoreTagsViewController *)sub_1000729F8(a3);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TTRILearnMoreTagsViewController *)&v3 viewDidLoad];
  sub_100072C10();
}

- (UIScrollView)tagsView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIScrollView *)Strong;
}

- (void)setTagsView:(id)a3
{
}

- (UIStackView)tagsStackView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIStackView *)Strong;
}

- (void)setTagsStackView:(id)a3
{
}

- (UITextView)whyTagsExampleBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setWhyTagsExampleBodyTextView:(id)a3
{
}

- (UITextView)usingTagsAndListsTogetherBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setUsingTagsAndListsTogetherBodyTextView:(id)a3
{
}

- (UITextView)smartListsBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setSmartListsBodyTextView:(id)a3
{
}

- (UITextView)tagsSummaryTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setTagsSummaryTextView:(id)a3
{
}

- (UITextView)tagsCreatingTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setTagsCreatingTextView:(id)a3
{
}

- (UITextView)tagsAddingTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setTagsAddingTextView:(id)a3
{
}

- (UITextView)tagsBrowserTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setTagsBrowserTextView:(id)a3
{
}

- (UITextView)tagsTapTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setTagsTapTextView:(id)a3
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

- (_TtC9Reminders31TTRILearnMoreTagsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders31TTRILearnMoreTagsViewController *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
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
  LOBYTE(self) = sub_100073C88(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

@end