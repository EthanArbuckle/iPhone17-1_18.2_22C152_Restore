@interface MRDNowPlayingDataSourceSession
- (BOOL)isPlaying;
- (MRDNowPlayingDataSourceSession)initWithBundleID:(id)a3 audioSessionID:(id)a4 isPlaying:(BOOL)a5;
- (NSNumber)audioSessionID;
- (NSString)bundleID;
- (id)description;
- (id)dictionaryRepresentation;
@end

@implementation MRDNowPlayingDataSourceSession

- (MRDNowPlayingDataSourceSession)initWithBundleID:(id)a3 audioSessionID:(id)a4 isPlaying:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRDNowPlayingDataSourceSession;
  v11 = [(MRDNowPlayingDataSourceSession *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bundleID, a3);
    objc_storeStrong((id *)&v12->_audioSessionID, a4);
    v12->_playing = a5;
  }

  return v12;
}

- (id)description
{
  v2 = [(MRDNowPlayingDataSourceSession *)self dictionaryRepresentation];
  v3 = [v2 description];

  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(MRDNowPlayingDataSourceSession *)self bundleID];
  [v3 setObject:v4 forKeyedSubscript:@"bundleID"];

  v5 = [(MRDNowPlayingDataSourceSession *)self audioSessionID];
  [v3 setObject:v5 forKeyedSubscript:@"audioSessionID"];

  v6 = +[NSNumber numberWithBool:[(MRDNowPlayingDataSourceSession *)self isPlaying]];
  [v3 setObject:v6 forKeyedSubscript:@"isPlaying"];

  return v3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (NSNumber)audioSessionID
{
  return self->_audioSessionID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_audioSessionID, 0);
}

@end