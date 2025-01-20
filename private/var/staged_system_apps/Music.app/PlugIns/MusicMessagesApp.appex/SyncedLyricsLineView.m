@interface SyncedLyricsLineView
- (BOOL)isHighlighted;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11MusicCoreUI20SyncedLyricsLineView)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI20SyncedLyricsLineView)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animator:(id)a4;
@end

@implementation SyncedLyricsLineView

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SyncedLyricsLineView();
  return [(SyncedLyricsLineView *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (objc_class *)type metadata accessor for SyncedLyricsLineView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  char v7 = [(SyncedLyricsLineView *)&v9 isHighlighted];
  v8.receiver = v6;
  v8.super_class = v5;
  [(SyncedLyricsLineView *)&v8 setHighlighted:v3];
  sub_10034E138(v7);
}

- (_TtC11MusicCoreUI20SyncedLyricsLineView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100350654();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_10034E460(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)setSelected:(BOOL)a3 animator:(id)a4
{
  id v7 = a4;
  double v8 = self;
  sub_10034E6A4(a3, a4);
}

- (_TtC11MusicCoreUI20SyncedLyricsLineView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC11MusicCoreUI20SyncedLyricsLineView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v3, (char *)self + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_specs, 0x219uLL);
  sub_10033FD58((uint64_t)v3);
  sub_10000BB88((uint64_t)self + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_line);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI20SyncedLyricsLineView_blurFilter));
}

@end