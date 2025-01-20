@interface SyncedLyricsLineView.Word.WordView
- (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Word8WordView)initWithCoder:(id)a3;
- (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Word8WordView)initWithFrame:(CGRect)a3;
@end

@implementation SyncedLyricsLineView.Word.WordView

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Word8WordView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[SyncedLyricsLineView.Word.WordView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCCC11MusicCoreUI20SyncedLyricsLineView4Word8WordView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(SyncedLyricsLineView.Word.WordView *)&v5 initWithCoder:a3];
}

@end