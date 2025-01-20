@interface PETSchemaPETUpload
- (BOOL)hasCompressed_data;
- (BOOL)hasCompressed_messages;
- (BOOL)hasIs_compressed;
- (BOOL)hasMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)is_compressed;
- (BOOL)readFrom:(id)a3;
- (NSArray)aggregated_messages;
- (NSArray)trial_messages;
- (NSArray)unaggregated_messages;
- (NSData)compressed_data;
- (NSData)compressed_messages;
- (NSData)jsonData;
- (PETSchemaPETMetadata)metadata;
- (PETSchemaPETUpload)initWithDictionary:(id)a3;
- (PETSchemaPETUpload)initWithJSON:(id)a3;
- (id)aggregated_messagesAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (id)trial_messagesAtIndex:(unint64_t)a3;
- (id)unaggregated_messagesAtIndex:(unint64_t)a3;
- (int)getAnyEventType;
- (unint64_t)aggregated_messagesCount;
- (unint64_t)hash;
- (unint64_t)trial_messagesCount;
- (unint64_t)unaggregated_messagesCount;
- (void)addAggregated_messages:(id)a3;
- (void)addTrial_messages:(id)a3;
- (void)addUnaggregated_messages:(id)a3;
- (void)clearAggregated_messages;
- (void)clearTrial_messages;
- (void)clearUnaggregated_messages;
- (void)deleteCompressed_data;
- (void)deleteCompressed_messages;
- (void)deleteIs_compressed;
- (void)deleteMetadata;
- (void)setAggregated_messages:(id)a3;
- (void)setCompressed_data:(id)a3;
- (void)setCompressed_messages:(id)a3;
- (void)setHasCompressed_data:(BOOL)a3;
- (void)setHasCompressed_messages:(BOOL)a3;
- (void)setHasIs_compressed:(BOOL)a3;
- (void)setHasMetadata:(BOOL)a3;
- (void)setIs_compressed:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setTrial_messages:(id)a3;
- (void)setUnaggregated_messages:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PETSchemaPETUpload

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PETSchemaPETUpload;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(PETSchemaPETUpload *)self metadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PETSchemaPETUpload *)self deleteMetadata];
  }
  v9 = [(PETSchemaPETUpload *)self aggregated_messages];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(PETSchemaPETUpload *)self setAggregated_messages:v10];

  v11 = [(PETSchemaPETUpload *)self unaggregated_messages];
  v12 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v11 underConditions:v4];
  [(PETSchemaPETUpload *)self setUnaggregated_messages:v12];

  v13 = [(PETSchemaPETUpload *)self trial_messages];
  v14 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v13 underConditions:v4];
  [(PETSchemaPETUpload *)self setTrial_messages:v14];

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressed_data, 0);
  objc_storeStrong((id *)&self->_trial_messages, 0);
  objc_storeStrong((id *)&self->_compressed_messages, 0);
  objc_storeStrong((id *)&self->_unaggregated_messages, 0);
  objc_storeStrong((id *)&self->_aggregated_messages, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)setHasCompressed_data:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasCompressed_messages:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasMetadata:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setCompressed_data:(id)a3
{
}

- (NSData)compressed_data
{
  return self->_compressed_data;
}

- (void)setTrial_messages:(id)a3
{
}

- (NSArray)trial_messages
{
  return self->_trial_messages;
}

- (void)setCompressed_messages:(id)a3
{
}

- (NSData)compressed_messages
{
  return self->_compressed_messages;
}

- (BOOL)is_compressed
{
  return self->_is_compressed;
}

- (void)setUnaggregated_messages:(id)a3
{
}

- (NSArray)unaggregated_messages
{
  return self->_unaggregated_messages;
}

- (void)setAggregated_messages:(id)a3
{
}

- (NSArray)aggregated_messages
{
  return self->_aggregated_messages;
}

- (void)setMetadata:(id)a3
{
}

- (PETSchemaPETMetadata)metadata
{
  return self->_metadata;
}

- (PETSchemaPETUpload)initWithDictionary:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PETSchemaPETUpload;
  v5 = [(PETSchemaPETUpload *)&v56 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"metadata"];
    objc_opt_class();
    v43 = (void *)v6;
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PETSchemaPETMetadata alloc] initWithDictionary:v6];
      [(PETSchemaPETUpload *)v5 setMetadata:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"aggregatedMessages"];
    objc_opt_class();
    v42 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v59 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v53 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[PETSchemaPETAggregatedMessage alloc] initWithDictionary:v14];
              [(PETSchemaPETUpload *)v5 addAggregated_messages:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v52 objects:v59 count:16];
        }
        while (v11);
      }
    }
    objc_super v16 = [v4 objectForKeyedSubscript:@"unaggregatedMessages"];
    objc_opt_class();
    v41 = v16;
    if (objc_opt_isKindOfClass())
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v49 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v48 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [[PETSchemaPETRawMessage alloc] initWithDictionary:v22];
              [(PETSchemaPETUpload *)v5 addUnaggregated_messages:v23];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v58 count:16];
        }
        while (v19);
      }
    }
    v24 = [v4 objectForKeyedSubscript:@"isCompressed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PETSchemaPETUpload setIs_compressed:](v5, "setIs_compressed:", [v24 BOOLValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"compressedMessages"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v25 options:0];
      [(PETSchemaPETUpload *)v5 setCompressed_messages:v26];
    }
    v27 = [v4 objectForKeyedSubscript:@"trialMessages"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = v25;
      v40 = v24;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v57 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v45;
        do
        {
          for (uint64_t k = 0; k != v30; ++k)
          {
            if (*(void *)v45 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v44 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v34 = [[PETSchemaPETRawMessage alloc] initWithDictionary:v33];
              [(PETSchemaPETUpload *)v5 addTrial_messages:v34];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v57 count:16];
        }
        while (v30);
      }

      v24 = v40;
      objc_super v16 = v41;
      v25 = v39;
    }
    v35 = [v4 objectForKeyedSubscript:@"compressedData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v35 options:0];
      [(PETSchemaPETUpload *)v5 setCompressed_data:v36];
    }
    v37 = v5;
  }
  return v5;
}

- (PETSchemaPETUpload)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PETSchemaPETUpload *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PETSchemaPETUpload *)self dictionaryRepresentation];
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
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_aggregated_messages count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v5 = self->_aggregated_messages;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v48 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v47 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"aggregatedMessages"];
  }
  if (self->_compressed_data)
  {
    uint64_t v12 = [(PETSchemaPETUpload *)self compressed_data];
    v13 = [v12 base64EncodedStringWithOptions:0];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"compressedData"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"compressedData"];
    }
  }
  if (self->_compressed_messages)
  {
    v15 = [(PETSchemaPETUpload *)self compressed_messages];
    objc_super v16 = [v15 base64EncodedStringWithOptions:0];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"compressedMessages"];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"compressedMessages"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[PETSchemaPETUpload is_compressed](self, "is_compressed"));
    [v3 setObject:v18 forKeyedSubscript:@"isCompressed"];
  }
  if (self->_metadata)
  {
    uint64_t v19 = [(PETSchemaPETUpload *)self metadata];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"metadata"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"metadata"];
    }
  }
  if ([(NSArray *)self->_trial_messages count])
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v23 = self->_trial_messages;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = [*(id *)(*((void *)&v43 + 1) + 8 * j) dictionaryRepresentation];
          if (v28)
          {
            [v22 addObject:v28];
          }
          else
          {
            uint64_t v29 = [MEMORY[0x1E4F1CA98] null];
            [v22 addObject:v29];
          }
        }
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKeyedSubscript:@"trialMessages"];
  }
  if ([(NSArray *)self->_unaggregated_messages count])
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v31 = self->_unaggregated_messages;
    uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v40 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * k), "dictionaryRepresentation", (void)v39);
          if (v36)
          {
            [v30 addObject:v36];
          }
          else
          {
            v37 = [MEMORY[0x1E4F1CA98] null];
            [v30 addObject:v37];
          }
        }
        uint64_t v33 = [(NSArray *)v31 countByEnumeratingWithState:&v39 objects:v51 count:16];
      }
      while (v33);
    }

    [v3 setObject:v30 forKeyedSubscript:@"unaggregatedMessages"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v39);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PETSchemaPETMetadata *)self->_metadata hash];
  uint64_t v4 = [(NSArray *)self->_aggregated_messages hash];
  uint64_t v5 = [(NSArray *)self->_unaggregated_messages hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_is_compressed;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6;
  uint64_t v8 = [(NSData *)self->_compressed_messages hash];
  uint64_t v9 = v8 ^ [(NSArray *)self->_trial_messages hash];
  return v7 ^ v9 ^ [(NSData *)self->_compressed_data hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  uint64_t v5 = [(PETSchemaPETUpload *)self metadata];
  uint64_t v6 = [v4 metadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v7 = [(PETSchemaPETUpload *)self metadata];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(PETSchemaPETUpload *)self metadata];
    uint64_t v10 = [v4 metadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PETSchemaPETUpload *)self aggregated_messages];
  uint64_t v6 = objc_msgSend(v4, "aggregated_messages");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v12 = [(PETSchemaPETUpload *)self aggregated_messages];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(PETSchemaPETUpload *)self aggregated_messages];
    v15 = objc_msgSend(v4, "aggregated_messages");
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PETSchemaPETUpload *)self unaggregated_messages];
  uint64_t v6 = objc_msgSend(v4, "unaggregated_messages");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v17 = [(PETSchemaPETUpload *)self unaggregated_messages];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(PETSchemaPETUpload *)self unaggregated_messages];
    uint64_t v20 = objc_msgSend(v4, "unaggregated_messages");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[64] & 1)) {
    goto LABEL_35;
  }
  if (*(unsigned char *)&self->_has)
  {
    int is_compressed = self->_is_compressed;
    if (is_compressed != objc_msgSend(v4, "is_compressed")) {
      goto LABEL_35;
    }
  }
  uint64_t v5 = [(PETSchemaPETUpload *)self compressed_messages];
  uint64_t v6 = objc_msgSend(v4, "compressed_messages");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v23 = [(PETSchemaPETUpload *)self compressed_messages];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    uint64_t v25 = [(PETSchemaPETUpload *)self compressed_messages];
    uint64_t v26 = objc_msgSend(v4, "compressed_messages");
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PETSchemaPETUpload *)self trial_messages];
  uint64_t v6 = objc_msgSend(v4, "trial_messages");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_34;
  }
  uint64_t v28 = [(PETSchemaPETUpload *)self trial_messages];
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    uint64_t v30 = [(PETSchemaPETUpload *)self trial_messages];
    uint64_t v31 = objc_msgSend(v4, "trial_messages");
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PETSchemaPETUpload *)self compressed_data];
  uint64_t v6 = objc_msgSend(v4, "compressed_data");
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v33 = [(PETSchemaPETUpload *)self compressed_data];
    if (!v33)
    {

LABEL_38:
      BOOL v38 = 1;
      goto LABEL_36;
    }
    uint64_t v34 = (void *)v33;
    v35 = [(PETSchemaPETUpload *)self compressed_data];
    v36 = objc_msgSend(v4, "compressed_data");
    char v37 = [v35 isEqual:v36];

    if (v37) {
      goto LABEL_38;
    }
  }
  else
  {
LABEL_34:
  }
LABEL_35:
  BOOL v38 = 0;
LABEL_36:

  return v38;
}

- (void)writeTo:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PETSchemaPETUpload *)self metadata];

  if (v5)
  {
    uint64_t v6 = [(PETSchemaPETUpload *)self metadata];
    PBDataWriterWriteSubmessage();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = self->_aggregated_messages;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v9);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = self->_unaggregated_messages;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v17 = [(PETSchemaPETUpload *)self compressed_messages];

  if (v17) {
    PBDataWriterWriteDataField();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v18 = self->_trial_messages;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v20);
  }

  uint64_t v23 = [(PETSchemaPETUpload *)self compressed_data];

  if (v23) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PETSchemaPETUploadReadFrom(self, (uint64_t)a3);
}

- (void)deleteCompressed_data
{
}

- (BOOL)hasCompressed_data
{
  return self->_compressed_data != 0;
}

- (id)trial_messagesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_trial_messages objectAtIndexedSubscript:a3];
}

- (unint64_t)trial_messagesCount
{
  return [(NSArray *)self->_trial_messages count];
}

- (void)addTrial_messages:(id)a3
{
  id v4 = a3;
  trial_messages = self->_trial_messages;
  id v8 = v4;
  if (!trial_messages)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_trial_messages;
    self->_trial_messages = v6;

    id v4 = v8;
    trial_messages = self->_trial_messages;
  }
  [(NSArray *)trial_messages addObject:v4];
}

- (void)clearTrial_messages
{
}

- (void)deleteCompressed_messages
{
}

- (BOOL)hasCompressed_messages
{
  return self->_compressed_messages != 0;
}

- (void)deleteIs_compressed
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIs_compressed:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIs_compressed
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIs_compressed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int is_compressed = a3;
}

- (id)unaggregated_messagesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_unaggregated_messages objectAtIndexedSubscript:a3];
}

- (unint64_t)unaggregated_messagesCount
{
  return [(NSArray *)self->_unaggregated_messages count];
}

- (void)addUnaggregated_messages:(id)a3
{
  id v4 = a3;
  unaggregated_messages = self->_unaggregated_messages;
  id v8 = v4;
  if (!unaggregated_messages)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_unaggregated_messages;
    self->_unaggregated_messages = v6;

    id v4 = v8;
    unaggregated_messages = self->_unaggregated_messages;
  }
  [(NSArray *)unaggregated_messages addObject:v4];
}

- (void)clearUnaggregated_messages
{
}

- (id)aggregated_messagesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_aggregated_messages objectAtIndexedSubscript:a3];
}

- (unint64_t)aggregated_messagesCount
{
  return [(NSArray *)self->_aggregated_messages count];
}

- (void)addAggregated_messages:(id)a3
{
  id v4 = a3;
  aggregated_messages = self->_aggregated_messages;
  id v8 = v4;
  if (!aggregated_messages)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_aggregated_messages;
    self->_aggregated_messages = v6;

    id v4 = v8;
    aggregated_messages = self->_aggregated_messages;
  }
  [(NSArray *)aggregated_messages addObject:v4];
}

- (void)clearAggregated_messages
{
}

- (void)deleteMetadata
{
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)qualifiedMessageName
{
  return @"com.apple.proactive.pet.PETUpload";
}

- (int)getAnyEventType
{
  return 5;
}

@end