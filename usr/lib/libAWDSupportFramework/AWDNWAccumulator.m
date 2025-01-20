@interface AWDNWAccumulator
+ (Class)durationsType;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)durations;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)durationsAtIndex:(unint64_t)a3;
- (unint64_t)durationsCount;
- (unint64_t)hash;
- (void)addDurations:(id)a3;
- (void)clearDurations;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDurations:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNWAccumulator

- (void)dealloc
{
  [(AWDNWAccumulator *)self setName:0];
  [(AWDNWAccumulator *)self setDurations:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDNWAccumulator;
  [(AWDNWAccumulator *)&v3 dealloc];
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)clearDurations
{
}

- (void)addDurations:(id)a3
{
  durations = self->_durations;
  if (!durations)
  {
    durations = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_durations = durations;
  }

  [(NSMutableArray *)durations addObject:a3];
}

- (unint64_t)durationsCount
{
  return [(NSMutableArray *)self->_durations count];
}

- (id)durationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_durations objectAtIndex:a3];
}

+ (Class)durationsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNWAccumulator;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNWAccumulator description](&v3, sel_description), -[AWDNWAccumulator dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if ([(NSMutableArray *)self->_durations count])
  {
    v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_durations, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    durations = self->_durations;
    uint64_t v8 = [(NSMutableArray *)durations countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(durations);
          }
          [v6 addObject:[(*(id *)(*((void *)&v13 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v9 = [(NSMutableArray *)durations countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    [v4 setObject:v6 forKey:@"durations"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWAccumulatorReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  durations = self->_durations;
  uint64_t v5 = [(NSMutableArray *)durations countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(durations);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)durations countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_name) {
    [a3 setName:];
  }
  if ([(AWDNWAccumulator *)self durationsCount])
  {
    [a3 clearDurations];
    unint64_t v5 = [(AWDNWAccumulator *)self durationsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addDurations:-[AWDNWAccumulator durationsAtIndex:](self, "durationsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = (id *)[objc_opt_class() allocWithZone:a3];

  v5[2] = (id)[(NSString *)self->_name copyWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  durations = self->_durations;
  uint64_t v7 = [(NSMutableArray *)durations countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(durations);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addDurations:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)durations countByEnumeratingWithState:&v13 objects:v17 count:16];
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
    name = self->_name;
    if (!((unint64_t)name | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      durations = self->_durations;
      if ((unint64_t)durations | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](durations, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSMutableArray *)self->_durations hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*((void *)a3 + 2)) {
    -[AWDNWAccumulator setName:](self, "setName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = (void *)*((void *)a3 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDNWAccumulator *)self addDurations:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableArray)durations
{
  return self->_durations;
}

- (void)setDurations:(id)a3
{
}

@end