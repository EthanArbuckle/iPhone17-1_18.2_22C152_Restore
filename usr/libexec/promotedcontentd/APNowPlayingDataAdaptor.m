@interface APNowPlayingDataAdaptor
+ (id)identifier;
- (BOOL)_validateParameters:(id *)a3;
- (NSMutableDictionary)foundArtists;
- (NSMutableDictionary)foundGenres;
- (NSNumber)minCount;
- (NSString)artist;
- (NSString)genre;
- (id)_biomeStream;
- (id)calculateResultFromEvents;
- (void)_incrementCount:(id)a3 forKey:(id)a4;
- (void)eventReceived:(id)a3;
- (void)setArtist:(id)a3;
- (void)setFoundArtists:(id)a3;
- (void)setFoundGenres:(id)a3;
- (void)setGenre:(id)a3;
- (void)setMinCount:(id)a3;
@end

@implementation APNowPlayingDataAdaptor

+ (id)identifier
{
  return @"com.apple.ap.nowplaying";
}

- (BOOL)_validateParameters:(id *)a3
{
  v22.receiver = self;
  v22.super_class = (Class)APNowPlayingDataAdaptor;
  if (!-[APBiomeDataAdaptor _validateParameters:](&v22, "_validateParameters:")) {
    return 0;
  }
  v7 = [(APDataAdaptor *)self parameters];
  v8 = [v7 objectForKeyedSubscript:@"artist"];
  unsigned __int8 v9 = [(APDataAdaptor *)self _checkClassType:v8 name:@"artist" expectedClass:objc_opt_class() error:a3];
  if ((v9 & 1) == 0)
  {
    v3 = [(APDataAdaptor *)self parameters];
    v4 = [v3 objectForKeyedSubscript:@"genre"];
    if (![(APDataAdaptor *)self _checkClassType:v4 name:@"genre" expectedClass:objc_opt_class() error:a3])
    {

      BOOL v13 = 0;
      goto LABEL_10;
    }
  }
  v10 = [(APDataAdaptor *)self parameters];
  v11 = [v10 objectForKeyedSubscript:@"minCount"];
  unsigned int v12 = [(APDataAdaptor *)self _checkClassType:v11 name:@"minCount" expectedClass:objc_opt_class() error:a3];

  if ((v9 & 1) == 0)
  {

    if ((v12 & 1) == 0) {
      return 0;
    }
    goto LABEL_8;
  }

  if (v12)
  {
LABEL_8:
    v14 = [(APDataAdaptor *)self parameters];
    v15 = [v14 objectForKeyedSubscript:@"artist"];
    [(APNowPlayingDataAdaptor *)self setArtist:v15];

    v16 = [(APDataAdaptor *)self parameters];
    v17 = [v16 objectForKeyedSubscript:@"genre"];
    [(APNowPlayingDataAdaptor *)self setGenre:v17];

    v18 = [(APDataAdaptor *)self parameters];
    v19 = [v18 objectForKeyedSubscript:@"minCount"];
    [(APNowPlayingDataAdaptor *)self setMinCount:v19];

    v20 = +[NSMutableDictionary dictionary];
    [(APNowPlayingDataAdaptor *)self setFoundArtists:v20];

    v7 = +[NSMutableDictionary dictionary];
    [(APNowPlayingDataAdaptor *)self setFoundGenres:v7];
    BOOL v13 = 1;
LABEL_10:

    return v13;
  }
  return 0;
}

- (id)_biomeStream
{
  v2 = BiomeLibrary();
  v3 = [v2 Media];
  v4 = [v3 NowPlaying];

  return v4;
}

- (id)calculateResultFromEvents
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v3 = [(APNowPlayingDataAdaptor *)self foundArtists];
  v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = [*(id *)(*((void *)&v27 + 1) + 8 * i) intValue];
        v11 = [(APNowPlayingDataAdaptor *)self minCount];
        v7 |= v10 > (int)[v11 intValue];
      }
      id v6 = [v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);

    if (v7)
    {
      char v12 = 1;
      goto LABEL_21;
    }
  }
  else
  {
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v13 = [(APNowPlayingDataAdaptor *)self foundGenres];
  v14 = [v13 allValues];

  id v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    id v16 = v15;
    char v12 = 0;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        int v19 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) intValue];
        v20 = [(APNowPlayingDataAdaptor *)self minCount];
        v12 |= v19 > (int)[v20 intValue];
      }
      id v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }
  else
  {
    char v12 = 0;
  }

LABEL_21:
  v21 = +[NSNumber numberWithBool:v12 & 1];

  return v21;
}

- (void)eventReceived:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([v4 eventBody],
        id v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    id v7 = v4;
    uint64_t v8 = [v7 eventBody];
    unsigned __int8 v9 = [v8 artist];
    int v10 = [(APNowPlayingDataAdaptor *)self artist];
    unsigned int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      char v12 = [(APNowPlayingDataAdaptor *)self foundArtists];
      BOOL v13 = [(APNowPlayingDataAdaptor *)self artist];
      [(APNowPlayingDataAdaptor *)self _incrementCount:v12 forKey:v13];
    }
    v14 = [v7 eventBody];
    id v15 = [v14 genre];
    id v16 = [(APNowPlayingDataAdaptor *)self genre];
    unsigned int v17 = [v15 isEqualToString:v16];

    if (v17)
    {
      v18 = [(APNowPlayingDataAdaptor *)self foundGenres];
      int v19 = [(APNowPlayingDataAdaptor *)self genre];
      [(APNowPlayingDataAdaptor *)self _incrementCount:v18 forKey:v19];
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100059D3C;
    block[3] = &unk_100233D50;
    id v21 = v4;
    if (qword_100288890 != -1) {
      dispatch_once(&qword_100288890, block);
    }
  }
}

- (void)_incrementCount:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [v8 objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = +[NSNumber numberWithInt:0];
    [v8 setObject:v6 forKey:v5];
  }
  id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 intValue] + 1);

  [v8 setObject:v7 forKey:v5];
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
}

- (NSNumber)minCount
{
  return self->_minCount;
}

- (void)setMinCount:(id)a3
{
}

- (NSMutableDictionary)foundArtists
{
  return self->_foundArtists;
}

- (void)setFoundArtists:(id)a3
{
}

- (NSMutableDictionary)foundGenres
{
  return self->_foundGenres;
}

- (void)setFoundGenres:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundGenres, 0);
  objc_storeStrong((id *)&self->_foundArtists, 0);
  objc_storeStrong((id *)&self->_minCount, 0);
  objc_storeStrong((id *)&self->_genre, 0);

  objc_storeStrong((id *)&self->_artist, 0);
}

@end