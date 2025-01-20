@interface _ICLLPlayNowQueueItemsCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addItems:(uint64_t)a1;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLPlayNowQueueItemsCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioSource, 0);
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_preferredPlayItemId, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_revision;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_position;
LABEL_6:
  uint64_t v5 = v4 ^ v3 ^ [(NSMutableArray *)self->_items hash];
  NSUInteger v6 = [(NSString *)self->_preferredPlayItemId hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_queueContext hash];
  return v7 ^ [(_ICLLRadioSource *)self->_radioSource hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_revision != *((_DWORD *)v4 + 12)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
LABEL_20:
    char v9 = 0;
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_position != *((_DWORD *)v4 + 4)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_20;
  }
  items = self->_items;
  if ((unint64_t)items | *((void *)v4 + 1) && !-[NSMutableArray isEqual:](items, "isEqual:")) {
    goto LABEL_20;
  }
  preferredPlayItemId = self->_preferredPlayItemId;
  if ((unint64_t)preferredPlayItemId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](preferredPlayItemId, "isEqual:")) {
      goto LABEL_20;
    }
  }
  queueContext = self->_queueContext;
  if ((unint64_t)queueContext | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](queueContext, "isEqual:")) {
      goto LABEL_20;
    }
  }
  radioSource = self->_radioSource;
  if ((unint64_t)radioSource | *((void *)v4 + 5)) {
    char v9 = -[_ICLLRadioSource isEqual:](radioSource, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_21:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  NSUInteger v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_revision;
    *(unsigned char *)(v5 + 52) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_position;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = self->_items;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
        -[_ICLLPlayNowQueueItemsCommand addItems:]((uint64_t)v6, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_preferredPlayItemId copyWithZone:a3];
  v15 = (void *)v6[3];
  v6[3] = v14;

  uint64_t v16 = [(NSString *)self->_queueContext copyWithZone:a3];
  v17 = (void *)v6[4];
  v6[4] = v16;

  id v18 = [(_ICLLRadioSource *)self->_radioSource copyWithZone:a3];
  v19 = (void *)v6[5];
  v6[5] = v18;

  return v6;
}

- (uint64_t)addItems:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 8);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      NSUInteger v7 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v6;

      uint64_t v5 = *(void **)(a1 + 8);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_items;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_preferredPlayItemId) {
    PBDataWriterWriteStringField();
  }
  if (self->_queueContext) {
    PBDataWriterWriteStringField();
  }
  if (self->_radioSource) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlayNowQueueItemsCommandReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v5 = [NSNumber numberWithInt:self->_revision];
    [v3 setObject:v5 forKey:@"revision"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v6 = [NSNumber numberWithInt:self->_position];
    [v3 setObject:v6 forKey:@"position"];
  }
  if ([(NSMutableArray *)self->_items count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = self->_items;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"items"];
  }
  preferredPlayItemId = self->_preferredPlayItemId;
  if (preferredPlayItemId) {
    [v3 setObject:preferredPlayItemId forKey:@"preferredPlayItemId"];
  }
  queueContext = self->_queueContext;
  if (queueContext) {
    [v3 setObject:queueContext forKey:@"queueContext"];
  }
  radioSource = self->_radioSource;
  if (radioSource)
  {
    v17 = [(_ICLLRadioSource *)radioSource dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"radioSource"];
  }

  return v3;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlayNowQueueItemsCommand;
  id v4 = [(_ICLLPlayNowQueueItemsCommand *)&v8 description];
  uint64_t v5 = [(_ICLLPlayNowQueueItemsCommand *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end