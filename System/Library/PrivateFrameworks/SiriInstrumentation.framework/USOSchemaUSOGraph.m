@interface USOSchemaUSOGraph
- (BOOL)hasLinkId;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)alignments;
- (NSArray)edges;
- (NSArray)identifiers;
- (NSArray)nodes;
- (NSArray)spans;
- (NSData)jsonData;
- (SISchemaUUID)linkId;
- (SISchemaVersion)version;
- (USOSchemaUSOGraph)initWithDictionary:(id)a3;
- (USOSchemaUSOGraph)initWithJSON:(id)a3;
- (id)alignmentsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)edgesAtIndex:(unint64_t)a3;
- (id)identifiersAtIndex:(unint64_t)a3;
- (id)nodesAtIndex:(unint64_t)a3;
- (id)spansAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)alignmentsCount;
- (unint64_t)edgesCount;
- (unint64_t)hash;
- (unint64_t)identifiersCount;
- (unint64_t)nodesCount;
- (unint64_t)spansCount;
- (void)addAlignments:(id)a3;
- (void)addEdges:(id)a3;
- (void)addIdentifiers:(id)a3;
- (void)addNodes:(id)a3;
- (void)addSpans:(id)a3;
- (void)clearAlignments;
- (void)clearEdges;
- (void)clearIdentifiers;
- (void)clearNodes;
- (void)clearSpans;
- (void)deleteLinkId;
- (void)deleteVersion;
- (void)setAlignments:(id)a3;
- (void)setEdges:(id)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIdentifiers:(id)a3;
- (void)setLinkId:(id)a3;
- (void)setNodes:(id)a3;
- (void)setSpans:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOGraph

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)USOSchemaUSOGraph;
  v5 = [(SISchemaInstrumentationMessage *)&v23 applySensitiveConditionsPolicy:v4];
  v6 = [(USOSchemaUSOGraph *)self version];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(USOSchemaUSOGraph *)self deleteVersion];
  }
  v9 = [(USOSchemaUSOGraph *)self linkId];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(USOSchemaUSOGraph *)self deleteLinkId];
  }
  v12 = [(USOSchemaUSOGraph *)self nodes];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(USOSchemaUSOGraph *)self setNodes:v13];

  v14 = [(USOSchemaUSOGraph *)self edges];
  v15 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v14 underConditions:v4];
  [(USOSchemaUSOGraph *)self setEdges:v15];

  v16 = [(USOSchemaUSOGraph *)self identifiers];
  v17 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v16 underConditions:v4];
  [(USOSchemaUSOGraph *)self setIdentifiers:v17];

  v18 = [(USOSchemaUSOGraph *)self alignments];
  v19 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v18 underConditions:v4];
  [(USOSchemaUSOGraph *)self setAlignments:v19];

  v20 = [(USOSchemaUSOGraph *)self spans];
  v21 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v20 underConditions:v4];
  [(USOSchemaUSOGraph *)self setSpans:v21];

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
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_alignments, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (void)setSpans:(id)a3
{
}

- (NSArray)spans
{
  return self->_spans;
}

- (void)setAlignments:(id)a3
{
}

- (NSArray)alignments
{
  return self->_alignments;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setEdges:(id)a3
{
}

- (NSArray)edges
{
  return self->_edges;
}

- (void)setNodes:(id)a3
{
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (void)setVersion:(id)a3
{
}

- (SISchemaVersion)version
{
  return self->_version;
}

- (USOSchemaUSOGraph)initWithDictionary:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)USOSchemaUSOGraph;
  v5 = [(USOSchemaUSOGraph *)&v79 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaVersion alloc] initWithDictionary:v6];
      [(USOSchemaUSOGraph *)v5 setVersion:v7];
    }
    v55 = (void *)v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaUUID alloc] initWithDictionary:v8];
      [(USOSchemaUSOGraph *)v5 setLinkId:v9];
    }
    v54 = (void *)v8;
    v10 = [v4 objectForKeyedSubscript:@"nodes"];
    objc_opt_class();
    v58 = v10;
    if (objc_opt_isKindOfClass())
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v75 objects:v84 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v76;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v76 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v75 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = [[USOSchemaUSONode alloc] initWithDictionary:v16];
              [(USOSchemaUSOGraph *)v5 addNodes:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v75 objects:v84 count:16];
        }
        while (v13);
      }
    }
    v18 = [v4 objectForKeyedSubscript:@"edges"];
    objc_opt_class();
    v57 = v18;
    if (objc_opt_isKindOfClass())
    {
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v71 objects:v83 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v72;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v72 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v71 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v25 = [[USOSchemaUSOEdge alloc] initWithDictionary:v24];
              [(USOSchemaUSOGraph *)v5 addEdges:v25];
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v71 objects:v83 count:16];
        }
        while (v21);
      }
    }
    v26 = [v4 objectForKeyedSubscript:@"identifiers"];
    objc_opt_class();
    v56 = v26;
    if (objc_opt_isKindOfClass())
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v27 = v26;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v67 objects:v82 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v68;
        do
        {
          for (uint64_t k = 0; k != v29; ++k)
          {
            if (*(void *)v68 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v67 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v33 = [[USOSchemaUSOEntityIdentifier alloc] initWithDictionary:v32];
              [(USOSchemaUSOGraph *)v5 addIdentifiers:v33];
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v67 objects:v82 count:16];
        }
        while (v29);
      }
    }
    v34 = [v4 objectForKeyedSubscript:@"alignments"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v35 = v34;
      id v36 = v34;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v63 objects:v81 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v64;
        do
        {
          for (uint64_t m = 0; m != v38; ++m)
          {
            if (*(void *)v64 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = *(void *)(*((void *)&v63 + 1) + 8 * m);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v42 = [[USOSchemaUSOUtteranceAlignment alloc] initWithDictionary:v41];
              [(USOSchemaUSOGraph *)v5 addAlignments:v42];
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v63 objects:v81 count:16];
        }
        while (v38);
      }

      v34 = v35;
    }
    v43 = [v4 objectForKeyedSubscript:@"spans"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v53 = v34;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v44 = v43;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v59 objects:v80 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v60;
        do
        {
          for (uint64_t n = 0; n != v46; ++n)
          {
            if (*(void *)v60 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = *(void *)(*((void *)&v59 + 1) + 8 * n);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v50 = [[USOSchemaUSOEntitySpan alloc] initWithDictionary:v49];
              [(USOSchemaUSOGraph *)v5 addSpans:v50];
            }
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v59 objects:v80 count:16];
        }
        while (v46);
      }

      v34 = v53;
    }
    v51 = v5;
  }
  return v5;
}

- (USOSchemaUSOGraph)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOGraph *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOGraph *)self dictionaryRepresentation];
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
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_alignments count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    v5 = self->_alignments;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v67 objects:v75 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v68 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v67 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            id v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v67 objects:v75 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"alignments"];
  }
  if ([(NSArray *)self->_edges count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v13 = self->_edges;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v63 objects:v74 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v64 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v63 + 1) + 8 * j) dictionaryRepresentation];
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            id v19 = [MEMORY[0x1E4F1CA98] null];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v63 objects:v74 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"edges"];
  }
  if ([(NSArray *)self->_identifiers count])
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v21 = self->_identifiers;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v59 objects:v73 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v60;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v60 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v59 + 1) + 8 * k) dictionaryRepresentation];
          if (v26)
          {
            [v20 addObject:v26];
          }
          else
          {
            id v27 = [MEMORY[0x1E4F1CA98] null];
            [v20 addObject:v27];
          }
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v59 objects:v73 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"identifiers"];
  }
  if (self->_linkId)
  {
    uint64_t v28 = [(USOSchemaUSOGraph *)self linkId];
    uint64_t v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"linkId"];
    }
    else
    {
      uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"linkId"];
    }
  }
  if ([(NSArray *)self->_nodes count])
  {
    v31 = [MEMORY[0x1E4F1CA48] array];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v32 = self->_nodes;
    uint64_t v33 = [(NSArray *)v32 countByEnumeratingWithState:&v55 objects:v72 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v56;
      do
      {
        for (uint64_t m = 0; m != v34; ++m)
        {
          if (*(void *)v56 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = [*(id *)(*((void *)&v55 + 1) + 8 * m) dictionaryRepresentation];
          if (v37)
          {
            [v31 addObject:v37];
          }
          else
          {
            uint64_t v38 = [MEMORY[0x1E4F1CA98] null];
            [v31 addObject:v38];
          }
        }
        uint64_t v34 = [(NSArray *)v32 countByEnumeratingWithState:&v55 objects:v72 count:16];
      }
      while (v34);
    }

    [v3 setObject:v31 forKeyedSubscript:@"nodes"];
  }
  if ([(NSArray *)self->_spans count])
  {
    uint64_t v39 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v40 = self->_spans;
    uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v51 objects:v71 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v52;
      do
      {
        for (uint64_t n = 0; n != v42; ++n)
        {
          if (*(void *)v52 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * n), "dictionaryRepresentation", (void)v51);
          if (v45)
          {
            [v39 addObject:v45];
          }
          else
          {
            uint64_t v46 = [MEMORY[0x1E4F1CA98] null];
            [v39 addObject:v46];
          }
        }
        uint64_t v42 = [(NSArray *)v40 countByEnumeratingWithState:&v51 objects:v71 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKeyedSubscript:@"spans"];
  }
  if (self->_version)
  {
    uint64_t v47 = [(USOSchemaUSOGraph *)self version];
    v48 = [v47 dictionaryRepresentation];
    if (v48)
    {
      [v3 setObject:v48 forKeyedSubscript:@"version"];
    }
    else
    {
      uint64_t v49 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v49 forKeyedSubscript:@"version"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v51);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaVersion *)self->_version hash];
  unint64_t v4 = [(SISchemaUUID *)self->_linkId hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_nodes hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_edges hash];
  uint64_t v7 = [(NSArray *)self->_identifiers hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_alignments hash];
  return v6 ^ v8 ^ [(NSArray *)self->_spans hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  uint64_t v5 = [(USOSchemaUSOGraph *)self version];
  uint64_t v6 = [v4 version];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(USOSchemaUSOGraph *)self version];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(USOSchemaUSOGraph *)self version];
    v10 = [v4 version];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(USOSchemaUSOGraph *)self linkId];
  uint64_t v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(USOSchemaUSOGraph *)self linkId];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(USOSchemaUSOGraph *)self linkId];
    uint64_t v15 = [v4 linkId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(USOSchemaUSOGraph *)self nodes];
  uint64_t v6 = [v4 nodes];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(USOSchemaUSOGraph *)self nodes];
  if (v17)
  {
    v18 = (void *)v17;
    id v19 = [(USOSchemaUSOGraph *)self nodes];
    uint64_t v20 = [v4 nodes];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(USOSchemaUSOGraph *)self edges];
  uint64_t v6 = [v4 edges];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v22 = [(USOSchemaUSOGraph *)self edges];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(USOSchemaUSOGraph *)self edges];
    v25 = [v4 edges];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(USOSchemaUSOGraph *)self identifiers];
  uint64_t v6 = [v4 identifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(USOSchemaUSOGraph *)self identifiers];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    uint64_t v29 = [(USOSchemaUSOGraph *)self identifiers];
    uint64_t v30 = [v4 identifiers];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(USOSchemaUSOGraph *)self alignments];
  uint64_t v6 = [v4 alignments];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v32 = [(USOSchemaUSOGraph *)self alignments];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    uint64_t v34 = [(USOSchemaUSOGraph *)self alignments];
    uint64_t v35 = [v4 alignments];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v5 = [(USOSchemaUSOGraph *)self spans];
  uint64_t v6 = [v4 spans];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v37 = [(USOSchemaUSOGraph *)self spans];
    if (!v37)
    {

LABEL_40:
      BOOL v42 = 1;
      goto LABEL_38;
    }
    uint64_t v38 = (void *)v37;
    uint64_t v39 = [(USOSchemaUSOGraph *)self spans];
    v40 = [v4 spans];
    char v41 = [v39 isEqual:v40];

    if (v41) {
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
  }
LABEL_37:
  BOOL v42 = 0;
LABEL_38:

  return v42;
}

- (void)writeTo:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(USOSchemaUSOGraph *)self version];

  if (v5)
  {
    uint64_t v6 = [(USOSchemaUSOGraph *)self version];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(USOSchemaUSOGraph *)self linkId];

  if (v7)
  {
    uint64_t v8 = [(USOSchemaUSOGraph *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v9 = self->_nodes;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v51;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v11);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v14 = self->_edges;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v47;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v47 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v16);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v19 = self->_identifiers;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v42 objects:v56 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v43;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v43 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v42 objects:v56 count:16];
    }
    while (v21);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v24 = self->_alignments;
  uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v38 objects:v55 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v39;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(v24);
        }
        PBDataWriterWriteSubmessage();
        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v38 objects:v55 count:16];
    }
    while (v26);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v29 = self->_spans;
  uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v34 objects:v54 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v35;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(v29);
        }
        PBDataWriterWriteSubmessage();
        ++v33;
      }
      while (v31 != v33);
      uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v34 objects:v54 count:16];
    }
    while (v31);
  }
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOGraphReadFrom(self, (uint64_t)a3);
}

- (id)spansAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_spans objectAtIndexedSubscript:a3];
}

- (unint64_t)spansCount
{
  return [(NSArray *)self->_spans count];
}

- (void)addSpans:(id)a3
{
  id v4 = a3;
  spans = self->_spans;
  id v8 = v4;
  if (!spans)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_spans;
    self->_spans = v6;

    id v4 = v8;
    spans = self->_spans;
  }
  [(NSArray *)spans addObject:v4];
}

- (void)clearSpans
{
}

- (id)alignmentsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_alignments objectAtIndexedSubscript:a3];
}

- (unint64_t)alignmentsCount
{
  return [(NSArray *)self->_alignments count];
}

- (void)addAlignments:(id)a3
{
  id v4 = a3;
  alignments = self->_alignments;
  id v8 = v4;
  if (!alignments)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_alignments;
    self->_alignments = v6;

    id v4 = v8;
    alignments = self->_alignments;
  }
  [(NSArray *)alignments addObject:v4];
}

- (void)clearAlignments
{
}

- (id)identifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_identifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)identifiersCount
{
  return [(NSArray *)self->_identifiers count];
}

- (void)addIdentifiers:(id)a3
{
  id v4 = a3;
  identifiers = self->_identifiers;
  id v8 = v4;
  if (!identifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_identifiers;
    self->_identifiers = v6;

    id v4 = v8;
    identifiers = self->_identifiers;
  }
  [(NSArray *)identifiers addObject:v4];
}

- (void)clearIdentifiers
{
}

- (id)edgesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_edges objectAtIndexedSubscript:a3];
}

- (unint64_t)edgesCount
{
  return [(NSArray *)self->_edges count];
}

- (void)addEdges:(id)a3
{
  id v4 = a3;
  edges = self->_edges;
  id v8 = v4;
  if (!edges)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_edges;
    self->_edges = v6;

    id v4 = v8;
    edges = self->_edges;
  }
  [(NSArray *)edges addObject:v4];
}

- (void)clearEdges
{
}

- (id)nodesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_nodes objectAtIndexedSubscript:a3];
}

- (unint64_t)nodesCount
{
  return [(NSArray *)self->_nodes count];
}

- (void)addNodes:(id)a3
{
  id v4 = a3;
  nodes = self->_nodes;
  id v8 = v4;
  if (!nodes)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_nodes;
    self->_nodes = v6;

    id v4 = v8;
    nodes = self->_nodes;
  }
  [(NSArray *)nodes addObject:v4];
}

- (void)clearNodes
{
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteVersion
{
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

@end