@interface AWDWiFiTDM
+ (Class)sliceStatsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sliceStats;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sliceStatsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sliceStatsCount;
- (void)addSliceStats:(id)a3;
- (void)clearSliceStats;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setSliceStats:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiTDM

- (void)dealloc
{
  [(AWDWiFiTDM *)self setSliceStats:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiTDM;
  [(AWDWiFiTDM *)&v3 dealloc];
}

- (void)clearSliceStats
{
}

- (void)addSliceStats:(id)a3
{
  sliceStats = self->_sliceStats;
  if (!sliceStats)
  {
    sliceStats = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_sliceStats = sliceStats;
  }

  [(NSMutableArray *)sliceStats addObject:a3];
}

- (unint64_t)sliceStatsCount
{
  return [(NSMutableArray *)self->_sliceStats count];
}

- (id)sliceStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sliceStats objectAtIndex:a3];
}

+ (Class)sliceStatsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiTDM;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiTDM description](&v3, sel_description), -[AWDWiFiTDM dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_sliceStats count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_sliceStats, "count")];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    sliceStats = self->_sliceStats;
    uint64_t v6 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v11 objects:v15 count:16];
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
            objc_enumerationMutation(sliceStats);
          }
          [v4 addObject:[(*(id *)(*((void *)&v11 + 1) + 8 * v9++)) dictionaryRepresentation]];
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"sliceStats"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiTDMReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  sliceStats = self->_sliceStats;
  uint64_t v4 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(sliceStats);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v5 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)copyTo:(id)a3
{
  if ([(AWDWiFiTDM *)self sliceStatsCount])
  {
    [a3 clearSliceStats];
    unint64_t v5 = [(AWDWiFiTDM *)self sliceStatsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addSliceStats:-[AWDWiFiTDM sliceStatsAtIndex:](self, "sliceStatsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  sliceStats = self->_sliceStats;
  uint64_t v7 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(sliceStats);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addSliceStats:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)sliceStats countByEnumeratingWithState:&v13 objects:v17 count:16];
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
    sliceStats = self->_sliceStats;
    if ((unint64_t)sliceStats | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](sliceStats, "isEqual:");
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
  return [(NSMutableArray *)self->_sliceStats hash];
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
        [(AWDWiFiTDM *)self addSliceStats:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)sliceStats
{
  return self->_sliceStats;
}

- (void)setSliceStats:(id)a3
{
}

@end