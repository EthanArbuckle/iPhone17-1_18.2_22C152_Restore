@interface TVRMSNowPlayingArtworkAvailableMessage
- (BOOL)hasArtworkIdentifier;
- (BOOL)hasSessionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)artworkIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sessionIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtworkIdentifier:(id)a3;
- (void)setHasSessionIdentifier:(BOOL)a3;
- (void)setSessionIdentifier:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TVRMSNowPlayingArtworkAvailableMessage

- (void)setSessionIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionIdentifier = a3;
}

- (void)setHasSessionIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasArtworkIdentifier
{
  return self->_artworkIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVRMSNowPlayingArtworkAvailableMessage;
  v4 = [(TVRMSNowPlayingArtworkAvailableMessage *)&v8 description];
  v5 = [(TVRMSNowPlayingArtworkAvailableMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_sessionIdentifier];
    [v3 setObject:v4 forKey:@"sessionIdentifier"];
  }
  artworkIdentifier = self->_artworkIdentifier;
  if (artworkIdentifier) {
    [v3 setObject:artworkIdentifier forKey:@"artworkIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TVRMSNowPlayingArtworkAvailableMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_artworkIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_sessionIdentifier;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  if (self->_artworkIdentifier)
  {
    id v5 = v4;
    objc_msgSend(v4, "setArtworkIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_sessionIdentifier;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_artworkIdentifier copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_sessionIdentifier != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  artworkIdentifier = self->_artworkIdentifier;
  if ((unint64_t)artworkIdentifier | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](artworkIdentifier, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_sessionIdentifier;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_artworkIdentifier hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[5])
  {
    self->_sessionIdentifier = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[TVRMSNowPlayingArtworkAvailableMessage setArtworkIdentifier:](self, "setArtworkIdentifier:");
    id v4 = v5;
  }
}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)artworkIdentifier
{
  return self->_artworkIdentifier;
}

- (void)setArtworkIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end