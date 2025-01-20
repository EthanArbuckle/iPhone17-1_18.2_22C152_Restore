@interface DOCItemCollectionViewSectionHeader
- (_TtC5Files34DOCItemCollectionViewSectionHeader)initWithCoder:(id)a3;
- (_TtC5Files34DOCItemCollectionViewSectionHeader)initWithFrame:(CGRect)a3;
- (id)accessibilityTitleLabel;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)didMoveToWindow;
- (void)prepareForReuse;
@end

@implementation DOCItemCollectionViewSectionHeader

- (_TtC5Files34DOCItemCollectionViewSectionHeader)initWithFrame:(CGRect)a3
{
  return (_TtC5Files34DOCItemCollectionViewSectionHeader *)sub_1004D5254(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Files34DOCItemCollectionViewSectionHeader)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004DAFF8();
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCItemCollectionViewSectionHeader();
  id v2 = v5.receiver;
  [(DOCItemCollectionViewSectionHeader *)&v5 didMoveToWindow];
  id v3 = [v2 window];

  if (v3)
  {
    id v4 = [v2 traitCollection];
    sub_1004D876C();

    id v2 = v4;
  }
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_1004D73A0();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1004D8B48((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)accessibilityTitleLabel
{
  id v2 = self;
  id v3 = sub_1004D910C();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader____lazy_storage___sectionTitleControl));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader____lazy_storage___expandToggleButtonVisibleConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader____lazy_storage___topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader____lazy_storage___bottomSeparator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_sortButtonsStackView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000CBBA4((uint64_t)self + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_sortingDescriptor, (uint64_t *)&unk_1007086D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_groupByMenu));
  sub_100220130(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_representedCollectionSection), *(void *)&self->seeLessString[OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_representedCollectionSection]);
  sub_1000A7258(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_toggleExpandedHandler));
  sub_1000A7258(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_sortButtonTapHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader_customBackgroundView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files34DOCItemCollectionViewSectionHeader__labelForAX);
}

@end