@interface ICTagContainerCell
- (BOOL)allowsContextualMenu;
- (BOOL)allowsExclusion;
- (BOOL)hasGroupInset;
- (BOOL)hasHorizontalScrolling;
- (BOOL)includesAllTagsItem;
- (BOOL)includesNewTagItem;
- (BOOL)preservesSuperviewHorizontalLayoutMargins;
- (BOOL)shouldSuppressAccessibilityHintsFor:(id)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (ICTagContainerCell)initWithCoder:(id)a3;
- (ICTagContainerCell)initWithFrame:(CGRect)a3;
- (NSManagedObjectID)defaultAccountObjectID;
- (UIViewController)presentingViewController;
- (_TtC11MobileNotes17TagCollectionView)collectionView;
- (id)dataDidChange;
- (id)selectionDidChange;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)deselectAllItemsAnimated:(BOOL)a3;
- (void)prepareForReuse;
- (void)reloadTagsWithAnimated:(BOOL)a3 completion:(id)a4;
- (void)selectTagWithIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)selectTagsWithTagSelection:(id)a3 animated:(BOOL)a4;
- (void)setAllowsContextualMenu:(BOOL)a3;
- (void)setAllowsExclusion:(BOOL)a3;
- (void)setCollectionView:(id)a3;
- (void)setDataDidChange:(id)a3;
- (void)setDefaultAccountObjectID:(id)a3;
- (void)setHasGroupInset:(BOOL)a3;
- (void)setHasHorizontalScrolling:(BOOL)a3;
- (void)setIncludesAllTagsItem:(BOOL)a3;
- (void)setIncludesNewTagItem:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setPreservesSuperviewHorizontalLayoutMargins:(BOOL)a3;
- (void)setSelectionDidChange:(id)a3;
@end

@implementation ICTagContainerCell

- (BOOL)preservesSuperviewHorizontalLayoutMargins
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR___ICTagContainerCell_preservesSuperviewHorizontalLayoutMargins);
}

- (void)setPreservesSuperviewHorizontalLayoutMargins:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___ICTagContainerCell_preservesSuperviewHorizontalLayoutMargins) = a3;
  [(ICTagContainerCell *)self setNeedsUpdateConfiguration];
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                     + OBJC_IVAR___ICTagContainerCell_presentingViewController));
}

- (void)setPresentingViewController:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1002900F0(a3, &OBJC_IVAR___ICTagContainerCell_presentingViewController, &OBJC_IVAR____TtC11MobileNotes17TagCollectionView_presentingViewController);
}

- (NSManagedObjectID)defaultAccountObjectID
{
  return (NSManagedObjectID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                      + OBJC_IVAR___ICTagContainerCell_defaultAccountObjectID));
}

- (void)setDefaultAccountObjectID:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1002900F0(a3, &OBJC_IVAR___ICTagContainerCell_defaultAccountObjectID, &OBJC_IVAR____TtC11MobileNotes17TagCollectionView_defaultAccountObjectID);
}

- (BOOL)hasGroupInset
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_hasGroupInset);
}

- (void)setHasGroupInset:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_hasGroupInset);
  *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_hasGroupInset) = a3;
  if (v3 != a3)
  {
    v4 = self;
    [(ICTagContainerCell *)v4 setNeedsLayout];
    [(ICTagContainerCell *)v4 layoutIfNeeded];
    [(ICTagContainerCell *)v4 setNeedsUpdateConfiguration];
  }
}

- (BOOL)hasHorizontalScrolling
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa
         + OBJC_IVAR___ICTagContainerCell_hasHorizontalScrolling);
}

- (void)setHasHorizontalScrolling:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.super.super.isa
       + OBJC_IVAR___ICTagContainerCell_hasHorizontalScrolling);
  *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_hasHorizontalScrolling) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_10028E1D4();
  }
}

- (BOOL)includesNewTagItem
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_includesNewTagItem);
}

- (void)setIncludesNewTagItem:(BOOL)a3
{
}

- (BOOL)includesAllTagsItem
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_includesAllTagsItem);
}

- (void)setIncludesAllTagsItem:(BOOL)a3
{
}

- (BOOL)allowsExclusion
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_allowsExclusion);
}

- (void)setAllowsExclusion:(BOOL)a3
{
}

- (id)selectionDidChange
{
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___ICTagContainerCell_selectionDidChange))
  {
    uint64_t v2 = *(void *)&self->preservesSuperviewHorizontalLayoutMargins[OBJC_IVAR___ICTagContainerCell_selectionDidChange];
    v5[4] = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagContainerCell_selectionDidChange);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1002B6294;
    v5[3] = &unk_100632A18;
    int v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (void)setSelectionDidChange:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    id v6 = sub_1002900E8;
  }
  else
  {
    id v6 = 0;
  }
  v7 = (uint64_t (**)(uint64_t))((char *)self + OBJC_IVAR___ICTagContainerCell_selectionDidChange);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR___ICTagContainerCell_selectionDidChange);
  *v7 = v6;
  v7[1] = (uint64_t (*)(uint64_t))v4;

  sub_10002E70C(v8);
}

- (id)dataDidChange
{
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_dataDidChange))
  {
    uint64_t v2 = *(void *)&self->preservesSuperviewHorizontalLayoutMargins[OBJC_IVAR___ICTagContainerCell_dataDidChange];
    v5[4] = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagContainerCell_dataDidChange);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100262E2C;
    v5[3] = &unk_1006329C8;
    int v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (void)setDataDidChange:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    id v6 = sub_100290188;
  }
  else
  {
    id v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___ICTagContainerCell_dataDidChange);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_dataDidChange);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10002E70C(v8);
}

- (BOOL)allowsContextualMenu
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_allowsContextualMenu);
}

- (void)setAllowsContextualMenu:(BOOL)a3
{
  uint64_t v4 = OBJC_IVAR___ICTagContainerCell_allowsContextualMenu;
  *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagContainerCell_allowsContextualMenu) = a3;
  uint64_t v5 = self;
  id v6 = sub_10028DF24();
  v6[OBJC_IVAR____TtC11MobileNotes17TagCollectionView_allowsContextualMenu] = *((unsigned char *)&self->super.super.super.super.super.super.isa
                                                                              + v4);
}

- (void)deselectAllItemsAnimated:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10028E770(a3);
}

- (void)reloadTagsWithAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v6 = sub_100290188;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = self;
  sub_10028EAEC(a3, (uint64_t)v6, v7);
  sub_10002E70C((uint64_t)v6);
}

- (void)selectTagWithIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (v7)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v7;
    uint64_t v7 = sub_1001A36C4;
  }
  else
  {
    uint64_t v11 = 0;
  }
  v12 = self;
  v13 = sub_10028DF24();
  sub_10038AD98(v8, v10, a4, (uint64_t)v7, v11);

  sub_10002E70C((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)selectTagsWithTagSelection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v9 = sub_10028DF24();
  sub_10038AFF0(a3, v4);
}

- (_TtC11MobileNotes17TagCollectionView)collectionView
{
  uint64_t v2 = self;
  int v3 = sub_10028DF24();

  return (_TtC11MobileNotes17TagCollectionView *)v3;
}

- (void)setCollectionView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___ICTagContainerCell____lazy_storage___collectionView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___ICTagContainerCell____lazy_storage___collectionView) = (Class)a3;
  id v3 = a3;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_10028EF24((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width = a3.width;
  uint64_t v6 = self;
  id v7 = sub_10028DF24();
  uint64_t v8 = sub_10038B474(width);
  double v10 = v9;
  uint64_t v11 = (void *)v8;

  double v12 = width;
  double v13 = v10;
  result.height = v13;
  result.double width = v12;
  return result;
}

- (void)prepareForReuse
{
  uint64_t v2 = self;
  sub_10028F8C8();
}

- (BOOL)shouldSuppressAccessibilityHintsFor:(id)a3
{
  uint64_t v5 = type metadata accessor for UICellConfigurationState();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  double v10 = self;
  id v11 = [(ICTagContainerCell *)v10 _bridgedConfigurationState];
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(v11) = UICellConfigurationState.isEditing.getter();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11 & 1;
}

- (ICTagContainerCell)initWithFrame:(CGRect)a3
{
  return (ICTagContainerCell *)sub_10028FC14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICTagContainerCell)initWithCoder:(id)a3
{
  return (ICTagContainerCell *)sub_10028FD68(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagContainerCell_presentingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagContainerCell_defaultAccountObjectID));
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR___ICTagContainerCell_selectionDidChange));
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR___ICTagContainerCell_dataDidChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagContainerCell____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagContainerCell_leadingConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___ICTagContainerCell_trailingConstraint);
}

@end