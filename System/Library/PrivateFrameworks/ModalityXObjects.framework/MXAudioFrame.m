@interface MXAudioFrame
+ (Class)audioType;
- (BOOL)hasLastFrame;
- (BOOL)hasRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastFrame;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)audios;
- (NSString)requestId;
- (id)audioAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)audiosCount;
- (unint64_t)hash;
- (void)addAudio:(id)a3;
- (void)clearAudios;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAudios:(id)a3;
- (void)setHasLastFrame:(BOOL)a3;
- (void)setLastFrame:(BOOL)a3;
- (void)setRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXAudioFrame

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (void)clearAudios
{
}

- (void)addAudio:(id)a3
{
  id v4 = a3;
  audios = self->_audios;
  id v8 = v4;
  if (!audios)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_audios;
    self->_audios = v6;

    id v4 = v8;
    audios = self->_audios;
  }
  [(NSMutableArray *)audios addObject:v4];
}

- (unint64_t)audiosCount
{
  return [(NSMutableArray *)self->_audios count];
}

- (id)audioAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_audios objectAtIndex:a3];
}

+ (Class)audioType
{
  return (Class)objc_opt_class();
}

- (void)setLastFrame:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lastFrame = a3;
}

- (void)setHasLastFrame:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastFrame
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXAudioFrame;
  id v4 = [(MXAudioFrame *)&v8 description];
  v5 = [(MXAudioFrame *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  requestId = self->_requestId;
  if (requestId) {
    [v3 setObject:requestId forKey:@"request_id"];
  }
  audios = self->_audios;
  if (audios) {
    [v4 setObject:audios forKey:@"audio"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithBool:self->_lastFrame];
    [v4 setObject:v7 forKey:@"last_frame"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXAudioFrameReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_requestId) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_audios;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  if (self->_requestId) {
    objc_msgSend(v8, "setRequestId:");
  }
  if ([(MXAudioFrame *)self audiosCount])
  {
    [v8 clearAudios];
    unint64_t v4 = [(MXAudioFrame *)self audiosCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MXAudioFrame *)self audioAtIndex:i];
        [v8 addAudio:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[24] = self->_lastFrame;
    v8[28] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_audios;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [(id)v5 addAudio:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_lastFrame;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  requestId = self->_requestId;
  if ((unint64_t)requestId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](requestId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  audios = self->_audios;
  if ((unint64_t)audios | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](audios, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_lastFrame)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestId hash];
  uint64_t v4 = [(NSMutableArray *)self->_audios hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_lastFrame;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[MXAudioFrame setRequestId:](self, "setRequestId:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[MXAudioFrame addAudio:](self, "addAudio:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 28))
  {
    self->_lastFrame = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (NSMutableArray)audios
{
  return self->_audios;
}

- (void)setAudios:(id)a3
{
}

- (BOOL)lastFrame
{
  return self->_lastFrame;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);

  objc_storeStrong((id *)&self->_audios, 0);
}

@end