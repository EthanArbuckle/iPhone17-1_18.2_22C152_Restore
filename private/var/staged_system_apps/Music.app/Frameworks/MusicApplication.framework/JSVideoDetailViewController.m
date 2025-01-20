@interface JSVideoDetailViewController
- (_TtC16MusicApplication27JSVideoDetailViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication27JSVideoDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation JSVideoDetailViewController

- (_TtC16MusicApplication27JSVideoDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_AB6510();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponse) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponseInvalidationObserver) = 0;
    id v6 = a4;
    NSString v7 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponse) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponseInvalidationObserver) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for JSVideoDetailViewController();
  v9 = [(JSVideoDetailViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC16MusicApplication27JSVideoDetailViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponse) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponseInvalidationObserver) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for JSVideoDetailViewController();
  id v4 = a3;
  v5 = [(JSVideoDetailViewController *)&v7 initWithCoder:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSVideoDetailViewController_modelResponse));

  swift_release();
}

@end