@interface ContainerDetailHeaderReusableView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication33ContainerDetailHeaderReusableView)initWithCoder:(id)a3;
- (_TtC16MusicApplication33ContainerDetailHeaderReusableView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ContainerDetailHeaderReusableView

- (_TtC16MusicApplication33ContainerDetailHeaderReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication33ContainerDetailHeaderReusableView *)sub_156094(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication33ContainerDetailHeaderReusableView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1569D0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1563B0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_15665C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33ContainerDetailHeaderReusableView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication33ContainerDetailHeaderReusableView_separator));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication33ContainerDetailHeaderReusableView_highlightView);
}

@end