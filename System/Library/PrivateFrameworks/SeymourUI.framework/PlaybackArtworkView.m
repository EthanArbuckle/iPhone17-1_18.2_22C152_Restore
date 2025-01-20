@interface PlaybackArtworkView
- (_TtC9SeymourUI19PlaybackArtworkView)initWithCoder:(id)a3;
- (_TtC9SeymourUI19PlaybackArtworkView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlaybackArtworkView

- (_TtC9SeymourUI19PlaybackArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19PlaybackArtworkView *)sub_23A61B248(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19PlaybackArtworkView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A61C1D8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A61B794();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlaybackArtworkView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(PlaybackArtworkView *)&v6 traitCollectionDidChange:v4];
  sub_23A61BEF8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackArtworkView_springParameters));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19PlaybackArtworkView_switchAnimator);
}

@end