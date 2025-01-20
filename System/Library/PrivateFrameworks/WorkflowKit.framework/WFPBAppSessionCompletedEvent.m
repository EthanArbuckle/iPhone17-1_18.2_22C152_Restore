@interface WFPBAppSessionCompletedEvent
- (BOOL)hasDuration;
- (BOOL)hasKey;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (NSString)source;
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
- (void)setSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBAppSessionCompletedEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (unsigned)duration
{
  return self->_duration;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
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
    -[WFPBAppSessionCompletedEvent setKey:](self, "setKey:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBAppSessionCompletedEvent setSource:](self, "setSource:");
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
  NSUInteger v4 = [(NSString *)self->_source hash];
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
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](source, "isEqual:")) {
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

  uint64_t v8 = [(NSString *)self->_source copyWithZone:a3];
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
  if (self->_source)
  {
    objc_msgSend(v5, "setSource:");
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
  if (self->_source)
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
  return WFPBAppSessionCompletedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  source = self->_source;
  if (source) {
    [v4 setObject:source forKey:@"source"];
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
  v8.super_class = (Class)WFPBAppSessionCompletedEvent;
  id v4 = [(WFPBAppSessionCompletedEvent *)&v8 description];
  id v5 = [(WFPBAppSessionCompletedEvent *)self dictionaryRepresentation];
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

- (BOOL)hasSource
{
  return self->_source != 0;
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
    return (NSString *)@"AppSessionCompleted";
  }
}

@end