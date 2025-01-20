@interface TagFeedViewerSportsEventBackgroundView
- (_TtC7NewsUI238TagFeedViewerSportsEventBackgroundView)initWithCoder:(id)a3;
- (_TtC7NewsUI238TagFeedViewerSportsEventBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TagFeedViewerSportsEventBackgroundView

- (_TtC7NewsUI238TagFeedViewerSportsEventBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI238TagFeedViewerSportsEventBackgroundView *)sub_1DFD8D848(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI238TagFeedViewerSportsEventBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI238TagFeedViewerSportsEventBackgroundView_splitView;
  id v6 = objc_allocWithZone((Class)sub_1DFDF5D20());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC7NewsUI238TagFeedViewerSportsEventBackgroundView_gradientView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)sub_1DFDF0970()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI238TagFeedViewerSportsEventBackgroundView *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(TagFeedViewerSportsEventBackgroundView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC7NewsUI238TagFeedViewerSportsEventBackgroundView_splitView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);
  v4 = *(void **)&v2[OBJC_IVAR____TtC7NewsUI238TagFeedViewerSportsEventBackgroundView_gradientView];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI238TagFeedViewerSportsEventBackgroundView_splitView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI238TagFeedViewerSportsEventBackgroundView_gradientView);
}

@end