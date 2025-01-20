@interface ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent
+ (Class)contactEmbeddingType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contactEmbeddings;
- (NSString)sessinobd;
- (NSString)userId;
- (id)contactEmbeddingAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)contactEmbeddingsCount;
- (unint64_t)hash;
- (void)addContactEmbedding:(id)a3;
- (void)clearContactEmbeddings;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContactEmbeddings:(id)a3;
- (void)setSessinobd:(id)a3;
- (void)setUserId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent

- (void)clearContactEmbeddings
{
}

- (void)addContactEmbedding:(id)a3
{
  id v4 = a3;
  contactEmbeddings = self->_contactEmbeddings;
  id v8 = v4;
  if (!contactEmbeddings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_contactEmbeddings;
    self->_contactEmbeddings = v6;

    id v4 = v8;
    contactEmbeddings = self->_contactEmbeddings;
  }
  [(NSMutableArray *)contactEmbeddings addObject:v4];
}

- (unint64_t)contactEmbeddingsCount
{
  return [(NSMutableArray *)self->_contactEmbeddings count];
}

- (id)contactEmbeddingAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contactEmbeddings objectAtIndex:a3];
}

+ (Class)contactEmbeddingType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent;
  id v4 = [(ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent *)&v8 description];
  v5 = [(ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  sessinobd = self->_sessinobd;
  if (sessinobd) {
    [v3 setObject:sessinobd forKey:@"sessinobd"];
  }
  userId = self->_userId;
  if (userId) {
    [v4 setObject:userId forKey:@"userId"];
  }
  if ([(NSMutableArray *)self->_contactEmbeddings count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_contactEmbeddings, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_contactEmbeddings;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"contactEmbedding"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ContactEmbeddingAnalysisPETContactEmbeddingArrayEventReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_sessinobd) {
    -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent writeTo:]();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_userId) {
    -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent writeTo:]();
  }
  PBDataWriterWriteStringField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_contactEmbeddings;
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
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setSessinobd:self->_sessinobd];
  [v8 setUserId:self->_userId];
  if ([(ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent *)self contactEmbeddingsCount])
  {
    [v8 clearContactEmbeddings];
    unint64_t v4 = [(ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent *)self contactEmbeddingsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent *)self contactEmbeddingAtIndex:i];
        [v8 addContactEmbedding:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sessinobd copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_userId copyWithZone:a3];
  uint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_contactEmbeddings;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [v5 addContactEmbedding:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sessinobd = self->_sessinobd, !((unint64_t)sessinobd | v4[2]))
     || -[NSString isEqual:](sessinobd, "isEqual:"))
    && ((userId = self->_userId, !((unint64_t)userId | v4[3]))
     || -[NSString isEqual:](userId, "isEqual:")))
  {
    contactEmbeddings = self->_contactEmbeddings;
    if ((unint64_t)contactEmbeddings | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](contactEmbeddings, "isEqual:");
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sessinobd hash];
  NSUInteger v4 = [(NSString *)self->_userId hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_contactEmbeddings hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent setSessinobd:](self, "setSessinobd:");
  }
  if (*((void *)v4 + 3)) {
    -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent setUserId:](self, "setUserId:");
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
        -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent addContactEmbedding:](self, "addContactEmbedding:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)sessinobd
{
  return self->_sessinobd;
}

- (void)setSessinobd:(id)a3
{
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (NSMutableArray)contactEmbeddings
{
  return self->_contactEmbeddings;
}

- (void)setContactEmbeddings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_sessinobd, 0);

  objc_storeStrong((id *)&self->_contactEmbeddings, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent writeTo:]", "ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent.m", 137, "nil != self->_sessinobd");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent writeTo:]", "ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent.m", 142, "nil != self->_userId");
}

@end