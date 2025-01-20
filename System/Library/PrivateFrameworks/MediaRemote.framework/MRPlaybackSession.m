@interface MRPlaybackSession
- (BOOL)isEqual:(id)a3;
- (MRPlaybackSession)initWithData:(id)a3;
- (MRPlaybackSession)initWithIdentifier:(id)a3 type:(id)a4 playbackSessionData:(id)a5 revision:(id)a6 metadata:(id)a7;
- (MRPlaybackSession)initWithProtobuf:(id)a3;
- (NSData)data;
- (NSData)metadata;
- (NSData)playbackSessionData;
- (NSString)identifier;
- (NSString)revision;
- (NSString)type;
- (_MRPlaybackSessionProtobuf)protobuf;
- (id)description;
- (id)dictionaryRepresentation;
- (void)setIdentifier:(id)a3;
- (void)setPlaybackSessionData:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MRPlaybackSession

- (MRPlaybackSession)initWithIdentifier:(id)a3 type:(id)a4 playbackSessionData:(id)a5 revision:(id)a6 metadata:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)MRPlaybackSession;
  v17 = [(MRPlaybackSession *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    type = v17->_type;
    v17->_type = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    playbackSessionData = v17->_playbackSessionData;
    v17->_playbackSessionData = (NSData *)v22;

    uint64_t v24 = [v15 copy];
    revision = v17->_revision;
    v17->_revision = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    metadata = v17->_metadata;
    v17->_metadata = (NSData *)v26;
  }
  return v17;
}

- (MRPlaybackSession)initWithProtobuf:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 identifier];
    v6 = [v4 type];
    v7 = [v4 playbackSessionData];
    v8 = [v4 revision];
    v9 = [v4 metadata];

    v10 = [(MRPlaybackSession *)self initWithIdentifier:v5 type:v6 playbackSessionData:v7 revision:v8 metadata:v9];
    self = v10;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MRPlaybackSession)initWithData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [[_MRPlaybackSessionProtobuf alloc] initWithData:v4];
    v6 = [(MRPlaybackSession *)self initWithProtobuf:v5];
  }
  else
  {
    v6 = [(MRPlaybackSession *)self initWithProtobuf:0];
  }

  return v6;
}

- (_MRPlaybackSessionProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRPlaybackSessionProtobuf);
  id v4 = [(MRPlaybackSession *)self identifier];
  [(_MRPlaybackSessionProtobuf *)v3 setIdentifier:v4];

  v5 = [(MRPlaybackSession *)self type];
  [(_MRPlaybackSessionProtobuf *)v3 setType:v5];

  v6 = [(MRPlaybackSession *)self playbackSessionData];
  [(_MRPlaybackSessionProtobuf *)v3 setPlaybackSessionData:v6];

  v7 = [(MRPlaybackSession *)self revision];
  [(_MRPlaybackSessionProtobuf *)v3 setRevision:v7];

  v8 = [(MRPlaybackSession *)self metadata];
  [(_MRPlaybackSessionProtobuf *)v3 setMetadata:v8];

  return v3;
}

- (NSData)data
{
  v2 = [(MRPlaybackSession *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MRPlaybackSession *)self playbackSessionData];
  [v3 setObject:v4 forKeyedSubscript:@"playbackSessionData"];

  v5 = [(MRPlaybackSession *)self identifier];
  [v3 setObject:v5 forKeyedSubscript:@"identifier"];

  v6 = [(MRPlaybackSession *)self type];
  [v3 setObject:v6 forKeyedSubscript:@"type"];

  v7 = [(MRPlaybackSession *)self revision];
  [v3 setObject:v7 forKeyedSubscript:@"revision"];

  v8 = [(MRPlaybackSession *)self metadata];
  [v3 setObject:v8 forKeyedSubscript:@"metadata"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRPlaybackSession *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(MRPlaybackSession *)v4 dictionaryRepresentation];
      v6 = [(MRPlaybackSession *)self dictionaryRepresentation];
      char v7 = [v5 isEqualToDictionary:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MRPlaybackSession *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSData)playbackSessionData
{
  return self->_playbackSessionData;
}

- (void)setPlaybackSessionData:(id)a3
{
}

- (NSString)revision
{
  return self->_revision;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_playbackSessionData, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end