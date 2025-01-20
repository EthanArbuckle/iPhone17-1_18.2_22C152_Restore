@interface MTNowPlayingArtworkRequest
- (MTNowPlayingArtworkRequest)init;
- (void)cancel;
@end

@implementation MTNowPlayingArtworkRequest

- (void)cancel
{
  v2 = self;
  sub_1E3E7A970();
}

- (MTNowPlayingArtworkRequest)init
{
  result = (MTNowPlayingArtworkRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end