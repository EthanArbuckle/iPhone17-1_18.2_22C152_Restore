@interface FlowcaseCell
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (NSString)descriptionText;
- (NSString)descriptionTitle;
- (NSString)headline;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication12FlowcaseCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication12FlowcaseCell)initWithFrame:(CGRect)a3;
- (void)clearArtworkCatalogs;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDescriptionText:(id)a3;
- (void)setDescriptionTitle:(id)a3;
- (void)setHeadline:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FlowcaseCell

- (_TtC16MusicApplication12FlowcaseCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12FlowcaseCell *)sub_8D4D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12FlowcaseCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_92C80();
}

- (NSString)headline
{
  return (NSString *)sub_42EA8();
}

- (void)setHeadline:(id)a3
{
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
  return (NSString *)sub_8E8C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_AB6510();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_subtitle);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_subtitle);
  uint64_t v8 = *(void *)&self->headline[OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_subtitle];
  uint64_t *v6 = v4;
  v6[1] = v5;
  v9 = self;
  sub_8E010(v7, v8);

  swift_bridgeObjectRelease();
}

- (NSString)descriptionTitle
{
  return (NSString *)sub_8E8C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionTitle);
}

- (void)setDescriptionTitle:(id)a3
{
}

- (NSString)descriptionText
{
  return (NSString *)sub_8E8C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionText);
}

- (void)setDescriptionText:(id)a3
{
}

- (void)prepareForReuse
{
  v2 = self;
  sub_8FA9C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_8FB64();
}

- (void)clearArtworkCatalogs
{
  v2 = self;
  sub_90B9C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_90CA0(a3);
}

- (BOOL)isHighlighted
{
  return sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  unsigned int v7 = [(FlowcaseCell *)&v10 isHighlighted];
  v9.receiver = v6;
  v9.super_class = ObjectType;
  [(FlowcaseCell *)&v9 setHighlighted:v3];
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != [(FlowcaseCell *)&v8 isHighlighted]) {
    sub_90F8C();
  }
}

- (BOOL)isSelected
{
  return sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  unsigned int v7 = [(FlowcaseCell *)&v10 isSelected];
  v9.receiver = v6;
  v9.super_class = ObjectType;
  [(FlowcaseCell *)&v9 setSelected:v3];
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != [(FlowcaseCell *)&v8 isSelected])
  {
    sub_90F8C();
    sub_91120();
  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_backgroundArtworkCatalog));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_thumbnailArtworkCatalog));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_topTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_descriptionTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_durationTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12FlowcaseCell____lazy_storage___selectedIndicatorView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

@end