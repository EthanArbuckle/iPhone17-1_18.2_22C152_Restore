@interface _SFPBRFTableHeaderCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)cells;
- (NSArray)columns;
- (NSArray)compact_cells;
- (NSData)jsonData;
- (_SFPBRFTableHeaderCardSection)initWithDictionary:(id)a3;
- (_SFPBRFTableHeaderCardSection)initWithFacade:(id)a3;
- (_SFPBRFTableHeaderCardSection)initWithJSON:(id)a3;
- (id)cellsAtIndex:(unint64_t)a3;
- (id)columnsAtIndex:(unint64_t)a3;
- (id)compact_cellsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (int)should_repeat_header_in_flow_layout;
- (int)vertical_alignment;
- (unint64_t)cellsCount;
- (unint64_t)columnsCount;
- (unint64_t)compact_cellsCount;
- (unint64_t)hash;
- (void)addCells:(id)a3;
- (void)addColumns:(id)a3;
- (void)addCompact_cells:(id)a3;
- (void)clearCells;
- (void)clearColumns;
- (void)clearCompact_cells;
- (void)setCells:(id)a3;
- (void)setColumns:(id)a3;
- (void)setCompact_cells:(id)a3;
- (void)setShould_repeat_header_in_flow_layout:(int)a3;
- (void)setVertical_alignment:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFTableHeaderCardSection

- (_SFPBRFTableHeaderCardSection)initWithFacade:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFTableHeaderCardSection *)self init];
  if (v5)
  {
    v6 = [v4 columns];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v8 = [v4 columns];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBRFTableColumnDefinition alloc] initWithFacade:*(void *)(*((void *)&v41 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v10);
    }

    [(_SFPBRFTableHeaderCardSection *)v5 setColumns:v7];
    v14 = [v4 cells];
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v16 = [v4 cells];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v38 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[_SFPBRFTableCell alloc] initWithFacade:*(void *)(*((void *)&v37 + 1) + 8 * j)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v18);
    }

    [(_SFPBRFTableHeaderCardSection *)v5 setCells:v15];
    v22 = objc_msgSend(v4, "compact_cells");
    v32 = v5;
    if (v22) {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v23 = 0;
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v24 = objc_msgSend(v4, "compact_cells");
    uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [[_SFPBRFTableCell alloc] initWithFacade:*(void *)(*((void *)&v33 + 1) + 8 * k)];
          if (v29) {
            [v23 addObject:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v26);
    }

    v5 = v32;
    [(_SFPBRFTableHeaderCardSection *)v32 setCompact_cells:v23];
    if (objc_msgSend(v4, "hasShould_repeat_header_in_flow_layout")) {
      -[_SFPBRFTableHeaderCardSection setShould_repeat_header_in_flow_layout:](v32, "setShould_repeat_header_in_flow_layout:", objc_msgSend(v4, "should_repeat_header_in_flow_layout"));
    }
    if (objc_msgSend(v4, "hasVertical_alignment")) {
      -[_SFPBRFTableHeaderCardSection setVertical_alignment:](v32, "setVertical_alignment:", objc_msgSend(v4, "vertical_alignment"));
    }
    v30 = v32;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compact_cells, 0);
  objc_storeStrong((id *)&self->_cells, 0);
  objc_storeStrong((id *)&self->_columns, 0);
}

- (int)vertical_alignment
{
  return self->_vertical_alignment;
}

- (int)should_repeat_header_in_flow_layout
{
  return self->_should_repeat_header_in_flow_layout;
}

- (NSArray)compact_cells
{
  return self->_compact_cells;
}

- (NSArray)cells
{
  return self->_cells;
}

- (NSArray)columns
{
  return self->_columns;
}

- (_SFPBRFTableHeaderCardSection)initWithDictionary:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)_SFPBRFTableHeaderCardSection;
  v5 = [(_SFPBRFTableHeaderCardSection *)&v49 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"columns"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v46 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[_SFPBRFTableColumnDefinition alloc] initWithDictionary:v13];
              [(_SFPBRFTableHeaderCardSection *)v5 addColumns:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
        }
        while (v10);
      }

      v6 = v7;
    }
    id v15 = [v4 objectForKeyedSubscript:@"cells"];
    objc_opt_class();
    long long v36 = v15;
    if (objc_opt_isKindOfClass())
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v42 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v41 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = [[_SFPBRFTableCell alloc] initWithDictionary:v21];
              [(_SFPBRFTableHeaderCardSection *)v5 addCells:v22];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v51 count:16];
        }
        while (v18);
      }
    }
    id v23 = [v4 objectForKeyedSubscript:@"compactCells"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v35 = v6;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v50 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v38;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v38 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v30 = [[_SFPBRFTableCell alloc] initWithDictionary:v29];
              [(_SFPBRFTableHeaderCardSection *)v5 addCompact_cells:v30];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v50 count:16];
        }
        while (v26);
      }

      v6 = v35;
      id v15 = v36;
    }
    v31 = objc_msgSend(v4, "objectForKeyedSubscript:", @"shouldRepeatHeaderInFlowLayout", v35);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableHeaderCardSection setShould_repeat_header_in_flow_layout:](v5, "setShould_repeat_header_in_flow_layout:", [v31 intValue]);
    }
    v32 = [v4 objectForKeyedSubscript:@"verticalAlignment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableHeaderCardSection setVertical_alignment:](v5, "setVertical_alignment:", [v32 intValue]);
    }
    long long v33 = v5;
  }
  return v5;
}

- (_SFPBRFTableHeaderCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFTableHeaderCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFTableHeaderCardSection *)self dictionaryRepresentation];
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
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_cells count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v5 = self->_cells;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v42 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v41 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"cells"];
  }
  if ([(NSArray *)self->_columns count])
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v13 = self->_columns;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [*(id *)(*((void *)&v37 + 1) + 8 * j) dictionaryRepresentation];
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"columns"];
  }
  if ([(NSArray *)self->_compact_cells count])
  {
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v21 = self->_compact_cells;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v34;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v34 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [*(id *)(*((void *)&v33 + 1) + 8 * k) dictionaryRepresentation];
          if (v26)
          {
            [v20 addObject:v26];
          }
          else
          {
            uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
            [v20 addObject:v27];
          }
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"compactCells"];
  }
  if (self->_should_repeat_header_in_flow_layout)
  {
    uint64_t v28 = [(_SFPBRFTableHeaderCardSection *)self should_repeat_header_in_flow_layout];
    if (v28 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v28);
      uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v29 = off_1E5A2F058[v28];
    }
    [v3 setObject:v29 forKeyedSubscript:@"shouldRepeatHeaderInFlowLayout"];
  }
  if (self->_vertical_alignment)
  {
    uint64_t v30 = [(_SFPBRFTableHeaderCardSection *)self vertical_alignment];
    if (v30 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v30);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E5A2EFD8[v30];
    }
    [v3 setObject:v31 forKeyedSubscript:@"verticalAlignment"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_columns hash];
  uint64_t v4 = [(NSArray *)self->_cells hash];
  return v4 ^ v3 ^ [(NSArray *)self->_compact_cells hash] ^ (2654435761
                                                                  * self->_should_repeat_header_in_flow_layout) ^ (2654435761 * self->_vertical_alignment);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBRFTableHeaderCardSection *)self columns];
  uint64_t v6 = [v4 columns];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBRFTableHeaderCardSection *)self columns];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRFTableHeaderCardSection *)self columns];
    uint64_t v10 = [v4 columns];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFTableHeaderCardSection *)self cells];
  uint64_t v6 = [v4 cells];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBRFTableHeaderCardSection *)self cells];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRFTableHeaderCardSection *)self cells];
    uint64_t v15 = [v4 cells];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBRFTableHeaderCardSection *)self compact_cells];
  uint64_t v6 = objc_msgSend(v4, "compact_cells");
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v17 = [(_SFPBRFTableHeaderCardSection *)self compact_cells];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRFTableHeaderCardSection *)self compact_cells];
    v20 = objc_msgSend(v4, "compact_cells");
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  int should_repeat_header_in_flow_layout = self->_should_repeat_header_in_flow_layout;
  if (should_repeat_header_in_flow_layout == objc_msgSend(v4, "should_repeat_header_in_flow_layout"))
  {
    int vertical_alignment = self->_vertical_alignment;
    BOOL v22 = vertical_alignment == objc_msgSend(v4, "vertical_alignment");
    goto LABEL_18;
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFTableHeaderCardSection *)self columns];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_SFPBRFTableHeaderCardSection *)self cells];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  uint64_t v15 = [(_SFPBRFTableHeaderCardSection *)self compact_cells];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if ([(_SFPBRFTableHeaderCardSection *)self should_repeat_header_in_flow_layout]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRFTableHeaderCardSection *)self vertical_alignment]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTableHeaderCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setVertical_alignment:(int)a3
{
  self->_int vertical_alignment = a3;
}

- (void)setShould_repeat_header_in_flow_layout:(int)a3
{
  self->_int should_repeat_header_in_flow_layout = a3;
}

- (id)compact_cellsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_compact_cells objectAtIndexedSubscript:a3];
}

- (unint64_t)compact_cellsCount
{
  return [(NSArray *)self->_compact_cells count];
}

- (void)addCompact_cells:(id)a3
{
  id v4 = a3;
  compact_cells = self->_compact_cells;
  id v8 = v4;
  if (!compact_cells)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_compact_cells;
    self->_compact_cells = v6;

    id v4 = v8;
    compact_cells = self->_compact_cells;
  }
  [(NSArray *)compact_cells addObject:v4];
}

- (void)clearCompact_cells
{
}

- (void)setCompact_cells:(id)a3
{
  self->_compact_cells = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)cellsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_cells objectAtIndexedSubscript:a3];
}

- (unint64_t)cellsCount
{
  return [(NSArray *)self->_cells count];
}

- (void)addCells:(id)a3
{
  id v4 = a3;
  cells = self->_cells;
  id v8 = v4;
  if (!cells)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_cells;
    self->_cells = v6;

    id v4 = v8;
    cells = self->_cells;
  }
  [(NSArray *)cells addObject:v4];
}

- (void)clearCells
{
}

- (void)setCells:(id)a3
{
  self->_cells = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)columnsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_columns objectAtIndexedSubscript:a3];
}

- (unint64_t)columnsCount
{
  return [(NSArray *)self->_columns count];
}

- (void)addColumns:(id)a3
{
  id v4 = a3;
  columns = self->_columns;
  id v8 = v4;
  if (!columns)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_columns;
    self->_columns = v6;

    id v4 = v8;
    columns = self->_columns;
  }
  [(NSArray *)columns addObject:v4];
}

- (void)clearColumns
{
}

- (void)setColumns:(id)a3
{
  self->_columns = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end