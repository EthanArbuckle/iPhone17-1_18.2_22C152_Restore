@interface NowPlayingQueueAddCell
- (_TtC5Music22NowPlayingQueueAddCell)initWithCoder:(id)a3;
- (_TtC5Music22NowPlayingQueueAddCell)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NowPlayingQueueAddCell

- (_TtC5Music22NowPlayingQueueAddCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Music22NowPlayingQueueAddCell *)sub_10025040C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Music22NowPlayingQueueAddCell)initWithCoder:(id)a3
{
  result = (_TtC5Music22NowPlayingQueueAddCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100250FA4((uint64_t)a3);
}

@end