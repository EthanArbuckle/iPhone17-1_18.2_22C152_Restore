@interface _ICLLAddQueueItemsAction
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addItems:(uint64_t)a1;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLAddQueueItemsAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioSource, 0);
  objc_storeStrong((id *)&self->_queueQuery, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_revision;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_position;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSMutableArray *)self->_items hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_positionType;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v4 ^ v3 ^ v6 ^ v5;
  unint64_t v8 = [(_ICLLQueueQuery *)self->_queueQuery hash];
  return v7 ^ v8 ^ [(_ICLLRadioSource *)self->_radioSource hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 44);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_revision != *((_DWORD *)v4 + 10)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_position != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_24;
  }
  items = self->_items;
  if ((unint64_t)items | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](items, "isEqual:"))
    {
LABEL_24:
      char v10 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_positionType != *((_DWORD *)v4 + 5)) {
      goto LABEL_24;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_24;
  }
  queueQuery = self->_queueQuery;
  if ((unint64_t)queueQuery | *((void *)v4 + 3) && !-[_ICLLQueueQuery isEqual:](queueQuery, "isEqual:")) {
    goto LABEL_24;
  }
  radioSource = self->_radioSource;
  if ((unint64_t)radioSource | *((void *)v4 + 4)) {
    char v10 = -[_ICLLRadioSource isEqual:](radioSource, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_25:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_revision;
    *(unsigned char *)(v5 + 44) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_position;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v8 = self->_items;
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
        v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (void)v19);
        -[_ICLLAddQueueItemsAction addItems:](v6, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_positionType;
    *(unsigned char *)(v6 + 44) |= 2u;
  }
  id v14 = -[_ICLLQueueQuery copyWithZone:](self->_queueQuery, "copyWithZone:", a3, (void)v19);
  v15 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v14;

  id v16 = [(_ICLLRadioSource *)self->_radioSource copyWithZone:a3];
  v17 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v16;

  return (id)v6;
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
      uint64_t v7 = *(void **)(a1 + 8);
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
  if ((has & 4) != 0)
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

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_queueQuery) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_radioSource) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLAddQueueItemsActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
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
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = self->_items;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"items"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    long long v14 = [NSNumber numberWithInt:self->_positionType];
    [v3 setObject:v14 forKey:@"positionType"];
  }
  queueQuery = self->_queueQuery;
  if (queueQuery)
  {
    uint64_t v16 = [(_ICLLQueueQuery *)queueQuery dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"queueQuery"];
  }
  radioSource = self->_radioSource;
  if (radioSource)
  {
    v18 = [(_ICLLRadioSource *)radioSource dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"radioSource"];
  }

  return v3;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLAddQueueItemsAction;
  id v4 = [(_ICLLAddQueueItemsAction *)&v8 description];
  uint64_t v5 = [(_ICLLAddQueueItemsAction *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end