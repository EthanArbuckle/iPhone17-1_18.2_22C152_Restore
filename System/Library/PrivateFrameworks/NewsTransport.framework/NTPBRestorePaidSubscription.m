@interface NTPBRestorePaidSubscription
+ (Class)itemsType;
+ (Class)restoredPaidSubscriptionChannelIdsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)items;
- (NSMutableArray)restoredPaidSubscriptionChannelIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)itemsAtIndex:(unint64_t)a3;
- (id)restoredPaidSubscriptionChannelIdsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)itemsCount;
- (unint64_t)restoredPaidSubscriptionChannelIdsCount;
- (void)addItems:(id)a3;
- (void)addRestoredPaidSubscriptionChannelIds:(id)a3;
- (void)clearItems;
- (void)clearRestoredPaidSubscriptionChannelIds;
- (void)mergeFrom:(id)a3;
- (void)setItems:(id)a3;
- (void)setRestoredPaidSubscriptionChannelIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBRestorePaidSubscription

- (void)clearRestoredPaidSubscriptionChannelIds
{
}

- (void)addRestoredPaidSubscriptionChannelIds:(id)a3
{
  id v4 = a3;
  restoredPaidSubscriptionChannelIds = self->_restoredPaidSubscriptionChannelIds;
  id v8 = v4;
  if (!restoredPaidSubscriptionChannelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_restoredPaidSubscriptionChannelIds;
    self->_restoredPaidSubscriptionChannelIds = v6;

    id v4 = v8;
    restoredPaidSubscriptionChannelIds = self->_restoredPaidSubscriptionChannelIds;
  }
  [(NSMutableArray *)restoredPaidSubscriptionChannelIds addObject:v4];
}

- (unint64_t)restoredPaidSubscriptionChannelIdsCount
{
  return [(NSMutableArray *)self->_restoredPaidSubscriptionChannelIds count];
}

- (id)restoredPaidSubscriptionChannelIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_restoredPaidSubscriptionChannelIds objectAtIndex:a3];
}

+ (Class)restoredPaidSubscriptionChannelIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearItems
{
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  items = self->_items;
  id v8 = v4;
  if (!items)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_items;
    self->_items = v6;

    id v4 = v8;
    items = self->_items;
  }
  [(NSMutableArray *)items addObject:v4];
}

- (unint64_t)itemsCount
{
  return [(NSMutableArray *)self->_items count];
}

- (id)itemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_items objectAtIndex:a3];
}

+ (Class)itemsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBRestorePaidSubscription;
  id v4 = [(NTPBRestorePaidSubscription *)&v8 description];
  v5 = [(NTPBRestorePaidSubscription *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  restoredPaidSubscriptionChannelIds = self->_restoredPaidSubscriptionChannelIds;
  if (restoredPaidSubscriptionChannelIds) {
    [v3 setObject:restoredPaidSubscriptionChannelIds forKey:@"restored_paid_subscription_channel_ids"];
  }
  if ([(NSMutableArray *)self->_items count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_items;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"items"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBRestorePaidSubscriptionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_restoredPaidSubscriptionChannelIds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_items;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_restoredPaidSubscriptionChannelIds;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v23 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addRestoredPaidSubscriptionChannelIds:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_items;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [v5 addItems:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((restoredPaidSubscriptionChannelIds = self->_restoredPaidSubscriptionChannelIds,
         !((unint64_t)restoredPaidSubscriptionChannelIds | v4[2]))
     || -[NSMutableArray isEqual:](restoredPaidSubscriptionChannelIds, "isEqual:")))
  {
    items = self->_items;
    if ((unint64_t)items | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](items, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_restoredPaidSubscriptionChannelIds hash];
  return [(NSMutableArray *)self->_items hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = (id *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v4[2];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBRestorePaidSubscription *)self addRestoredPaidSubscriptionChannelIds:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v4[1];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[NTPBRestorePaidSubscription addItems:](self, "addItems:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSMutableArray)restoredPaidSubscriptionChannelIds
{
  return self->_restoredPaidSubscriptionChannelIds;
}

- (void)setRestoredPaidSubscriptionChannelIds:(id)a3
{
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoredPaidSubscriptionChannelIds, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end