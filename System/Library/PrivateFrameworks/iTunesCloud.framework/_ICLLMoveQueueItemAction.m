@interface _ICLLMoveQueueItemAction
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLMoveQueueItemAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueQuery, 0);

  objc_storeStrong((id *)&self->_itemId, 0);
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_revision;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_itemId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_position;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(_ICLLQueueQuery *)self->_queueQuery hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 36);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_revision != *((_DWORD *)v4 + 8)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_17;
  }
  itemId = self->_itemId;
  if ((unint64_t)itemId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](itemId, "isEqual:"))
    {
LABEL_17:
      char v9 = 0;
      goto LABEL_18;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 36);
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_position != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
  }
  else if (v6)
  {
    goto LABEL_17;
  }
  queueQuery = self->_queueQuery;
  if ((unint64_t)queueQuery | *((void *)v4 + 3)) {
    char v9 = -[_ICLLQueueQuery isEqual:](queueQuery, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_18:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_revision;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_itemId copyWithZone:a3];
  v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 16) = self->_position;
    *(unsigned char *)(v6 + 36) |= 1u;
  }
  id v9 = [(_ICLLQueueQuery *)self->_queueQuery copyWithZone:a3];
  v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  return (id)v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_itemId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_queueQuery)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLMoveQueueItemActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = [NSNumber numberWithInt:self->_revision];
    [v3 setObject:v4 forKey:@"revision"];
  }
  itemId = self->_itemId;
  if (itemId) {
    [v3 setObject:itemId forKey:@"itemId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithInt:self->_position];
    [v3 setObject:v6 forKey:@"position"];
  }
  queueQuery = self->_queueQuery;
  if (queueQuery)
  {
    v8 = [(_ICLLQueueQuery *)queueQuery dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"queueQuery"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLMoveQueueItemAction;
  id v4 = [(_ICLLMoveQueueItemAction *)&v8 description];
  id v5 = [(_ICLLMoveQueueItemAction *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end