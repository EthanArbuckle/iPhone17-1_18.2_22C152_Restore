@interface MusicLyricsBackgroundView
- (MusicLyricsBackgroundView)initWithCoder:(id)a3;
- (MusicLyricsBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation MusicLyricsBackgroundView

- (MusicLyricsBackgroundView)initWithFrame:(CGRect)a3
{
  return (MusicLyricsBackgroundView *)sub_1003A43D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MusicLyricsBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003A50F0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___MusicLyricsBackgroundView____lazy_storage___gradientView));

  swift_release();
}

@end