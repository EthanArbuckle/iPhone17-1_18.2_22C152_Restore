@interface SegmentedControlCollectionViewCell
- (_TtC8AppStore34SegmentedControlCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore34SegmentedControlCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SegmentedControlCollectionViewCell

- (_TtC8AppStore34SegmentedControlCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34SegmentedControlCollectionViewCell *)sub_100667340(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34SegmentedControlCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore34SegmentedControlCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8AppStore34SegmentedControlCollectionViewCell_isFirstSetup) = 1;
  id v7 = a3;

  result = (_TtC8AppStore34SegmentedControlCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  [(SegmentedControlCollectionViewCell *)&v8 layoutSubviews];
  LayoutMarginsAware<>.layoutFrame.getter();
  CGRectGetWidth(v9);
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore34SegmentedControlCollectionViewCell_segmentedControl];
  LayoutMarginsAware<>.layoutFrame.getter();
  [v3 sizeThatFits:v4, v5, [v8 receiver], [v8 super_class]];
  LayoutMarginsAware<>.layoutFrame.getter();
  double v7 = v6;
  LayoutMarginsAware<>.layoutFrame.getter();
  [v3 setFrame:v7];
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore34SegmentedControlCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore34SegmentedControlCollectionViewCell_segmentedControl);
}

@end