@interface NTPBLRUCache
+ (Class)entriesType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)entries;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)entriesAtIndex:(unint64_t)a3;
- (unint64_t)entriesCount;
- (unint64_t)hash;
- (void)addEntries:(id)a3;
- (void)clearEntries;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEntries:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBLRUCache

- (void)dealloc
{
  [(NTPBLRUCache *)self setEntries:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBLRUCache;
  [(NTPBLRUCache *)&v3 dealloc];
}

- (void)clearEntries
{
}

- (void)addEntries:(id)a3
{
  entries = self->_entries;
  if (!entries)
  {
    entries = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_entries = entries;
  }

  [(NSMutableArray *)entries addObject:a3];
}

- (unint64_t)entriesCount
{
  return [(NSMutableArray *)self->_entries count];
}

- (id)entriesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_entries objectAtIndex:a3];
}

+ (Class)entriesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBLRUCache;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBLRUCache description](&v3, sel_description), -[NTPBLRUCache dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_entries count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_entries, "count"));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    entries = self->_entries;
    uint64_t v6 = [(NSMutableArray *)entries countByEnumeratingWithState:&v11 objects:v15 count:16];
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
            objc_enumerationMutation(entries);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "dictionaryRepresentation"));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)entries countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"entries"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLRUCacheReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  entries = self->_entries;
  uint64_t v4 = [(NSMutableArray *)entries countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(entries);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v5 = [(NSMutableArray *)entries countByEnumeratingWithState:&v8 objects:v12 count:16];
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
  entries = self->_entries;
  uint64_t v7 = [(NSMutableArray *)entries countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(entries);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addEntries:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)entries countByEnumeratingWithState:&v13 objects:v17 count:16];
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
    entries = self->_entries;
    if ((unint64_t)entries | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](entries, "isEqual:");
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
  return [(NSMutableArray *)self->_entries hash];
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
        [(NTPBLRUCache *)self addEntries:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
}

@end