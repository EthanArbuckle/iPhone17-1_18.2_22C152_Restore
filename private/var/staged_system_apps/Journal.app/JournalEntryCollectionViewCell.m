@interface JournalEntryCollectionViewCell
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)isAccessibilityElement;
- (NSArray)accessibilityCustomActions;
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC7Journal30JournalEntryCollectionViewCell)initWithCoder:(id)a3;
- (_TtC7Journal30JournalEntryCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)dealloc;
- (void)handleTap:(id)a3;
- (void)handleTapUnsupportedView:(id)a3;
- (void)layoutSubviews;
- (void)onAppWillResignActiveNotification;
- (void)prepareForReuse;
- (void)setAccessibilityUserInputLabels:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation JournalEntryCollectionViewCell

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_10037C7B0();

  return v7;
}

- (_TtC7Journal30JournalEntryCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003F194C();
}

- (_TtC7Journal30JournalEntryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal30JournalEntryCollectionViewCell *)sub_1003EBA98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  id v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4 name:UIApplicationWillResignActiveNotification object:0];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for JournalEntryCollectionViewCell();
  [(JournalEntryCollectionViewCell *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_cellDelegate);
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_actionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_topContentMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_assetStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_reflectionPromptView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_photoMemoriesBannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_slimAssetView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_assetGridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_assetGridHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_entryTextContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_entryTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_bundleTitle));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_unsupportedEntryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_menuSwipeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_platterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_contextMenuInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell____lazy_storage___textMaskViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell____lazy_storage___textViewTapGesture));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_chinView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_collapseAffordanceAccessibilityElement));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell____lazy_storage___bookmarkButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell____lazy_storage___editButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell____lazy_storage___deleteButton));

  swift_release();
}

- (void)willMoveToWindow:(id)a3
{
  if (a3)
  {
    id v5 = self;
  }
  else
  {
    objc_super v6 = self;
    id v7 = self;
    id v8 = [v6 defaultCenter];
    [v8 removeObserver:v7 name:UIApplicationWillResignActiveNotification object:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for JournalEntryCollectionViewCell();
  id v9 = a3;
  [(JournalEntryCollectionViewCell *)&v10 willMoveToWindow:v9];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003ECF38();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JournalEntryCollectionViewCell();
  id v2 = v3.receiver;
  [(JournalEntryCollectionViewCell *)&v3 prepareForReuse];
  sub_1003EEB38(1);
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003F1CB0();
}

- (void)handleTapUnsupportedView:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_actionDelegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = *(void (**)(uint64_t, uint64_t))(v6 + 40);
    id v9 = a3;
    objc_super v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)onAppWillResignActiveNotification
{
  id v2 = *(void **)(*(char **)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_chinView)
                + OBJC_IVAR____TtC7Journal24JournalEntryCellChinView_overflowButton);
  objc_super v3 = self;
  id v4 = [v2 contextMenuInteraction];
  [v4 dismissMenu];
}

- (BOOL)isAccessibilityElement
{
  return (*((unsigned char *)&self->super.super.super.super.super.isa
          + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_isExpanded) & 1) == 0;
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1003F0194(self, (uint64_t)a2, (void (*)(void))sub_1003EF8D4);
}

- (NSArray)accessibilityUserInputLabels
{
  id v2 = self;
  uint64_t v3 = sub_1003EFBFC();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityUserInputLabels:(id)a3
{
  if (a3)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    NSArray v4 = self;
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = self;
    v5.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for JournalEntryCollectionViewCell();
  [(JournalEntryCollectionViewCell *)&v7 setAccessibilityUserInputLabels:v5.super.isa];
}

- (NSString)accessibilityValue
{
  if ((*((unsigned char *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_isExpanded) & 1) != 0)
    goto LABEL_2;
  NSString v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_journalEntry);
  if (v2)
  {
    uint64_t v3 = self;
    swift_retain();
    Journaling.EntryViewModel.accessibilityDescription.getter();
    uint64_t v5 = v4;

    swift_release();
    if (!v5)
    {
LABEL_2:
      NSString v2 = 0;
      goto LABEL_6;
    }
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
LABEL_6:

  return (NSString *)v2;
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1003F0194(self, (uint64_t)a2, (void (*)(void))sub_1003F0214);
}

- (NSArray)accessibilityCustomActions
{
  NSString v2 = self;
  uint64_t v3 = sub_1003F0388();

  if (v3)
  {
    sub_10001B284(0, (unint64_t *)&unk_10080C360);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (BOOL)accessibilityActivate
{
  NSString v2 = self;
  unsigned __int8 v3 = sub_1003F0D8C();

  return v3 & 1;
}

- (BOOL)accessibilityPerformEscape
{
  int v2 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC7Journal30JournalEntryCollectionViewCell_isExpanded);
  if (v2 == 1)
  {
    unsigned __int8 v3 = self;
    sub_1003EEB38(0);
  }
  return v2;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  id v9 = sub_1003EB92C();
  sub_10001B284(0, (unint64_t *)&qword_10080C350);
  LOBYTE(a4) = static NSObject.== infix(_:_:)();

  if (a4)
  {
    self;
    BOOL v10 = swift_dynamicCastObjCClass() != 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_1003F12F4((uint64_t)v6, v7);

  return v9 & 1;
}

@end