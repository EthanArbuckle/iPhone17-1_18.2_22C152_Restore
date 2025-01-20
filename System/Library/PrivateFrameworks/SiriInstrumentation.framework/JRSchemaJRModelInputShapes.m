@interface JRSchemaJRModelInputShapes
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (JRSchemaJRModelInputShapes)initWithDictionary:(id)a3;
- (JRSchemaJRModelInputShapes)initWithJSON:(id)a3;
- (NSArray)candidateInteractionsShapes;
- (NSArray)candidateTuplesShapes;
- (NSArray)deviceContextShapes;
- (NSArray)similarityScoresShapes;
- (NSArray)tupleInteractionsAlignmentShapes;
- (NSArray)tupleInteractionsCandidatesShapes;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)candidateInteractionsShapesCount;
- (unint64_t)candidateTuplesShapesCount;
- (unint64_t)deviceContextShapesCount;
- (unint64_t)hash;
- (unint64_t)similarityScoresShapesCount;
- (unint64_t)tupleInteractionsAlignmentShapesCount;
- (unint64_t)tupleInteractionsCandidatesShapesCount;
- (unsigned)candidateInteractionsShapesAtIndex:(unint64_t)a3;
- (unsigned)candidateTuplesShapesAtIndex:(unint64_t)a3;
- (unsigned)deviceContextShapesAtIndex:(unint64_t)a3;
- (unsigned)similarityScoresShapesAtIndex:(unint64_t)a3;
- (unsigned)tupleInteractionsAlignmentShapesAtIndex:(unint64_t)a3;
- (unsigned)tupleInteractionsCandidatesShapesAtIndex:(unint64_t)a3;
- (void)addCandidateInteractionsShapes:(unsigned int)a3;
- (void)addCandidateTuplesShapes:(unsigned int)a3;
- (void)addDeviceContextShapes:(unsigned int)a3;
- (void)addSimilarityScoresShapes:(unsigned int)a3;
- (void)addTupleInteractionsAlignmentShapes:(unsigned int)a3;
- (void)addTupleInteractionsCandidatesShapes:(unsigned int)a3;
- (void)clearCandidateInteractionsShapes;
- (void)clearCandidateTuplesShapes;
- (void)clearDeviceContextShapes;
- (void)clearSimilarityScoresShapes;
- (void)clearTupleInteractionsAlignmentShapes;
- (void)clearTupleInteractionsCandidatesShapes;
- (void)setCandidateInteractionsShapes:(id)a3;
- (void)setCandidateTuplesShapes:(id)a3;
- (void)setDeviceContextShapes:(id)a3;
- (void)setSimilarityScoresShapes:(id)a3;
- (void)setTupleInteractionsAlignmentShapes:(id)a3;
- (void)setTupleInteractionsCandidatesShapes:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation JRSchemaJRModelInputShapes

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_similarityScoresShapes, 0);
  objc_storeStrong((id *)&self->_tupleInteractionsAlignmentShapes, 0);
  objc_storeStrong((id *)&self->_tupleInteractionsCandidatesShapes, 0);
  objc_storeStrong((id *)&self->_candidateInteractionsShapes, 0);
  objc_storeStrong((id *)&self->_deviceContextShapes, 0);
  objc_storeStrong((id *)&self->_candidateTuplesShapes, 0);
}

- (void)setSimilarityScoresShapes:(id)a3
{
}

- (NSArray)similarityScoresShapes
{
  return self->_similarityScoresShapes;
}

- (void)setTupleInteractionsAlignmentShapes:(id)a3
{
}

- (NSArray)tupleInteractionsAlignmentShapes
{
  return self->_tupleInteractionsAlignmentShapes;
}

- (void)setTupleInteractionsCandidatesShapes:(id)a3
{
}

- (NSArray)tupleInteractionsCandidatesShapes
{
  return self->_tupleInteractionsCandidatesShapes;
}

- (void)setCandidateInteractionsShapes:(id)a3
{
}

- (NSArray)candidateInteractionsShapes
{
  return self->_candidateInteractionsShapes;
}

- (void)setDeviceContextShapes:(id)a3
{
}

- (NSArray)deviceContextShapes
{
  return self->_deviceContextShapes;
}

- (void)setCandidateTuplesShapes:(id)a3
{
}

- (NSArray)candidateTuplesShapes
{
  return self->_candidateTuplesShapes;
}

- (JRSchemaJRModelInputShapes)initWithDictionary:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v78.receiver = self;
  v78.super_class = (Class)JRSchemaJRModelInputShapes;
  v5 = [(JRSchemaJRModelInputShapes *)&v78 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"candidateTuplesShapes"];
    objc_opt_class();
    v53 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v74 objects:v84 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v75 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v74 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[JRSchemaJRModelInputShapes addCandidateTuplesShapes:](v5, "addCandidateTuplesShapes:", [v12 unsignedIntValue]);
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v74 objects:v84 count:16];
        }
        while (v9);
      }
    }
    v13 = [v4 objectForKeyedSubscript:@"deviceContextShapes"];
    objc_opt_class();
    v52 = v13;
    if (objc_opt_isKindOfClass())
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v70 objects:v83 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v71;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v71 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v70 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[JRSchemaJRModelInputShapes addDeviceContextShapes:](v5, "addDeviceContextShapes:", [v19 unsignedIntValue]);
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v70 objects:v83 count:16];
        }
        while (v16);
      }
    }
    v20 = [v4 objectForKeyedSubscript:@"candidateInteractionsShapes"];
    objc_opt_class();
    v51 = v20;
    if (objc_opt_isKindOfClass())
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v66 objects:v82 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v67;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v67 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v66 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[JRSchemaJRModelInputShapes addCandidateInteractionsShapes:](v5, "addCandidateInteractionsShapes:", [v26 unsignedIntValue]);
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v66 objects:v82 count:16];
        }
        while (v23);
      }
    }
    v27 = [v4 objectForKeyedSubscript:@"tupleInteractionsCandidatesShapes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v62 objects:v81 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v63;
        do
        {
          for (uint64_t m = 0; m != v30; ++m)
          {
            if (*(void *)v63 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v62 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[JRSchemaJRModelInputShapes addTupleInteractionsCandidatesShapes:](v5, "addTupleInteractionsCandidatesShapes:", [v33 unsignedIntValue]);
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v62 objects:v81 count:16];
        }
        while (v30);
      }
    }
    v34 = [v4 objectForKeyedSubscript:@"tupleInteractionsAlignmentShapes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v35 = v34;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v58 objects:v80 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v59;
        do
        {
          for (uint64_t n = 0; n != v37; ++n)
          {
            if (*(void *)v59 != v38) {
              objc_enumerationMutation(v35);
            }
            v40 = *(void **)(*((void *)&v58 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[JRSchemaJRModelInputShapes addTupleInteractionsAlignmentShapes:](v5, "addTupleInteractionsAlignmentShapes:", [v40 unsignedIntValue]);
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v58 objects:v80 count:16];
        }
        while (v37);
      }
    }
    v41 = objc_msgSend(v4, "objectForKeyedSubscript:", @"similarityScoresShapes", v27);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v42 = v41;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v54 objects:v79 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v55;
        do
        {
          for (iuint64_t i = 0; ii != v44; ++ii)
          {
            if (*(void *)v55 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = *(void **)(*((void *)&v54 + 1) + 8 * ii);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[JRSchemaJRModelInputShapes addSimilarityScoresShapes:](v5, "addSimilarityScoresShapes:", [v47 unsignedIntValue]);
            }
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v54 objects:v79 count:16];
        }
        while (v44);
      }

      v27 = v50;
    }
    v48 = v5;
  }
  return v5;
}

- (JRSchemaJRModelInputShapes)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(JRSchemaJRModelInputShapes *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(JRSchemaJRModelInputShapes *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_candidateInteractionsShapes count])
  {
    id v4 = [(JRSchemaJRModelInputShapes *)self candidateInteractionsShapes];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"candidateInteractionsShapes"];
  }
  if ([(NSArray *)self->_candidateTuplesShapes count])
  {
    v6 = [(JRSchemaJRModelInputShapes *)self candidateTuplesShapes];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"candidateTuplesShapes"];
  }
  if ([(NSArray *)self->_deviceContextShapes count])
  {
    uint64_t v8 = [(JRSchemaJRModelInputShapes *)self deviceContextShapes];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"deviceContextShapes"];
  }
  if ([(NSArray *)self->_similarityScoresShapes count])
  {
    uint64_t v10 = [(JRSchemaJRModelInputShapes *)self similarityScoresShapes];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"similarityScoresShapes"];
  }
  if ([(NSArray *)self->_tupleInteractionsAlignmentShapes count])
  {
    v12 = [(JRSchemaJRModelInputShapes *)self tupleInteractionsAlignmentShapes];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"tupleInteractionsAlignmentShapes"];
  }
  if ([(NSArray *)self->_tupleInteractionsCandidatesShapes count])
  {
    id v14 = [(JRSchemaJRModelInputShapes *)self tupleInteractionsCandidatesShapes];
    uint64_t v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"tupleInteractionsCandidatesShapes"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_candidateTuplesShapes hash];
  uint64_t v4 = [(NSArray *)self->_deviceContextShapes hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_candidateInteractionsShapes hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_tupleInteractionsCandidatesShapes hash];
  uint64_t v7 = [(NSArray *)self->_tupleInteractionsAlignmentShapes hash];
  return v6 ^ v7 ^ [(NSArray *)self->_similarityScoresShapes hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  uint64_t v5 = [(JRSchemaJRModelInputShapes *)self candidateTuplesShapes];
  uint64_t v6 = [v4 candidateTuplesShapes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(JRSchemaJRModelInputShapes *)self candidateTuplesShapes];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(JRSchemaJRModelInputShapes *)self candidateTuplesShapes];
    uint64_t v10 = [v4 candidateTuplesShapes];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(JRSchemaJRModelInputShapes *)self deviceContextShapes];
  uint64_t v6 = [v4 deviceContextShapes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(JRSchemaJRModelInputShapes *)self deviceContextShapes];
  if (v12)
  {
    v13 = (void *)v12;
    id v14 = [(JRSchemaJRModelInputShapes *)self deviceContextShapes];
    uint64_t v15 = [v4 deviceContextShapes];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(JRSchemaJRModelInputShapes *)self candidateInteractionsShapes];
  uint64_t v6 = [v4 candidateInteractionsShapes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(JRSchemaJRModelInputShapes *)self candidateInteractionsShapes];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(JRSchemaJRModelInputShapes *)self candidateInteractionsShapes];
    v20 = [v4 candidateInteractionsShapes];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(JRSchemaJRModelInputShapes *)self tupleInteractionsCandidatesShapes];
  uint64_t v6 = [v4 tupleInteractionsCandidatesShapes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(JRSchemaJRModelInputShapes *)self tupleInteractionsCandidatesShapes];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(JRSchemaJRModelInputShapes *)self tupleInteractionsCandidatesShapes];
    v25 = [v4 tupleInteractionsCandidatesShapes];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(JRSchemaJRModelInputShapes *)self tupleInteractionsAlignmentShapes];
  uint64_t v6 = [v4 tupleInteractionsAlignmentShapes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(JRSchemaJRModelInputShapes *)self tupleInteractionsAlignmentShapes];
  if (v27)
  {
    id v28 = (void *)v27;
    uint64_t v29 = [(JRSchemaJRModelInputShapes *)self tupleInteractionsAlignmentShapes];
    uint64_t v30 = [v4 tupleInteractionsAlignmentShapes];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  uint64_t v5 = [(JRSchemaJRModelInputShapes *)self similarityScoresShapes];
  uint64_t v6 = [v4 similarityScoresShapes];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(JRSchemaJRModelInputShapes *)self similarityScoresShapes];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    v33 = (void *)v32;
    v34 = [(JRSchemaJRModelInputShapes *)self similarityScoresShapes];
    id v35 = [v4 similarityScoresShapes];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v5 = self->_candidateTuplesShapes;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v55 + 1) + 8 * v9) unsignedIntValue];
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v7);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v10 = self->_deviceContextShapes;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v51 + 1) + 8 * v14) unsignedIntValue];
        PBDataWriterWriteUint32Field();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v12);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v15 = self->_candidateInteractionsShapes;
  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v47 + 1) + 8 * v19) unsignedIntValue];
        PBDataWriterWriteUint32Field();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
    }
    while (v17);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v20 = self->_tupleInteractionsCandidatesShapes;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * v24) unsignedIntValue];
        PBDataWriterWriteUint32Field();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
    }
    while (v22);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v25 = self->_tupleInteractionsAlignmentShapes;
  uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * v29) unsignedIntValue];
        PBDataWriterWriteUint32Field();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
    }
    while (v27);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v30 = self->_similarityScoresShapes;
  uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v34), "unsignedIntValue", (void)v35);
        PBDataWriterWriteUint32Field();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSArray *)v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
    }
    while (v32);
  }
}

- (BOOL)readFrom:(id)a3
{
  return JRSchemaJRModelInputShapesReadFrom(self, (uint64_t)a3);
}

- (unsigned)similarityScoresShapesAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_similarityScoresShapes objectAtIndexedSubscript:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)similarityScoresShapesCount
{
  return [(NSArray *)self->_similarityScoresShapes count];
}

- (void)addSimilarityScoresShapes:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  similarityScoresShapes = self->_similarityScoresShapes;
  if (!similarityScoresShapes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_similarityScoresShapes;
    self->_similarityScoresShapes = v6;

    similarityScoresShapes = self->_similarityScoresShapes;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  [(NSArray *)similarityScoresShapes addObject:v8];
}

- (void)clearSimilarityScoresShapes
{
}

- (unsigned)tupleInteractionsAlignmentShapesAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_tupleInteractionsAlignmentShapes objectAtIndexedSubscript:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)tupleInteractionsAlignmentShapesCount
{
  return [(NSArray *)self->_tupleInteractionsAlignmentShapes count];
}

- (void)addTupleInteractionsAlignmentShapes:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  tupleInteractionsAlignmentShapes = self->_tupleInteractionsAlignmentShapes;
  if (!tupleInteractionsAlignmentShapes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tupleInteractionsAlignmentShapes;
    self->_tupleInteractionsAlignmentShapes = v6;

    tupleInteractionsAlignmentShapes = self->_tupleInteractionsAlignmentShapes;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  [(NSArray *)tupleInteractionsAlignmentShapes addObject:v8];
}

- (void)clearTupleInteractionsAlignmentShapes
{
}

- (unsigned)tupleInteractionsCandidatesShapesAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_tupleInteractionsCandidatesShapes objectAtIndexedSubscript:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)tupleInteractionsCandidatesShapesCount
{
  return [(NSArray *)self->_tupleInteractionsCandidatesShapes count];
}

- (void)addTupleInteractionsCandidatesShapes:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  tupleInteractionsCandidatesShapes = self->_tupleInteractionsCandidatesShapes;
  if (!tupleInteractionsCandidatesShapes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_tupleInteractionsCandidatesShapes;
    self->_tupleInteractionsCandidatesShapes = v6;

    tupleInteractionsCandidatesShapes = self->_tupleInteractionsCandidatesShapes;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  [(NSArray *)tupleInteractionsCandidatesShapes addObject:v8];
}

- (void)clearTupleInteractionsCandidatesShapes
{
}

- (unsigned)candidateInteractionsShapesAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_candidateInteractionsShapes objectAtIndexedSubscript:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)candidateInteractionsShapesCount
{
  return [(NSArray *)self->_candidateInteractionsShapes count];
}

- (void)addCandidateInteractionsShapes:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  candidateInteractionsShapes = self->_candidateInteractionsShapes;
  if (!candidateInteractionsShapes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_candidateInteractionsShapes;
    self->_candidateInteractionsShapes = v6;

    candidateInteractionsShapes = self->_candidateInteractionsShapes;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  [(NSArray *)candidateInteractionsShapes addObject:v8];
}

- (void)clearCandidateInteractionsShapes
{
}

- (unsigned)deviceContextShapesAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_deviceContextShapes objectAtIndexedSubscript:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)deviceContextShapesCount
{
  return [(NSArray *)self->_deviceContextShapes count];
}

- (void)addDeviceContextShapes:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  deviceContextShapes = self->_deviceContextShapes;
  if (!deviceContextShapes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_deviceContextShapes;
    self->_deviceContextShapes = v6;

    deviceContextShapes = self->_deviceContextShapes;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  [(NSArray *)deviceContextShapes addObject:v8];
}

- (void)clearDeviceContextShapes
{
}

- (unsigned)candidateTuplesShapesAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_candidateTuplesShapes objectAtIndexedSubscript:a3];
  unsigned int v4 = [v3 unsignedIntValue];

  return v4;
}

- (unint64_t)candidateTuplesShapesCount
{
  return [(NSArray *)self->_candidateTuplesShapes count];
}

- (void)addCandidateTuplesShapes:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  candidateTuplesShapes = self->_candidateTuplesShapes;
  if (!candidateTuplesShapes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_candidateTuplesShapes;
    self->_candidateTuplesShapes = v6;

    candidateTuplesShapes = self->_candidateTuplesShapes;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  [(NSArray *)candidateTuplesShapes addObject:v8];
}

- (void)clearCandidateTuplesShapes
{
}

@end