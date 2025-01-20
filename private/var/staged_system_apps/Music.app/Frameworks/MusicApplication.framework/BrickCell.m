@interface BrickCell
+ (UIEdgeInsets)visualContentInsets;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (NSString)headline;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication9BrickCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication9BrickCell)initWithFrame:(CGRect)a3;
- (void)clearArtworkCatalogs;
- (void)layoutSubviews;
- (void)setHeadline:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BrickCell

- (_TtC16MusicApplication9BrickCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication9BrickCell *)sub_44B4A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication9BrickCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_44DC68();
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
  return (NSString *)sub_42EA8();
}

- (void)setSubtitle:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_44BAC0();
}

- (void)clearArtworkCatalogs
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication9BrickCell_artworkComponent);
  id v3 = (void *)v2[18];
  v4 = self;
  [v3 clearArtworkCatalogs];
  *(void *)((char *)v2
            + OBJC_IVAR____TtCE16MusicApplicationV11MusicCoreUI7Artwork9Component_representationsUpdatedFromConfigurationBlock) = 0;
  v2[29] = 0;
  v2[30] = 0;

  swift_bridgeObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_44C6F8(a3);
}

+ (UIEdgeInsets)visualContentInsets
{
  sub_44D5E4();
  uint64_t v3 = v2;
  swift_beginAccess();
  double v4 = *(double *)(v3 + 104);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v4;
  result.right = v7;
  result.bottom = v8;
  result.left = v6;
  result.top = v5;
  return result;
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
  double v6 = self;
  unsigned int v7 = [(BrickCell *)&v10 isHighlighted];
  v9.receiver = v6;
  v9.super_class = ObjectType;
  [(BrickCell *)&v9 setHighlighted:v3];
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != [(BrickCell *)&v8 isHighlighted]) {
    sub_44CB00();
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
  double v6 = self;
  unsigned int v7 = [(BrickCell *)&v10 isSelected];
  v9.receiver = v6;
  v9.super_class = ObjectType;
  [(BrickCell *)&v9 setSelected:v3];
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if (v7 != [(BrickCell *)&v8 isSelected])
  {
    sub_44CB00();
    sub_44CC54();
  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9BrickCell_lockupImageArtworkCatalog));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9BrickCell_headlineTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9BrickCell_titleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9BrickCell_subtitleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9BrickCell____lazy_storage___selectedIndicatorView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication9BrickCell_layoutInvalidationHandler);

  sub_1A528(v3);
}

@end