@interface ArtworkView
- (BOOL)accessibilityIgnoresInvertColors;
- (CGRect)frame;
- (CGSize)intrinsicContentSize;
- (NSString)accessibilityTitle;
- (UIColor)backgroundColor;
- (_TtC23ShelfKitCollectionViews11ArtworkView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews11ArtworkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityTitle:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation ArtworkView

- (_TtC23ShelfKitCollectionViews11ArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews11ArtworkView *)sub_12697C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews11ArtworkView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_129324();
}

- (NSString)accessibilityTitle
{
  if (*(void *)&self->super.cornerRadius[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_accessibilityTitle])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAccessibilityTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_3843C0();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_accessibilityTitle);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (UIColor)backgroundColor
{
  id v2 = [self clearColor];

  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_internalBackgroundColor);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_internalBackgroundColor) = (Class)a3;
  id v6 = a3;
  uint64_t v5 = self;

  sub_125ADC();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_127A58();
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ArtworkView();
  [(ArtworkView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_127FFC(x, y, width, height);
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_imageView) intrinsicContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView__contentView));
  double v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_aspectRule;
  uint64_t v4 = sub_37C710();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_EB410(*(char **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle), *(void *)&self->super.cornerRadius[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle], *(void *)&self->super.cornerStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle], *(void *)&self->super.roundedCorners[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle + 7], *(void *)&self->super.borderView[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle + 7], *(void *)&self->super.borderColor[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle + 7], *(void *)&self->super.borderWidth[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle + 7], *(void *)&self->imageView[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle], *(void *)&self->_contentView[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle], *(void *)&self->accessibilityTitle[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle], *(void *)&self->accessibilityTitle[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle + 8], *(void **)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_mt_hoverStyle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_shadow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradientView));
  sub_EB49C(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient), *(void *)&self->super.cornerRadius[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient], *(void *)&self->super.cornerStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient], *(void *)&self->super.roundedCorners[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient + 7], *(void *)&self->super.borderView[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient + 7], *(void *)&self->super.borderColor[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient + 7], *(void *)&self->super.borderWidth[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient + 7], *(void **)&self->imageView[OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_gradient]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11ArtworkView_internalBackgroundColor));

  swift_release();
}

@end