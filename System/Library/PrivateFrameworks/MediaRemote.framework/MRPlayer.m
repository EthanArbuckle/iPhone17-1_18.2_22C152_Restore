@interface MRPlayer
+ (MRPlayer)anyPlayer;
+ (MRPlayer)defaultPlayer;
- (BOOL)hasAuxiliaryProperties;
- (BOOL)isDefaultPlayer;
- (BOOL)isEqual:(id)a3;
- (MRPlayer)initWithData:(id)a3;
- (MRPlayer)initWithIdentifier:(id)a3 displayName:(id)a4;
- (MRPlayer)skeleton;
- (NSData)data;
- (NSSet)mxSessionIDs;
- (NSString)displayName;
- (NSString)identifier;
- (NSURL)appIcon;
- (_MRNowPlayingPlayerProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initWithProtobuf:(id)a1;
- (int64_t)audioSessionType;
- (unint64_t)hash;
- (unsigned)audioSessionID;
- (void)mergeFrom:(id)a3;
- (void)setAppIcon:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setAudioSessionType:(int64_t)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMxSessionIDs:(id)a3;
@end

@implementation MRPlayer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mxSessionIDs, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(MRPlayer *)self identifier];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setIdentifier:v7];

  v8 = [(MRPlayer *)self displayName];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setDisplayName:v9];

  v10 = [(MRPlayer *)self appIcon];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setAppIcon:v11];

  objc_msgSend(v5, "setAudioSessionType:", -[MRPlayer audioSessionType](self, "audioSessionType"));
  v12 = [(MRPlayer *)self mxSessionIDs];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setMxSessionIDs:v13];

  objc_msgSend(v5, "setAudioSessionID:", -[MRPlayer audioSessionID](self, "audioSessionID"));
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)audioSessionType
{
  return self->_audioSessionType;
}

- (NSSet)mxSessionIDs
{
  return self->_mxSessionIDs;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSURL)appIcon
{
  return self->_appIcon;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setMxSessionIDs:(id)a3
{
}

- (void)setAudioSessionType:(int64_t)a3
{
  self->_audioSessionType = a3;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (void)setAppIcon:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MRPlayer *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(MRPlayer *)v4 identifier];
      v6 = [(MRPlayer *)self identifier];
      char v7 = [v5 isEqualToString:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (_MRNowPlayingPlayerProtobuf)protobuf
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = objc_alloc_init(_MRNowPlayingPlayerProtobuf);
    v3 = [a1 identifier];
    [(_MRNowPlayingPlayerProtobuf *)v2 setIdentifier:v3];

    v4 = [a1 displayName];
    [(_MRNowPlayingPlayerProtobuf *)v2 setDisplayName:v4];

    v5 = [a1 appIcon];
    v6 = [v5 absoluteString];
    [(_MRNowPlayingPlayerProtobuf *)v2 setIconURL:v6];

    uint64_t v7 = [a1 audioSessionType];
    if (v7 == 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2 * (v7 == 2);
    }
    [(_MRNowPlayingPlayerProtobuf *)v2 setAudioSessionType:v8];
    -[_MRNowPlayingPlayerProtobuf setHasAudioSessionType:](v2, "setHasAudioSessionType:", [a1 audioSessionType] != 0);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v9 = objc_msgSend(a1, "mxSessionIDs", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          -[_MRNowPlayingPlayerProtobuf addMxSessionID:](v2, "addMxSessionID:", [*(id *)(*((void *)&v15 + 1) + 8 * i) integerValue]);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    [(_MRNowPlayingPlayerProtobuf *)v2 setAudioSessionID:a1[2]];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)initWithProtobuf:(id)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    v5 = [v3 identifier];
    v6 = [v4 displayName];
    uint64_t v7 = [a1 initWithIdentifier:v5 displayName:v6];

    if (v7)
    {
      if ([v4 hasIconURL])
      {
        id v8 = objc_alloc(MEMORY[0x1E4F1CB10]);
        v9 = [v4 iconURL];
        uint64_t v10 = [v8 initWithString:v9];
        uint64_t v11 = *(void **)(v7 + 32);
        *(void *)(v7 + 32) = v10;
      }
      else
      {
        v9 = *(void **)(v7 + 32);
        *(void *)(v7 + 32) = 0;
      }

      int v13 = [v4 audioSessionType];
      uint64_t v14 = 2 * (v13 == 2);
      if (v13 == 1) {
        uint64_t v14 = 1;
      }
      *(void *)(v7 + 40) = v14;
      long long v15 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "mxSessionIDsCount"));
      if ([v4 mxSessionIDsCount])
      {
        unint64_t v16 = 0;
        do
        {
          long long v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "mxSessionIDAtIndex:", v16));
          [v15 addObject:v17];

          ++v16;
        }
        while (v16 < [v4 mxSessionIDsCount]);
      }
      uint64_t v18 = [v15 copy];
      v19 = *(void **)(v7 + 48);
      *(void *)(v7 + 48) = v18;

      *(_DWORD *)(v7 + 8) = [v4 audioSessionID];
    }
    a1 = (id)v7;
    id v12 = a1;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (MRPlayer)initWithIdentifier:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRPlayer;
  id v8 = [(MRPlayer *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v11;
  }
  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

+ (MRPlayer)anyPlayer
{
  v2 = (void *)[objc_alloc((Class)a1) initWithIdentifier:@"any" displayName:@"any"];

  return (MRPlayer *)v2;
}

- (BOOL)isDefaultPlayer
{
  id v3 = +[MRPlayer defaultPlayer];
  LOBYTE(self) = [(MRPlayer *)self isEqual:v3];

  return (char)self;
}

+ (MRPlayer)defaultPlayer
{
  if (defaultPlayer_onceToken != -1) {
    dispatch_once(&defaultPlayer_onceToken, &__block_literal_global_91);
  }
  v2 = (void *)defaultPlayer_defaultPlayer;

  return (MRPlayer *)v2;
}

uint64_t __25__MRPlayer_defaultPlayer__block_invoke()
{
  defaultPlayer_defaultPlayer = [[MRPlayer alloc] initWithIdentifier:@"MediaRemote-DefaultPlayer" displayName:@"Default Player"];

  return MEMORY[0x1F41817F8]();
}

- (MRPlayer)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_MRNowPlayingPlayerProtobuf alloc] initWithData:v4];

    self = (MRPlayer *)-[MRPlayer initWithProtobuf:](self, v5);
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSData)data
{
  v2 = -[MRPlayer protobuf]((unsigned int *)self);
  id v3 = [v2 data];

  return (NSData *)v3;
}

- (MRPlayer)skeleton
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [(MRPlayer *)self identifier];
  v5 = [(MRPlayer *)self displayName];
  id v6 = (void *)[v3 initWithIdentifier:v4 displayName:v5];

  return (MRPlayer *)v6;
}

- (BOOL)hasAuxiliaryProperties
{
  if ([(MRPlayer *)self audioSessionType]
    || [(NSSet *)self->_mxSessionIDs count]
    || self->_audioSessionID)
  {
    return 1;
  }
  v5 = [(MRPlayer *)self appIcon];
  BOOL v3 = v5 != 0;

  return v3;
}

- (id)dictionaryRepresentation
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v3 = [a1 identifier];
    [v2 setObject:v3 forKeyedSubscript:@"identifier"];

    id v4 = [a1 displayName];
    [v2 setObject:v4 forKeyedSubscript:@"displayName"];

    v5 = [a1 appIcon];
    [v2 setObject:v5 forKeyedSubscript:@"appIcon"];

    id v6 = NSStringFromMRPlayerAudioSessionType([a1 audioSessionType]);
    [v2 setObject:v6 forKeyedSubscript:@"audioSessionType"];

    id v7 = [a1 mxSessionIDs];
    [v2 setObject:v7 forKeyedSubscript:@"mxSessionIDs"];

    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "audioSessionID"));
    [v2 setObject:v8 forKeyedSubscript:@"audioSessionID"];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = -[MRPlayer dictionaryRepresentation](self);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (void)mergeFrom:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 identifier];

  if (v4)
  {
    v5 = [v12 identifier];
    [(MRPlayer *)self setIdentifier:v5];
  }
  id v6 = [v12 displayName];

  if (v6)
  {
    id v7 = [v12 displayName];
    [(MRPlayer *)self setDisplayName:v7];
  }
  id v8 = [v12 appIcon];

  if (v8)
  {
    uint64_t v9 = [v12 appIcon];
    [(MRPlayer *)self setAppIcon:v9];
  }
  if ([v12 audioSessionType]) {
    -[MRPlayer setAudioSessionType:](self, "setAudioSessionType:", [v12 audioSessionType]);
  }
  uint64_t v10 = [v12 mxSessionIDs];

  if (v10)
  {
    uint64_t v11 = [v12 mxSessionIDs];
    [(MRPlayer *)self setMxSessionIDs:v11];
  }
  if ([v12 audioSessionID]) {
    -[MRPlayer setAudioSessionID:](self, "setAudioSessionID:", [v12 audioSessionID]);
  }
}

@end