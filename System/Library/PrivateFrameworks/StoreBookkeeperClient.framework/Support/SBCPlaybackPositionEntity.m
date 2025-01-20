@interface SBCPlaybackPositionEntity
- (id)copyWithValuesFromSBKUniversalPlaybackPositionMetadata:(id)a3;
@end

@implementation SBCPlaybackPositionEntity

- (id)copyWithValuesFromSBKUniversalPlaybackPositionMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(SBCPlaybackPositionEntity *)self copy];
  [v4 bookmarkTime];
  objc_msgSend(v5, "setBookmarkTime:");
  [v4 timestamp];
  objc_msgSend(v5, "setBookmarkTimestamp:");
  objc_msgSend(v5, "setHasBeenPlayed:", objc_msgSend(v4, "hasBeenPlayed"));
  id v6 = [v4 playCount];

  [v5 setUserPlayCount:v6];
  return v5;
}

@end