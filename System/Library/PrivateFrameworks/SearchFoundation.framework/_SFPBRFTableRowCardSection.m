@interface _SFPBRFTableRowCardSection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)scale_to_fit;
- (NSArray)cells;
- (NSArray)compact_cells;
- (NSData)jsonData;
- (_SFPBRFTableRowCardSection)initWithDictionary:(id)a3;
- (_SFPBRFTableRowCardSection)initWithFacade:(id)a3;
- (_SFPBRFTableRowCardSection)initWithJSON:(id)a3;
- (id)cellsAtIndex:(unint64_t)a3;
- (id)compact_cellsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (int)vertical_alignment;
- (unint64_t)cellsCount;
- (unint64_t)compact_cellsCount;
- (unint64_t)hash;
- (void)addCells:(id)a3;
- (void)addCompact_cells:(id)a3;
- (void)clearCells;
- (void)clearCompact_cells;
- (void)setCells:(id)a3;
- (void)setCompact_cells:(id)a3;
- (void)setScale_to_fit:(BOOL)a3;
- (void)setVertical_alignment:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFTableRowCardSection

- (_SFPBRFTableRowCardSection)initWithFacade:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFTableRowCardSection *)self init];
  if (v5)
  {
    v6 = [v4 cells];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v8 = [v4 cells];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBRFTableCell alloc] initWithFacade:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    [(_SFPBRFTableRowCardSection *)v5 setCells:v7];
    if (objc_msgSend(v4, "hasVertical_alignment")) {
      -[_SFPBRFTableRowCardSection setVertical_alignment:](v5, "setVertical_alignment:", objc_msgSend(v4, "vertical_alignment"));
    }
    if (objc_msgSend(v4, "hasScale_to_fit")) {
      -[_SFPBRFTableRowCardSection setScale_to_fit:](v5, "setScale_to_fit:", objc_msgSend(v4, "scale_to_fit"));
    }
    v14 = objc_msgSend(v4, "compact_cells");
    if (v14) {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v15 = 0;
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v16 = objc_msgSend(v4, "compact_cells", 0);
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [[_SFPBRFTableCell alloc] initWithFacade:*(void *)(*((void *)&v24 + 1) + 8 * j)];
          if (v21) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v18);
    }

    [(_SFPBRFTableRowCardSection *)v5 setCompact_cells:v15];
    v22 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compact_cells, 0);
  objc_storeStrong((id *)&self->_cells, 0);
}

- (NSArray)compact_cells
{
  return self->_compact_cells;
}

- (BOOL)scale_to_fit
{
  return self->_scale_to_fit;
}

- (int)vertical_alignment
{
  return self->_vertical_alignment;
}

- (NSArray)cells
{
  return self->_cells;
}

- (_SFPBRFTableRowCardSection)initWithDictionary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_SFPBRFTableRowCardSection;
  v5 = [(_SFPBRFTableRowCardSection *)&v37 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"cells"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v34 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[_SFPBRFTableCell alloc] initWithDictionary:v13];
              [(_SFPBRFTableRowCardSection *)v5 addCells:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v10);
      }

      v6 = v7;
    }
    id v15 = [v4 objectForKeyedSubscript:@"verticalAlignment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableRowCardSection setVertical_alignment:](v5, "setVertical_alignment:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"scaleToFit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFTableRowCardSection setScale_to_fit:](v5, "setScale_to_fit:", [v16 BOOLValue]);
    }
    uint64_t v17 = [v4 objectForKeyedSubscript:@"compactCells"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = v16;
      long long v28 = v15;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v24 = [[_SFPBRFTableCell alloc] initWithDictionary:v23];
              [(_SFPBRFTableRowCardSection *)v5 addCompact_cells:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v38 count:16];
        }
        while (v20);
      }

      id v15 = v28;
      v16 = v27;
    }
    long long v25 = v5;
  }
  return v5;
}

- (_SFPBRFTableRowCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFTableRowCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFTableRowCardSection *)self dictionaryRepresentation];
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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_cells count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v5 = self->_cells;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"cells"];
  }
  if ([(NSArray *)self->_compact_cells count])
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v13 = self->_compact_cells;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [*(id *)(*((void *)&v24 + 1) + 8 * j) dictionaryRepresentation];
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
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"compactCells"];
  }
  if (self->_scale_to_fit)
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRFTableRowCardSection scale_to_fit](self, "scale_to_fit"));
    [v3 setObject:v20 forKeyedSubscript:@"scaleToFit"];
  }
  if (self->_vertical_alignment)
  {
    uint64_t v21 = [(_SFPBRFTableRowCardSection *)self vertical_alignment];
    if (v21 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v21);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E5A2EFD8[v21];
    }
    [v3 setObject:v22 forKeyedSubscript:@"verticalAlignment"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_cells hash];
  if (self->_scale_to_fit) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v4 = 2654435761 * self->_vertical_alignment;
  return v4 ^ v3 ^ v5 ^ [(NSArray *)self->_compact_cells hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  uint64_t v5 = [(_SFPBRFTableRowCardSection *)self cells];
  uint64_t v6 = [v4 cells];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_13;
  }
  uint64_t v7 = [(_SFPBRFTableRowCardSection *)self cells];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRFTableRowCardSection *)self cells];
    uint64_t v10 = [v4 cells];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  int vertical_alignment = self->_vertical_alignment;
  if (vertical_alignment != objc_msgSend(v4, "vertical_alignment")) {
    goto LABEL_14;
  }
  int scale_to_fit = self->_scale_to_fit;
  if (scale_to_fit != objc_msgSend(v4, "scale_to_fit")) {
    goto LABEL_14;
  }
  uint64_t v5 = [(_SFPBRFTableRowCardSection *)self compact_cells];
  uint64_t v6 = objc_msgSend(v4, "compact_cells");
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v14 = [(_SFPBRFTableRowCardSection *)self compact_cells];
    if (!v14)
    {

LABEL_17:
      BOOL v19 = 1;
      goto LABEL_15;
    }
    uint64_t v15 = (void *)v14;
    uint64_t v16 = [(_SFPBRFTableRowCardSection *)self compact_cells];
    uint64_t v17 = objc_msgSend(v4, "compact_cells");
    char v18 = [v16 isEqual:v17];

    if (v18) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_13:
  }
LABEL_14:
  BOOL v19 = 0;
LABEL_15:

  return v19;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBRFTableRowCardSection *)self cells];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if ([(_SFPBRFTableRowCardSection *)self vertical_alignment]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRFTableRowCardSection *)self scale_to_fit]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v10 = [(_SFPBRFTableRowCardSection *)self compact_cells];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTableRowCardSectionReadFrom(self, (uint64_t)a3);
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

- (void)setScale_to_fit:(BOOL)a3
{
  self->_int scale_to_fit = a3;
}

- (void)setVertical_alignment:(int)a3
{
  self->_int vertical_alignment = a3;
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

@end