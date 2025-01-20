@interface PlaceSummaryOutlineCell
- (BOOL)isHovering;
- (_TtC4Maps23PlaceSummaryOutlineCell)initWithCoder:(id)a3;
- (_TtC4Maps23PlaceSummaryOutlineCell)initWithFrame:(CGRect)a3;
- (_TtC4Maps28PlaceSummaryOutlineCellModel)viewModel;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)prepareForReuse;
- (void)setHovering:(BOOL)a3;
- (void)setViewModel:(id)a3;
- (void)updateDisclosureIndicator;
@end

@implementation PlaceSummaryOutlineCell

- (_TtC4Maps28PlaceSummaryOutlineCellModel)viewModel
{
  return (_TtC4Maps28PlaceSummaryOutlineCellModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super
                                                                                            + OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_viewModel));
}

- (void)setViewModel:(id)a3
{
  v4 = *(void **)((char *)&self->super.super + OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_viewModel);
  *(MapsThemeCollectionViewOutlineCell *)((char *)&self->super.super
                                        + OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_viewModel) = (MapsThemeCollectionViewOutlineCell)a3;
  id v6 = a3;
  v5 = self;

  sub_1001FC4B4();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlaceSummaryOutlineCell();
  v2 = (char *)v4.receiver;
  [(PlaceSummaryOutlineCell *)&v4 prepareForReuse];
  v3 = *(void **)&v2[OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_curatedGuideViewModel];
  *(void *)&v2[OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_curatedGuideViewModel] = 0;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1001FC74C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC4Maps23PlaceSummaryOutlineCell)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps23PlaceSummaryOutlineCell *)sub_1001FD5AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps23PlaceSummaryOutlineCell)initWithCoder:(id)a3
{
  *(MapsThemeCollectionViewOutlineCell *)((char *)&self->super.super
                                        + OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_curatedGuideViewModel) = 0;
  *(MapsThemeCollectionViewOutlineCell *)((char *)&self->super.super
                                        + OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_viewModel) = 0;
  id v4 = a3;

  result = (_TtC4Maps23PlaceSummaryOutlineCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isHovering
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlaceSummaryOutlineCell();
  return [(SidebarOutlineCell *)&v3 isHovering];
}

- (void)setHovering:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (objc_class *)type metadata accessor for PlaceSummaryOutlineCell();
  v9.receiver = self;
  v9.super_class = v5;
  uint64_t v6 = self;
  char v7 = [(SidebarOutlineCell *)&v9 isHovering];
  v8.receiver = v6;
  v8.super_class = v5;
  [(SidebarOutlineCell *)&v8 setHovering:v3];
  sub_1001FD80C(v7);
}

- (void)updateDisclosureIndicator
{
  v2 = self;
  sub_1001FD8DC();
}

- (void).cxx_destruct
{
  BOOL v3 = *(void **)((char *)&self->super.super + OBJC_IVAR____TtC4Maps23PlaceSummaryOutlineCell_viewModel);
}

@end