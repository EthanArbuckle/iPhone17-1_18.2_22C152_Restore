@interface CLCKVO2MaxSessionOutput
+ (Class)summariesType;
- (BOOL)hasEstimate;
- (BOOL)hasSessionAttributes;
- (BOOL)hasSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CLCKVO2MaxEstimate)estimate;
- (CLCKVO2MaxSessionAttributes)sessionAttributes;
- (NSMutableArray)summaries;
- (NSString)sessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)summariesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)summariesCount;
- (void)addSummaries:(id)a3;
- (void)clearSummaries;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEstimate:(id)a3;
- (void)setSessionAttributes:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setSummaries:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCKVO2MaxSessionOutput

- (void)dealloc
{
  [(CLCKVO2MaxSessionOutput *)self setSessionId:0];
  [(CLCKVO2MaxSessionOutput *)self setSessionAttributes:0];
  [(CLCKVO2MaxSessionOutput *)self setEstimate:0];
  [(CLCKVO2MaxSessionOutput *)self setSummaries:0];
  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSessionOutput;
  [(CLCKVO2MaxSessionOutput *)&v3 dealloc];
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasSessionAttributes
{
  return self->_sessionAttributes != 0;
}

- (BOOL)hasEstimate
{
  return self->_estimate != 0;
}

- (void)clearSummaries
{
}

- (void)addSummaries:(id)a3
{
  summaries = self->_summaries;
  if (!summaries)
  {
    summaries = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_summaries = summaries;
  }

  [(NSMutableArray *)summaries addObject:a3];
}

- (unint64_t)summariesCount
{
  return (unint64_t)[(NSMutableArray *)self->_summaries count];
}

- (id)summariesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_summaries objectAtIndex:a3];
}

+ (Class)summariesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSessionOutput;
  return +[NSString stringWithFormat:@"%@ %@", [(CLCKVO2MaxSessionOutput *)&v3 description], [(CLCKVO2MaxSessionOutput *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  sessionAttributes = self->_sessionAttributes;
  if (sessionAttributes) {
    [v4 setObject:[[-[CLCKVO2MaxSessionAttributes dictionaryRepresentation](sessionAttributes, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"sessionAttributes"];
  }
  estimate = self->_estimate;
  if (estimate) {
    [v4 setObject:[[-[CLCKVO2MaxEstimate dictionaryRepresentation](estimate, "dictionaryRepresentation")] forKey:@"estimate"];
  }
  if ([(NSMutableArray *)self->_summaries count])
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_summaries, "count")];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    summaries = self->_summaries;
    id v10 = [(NSMutableArray *)summaries countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(summaries);
          }
          [v8 addObject:[*(id *)(*((void *)&v15 + 1) + 8 * i) dictionaryRepresentation]];
        }
        id v11 = [(NSMutableArray *)summaries countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
    [v4 setObject:v8 forKey:@"summaries"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100EBCEFC((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_sessionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sessionAttributes) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_estimate) {
    PBDataWriterWriteSubmessage();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  summaries = self->_summaries;
  v5 = (char *)[(NSMutableArray *)summaries countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(summaries);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      v6 = (char *)[(NSMutableArray *)summaries countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_sessionId) {
    [a3 setSessionId:];
  }
  if (self->_sessionAttributes) {
    [a3 setSessionAttributes:];
  }
  if (self->_estimate) {
    [a3 setEstimate:];
  }
  if ([(CLCKVO2MaxSessionOutput *)self summariesCount])
  {
    [a3 clearSummaries];
    unint64_t v5 = [(CLCKVO2MaxSessionOutput *)self summariesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addSummaries:-[CLCKVO2MaxSessionOutput summariesAtIndex:](self, "summariesAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[3] = [(NSString *)self->_sessionId copyWithZone:a3];
  v5[2] = [(CLCKVO2MaxSessionAttributes *)self->_sessionAttributes copyWithZone:a3];

  v5[1] = [(CLCKVO2MaxEstimate *)self->_estimate copyWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  summaries = self->_summaries;
  id v7 = [(NSMutableArray *)summaries countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(summaries);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addSummaries:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)summaries countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    sessionId = self->_sessionId;
    if (!((unint64_t)sessionId | *((void *)a3 + 3))
      || (unsigned int v5 = -[NSString isEqual:](sessionId, "isEqual:")) != 0)
    {
      sessionAttributes = self->_sessionAttributes;
      if (!((unint64_t)sessionAttributes | *((void *)a3 + 2))
        || (unsigned int v5 = -[CLCKVO2MaxSessionAttributes isEqual:](sessionAttributes, "isEqual:")) != 0)
      {
        estimate = self->_estimate;
        if (!((unint64_t)estimate | *((void *)a3 + 1))
          || (unsigned int v5 = -[CLCKVO2MaxEstimate isEqual:](estimate, "isEqual:")) != 0)
        {
          summaries = self->_summaries;
          if ((unint64_t)summaries | *((void *)a3 + 4))
          {
            LOBYTE(v5) = -[NSMutableArray isEqual:](summaries, "isEqual:");
          }
          else
          {
            LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessionId hash];
  unint64_t v4 = [(CLCKVO2MaxSessionAttributes *)self->_sessionAttributes hash] ^ v3;
  unint64_t v5 = [(CLCKVO2MaxEstimate *)self->_estimate hash];
  return v4 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_summaries hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[CLCKVO2MaxSessionOutput setSessionId:](self, "setSessionId:");
  }
  sessionAttributes = self->_sessionAttributes;
  uint64_t v6 = *((void *)a3 + 2);
  if (sessionAttributes)
  {
    if (v6) {
      -[CLCKVO2MaxSessionAttributes mergeFrom:](sessionAttributes, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[CLCKVO2MaxSessionOutput setSessionAttributes:](self, "setSessionAttributes:");
  }
  estimate = self->_estimate;
  uint64_t v8 = *((void *)a3 + 1);
  if (estimate)
  {
    if (v8) {
      -[CLCKVO2MaxEstimate mergeFrom:](estimate, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[CLCKVO2MaxSessionOutput setEstimate:](self, "setEstimate:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = (void *)*((void *)a3 + 4);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(CLCKVO2MaxSessionOutput *)self addSummaries:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (CLCKVO2MaxSessionAttributes)sessionAttributes
{
  return self->_sessionAttributes;
}

- (void)setSessionAttributes:(id)a3
{
}

- (CLCKVO2MaxEstimate)estimate
{
  return self->_estimate;
}

- (void)setEstimate:(id)a3
{
}

- (NSMutableArray)summaries
{
  return self->_summaries;
}

- (void)setSummaries:(id)a3
{
}

@end