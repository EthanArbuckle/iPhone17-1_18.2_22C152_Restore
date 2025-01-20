@interface ASRSchemaASRFinalResultGenerated
- (ASRSchemaASRFinalResultGenerated)initWithDictionary:(id)a3;
- (ASRSchemaASRFinalResultGenerated)initWithJSON:(id)a3;
- (BOOL)hasIsAfterResume;
- (BOOL)isAfterResume;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)correctAlignedPartialResultIndexLists;
- (NSArray)correctAlignedUnfilteredPartialResultIndexLists;
- (NSArray)correctPartialResultIndexLists;
- (NSArray)tokenSilenceStartTimeInNsLists;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)correctAlignedPartialResultIndexListAtIndex:(unint64_t)a3;
- (int)correctAlignedUnfilteredPartialResultIndexListAtIndex:(unint64_t)a3;
- (int)correctPartialResultIndexListAtIndex:(unint64_t)a3;
- (unint64_t)correctAlignedPartialResultIndexListCount;
- (unint64_t)correctAlignedUnfilteredPartialResultIndexListCount;
- (unint64_t)correctPartialResultIndexListCount;
- (unint64_t)hash;
- (unint64_t)tokenSilenceStartTimeInNsListAtIndex:(unint64_t)a3;
- (unint64_t)tokenSilenceStartTimeInNsListCount;
- (void)addCorrectAlignedPartialResultIndexList:(int)a3;
- (void)addCorrectAlignedUnfilteredPartialResultIndexList:(int)a3;
- (void)addCorrectPartialResultIndexList:(int)a3;
- (void)addTokenSilenceStartTimeInNsList:(unint64_t)a3;
- (void)clearCorrectAlignedPartialResultIndexList;
- (void)clearCorrectAlignedUnfilteredPartialResultIndexList;
- (void)clearCorrectPartialResultIndexList;
- (void)clearTokenSilenceStartTimeInNsList;
- (void)deleteIsAfterResume;
- (void)setCorrectAlignedPartialResultIndexLists:(id)a3;
- (void)setCorrectAlignedUnfilteredPartialResultIndexLists:(id)a3;
- (void)setCorrectPartialResultIndexLists:(id)a3;
- (void)setHasIsAfterResume:(BOOL)a3;
- (void)setIsAfterResume:(BOOL)a3;
- (void)setTokenSilenceStartTimeInNsLists:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRFinalResultGenerated

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctAlignedUnfilteredPartialResultIndexLists, 0);
  objc_storeStrong((id *)&self->_correctAlignedPartialResultIndexLists, 0);
  objc_storeStrong((id *)&self->_correctPartialResultIndexLists, 0);
  objc_storeStrong((id *)&self->_tokenSilenceStartTimeInNsLists, 0);
}

- (void)setCorrectAlignedUnfilteredPartialResultIndexLists:(id)a3
{
}

- (NSArray)correctAlignedUnfilteredPartialResultIndexLists
{
  return self->_correctAlignedUnfilteredPartialResultIndexLists;
}

- (void)setCorrectAlignedPartialResultIndexLists:(id)a3
{
}

- (NSArray)correctAlignedPartialResultIndexLists
{
  return self->_correctAlignedPartialResultIndexLists;
}

- (BOOL)isAfterResume
{
  return self->_isAfterResume;
}

- (void)setCorrectPartialResultIndexLists:(id)a3
{
}

- (NSArray)correctPartialResultIndexLists
{
  return self->_correctPartialResultIndexLists;
}

- (void)setTokenSilenceStartTimeInNsLists:(id)a3
{
}

- (NSArray)tokenSilenceStartTimeInNsLists
{
  return self->_tokenSilenceStartTimeInNsLists;
}

- (ASRSchemaASRFinalResultGenerated)initWithDictionary:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)ASRSchemaASRFinalResultGenerated;
  v5 = [(ASRSchemaASRFinalResultGenerated *)&v57 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"tokenSilenceStartTimeInNsList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v54;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v54 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v53 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ASRSchemaASRFinalResultGenerated addTokenSilenceStartTimeInNsList:](v5, "addTokenSilenceStartTimeInNsList:", [v12 unsignedLongLongValue]);
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
        }
        while (v9);
      }
    }
    v13 = [v4 objectForKeyedSubscript:@"correctPartialResultIndexList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v60 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v50;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v50 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v49 + 1) + 8 * v18);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ASRSchemaASRFinalResultGenerated addCorrectPartialResultIndexList:](v5, "addCorrectPartialResultIndexList:", [v19 intValue]);
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v49 objects:v60 count:16];
        }
        while (v16);
      }
    }
    v20 = [v4 objectForKeyedSubscript:@"isAfterResume"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ASRSchemaASRFinalResultGenerated setIsAfterResume:](v5, "setIsAfterResume:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"correctAlignedPartialResultIndexList"];
    objc_opt_class();
    v39 = v20;
    v40 = v13;
    if (objc_opt_isKindOfClass())
    {
      v22 = v6;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v23 = v21;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v59 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v46;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v46 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v45 + 1) + 8 * v27);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ASRSchemaASRFinalResultGenerated addCorrectAlignedPartialResultIndexList:](v5, "addCorrectAlignedPartialResultIndexList:", [v28 intValue]);
            }
            ++v27;
          }
          while (v25 != v27);
          uint64_t v25 = [v23 countByEnumeratingWithState:&v45 objects:v59 count:16];
        }
        while (v25);
      }

      v6 = v22;
      v20 = v39;
      v13 = v40;
    }
    v29 = [v4 objectForKeyedSubscript:@"correctAlignedUnfilteredPartialResultIndexList"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = v6;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v30 = v29;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v41 objects:v58 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v42;
        do
        {
          uint64_t v34 = 0;
          do
          {
            if (*(void *)v42 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v41 + 1) + 8 * v34);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ASRSchemaASRFinalResultGenerated addCorrectAlignedUnfilteredPartialResultIndexList:](v5, "addCorrectAlignedUnfilteredPartialResultIndexList:", [v35 intValue]);
            }
            ++v34;
          }
          while (v32 != v34);
          uint64_t v32 = [v30 countByEnumeratingWithState:&v41 objects:v58 count:16];
        }
        while (v32);
      }

      v6 = v38;
      v20 = v39;
      v13 = v40;
    }
    v36 = v5;
  }
  return v5;
}

- (ASRSchemaASRFinalResultGenerated)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRFinalResultGenerated *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRFinalResultGenerated *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_correctAlignedPartialResultIndexLists count])
  {
    id v4 = [(ASRSchemaASRFinalResultGenerated *)self correctAlignedPartialResultIndexLists];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"correctAlignedPartialResultIndexList"];
  }
  if ([(NSArray *)self->_correctAlignedUnfilteredPartialResultIndexLists count])
  {
    v6 = [(ASRSchemaASRFinalResultGenerated *)self correctAlignedUnfilteredPartialResultIndexLists];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"correctAlignedUnfilteredPartialResultIndexList"];
  }
  if ([(NSArray *)self->_correctPartialResultIndexLists count])
  {
    uint64_t v8 = [(ASRSchemaASRFinalResultGenerated *)self correctPartialResultIndexLists];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"correctPartialResultIndexList"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ASRSchemaASRFinalResultGenerated isAfterResume](self, "isAfterResume"));
    [v3 setObject:v10 forKeyedSubscript:@"isAfterResume"];
  }
  if ([(NSArray *)self->_tokenSilenceStartTimeInNsLists count])
  {
    uint64_t v11 = [(ASRSchemaASRFinalResultGenerated *)self tokenSilenceStartTimeInNsLists];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"tokenSilenceStartTimeInNsList"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_tokenSilenceStartTimeInNsLists hash];
  uint64_t v4 = [(NSArray *)self->_correctPartialResultIndexLists hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_isAfterResume;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSArray *)self->_correctAlignedPartialResultIndexLists hash];
  return v6 ^ [(NSArray *)self->_correctAlignedUnfilteredPartialResultIndexLists hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  uint64_t v5 = [(ASRSchemaASRFinalResultGenerated *)self tokenSilenceStartTimeInNsLists];
  uint64_t v6 = [v4 tokenSilenceStartTimeInNsLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v7 = [(ASRSchemaASRFinalResultGenerated *)self tokenSilenceStartTimeInNsLists];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(ASRSchemaASRFinalResultGenerated *)self tokenSilenceStartTimeInNsLists];
    uint64_t v10 = [v4 tokenSilenceStartTimeInNsLists];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ASRSchemaASRFinalResultGenerated *)self correctPartialResultIndexLists];
  uint64_t v6 = [v4 correctPartialResultIndexLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v12 = [(ASRSchemaASRFinalResultGenerated *)self correctPartialResultIndexLists];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [(ASRSchemaASRFinalResultGenerated *)self correctPartialResultIndexLists];
    uint64_t v15 = [v4 correctPartialResultIndexLists];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    int isAfterResume = self->_isAfterResume;
    if (isAfterResume != [v4 isAfterResume]) {
      goto LABEL_25;
    }
  }
  uint64_t v5 = [(ASRSchemaASRFinalResultGenerated *)self correctAlignedPartialResultIndexLists];
  uint64_t v6 = [v4 correctAlignedPartialResultIndexLists];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_24;
  }
  uint64_t v18 = [(ASRSchemaASRFinalResultGenerated *)self correctAlignedPartialResultIndexLists];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(ASRSchemaASRFinalResultGenerated *)self correctAlignedPartialResultIndexLists];
    v21 = [v4 correctAlignedPartialResultIndexLists];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_25;
    }
  }
  else
  {
  }
  uint64_t v5 = [(ASRSchemaASRFinalResultGenerated *)self correctAlignedUnfilteredPartialResultIndexLists];
  uint64_t v6 = [v4 correctAlignedUnfilteredPartialResultIndexLists];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v23 = [(ASRSchemaASRFinalResultGenerated *)self correctAlignedUnfilteredPartialResultIndexLists];
    if (!v23)
    {

LABEL_28:
      BOOL v28 = 1;
      goto LABEL_26;
    }
    uint64_t v24 = (void *)v23;
    uint64_t v25 = [(ASRSchemaASRFinalResultGenerated *)self correctAlignedUnfilteredPartialResultIndexLists];
    uint64_t v26 = [v4 correctAlignedUnfilteredPartialResultIndexLists];
    char v27 = [v25 isEqual:v26];

    if (v27) {
      goto LABEL_28;
    }
  }
  else
  {
LABEL_24:
  }
LABEL_25:
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v5 = self->_tokenSilenceStartTimeInNsLists;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
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
        [*(id *)(*((void *)&v37 + 1) + 8 * v9) unsignedLongLongValue];
        PBDataWriterWriteUint64Field();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_correctPartialResultIndexLists;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
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
        [*(id *)(*((void *)&v33 + 1) + 8 * v14) intValue];
        PBDataWriterWriteInt32Field();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = self->_correctAlignedPartialResultIndexLists;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
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
        [*(id *)(*((void *)&v29 + 1) + 8 * v19) intValue];
        PBDataWriterWriteInt32Field();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_correctAlignedUnfilteredPartialResultIndexLists;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * v24), "intValue", (void)v25);
        PBDataWriterWriteInt32Field();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRFinalResultGeneratedReadFrom(self, (uint64_t)a3);
}

- (int)correctAlignedUnfilteredPartialResultIndexListAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_correctAlignedUnfilteredPartialResultIndexLists objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)correctAlignedUnfilteredPartialResultIndexListCount
{
  return [(NSArray *)self->_correctAlignedUnfilteredPartialResultIndexLists count];
}

- (void)addCorrectAlignedUnfilteredPartialResultIndexList:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  correctAlignedUnfilteredPartialResultIndexLists = self->_correctAlignedUnfilteredPartialResultIndexLists;
  if (!correctAlignedUnfilteredPartialResultIndexLists)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_correctAlignedUnfilteredPartialResultIndexLists;
    self->_correctAlignedUnfilteredPartialResultIndexLists = v6;

    correctAlignedUnfilteredPartialResultIndexLists = self->_correctAlignedUnfilteredPartialResultIndexLists;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)correctAlignedUnfilteredPartialResultIndexLists addObject:v8];
}

- (void)clearCorrectAlignedUnfilteredPartialResultIndexList
{
}

- (int)correctAlignedPartialResultIndexListAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_correctAlignedPartialResultIndexLists objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)correctAlignedPartialResultIndexListCount
{
  return [(NSArray *)self->_correctAlignedPartialResultIndexLists count];
}

- (void)addCorrectAlignedPartialResultIndexList:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  correctAlignedPartialResultIndexLists = self->_correctAlignedPartialResultIndexLists;
  if (!correctAlignedPartialResultIndexLists)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_correctAlignedPartialResultIndexLists;
    self->_correctAlignedPartialResultIndexLists = v6;

    correctAlignedPartialResultIndexLists = self->_correctAlignedPartialResultIndexLists;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)correctAlignedPartialResultIndexLists addObject:v8];
}

- (void)clearCorrectAlignedPartialResultIndexList
{
}

- (void)deleteIsAfterResume
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsAfterResume:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsAfterResume
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsAfterResume:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isAfterResume = a3;
}

- (int)correctPartialResultIndexListAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_correctPartialResultIndexLists objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)correctPartialResultIndexListCount
{
  return [(NSArray *)self->_correctPartialResultIndexLists count];
}

- (void)addCorrectPartialResultIndexList:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  correctPartialResultIndexLists = self->_correctPartialResultIndexLists;
  if (!correctPartialResultIndexLists)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_correctPartialResultIndexLists;
    self->_correctPartialResultIndexLists = v6;

    correctPartialResultIndexLists = self->_correctPartialResultIndexLists;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)correctPartialResultIndexLists addObject:v8];
}

- (void)clearCorrectPartialResultIndexList
{
}

- (unint64_t)tokenSilenceStartTimeInNsListAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_tokenSilenceStartTimeInNsLists objectAtIndexedSubscript:a3];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)tokenSilenceStartTimeInNsListCount
{
  return [(NSArray *)self->_tokenSilenceStartTimeInNsLists count];
}

- (void)addTokenSilenceStartTimeInNsList:(unint64_t)a3
{
  tokenSilenceStartTimeInNsLists = self->_tokenSilenceStartTimeInNsLists;
  if (!tokenSilenceStartTimeInNsLists)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tokenSilenceStartTimeInNsLists;
    self->_tokenSilenceStartTimeInNsLists = v6;

    tokenSilenceStartTimeInNsLists = self->_tokenSilenceStartTimeInNsLists;
  }
  id v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSArray *)tokenSilenceStartTimeInNsLists addObject:v8];
}

- (void)clearTokenSilenceStartTimeInNsList
{
}

@end