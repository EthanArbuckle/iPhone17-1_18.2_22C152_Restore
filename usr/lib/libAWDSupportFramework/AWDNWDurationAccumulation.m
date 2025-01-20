@interface AWDNWDurationAccumulation
+ (Class)statesType;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)states;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)statesCount;
- (void)addStates:(id)a3;
- (void)clearStates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setName:(id)a3;
- (void)setStates:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNWDurationAccumulation

- (void)dealloc
{
  [(AWDNWDurationAccumulation *)self setName:0];
  [(AWDNWDurationAccumulation *)self setStates:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDNWDurationAccumulation;
  [(AWDNWDurationAccumulation *)&v3 dealloc];
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)clearStates
{
}

- (void)addStates:(id)a3
{
  states = self->_states;
  if (!states)
  {
    states = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_states = states;
  }

  [(NSMutableArray *)states addObject:a3];
}

- (unint64_t)statesCount
{
  return [(NSMutableArray *)self->_states count];
}

- (id)statesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_states objectAtIndex:a3];
}

+ (Class)statesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNWDurationAccumulation;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNWDurationAccumulation description](&v3, sel_description), -[AWDNWDurationAccumulation dictionaryRepresentation](self, "dictionaryRepresentation")];
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
  if ([(NSMutableArray *)self->_states count])
  {
    v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_states, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    states = self->_states;
    uint64_t v8 = [(NSMutableArray *)states countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(states);
          }
          [v6 addObject:[*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v9 = [(NSMutableArray *)states countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    [v4 setObject:v6 forKey:@"states"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWDurationAccumulationReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  states = self->_states;
  uint64_t v5 = [(NSMutableArray *)states countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(states);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)states countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_name) {
    [a3 setName:];
  }
  if ([(AWDNWDurationAccumulation *)self statesCount])
  {
    [a3 clearStates];
    unint64_t v5 = [(AWDNWDurationAccumulation *)self statesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addStates:-[AWDNWDurationAccumulation statesAtIndex:](self, "statesAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = (id *)[((id)objc_opt_class()) allocWithZone:a3];

  v5[1] = (id)[(NSString *)self->_name copyWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  states = self->_states;
  uint64_t v7 = [(NSMutableArray *)states countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(states);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addStates:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)states countByEnumeratingWithState:&v13 objects:v17 count:16];
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
    if (!((unint64_t)name | *((void *)a3 + 1)) || (int v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      states = self->_states;
      if ((unint64_t)states | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](states, "isEqual:");
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
  return [(NSMutableArray *)self->_states hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*((void *)a3 + 1)) {
    -[AWDNWDurationAccumulation setName:](self, "setName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = (void *)*((void *)a3 + 2);
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
        [(AWDNWDurationAccumulation *)self addStates:*(void *)(*((void *)&v10 + 1) + 8 * i)];
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

- (NSMutableArray)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
}

@end