@interface _SFPBPlayMediaCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldPause;
- (NSData)jsonData;
- (_SFPBAudioData)audioData;
- (_SFPBMediaMetadata)mediaMetadata;
- (_SFPBPlayMediaCommand)initWithDictionary:(id)a3;
- (_SFPBPlayMediaCommand)initWithFacade:(id)a3;
- (_SFPBPlayMediaCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)playbackLocation;
- (unint64_t)hash;
- (void)setAudioData:(id)a3;
- (void)setMediaMetadata:(id)a3;
- (void)setPlaybackLocation:(int)a3;
- (void)setShouldPause:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPlayMediaCommand

- (_SFPBPlayMediaCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBPlayMediaCommand *)self init];
  if (v5)
  {
    v6 = [v4 mediaMetadata];

    if (v6)
    {
      v7 = [_SFPBMediaMetadata alloc];
      v8 = [v4 mediaMetadata];
      v9 = [(_SFPBMediaMetadata *)v7 initWithFacade:v8];
      [(_SFPBPlayMediaCommand *)v5 setMediaMetadata:v9];
    }
    if ([v4 hasPlaybackLocation]) {
      -[_SFPBPlayMediaCommand setPlaybackLocation:](v5, "setPlaybackLocation:", [v4 playbackLocation]);
    }
    if ([v4 hasShouldPause]) {
      -[_SFPBPlayMediaCommand setShouldPause:](v5, "setShouldPause:", [v4 shouldPause]);
    }
    v10 = [v4 audioData];

    if (v10)
    {
      v11 = [_SFPBAudioData alloc];
      v12 = [v4 audioData];
      v13 = [(_SFPBAudioData *)v11 initWithFacade:v12];
      [(_SFPBPlayMediaCommand *)v5 setAudioData:v13];
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

- (_SFPBAudioData)audioData
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

- (_SFPBMediaMetadata)mediaMetadata
{
  return self->_mediaMetadata;
}

- (_SFPBPlayMediaCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SFPBPlayMediaCommand;
  v5 = [(_SFPBPlayMediaCommand *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mediaMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBMediaMetadata alloc] initWithDictionary:v6];
      [(_SFPBPlayMediaCommand *)v5 setMediaMetadata:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"playbackLocation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPlayMediaCommand setPlaybackLocation:](v5, "setPlaybackLocation:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"shouldPause"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPlayMediaCommand setShouldPause:](v5, "setShouldPause:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"audioData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBAudioData alloc] initWithDictionary:v10];
      [(_SFPBPlayMediaCommand *)v5 setAudioData:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (_SFPBPlayMediaCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPlayMediaCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPlayMediaCommand *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_audioData)
  {
    id v4 = [(_SFPBPlayMediaCommand *)self audioData];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"audioData"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"audioData"];
    }
  }
  if (self->_mediaMetadata)
  {
    uint64_t v7 = [(_SFPBPlayMediaCommand *)self mediaMetadata];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"mediaMetadata"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"mediaMetadata"];
    }
  }
  if (self->_playbackLocation)
  {
    uint64_t v10 = [(_SFPBPlayMediaCommand *)self playbackLocation];
    if (v10 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5A2F070[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"playbackLocation"];
  }
  if (self->_shouldPause)
  {
    v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBPlayMediaCommand shouldPause](self, "shouldPause"));
    [v3 setObject:v12 forKeyedSubscript:@"shouldPause"];
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBMediaMetadata *)self->_mediaMetadata hash];
  if (self->_shouldPause) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v4 = 2654435761 * self->_playbackLocation;
  return v4 ^ v3 ^ v5 ^ [(_SFPBAudioData *)self->_audioData hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  uint64_t v5 = [(_SFPBPlayMediaCommand *)self mediaMetadata];
  v6 = [v4 mediaMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_13;
  }
  uint64_t v7 = [(_SFPBPlayMediaCommand *)self mediaMetadata];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBPlayMediaCommand *)self mediaMetadata];
    uint64_t v10 = [v4 mediaMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  int playbackLocation = self->_playbackLocation;
  if (playbackLocation != [v4 playbackLocation]) {
    goto LABEL_14;
  }
  int shouldPause = self->_shouldPause;
  if (shouldPause != [v4 shouldPause]) {
    goto LABEL_14;
  }
  uint64_t v5 = [(_SFPBPlayMediaCommand *)self audioData];
  v6 = [v4 audioData];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v14 = [(_SFPBPlayMediaCommand *)self audioData];
    if (!v14)
    {

LABEL_17:
      BOOL v19 = 1;
      goto LABEL_15;
    }
    v15 = (void *)v14;
    v16 = [(_SFPBPlayMediaCommand *)self audioData];
    v17 = [v4 audioData];
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_13:
  }
LABEL_14:
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFPBPlayMediaCommand *)self mediaMetadata];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBPlayMediaCommand *)self playbackLocation]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBPlayMediaCommand *)self shouldPause]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v5 = [(_SFPBPlayMediaCommand *)self audioData];
  if (v5) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPlayMediaCommandReadFrom(self, (uint64_t)a3);
}

- (void)setAudioData:(id)a3
{
}

- (void)setShouldPause:(BOOL)a3
{
  self->_int shouldPause = a3;
}

- (void)setPlaybackLocation:(int)a3
{
  self->_int playbackLocation = a3;
}

- (void)setMediaMetadata:(id)a3
{
}

@end