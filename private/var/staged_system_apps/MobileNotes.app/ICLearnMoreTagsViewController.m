@interface ICLearnMoreTagsViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (ICLearnMoreTagsViewController)initWithCoder:(id)a3;
- (ICLearnMoreTagsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITextView)addingTagsBodyTextView;
- (UITextView)smartFoldersBodyTextView;
- (UITextView)tagBrowser2BodyTextView;
- (UITextView)tagBrowserBodyTextView;
- (UITextView)usingTagsAndFoldersTogetherBodyTextView;
- (UITextView)whyTagsExampleBodyTextView;
- (void)setAddingTagsBodyTextView:(id)a3;
- (void)setSmartFoldersBodyTextView:(id)a3;
- (void)setTagBrowser2BodyTextView:(id)a3;
- (void)setTagBrowserBodyTextView:(id)a3;
- (void)setUsingTagsAndFoldersTogetherBodyTextView:(id)a3;
- (void)setWhyTagsExampleBodyTextView:(id)a3;
@end

@implementation ICLearnMoreTagsViewController

- (UITextView)whyTagsExampleBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setWhyTagsExampleBodyTextView:(id)a3
{
}

- (UITextView)usingTagsAndFoldersTogetherBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setUsingTagsAndFoldersTogetherBodyTextView:(id)a3
{
}

- (UITextView)addingTagsBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setAddingTagsBodyTextView:(id)a3
{
}

- (UITextView)tagBrowserBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setTagBrowserBodyTextView:(id)a3
{
}

- (UITextView)tagBrowser2BodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setTagBrowser2BodyTextView:(id)a3
{
}

- (UITextView)smartFoldersBodyTextView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextView *)Strong;
}

- (void)setSmartFoldersBodyTextView:(id)a3
{
}

- (ICLearnMoreTagsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (ICLearnMoreTagsViewController *)sub_100220978(v5, v7, a4);
}

- (ICLearnMoreTagsViewController)initWithCoder:(id)a3
{
  return (ICLearnMoreTagsViewController *)sub_100220B14(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

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
  LOBYTE(self) = sub_100220E98(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

@end