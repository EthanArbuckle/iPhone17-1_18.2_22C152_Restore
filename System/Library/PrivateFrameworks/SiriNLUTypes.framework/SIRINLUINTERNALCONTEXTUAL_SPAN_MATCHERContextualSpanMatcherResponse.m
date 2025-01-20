@interface SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse
+ (Class)contextualSpansType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contextualSpans;
- (id)contextualSpansAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)contextualSpansCount;
- (unint64_t)hash;
- (void)addContextualSpans:(id)a3;
- (void)clearContextualSpans;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContextualSpans:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse

- (void).cxx_destruct
{
}

- (void)setContextualSpans:(id)a3
{
}

- (NSMutableArray)contextualSpans
{
  return self->_contextualSpans;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
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
        -[SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse addContextualSpans:](self, "addContextualSpans:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_contextualSpans hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    contextualSpans = self->_contextualSpans;
    if ((unint64_t)contextualSpans | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](contextualSpans, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v6 = self->_contextualSpans;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addContextualSpans:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse *)self contextualSpansCount])
  {
    [v8 clearContextualSpans];
    unint64_t v4 = [(SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse *)self contextualSpansCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse *)self contextualSpansAtIndex:i];
        [v8 addContextualSpans:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self->_contextualSpans;
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
  return SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponseReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_contextualSpans count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_contextualSpans, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unint64_t v5 = self->_contextualSpans;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"contextual_spans"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse;
  id v4 = [(SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse *)&v8 description];
  unint64_t v5 = [(SIRINLUINTERNALCONTEXTUAL_SPAN_MATCHERContextualSpanMatcherResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)contextualSpansAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contextualSpans objectAtIndex:a3];
}

- (unint64_t)contextualSpansCount
{
  return [(NSMutableArray *)self->_contextualSpans count];
}

- (void)addContextualSpans:(id)a3
{
  id v4 = a3;
  contextualSpans = self->_contextualSpans;
  id v8 = v4;
  if (!contextualSpans)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_contextualSpans;
    self->_contextualSpans = v6;

    id v4 = v8;
    contextualSpans = self->_contextualSpans;
  }
  [(NSMutableArray *)contextualSpans addObject:v4];
}

- (void)clearContextualSpans
{
}

+ (Class)contextualSpansType
{
  return (Class)objc_opt_class();
}

@end