@interface SIRINLUEXTERNALNLU_ROUTERRequestSummary
+ (Class)turnSummariesType;
- (BOOL)hasUserQuery;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)turnSummaries;
- (NSString)userQuery;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)turnSummariesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)turnSummariesCount;
- (void)addTurnSummaries:(id)a3;
- (void)clearTurnSummaries;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTurnSummaries:(id)a3;
- (void)setUserQuery:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERRequestSummary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userQuery, 0);
  objc_storeStrong((id *)&self->_turnSummaries, 0);
}

- (void)setTurnSummaries:(id)a3
{
}

- (NSMutableArray)turnSummaries
{
  return self->_turnSummaries;
}

- (void)setUserQuery:(id)a3
{
}

- (NSString)userQuery
{
  return self->_userQuery;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[SIRINLUEXTERNALNLU_ROUTERRequestSummary setUserQuery:](self, "setUserQuery:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[SIRINLUEXTERNALNLU_ROUTERRequestSummary addTurnSummaries:](self, "addTurnSummaries:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_userQuery hash];
  return [(NSMutableArray *)self->_turnSummaries hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((userQuery = self->_userQuery, !((unint64_t)userQuery | v4[2]))
     || -[NSString isEqual:](userQuery, "isEqual:")))
  {
    turnSummaries = self->_turnSummaries;
    if ((unint64_t)turnSummaries | v4[1]) {
      char v7 = -[NSMutableArray isEqual:](turnSummaries, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_userQuery copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_turnSummaries;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (void)v15);
        [v5 addTurnSummaries:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_userQuery) {
    objc_msgSend(v8, "setUserQuery:");
  }
  if ([(SIRINLUEXTERNALNLU_ROUTERRequestSummary *)self turnSummariesCount])
  {
    [v8 clearTurnSummaries];
    unint64_t v4 = [(SIRINLUEXTERNALNLU_ROUTERRequestSummary *)self turnSummariesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        char v7 = [(SIRINLUEXTERNALNLU_ROUTERRequestSummary *)self turnSummariesAtIndex:i];
        [v8 addTurnSummaries:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_userQuery) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_turnSummaries;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERRequestSummaryReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  userQuery = self->_userQuery;
  if (userQuery) {
    [v3 setObject:userQuery forKey:@"user_query"];
  }
  if ([(NSMutableArray *)self->_turnSummaries count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_turnSummaries, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = self->_turnSummaries;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"turn_summaries"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERRequestSummary;
  id v4 = [(SIRINLUEXTERNALNLU_ROUTERRequestSummary *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALNLU_ROUTERRequestSummary *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)turnSummariesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_turnSummaries objectAtIndex:a3];
}

- (unint64_t)turnSummariesCount
{
  return [(NSMutableArray *)self->_turnSummaries count];
}

- (void)addTurnSummaries:(id)a3
{
  id v4 = a3;
  turnSummaries = self->_turnSummaries;
  id v8 = v4;
  if (!turnSummaries)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_turnSummaries;
    self->_turnSummaries = v6;

    id v4 = v8;
    turnSummaries = self->_turnSummaries;
  }
  [(NSMutableArray *)turnSummaries addObject:v4];
}

- (void)clearTurnSummaries
{
}

- (BOOL)hasUserQuery
{
  return self->_userQuery != 0;
}

+ (Class)turnSummariesType
{
  return (Class)objc_opt_class();
}

@end