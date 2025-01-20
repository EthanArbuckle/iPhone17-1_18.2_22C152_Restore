@interface CuratedGuideTableViewCell
+ (NSString)reuseIdentifier;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC4Maps21CuratedGuideViewModel)viewModel;
- (_TtC4Maps25CuratedGuideTableViewCell)initWithCoder:(id)a3;
- (_TtC4Maps25CuratedGuideTableViewCell)initWithReuseIdentifier:(id)a3;
- (_TtC4Maps25CuratedGuideTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_TtP4Maps33CuratedGuideTableViewCellDelegate_)delegate;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)configureWith:(id)a3 delegate:(id)a4 imageLoader:(id)a5;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation CuratedGuideTableViewCell

- (_TtP4Maps33CuratedGuideTableViewCellDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps33CuratedGuideTableViewCellDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

+ (NSString)reuseIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (_TtC4Maps21CuratedGuideViewModel)viewModel
{
  return (_TtC4Maps21CuratedGuideViewModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                     + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel));
}

- (void)setViewModel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel) = (Class)a3;
  id v3 = a3;
}

- (_TtC4Maps25CuratedGuideTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC4Maps25CuratedGuideTableViewCell *)sub_1001D5F70(a3, (uint64_t)a4, v6);
}

- (_TtC4Maps25CuratedGuideTableViewCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel) = 0;
  id v5 = a3;

  result = (_TtC4Maps25CuratedGuideTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC4Maps25CuratedGuideTableViewCell)initWithReuseIdentifier:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel) = 0;

  result = (_TtC4Maps25CuratedGuideTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CuratedGuideTableViewCell();
  NSString v2 = (char *)v4.receiver;
  [(CuratedGuideTableViewCell *)&v4 prepareForReuse];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel];
  *(void *)&v2[OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel] = 0;

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
  v20.super_class = (Class)type metadata accessor for CuratedGuideTableViewCell();
  *(float *)&double v12 = a4;
  *(float *)&double v13 = a5;
  -[CuratedGuideTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v20, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v12, v13);
  double v15 = v14;
  double v17 = v16;

  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (void)configureWith:(id)a3 delegate:(id)a4 imageLoader:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  v9 = self;
  sub_1001D63A0(v7);

  swift_unknownObjectRelease();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = self;
  sub_1001D64F0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC4Maps25CuratedGuideTableViewCell_viewModel);
}

@end