@interface _MRLyricsItemProtobuf
- (BOOL)hasLyrics;
- (BOOL)hasToken;
- (BOOL)hasUserProvided;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userProvided;
- (NSString)lyrics;
- (_MRLyricsTokenProtobuf)token;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasUserProvided:(BOOL)a3;
- (void)setLyrics:(id)a3;
- (void)setToken:(id)a3;
- (void)setUserProvided:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRLyricsItemProtobuf

- (void)setUserProvided:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_userProvided = a3;
}

- (void)setToken:(id)a3
{
}

- (void)setLyrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_lyrics, 0);
}

- (BOOL)hasLyrics
{
  return self->_lyrics != 0;
}

- (void)setHasUserProvided:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUserProvided
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRLyricsItemProtobuf;
  v4 = [(_MRLyricsItemProtobuf *)&v8 description];
  v5 = [(_MRLyricsItemProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  lyrics = self->_lyrics;
  if (lyrics) {
    [v3 setObject:lyrics forKey:@"lyrics"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_userProvided];
    [v4 setObject:v6 forKey:@"userProvided"];
  }
  token = self->_token;
  if (token)
  {
    objc_super v8 = [(_MRLyricsTokenProtobuf *)token dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"token"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRLyricsItemProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_lyrics)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_token)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_lyrics)
  {
    objc_msgSend(v4, "setLyrics:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_userProvided;
    v4[28] |= 1u;
  }
  if (self->_token)
  {
    objc_msgSend(v5, "setToken:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_lyrics copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_userProvided;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  id v8 = [(_MRLyricsTokenProtobuf *)self->_token copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  lyrics = self->_lyrics;
  if ((unint64_t)lyrics | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](lyrics, "isEqual:")) {
      goto LABEL_8;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_userProvided)
      {
        if (*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
      }
      else if (!*((unsigned char *)v4 + 24))
      {
        goto LABEL_14;
      }
    }
LABEL_8:
    char v6 = 0;
    goto LABEL_9;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_8;
  }
LABEL_14:
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 2)) {
    char v6 = -[_MRLyricsTokenProtobuf isEqual:](token, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_lyrics hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_userProvided;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(_MRLyricsTokenProtobuf *)self->_token hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  v7 = v4;
  if (*((void *)v4 + 1))
  {
    -[_MRLyricsItemProtobuf setLyrics:](self, "setLyrics:");
    uint64_t v4 = v7;
  }
  if (v4[28])
  {
    self->_userProvided = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  token = self->_token;
  uint64_t v6 = *((void *)v4 + 2);
  if (token)
  {
    if (v6) {
      -[_MRLyricsTokenProtobuf mergeFrom:](token, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRLyricsItemProtobuf setToken:](self, "setToken:");
  }

  MEMORY[0x1F41817F8]();
}

- (NSString)lyrics
{
  return self->_lyrics;
}

- (BOOL)userProvided
{
  return self->_userProvided;
}

- (_MRLyricsTokenProtobuf)token
{
  return self->_token;
}

@end