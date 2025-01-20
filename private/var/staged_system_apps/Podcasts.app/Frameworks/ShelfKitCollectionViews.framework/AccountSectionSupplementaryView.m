@interface AccountSectionSupplementaryView
- (UIColor)backgroundColor;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView)initWithReuseIdentifier:(id)a3;
- (void)buttonTapped;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBackgroundColor:(id)a3;
@end

@implementation AccountSectionSupplementaryView

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AccountSectionSupplementaryView();
  v2 = [(AccountSectionSupplementaryView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AccountSectionSupplementaryView();
  id v4 = v9.receiver;
  id v5 = a3;
  [(AccountSectionSupplementaryView *)&v9 setBackgroundColor:v5];
  id v6 = [v4 backgroundView];
  if (v6)
  {
    v7 = v6;
    id v8 = [v4 backgroundColor];
    [v7 setBackgroundColor:v8];

    id v4 = v8;
    id v5 = v7;
  }
}

- (_TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_3843C0();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  sub_1E0ECC(v3, v4);
  return result;
}

- (_TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E21E4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E120C();
}

- (void)buttonTapped
{
  v2 = *(void (**)(uint64_t))&self->UICollectionViewTableHeaderFooterView_opaque[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView_buttonAction];
  if (v2)
  {
    uint64_t v4 = self;
    uint64_t v3 = sub_3C800((uint64_t)v2);
    v2(v3);
    sub_27760((uint64_t)v2);
  }
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1E193C();
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)&self->UICollectionViewTableHeaderFooterView_opaque[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView_titleLabel];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_27760(*(void *)&self->UICollectionViewTableHeaderFooterView_opaque[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView_buttonAction]);

  uint64_t v3 = *(void **)&self->UICollectionViewTableHeaderFooterView_opaque[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountSectionSupplementaryView_bottomSeparatorView];
}

@end