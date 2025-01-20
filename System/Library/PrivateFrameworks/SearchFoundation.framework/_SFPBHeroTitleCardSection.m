@interface _SFPBHeroTitleCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)buttonItems;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBHeroTitleCardSection)initWithDictionary:(id)a3;
- (_SFPBHeroTitleCardSection)initWithFacade:(id)a3;
- (_SFPBHeroTitleCardSection)initWithJSON:(id)a3;
- (_SFPBRichText)subtitle;
- (_SFPBRichText)title;
- (id)buttonItemsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)buttonItemsCount;
- (unint64_t)hash;
- (unint64_t)maxVisibleButtonItems;
- (unint64_t)punchoutOptionsCount;
- (void)addButtonItems:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)clearButtonItems;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonItems:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setMaxVisibleButtonItems:(unint64_t)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBHeroTitleCardSection

- (_SFPBHeroTitleCardSection)initWithFacade:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBHeroTitleCardSection *)self init];
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

    [(_SFPBHeroTitleCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBHeroTitleCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBHeroTitleCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBHeroTitleCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBHeroTitleCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBHeroTitleCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBHeroTitleCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBHeroTitleCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBHeroTitleCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [_SFPBRichText alloc];
      v26 = [v4 title];
      v27 = [(_SFPBRichText *)v25 initWithFacade:v26];
      [(_SFPBHeroTitleCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 subtitle];

    if (v28)
    {
      v29 = [_SFPBRichText alloc];
      v30 = [v4 subtitle];
      v31 = [(_SFPBRichText *)v29 initWithFacade:v30];
      [(_SFPBHeroTitleCardSection *)v5 setSubtitle:v31];
    }
    v32 = [v4 buttonItems];
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
    v34 = objc_msgSend(v4, "buttonItems", 0);
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

    [(_SFPBHeroTitleCardSection *)v5 setButtonItems:v33];
    if ([v4 hasMaxVisibleButtonItems]) {
      -[_SFPBHeroTitleCardSection setMaxVisibleButtonItems:](v5, "setMaxVisibleButtonItems:", [v4 maxVisibleButtonItems]);
    }
    v40 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (unint64_t)maxVisibleButtonItems
{
  return self->_maxVisibleButtonItems;
}

- (NSArray)buttonItems
{
  return self->_buttonItems;
}

- (_SFPBRichText)subtitle
{
  return self->_subtitle;
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

- (_SFPBHeroTitleCardSection)initWithDictionary:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)_SFPBHeroTitleCardSection;
  v5 = [(_SFPBHeroTitleCardSection *)&v62 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v58 objects:v64 count:16];
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
            uint64_t v12 = *(void *)(*((void *)&v58 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBHeroTitleCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v58 objects:v64 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBHeroTitleCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBHeroTitleCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHeroTitleCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v53 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHeroTitleCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    uint64_t v52 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHeroTitleCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v51 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBHeroTitleCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHeroTitleCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    long long v48 = v23;
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBHeroTitleCardSection *)v5 setBackgroundColor:v25];
    }
    long long v47 = (void *)v24;
    long long v49 = v18;
    v26 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBRichText alloc] initWithDictionary:v26];
      v28 = v26;
      v29 = v16;
      v30 = v27;
      [(_SFPBHeroTitleCardSection *)v5 setTitle:v27];

      v16 = v29;
      v26 = v28;
    }
    uint64_t v31 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    v50 = (void *)v31;
    if (objc_opt_isKindOfClass())
    {
      v32 = [[_SFPBRichText alloc] initWithDictionary:v31];
      [(_SFPBHeroTitleCardSection *)v5 setSubtitle:v32];
    }
    id v33 = [v4 objectForKeyedSubscript:@"buttonItems"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v44 = v16;
      long long v45 = v14;
      long long v46 = v6;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v34 = v33;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v54 objects:v63 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v55 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v54 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v40 = [[_SFPBButtonItem alloc] initWithDictionary:v39];
              [(_SFPBHeroTitleCardSection *)v5 addButtonItems:v40];
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v54 objects:v63 count:16];
        }
        while (v36);
      }

      v14 = v45;
      v6 = v46;
      v16 = v44;
    }
    v41 = [v4 objectForKeyedSubscript:@"maxVisibleButtonItems"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHeroTitleCardSection setMaxVisibleButtonItems:](v5, "setMaxVisibleButtonItems:", [v41 unsignedLongLongValue]);
    }
    long long v42 = v5;
  }
  return v5;
}

- (_SFPBHeroTitleCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBHeroTitleCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBHeroTitleCardSection *)self dictionaryRepresentation];
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
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBHeroTitleCardSection *)self backgroundColor];
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
  if ([(NSArray *)self->_buttonItems count])
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v8 = self->_buttonItems;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
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
          v13 = [*(id *)(*((void *)&v46 + 1) + 8 * i) dictionaryRepresentation];
          if (v13)
          {
            [v7 addObject:v13];
          }
          else
          {
            v14 = [MEMORY[0x1E4F1CA98] null];
            [v7 addObject:v14];
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"buttonItems"];
  }
  if (self->_canBeHidden)
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBHeroTitleCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v15 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBHeroTitleCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v16 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBHeroTitleCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v17 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_maxVisibleButtonItems)
  {
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBHeroTitleCardSection maxVisibleButtonItems](self, "maxVisibleButtonItems"));
    [v3 setObject:v18 forKeyedSubscript:@"maxVisibleButtonItems"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v20 = self->_punchoutOptions;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v43 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v42 + 1) + 8 * j) dictionaryRepresentation];
          if (v25)
          {
            [v19 addObject:v25];
          }
          else
          {
            v26 = [MEMORY[0x1E4F1CA98] null];
            [v19 addObject:v26];
          }
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v27 = [(_SFPBHeroTitleCardSection *)self punchoutPickerDismissText];
    v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v29 = [(_SFPBHeroTitleCardSection *)self punchoutPickerTitle];
    v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v31 = [(_SFPBHeroTitleCardSection *)self separatorStyle];
    if (v31 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v31);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_1E5A2F090[v31];
    }
    [v3 setObject:v32 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_subtitle)
  {
    id v33 = [(_SFPBHeroTitleCardSection *)self subtitle];
    id v34 = [v33 dictionaryRepresentation];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"subtitle"];
    }
    else
    {
      uint64_t v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"subtitle"];
    }
  }
  if (self->_title)
  {
    uint64_t v36 = [(_SFPBHeroTitleCardSection *)self title];
    uint64_t v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"title"];
    }
    else
    {
      v38 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v38 forKeyedSubscript:@"title"];
    }
  }
  if (self->_type)
  {
    uint64_t v39 = [(_SFPBHeroTitleCardSection *)self type];
    v40 = (void *)[v39 copy];
    [v3 setObject:v40 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v14 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v13 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v12 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v3 = 2654435761;
  }
  else {
    uint64_t v3 = 0;
  }
  if (self->_hasTopPadding) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  if (self->_hasBottomPadding) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_type hash];
  uint64_t v7 = 2654435761 * self->_separatorStyle;
  unint64_t v8 = [(_SFPBColor *)self->_backgroundColor hash];
  unint64_t v9 = [(_SFPBRichText *)self->_title hash];
  unint64_t v10 = [(_SFPBRichText *)self->_subtitle hash];
  return v13 ^ v14 ^ v12 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSArray *)self->_buttonItems hash] ^ (2654435761u * self->_maxVisibleButtonItems);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  uint64_t v5 = [(_SFPBHeroTitleCardSection *)self punchoutOptions];
  NSUInteger v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v7 = [(_SFPBHeroTitleCardSection *)self punchoutOptions];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBHeroTitleCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBHeroTitleCardSection *)self punchoutPickerTitle];
  NSUInteger v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v12 = [(_SFPBHeroTitleCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    uint64_t v14 = [(_SFPBHeroTitleCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBHeroTitleCardSection *)self punchoutPickerDismissText];
  NSUInteger v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v17 = [(_SFPBHeroTitleCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBHeroTitleCardSection *)self punchoutPickerDismissText];
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
  uint64_t v5 = [(_SFPBHeroTitleCardSection *)self type];
  NSUInteger v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v25 = [(_SFPBHeroTitleCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(_SFPBHeroTitleCardSection *)self type];
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
  uint64_t v5 = [(_SFPBHeroTitleCardSection *)self backgroundColor];
  NSUInteger v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v31 = [(_SFPBHeroTitleCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    id v33 = [(_SFPBHeroTitleCardSection *)self backgroundColor];
    id v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBHeroTitleCardSection *)self title];
  NSUInteger v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v36 = [(_SFPBHeroTitleCardSection *)self title];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    v38 = [(_SFPBHeroTitleCardSection *)self title];
    uint64_t v39 = [v4 title];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBHeroTitleCardSection *)self subtitle];
  NSUInteger v6 = [v4 subtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v41 = [(_SFPBHeroTitleCardSection *)self subtitle];
  if (v41)
  {
    long long v42 = (void *)v41;
    long long v43 = [(_SFPBHeroTitleCardSection *)self subtitle];
    long long v44 = [v4 subtitle];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBHeroTitleCardSection *)self buttonItems];
  NSUInteger v6 = [v4 buttonItems];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v46 = [(_SFPBHeroTitleCardSection *)self buttonItems];
  if (!v46)
  {

LABEL_49:
    unint64_t maxVisibleButtonItems = self->_maxVisibleButtonItems;
    BOOL v51 = maxVisibleButtonItems == [v4 maxVisibleButtonItems];
    goto LABEL_47;
  }
  long long v47 = (void *)v46;
  long long v48 = [(_SFPBHeroTitleCardSection *)self buttonItems];
  long long v49 = [v4 buttonItems];
  int v50 = [v48 isEqual:v49];

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
  uint64_t v5 = [(_SFPBHeroTitleCardSection *)self punchoutOptions];
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

  unint64_t v10 = [(_SFPBHeroTitleCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBHeroTitleCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBHeroTitleCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBHeroTitleCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBHeroTitleCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBHeroTitleCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBHeroTitleCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v13 = [(_SFPBHeroTitleCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBHeroTitleCardSection *)self title];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  v15 = [(_SFPBHeroTitleCardSection *)self subtitle];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBHeroTitleCardSection *)self buttonItems];
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

  if ([(_SFPBHeroTitleCardSection *)self maxVisibleButtonItems]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBHeroTitleCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setMaxVisibleButtonItems:(unint64_t)a3
{
  self->_unint64_t maxVisibleButtonItems = a3;
}

- (id)buttonItemsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_buttonItems objectAtIndexedSubscript:a3];
}

- (unint64_t)buttonItemsCount
{
  return [(NSArray *)self->_buttonItems count];
}

- (void)addButtonItems:(id)a3
{
  id v4 = a3;
  buttonItems = self->_buttonItems;
  id v8 = v4;
  if (!buttonItems)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_buttonItems;
    self->_buttonItems = v6;

    id v4 = v8;
    buttonItems = self->_buttonItems;
  }
  [(NSArray *)buttonItems addObject:v4];
}

- (void)clearButtonItems
{
}

- (void)setButtonItems:(id)a3
{
  self->_buttonItems = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSubtitle:(id)a3
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