@interface CLCKVO2MaxSessionInput
+ (Class)inputsType;
- (BOOL)hasSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)inputs;
- (NSString)sessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inputsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)inputsCount;
- (void)addInputs:(id)a3;
- (void)clearInputs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setInputs:(id)a3;
- (void)setSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLCKVO2MaxSessionInput

- (void)dealloc
{
  [(CLCKVO2MaxSessionInput *)self setSessionId:0];
  [(CLCKVO2MaxSessionInput *)self setInputs:0];
  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSessionInput;
  [(CLCKVO2MaxSessionInput *)&v3 dealloc];
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (void)clearInputs
{
}

- (void)addInputs:(id)a3
{
  inputs = self->_inputs;
  if (!inputs)
  {
    inputs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_inputs = inputs;
  }

  [(NSMutableArray *)inputs addObject:a3];
}

- (unint64_t)inputsCount
{
  return (unint64_t)[(NSMutableArray *)self->_inputs count];
}

- (id)inputsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_inputs objectAtIndex:a3];
}

+ (Class)inputsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CLCKVO2MaxSessionInput;
  return +[NSString stringWithFormat:@"%@ %@", [(CLCKVO2MaxSessionInput *)&v3 description], [(CLCKVO2MaxSessionInput *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"sessionId"];
  }
  if ([(NSMutableArray *)self->_inputs count])
  {
    id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_inputs, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    inputs = self->_inputs;
    id v8 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(inputs);
          }
          [v6 addObject:[*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryRepresentation]];
        }
        id v9 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    [v4 setObject:v6 forKey:@"inputs"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100B57684((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_sessionId) {
    PBDataWriterWriteStringField();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  inputs = self->_inputs;
  v5 = (char *)[(NSMutableArray *)inputs countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(inputs);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      id v6 = (char *)[(NSMutableArray *)inputs countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_sessionId) {
    [a3 setSessionId:];
  }
  if ([(CLCKVO2MaxSessionInput *)self inputsCount])
  {
    [a3 clearInputs];
    unint64_t v5 = [(CLCKVO2MaxSessionInput *)self inputsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addInputs:-[CLCKVO2MaxSessionInput inputsAtIndex:](self, "inputsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [(id)[objc_opt_class() allocWithZone:a3] init];

  v5[2] = [(NSString *)self->_sessionId copyWithZone:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  inputs = self->_inputs;
  id v7 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(inputs);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addInputs:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)inputs countByEnumeratingWithState:&v13 objects:v17 count:16];
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
    if (!((unint64_t)sessionId | *((void *)a3 + 2))
      || (unsigned int v5 = -[NSString isEqual:](sessionId, "isEqual:")) != 0)
    {
      inputs = self->_inputs;
      if ((unint64_t)inputs | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](inputs, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_sessionId hash];
  return (unint64_t)[(NSMutableArray *)self->_inputs hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[CLCKVO2MaxSessionInput setSessionId:](self, "setSessionId:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unsigned int v5 = (void *)*((void *)a3 + 1);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CLCKVO2MaxSessionInput *)self addInputs:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSMutableArray)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

@end