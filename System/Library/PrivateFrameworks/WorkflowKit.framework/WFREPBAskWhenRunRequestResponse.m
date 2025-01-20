@interface WFREPBAskWhenRunRequestResponse
+ (Class)inputtedStatesType;
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)inputtedStates;
- (NSString)originatingRequestIdentifier;
- (WFREPBError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)inputtedStatesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)inputtedStatesCount;
- (void)addInputtedStates:(id)a3;
- (void)clearInputtedStates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setInputtedStates:(id)a3;
- (void)setOriginatingRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBAskWhenRunRequestResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_inputtedStates, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setError:(id)a3
{
}

- (WFREPBError)error
{
  return self->_error;
}

- (void)setInputtedStates:(id)a3
{
}

- (NSMutableArray)inputtedStates
{
  return self->_inputtedStates;
}

- (void)setOriginatingRequestIdentifier:(id)a3
{
}

- (NSString)originatingRequestIdentifier
{
  return self->_originatingRequestIdentifier;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[WFREPBAskWhenRunRequestResponse setOriginatingRequestIdentifier:](self, "setOriginatingRequestIdentifier:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        -[WFREPBAskWhenRunRequestResponse addInputtedStates:](self, "addInputtedStates:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  error = self->_error;
  uint64_t v11 = *((void *)v4 + 1);
  if (error)
  {
    if (v11) {
      -[WFREPBError mergeFrom:](error, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[WFREPBAskWhenRunRequestResponse setError:](self, "setError:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_originatingRequestIdentifier hash];
  uint64_t v4 = [(NSMutableArray *)self->_inputtedStates hash] ^ v3;
  return v4 ^ [(WFREPBError *)self->_error hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((originatingRequestIdentifier = self->_originatingRequestIdentifier,
         !((unint64_t)originatingRequestIdentifier | v4[3]))
     || -[NSString isEqual:](originatingRequestIdentifier, "isEqual:"))
    && ((inputtedStates = self->_inputtedStates, !((unint64_t)inputtedStates | v4[2]))
     || -[NSMutableArray isEqual:](inputtedStates, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1]) {
      char v8 = -[WFREPBError isEqual:](error, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_originatingRequestIdentifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v8 = self->_inputtedStates;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [v5 addInputtedStates:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v14 = [(WFREPBError *)self->_error copyWithZone:a3];
  long long v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setOriginatingRequestIdentifier:self->_originatingRequestIdentifier];
  if ([(WFREPBAskWhenRunRequestResponse *)self inputtedStatesCount])
  {
    [v8 clearInputtedStates];
    unint64_t v4 = [(WFREPBAskWhenRunRequestResponse *)self inputtedStatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(WFREPBAskWhenRunRequestResponse *)self inputtedStatesAtIndex:i];
        [v8 addInputtedStates:v7];
      }
    }
  }
  if (self->_error) {
    objc_msgSend(v8, "setError:");
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_originatingRequestIdentifier) {
    __assert_rtn("-[WFREPBAskWhenRunRequestResponse writeTo:]", "WFREPBAskWhenRunRequestResponse.m", 154, "nil != self->_originatingRequestIdentifier");
  }
  unint64_t v5 = v4;
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_inputtedStates;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBAskWhenRunRequestResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  originatingRequestIdentifier = self->_originatingRequestIdentifier;
  if (originatingRequestIdentifier) {
    [v3 setObject:originatingRequestIdentifier forKey:@"originatingRequestIdentifier"];
  }
  if ([(NSMutableArray *)self->_inputtedStates count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_inputtedStates, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = self->_inputtedStates;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"inputtedStates"];
  }
  error = self->_error;
  if (error)
  {
    long long v14 = [(WFREPBError *)error dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"error"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBAskWhenRunRequestResponse;
  id v4 = [(WFREPBAskWhenRunRequestResponse *)&v8 description];
  unint64_t v5 = [(WFREPBAskWhenRunRequestResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)inputtedStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_inputtedStates objectAtIndex:a3];
}

- (unint64_t)inputtedStatesCount
{
  return [(NSMutableArray *)self->_inputtedStates count];
}

- (void)addInputtedStates:(id)a3
{
  id v4 = a3;
  inputtedStates = self->_inputtedStates;
  id v8 = v4;
  if (!inputtedStates)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_inputtedStates;
    self->_inputtedStates = v6;

    id v4 = v8;
    inputtedStates = self->_inputtedStates;
  }
  [(NSMutableArray *)inputtedStates addObject:v4];
}

- (void)clearInputtedStates
{
}

+ (Class)inputtedStatesType
{
  return (Class)objc_opt_class();
}

@end