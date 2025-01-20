@interface TVRMSNowPlayingInfo
- (BOOL)canSkipNext;
- (BOOL)canSkipPrevious;
- (BOOL)canWishlist;
- (BOOL)hasChapterData;
- (BOOL)isLikeable;
- (BOOL)isPlaying;
- (NSString)albumName;
- (NSString)artistName;
- (NSString)artworkIdentifier;
- (NSString)trackName;
- (TVRMSNowPlayingInfo)initWithProtobuf:(id)a3;
- (double)timeRemaining;
- (double)timestamp;
- (double)totalDuration;
- (id)description;
- (id)protobuf;
- (int)revisionNumber;
- (int64_t)likedState;
- (int64_t)mediaKind;
- (int64_t)playbackState;
- (int64_t)scrubbableState;
- (unint64_t)databaseID;
- (unint64_t)itemID;
- (void)setAlbumName:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setCanSkipNext:(BOOL)a3;
- (void)setCanSkipPrevious:(BOOL)a3;
- (void)setCanWishlist:(BOOL)a3;
- (void)setDatabaseID:(unint64_t)a3;
- (void)setHasChapterData:(BOOL)a3;
- (void)setItemID:(unint64_t)a3;
- (void)setLikeable:(BOOL)a3;
- (void)setLikedState:(int64_t)a3;
- (void)setMediaKind:(int64_t)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)setRevisionNumber:(int)a3;
- (void)setScrubbableState:(int64_t)a3;
- (void)setTimeRemaining:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setTotalDuration:(double)a3;
- (void)setTrackName:(id)a3;
@end

@implementation TVRMSNowPlayingInfo

- (TVRMSNowPlayingInfo)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TVRMSNowPlayingInfo;
  v5 = [(TVRMSNowPlayingInfo *)&v16 init];
  if (v5)
  {
    v5->_itemID = [v4 itemID];
    v5->_databaseID = [v4 databaseID];
    uint64_t v6 = [v4 trackName];
    trackName = v5->_trackName;
    v5->_trackName = (NSString *)v6;

    uint64_t v8 = [v4 artistName];
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v8;

    uint64_t v10 = [v4 albumName];
    albumName = v5->_albumName;
    v5->_albumName = (NSString *)v10;

    [v4 timestamp];
    v5->_timestamp = v12;
    [v4 timeRemaining];
    v5->_timeRemaining = v13;
    [v4 totalDuration];
    v5->_totalDuration = v14;
    v5->_revisionNumber = [v4 revisionNumber];
    v5->_mediaKind = (int)[v4 mediaKind];
    v5->_playbackState = (int)[v4 playbackState];
    v5->_likedState = (int)[v4 likedState];
    v5->_scrubbableState = (int)[v4 scrubbableState];
    v5->_canSkipNext = [v4 canSkipNext];
    v5->_canSkipPrevious = [v4 canSkipPrevious];
    v5->_likeable = [v4 likeable];
    v5->_canWishlist = [v4 canWishlist];
    v5->_hasChapterData = [v4 hasChapterData];
  }

  return v5;
}

- (id)protobuf
{
  v3 = objc_opt_new();
  [v3 setItemID:self->_itemID];
  [v3 setDatabaseID:self->_databaseID];
  [v3 setTrackName:self->_trackName];
  [v3 setArtistName:self->_artistName];
  [v3 setAlbumName:self->_albumName];
  [v3 setTimestamp:self->_timestamp];
  [v3 setTimeRemaining:self->_timeRemaining];
  [v3 setTotalDuration:self->_totalDuration];
  [v3 setRevisionNumber:self->_revisionNumber];
  [v3 setMediaKind:LODWORD(self->_mediaKind)];
  [v3 setPlaybackState:LODWORD(self->_playbackState)];
  [v3 setLikedState:LODWORD(self->_likedState)];
  [v3 setScrubbableState:LODWORD(self->_scrubbableState)];
  [v3 setCanSkipNext:self->_canSkipNext];
  [v3 setCanSkipPrevious:self->_canSkipPrevious];
  [v3 setLikeable:self->_likeable];
  [v3 setCanWishlist:self->_canWishlist];
  [v3 setHasChapterData:self->_hasChapterData];

  return v3;
}

- (NSString)artworkIdentifier
{
  if (self->_albumName)
  {
    v2 = NSString;
    unint64_t albumName = (unint64_t)self->_albumName;
    unint64_t artistName = (unint64_t)self->_artistName;
    v3 = @"%@-%@";
LABEL_5:
    objc_msgSend(v2, "stringWithFormat:", v3, albumName, artistName);
    id v4 = LABEL_6:;
    goto LABEL_7;
  }
  if (self->_itemID)
  {
    v2 = NSString;
    unint64_t albumName = self->_databaseID;
    unint64_t artistName = self->_itemID;
    v3 = @"%lld-%lld";
    goto LABEL_5;
  }
  trackName = self->_trackName;
  if (trackName)
  {
    [NSString stringWithFormat:@"%@", trackName, v8];
    goto LABEL_6;
  }
  id v4 = 0;
LABEL_7:

  return (NSString *)v4;
}

- (BOOL)isPlaying
{
  return (unint64_t)(self->_playbackState - 4) < 3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[Track name: %@, Artist name: %@, Album name: %@, Duration: %f, Time Remaining: %f, Media kind: %d, Playback state: %d", self->_trackName, self->_artistName, self->_albumName, *(void *)&self->_totalDuration, *(void *)&self->_timeRemaining, self->_mediaKind, self->_playbackState];
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void)setItemID:(unint64_t)a3
{
  self->_itemID = a3;
}

- (unint64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(unint64_t)a3
{
  self->_databaseID = a3;
}

- (NSString)trackName
{
  return self->_trackName;
}

- (void)setTrackName:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (NSString)albumName
{
  return self->_albumName;
}

- (void)setAlbumName:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(double)a3
{
  self->_timeRemaining = a3;
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (void)setTotalDuration:(double)a3
{
  self->_totalDuration = a3;
}

- (int)revisionNumber
{
  return self->_revisionNumber;
}

- (void)setRevisionNumber:(int)a3
{
  self->_revisionNumber = a3;
}

- (int64_t)mediaKind
{
  return self->_mediaKind;
}

- (void)setMediaKind:(int64_t)a3
{
  self->_mediaKind = a3;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_playbackState = a3;
}

- (int64_t)likedState
{
  return self->_likedState;
}

- (void)setLikedState:(int64_t)a3
{
  self->_likedState = a3;
}

- (int64_t)scrubbableState
{
  return self->_scrubbableState;
}

- (void)setScrubbableState:(int64_t)a3
{
  self->_scrubbableState = a3;
}

- (BOOL)canSkipNext
{
  return self->_canSkipNext;
}

- (void)setCanSkipNext:(BOOL)a3
{
  self->_canSkipNext = a3;
}

- (BOOL)canSkipPrevious
{
  return self->_canSkipPrevious;
}

- (void)setCanSkipPrevious:(BOOL)a3
{
  self->_canSkipPrevious = a3;
}

- (BOOL)canWishlist
{
  return self->_canWishlist;
}

- (void)setCanWishlist:(BOOL)a3
{
  self->_canWishlist = a3;
}

- (BOOL)hasChapterData
{
  return self->_hasChapterData;
}

- (void)setHasChapterData:(BOOL)a3
{
  self->_hasChapterData = a3;
}

- (BOOL)isLikeable
{
  return self->_likeable;
}

- (void)setLikeable:(BOOL)a3
{
  self->_likeable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);

  objc_storeStrong((id *)&self->_trackName, 0);
}

@end