@interface MXRecognitionResult
+ (Class)choiceAlignmentsType;
+ (Class)postItnNbestChoicesType;
+ (Class)preItnNbestChoicesType;
+ (Class)preItnTokenToPostItnCharAlignmentType;
- (BOOL)hasPostItn;
- (BOOL)hasPreItn;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MXRecognitionSausage)postItn;
- (MXRecognitionSausage)preItn;
- (NSMutableArray)choiceAlignments;
- (NSMutableArray)postItnNbestChoices;
- (NSMutableArray)preItnNbestChoices;
- (NSMutableArray)preItnTokenToPostItnCharAlignments;
- (id)choiceAlignmentsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)postItnNbestChoicesAtIndex:(unint64_t)a3;
- (id)preItnNbestChoicesAtIndex:(unint64_t)a3;
- (id)preItnTokenToPostItnCharAlignmentAtIndex:(unint64_t)a3;
- (unint64_t)choiceAlignmentsCount;
- (unint64_t)hash;
- (unint64_t)postItnNbestChoicesCount;
- (unint64_t)preItnNbestChoicesCount;
- (unint64_t)preItnTokenToPostItnCharAlignmentsCount;
- (void)addChoiceAlignments:(id)a3;
- (void)addPostItnNbestChoices:(id)a3;
- (void)addPreItnNbestChoices:(id)a3;
- (void)addPreItnTokenToPostItnCharAlignment:(id)a3;
- (void)clearChoiceAlignments;
- (void)clearPostItnNbestChoices;
- (void)clearPreItnNbestChoices;
- (void)clearPreItnTokenToPostItnCharAlignments;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChoiceAlignments:(id)a3;
- (void)setPostItn:(id)a3;
- (void)setPostItnNbestChoices:(id)a3;
- (void)setPreItn:(id)a3;
- (void)setPreItnNbestChoices:(id)a3;
- (void)setPreItnTokenToPostItnCharAlignments:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXRecognitionResult

- (BOOL)hasPreItn
{
  return self->_preItn != 0;
}

- (BOOL)hasPostItn
{
  return self->_postItn != 0;
}

- (void)clearPreItnNbestChoices
{
}

- (void)addPreItnNbestChoices:(id)a3
{
  id v4 = a3;
  preItnNbestChoices = self->_preItnNbestChoices;
  id v8 = v4;
  if (!preItnNbestChoices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_preItnNbestChoices;
    self->_preItnNbestChoices = v6;

    id v4 = v8;
    preItnNbestChoices = self->_preItnNbestChoices;
  }
  [(NSMutableArray *)preItnNbestChoices addObject:v4];
}

- (unint64_t)preItnNbestChoicesCount
{
  return [(NSMutableArray *)self->_preItnNbestChoices count];
}

- (id)preItnNbestChoicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_preItnNbestChoices objectAtIndex:a3];
}

+ (Class)preItnNbestChoicesType
{
  return (Class)objc_opt_class();
}

- (void)clearPostItnNbestChoices
{
}

- (void)addPostItnNbestChoices:(id)a3
{
  id v4 = a3;
  postItnNbestChoices = self->_postItnNbestChoices;
  id v8 = v4;
  if (!postItnNbestChoices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_postItnNbestChoices;
    self->_postItnNbestChoices = v6;

    id v4 = v8;
    postItnNbestChoices = self->_postItnNbestChoices;
  }
  [(NSMutableArray *)postItnNbestChoices addObject:v4];
}

- (unint64_t)postItnNbestChoicesCount
{
  return [(NSMutableArray *)self->_postItnNbestChoices count];
}

- (id)postItnNbestChoicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_postItnNbestChoices objectAtIndex:a3];
}

+ (Class)postItnNbestChoicesType
{
  return (Class)objc_opt_class();
}

- (void)clearPreItnTokenToPostItnCharAlignments
{
}

- (void)addPreItnTokenToPostItnCharAlignment:(id)a3
{
  id v4 = a3;
  preItnTokenToPostItnCharAlignments = self->_preItnTokenToPostItnCharAlignments;
  id v8 = v4;
  if (!preItnTokenToPostItnCharAlignments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_preItnTokenToPostItnCharAlignments;
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

- (id)preItnTokenToPostItnCharAlignmentAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_preItnTokenToPostItnCharAlignments objectAtIndex:a3];
}

+ (Class)preItnTokenToPostItnCharAlignmentType
{
  return (Class)objc_opt_class();
}

- (void)clearChoiceAlignments
{
}

- (void)addChoiceAlignments:(id)a3
{
  id v4 = a3;
  choiceAlignments = self->_choiceAlignments;
  id v8 = v4;
  if (!choiceAlignments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_choiceAlignments;
    self->_choiceAlignments = v6;

    id v4 = v8;
    choiceAlignments = self->_choiceAlignments;
  }
  [(NSMutableArray *)choiceAlignments addObject:v4];
}

- (unint64_t)choiceAlignmentsCount
{
  return [(NSMutableArray *)self->_choiceAlignments count];
}

- (id)choiceAlignmentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_choiceAlignments objectAtIndex:a3];
}

+ (Class)choiceAlignmentsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXRecognitionResult;
  id v4 = [(MXRecognitionResult *)&v8 description];
  v5 = [(MXRecognitionResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  preItn = self->_preItn;
  if (preItn)
  {
    v5 = [(MXRecognitionSausage *)preItn dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"pre_itn"];
  }
  postItn = self->_postItn;
  if (postItn)
  {
    v7 = [(MXRecognitionSausage *)postItn dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"post_itn"];
  }
  if ([(NSMutableArray *)self->_preItnNbestChoices count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_preItnNbestChoices, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v9 = self->_preItnNbestChoices;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v50 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v49 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"pre_itn_nbest_choices"];
  }
  if ([(NSMutableArray *)self->_postItnNbestChoices count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_postItnNbestChoices, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v16 = self->_postItnNbestChoices;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v45 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"post_itn_nbest_choices"];
  }
  if ([(NSMutableArray *)self->_preItnTokenToPostItnCharAlignments count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_preItnTokenToPostItnCharAlignments, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v23 = self->_preItnTokenToPostItnCharAlignments;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v42 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v41 + 1) + 8 * k) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKey:@"pre_itn_token_to_post_itn_char_alignment"];
  }
  if ([(NSMutableArray *)self->_choiceAlignments count])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_choiceAlignments, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v30 = self->_choiceAlignments;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v38;
      do
      {
        for (uint64_t m = 0; m != v32; ++m)
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * m), "dictionaryRepresentation", (void)v37);
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v32);
    }

    [v3 setObject:v29 forKey:@"choice_alignments"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXRecognitionResultReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_preItn) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_postItn) {
    PBDataWriterWriteSubmessage();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_preItnNbestChoices;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_postItnNbestChoices;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_preItnTokenToPostItnCharAlignments;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_choiceAlignments;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v20 = a3;
  if (self->_preItn) {
    objc_msgSend(v20, "setPreItn:");
  }
  if (self->_postItn) {
    objc_msgSend(v20, "setPostItn:");
  }
  if ([(MXRecognitionResult *)self preItnNbestChoicesCount])
  {
    [v20 clearPreItnNbestChoices];
    unint64_t v4 = [(MXRecognitionResult *)self preItnNbestChoicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MXRecognitionResult *)self preItnNbestChoicesAtIndex:i];
        [v20 addPreItnNbestChoices:v7];
      }
    }
  }
  if ([(MXRecognitionResult *)self postItnNbestChoicesCount])
  {
    [v20 clearPostItnNbestChoices];
    unint64_t v8 = [(MXRecognitionResult *)self postItnNbestChoicesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(MXRecognitionResult *)self postItnNbestChoicesAtIndex:j];
        [v20 addPostItnNbestChoices:v11];
      }
    }
  }
  if ([(MXRecognitionResult *)self preItnTokenToPostItnCharAlignmentsCount])
  {
    [v20 clearPreItnTokenToPostItnCharAlignments];
    unint64_t v12 = [(MXRecognitionResult *)self preItnTokenToPostItnCharAlignmentsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(MXRecognitionResult *)self preItnTokenToPostItnCharAlignmentAtIndex:k];
        [v20 addPreItnTokenToPostItnCharAlignment:v15];
      }
    }
  }
  if ([(MXRecognitionResult *)self choiceAlignmentsCount])
  {
    [v20 clearChoiceAlignments];
    unint64_t v16 = [(MXRecognitionResult *)self choiceAlignmentsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(MXRecognitionResult *)self choiceAlignmentsAtIndex:m];
        [v20 addChoiceAlignments:v19];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MXRecognitionSausage *)self->_preItn copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(MXRecognitionSausage *)self->_postItn copyWithZone:a3];
  unint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v10 = self->_preItnNbestChoices;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v48;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * v14) copyWithZone:a3];
        [v5 addPreItnNbestChoices:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v12);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  unint64_t v16 = self->_postItnNbestChoices;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v44;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v44 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v20) copyWithZone:a3];
        [v5 addPostItnNbestChoices:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v18);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v22 = self->_preItnTokenToPostItnCharAlignments;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * v26) copyWithZone:a3];
        [v5 addPreItnTokenToPostItnCharAlignment:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v24);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v28 = self->_choiceAlignments;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        long long v33 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v32), "copyWithZone:", a3, (void)v35);
        [v5 addChoiceAlignments:v33];

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v30);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((preItn = self->_preItn, !((unint64_t)preItn | v4[4]))
     || -[MXRecognitionSausage isEqual:](preItn, "isEqual:"))
    && ((postItn = self->_postItn, !((unint64_t)postItn | v4[2]))
     || -[MXRecognitionSausage isEqual:](postItn, "isEqual:"))
    && ((preItnNbestChoices = self->_preItnNbestChoices, !((unint64_t)preItnNbestChoices | v4[5]))
     || -[NSMutableArray isEqual:](preItnNbestChoices, "isEqual:"))
    && ((postItnNbestChoices = self->_postItnNbestChoices, !((unint64_t)postItnNbestChoices | v4[3]))
     || -[NSMutableArray isEqual:](postItnNbestChoices, "isEqual:"))
    && ((preItnTokenToPostItnCharAlignments = self->_preItnTokenToPostItnCharAlignments,
         !((unint64_t)preItnTokenToPostItnCharAlignments | v4[6]))
     || -[NSMutableArray isEqual:](preItnTokenToPostItnCharAlignments, "isEqual:")))
  {
    choiceAlignments = self->_choiceAlignments;
    if ((unint64_t)choiceAlignments | v4[1]) {
      char v11 = -[NSMutableArray isEqual:](choiceAlignments, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MXRecognitionSausage *)self->_preItn hash];
  unint64_t v4 = [(MXRecognitionSausage *)self->_postItn hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_preItnNbestChoices hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_postItnNbestChoices hash];
  uint64_t v7 = [(NSMutableArray *)self->_preItnTokenToPostItnCharAlignments hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_choiceAlignments hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  preItn = self->_preItn;
  uint64_t v6 = *((void *)v4 + 4);
  if (preItn)
  {
    if (v6) {
      -[MXRecognitionSausage mergeFrom:](preItn, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MXRecognitionResult setPreItn:](self, "setPreItn:");
  }
  postItn = self->_postItn;
  uint64_t v8 = *((void *)v4 + 2);
  if (postItn)
  {
    if (v8) {
      -[MXRecognitionSausage mergeFrom:](postItn, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[MXRecognitionResult setPostItn:](self, "setPostItn:");
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = *((id *)v4 + 5);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v9);
        }
        [(MXRecognitionResult *)self addPreItnNbestChoices:*(void *)(*((void *)&v41 + 1) + 8 * i)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v11);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = *((id *)v4 + 3);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(v14);
        }
        [(MXRecognitionResult *)self addPostItnNbestChoices:*(void *)(*((void *)&v37 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v16);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = *((id *)v4 + 6);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        [(MXRecognitionResult *)self addPreItnTokenToPostItnCharAlignment:*(void *)(*((void *)&v33 + 1) + 8 * k)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v21);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v24 = *((id *)v4 + 1);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v26; ++m)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        -[MXRecognitionResult addChoiceAlignments:](self, "addChoiceAlignments:", *(void *)(*((void *)&v29 + 1) + 8 * m), (void)v29);
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v26);
  }
}

- (MXRecognitionSausage)preItn
{
  return self->_preItn;
}

- (void)setPreItn:(id)a3
{
}

- (MXRecognitionSausage)postItn
{
  return self->_postItn;
}

- (void)setPostItn:(id)a3
{
}

- (NSMutableArray)preItnNbestChoices
{
  return self->_preItnNbestChoices;
}

- (void)setPreItnNbestChoices:(id)a3
{
}

- (NSMutableArray)postItnNbestChoices
{
  return self->_postItnNbestChoices;
}

- (void)setPostItnNbestChoices:(id)a3
{
}

- (NSMutableArray)preItnTokenToPostItnCharAlignments
{
  return self->_preItnTokenToPostItnCharAlignments;
}

- (void)setPreItnTokenToPostItnCharAlignments:(id)a3
{
}

- (NSMutableArray)choiceAlignments
{
  return self->_choiceAlignments;
}

- (void)setChoiceAlignments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preItnTokenToPostItnCharAlignments, 0);
  objc_storeStrong((id *)&self->_preItnNbestChoices, 0);
  objc_storeStrong((id *)&self->_preItn, 0);
  objc_storeStrong((id *)&self->_postItnNbestChoices, 0);
  objc_storeStrong((id *)&self->_postItn, 0);

  objc_storeStrong((id *)&self->_choiceAlignments, 0);
}

@end