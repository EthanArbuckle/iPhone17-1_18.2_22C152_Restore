@interface NTPBTagListRecord
+ (Class)tagIDsType;
- (BOOL)hasBase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)tagIDs;
- (NTPBRecordBase)base;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)tagIDsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)tagIDsCount;
- (void)addTagIDs:(id)a3;
- (void)clearTagIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBase:(id)a3;
- (void)setTagIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTagListRecord

- (void)dealloc
{
  [(NTPBTagListRecord *)self setBase:0];
  [(NTPBTagListRecord *)self setTagIDs:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBTagListRecord;
  [(NTPBTagListRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)clearTagIDs
{
}

- (void)addTagIDs:(id)a3
{
  tagIDs = self->_tagIDs;
  if (!tagIDs)
  {
    tagIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_tagIDs = tagIDs;
  }

  [(NSMutableArray *)tagIDs addObject:a3];
}

- (unint64_t)tagIDsCount
{
  return [(NSMutableArray *)self->_tagIDs count];
}

- (id)tagIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tagIDs objectAtIndex:a3];
}

+ (Class)tagIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBTagListRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBTagListRecord description](&v3, sel_description), -[NTPBTagListRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  tagIDs = self->_tagIDs;
  if (tagIDs) {
    [v3 setObject:tagIDs forKey:@"tag_IDs"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTagListRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  tagIDs = self->_tagIDs;
  uint64_t v5 = [(NSMutableArray *)tagIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(tagIDs);
        }
        PBDataWriterWriteStringField();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)tagIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  tagIDs = self->_tagIDs;
  uint64_t v7 = [(NSMutableArray *)tagIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(tagIDs);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addTagIDs:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)tagIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
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
    base = self->_base;
    if (!((unint64_t)base | *((void *)a3 + 1)) || (int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:")) != 0)
    {
      tagIDs = self->_tagIDs;
      if ((unint64_t)tagIDs | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](tagIDs, "isEqual:");
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
  unint64_t v3 = [(NTPBRecordBase *)self->_base hash];
  return [(NSMutableArray *)self->_tagIDs hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 1);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBTagListRecord setBase:](self, "setBase:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = (void *)*((void *)a3 + 2);
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
        [(NTPBTagListRecord *)self addTagIDs:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSMutableArray)tagIDs
{
  return self->_tagIDs;
}

- (void)setTagIDs:(id)a3
{
}

@end