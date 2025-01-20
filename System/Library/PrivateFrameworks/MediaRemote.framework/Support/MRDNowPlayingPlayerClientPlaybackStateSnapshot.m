@interface MRDNowPlayingPlayerClientPlaybackStateSnapshot
- (MRDNowPlayingPlayerClientPlaybackState)playerPlaybackState;
- (NSDate)date;
- (NSString)playbackStateDescription;
- (id)description;
- (int64_t)compare:(id)a3;
- (unsigned)playbackState;
- (void)setPlayerPlaybackState:(id)a3;
@end

@implementation MRDNowPlayingPlayerClientPlaybackStateSnapshot

- (NSDate)date
{
  v2 = [(MRDNowPlayingPlayerClientPlaybackStateSnapshot *)self playerPlaybackState];
  v3 = [v2 date];

  return (NSDate *)v3;
}

- (unsigned)playbackState
{
  v2 = [(MRDNowPlayingPlayerClientPlaybackStateSnapshot *)self playerPlaybackState];
  unsigned int v3 = [v2 playbackState];

  return v3;
}

- (NSString)playbackStateDescription
{
  [(MRDNowPlayingPlayerClientPlaybackStateSnapshot *)self playbackState];
  v2 = (void *)MRMediaRemoteCopyPlaybackStateDescription();

  return (NSString *)v2;
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"%@", self->_playerPlaybackState];

  return v2;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(MRDNowPlayingPlayerClientPlaybackStateSnapshot *)self date];
  v6 = [v4 date];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (MRDNowPlayingPlayerClientPlaybackState)playerPlaybackState
{
  return self->_playerPlaybackState;
}

- (void)setPlayerPlaybackState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end