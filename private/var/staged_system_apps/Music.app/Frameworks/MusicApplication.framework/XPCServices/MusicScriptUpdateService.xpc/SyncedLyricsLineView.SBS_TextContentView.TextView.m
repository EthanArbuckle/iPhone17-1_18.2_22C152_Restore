@interface SyncedLyricsLineView.SBS_TextContentView.TextView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView)initWithCoder:(id)a3;
- (_TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SyncedLyricsLineView.SBS_TextContentView.TextView

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10031D688();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  if (a3.height != 0.0)
  {
    double width = a3.width;
    v6 = self;
    double v7 = sub_10031B5D8(width);
    v9 = v8;
    double v3 = v7;
    double v4 = v10;
  }
  double v11 = v3;
  double v12 = v4;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10031B45C();
}

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(v3, (char *)self + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView_specs, 0x219uLL);
  sub_10031CAE4((uint64_t)v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView_framesetter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC11MusicCoreUI20SyncedLyricsLineView19SBS_TextContentView8TextView_basicView));
}

@end