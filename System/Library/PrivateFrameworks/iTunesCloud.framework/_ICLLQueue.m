@interface _ICLLQueue
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addItems:(uint64_t)a1;
- (unint64_t)hash;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueId, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_currentRadioStationId, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_queueId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v4 = 2654435761 * self->_revision;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_items hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_explicitSetting;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = PBRepeatedInt32Hash();
  NSUInteger v8 = [(NSString *)self->_currentRadioStationId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_demarkationPos;
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
    goto LABEL_24;
  }
  queueId = self->_queueId;
  if ((unint64_t)queueId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](queueId, "isEqual:")) {
      goto LABEL_24;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 68);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_revision != *((_DWORD *)v4 + 16)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_24;
  }
  items = self->_items;
  if ((unint64_t)items | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](items, "isEqual:"))
    {
LABEL_24:
      BOOL v10 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 68);
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_explicitSetting != *((_DWORD *)v4 + 11)) {
      goto LABEL_24;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_24;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_24;
  }
  currentRadioStationId = self->_currentRadioStationId;
  if ((unint64_t)currentRadioStationId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](currentRadioStationId, "isEqual:")) {
      goto LABEL_24;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 68) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_demarkationPos != *((_DWORD *)v4 + 10)) {
      goto LABEL_24;
    }
    BOOL v10 = 1;
  }
LABEL_25:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_queueId copyWithZone:a3];
  char v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_revision;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  NSUInteger v8 = self->_items;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        -[_ICLLQueue addItems:](v5, v13);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_explicitSetting;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  PBRepeatedInt32Copy();
  uint64_t v14 = [(NSString *)self->_currentRadioStationId copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_demarkationPos;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  return (id)v5;
}

- (uint64_t)addItems:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 48);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      char v7 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v6;

      uint64_t v5 = *(void **)(a1 + 48);
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
  if (self->_queueId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_items;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_storefronts.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_storefronts.count);
  }
  if (self->_currentRadioStationId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLQueueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  queueId = self->_queueId;
  if (queueId) {
    [v3 setObject:queueId forKey:@"queueId"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = [NSNumber numberWithInt:self->_revision];
    [v4 setObject:v6 forKey:@"revision"];
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

    [v4 setObject:v7 forKey:@"items"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    long long v14 = [NSNumber numberWithInt:self->_explicitSetting];
    [v4 setObject:v14 forKey:@"explicitSetting"];
  }
  v15 = PBRepeatedInt32NSArray();
  [v4 setObject:v15 forKey:@"storefronts"];

  currentRadioStationId = self->_currentRadioStationId;
  if (currentRadioStationId) {
    [v4 setObject:currentRadioStationId forKey:@"currentRadioStationId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    long long v17 = [NSNumber numberWithInt:self->_demarkationPos];
    [v4 setObject:v17 forKey:@"demarkationPos"];
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLQueue;
  id v4 = [(_ICLLQueue *)&v8 description];
  uint64_t v5 = [(_ICLLQueue *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_ICLLQueue;
  [(_ICLLQueue *)&v3 dealloc];
}

@end