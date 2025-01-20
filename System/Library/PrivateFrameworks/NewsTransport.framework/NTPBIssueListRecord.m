@interface NTPBIssueListRecord
+ (Class)issueIDsType;
- (BOOL)hasBase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)issueIDs;
- (NTPBRecordBase)base;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)issueIDsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)issueIDsCount;
- (void)addIssueIDs:(id)a3;
- (void)clearIssueIDs;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBase:(id)a3;
- (void)setIssueIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBIssueListRecord

- (void)dealloc
{
  [(NTPBIssueListRecord *)self setBase:0];
  [(NTPBIssueListRecord *)self setIssueIDs:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueListRecord;
  [(NTPBIssueListRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (void)clearIssueIDs
{
}

- (void)addIssueIDs:(id)a3
{
  issueIDs = self->_issueIDs;
  if (!issueIDs)
  {
    issueIDs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_issueIDs = issueIDs;
  }

  [(NSMutableArray *)issueIDs addObject:a3];
}

- (unint64_t)issueIDsCount
{
  return [(NSMutableArray *)self->_issueIDs count];
}

- (id)issueIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_issueIDs objectAtIndex:a3];
}

+ (Class)issueIDsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBIssueListRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBIssueListRecord description](&v3, sel_description), -[NTPBIssueListRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  issueIDs = self->_issueIDs;
  if (issueIDs) {
    [v3 setObject:issueIDs forKey:@"issue_IDs"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueListRecordReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  issueIDs = self->_issueIDs;
  uint64_t v5 = [(NSMutableArray *)issueIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_enumerationMutation(issueIDs);
        }
        PBDataWriterWriteStringField();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)issueIDs countByEnumeratingWithState:&v9 objects:v13 count:16];
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
  issueIDs = self->_issueIDs;
  uint64_t v7 = [(NSMutableArray *)issueIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(issueIDs);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addIssueIDs:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)issueIDs countByEnumeratingWithState:&v13 objects:v17 count:16];
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
      issueIDs = self->_issueIDs;
      if ((unint64_t)issueIDs | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](issueIDs, "isEqual:");
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
  return [(NSMutableArray *)self->_issueIDs hash] ^ v3;
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
    -[NTPBIssueListRecord setBase:](self, "setBase:");
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
        [(NTPBIssueListRecord *)self addIssueIDs:*(void *)(*((void *)&v12 + 1) + 8 * i)];
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

- (NSMutableArray)issueIDs
{
  return self->_issueIDs;
}

- (void)setIssueIDs:(id)a3
{
}

@end