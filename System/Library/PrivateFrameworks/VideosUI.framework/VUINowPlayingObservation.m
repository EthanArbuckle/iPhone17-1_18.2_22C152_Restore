@interface VUINowPlayingObservation
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaying;
- (NSString)nowPlayingAppBundleIdentifier;
- (VUINowPlayingObservation)initWithBundleIdentifier:(id)a3 isPlaying:(BOOL)a4;
- (id)description;
- (unint64_t)hash;
- (void)setNowPlayingAppBundleIdentifier:(id)a3;
- (void)setPlaying:(BOOL)a3;
@end

@implementation VUINowPlayingObservation

- (VUINowPlayingObservation)initWithBundleIdentifier:(id)a3 isPlaying:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUINowPlayingObservation;
  v7 = [(VUINowPlayingObservation *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_playing = a4;
    uint64_t v9 = [v6 copy];
    nowPlayingAppBundleIdentifier = v8->_nowPlayingAppBundleIdentifier;
    v8->_nowPlayingAppBundleIdentifier = (NSString *)v9;
  }
  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(VUINowPlayingObservation *)self isPlaying];
  v4 = [(VUINowPlayingObservation *)self nowPlayingAppBundleIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VUINowPlayingObservation *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        v7 = [(VUINowPlayingObservation *)self nowPlayingAppBundleIdentifier];
        v8 = [(VUINowPlayingObservation *)v6 nowPlayingAppBundleIdentifier];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          v11 = v10;
          if (!v9 || !v10)
          {

LABEL_14:
            LOBYTE(v13) = 0;
            goto LABEL_15;
          }
          char v12 = [v9 isEqual:v10];

          if ((v12 & 1) == 0) {
            goto LABEL_14;
          }
        }
        BOOL v14 = [(VUINowPlayingObservation *)self isPlaying];
        BOOL v13 = v14 ^ [(VUINowPlayingObservation *)v6 isPlaying] ^ 1;
LABEL_15:

        goto LABEL_16;
      }
    }
    LOBYTE(v13) = 0;
  }
LABEL_16:

  return v13;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUINowPlayingObservation;
  v4 = [(VUINowPlayingObservation *)&v15 description];
  [v3 addObject:v4];

  unint64_t v5 = NSString;
  id v6 = [(VUINowPlayingObservation *)self nowPlayingAppBundleIdentifier];
  v7 = [v5 stringWithFormat:@"%@=%@", @"nowPlayingAppBundleIdentifier", v6];
  [v3 addObject:v7];

  v8 = NSString;
  [(VUINowPlayingObservation *)self isPlaying];
  id v9 = VUIBoolLogString();
  id v10 = [v8 stringWithFormat:@"%@=%@", @"isPlaying", v9];
  [v3 addObject:v10];

  v11 = NSString;
  char v12 = [v3 componentsJoinedByString:@", "];
  BOOL v13 = [v11 stringWithFormat:@"<%@>", v12];

  return v13;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (NSString)nowPlayingAppBundleIdentifier
{
  return self->_nowPlayingAppBundleIdentifier;
}

- (void)setNowPlayingAppBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end