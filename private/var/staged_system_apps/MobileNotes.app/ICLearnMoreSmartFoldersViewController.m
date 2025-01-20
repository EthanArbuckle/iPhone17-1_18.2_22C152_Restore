@interface ICLearnMoreSmartFoldersViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (ICLearnMoreSmartFoldersViewController)initWithCoder:(id)a3;
- (ICLearnMoreSmartFoldersViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITextView)filteringTagsExampleBodyTextView;
- (UITextView)filteringTagsSummaryBodyTextView;
- (UITextView)howToSmartFoldersBodyTextView;
- (UITextView)makeSmartFoldersBodyTextView;
- (UITextView)smartFoldersExampleBodyTextView;
- (UITextView)whySmartFoldersExampleBodyTextView;
- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView)filtersView;
- (void)setFilteringTagsExampleBodyTextView:(id)a3;
- (void)setFilteringTagsSummaryBodyTextView:(id)a3;
- (void)setFiltersView:(id)a3;
- (void)setHowToSmartFoldersBodyTextView:(id)a3;
- (void)setMakeSmartFoldersBodyTextView:(id)a3;
- (void)setSmartFoldersExampleBodyTextView:(id)a3;
- (void)setWhySmartFoldersExampleBodyTextView:(id)a3;
- (void)updateFiltersView;
- (void)viewDidLayoutSubviews;
@end

@implementation ICLearnMoreSmartFoldersViewController

- (UITextView)whySmartFoldersExampleBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setWhySmartFoldersExampleBodyTextView:(id)a3
{
}

- (UITextView)smartFoldersExampleBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setSmartFoldersExampleBodyTextView:(id)a3
{
}

- (UITextView)makeSmartFoldersBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setMakeSmartFoldersBodyTextView:(id)a3
{
}

- (UITextView)filteringTagsSummaryBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setFilteringTagsSummaryBodyTextView:(id)a3
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

- (UITextView)howToSmartFoldersBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setHowToSmartFoldersBodyTextView:(id)a3
{
}

- (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView)filtersView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC11MobileNotes32LearnMoreSmartFoldersFiltersView *)Strong;
}

- (void)setFiltersView:(id)a3
{
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(ICLearnMoreSmartFoldersViewController *)&v5 viewDidLayoutSubviews];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    sub_1004A6960();
  }
  else
  {
    __break(1u);
  }
}

- (void)updateFiltersView
{
  id Strong = (id)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v3 = self;
    sub_1004A6960();
  }
  else
  {
    __break(1u);
  }
}

- (ICLearnMoreSmartFoldersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (ICLearnMoreSmartFoldersViewController *)sub_10017F6E8(v5, v7, a4);
}

- (ICLearnMoreSmartFoldersViewController)initWithCoder:(id)a3
{
  return (ICLearnMoreSmartFoldersViewController *)sub_10017F8BC(a3);
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
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  v13 = self;
  LOBYTE(self) = sub_10017FCC0(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

@end