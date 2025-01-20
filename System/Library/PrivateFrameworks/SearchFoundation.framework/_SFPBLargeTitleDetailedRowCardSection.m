@interface _SFPBLargeTitleDetailedRowCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)punchoutOptions;
- (NSArray)trailingButtonItems;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBButtonItem)subtitleButtonItem;
- (_SFPBColor)backgroundColor;
- (_SFPBLargeTitleDetailedRowCardSection)initWithDictionary:(id)a3;
- (_SFPBLargeTitleDetailedRowCardSection)initWithFacade:(id)a3;
- (_SFPBLargeTitleDetailedRowCardSection)initWithJSON:(id)a3;
- (_SFPBRichText)title;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (id)trailingButtonItemsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (unint64_t)trailingButtonItemsCount;
- (void)addPunchoutOptions:(id)a3;
- (void)addTrailingButtonItems:(id)a3;
- (void)clearPunchoutOptions;
- (void)clearTrailingButtonItems;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSubtitleButtonItem:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTrailingButtonItems:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBLargeTitleDetailedRowCardSection

- (_SFPBLargeTitleDetailedRowCardSection)initWithFacade:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBLargeTitleDetailedRowCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v47 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v46 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v10);
    }

    [(_SFPBLargeTitleDetailedRowCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBLargeTitleDetailedRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBLargeTitleDetailedRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBLargeTitleDetailedRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBLargeTitleDetailedRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [_SFPBRichText alloc];
      v26 = [v4 title];
      v27 = [(_SFPBRichText *)v25 initWithFacade:v26];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 subtitleButtonItem];

    if (v28)
    {
      v29 = [_SFPBButtonItem alloc];
      v30 = [v4 subtitleButtonItem];
      v31 = [(_SFPBButtonItem *)v29 initWithFacade:v30];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setSubtitleButtonItem:v31];
    }
    v32 = [v4 trailingButtonItems];
    if (v32) {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v33 = 0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v34 = objc_msgSend(v4, "trailingButtonItems", 0);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v43 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = [[_SFPBButtonItem alloc] initWithFacade:*(void *)(*((void *)&v42 + 1) + 8 * j)];
          if (v39) {
            [v33 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v36);
    }

    [(_SFPBLargeTitleDetailedRowCardSection *)v5 setTrailingButtonItems:v33];
    v40 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingButtonItems, 0);
  objc_storeStrong((id *)&self->_subtitleButtonItem, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (NSArray)trailingButtonItems
{
  return self->_trailingButtonItems;
}

- (_SFPBButtonItem)subtitleButtonItem
{
  return self->_subtitleButtonItem;
}

- (_SFPBRichText)title
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

- (_SFPBLargeTitleDetailedRowCardSection)initWithDictionary:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)_SFPBLargeTitleDetailedRowCardSection;
  v5 = [(_SFPBLargeTitleDetailedRowCardSection *)&v64 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v61 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v60 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[_SFPBPunchout alloc] initWithDictionary:v13];
              [(_SFPBLargeTitleDetailedRowCardSection *)v5 addPunchoutOptions:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v60 objects:v66 count:16];
        }
        while (v10);
      }

      v6 = v7;
    }
    v55 = v6;
    v15 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setPunchoutPickerTitle:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setPunchoutPickerDismissText:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBLargeTitleDetailedRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v54 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBLargeTitleDetailedRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBLargeTitleDetailedRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v53 = v22;
    if (objc_opt_isKindOfClass())
    {
      v23 = v19;
      v24 = (void *)[v22 copy];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setType:v24];

      v19 = v23;
    }
    v25 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    v26 = v15;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBLargeTitleDetailedRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v25 intValue]);
    }
    v50 = v25;
    v27 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[_SFPBColor alloc] initWithDictionary:v27];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setBackgroundColor:v28];
    }
    v51 = v17;
    v29 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    v30 = v55;
    if (objc_opt_isKindOfClass())
    {
      v31 = v29;
      v32 = [[_SFPBRichText alloc] initWithDictionary:v29];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setTitle:v32];

      v29 = v31;
    }
    uint64_t v33 = [v4 objectForKeyedSubscript:@"subtitleButtonItem"];
    objc_opt_class();
    uint64_t v52 = (void *)v33;
    if (objc_opt_isKindOfClass())
    {
      v34 = [[_SFPBButtonItem alloc] initWithDictionary:v33];
      [(_SFPBLargeTitleDetailedRowCardSection *)v5 setSubtitleButtonItem:v34];
    }
    uint64_t v35 = [v4 objectForKeyedSubscript:@"trailingButtonItems"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v45 = v29;
      long long v46 = v27;
      long long v47 = v21;
      long long v48 = v19;
      long long v49 = v26;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v36 = v35;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v57 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = *(void *)(*((void *)&v56 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v42 = [[_SFPBButtonItem alloc] initWithDictionary:v41];
              [(_SFPBLargeTitleDetailedRowCardSection *)v5 addTrailingButtonItems:v42];
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v38);
      }

      v30 = v55;
      v19 = v48;
      v26 = v49;
      v27 = v46;
      v21 = v47;
      v29 = v45;
    }
    long long v43 = v5;
  }
  return v5;
}

- (_SFPBLargeTitleDetailedRowCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBLargeTitleDetailedRowCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBLargeTitleDetailedRowCardSection *)self dictionaryRepresentation];
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
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBLargeTitleDetailedRowCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBLargeTitleDetailedRowCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBLargeTitleDetailedRowCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v8 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBLargeTitleDetailedRowCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v9 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v11 = self->_punchoutOptions;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v46 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v45 + 1) + 8 * i) dictionaryRepresentation];
          if (v16)
          {
            [v10 addObject:v16];
          }
          else
          {
            v17 = [MEMORY[0x1E4F1CA98] null];
            [v10 addObject:v17];
          }
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v18 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutPickerDismissText];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v20 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutPickerTitle];
    v21 = (void *)[v20 copy];
    [v3 setObject:v21 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v22 = [(_SFPBLargeTitleDetailedRowCardSection *)self separatorStyle];
    if (v22 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E5A2F090[v22];
    }
    [v3 setObject:v23 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_subtitleButtonItem)
  {
    v24 = [(_SFPBLargeTitleDetailedRowCardSection *)self subtitleButtonItem];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"subtitleButtonItem"];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"subtitleButtonItem"];
    }
  }
  if (self->_title)
  {
    v27 = [(_SFPBLargeTitleDetailedRowCardSection *)self title];
    v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"title"];
    }
    else
    {
      v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"title"];
    }
  }
  if ([(NSArray *)self->_trailingButtonItems count])
  {
    v30 = [MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v31 = self->_trailingButtonItems;
    uint64_t v32 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v42 != v34) {
            objc_enumerationMutation(v31);
          }
          id v36 = [*(id *)(*((void *)&v41 + 1) + 8 * j) dictionaryRepresentation];
          if (v36)
          {
            [v30 addObject:v36];
          }
          else
          {
            uint64_t v37 = [MEMORY[0x1E4F1CA98] null];
            [v30 addObject:v37];
          }
        }
        uint64_t v33 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v33);
    }

    [v3 setObject:v30 forKeyedSubscript:@"trailingButtonItems"];
  }
  if (self->_type)
  {
    uint64_t v38 = [(_SFPBLargeTitleDetailedRowCardSection *)self type];
    uint64_t v39 = (void *)[v38 copy];
    [v3 setObject:v39 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v4 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v5 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  if (self->_hasTopPadding) {
    uint64_t v7 = 2654435761;
  }
  else {
    uint64_t v7 = 0;
  }
  if (self->_hasBottomPadding) {
    uint64_t v8 = 2654435761;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_type hash] ^ (2654435761 * self->_separatorStyle);
  unint64_t v10 = [(_SFPBColor *)self->_backgroundColor hash];
  unint64_t v11 = v10 ^ [(_SFPBRichText *)self->_title hash];
  unint64_t v12 = v11 ^ [(_SFPBButtonItem *)self->_subtitleButtonItem hash];
  return v9 ^ v12 ^ [(NSArray *)self->_trailingButtonItems hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  NSUInteger v5 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v7 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v12 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v17 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_46;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_46;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_46;
  }
  NSUInteger v5 = [(_SFPBLargeTitleDetailedRowCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v25 = [(_SFPBLargeTitleDetailedRowCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(_SFPBLargeTitleDetailedRowCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_46;
  }
  NSUInteger v5 = [(_SFPBLargeTitleDetailedRowCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v31 = [(_SFPBLargeTitleDetailedRowCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = [(_SFPBLargeTitleDetailedRowCardSection *)self backgroundColor];
    uint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBLargeTitleDetailedRowCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v36 = [(_SFPBLargeTitleDetailedRowCardSection *)self title];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    uint64_t v38 = [(_SFPBLargeTitleDetailedRowCardSection *)self title];
    uint64_t v39 = [v4 title];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBLargeTitleDetailedRowCardSection *)self subtitleButtonItem];
  uint64_t v6 = [v4 subtitleButtonItem];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v41 = [(_SFPBLargeTitleDetailedRowCardSection *)self subtitleButtonItem];
  if (v41)
  {
    long long v42 = (void *)v41;
    long long v43 = [(_SFPBLargeTitleDetailedRowCardSection *)self subtitleButtonItem];
    long long v44 = [v4 subtitleButtonItem];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBLargeTitleDetailedRowCardSection *)self trailingButtonItems];
  uint64_t v6 = [v4 trailingButtonItems];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v46 = [(_SFPBLargeTitleDetailedRowCardSection *)self trailingButtonItems];
  if (!v46)
  {

LABEL_49:
    BOOL v51 = 1;
    goto LABEL_47;
  }
  long long v47 = (void *)v46;
  long long v48 = [(_SFPBLargeTitleDetailedRowCardSection *)self trailingButtonItems];
  long long v49 = [v4 trailingButtonItems];
  char v50 = [v48 isEqual:v49];

  if (v50) {
    goto LABEL_49;
  }
LABEL_46:
  BOOL v51 = 0;
LABEL_47:

  return v51;
}

- (void)writeTo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutOptions];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBLargeTitleDetailedRowCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBLargeTitleDetailedRowCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBLargeTitleDetailedRowCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBLargeTitleDetailedRowCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBLargeTitleDetailedRowCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBLargeTitleDetailedRowCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBLargeTitleDetailedRowCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBLargeTitleDetailedRowCardSection *)self title];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  v15 = [(_SFPBLargeTitleDetailedRowCardSection *)self subtitleButtonItem];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBLargeTitleDetailedRowCardSection *)self trailingButtonItems];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBLargeTitleDetailedRowCardSectionReadFrom(self, (uint64_t)a3);
}

- (id)trailingButtonItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_trailingButtonItems objectAtIndexedSubscript:a3];
}

- (unint64_t)trailingButtonItemsCount
{
  return [(NSArray *)self->_trailingButtonItems count];
}

- (void)addTrailingButtonItems:(id)a3
{
  id v4 = a3;
  trailingButtonItems = self->_trailingButtonItems;
  id v8 = v4;
  if (!trailingButtonItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_trailingButtonItems;
    self->_trailingButtonItems = v6;

    id v4 = v8;
    trailingButtonItems = self->_trailingButtonItems;
  }
  [(NSArray *)trailingButtonItems addObject:v4];
}

- (void)clearTrailingButtonItems
{
}

- (void)setTrailingButtonItems:(id)a3
{
  self->_trailingButtonItems = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSubtitleButtonItem:(id)a3
{
}

- (void)setTitle:(id)a3
{
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