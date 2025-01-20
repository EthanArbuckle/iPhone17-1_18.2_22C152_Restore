@interface CircularLoadingViewController
- (_TtC16MusicApplication29CircularLoadingViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication29CircularLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation CircularLoadingViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_E55C0();
}

- (_TtC16MusicApplication29CircularLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_AB6510();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_circleLayer) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_progressLayer) = 0;
    id v8 = a4;
    a3 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_circleLayer) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_progressLayer) = 0;
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(CircularLoadingViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC16MusicApplication29CircularLoadingViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_circleLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_progressLayer) = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  id v6 = a3;
  v7 = [(CircularLoadingViewController *)&v9 initWithCoder:v6];

  return v7;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_circleLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication29CircularLoadingViewController_progressLayer);
}

@end