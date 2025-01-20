@interface Artwork.Component.OverlayView
- (UIColor)backgroundColor;
- (_TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView)initWithCoder:(id)a3;
- (_TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView)initWithFrame:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation Artwork.Component.OverlayView

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)_s9ComponentC11OverlayViewCMa();
  v2 = [(Artwork.Component.OverlayView *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView_enforcedBackgroundColor);
  if (v4) {
    id v5 = *(Class *)((char *)&self->super.super.super.isa
  }
                  + OBJC_IVAR____TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView_enforcedBackgroundColor);
  else {
    id v5 = a3;
  }
  v8.receiver = self;
  v8.super_class = (Class)_s9ComponentC11OverlayViewCMa();
  v6 = self;
  id v7 = v4;
  [(Artwork.Component.OverlayView *)&v8 setBackgroundColor:v5];
}

- (_TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView_enforcedBackgroundColor) = 0;
  v8.receiver = self;
  v8.super_class = (Class)_s9ComponentC11OverlayViewCMa();
  return -[Artwork.Component.OverlayView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView_enforcedBackgroundColor) = 0;
  v5.receiver = self;
  v5.super_class = (Class)_s9ComponentC11OverlayViewCMa();
  return [(Artwork.Component.OverlayView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCE16MusicMessagesAppV11MusicCoreUI7Artwork9ComponentP33_F6B6DCEFF56A9DC1390A9746FE4F657811OverlayView_enforcedBackgroundColor));
}

@end