@interface CustomRoomMusicVideoCell
+ (UIEdgeInsets)visualContentInsets;
- (NSString)descriptionText;
- (NSString)headlineText;
- (NSString)subtitle;
- (NSString)title;
- (_TtC16MusicApplication24CustomRoomMusicVideoCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication24CustomRoomMusicVideoCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setDescriptionText:(id)a3;
- (void)setHeadlineText:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CustomRoomMusicVideoCell

- (_TtC16MusicApplication24CustomRoomMusicVideoCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication24CustomRoomMusicVideoCell *)sub_16FA48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication24CustomRoomMusicVideoCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_172544();
}

- (NSString)headlineText
{
  return (NSString *)sub_42EA8();
}

- (void)setHeadlineText:(id)a3
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

- (NSString)descriptionText
{
  return (NSString *)sub_42EA8();
}

- (void)setDescriptionText:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CustomRoomMusicVideoCell();
  id v4 = a3;
  id v5 = v7.receiver;
  [(VerticalLockupCollectionViewCell *)&v7 traitCollectionDidChange:v4];
  id v6 = [v5 traitCollection];
  if ([v6 horizontalSizeClass]) {
    sub_171418();
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_170D10();
}

+ (UIEdgeInsets)visualContentInsets
{
  sub_172264(v8);
  uint64_t v2 = v8[3];
  swift_beginAccess();
  double v3 = *(double *)(v2 + 104);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v9 = v8[4];
  sub_45308((uint64_t)&v9);
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = v3;
  result.right = v6;
  result.bottom = v7;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_badgeView));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_headlineTextDrawingView);
}

@end