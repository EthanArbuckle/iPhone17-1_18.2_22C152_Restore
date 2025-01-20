@interface VUIPlaybackPositionInfo
- (NSNumber)bookmarkTime;
- (NSNumber)hasBeenPlayed;
- (NSNumber)playCount;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBookmarkTime:(id)a3;
- (void)setHasBeenPlayed:(id)a3;
- (void)setPlayCount:(id)a3;
@end

@implementation VUIPlaybackPositionInfo

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VUIPlaybackPositionInfo);
  v5 = [(VUIPlaybackPositionInfo *)self bookmarkTime];
  [(VUIPlaybackPositionInfo *)v4 setBookmarkTime:v5];

  v6 = [(VUIPlaybackPositionInfo *)self playCount];
  [(VUIPlaybackPositionInfo *)v4 setPlayCount:v6];

  v7 = [(VUIPlaybackPositionInfo *)self hasBeenPlayed];
  [(VUIPlaybackPositionInfo *)v4 setHasBeenPlayed:v7];

  return v4;
}

- (NSNumber)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTime:(id)a3
{
}

- (NSNumber)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(id)a3
{
}

- (NSNumber)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setHasBeenPlayed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hasBeenPlayed, 0);
  objc_storeStrong((id *)&self->_playCount, 0);
  objc_storeStrong((id *)&self->_bookmarkTime, 0);
}

@end