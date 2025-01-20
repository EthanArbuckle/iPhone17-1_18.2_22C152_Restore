@interface _ICLLPlaybackItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLPlaybackItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaInfo, 0);
  objc_storeStrong((id *)&self->_mediaId, 0);
  objc_storeStrong((id *)&self->_itemId, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_itemId hash];
  NSUInteger v4 = [(NSString *)self->_mediaId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_contributingParticipantId;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(_ICLLPlaybackItemContainer *)self->_container hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v7 = 2654435761 * self->_isExplicit;
  }
  else {
    uint64_t v7 = 0;
  }
  unint64_t v8 = [(_ICLLMediaInfo *)self->_mediaInfo hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_sectionType;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  itemId = self->_itemId;
  if ((unint64_t)itemId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](itemId, "isEqual:")) {
      goto LABEL_29;
    }
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](mediaId, "isEqual:")) {
      goto LABEL_29;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 56);
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_contributingParticipantId != *((void *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_29;
  }
  container = self->_container;
  if ((unint64_t)container | *((void *)v4 + 2))
  {
    if (!-[_ICLLPlaybackItemContainer isEqual:](container, "isEqual:")) {
      goto LABEL_29;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 56);
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0) {
      goto LABEL_29;
    }
    if (self->_isExplicit)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_29;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_29;
  }
  mediaInfo = self->_mediaInfo;
  if (!((unint64_t)mediaInfo | *((void *)v4 + 5))) {
    goto LABEL_25;
  }
  if (!-[_ICLLMediaInfo isEqual:](mediaInfo, "isEqual:"))
  {
LABEL_29:
    BOOL v11 = 0;
    goto LABEL_30;
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 56);
LABEL_25:
  BOOL v11 = (v8 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_sectionType != *((_DWORD *)v4 + 12)) {
      goto LABEL_29;
    }
    BOOL v11 = 1;
  }
LABEL_30:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_itemId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_mediaId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_contributingParticipantId;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v10 = [(_ICLLPlaybackItemContainer *)self->_container copyWithZone:a3];
  BOOL v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(unsigned char *)(v5 + 52) = self->_isExplicit;
    *(unsigned char *)(v5 + 56) |= 4u;
  }
  id v12 = [(_ICLLMediaInfo *)self->_mediaInfo copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_sectionType;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  return (id)v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_itemId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_mediaId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_container)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_mediaInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlaybackItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  itemId = self->_itemId;
  if (itemId) {
    [v3 setObject:itemId forKey:@"itemId"];
  }
  mediaId = self->_mediaId;
  if (mediaId) {
    [v4 setObject:mediaId forKey:@"mediaId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = [NSNumber numberWithLongLong:self->_contributingParticipantId];
    [v4 setObject:v7 forKey:@"contributingParticipantId"];
  }
  container = self->_container;
  if (container)
  {
    uint64_t v9 = [(_ICLLPlaybackItemContainer *)container dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"container"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    id v10 = [NSNumber numberWithBool:self->_isExplicit];
    [v4 setObject:v10 forKey:@"isExplicit"];
  }
  mediaInfo = self->_mediaInfo;
  if (mediaInfo)
  {
    id v12 = [(_ICLLMediaInfo *)mediaInfo dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"mediaInfo"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v13 = [NSNumber numberWithInt:self->_sectionType];
    [v4 setObject:v13 forKey:@"sectionType"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlaybackItem;
  id v4 = [(_ICLLPlaybackItem *)&v8 description];
  id v5 = [(_ICLLPlaybackItem *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end