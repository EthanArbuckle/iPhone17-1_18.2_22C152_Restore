@interface PageHeaderContentContainerReusableView
- (_TtC16MusicApplication38PageHeaderContentContainerReusableView)initWithCoder:(id)a3;
- (_TtC16MusicApplication38PageHeaderContentContainerReusableView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PageHeaderContentContainerReusableView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PageHeaderContentContainerReusableView();
  v2 = (char *)v5.receiver;
  [(PageHeaderContentContainerReusableView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MusicApplication38PageHeaderContentContainerReusableView_pageHeaderContentView];
  if (v3)
  {
    v4 = v3;
    [v2 bounds];
    [v4 setFrame:];

    v2 = v4;
  }
}

- (_TtC16MusicApplication38PageHeaderContentContainerReusableView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication38PageHeaderContentContainerReusableView_pageHeaderContentView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PageHeaderContentContainerReusableView();
  return -[PageHeaderContentContainerReusableView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplication38PageHeaderContentContainerReusableView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication38PageHeaderContentContainerReusableView_pageHeaderContentView) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PageHeaderContentContainerReusableView();
  id v4 = a3;
  objc_super v5 = [(PageHeaderContentContainerReusableView *)&v7 initWithCoder:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication38PageHeaderContentContainerReusableView_pageHeaderContentView));
}

@end