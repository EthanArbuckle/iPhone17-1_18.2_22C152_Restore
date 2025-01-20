@interface _SFPBTextColumnsCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)columns;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)title;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBTextColumnsCardSection)initWithDictionary:(id)a3;
- (_SFPBTextColumnsCardSection)initWithFacade:(id)a3;
- (_SFPBTextColumnsCardSection)initWithJSON:(id)a3;
- (id)columnsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)columnsCount;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (unsigned)titleWeight;
- (void)addColumns:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)clearColumns;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setColumns:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setTitle:(id)a3;
- (void)setTitleWeight:(unsigned int)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBTextColumnsCardSection

- (_SFPBTextColumnsCardSection)initWithFacade:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBTextColumnsCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v10);
    }

    [(_SFPBTextColumnsCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBTextColumnsCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBTextColumnsCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBTextColumnsCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBTextColumnsCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBTextColumnsCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBTextColumnsCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBTextColumnsCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBTextColumnsCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [v4 title];
      [(_SFPBTextColumnsCardSection *)v5 setTitle:v25];
    }
    if ([v4 hasTitleWeight]) {
      -[_SFPBTextColumnsCardSection setTitleWeight:](v5, "setTitleWeight:", [v4 titleWeight]);
    }
    v26 = [v4 columns];
    if (v26) {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v27 = 0;
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v28 = objc_msgSend(v4, "columns", 0);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v37 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [[_SFPBTextColumn alloc] initWithFacade:*(void *)(*((void *)&v36 + 1) + 8 * j)];
          if (v33) {
            [v27 addObject:v33];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v30);
    }

    [(_SFPBTextColumnsCardSection *)v5 setColumns:v27];
    v34 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (NSArray)columns
{
  return self->_columns;
}

- (unsigned)titleWeight
{
  return self->_titleWeight;
}

- (NSString)title
{
  return self->_title;
}

- (_SFPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)hasBottomPadding
{
  return self->_hasBottomPadding;
}

- (BOOL)hasTopPadding
{
  return self->_hasTopPadding;
}

- (BOOL)canBeHidden
{
  return self->_canBeHidden;
}

- (NSString)punchoutPickerDismissText
{
  return self->_punchoutPickerDismissText;
}

- (NSString)punchoutPickerTitle
{
  return self->_punchoutPickerTitle;
}

- (NSArray)punchoutOptions
{
  return self->_punchoutOptions;
}

- (_SFPBTextColumnsCardSection)initWithDictionary:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)_SFPBTextColumnsCardSection;
  v5 = [(_SFPBTextColumnsCardSection *)&v59 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v56 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v55 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBTextColumnsCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v55 objects:v61 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBTextColumnsCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBTextColumnsCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    v50 = v18;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTextColumnsCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v49 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTextColumnsCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v48 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTextColumnsCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v47 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBTextColumnsCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTextColumnsCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    uint64_t v46 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = v23;
      v26 = v16;
      id v27 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBTextColumnsCardSection *)v5 setBackgroundColor:v27];

      v16 = v26;
      v23 = v25;
    }
    v28 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    v45 = v28;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = (void *)[v28 copy];
      [(_SFPBTextColumnsCardSection *)v5 setTitle:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"titleWeight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTextColumnsCardSection setTitleWeight:](v5, "setTitleWeight:", [v30 unsignedIntValue]);
    }
    uint64_t v31 = [v4 objectForKeyedSubscript:@"columns"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v41 = v30;
      long long v42 = v23;
      long long v43 = v14;
      v44 = v6;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v52 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v51 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v38 = [[_SFPBTextColumn alloc] initWithDictionary:v37];
              [(_SFPBTextColumnsCardSection *)v5 addColumns:v38];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v51 objects:v60 count:16];
        }
        while (v34);
      }

      v14 = v43;
      v6 = v44;
      v23 = v42;
      uint64_t v30 = v41;
    }
    long long v39 = v5;
  }
  return v5;
}

- (_SFPBTextColumnsCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBTextColumnsCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBTextColumnsCardSection *)self dictionaryRepresentation];
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
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBTextColumnsCardSection *)self backgroundColor];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"backgroundColor"];
    }
  }
  if (self->_canBeHidden)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTextColumnsCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if ([(NSArray *)self->_columns count])
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v9 = self->_columns;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v43 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v42 + 1) + 8 * i) dictionaryRepresentation];
          if (v14)
          {
            [v8 addObject:v14];
          }
          else
          {
            v15 = [MEMORY[0x1E4F1CA98] null];
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"columns"];
  }
  if (self->_hasBottomPadding)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTextColumnsCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v16 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTextColumnsCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v17 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v18 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v19 = self->_punchoutOptions;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = [*(id *)(*((void *)&v38 + 1) + 8 * j) dictionaryRepresentation];
          if (v24)
          {
            [v18 addObject:v24];
          }
          else
          {
            v25 = [MEMORY[0x1E4F1CA98] null];
            [v18 addObject:v25];
          }
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v26 = [(_SFPBTextColumnsCardSection *)self punchoutPickerDismissText];
    id v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v28 = [(_SFPBTextColumnsCardSection *)self punchoutPickerTitle];
    uint64_t v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v30 = [(_SFPBTextColumnsCardSection *)self separatorStyle];
    if (v30 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v30);
      uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v31 = off_1E5A2F090[v30];
    }
    [v3 setObject:v31 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_title)
  {
    id v32 = [(_SFPBTextColumnsCardSection *)self title];
    uint64_t v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"title"];
  }
  if (self->_titleWeight)
  {
    uint64_t v34 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[_SFPBTextColumnsCardSection titleWeight](self, "titleWeight"));
    [v3 setObject:v34 forKeyedSubscript:@"titleWeight"];
  }
  if (self->_type)
  {
    uint64_t v35 = [(_SFPBTextColumnsCardSection *)self type];
    long long v36 = (void *)[v35 copy];
    [v3 setObject:v36 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v14 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v3 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v4 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  if (self->_hasTopPadding) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  if (self->_hasBottomPadding) {
    uint64_t v7 = 2654435761;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_type hash];
  uint64_t v9 = 2654435761 * self->_separatorStyle;
  unint64_t v10 = [(_SFPBColor *)self->_backgroundColor hash];
  NSUInteger v11 = v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  NSUInteger v12 = v10 ^ [(NSString *)self->_title hash] ^ (2654435761 * self->_titleWeight);
  return v11 ^ v12 ^ [(NSArray *)self->_columns hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  uint64_t v5 = [(_SFPBTextColumnsCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v7 = [(_SFPBTextColumnsCardSection *)self punchoutOptions];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(_SFPBTextColumnsCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTextColumnsCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v12 = [(_SFPBTextColumnsCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(_SFPBTextColumnsCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTextColumnsCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v17 = [(_SFPBTextColumnsCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBTextColumnsCardSection *)self punchoutPickerDismissText];
    uint64_t v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_42;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_42;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_42;
  }
  uint64_t v5 = [(_SFPBTextColumnsCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v25 = [(_SFPBTextColumnsCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    id v27 = [(_SFPBTextColumnsCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_42;
  }
  uint64_t v5 = [(_SFPBTextColumnsCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v31 = [(_SFPBTextColumnsCardSection *)self backgroundColor];
  if (v31)
  {
    id v32 = (void *)v31;
    uint64_t v33 = [(_SFPBTextColumnsCardSection *)self backgroundColor];
    uint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTextColumnsCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v36 = [(_SFPBTextColumnsCardSection *)self title];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    long long v38 = [(_SFPBTextColumnsCardSection *)self title];
    long long v39 = [v4 title];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unsigned int titleWeight = self->_titleWeight;
  if (titleWeight != [v4 titleWeight]) {
    goto LABEL_42;
  }
  uint64_t v5 = [(_SFPBTextColumnsCardSection *)self columns];
  uint64_t v6 = [v4 columns];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_41:

    goto LABEL_42;
  }
  uint64_t v42 = [(_SFPBTextColumnsCardSection *)self columns];
  if (!v42)
  {

LABEL_45:
    BOOL v47 = 1;
    goto LABEL_43;
  }
  long long v43 = (void *)v42;
  long long v44 = [(_SFPBTextColumnsCardSection *)self columns];
  long long v45 = [v4 columns];
  char v46 = [v44 isEqual:v45];

  if (v46) {
    goto LABEL_45;
  }
LABEL_42:
  BOOL v47 = 0;
LABEL_43:

  return v47;
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBTextColumnsCardSection *)self punchoutOptions];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBTextColumnsCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBTextColumnsCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTextColumnsCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBTextColumnsCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBTextColumnsCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBTextColumnsCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTextColumnsCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  v13 = [(_SFPBTextColumnsCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBTextColumnsCardSection *)self title];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTextColumnsCardSection *)self titleWeight]) {
    PBDataWriterWriteUint32Field();
  }
  v15 = [(_SFPBTextColumnsCardSection *)self columns];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
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
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTextColumnsCardSectionReadFrom(self, (uint64_t)a3);
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

- (void)setTitleWeight:(unsigned int)a3
{
  self->_unsigned int titleWeight = a3;
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setSeparatorStyle:(int)a3
{
  self->_int separatorStyle = a3;
}

- (void)setType:(id)a3
{
  self->_type = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setHasBottomPadding:(BOOL)a3
{
  self->_int hasBottomPadding = a3;
}

- (void)setHasTopPadding:(BOOL)a3
{
  self->_int hasTopPadding = a3;
}

- (void)setCanBeHidden:(BOOL)a3
{
  self->_int canBeHidden = a3;
}

- (void)setPunchoutPickerDismissText:(id)a3
{
  self->_punchoutPickerDismissText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPunchoutPickerTitle:(id)a3
{
  self->_punchoutPickerTitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)punchoutOptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_punchoutOptions objectAtIndexedSubscript:a3];
}

- (unint64_t)punchoutOptionsCount
{
  return [(NSArray *)self->_punchoutOptions count];
}

- (void)addPunchoutOptions:(id)a3
{
  id v4 = a3;
  punchoutOptions = self->_punchoutOptions;
  id v8 = v4;
  if (!punchoutOptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_punchoutOptions;
    self->_punchoutOptions = v6;

    id v4 = v8;
    punchoutOptions = self->_punchoutOptions;
  }
  [(NSArray *)punchoutOptions addObject:v4];
}

- (void)clearPunchoutOptions
{
}

- (void)setPunchoutOptions:(id)a3
{
  self->_punchoutOptions = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end