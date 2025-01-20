@interface FootnoteCollectionViewCell
- (BOOL)isHighlighted;
- (_TtC8AppStore12FootnoteView)accessibilityFootnoteView;
- (_TtC8AppStore26FootnoteCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore26FootnoteCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation FootnoteCollectionViewCell

- (_TtC8AppStore26FootnoteCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26FootnoteCollectionViewCell *)sub_1004EA0C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore26FootnoteCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_footnoteView;
  type metadata accessor for FootnoteView();
  id v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)[v8 init];

  result = (_TtC8AppStore26FootnoteCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1004E9FF8();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(FootnoteCollectionViewCell *)&v13 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_footnoteView];
  id v4 = [v2 contentView];
  sub_10003A33C();
  LayoutMarginsAware<>.layoutFrame.getter();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v3 setFrame:v6, v8, v10, v12];
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(FootnoteCollectionViewCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_1004EA4E4(a3);
}

- (_TtC8AppStore12FootnoteView)accessibilityFootnoteView
{
  return (_TtC8AppStore12FootnoteView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                + OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_footnoteView));
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_itemLayoutContext);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore26FootnoteCollectionViewCell_footnoteView);
}

@end