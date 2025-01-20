@interface PXStoryAsyncPlayerView
- (_TtC12PhotosUICore22PXStoryAsyncPlayerView)initWithCoder:(id)a3;
- (_TtC12PhotosUICore22PXStoryAsyncPlayerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PXStoryAsyncPlayerView

- (_TtC12PhotosUICore22PXStoryAsyncPlayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_player) = 0;
  id v8 = objc_allocWithZone((Class)PXGHostingView);
  v9 = self;
  v10 = (objc_class *)objc_msgSend(v8, sel_initWithFrame_, 0.0, 0.0, width, height);
  *(Class *)((char *)&v9->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_hostingView) = v10;

  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for PXStoryAsyncPlayerView();
  v11 = -[PXStoryAsyncPlayerView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  [(PXStoryAsyncPlayerView *)v11 addSubview:*(Class *)((char *)&v11->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_hostingView)];
  return v11;
}

- (_TtC12PhotosUICore22PXStoryAsyncPlayerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_player) = 0;
  id v4 = a3;

  result = (_TtC12PhotosUICore22PXStoryAsyncPlayerView *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_hostingView);
  v3 = self;
  [(PXStoryAsyncPlayerView *)v3 bounds];
  objc_msgSend(v2, sel_setFrame_);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for PXStoryAsyncPlayerView();
  [(PXStoryAsyncPlayerView *)&v4 layoutSubviews];
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore22PXStoryAsyncPlayerView_hostingView);
}

@end