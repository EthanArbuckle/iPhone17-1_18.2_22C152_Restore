@interface SFPlayMediaCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPlaybackLocation;
- (BOOL)hasShouldPause;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldPause;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFAudioData)audioData;
- (SFMediaMetadata)mediaMetadata;
- (SFPlayMediaCommand)initWithCoder:(id)a3;
- (SFPlayMediaCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)playbackLocation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioData:(id)a3;
- (void)setMediaMetadata:(id)a3;
- (void)setPlaybackLocation:(int)a3;
- (void)setShouldPause:(BOOL)a3;
@end

@implementation SFPlayMediaCommand

- (SFPlayMediaCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFPlayMediaCommand;
  v5 = [(SFPlayMediaCommand *)&v16 init];
  if (v5)
  {
    v6 = [v4 mediaMetadata];

    if (v6)
    {
      v7 = [SFMediaMetadata alloc];
      v8 = [v4 mediaMetadata];
      v9 = [(SFMediaMetadata *)v7 initWithProtobuf:v8];
      [(SFPlayMediaCommand *)v5 setMediaMetadata:v9];
    }
    if ([v4 playbackLocation]) {
      -[SFPlayMediaCommand setPlaybackLocation:](v5, "setPlaybackLocation:", [v4 playbackLocation]);
    }
    if ([v4 shouldPause]) {
      -[SFPlayMediaCommand setShouldPause:](v5, "setShouldPause:", [v4 shouldPause]);
    }
    v10 = [v4 audioData];

    if (v10)
    {
      v11 = [SFAudioData alloc];
      v12 = [v4 audioData];
      v13 = [(SFAudioData *)v11 initWithProtobuf:v12];
      [(SFPlayMediaCommand *)v5 setAudioData:v13];
    }
    v14 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_mediaMetadata, 0);
}

- (void)setAudioData:(id)a3
{
}

- (SFAudioData)audioData
{
  return self->_audioData;
}

- (BOOL)shouldPause
{
  return self->_shouldPause;
}

- (int)playbackLocation
{
  return self->_playbackLocation;
}

- (void)setMediaMetadata:(id)a3
{
}

- (SFMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)SFPlayMediaCommand;
  unint64_t v3 = [(SFCommand *)&v11 hash];
  id v4 = [(SFPlayMediaCommand *)self mediaMetadata];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = v5 ^ [(SFPlayMediaCommand *)self playbackLocation];
  uint64_t v7 = v6 ^ [(SFPlayMediaCommand *)self shouldPause];
  v8 = [(SFPlayMediaCommand *)self audioData];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SFPlayMediaCommand *)a3;
  if (self == v6)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFPlayMediaCommand *)v6 isMemberOfClass:objc_opt_class()])
    {
      v23.receiver = self;
      v23.super_class = (Class)SFPlayMediaCommand;
      if ([(SFCommand *)&v23 isEqual:v6])
      {
        uint64_t v7 = v6;
        v8 = [(SFPlayMediaCommand *)self mediaMetadata];
        unint64_t v9 = [(SFPlayMediaCommand *)v7 mediaMetadata];
        if ((v8 == 0) == (v9 != 0))
        {
          char v11 = 0;
LABEL_21:

          goto LABEL_22;
        }
        v10 = [(SFPlayMediaCommand *)self mediaMetadata];
        if (!v10
          || ([(SFPlayMediaCommand *)self mediaMetadata],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFPlayMediaCommand *)v7 mediaMetadata],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          int v12 = [(SFPlayMediaCommand *)self playbackLocation];
          if (v12 == [(SFPlayMediaCommand *)v7 playbackLocation])
          {
            BOOL v13 = [(SFPlayMediaCommand *)self shouldPause];
            if (v13 == [(SFPlayMediaCommand *)v7 shouldPause])
            {
              v14 = [(SFPlayMediaCommand *)self audioData];
              v15 = [(SFPlayMediaCommand *)v7 audioData];
              if ((v14 == 0) != (v15 != 0))
              {
                v21 = v14;
                v22 = v15;
                uint64_t v16 = [(SFPlayMediaCommand *)self audioData];
                if (v16)
                {
                  v20 = (void *)v16;
                  v17 = [(SFPlayMediaCommand *)self audioData];
                  v18 = [(SFPlayMediaCommand *)v7 audioData];
                  char v11 = [v17 isEqual:v18];

                  if (!v10) {
                    goto LABEL_20;
                  }
                }
                else
                {

                  char v11 = 1;
                  if (!v10) {
                    goto LABEL_20;
                  }
                }
                goto LABEL_19;
              }
            }
          }
          char v11 = 0;
          if (!v10)
          {
LABEL_20:

            goto LABEL_21;
          }
        }
        else
        {
          char v11 = 0;
        }
LABEL_19:

        goto LABEL_20;
      }
    }
    char v11 = 0;
  }
LABEL_22:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFPlayMediaCommand;
  id v4 = [(SFCommand *)&v10 copyWithZone:a3];
  uint64_t v5 = [(SFPlayMediaCommand *)self mediaMetadata];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setMediaMetadata:v6];

  objc_msgSend(v4, "setPlaybackLocation:", -[SFPlayMediaCommand playbackLocation](self, "playbackLocation"));
  objc_msgSend(v4, "setShouldPause:", -[SFPlayMediaCommand shouldPause](self, "shouldPause"));
  uint64_t v7 = [(SFPlayMediaCommand *)self audioData];
  v8 = (void *)[v7 copy];
  [v4 setAudioData:v8];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPlayMediaCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPlayMediaCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPlayMediaCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPlayMediaCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFPlayMediaCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFPlayMediaCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFPlayMediaCommand *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v7 = [[_SFPBCommand alloc] initWithData:v6];
  v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v9 = [(SFCommand *)v8 mediaMetadata];
    [(SFPlayMediaCommand *)v5 setMediaMetadata:v9];

    [(SFPlayMediaCommand *)v5 setPlaybackLocation:[(SFCommand *)v8 playbackLocation]];
    [(SFPlayMediaCommand *)v5 setShouldPause:[(SFCommand *)v8 shouldPause]];
    objc_super v10 = [(SFCommand *)v8 audioData];
    [(SFPlayMediaCommand *)v5 setAudioData:v10];

    char v11 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v11];

    int v12 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v12];

    BOOL v13 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v13];

    v14 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v14];
  }
  return v5;
}

- (BOOL)hasShouldPause
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setShouldPause:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldPause = a3;
}

- (BOOL)hasPlaybackLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPlaybackLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_playbackLocation = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end