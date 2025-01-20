@interface PrivacyCategoryCollectionViewCell
- (_TtC8AppStore19PrivacyCategoryView)accessibilityCategoryView;
- (_TtC8AppStore33PrivacyCategoryCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore33PrivacyCategoryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PrivacyCategoryCollectionViewCell

- (_TtC8AppStore33PrivacyCategoryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore33PrivacyCategoryCollectionViewCell *)sub_1003D55EC();
}

- (_TtC8AppStore33PrivacyCategoryCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategoryView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for PrivacyCategoryView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  v8 = (char *)self + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_itemLayoutContext;
  uint64_t v9 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategory) = 0;

  result = (_TtC8AppStore33PrivacyCategoryCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(PrivacyCategoryCollectionViewCell *)&v13 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategoryView];
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
  sub_1003D5154();
}

- (_TtC8AppStore19PrivacyCategoryView)accessibilityCategoryView
{
  return (_TtC8AppStore19PrivacyCategoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                       + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategoryView));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_privacyCategoryView));
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore33PrivacyCategoryCollectionViewCell_itemLayoutContext);

  swift_release();
}

@end