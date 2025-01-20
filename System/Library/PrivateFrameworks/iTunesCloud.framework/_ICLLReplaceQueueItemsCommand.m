@interface _ICLLReplaceQueueItemsCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)addItems:(uint64_t)a1;
- (unint64_t)hash;
- (void)clearOneofValuesForTrackGenerationSource;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLReplaceQueueItemsCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radio, 0);
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_preferredPlayItemId, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_autoPlay, 0);
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_trackGenerationSource;
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
  uint64_t v4 = 2654435761 * self->_revision;
LABEL_6:
  uint64_t v5 = v4 ^ v3 ^ [(NSMutableArray *)self->_items hash];
  NSUInteger v6 = [(NSString *)self->_preferredPlayItemId hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_queueContext hash];
  unint64_t v8 = [(_ICLLAutoPlaySource *)self->_autoPlay hash];
  return v7 ^ v8 ^ [(_ICLLRadioSource *)self->_radio hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_trackGenerationSource != *((_DWORD *)v4 + 13)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_22:
    char v10 = 0;
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_revision != *((_DWORD *)v4 + 12)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_22;
  }
  items = self->_items;
  if ((unint64_t)items | *((void *)v4 + 2) && !-[NSMutableArray isEqual:](items, "isEqual:")) {
    goto LABEL_22;
  }
  preferredPlayItemId = self->_preferredPlayItemId;
  if ((unint64_t)preferredPlayItemId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](preferredPlayItemId, "isEqual:")) {
      goto LABEL_22;
    }
  }
  queueContext = self->_queueContext;
  if ((unint64_t)queueContext | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](queueContext, "isEqual:")) {
      goto LABEL_22;
    }
  }
  autoPlay = self->_autoPlay;
  if ((unint64_t)autoPlay | *((void *)v4 + 1))
  {
    if (!-[_ICLLAutoPlaySource isEqual:](autoPlay, "isEqual:")) {
      goto LABEL_22;
    }
  }
  radio = self->_radio;
  if ((unint64_t)radio | *((void *)v4 + 5)) {
    char v10 = -[_ICLLRadioSource isEqual:](radio, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_23:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  NSUInteger v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_trackGenerationSource;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 48) = self->_revision;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v8 = self->_items;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        -[_ICLLReplaceQueueItemsCommand addItems:]((uint64_t)v6, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_preferredPlayItemId copyWithZone:a3];
  v15 = (void *)v6[3];
  v6[3] = v14;

  uint64_t v16 = [(NSString *)self->_queueContext copyWithZone:a3];
  v17 = (void *)v6[4];
  v6[4] = v16;

  id v18 = [(_ICLLAutoPlaySource *)self->_autoPlay copyWithZone:a3];
  v19 = (void *)v6[1];
  v6[1] = v18;

  id v20 = [(_ICLLRadioSource *)self->_radio copyWithZone:a3];
  v21 = (void *)v6[5];
  v6[5] = v20;

  return v6;
}

- (uint64_t)addItems:(uint64_t)a1
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
      NSUInteger v7 = *(void **)(a1 + 16);
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
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_items;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_preferredPlayItemId) {
    PBDataWriterWriteStringField();
  }
  if (self->_queueContext) {
    PBDataWriterWriteStringField();
  }
  if (self->_autoPlay) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_radio) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLReplaceQueueItemsCommandReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)clearOneofValuesForTrackGenerationSource
{
  if (a1)
  {
    *(unsigned char *)(a1 + 56) &= ~2u;
    *(_DWORD *)(a1 + 52) = 0;
    v2 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    id v3 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_revision];
    [v3 setObject:v4 forKey:@"revision"];
  }
  if ([(NSMutableArray *)self->_items count])
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = self->_items;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"items"];
  }
  preferredPlayItemId = self->_preferredPlayItemId;
  if (preferredPlayItemId) {
    [v3 setObject:preferredPlayItemId forKey:@"preferredPlayItemId"];
  }
  queueContext = self->_queueContext;
  if (queueContext) {
    [v3 setObject:queueContext forKey:@"queueContext"];
  }
  autoPlay = self->_autoPlay;
  if (autoPlay)
  {
    uint64_t v15 = [(_ICLLAutoPlaySource *)autoPlay dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"autoPlay"];
  }
  radio = self->_radio;
  if (radio)
  {
    v17 = [(_ICLLRadioSource *)radio dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"radio"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v18 = [NSNumber numberWithInt:self->_trackGenerationSource];
    [v3 setObject:v18 forKey:@"trackGenerationSource"];
  }

  return v3;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLReplaceQueueItemsCommand;
  id v4 = [(_ICLLReplaceQueueItemsCommand *)&v8 description];
  uint64_t v5 = [(_ICLLReplaceQueueItemsCommand *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end