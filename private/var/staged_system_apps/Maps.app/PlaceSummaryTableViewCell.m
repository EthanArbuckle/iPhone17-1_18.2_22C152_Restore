@interface PlaceSummaryTableViewCell
+ (NSString)reuseIdentifier;
+ (double)autocompleteResultEstimatedHeight;
+ (double)searchResultEstimatedHeight;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasActionButtons;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (PersonalizedItem)personalizedItemForQuickActionMenu;
- (_TtC4Maps25PlaceSummaryTableViewCell)initWithCoder:(id)a3;
- (_TtC4Maps25PlaceSummaryTableViewCell)initWithReuseIdentifier:(id)a3;
- (_TtC4Maps25PlaceSummaryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtC4Maps28PlaceSummaryAsyncDataManager)asyncDataManager;
- (_TtC4Maps29PlaceSummaryViewModelTemplate)viewModel;
- (_TtP4Maps33PlaceSummaryTableViewCellDelegate_)delegate;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
- (void)setAsyncDataManager:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasActionButtons:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setViewModel:(id)a3;
- (void)setViewModel:(id)a3 delegate:(id)a4 asyncDataManager:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlaceSummaryTableViewCell

- (_TtP4Maps33PlaceSummaryTableViewCellDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps33PlaceSummaryTableViewCellDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC4Maps28PlaceSummaryAsyncDataManager)asyncDataManager
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC4Maps28PlaceSummaryAsyncDataManager *)Strong;
}

- (void)setAsyncDataManager:(id)a3
{
}

- (BOOL)hasActionButtons
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_hasActionButtons);
}

- (void)setHasActionButtons:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_hasActionButtons) = a3;
}

+ (NSString)reuseIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (_TtC4Maps29PlaceSummaryViewModelTemplate)viewModel
{
  return (_TtC4Maps29PlaceSummaryViewModelTemplate *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                             + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel));
}

- (void)setViewModel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel) = (Class)a3;
  id v3 = a3;
}

+ (double)searchResultEstimatedHeight
{
  return 112.0;
}

+ (double)autocompleteResultEstimatedHeight
{
  return 69.0;
}

- (_TtC4Maps25PlaceSummaryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC4Maps25PlaceSummaryTableViewCell *)sub_10032D8C8(a3, (uint64_t)a4, v6);
}

- (_TtC4Maps25PlaceSummaryTableViewCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_hasActionButtons) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel) = 0;
  id v5 = a3;

  result = (_TtC4Maps25PlaceSummaryTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC4Maps25PlaceSummaryTableViewCell)initWithReuseIdentifier:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_hasActionButtons) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel) = 0;

  result = (_TtC4Maps25PlaceSummaryTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlaceSummaryTableViewCell();
  NSString v2 = (char *)v4.receiver;
  [(PlaceSummaryTableViewCell *)&v4 prepareForReuse];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel];
  *(void *)&v2[OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel] = 0;

  swift_unknownObjectWeakAssign();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v10 = self;
  v11 = self;
  [v10 setFrameStallSkipRequest:1];
  v20.receiver = v11;
  v20.super_class = (Class)type metadata accessor for PlaceSummaryTableViewCell();
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  -[PlaceSummaryTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v20, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v12, v13);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (void)setViewModel:(id)a3 delegate:(id)a4 asyncDataManager:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_10032DD6C(v8, (uint64_t)a4, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10033045C();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = self;
  sub_10032DFDC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel);
  if (v7)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v8 = self;
    id v9 = v7;
    static Published.subscript.setter();
  }
  else
  {
    v10 = self;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PlaceSummaryTableViewCell();
  [(PlaceSummaryTableViewCell *)&v11 setSelected:v5 animated:v4];
}

- (void).cxx_destruct
{
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_delegate);
  swift_unknownObjectWeakDestroy();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryTableViewCell_viewModel);
}

- (PersonalizedItem)personalizedItemForQuickActionMenu
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    BOOL v4 = (void *)Strong;
    BOOL v5 = self;
    id v6 = [v4 personalizedItemForQuickActionMenuWithCell:v5];

    swift_unknownObjectRelease();
  }
  else
  {
    id v6 = 0;
  }

  return (PersonalizedItem *)v6;
}

- (BOOL)canBecomeFirstResponder
{
  return sub_1000BBB44(a1) == 5;
}

@end