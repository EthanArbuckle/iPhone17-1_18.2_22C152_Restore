@interface WFPBContextualActionEvent
- (BOOL)hasHasTrackpad;
- (BOOL)hasItemCount;
- (BOOL)hasKey;
- (BOOL)hasSource;
- (BOOL)hasTrackpad;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (NSString)source;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)itemCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasHasTrackpad:(BOOL)a3;
- (void)setHasItemCount:(BOOL)a3;
- (void)setHasTrackpad:(BOOL)a3;
- (void)setItemCount:(unsigned int)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFPBContextualActionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (unsigned)itemCount
{
  return self->_itemCount;
}

- (BOOL)hasTrackpad
{
  return self->_hasTrackpad;
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
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[WFPBContextualActionEvent setKey:](self, "setKey:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[WFPBContextualActionEvent setSource:](self, "setSource:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_hasTrackpad = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if (v5)
  {
    self->_itemCount = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  NSUInteger v4 = [(NSString *)self->_source hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_hasTrackpad;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_itemCount;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_18;
    }
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](source, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_hasTrackpad)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_14;
      }
    }
LABEL_18:
    BOOL v7 = 0;
    goto LABEL_19;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0) {
    goto LABEL_18;
  }
LABEL_14:
  BOOL v7 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_itemCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_18;
    }
    BOOL v7 = 1;
  }
LABEL_19:

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

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_hasTrackpad;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_itemCount;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v6;
  }
  if (self->_source)
  {
    objc_msgSend(v6, "setSource:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_hasTrackpad;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_itemCount;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFPBContextualActionEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v8 = [NSNumber numberWithBool:self->_hasTrackpad];
    [v4 setObject:v8 forKey:@"hasTrackpad"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_itemCount];
    [v4 setObject:v9 forKey:@"itemCount"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFPBContextualActionEvent;
  id v4 = [(WFPBContextualActionEvent *)&v8 description];
  uint64_t v5 = [(WFPBContextualActionEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasItemCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasItemCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setItemCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_itemCount = a3;
}

- (BOOL)hasHasTrackpad
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasHasTrackpad:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setHasTrackpad:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hasTrackpad = a3;
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
    return (NSString *)@"ContextualActionEvent";
  }
}

@end