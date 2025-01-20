@interface MXChoiceAlignment
+ (Class)preItnTokenToPostItnCharAlignmentsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)preItnTokenToPostItnCharAlignments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)preItnTokenToPostItnCharAlignmentsAtIndex:(unint64_t)a3;
- (int)postItnChoiceIndices;
- (int)postItnChoiceIndicesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)postItnChoiceIndicesCount;
- (unint64_t)preItnTokenToPostItnCharAlignmentsCount;
- (void)addPostItnChoiceIndices:(int)a3;
- (void)addPreItnTokenToPostItnCharAlignments:(id)a3;
- (void)clearPostItnChoiceIndices;
- (void)clearPreItnTokenToPostItnCharAlignments;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setPostItnChoiceIndices:(int *)a3 count:(unint64_t)a4;
- (void)setPreItnTokenToPostItnCharAlignments:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXChoiceAlignment

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)MXChoiceAlignment;
  [(MXChoiceAlignment *)&v3 dealloc];
}

- (unint64_t)postItnChoiceIndicesCount
{
  return self->_postItnChoiceIndices.count;
}

- (int)postItnChoiceIndices
{
  return self->_postItnChoiceIndices.list;
}

- (void)clearPostItnChoiceIndices
{
}

- (void)addPostItnChoiceIndices:(int)a3
{
}

- (int)postItnChoiceIndicesAtIndex:(unint64_t)a3
{
  p_postItnChoiceIndices = &self->_postItnChoiceIndices;
  unint64_t count = self->_postItnChoiceIndices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_postItnChoiceIndices->list[a3];
}

- (void)setPostItnChoiceIndices:(int *)a3 count:(unint64_t)a4
{
}

- (void)clearPreItnTokenToPostItnCharAlignments
{
}

- (void)addPreItnTokenToPostItnCharAlignments:(id)a3
{
  id v4 = a3;
  preItnTokenToPostItnCharAlignments = self->_preItnTokenToPostItnCharAlignments;
  id v8 = v4;
  if (!preItnTokenToPostItnCharAlignments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_preItnTokenToPostItnCharAlignments;
    self->_preItnTokenToPostItnCharAlignments = v6;

    id v4 = v8;
    preItnTokenToPostItnCharAlignments = self->_preItnTokenToPostItnCharAlignments;
  }
  [(NSMutableArray *)preItnTokenToPostItnCharAlignments addObject:v4];
}

- (unint64_t)preItnTokenToPostItnCharAlignmentsCount
{
  return [(NSMutableArray *)self->_preItnTokenToPostItnCharAlignments count];
}

- (id)preItnTokenToPostItnCharAlignmentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_preItnTokenToPostItnCharAlignments objectAtIndex:a3];
}

+ (Class)preItnTokenToPostItnCharAlignmentsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXChoiceAlignment;
  id v4 = [(MXChoiceAlignment *)&v8 description];
  v5 = [(MXChoiceAlignment *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = PBRepeatedInt32NSArray();
  [v3 setObject:v4 forKey:@"post_itn_choice_indices"];

  if ([(NSMutableArray *)self->_preItnTokenToPostItnCharAlignments count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_preItnTokenToPostItnCharAlignments, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = self->_preItnTokenToPostItnCharAlignments;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"pre_itn_token_to_post_itn_char_alignments"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXChoiceAlignmentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_postItnChoiceIndices.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_postItnChoiceIndices.count);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_preItnTokenToPostItnCharAlignments;
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
  id v11 = a3;
  if ([(MXChoiceAlignment *)self postItnChoiceIndicesCount])
  {
    [v11 clearPostItnChoiceIndices];
    unint64_t v4 = [(MXChoiceAlignment *)self postItnChoiceIndicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v11, "addPostItnChoiceIndices:", -[MXChoiceAlignment postItnChoiceIndicesAtIndex:](self, "postItnChoiceIndicesAtIndex:", i));
    }
  }
  if ([(MXChoiceAlignment *)self preItnTokenToPostItnCharAlignmentsCount])
  {
    [v11 clearPreItnTokenToPostItnCharAlignments];
    unint64_t v7 = [(MXChoiceAlignment *)self preItnTokenToPostItnCharAlignmentsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
      {
        uint64_t v10 = [(MXChoiceAlignment *)self preItnTokenToPostItnCharAlignmentsAtIndex:j];
        [v11 addPreItnTokenToPostItnCharAlignments:v10];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_preItnTokenToPostItnCharAlignments;
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
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addPreItnTokenToPostItnCharAlignments:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && PBRepeatedInt32IsEqual())
  {
    preItnTokenToPostItnCharAlignments = self->_preItnTokenToPostItnCharAlignments;
    if ((unint64_t)preItnTokenToPostItnCharAlignments | v4[4]) {
      char v6 = -[NSMutableArray isEqual:](preItnTokenToPostItnCharAlignments, "isEqual:");
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

- (unint64_t)hash
{
  uint64_t v3 = PBRepeatedInt32Hash();
  return [(NSMutableArray *)self->_preItnTokenToPostItnCharAlignments hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  uint64_t v5 = [v4 postItnChoiceIndicesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[MXChoiceAlignment addPostItnChoiceIndices:](self, "addPostItnChoiceIndices:", [v4 postItnChoiceIndicesAtIndex:i]);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4[4];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[MXChoiceAlignment addPreItnTokenToPostItnCharAlignments:](self, "addPreItnTokenToPostItnCharAlignments:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (NSMutableArray)preItnTokenToPostItnCharAlignments
{
  return self->_preItnTokenToPostItnCharAlignments;
}

- (void)setPreItnTokenToPostItnCharAlignments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end