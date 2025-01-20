@interface SearchHintCollectionViewCell
- (BOOL)isHighlighted;
- (_TtC8AppStore14SearchHintView)accessibilityHintView;
- (_TtC8AppStore28SearchHintCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore28SearchHintCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SearchHintCollectionViewCell

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchHintCollectionViewCell();
  return [(SearchHintCollectionViewCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SearchHintCollectionViewCell();
  id v4 = v5.receiver;
  [(SearchHintCollectionViewCell *)&v5 setHighlighted:v3];
  sub_10071F2C8();
}

- (_TtC8AppStore28SearchHintCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore28SearchHintCollectionViewCell *)sub_10071F394(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore28SearchHintCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore28SearchHintCollectionViewCell_hintView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SearchHintView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC8AppStore28SearchHintCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SearchHintCollectionViewCell();
  v2 = (char *)v13.receiver;
  [(SearchHintCollectionViewCell *)&v13 layoutSubviews];
  BOOL v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore28SearchHintCollectionViewCell_hintView];
  id v4 = [v2 contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v3 setFrame:v6, v8, v10, v12];
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10071F658();
}

- (_TtC8AppStore14SearchHintView)accessibilityHintView
{
  return (_TtC8AppStore14SearchHintView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                  + OBJC_IVAR____TtC8AppStore28SearchHintCollectionViewCell_hintView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore28SearchHintCollectionViewCell_hintView));
}

@end