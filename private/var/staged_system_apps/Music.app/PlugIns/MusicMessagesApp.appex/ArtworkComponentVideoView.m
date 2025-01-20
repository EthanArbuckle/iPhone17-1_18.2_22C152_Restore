@interface ArtworkComponentVideoView
+ (Class)layerClass;
- (_TtC16MusicMessagesApp25ArtworkComponentVideoView)init;
- (_TtC16MusicMessagesApp25ArtworkComponentVideoView)initWithCoder:(id)a3;
- (_TtC16MusicMessagesApp25ArtworkComponentVideoView)initWithFrame:(CGRect)a3;
@end

@implementation ArtworkComponentVideoView

- (_TtC16MusicMessagesApp25ArtworkComponentVideoView)init
{
  return -[ArtworkComponentVideoView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

+ (Class)layerClass
{
  sub_100007788(0, &qword_1005A01F0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC16MusicMessagesApp25ArtworkComponentVideoView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_statusHandler);
  void *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_waitingToPlayHandler);
  void *v8 = 0;
  v8[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_cropStyle) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ArtworkComponentVideoView();
  return -[ArtworkComponentVideoView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicMessagesApp25ArtworkComponentVideoView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_statusHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_waitingToPlayHandler);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_cropStyle) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ArtworkComponentVideoView();
  return [(ArtworkComponentVideoView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1000109BC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_statusHandler));
  sub_1000109BC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_waitingToPlayHandler));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicMessagesApp25ArtworkComponentVideoView_cropStyle);
}

@end