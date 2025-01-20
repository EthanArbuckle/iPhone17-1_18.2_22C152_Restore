@interface PosterCell
- (NSString)accessibilityAltText;
- (NSString)accessibilityDescriptionText;
- (NSString)accessibilitySubtitle;
- (NSString)accessibilityTitle;
- (NSString)description;
- (NSString)overlayTitleText;
- (UIImage)materialImage;
- (_TtC16MusicApplication10PosterCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication10PosterCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setNeedsLayout;
- (void)setOverlayTitleText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PosterCell

- (_TtC16MusicApplication10PosterCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10PosterCell *)sub_3C968(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10PosterCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_45434();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v8.receiver;
  [(VerticalLockupCollectionViewCell *)&v8 traitCollectionDidChange:v4];
  id v6 = [v5 traitCollection];
  double v7 = sub_44F9C(v6, *((unsigned char *)v5 + OBJC_IVAR____TtC16MusicApplication10PosterCell_displayStyle));

  sub_4A8270(v7);
  sub_3D37C();
}

- (NSString)overlayTitleText
{
  return (NSString *)sub_42EA8();
}

- (void)setOverlayTitleText:(id)a3
{
  uint64_t v5 = sub_AB6510();
  uint64_t v7 = v6;
  id v8 = a3;
  v9 = self;
  sub_3DB28(v5, v7);
}

- (UIImage)materialImage
{
  if (*((unsigned char *)&self->super.super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC16MusicApplication10PosterCell_displayStyle) == 2)
    id v2 = [(*(id **)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkComponent))[18] image];
  else {
    id v2 = 0;
  }

  return (UIImage *)v2;
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_3FF08();
}

- (void)setNeedsLayout
{
  sub_173E4(0, (unint64_t *)&qword_DC0F50);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  id v4 = self;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_45A3C, v3);
  swift_release();
}

- (NSString)description
{
  id v2 = self;
  sub_418E0();

  NSString v3 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)accessibilityTitle
{
  return (NSString *)sub_42EA8();
}

- (NSString)accessibilitySubtitle
{
  return (NSString *)sub_42EA8();
}

- (NSString)accessibilityDescriptionText
{
  return (NSString *)sub_42EA8();
}

- (NSString)accessibilityAltText
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication10PosterCell_videoLooperDidChangeHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication10PosterCell_videoLooperDidFailHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication10PosterCell_isPlayingDidChangeHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell_badgeView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_451D4(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___overlayTextComponents));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___overlayTextStackView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___measurementTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___gradientBottomView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___gradientTopView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell_shadowBackdropView));
  NSString v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___symbolButton);
}

@end