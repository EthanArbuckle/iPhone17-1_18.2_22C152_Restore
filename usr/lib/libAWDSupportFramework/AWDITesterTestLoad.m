@interface AWDITesterTestLoad
+ (Class)testNamesType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)testNames;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)testNamesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)testNamesCount;
- (unint64_t)timestamp;
- (void)addTestNames:(id)a3;
- (void)clearTestNames;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTestNames:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDITesterTestLoad

- (void)dealloc
{
  [(AWDITesterTestLoad *)self setTestNames:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestLoad;
  [(AWDITesterTestLoad *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearTestNames
{
}

- (void)addTestNames:(id)a3
{
  testNames = self->_testNames;
  if (!testNames)
  {
    testNames = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_testNames = testNames;
  }

  [(NSMutableArray *)testNames addObject:a3];
}

- (unint64_t)testNamesCount
{
  return [(NSMutableArray *)self->_testNames count];
}

- (id)testNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_testNames objectAtIndex:a3];
}

+ (Class)testNamesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDITesterTestLoad;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDITesterTestLoad description](&v3, sel_description), -[AWDITesterTestLoad dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  testNames = self->_testNames;
  if (testNames) {
    [v3 setObject:testNames forKey:@"testNames"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDITesterTestLoadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  testNames = self->_testNames;
  uint64_t v5 = [(NSMutableArray *)testNames countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(testNames);
        }
        PBDataWriterWriteStringField();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)testNames countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 24) |= 1u;
  }
  if ([(AWDITesterTestLoad *)self testNamesCount])
  {
    [a3 clearTestNames];
    unint64_t v5 = [(AWDITesterTestLoad *)self testNamesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addTestNames:-[AWDITesterTestLoad testNamesAtIndex:](self, "testNamesAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  testNames = self->_testNames;
  uint64_t v8 = [(NSMutableArray *)testNames countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(testNames);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addTestNames:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)testNames countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    testNames = self->_testNames;
    if ((unint64_t)testNames | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSMutableArray isEqual:](testNames, "isEqual:");
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
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_testNames hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 24))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v4 = (void *)*((void *)a3 + 2);
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
        [(AWDITesterTestLoad *)self addTestNames:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)testNames
{
  return self->_testNames;
}

- (void)setTestNames:(id)a3
{
}

@end