@interface TagFeedViewerSportsEventTitleView
- (_TtC7NewsUI233TagFeedViewerSportsEventTitleView)initWithCoder:(id)a3;
- (_TtC7NewsUI233TagFeedViewerSportsEventTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TagFeedViewerSportsEventTitleView

- (_TtC7NewsUI233TagFeedViewerSportsEventTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI233TagFeedViewerSportsEventTitleView *)sub_1DEF3E410(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI233TagFeedViewerSportsEventTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DEF3EBA4();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(TagFeedViewerSportsEventTitleView *)&v5 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_traitCollection, v5.receiver, v5.super_class);
  id v4 = objc_msgSend(v3, sel_horizontalSizeClass);

  if (v4 == (id)2) {
    sub_1DEF3E638();
  }
  else {
    sub_1DEF3E920();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233TagFeedViewerSportsEventTitleView_leftImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233TagFeedViewerSportsEventTitleView_leftTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI233TagFeedViewerSportsEventTitleView_rightImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsUI233TagFeedViewerSportsEventTitleView_rightTitleLabel);
}

@end