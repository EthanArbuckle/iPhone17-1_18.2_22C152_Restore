@interface _ICLLRemoveQueueItemCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addItemIdsToRemove:(uint64_t)a1;
- (unint64_t)hash;
- (void)setItemId:(uint64_t)a1;
- (void)setQueueContext:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLRemoveQueueItemCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_itemIdsToRemoves, 0);

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
    uint64_t v5 = 2654435761 * self->_removeType;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_itemIdsToRemoves hash];
  return v6 ^ [(NSString *)self->_queueContext hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 40);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_revision != *((_DWORD *)v4 + 9)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_19;
  }
  itemId = self->_itemId;
  if ((unint64_t)itemId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](itemId, "isEqual:"))
    {
LABEL_19:
      char v10 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 40);
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_removeType != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if (v6)
  {
    goto LABEL_19;
  }
  itemIdsToRemoves = self->_itemIdsToRemoves;
  if ((unint64_t)itemIdsToRemoves | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](itemIdsToRemoves, "isEqual:"))
  {
    goto LABEL_19;
  }
  queueContext = self->_queueContext;
  if ((unint64_t)queueContext | *((void *)v4 + 3)) {
    char v10 = -[NSString isEqual:](queueContext, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_20:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_revision;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_itemId copyWithZone:a3];
  v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 32) = self->_removeType;
    *(unsigned char *)(v6 + 40) |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v9 = self->_itemIdsToRemoves;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13), "copyWithZone:", a3, (void)v18);
        -[_ICLLRemoveQueueItemCommand addItemIdsToRemove:](v6, v14);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  uint64_t v15 = [(NSString *)self->_queueContext copyWithZone:a3];
  v16 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v15;

  return (id)v6;
}

- (uint64_t)addItemIdsToRemove:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 16);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v6;

      uint64_t v5 = *(void **)(a1 + 16);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_itemId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_itemIdsToRemoves;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_queueContext) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLRemoveQueueItemCommandReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
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
    uint64_t v6 = [NSNumber numberWithInt:self->_removeType];
    [v3 setObject:v6 forKey:@"removeType"];
  }
  itemIdsToRemoves = self->_itemIdsToRemoves;
  if (itemIdsToRemoves) {
    [v3 setObject:itemIdsToRemoves forKey:@"itemIdsToRemove"];
  }
  queueContext = self->_queueContext;
  if (queueContext) {
    [v3 setObject:queueContext forKey:@"queueContext"];
  }

  return v3;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLRemoveQueueItemCommand;
  id v4 = [(_ICLLRemoveQueueItemCommand *)&v8 description];
  uint64_t v5 = [(_ICLLRemoveQueueItemCommand *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setItemId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (void)setQueueContext:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

@end