@interface PPMediaPlayerResponse
- (BOOL)isEqualToResponse:(id)a3;
- (NSNumber)storeItemID;
- (NSString)album;
- (NSString)artist;
- (NSString)bundleID;
- (NSString)playerID;
- (NSString)title;
- (double)duration;
- (unsigned)state;
- (void)setAlbum:(id)a3;
- (void)setArtist:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDuration:(double)a3;
- (void)setPlayerID:(id)a3;
- (void)setState:(unsigned int)a3;
- (void)setStoreItemID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PPMediaPlayerResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeItemID, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (void)setStoreItemID:(id)a3
{
}

- (NSNumber)storeItemID
{
  return self->_storeItemID;
}

- (void)setPlayerID:(id)a3
{
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (void)setArtist:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isEqualToResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PPMediaPlayerResponse *)self title];
  uint64_t v6 = [v4 title];
  if (!(v5 | v6)) {
    goto LABEL_5;
  }
  v7 = (void *)v6;
  LOBYTE(v8) = 0;
  if (!v5 || !v6) {
    goto LABEL_25;
  }
  int v8 = [(id)v5 isEqualToString:v6];

  if (v8)
  {
LABEL_5:
    uint64_t v5 = [(PPMediaPlayerResponse *)self artist];
    uint64_t v9 = [v4 artist];
    if (v5 | v9)
    {
      v7 = (void *)v9;
      LOBYTE(v8) = 0;
      if (!v5 || !v9) {
        goto LABEL_25;
      }
      int v8 = [(id)v5 isEqualToString:v9];

      if (!v8) {
        goto LABEL_26;
      }
    }
    uint64_t v5 = [(PPMediaPlayerResponse *)self album];
    uint64_t v10 = [v4 album];
    if (v5 | v10)
    {
      v7 = (void *)v10;
      LOBYTE(v8) = 0;
      if (!v5 || !v10) {
        goto LABEL_25;
      }
      int v8 = [(id)v5 isEqualToString:v10];

      if (!v8) {
        goto LABEL_26;
      }
    }
    uint64_t v5 = [(PPMediaPlayerResponse *)self bundleID];
    uint64_t v11 = [v4 bundleID];
    if (!(v5 | v11))
    {
LABEL_8:
      uint64_t v5 = [(PPMediaPlayerResponse *)self playerID];
      uint64_t v12 = [v4 playerID];
      if (v5 | v12)
      {
        v7 = (void *)v12;
        LOBYTE(v8) = 0;
        if (v5 && v12) {
          LOBYTE(v8) = [(id)v5 isEqualToString:v12];
        }
      }
      else
      {
        v7 = 0;
        uint64_t v5 = 0;
        LOBYTE(v8) = 1;
      }
      goto LABEL_25;
    }
    v7 = (void *)v11;
    LOBYTE(v8) = 0;
    if (v5 && v11)
    {
      int v8 = [(id)v5 isEqualToString:v11];

      if (!v8) {
        goto LABEL_26;
      }
      goto LABEL_8;
    }
LABEL_25:
  }
LABEL_26:

  return v8;
}

@end