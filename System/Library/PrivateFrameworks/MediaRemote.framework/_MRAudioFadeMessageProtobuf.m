@interface _MRAudioFadeMessageProtobuf
- (BOOL)hasFadeType;
- (BOOL)hasPlayerPath;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRNowPlayingPlayerPathProtobuf)playerPath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fadeTypeAsString:(int)a3;
- (int)StringAsFadeType:(id)a3;
- (int)fadeType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFadeType:(int)a3;
- (void)setHasFadeType:(BOOL)a3;
- (void)setPlayerPath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAudioFadeMessageProtobuf

- (BOOL)hasPlayerPath
{
  return self->_playerPath != 0;
}

- (int)fadeType
{
  if (*(unsigned char *)&self->_has) {
    return self->_fadeType;
  }
  else {
    return 0;
  }
}

- (void)setFadeType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fadeType = a3;
}

- (void)setHasFadeType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFadeType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)fadeTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"FadeIn";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"FadeOut";
  }
  return v4;
}

- (int)StringAsFadeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FadeOut"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"FadeIn"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAudioFadeMessageProtobuf;
  int v4 = [(_MRAudioFadeMessageProtobuf *)&v8 description];
  v5 = [(_MRAudioFadeMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  playerPath = self->_playerPath;
  if (playerPath)
  {
    v5 = [(_MRNowPlayingPlayerPathProtobuf *)playerPath dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"playerPath"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int fadeType = self->_fadeType;
    if (fadeType)
    {
      if (fadeType == 1)
      {
        v7 = @"FadeIn";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fadeType);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = @"FadeOut";
    }
    [v3 setObject:v7 forKey:@"fadeType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAudioFadeMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_playerPath)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_playerPath)
  {
    id v5 = v4;
    objc_msgSend(v4, "setPlayerPath:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_fadeType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_fadeType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  playerPath = self->_playerPath;
  if ((unint64_t)playerPath | *((void *)v4 + 2))
  {
    if (!-[_MRNowPlayingPlayerPathProtobuf isEqual:](playerPath, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_fadeType == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MRNowPlayingPlayerPathProtobuf *)self->_playerPath hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_fadeType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  playerPath = self->_playerPath;
  uint64_t v6 = *((void *)v4 + 2);
  if (playerPath)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    playerPath = (_MRNowPlayingPlayerPathProtobuf *)-[_MRNowPlayingPlayerPathProtobuf mergeFrom:](playerPath, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    playerPath = (_MRNowPlayingPlayerPathProtobuf *)-[_MRAudioFadeMessageProtobuf setPlayerPath:](self, "setPlayerPath:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 24))
  {
    self->_int fadeType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x1F41817F8](playerPath, v4);
}

- (_MRNowPlayingPlayerPathProtobuf)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end