@interface ODCurareReportFillerDataSet
+ (Class)statsType;
- (BOOL)hasSampleEndDate;
- (BOOL)hasSampleStartDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)stats;
- (NSString)sampleEndDate;
- (NSString)sampleStartDate;
- (ODCurareReportFillerDataSetSize)size;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)statsCount;
- (void)addStats:(id)a3;
- (void)clearStats;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSampleEndDate:(id)a3;
- (void)setSampleStartDate:(id)a3;
- (void)setSize:(id)a3;
- (void)setStats:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODCurareReportFillerDataSet

- (void)clearStats
{
}

- (void)addStats:(id)a3
{
  id v4 = a3;
  stats = self->_stats;
  id v8 = v4;
  if (!stats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_stats;
    self->_stats = v6;

    id v4 = v8;
    stats = self->_stats;
  }
  [(NSMutableArray *)stats addObject:v4];
}

- (unint64_t)statsCount
{
  return [(NSMutableArray *)self->_stats count];
}

- (id)statsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_stats objectAtIndex:a3];
}

+ (Class)statsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSampleStartDate
{
  return self->_sampleStartDate != 0;
}

- (BOOL)hasSampleEndDate
{
  return self->_sampleEndDate != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerDataSet;
  id v4 = [(ODCurareReportFillerDataSet *)&v8 description];
  v5 = [(ODCurareReportFillerDataSet *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  size = self->_size;
  if (size)
  {
    v5 = [(ODCurareReportFillerDataSetSize *)size dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"size"];
  }
  if ([(NSMutableArray *)self->_stats count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_stats, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = self->_stats;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"stats"];
  }
  sampleStartDate = self->_sampleStartDate;
  if (sampleStartDate) {
    [v3 setObject:sampleStartDate forKey:@"sampleStartDate"];
  }
  sampleEndDate = self->_sampleEndDate;
  if (sampleEndDate) {
    [v3 setObject:sampleEndDate forKey:@"sampleEndDate"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerDataSetReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_size) {
    -[ODCurareReportFillerDataSet writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteSubmessage();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_stats;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_sampleStartDate) {
    PBDataWriterWriteStringField();
  }
  if (self->_sampleEndDate) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  [v9 setSize:self->_size];
  if ([(ODCurareReportFillerDataSet *)self statsCount])
  {
    [v9 clearStats];
    unint64_t v4 = [(ODCurareReportFillerDataSet *)self statsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ODCurareReportFillerDataSet *)self statsAtIndex:i];
        [v9 addStats:v7];
      }
    }
  }
  if (self->_sampleStartDate) {
    objc_msgSend(v9, "setSampleStartDate:");
  }
  uint64_t v8 = v9;
  if (self->_sampleEndDate)
  {
    objc_msgSend(v9, "setSampleEndDate:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ODCurareReportFillerDataSetSize *)self->_size copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_stats;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "copyWithZone:", a3, (void)v19);
        [v5 addStats:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_sampleStartDate copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  uint64_t v16 = [(NSString *)self->_sampleEndDate copyWithZone:a3];
  long long v17 = (void *)v5[1];
  v5[1] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((size = self->_size, !((unint64_t)size | v4[3]))
     || -[ODCurareReportFillerDataSetSize isEqual:](size, "isEqual:"))
    && ((stats = self->_stats, !((unint64_t)stats | v4[4]))
     || -[NSMutableArray isEqual:](stats, "isEqual:"))
    && ((sampleStartDate = self->_sampleStartDate, !((unint64_t)sampleStartDate | v4[2]))
     || -[NSString isEqual:](sampleStartDate, "isEqual:")))
  {
    sampleEndDate = self->_sampleEndDate;
    if ((unint64_t)sampleEndDate | v4[1]) {
      char v9 = -[NSString isEqual:](sampleEndDate, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODCurareReportFillerDataSetSize *)self->_size hash];
  uint64_t v4 = [(NSMutableArray *)self->_stats hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_sampleStartDate hash];
  return v4 ^ v5 ^ [(NSString *)self->_sampleEndDate hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  size = self->_size;
  uint64_t v6 = *((void *)v4 + 3);
  if (size)
  {
    if (v6) {
      -[ODCurareReportFillerDataSetSize mergeFrom:](size, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[ODCurareReportFillerDataSet setSize:](self, "setSize:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[ODCurareReportFillerDataSet addStats:](self, "addStats:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 2)) {
    -[ODCurareReportFillerDataSet setSampleStartDate:](self, "setSampleStartDate:");
  }
  if (*((void *)v4 + 1)) {
    -[ODCurareReportFillerDataSet setSampleEndDate:](self, "setSampleEndDate:");
  }
}

- (ODCurareReportFillerDataSetSize)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (NSMutableArray)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
}

- (NSString)sampleStartDate
{
  return self->_sampleStartDate;
}

- (void)setSampleStartDate:(id)a3
{
}

- (NSString)sampleEndDate
{
  return self->_sampleEndDate;
}

- (void)setSampleEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_sampleStartDate, 0);
  objc_storeStrong((id *)&self->_sampleEndDate, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerDataSet writeTo:]", "ODCurareReportFillerDataSet.m", 169, "self->_size != nil");
}

@end