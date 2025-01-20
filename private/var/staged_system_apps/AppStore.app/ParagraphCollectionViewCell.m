@interface ParagraphCollectionViewCell
- (_TtC8AppStore18ExpandableTextView)accessibilityExpandableTextView;
- (_TtC8AppStore27ParagraphCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore27ParagraphCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ParagraphCollectionViewCell

- (_TtC8AppStore27ParagraphCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27ParagraphCollectionViewCell *)sub_100778588(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore27ParagraphCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_expandableTextView;
  sub_100084CF0(0, (unint64_t *)&qword_100981AA0);
  id v8 = a3;
  v9 = (void *)static UIColor.defaultBackground.getter();
  id v10 = objc_allocWithZone((Class)type metadata accessor for ExpandableTextView());
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)sub_1005C6EE0(v9, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8AppStore27ParagraphCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType();
  v2 = (char *)v17.receiver;
  [(ParagraphCollectionViewCell *)&v17 layoutSubviews];
  id v3 = [v2 contentView];
  sub_100084CF0(0, (unint64_t *)&qword_1009828E0);
  LayoutMarginsAware<>.layoutFrame.getter();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = *(void **)&v2[OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_expandableTextView];
  [v12 sizeThatFits:v9, v11];
  double v14 = v13;
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  double MinX = CGRectGetMinX(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  double MinY = CGRectGetMinY(v19);
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  [v12 setFrame:MinX, MinY, CGRectGetWidth(v20), v14];
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10077846C();
}

- (_TtC8AppStore18ExpandableTextView)accessibilityExpandableTextView
{
  return (_TtC8AppStore18ExpandableTextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                      + OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_expandableTextView));
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_itemLayoutContext);
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore27ParagraphCollectionViewCell_expandableTextView);
}

@end