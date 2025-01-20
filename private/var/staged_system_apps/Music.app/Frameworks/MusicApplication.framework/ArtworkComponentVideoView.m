@interface ArtworkComponentVideoView
+ (Class)layerClass;
- (_TtC16MusicApplication25ArtworkComponentVideoView)init;
- (_TtC16MusicApplication25ArtworkComponentVideoView)initWithCoder:(id)a3;
- (_TtC16MusicApplication25ArtworkComponentVideoView)initWithFrame:(CGRect)a3;
@end

@implementation ArtworkComponentVideoView

- (_TtC16MusicApplication25ArtworkComponentVideoView)init
{
  return -[ArtworkComponentVideoView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

+ (Class)layerClass
{
  sub_173E4(0, &qword_DC2968);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC16MusicApplication25ArtworkComponentVideoView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_statusHandler);
  void *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_waitingToPlayHandler);
  void *v8 = 0;
  v8[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_cropStyle) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ArtworkComponentVideoView();
  return -[ArtworkComponentVideoView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication25ArtworkComponentVideoView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_statusHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_waitingToPlayHandler);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_cropStyle) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ArtworkComponentVideoView();
  id v6 = a3;
  v7 = [(ArtworkComponentVideoView *)&v9 initWithCoder:v6];

  return v7;
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_statusHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_waitingToPlayHandler));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication25ArtworkComponentVideoView_cropStyle);
}

@end