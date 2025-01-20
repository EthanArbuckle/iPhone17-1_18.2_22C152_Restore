@interface NTPBPersonalizationChangeGroup
+ (Class)deltasType;
- (BOOL)hasChangeNumber;
- (BOOL)hasInstanceIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)deltas;
- (NSString)instanceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deltasAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)changeNumber;
- (unint64_t)deltasCount;
- (unint64_t)hash;
- (void)addDeltas:(id)a3;
- (void)clearDeltas;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChangeNumber:(unint64_t)a3;
- (void)setDeltas:(id)a3;
- (void)setHasChangeNumber:(BOOL)a3;
- (void)setInstanceIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPersonalizationChangeGroup

- (void)dealloc
{
  [(NTPBPersonalizationChangeGroup *)self setDeltas:0];
  [(NTPBPersonalizationChangeGroup *)self setInstanceIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationChangeGroup;
  [(NTPBPersonalizationChangeGroup *)&v3 dealloc];
}

- (void)clearDeltas
{
}

- (void)addDeltas:(id)a3
{
  deltas = self->_deltas;
  if (!deltas)
  {
    deltas = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_deltas = deltas;
  }

  [(NSMutableArray *)deltas addObject:a3];
}

- (unint64_t)deltasCount
{
  return [(NSMutableArray *)self->_deltas count];
}

- (id)deltasAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_deltas objectAtIndex:a3];
}

+ (Class)deltasType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasInstanceIdentifier
{
  return self->_instanceIdentifier != 0;
}

- (void)setChangeNumber:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_changeNumber = a3;
}

- (void)setHasChangeNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChangeNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationChangeGroup;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPersonalizationChangeGroup description](&v3, sel_description), -[NTPBPersonalizationChangeGroup dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_deltas count])
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_deltas, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    deltas = self->_deltas;
    uint64_t v6 = [(NSMutableArray *)deltas countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(deltas);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)deltas countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"deltas"];
  }
  instanceIdentifier = self->_instanceIdentifier;
  if (instanceIdentifier) {
    [v3 setObject:instanceIdentifier forKey:@"instance_identifier"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_changeNumber), @"change_number");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationChangeGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  deltas = self->_deltas;
  uint64_t v5 = [(NSMutableArray *)deltas countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(deltas);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)deltas countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (self->_instanceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
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
  deltas = self->_deltas;
  uint64_t v7 = [(NSMutableArray *)deltas countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(deltas);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addDeltas:v11];
      }
      uint64_t v8 = [(NSMutableArray *)deltas countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  *(void *)(v5 + 24) = [(NSString *)self->_instanceIdentifier copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_changeNumber;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    deltas = self->_deltas;
    if (!((unint64_t)deltas | *((void *)a3 + 2)) || (int v5 = -[NSMutableArray isEqual:](deltas, "isEqual:")) != 0)
    {
      instanceIdentifier = self->_instanceIdentifier;
      if (!((unint64_t)instanceIdentifier | *((void *)a3 + 3))
        || (int v5 = -[NSString isEqual:](instanceIdentifier, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 1) == 0;
        if (*(unsigned char *)&self->_has) {
          LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 1) != 0 && self->_changeNumber == *((void *)a3 + 1);
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_deltas hash];
  NSUInteger v4 = [(NSString *)self->_instanceIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_changeNumber;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = (void *)*((void *)a3 + 2);
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
        [(NTPBPersonalizationChangeGroup *)self addDeltas:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if (*((void *)a3 + 3)) {
    -[NTPBPersonalizationChangeGroup setInstanceIdentifier:](self, "setInstanceIdentifier:");
  }
  if (*((unsigned char *)a3 + 32))
  {
    self->_changeNumber = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)deltas
{
  return self->_deltas;
}

- (void)setDeltas:(id)a3
{
}

- (NSString)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setInstanceIdentifier:(id)a3
{
}

- (unint64_t)changeNumber
{
  return self->_changeNumber;
}

@end