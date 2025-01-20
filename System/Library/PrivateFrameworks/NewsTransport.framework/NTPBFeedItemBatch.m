@interface NTPBFeedItemBatch
+ (Class)feedItemsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)feedItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedItemsAtIndex:(unint64_t)a3;
- (unint64_t)feedItemsCount;
- (unint64_t)hash;
- (void)addFeedItems:(id)a3;
- (void)clearFeedItems;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFeedItems:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBFeedItemBatch

- (void)dealloc
{
  [(NTPBFeedItemBatch *)self setFeedItems:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBFeedItemBatch;
  [(NTPBFeedItemBatch *)&v3 dealloc];
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
  v3.super_class = (Class)NTPBFeedItemBatch;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBFeedItemBatch description](&v3, sel_description), -[NTPBFeedItemBatch dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_feedItems count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_feedItems, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    feedItems = self->_feedItems;
    uint64_t v6 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v11 objects:v15 count:16];
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
            objc_enumerationMutation(feedItems);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "dictionaryRepresentation"));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"feed_items"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedItemBatchReadFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  feedItems = self->_feedItems;
  uint64_t v4 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(feedItems);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v5 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  feedItems = self->_feedItems;
  uint64_t v7 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(feedItems);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addFeedItems:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)feedItems countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    feedItems = self->_feedItems;
    if ((unint64_t)feedItems | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](feedItems, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_feedItems hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = (void *)*((void *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NTPBFeedItemBatch *)self addFeedItems:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)feedItems
{
  return self->_feedItems;
}

- (void)setFeedItems:(id)a3
{
}

@end