@interface SIRINLUEXTERNALUsoGraph
+ (Class)alignmentsType;
+ (Class)edgesType;
+ (Class)identifiersType;
+ (Class)nodesType;
+ (Class)spansType;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)alignments;
- (NSMutableArray)edges;
- (NSMutableArray)identifiers;
- (NSMutableArray)nodes;
- (NSMutableArray)spans;
- (SIRINLUEXTERNALSemVer)version;
- (id)alignmentsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)edgesAtIndex:(unint64_t)a3;
- (id)identifiersAtIndex:(unint64_t)a3;
- (id)nodesAtIndex:(unint64_t)a3;
- (id)spansAtIndex:(unint64_t)a3;
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
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlignments:(id)a3;
- (void)setEdges:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setNodes:(id)a3;
- (void)setSpans:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUsoGraph

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_spans, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_alignments, 0);
}

- (void)setSpans:(id)a3
{
}

- (NSMutableArray)spans
{
  return self->_spans;
}

- (void)setAlignments:(id)a3
{
}

- (NSMutableArray)alignments
{
  return self->_alignments;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (void)setEdges:(id)a3
{
}

- (NSMutableArray)edges
{
  return self->_edges;
}

- (void)setNodes:(id)a3
{
}

- (NSMutableArray)nodes
{
  return self->_nodes;
}

- (void)setVersion:(id)a3
{
}

- (SIRINLUEXTERNALSemVer)version
{
  return self->_version;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  versiouint64_t n = self->_version;
  uint64_t v6 = *((void *)v4 + 6);
  if (version)
  {
    if (v6) {
      -[SIRINLUEXTERNALSemVer mergeFrom:](version, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALUsoGraph setVersion:](self, "setVersion:");
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v49 != v10) {
          objc_enumerationMutation(v7);
        }
        [(SIRINLUEXTERNALUsoGraph *)self addNodes:*(void *)(*((void *)&v48 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v9);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v12 = *((id *)v4 + 2);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        [(SIRINLUEXTERNALUsoGraph *)self addEdges:*(void *)(*((void *)&v44 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v14);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v17 = *((id *)v4 + 3);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        [(SIRINLUEXTERNALUsoGraph *)self addIdentifiers:*(void *)(*((void *)&v40 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v19);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v22 = *((id *)v4 + 1);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v37;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v22);
        }
        [(SIRINLUEXTERNALUsoGraph *)self addAlignments:*(void *)(*((void *)&v36 + 1) + 8 * m)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v53 count:16];
    }
    while (v24);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v27 = *((id *)v4 + 5);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v27);
        }
        -[SIRINLUEXTERNALUsoGraph addSpans:](self, "addSpans:", *(void *)(*((void *)&v32 + 1) + 8 * n), (void)v32);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v32 objects:v52 count:16];
    }
    while (v29);
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALSemVer *)self->_version hash];
  uint64_t v4 = [(NSMutableArray *)self->_nodes hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_edges hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_identifiers hash];
  uint64_t v7 = [(NSMutableArray *)self->_alignments hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_spans hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((versiouint64_t n = self->_version, !((unint64_t)version | v4[6]))
     || -[SIRINLUEXTERNALSemVer isEqual:](version, "isEqual:"))
    && ((nodes = self->_nodes, !((unint64_t)nodes | v4[4]))
     || -[NSMutableArray isEqual:](nodes, "isEqual:"))
    && ((edges = self->_edges, !((unint64_t)edges | v4[2]))
     || -[NSMutableArray isEqual:](edges, "isEqual:"))
    && ((identifiers = self->_identifiers, !((unint64_t)identifiers | v4[3]))
     || -[NSMutableArray isEqual:](identifiers, "isEqual:"))
    && ((alignments = self->_alignments, !((unint64_t)alignments | v4[1]))
     || -[NSMutableArray isEqual:](alignments, "isEqual:")))
  {
    spans = self->_spans;
    if ((unint64_t)spans | v4[5]) {
      char v11 = -[NSMutableArray isEqual:](spans, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALSemVer *)self->_version copyWithZone:a3];
  uint64_t v7 = (void *)v5[6];
  v5[6] = v6;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v8 = self->_nodes;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v56;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addNodes:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v10);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v14 = self->_edges;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v52;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * v18) copyWithZone:a3];
        [v5 addEdges:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v16);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v20 = self->_identifiers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v48;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * v24) copyWithZone:a3];
        [v5 addIdentifiers:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v22);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v26 = self->_alignments;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v43 objects:v60 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v30) copyWithZone:a3];
        [v5 addAlignments:v31];

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v43 objects:v60 count:16];
    }
    while (v28);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v32 = self->_spans;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v40;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v40 != v35) {
          objc_enumerationMutation(v32);
        }
        long long v37 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * v36), "copyWithZone:", a3, (void)v39);
        [v5 addSpans:v37];

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v39 objects:v59 count:16];
    }
    while (v34);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v24 = a3;
  if (self->_version) {
    objc_msgSend(v24, "setVersion:");
  }
  if ([(SIRINLUEXTERNALUsoGraph *)self nodesCount])
  {
    [v24 clearNodes];
    unint64_t v4 = [(SIRINLUEXTERNALUsoGraph *)self nodesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(SIRINLUEXTERNALUsoGraph *)self nodesAtIndex:i];
        [v24 addNodes:v7];
      }
    }
  }
  if ([(SIRINLUEXTERNALUsoGraph *)self edgesCount])
  {
    [v24 clearEdges];
    unint64_t v8 = [(SIRINLUEXTERNALUsoGraph *)self edgesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(SIRINLUEXTERNALUsoGraph *)self edgesAtIndex:j];
        [v24 addEdges:v11];
      }
    }
  }
  if ([(SIRINLUEXTERNALUsoGraph *)self identifiersCount])
  {
    [v24 clearIdentifiers];
    unint64_t v12 = [(SIRINLUEXTERNALUsoGraph *)self identifiersCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(SIRINLUEXTERNALUsoGraph *)self identifiersAtIndex:k];
        [v24 addIdentifiers:v15];
      }
    }
  }
  if ([(SIRINLUEXTERNALUsoGraph *)self alignmentsCount])
  {
    [v24 clearAlignments];
    unint64_t v16 = [(SIRINLUEXTERNALUsoGraph *)self alignmentsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(SIRINLUEXTERNALUsoGraph *)self alignmentsAtIndex:m];
        [v24 addAlignments:v19];
      }
    }
  }
  if ([(SIRINLUEXTERNALUsoGraph *)self spansCount])
  {
    [v24 clearSpans];
    unint64_t v20 = [(SIRINLUEXTERNALUsoGraph *)self spansCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(SIRINLUEXTERNALUsoGraph *)self spansAtIndex:n];
        [v24 addSpans:v23];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_version) {
    PBDataWriterWriteSubmessage();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  unint64_t v5 = self->_nodes;
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
  uint64_t v10 = self->_edges;
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
        PBDataWriterWriteSubmessage();
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
  uint64_t v15 = self->_identifiers;
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
        PBDataWriterWriteSubmessage();
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
  unint64_t v20 = self->_alignments;
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
        PBDataWriterWriteSubmessage();
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
  uint64_t v25 = self->_spans;
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
        PBDataWriterWriteSubmessage();
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
  return SIRINLUEXTERNALUsoGraphReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  versiouint64_t n = self->_version;
  if (version)
  {
    unint64_t v5 = [(SIRINLUEXTERNALSemVer *)version dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"version"];
  }
  if ([(NSMutableArray *)self->_nodes count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_nodes, "count"));
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v7 = self->_nodes;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v59 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v58 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"nodes"];
  }
  if ([(NSMutableArray *)self->_edges count])
  {
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_edges, "count"));
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v14 = self->_edges;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v55 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [*(id *)(*((void *)&v54 + 1) + 8 * j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v54 objects:v65 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"edges"];
  }
  if ([(NSMutableArray *)self->_identifiers count])
  {
    unint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_identifiers, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v21 = self->_identifiers;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v50 objects:v64 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v51;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v51 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [*(id *)(*((void *)&v50 + 1) + 8 * k) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v50 objects:v64 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"identifiers"];
  }
  if ([(NSMutableArray *)self->_alignments count])
  {
    uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_alignments, "count"));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v28 = self->_alignments;
    uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v46 objects:v63 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v47;
      do
      {
        for (uint64_t m = 0; m != v30; ++m)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v28);
          }
          long long v33 = [*(id *)(*((void *)&v46 + 1) + 8 * m) dictionaryRepresentation];
          [v27 addObject:v33];
        }
        uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v46 objects:v63 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKey:@"alignments"];
  }
  if ([(NSMutableArray *)self->_spans count])
  {
    long long v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_spans, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v35 = self->_spans;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v62 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v43;
      do
      {
        for (uint64_t n = 0; n != v37; ++n)
        {
          if (*(void *)v43 != v38) {
            objc_enumerationMutation(v35);
          }
          long long v40 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * n), "dictionaryRepresentation", (void)v42);
          [v34 addObject:v40];
        }
        uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v62 count:16];
      }
      while (v37);
    }

    [v3 setObject:v34 forKey:@"spans"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUsoGraph;
  id v4 = [(SIRINLUEXTERNALUsoGraph *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALUsoGraph *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)spansAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_spans objectAtIndex:a3];
}

- (unint64_t)spansCount
{
  return [(NSMutableArray *)self->_spans count];
}

- (void)addSpans:(id)a3
{
  id v4 = a3;
  spans = self->_spans;
  id v8 = v4;
  if (!spans)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_spans;
    self->_spans = v6;

    id v4 = v8;
    spans = self->_spans;
  }
  [(NSMutableArray *)spans addObject:v4];
}

- (void)clearSpans
{
}

- (id)alignmentsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_alignments objectAtIndex:a3];
}

- (unint64_t)alignmentsCount
{
  return [(NSMutableArray *)self->_alignments count];
}

- (void)addAlignments:(id)a3
{
  id v4 = a3;
  alignments = self->_alignments;
  id v8 = v4;
  if (!alignments)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_alignments;
    self->_alignments = v6;

    id v4 = v8;
    alignments = self->_alignments;
  }
  [(NSMutableArray *)alignments addObject:v4];
}

- (void)clearAlignments
{
}

- (id)identifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_identifiers objectAtIndex:a3];
}

- (unint64_t)identifiersCount
{
  return [(NSMutableArray *)self->_identifiers count];
}

- (void)addIdentifiers:(id)a3
{
  id v4 = a3;
  identifiers = self->_identifiers;
  id v8 = v4;
  if (!identifiers)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_identifiers;
    self->_identifiers = v6;

    id v4 = v8;
    identifiers = self->_identifiers;
  }
  [(NSMutableArray *)identifiers addObject:v4];
}

- (void)clearIdentifiers
{
}

- (id)edgesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_edges objectAtIndex:a3];
}

- (unint64_t)edgesCount
{
  return [(NSMutableArray *)self->_edges count];
}

- (void)addEdges:(id)a3
{
  id v4 = a3;
  edges = self->_edges;
  id v8 = v4;
  if (!edges)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_edges;
    self->_edges = v6;

    id v4 = v8;
    edges = self->_edges;
  }
  [(NSMutableArray *)edges addObject:v4];
}

- (void)clearEdges
{
}

- (id)nodesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nodes objectAtIndex:a3];
}

- (unint64_t)nodesCount
{
  return [(NSMutableArray *)self->_nodes count];
}

- (void)addNodes:(id)a3
{
  id v4 = a3;
  nodes = self->_nodes;
  id v8 = v4;
  if (!nodes)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_nodes;
    self->_nodes = v6;

    id v4 = v8;
    nodes = self->_nodes;
  }
  [(NSMutableArray *)nodes addObject:v4];
}

- (void)clearNodes
{
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

+ (Class)spansType
{
  return (Class)objc_opt_class();
}

+ (Class)alignmentsType
{
  return (Class)objc_opt_class();
}

+ (Class)identifiersType
{
  return (Class)objc_opt_class();
}

+ (Class)edgesType
{
  return (Class)objc_opt_class();
}

+ (Class)nodesType
{
  return (Class)objc_opt_class();
}

@end