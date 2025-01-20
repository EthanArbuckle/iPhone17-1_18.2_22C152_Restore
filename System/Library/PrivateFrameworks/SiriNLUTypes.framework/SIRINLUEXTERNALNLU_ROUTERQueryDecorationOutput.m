@interface SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput
+ (Class)adjustedRankedSpansType;
+ (Class)adjustedRankedToolsType;
+ (Class)originalRankedSpansType;
+ (Class)originalRankedToolsType;
+ (Class)requiredContextType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)adjustedRankedSpans;
- (NSMutableArray)adjustedRankedTools;
- (NSMutableArray)originalRankedSpans;
- (NSMutableArray)originalRankedTools;
- (NSMutableArray)requiredContexts;
- (id)adjustedRankedSpansAtIndex:(unint64_t)a3;
- (id)adjustedRankedToolsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)originalRankedSpansAtIndex:(unint64_t)a3;
- (id)originalRankedToolsAtIndex:(unint64_t)a3;
- (id)requiredContextAtIndex:(unint64_t)a3;
- (unint64_t)adjustedRankedSpansCount;
- (unint64_t)adjustedRankedToolsCount;
- (unint64_t)hash;
- (unint64_t)originalRankedSpansCount;
- (unint64_t)originalRankedToolsCount;
- (unint64_t)requiredContextsCount;
- (void)addAdjustedRankedSpans:(id)a3;
- (void)addAdjustedRankedTools:(id)a3;
- (void)addOriginalRankedSpans:(id)a3;
- (void)addOriginalRankedTools:(id)a3;
- (void)addRequiredContext:(id)a3;
- (void)clearAdjustedRankedSpans;
- (void)clearAdjustedRankedTools;
- (void)clearOriginalRankedSpans;
- (void)clearOriginalRankedTools;
- (void)clearRequiredContexts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdjustedRankedSpans:(id)a3;
- (void)setAdjustedRankedTools:(id)a3;
- (void)setOriginalRankedSpans:(id)a3;
- (void)setOriginalRankedTools:(id)a3;
- (void)setRequiredContexts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredContexts, 0);
  objc_storeStrong((id *)&self->_originalRankedTools, 0);
  objc_storeStrong((id *)&self->_originalRankedSpans, 0);
  objc_storeStrong((id *)&self->_adjustedRankedTools, 0);
  objc_storeStrong((id *)&self->_adjustedRankedSpans, 0);
}

- (void)setAdjustedRankedSpans:(id)a3
{
}

- (NSMutableArray)adjustedRankedSpans
{
  return self->_adjustedRankedSpans;
}

- (void)setOriginalRankedSpans:(id)a3
{
}

- (NSMutableArray)originalRankedSpans
{
  return self->_originalRankedSpans;
}

- (void)setAdjustedRankedTools:(id)a3
{
}

- (NSMutableArray)adjustedRankedTools
{
  return self->_adjustedRankedTools;
}

- (void)setOriginalRankedTools:(id)a3
{
}

- (NSMutableArray)originalRankedTools
{
  return self->_originalRankedTools;
}

- (void)setRequiredContexts:(id)a3
{
}

- (NSMutableArray)requiredContexts
{
  return self->_requiredContexts;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = v4[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self addRequiredContext:*(void *)(*((void *)&v46 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v4[4];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self addOriginalRankedTools:*(void *)(*((void *)&v42 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = v4[2];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self addAdjustedRankedTools:*(void *)(*((void *)&v38 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = v4[3];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self addOriginalRankedSpans:*(void *)(*((void *)&v34 + 1) + 8 * v24++)];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v25 = v4[1];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        -[SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput addAdjustedRankedSpans:](self, "addAdjustedRankedSpans:", *(void *)(*((void *)&v30 + 1) + 8 * v29++), (void)v30);
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_requiredContexts hash];
  uint64_t v4 = [(NSMutableArray *)self->_originalRankedTools hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_adjustedRankedTools hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_originalRankedSpans hash];
  return v6 ^ [(NSMutableArray *)self->_adjustedRankedSpans hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requiredContexts = self->_requiredContexts, !((unint64_t)requiredContexts | v4[5]))
     || -[NSMutableArray isEqual:](requiredContexts, "isEqual:"))
    && ((originalRankedTools = self->_originalRankedTools, !((unint64_t)originalRankedTools | v4[4]))
     || -[NSMutableArray isEqual:](originalRankedTools, "isEqual:"))
    && ((adjustedRankedTools = self->_adjustedRankedTools, !((unint64_t)adjustedRankedTools | v4[2]))
     || -[NSMutableArray isEqual:](adjustedRankedTools, "isEqual:"))
    && ((originalRankedSpans = self->_originalRankedSpans, !((unint64_t)originalRankedSpans | v4[3]))
     || -[NSMutableArray isEqual:](originalRankedSpans, "isEqual:")))
  {
    adjustedRankedSpans = self->_adjustedRankedSpans;
    if ((unint64_t)adjustedRankedSpans | v4[1]) {
      char v10 = -[NSMutableArray isEqual:](adjustedRankedSpans, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v6 = self->_requiredContexts;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v54;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v54 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addRequiredContext:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v8);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v12 = self->_originalRankedTools;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v50;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addOriginalRankedTools:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v14);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v18 = self->_adjustedRankedTools;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v46;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * v22) copyWithZone:a3];
        [v5 addAdjustedRankedTools:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v20);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v24 = self->_originalRankedSpans;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v42;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v42 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * v28) copyWithZone:a3];
        [v5 addOriginalRankedSpans:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v26);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v30 = self->_adjustedRankedSpans;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v57 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v38;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(v30);
        }
        long long v35 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v34), "copyWithZone:", a3, (void)v37);
        [v5 addAdjustedRankedSpans:v35];

        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v37 objects:v57 count:16];
    }
    while (v32);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v24 = a3;
  if ([(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self requiredContextsCount])
  {
    [v24 clearRequiredContexts];
    unint64_t v4 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self requiredContextsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self requiredContextAtIndex:i];
        [v24 addRequiredContext:v7];
      }
    }
  }
  if ([(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self originalRankedToolsCount])
  {
    [v24 clearOriginalRankedTools];
    unint64_t v8 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self originalRankedToolsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self originalRankedToolsAtIndex:j];
        [v24 addOriginalRankedTools:v11];
      }
    }
  }
  if ([(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self adjustedRankedToolsCount])
  {
    [v24 clearAdjustedRankedTools];
    unint64_t v12 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self adjustedRankedToolsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self adjustedRankedToolsAtIndex:k];
        [v24 addAdjustedRankedTools:v15];
      }
    }
  }
  if ([(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self originalRankedSpansCount])
  {
    [v24 clearOriginalRankedSpans];
    unint64_t v16 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self originalRankedSpansCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self originalRankedSpansAtIndex:m];
        [v24 addOriginalRankedSpans:v19];
      }
    }
  }
  if ([(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self adjustedRankedSpansCount])
  {
    [v24 clearAdjustedRankedSpans];
    unint64_t v20 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self adjustedRankedSpansCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self adjustedRankedSpansAtIndex:n];
        [v24 addAdjustedRankedSpans:v23];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  unint64_t v5 = self->_requiredContexts;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v10 = self->_originalRankedTools;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v15 = self->_adjustedRankedTools;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v20 = self->_originalRankedSpans;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v25 = self->_adjustedRankedSpans;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteStringField();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutputReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_requiredContexts count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_requiredContexts, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unint64_t v5 = self->_requiredContexts;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"required_context"];
  }
  originalRankedTools = self->_originalRankedTools;
  if (originalRankedTools) {
    [v3 setObject:originalRankedTools forKey:@"original_ranked_tools"];
  }
  adjustedRankedTools = self->_adjustedRankedTools;
  if (adjustedRankedTools) {
    [v3 setObject:adjustedRankedTools forKey:@"adjusted_ranked_tools"];
  }
  originalRankedSpans = self->_originalRankedSpans;
  if (originalRankedSpans) {
    [v3 setObject:originalRankedSpans forKey:@"original_ranked_spans"];
  }
  adjustedRankedSpans = self->_adjustedRankedSpans;
  if (adjustedRankedSpans) {
    [v3 setObject:adjustedRankedSpans forKey:@"adjusted_ranked_spans"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput;
  id v4 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALNLU_ROUTERQueryDecorationOutput *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)adjustedRankedSpansAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_adjustedRankedSpans objectAtIndex:a3];
}

- (unint64_t)adjustedRankedSpansCount
{
  return [(NSMutableArray *)self->_adjustedRankedSpans count];
}

- (void)addAdjustedRankedSpans:(id)a3
{
  id v4 = a3;
  adjustedRankedSpans = self->_adjustedRankedSpans;
  id v8 = v4;
  if (!adjustedRankedSpans)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_adjustedRankedSpans;
    self->_adjustedRankedSpans = v6;

    id v4 = v8;
    adjustedRankedSpans = self->_adjustedRankedSpans;
  }
  [(NSMutableArray *)adjustedRankedSpans addObject:v4];
}

- (void)clearAdjustedRankedSpans
{
}

- (id)originalRankedSpansAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_originalRankedSpans objectAtIndex:a3];
}

- (unint64_t)originalRankedSpansCount
{
  return [(NSMutableArray *)self->_originalRankedSpans count];
}

- (void)addOriginalRankedSpans:(id)a3
{
  id v4 = a3;
  originalRankedSpans = self->_originalRankedSpans;
  id v8 = v4;
  if (!originalRankedSpans)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_originalRankedSpans;
    self->_originalRankedSpans = v6;

    id v4 = v8;
    originalRankedSpans = self->_originalRankedSpans;
  }
  [(NSMutableArray *)originalRankedSpans addObject:v4];
}

- (void)clearOriginalRankedSpans
{
}

- (id)adjustedRankedToolsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_adjustedRankedTools objectAtIndex:a3];
}

- (unint64_t)adjustedRankedToolsCount
{
  return [(NSMutableArray *)self->_adjustedRankedTools count];
}

- (void)addAdjustedRankedTools:(id)a3
{
  id v4 = a3;
  adjustedRankedTools = self->_adjustedRankedTools;
  id v8 = v4;
  if (!adjustedRankedTools)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_adjustedRankedTools;
    self->_adjustedRankedTools = v6;

    id v4 = v8;
    adjustedRankedTools = self->_adjustedRankedTools;
  }
  [(NSMutableArray *)adjustedRankedTools addObject:v4];
}

- (void)clearAdjustedRankedTools
{
}

- (id)originalRankedToolsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_originalRankedTools objectAtIndex:a3];
}

- (unint64_t)originalRankedToolsCount
{
  return [(NSMutableArray *)self->_originalRankedTools count];
}

- (void)addOriginalRankedTools:(id)a3
{
  id v4 = a3;
  originalRankedTools = self->_originalRankedTools;
  id v8 = v4;
  if (!originalRankedTools)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_originalRankedTools;
    self->_originalRankedTools = v6;

    id v4 = v8;
    originalRankedTools = self->_originalRankedTools;
  }
  [(NSMutableArray *)originalRankedTools addObject:v4];
}

- (void)clearOriginalRankedTools
{
}

- (id)requiredContextAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_requiredContexts objectAtIndex:a3];
}

- (unint64_t)requiredContextsCount
{
  return [(NSMutableArray *)self->_requiredContexts count];
}

- (void)addRequiredContext:(id)a3
{
  id v4 = a3;
  requiredContexts = self->_requiredContexts;
  id v8 = v4;
  if (!requiredContexts)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_requiredContexts;
    self->_requiredContexts = v6;

    id v4 = v8;
    requiredContexts = self->_requiredContexts;
  }
  [(NSMutableArray *)requiredContexts addObject:v4];
}

- (void)clearRequiredContexts
{
}

+ (Class)adjustedRankedSpansType
{
  return (Class)objc_opt_class();
}

+ (Class)originalRankedSpansType
{
  return (Class)objc_opt_class();
}

+ (Class)adjustedRankedToolsType
{
  return (Class)objc_opt_class();
}

+ (Class)originalRankedToolsType
{
  return (Class)objc_opt_class();
}

+ (Class)requiredContextType
{
  return (Class)objc_opt_class();
}

@end