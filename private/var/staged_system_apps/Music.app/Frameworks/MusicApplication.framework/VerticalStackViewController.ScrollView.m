@interface VerticalStackViewController.ScrollView
- (_TtCC16MusicApplication27VerticalStackViewController10ScrollView)initWithCoder:(id)a3;
- (_TtCC16MusicApplication27VerticalStackViewController10ScrollView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VerticalStackViewController.ScrollView

- (void)layoutSubviews
{
  v2 = self;
  sub_531FF0();
}

- (_TtCC16MusicApplication27VerticalStackViewController10ScrollView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_backgroundView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_foregroundView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for VerticalStackViewController.ScrollView();
  return -[VerticalStackViewController.ScrollView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC16MusicApplication27VerticalStackViewController10ScrollView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_backgroundView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_foregroundView) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VerticalStackViewController.ScrollView();
  id v4 = a3;
  v5 = [(VerticalStackViewController.ScrollView *)&v7 initWithCoder:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_backgroundView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication27VerticalStackViewController10ScrollView_foregroundView);
}

@end