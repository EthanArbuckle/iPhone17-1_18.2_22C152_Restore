@interface WFPBGallerySessionEndEvent
- (BOOL)hasDuration;
- (BOOL)hasKey;
- (BOOL)hasSessionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (NSString)sessionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)duration;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBGallerySessionEndEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (unsigned)duration
{
  return self->_duration;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (unsigned int *)a3;
  v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[WFPBGallerySessionEndEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBGallerySessionEndEvent setSessionIdentifier:](self, "setSessionIdentifier:");
    v4 = v5;
  }
  if (v4[8])
  {
    self->_duration = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_sessionIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_duration;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_10;
    }
  }
  sessionIdentifier = self->_sessionIdentifier;
  if ((unint64_t)sessionIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](sessionIdentifier, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_duration == *((_DWORD *)v4 + 2))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_duration;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v5, "setSessionIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_duration;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sessionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBGallerySessionEndEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v4 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    BOOL v7 = [NSNumber numberWithUnsignedInt:self->_duration];
    [v4 setObject:v7 forKey:@"duration"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBGallerySessionEndEvent;
  id v4 = [(WFPBGallerySessionEndEvent *)&v8 description];
  id v5 = [(WFPBGallerySessionEndEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDuration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"GallerySessionEnd";
  }
}

@end