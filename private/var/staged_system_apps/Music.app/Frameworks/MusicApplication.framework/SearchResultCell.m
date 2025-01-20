@interface SearchResultCell
- (BOOL)accessibilityIsExplicit;
- (NSString)additionalDescription;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication16SearchResultCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication16SearchResultCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setAdditionalDescription:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SearchResultCell

- (_TtC16MusicApplication16SearchResultCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication16SearchResultCell *)sub_41C680(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication16SearchResultCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_420008();
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)sub_42EA8();
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)additionalDescription
{
  return (NSString *)sub_42EA8();
}

- (void)setAdditionalDescription:(id)a3
{
  uint64_t v5 = sub_AB6510();
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_additionalDescription];
  uint64_t v7 = *(void *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_additionalDescription];
  uint64_t v8 = *(void *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_additionalDescription];
  uint64_t *v6 = v5;
  v6[1] = v9;
  id v10 = a3;
  v11 = self;
  sub_41D368(v7, v8);

  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_41D488();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(SearchResultCell *)v5 traitCollection];
  sub_41FC80(v6);

  [v4 frame];
  [v4 setFrame:];

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_41E1CC(a3);
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2 = *(void *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_badgeView];
  return v2 && sub_4C10E0(0, *(void *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  id v3 = *(void **)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16SearchResultCell____lazy_storage___disclosureIndicator];
}

@end