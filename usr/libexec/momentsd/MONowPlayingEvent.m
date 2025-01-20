@interface MONowPlayingEvent
- (BOOL)isRemote;
- (MONowPlayingEvent)initWithNowPlayingEvent:(id)a3 name:(id)a4 isRemote:(BOOL)a5 deviceSource:(id)a6 timestamp:(double)a7;
- (NSString)album;
- (NSString)artist;
- (NSString)bundleID;
- (NSString)deviceSource;
- (NSString)genre;
- (NSString)iTunesStoreIdentifier;
- (NSString)mediaType;
- (NSString)name;
- (NSString)title;
- (double)timestamp;
- (unint64_t)playbackState;
- (unsigned)duration;
@end

@implementation MONowPlayingEvent

- (MONowPlayingEvent)initWithNowPlayingEvent:(id)a3 name:(id)a4 isRemote:(BOOL)a5 deviceSource:(id)a6 timestamp:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v34.receiver = self;
  v34.super_class = (Class)MONowPlayingEvent;
  v15 = [(MONowPlayingEvent *)&v34 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a4);
    v16->_isRemote = a5;
    objc_storeStrong((id *)&v16->_deviceSource, a6);
    v16->_timestamp = a7;
    v17 = [v12 bundleID];
    unsigned int v18 = [v17 isEqualToString:@"com.apple.NanoMusic"];

    if (v18)
    {
      bundleID = v16->_bundleID;
      v16->_bundleID = (NSString *)@"com.apple.Music";
    }
    else
    {
      uint64_t v20 = [v12 bundleID];
      bundleID = v16->_bundleID;
      v16->_bundleID = (NSString *)v20;
    }

    uint64_t v21 = [v12 album];
    album = v16->_album;
    v16->_album = (NSString *)v21;

    uint64_t v23 = [v12 artist];
    artist = v16->_artist;
    v16->_artist = (NSString *)v23;

    v16->_duration = [v12 duration];
    uint64_t v25 = [v12 genre];
    genre = v16->_genre;
    v16->_genre = (NSString *)v25;

    uint64_t v27 = [v12 title];
    title = v16->_title;
    v16->_title = (NSString *)v27;

    uint64_t v29 = [v12 mediaType];
    mediaType = v16->_mediaType;
    v16->_mediaType = (NSString *)v29;

    uint64_t v31 = [v12 iTunesStoreIdentifier];
    iTunesStoreIdentifier = v16->_iTunesStoreIdentifier;
    v16->_iTunesStoreIdentifier = (NSString *)v31;

    v16->_playbackState = (unint64_t)[v12 playbackState];
  }

  return v16;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (NSString)deviceSource
{
  return self->_deviceSource;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)playbackState
{
  return self->_playbackState;
}

- (NSString)album
{
  return self->_album;
}

- (NSString)artist
{
  return self->_artist;
}

- (unsigned)duration
{
  return self->_duration;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSString)iTunesStoreIdentifier
{
  return self->_iTunesStoreIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_deviceSource, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end