@interface MRNowPlayingState
- (BOOL)containsArtwork;
- (BOOL)hasPlaybackState;
- (BOOL)hasPlaybackStateTimestamp;
- (MRNowPlayingState)initWithData:(id)a3;
- (MRNowPlayingState)initWithPlayerPath:(id)a3;
- (MRNowPlayingState)initWithProtobuf:(id)a3;
- (MRPlaybackQueue)playbackQueue;
- (MRPlaybackQueueRequest)request;
- (MRPlayerPath)playerPath;
- (NSArray)supportedCommands;
- (NSData)data;
- (NSDictionary)nowPlayingInfo;
- (NSString)displayID;
- (NSString)displayName;
- (double)playbackStateTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithoutArtwork;
- (id)description;
- (id)dictionaryRepresentation;
- (id)protobufWithEncoding:(int64_t)a3;
- (unint64_t)playbackQueueCapabilities;
- (unsigned)playbackState;
- (void)setDisplayID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasPlaybackState:(BOOL)a3;
- (void)setHasPlaybackStateTimestamp:(BOOL)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setPlaybackQueue:(id)a3;
- (void)setPlaybackQueueCapabilities:(unint64_t)a3;
- (void)setPlaybackState:(unsigned int)a3;
- (void)setPlaybackStateTimestamp:(double)a3;
- (void)setPlayerPath:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSupportedCommands:(id)a3;
@end

@implementation MRNowPlayingState

- (BOOL)hasPlaybackState
{
  return self->_hasPlaybackState;
}

- (MRNowPlayingState)initWithPlayerPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRNowPlayingState;
  v5 = [(MRNowPlayingState *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    playerPath = v5->_playerPath;
    v5->_playerPath = (MRPlayerPath *)v6;
  }
  return v5;
}

- (MRNowPlayingState)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [MRPlayerPath alloc];
    uint64_t v6 = [v4 playerPath];
    v7 = [(MRPlayerPath *)v5 initWithProtobuf:v6];

    v8 = [(MRNowPlayingState *)self initWithPlayerPath:v7];
    if (v8)
    {
      objc_super v9 = [v4 displayID];
      uint64_t v10 = [v9 copy];
      displayID = v8->_displayID;
      v8->_displayID = (NSString *)v10;

      v12 = [v4 displayName];
      uint64_t v13 = [v12 copy];
      displayName = v8->_displayName;
      v8->_displayName = (NSString *)v13;

      v15 = [v4 playbackQueueCapabilities];
      v8->_playbackQueueCapabilities = _MRPlaybackQueueCapabilitiesFromProto(v15);

      v16 = [MRPlaybackQueue alloc];
      v17 = [v4 playbackQueue];
      uint64_t v18 = [(MRPlaybackQueue *)v16 initWithProtobuf:v17];
      playbackQueue = v8->_playbackQueue;
      v8->_playbackQueue = (MRPlaybackQueue *)v18;

      v20 = [MRPlaybackQueueRequest alloc];
      v21 = [v4 request];
      uint64_t v22 = [(MRPlaybackQueueRequest *)v20 initWithProtobuf:v21];
      request = v8->_request;
      v8->_request = (MRPlaybackQueueRequest *)v22;

      v24 = [v4 supportedCommands];
      v25 = [v24 supportedCommands];
      uint64_t v26 = objc_msgSend(v25, "mr_map:", &__block_literal_global_32);
      supportedCommands = v8->_supportedCommands;
      v8->_supportedCommands = (NSArray *)v26;

      v8->_hasPlaybackState = [v4 hasPlaybackState];
      unsigned int v28 = [v4 playbackState];
      if (v28 - 1 >= 5) {
        unsigned int v29 = 0;
      }
      else {
        unsigned int v29 = v28;
      }
      v8->_playbackState = v29;
      v8->_hasPlaybackStateTimestamp = [v4 hasPlaybackStateTimestamp];
      [v4 playbackStateTimestamp];
      v8->_playbackStateTimestamp = v30;
    }
    self = v8;

    v31 = self;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

MRCommandInfo *__38__MRNowPlayingState_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRCommandInfo alloc] initWithProtobuf:v2];

  return v3;
}

- (MRNowPlayingState)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_MRSetStateMessageProtobuf alloc] initWithData:v4];

    self = [(MRNowPlayingState *)self initWithProtobuf:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)protobufWithEncoding:(int64_t)a3
{
  v5 = objc_alloc_init(_MRSetStateMessageProtobuf);
  uint64_t v6 = [(MRNowPlayingState *)self displayID];
  v7 = (void *)[v6 copy];
  [(_MRSetStateMessageProtobuf *)v5 setDisplayID:v7];

  v8 = [(MRNowPlayingState *)self displayName];
  objc_super v9 = (void *)[v8 copy];
  [(_MRSetStateMessageProtobuf *)v5 setDisplayName:v9];

  uint64_t v10 = _MRPlaybackQueueCapabilitiesCreateProtobuf([(MRNowPlayingState *)self playbackQueueCapabilities]);
  [(_MRSetStateMessageProtobuf *)v5 setPlaybackQueueCapabilities:v10];

  v11 = [(MRNowPlayingState *)self playbackQueue];
  v12 = [v11 protobufWithEncoding:a3];
  [(_MRSetStateMessageProtobuf *)v5 setPlaybackQueue:v12];

  uint64_t v13 = [(MRNowPlayingState *)self playerPath];
  v14 = [v13 protobuf];
  [(_MRSetStateMessageProtobuf *)v5 setPlayerPath:v14];

  v15 = [(MRNowPlayingState *)self request];
  v16 = [v15 protobuf];
  [(_MRSetStateMessageProtobuf *)v5 setRequest:v16];

  v17 = [(MRNowPlayingState *)self supportedCommands];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v19 = objc_alloc_init(_MRSupportedCommandsProtobuf);
    v20 = [(MRNowPlayingState *)self supportedCommands];
    v21 = objc_msgSend(v20, "mr_map:", &__block_literal_global_8_0);
    uint64_t v22 = (void *)[v21 mutableCopy];
    [(_MRSupportedCommandsProtobuf *)v19 setSupportedCommands:v22];

    [(_MRSetStateMessageProtobuf *)v5 setSupportedCommands:v19];
  }
  unsigned int v23 = [(MRNowPlayingState *)self playbackState];
  if (v23 - 1 >= 5) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = v23;
  }
  [(_MRSetStateMessageProtobuf *)v5 setPlaybackState:v24];
  [(_MRSetStateMessageProtobuf *)v5 setHasPlaybackState:[(MRNowPlayingState *)self hasPlaybackState]];
  [(MRNowPlayingState *)self playbackStateTimestamp];
  -[_MRSetStateMessageProtobuf setPlaybackStateTimestamp:](v5, "setPlaybackStateTimestamp:");
  [(_MRSetStateMessageProtobuf *)v5 setHasPlaybackStateTimestamp:[(MRNowPlayingState *)self hasPlaybackStateTimestamp]];

  return v5;
}

uint64_t __42__MRNowPlayingState_protobufWithEncoding___block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

- (NSData)data
{
  id v2 = [(MRNowPlayingState *)self protobufWithEncoding:0];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (BOOL)containsArtwork
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = [(MRNowPlayingState *)self playbackQueue];
  v3 = [v2 contentItems];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_super v9 = [v8 artwork];
        if (v9)
        {

LABEL_13:
          BOOL v12 = 1;
          goto LABEL_14;
        }
        uint64_t v10 = [v8 artworks];
        uint64_t v11 = [v10 count];

        if (v11) {
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_14:

  return v12;
}

- (id)copyWithoutArtwork
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[(MRNowPlayingState *)self copy];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(v2, "playbackQueue", 0);
  uint64_t v4 = [v3 contentItems];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v9 setArtwork:0];
        [v9 setArtworks:0];
        [v9 setRemoteArtworks:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v2;
}

- (NSDictionary)nowPlayingInfo
{
  v3 = [(MRNowPlayingState *)self playbackQueue];
  int v4 = [v3 hasLocation];

  if (v4)
  {
    uint64_t v5 = [(MRNowPlayingState *)self playbackQueue];
    uint64_t v6 = [v5 nowPlayingInfo];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSDictionary *)v6;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v4 = [(MRNowPlayingState *)self nowPlayingInfo];
  [v3 setObject:v4 forKeyedSubscript:@"nowPlayingInfo"];

  uint64_t v5 = [(MRNowPlayingState *)self supportedCommands];
  uint64_t v6 = objc_msgSend(v5, "mr_map:", &__block_literal_global_12_0);
  [v3 setObject:v6 forKeyedSubscript:@"supportedCommands"];

  uint64_t v7 = [(MRNowPlayingState *)self playbackQueue];
  v8 = [v7 dictionaryRepresentation];
  [v3 setObject:v8 forKeyedSubscript:@"playbackQueue"];

  objc_super v9 = [(MRNowPlayingState *)self displayID];
  [v3 setObject:v9 forKeyedSubscript:@"displayID"];

  uint64_t v10 = [(MRNowPlayingState *)self displayName];
  [v3 setObject:v10 forKeyedSubscript:@"displayName"];

  long long v11 = [(MRNowPlayingState *)self playerPath];
  long long v12 = [v11 description];
  [v3 setObject:v12 forKeyedSubscript:@"playerPath"];

  long long v13 = [(MRNowPlayingState *)self request];
  long long v14 = [v13 description];
  [v3 setObject:v14 forKeyedSubscript:@"request"];

  unsigned int v15 = [(MRNowPlayingState *)self playbackState] - 1;
  if (v15 > 4) {
    uint64_t v16 = @"Unknown";
  }
  else {
    uint64_t v16 = off_1E57D3020[v15];
  }
  [v3 setObject:v16 forKeyedSubscript:@"playbackState"];
  if ([(MRNowPlayingState *)self hasPlaybackStateTimestamp])
  {
    long long v17 = NSNumber;
    [(MRNowPlayingState *)self playbackStateTimestamp];
    uint64_t v18 = objc_msgSend(v17, "numberWithDouble:");
    [v3 setObject:v18 forKeyedSubscript:@"playbackStateTimestamp"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"playbackStateTimestamp"];
  }

  return v3;
}

uint64_t __45__MRNowPlayingState_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (void)setPlaybackState:(unsigned int)a3
{
  self->_playbackState = a3;
  self->_hasPlaybackState = 1;
}

- (void)setPlaybackStateTimestamp:(double)a3
{
  self->_playbackStateTimestamp = a3;
  self->_hasPlaybackStateTimestamp = 1;
}

- (void)setNowPlayingInfo:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[MRContentItem alloc] initWithNowPlayingInfo:v4];

  uint64_t v5 = [[MRPlaybackQueue alloc] initWithContentItem:v6];
  [(MRNowPlayingState *)self setPlaybackQueue:v5];
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(MRNowPlayingState *)self dictionaryRepresentation];
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(MRNowPlayingState *)self displayID];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setDisplayID:v7];

  v8 = [(MRNowPlayingState *)self displayName];
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setDisplayName:v9];

  uint64_t v10 = [(MRNowPlayingState *)self nowPlayingInfo];
  long long v11 = (void *)[v10 copyWithZone:a3];
  [v5 setNowPlayingInfo:v11];

  objc_msgSend(v5, "setPlaybackQueueCapabilities:", -[MRNowPlayingState playbackQueueCapabilities](self, "playbackQueueCapabilities"));
  long long v12 = [(MRNowPlayingState *)self playbackQueue];
  long long v13 = (void *)[v12 copyWithZone:a3];
  [v5 setPlaybackQueue:v13];

  long long v14 = [(MRNowPlayingState *)self playerPath];
  unsigned int v15 = (void *)[v14 copyWithZone:a3];
  [v5 setPlayerPath:v15];

  uint64_t v16 = [(MRNowPlayingState *)self request];
  long long v17 = (void *)[v16 copyWithZone:a3];
  [v5 setRequest:v17];

  uint64_t v18 = [(MRNowPlayingState *)self supportedCommands];
  uint64_t v19 = (void *)[v18 copyWithZone:a3];
  [v5 setSupportedCommands:v19];

  objc_msgSend(v5, "setPlaybackState:", -[MRNowPlayingState playbackState](self, "playbackState"));
  objc_msgSend(v5, "setHasPlaybackState:", -[MRNowPlayingState hasPlaybackState](self, "hasPlaybackState"));
  [(MRNowPlayingState *)self playbackStateTimestamp];
  objc_msgSend(v5, "setPlaybackStateTimestamp:");
  objc_msgSend(v5, "setHasPlaybackStateTimestamp:", -[MRNowPlayingState hasPlaybackStateTimestamp](self, "hasPlaybackStateTimestamp"));
  return v5;
}

- (NSArray)supportedCommands
{
  return self->_supportedCommands;
}

- (void)setSupportedCommands:(id)a3
{
}

- (MRPlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (void)setPlaybackQueue:(id)a3
{
}

- (NSString)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (MRPlaybackQueueRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void)setHasPlaybackState:(BOOL)a3
{
  self->_hasPlaybackState = a3;
}

- (unsigned)playbackState
{
  return self->_playbackState;
}

- (BOOL)hasPlaybackStateTimestamp
{
  return self->_hasPlaybackStateTimestamp;
}

- (void)setHasPlaybackStateTimestamp:(BOOL)a3
{
  self->_hasPlaybackStateTimestamp = a3;
}

- (double)playbackStateTimestamp
{
  return self->_playbackStateTimestamp;
}

- (unint64_t)playbackQueueCapabilities
{
  return self->_playbackQueueCapabilities;
}

- (void)setPlaybackQueueCapabilities:(unint64_t)a3
{
  self->_playbackQueueCapabilities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);

  objc_storeStrong((id *)&self->_supportedCommands, 0);
}

@end