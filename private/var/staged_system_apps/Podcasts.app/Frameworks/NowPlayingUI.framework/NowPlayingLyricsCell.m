@interface NowPlayingLyricsCell
- (_TtC12NowPlayingUI20NowPlayingLyricsCell)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI20NowPlayingLyricsCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NowPlayingLyricsCell

- (void)layoutSubviews
{
  v2 = self;
  sub_8BD9C();
}

- (_TtC12NowPlayingUI20NowPlayingLyricsCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_isBottomHairlineVisible) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_bottomHairlineView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_lyricsView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_tableViewCell) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[NowPlayingLyricsCell initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI20NowPlayingLyricsCell)initWithCoder:(id)a3
{
  return (_TtC12NowPlayingUI20NowPlayingLyricsCell *)sub_8C0BC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_lyricsView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI20NowPlayingLyricsCell_tableViewCell);
}

@end