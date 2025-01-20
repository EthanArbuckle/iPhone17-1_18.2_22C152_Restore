@interface NTPBFeedItemInventory
+ (Class)feedItemsType;
- (BOOL)hasFeedItemVersion;
- (BOOL)hasInventoryVersion;
- (BOOL)hasLastRefreshed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)feedItems;
- (NTPBDate)lastRefreshed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedItemsAtIndex:(unint64_t)a3;
- (unint64_t)feedItemsCount;
- (unint64_t)hash;
- (unsigned)feedItemVersion;
- (unsigned)inventoryVersion;
- (void)addFeedItems:(id)a3;
- (void)clearFeedItems;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFeedItemVersion:(unsigned int)a3;
- (void)setFeedItems:(id)a3;
- (void)setHasFeedItemVersion:(BOOL)a3;
- (void)setHasInventoryVersion:(BOOL)a3;
- (void)setInventoryVersion:(unsigned int)a3;
- (void)setLastRefreshed:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBFeedItemInventory

- (void)dealloc
{
  [(NTPBFeedItemInventory *)self setLastRefreshed:0];
  [(NTPBFeedItemInventory *)self setFeedItems:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedItemInventory;
  [(NTPBFeedItemInventory *)&v3 dealloc];
}

- (void)setInventoryVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_inventoryVersion = a3;
}

- (void)setHasInventoryVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInventoryVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setFeedItemVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_feedItemVersion = a3;
}

- (void)setHasFeedItemVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeedItemVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLastRefreshed
{
  return self->_lastRefreshed != 0;
}

- (void)clearFeedItems
{
}

- (void)addFeedItems:(id)a3
{
  feedItems = self->_feedItems;
  if (!feedItems)
  {
    feedItems = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_feedItems = feedItems;
  }

  [(NSMutableArray *)feedItems addObject:a3];
}

- (unint64_t)feedItemsCount
{
  return [(NSMutableArray *)self->_feedItems count];
}

- (id)feedItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_feedItems objectAtIndex:a3];
}

+ (Class)feedItemsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedItemInventory;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBFeedItemInventory description](&v3, sel_description), -[NTPBFeedItemInventory dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_inventoryVersion), @"inventory_version");
    char has = (char)self->_has;
  }
  if (has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_feedItemVersion), @"feed_item_version");
  }
  lastRefreshed = self->_lastRefreshed;
  if (lastRefreshed) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastRefreshed, "dictionaryRepresentation"), @"last_refreshed");
  }
  if ([(NSMutableArray *)self->_feedItems count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_feedItems, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    feedItems = self->_feedItems;
    uint64_t v8 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(feedItems);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v9 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    [v3 setObject:v6 forKey:@"feed_items"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedItemInventoryReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_lastRefreshed) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  feedItems = self->_feedItems;
  uint64_t v6 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(feedItems);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_inventoryVersion;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_feedItemVersion;
    *(unsigned char *)(v5 + 40) |= 1u;
  }

  v6[4] = [(NTPBDate *)self->_lastRefreshed copyWithZone:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  feedItems = self->_feedItems;
  uint64_t v9 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(feedItems);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addFeedItems:v13];
      }
      uint64_t v10 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_inventoryVersion != *((_DWORD *)a3 + 6)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_feedItemVersion != *((_DWORD *)a3 + 2)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
      goto LABEL_16;
    }
    lastRefreshed = self->_lastRefreshed;
    if (!((unint64_t)lastRefreshed | *((void *)a3 + 4))
      || (int v5 = -[NTPBDate isEqual:](lastRefreshed, "isEqual:")) != 0)
    {
      feedItems = self->_feedItems;
      if ((unint64_t)feedItems | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](feedItems, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_inventoryVersion;
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
  uint64_t v4 = 2654435761 * self->_feedItemVersion;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(NTPBDate *)self->_lastRefreshed hash];
  return v5 ^ [(NSMutableArray *)self->_feedItems hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_inventoryVersion = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 40);
  }
  if (v5)
  {
    self->_feedItemVersion = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  lastRefreshed = self->_lastRefreshed;
  uint64_t v7 = *((void *)a3 + 4);
  if (lastRefreshed)
  {
    if (v7) {
      -[NTPBDate mergeFrom:](lastRefreshed, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[NTPBFeedItemInventory setLastRefreshed:](self, "setLastRefreshed:");
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = (void *)*((void *)a3 + 2);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NTPBFeedItemInventory *)self addFeedItems:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (unsigned)inventoryVersion
{
  return self->_inventoryVersion;
}

- (unsigned)feedItemVersion
{
  return self->_feedItemVersion;
}

- (NTPBDate)lastRefreshed
{
  return self->_lastRefreshed;
}

- (void)setLastRefreshed:(id)a3
{
}

- (NSMutableArray)feedItems
{
  return self->_feedItems;
}

- (void)setFeedItems:(id)a3
{
}

@end