@interface _SFPBCollectionCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)cardSections;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBCollectionCardSection)initWithDictionary:(id)a3;
- (_SFPBCollectionCardSection)initWithFacade:(id)a3;
- (_SFPBCollectionCardSection)initWithJSON:(id)a3;
- (_SFPBCollectionStyle)collectionStyle;
- (_SFPBColor)backgroundColor;
- (_SFPBCommandButtonItem)buttonItem;
- (_SFPBCommandButtonItem)titleButtonItem;
- (_SFPBRichText)title;
- (id)cardSectionsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)cardSectionsCount;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addCardSections:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)clearCardSections;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setButtonItem:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setCardSections:(id)a3;
- (void)setCollectionStyle:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setTitle:(id)a3;
- (void)setTitleButtonItem:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBCollectionCardSection

- (_SFPBCollectionCardSection)initWithFacade:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBCollectionCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v55 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v54 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v10);
    }

    [(_SFPBCollectionCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBCollectionCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBCollectionCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBCollectionCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBCollectionCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBCollectionCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBCollectionCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBCollectionCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBCollectionCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 cardSections];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v26 = objc_msgSend(v4, "cardSections", 0);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v51 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[_SFPBCardSection alloc] initWithFacade:*(void *)(*((void *)&v50 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v28);
    }

    [(_SFPBCollectionCardSection *)v5 setCardSections:v25];
    v32 = [v4 title];

    if (v32)
    {
      v33 = [_SFPBRichText alloc];
      v34 = [v4 title];
      v35 = [(_SFPBRichText *)v33 initWithFacade:v34];
      [(_SFPBCollectionCardSection *)v5 setTitle:v35];
    }
    v36 = [v4 buttonItem];

    if (v36)
    {
      v37 = [_SFPBCommandButtonItem alloc];
      v38 = [v4 buttonItem];
      v39 = [(_SFPBCommandButtonItem *)v37 initWithFacade:v38];
      [(_SFPBCollectionCardSection *)v5 setButtonItem:v39];
    }
    v40 = [v4 collectionStyle];

    if (v40)
    {
      v41 = [_SFPBCollectionStyle alloc];
      v42 = [v4 collectionStyle];
      v43 = [(_SFPBCollectionStyle *)v41 initWithFacade:v42];
      [(_SFPBCollectionCardSection *)v5 setCollectionStyle:v43];
    }
    v44 = [v4 titleButtonItem];

    if (v44)
    {
      v45 = [_SFPBCommandButtonItem alloc];
      v46 = [v4 titleButtonItem];
      v47 = [(_SFPBCommandButtonItem *)v45 initWithFacade:v46];
      [(_SFPBCollectionCardSection *)v5 setTitleButtonItem:v47];
    }
    v48 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleButtonItem, 0);
  objc_storeStrong((id *)&self->_collectionStyle, 0);
  objc_storeStrong((id *)&self->_buttonItem, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (_SFPBCommandButtonItem)titleButtonItem
{
  return self->_titleButtonItem;
}

- (_SFPBCollectionStyle)collectionStyle
{
  return self->_collectionStyle;
}

- (_SFPBCommandButtonItem)buttonItem
{
  return self->_buttonItem;
}

- (_SFPBRichText)title
{
  return self->_title;
}

- (NSArray)cardSections
{
  return self->_cardSections;
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

- (_SFPBCollectionCardSection)initWithDictionary:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)_SFPBCollectionCardSection;
  v5 = [(_SFPBCollectionCardSection *)&v61 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    long long v52 = v6;
    if (objc_opt_isKindOfClass())
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v57 objects:v63 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v58 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v57 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBCollectionCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v57 objects:v63 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBCollectionCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    long long v51 = v14;
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBCollectionCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    long long v50 = v16;
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCollectionCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCollectionCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCollectionCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = v18;
      v23 = (void *)[v21 copy];
      [(_SFPBCollectionCardSection *)v5 setType:v23];

      v18 = v22;
    }
    v24 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBCollectionCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v24 intValue]);
    }
    v47 = v24;
    uint64_t v25 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [[_SFPBColor alloc] initWithDictionary:v25];
      [(_SFPBCollectionCardSection *)v5 setBackgroundColor:v26];
    }
    v46 = (void *)v25;
    v48 = v20;
    v49 = v19;
    uint64_t v27 = [v4 objectForKeyedSubscript:@"cardSections"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = v18;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v28 = v27;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v54 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v53 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v34 = [[_SFPBCardSection alloc] initWithDictionary:v33];
              [(_SFPBCollectionCardSection *)v5 addCardSections:v34];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v53 objects:v62 count:16];
        }
        while (v30);
      }

      v18 = v45;
    }
    v35 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [[_SFPBRichText alloc] initWithDictionary:v35];
      [(_SFPBCollectionCardSection *)v5 setTitle:v36];
    }
    v37 = [v4 objectForKeyedSubscript:@"buttonItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v38 = [[_SFPBCommandButtonItem alloc] initWithDictionary:v37];
      [(_SFPBCollectionCardSection *)v5 setButtonItem:v38];
    }
    v39 = [v4 objectForKeyedSubscript:@"collectionStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = [[_SFPBCollectionStyle alloc] initWithDictionary:v39];
      [(_SFPBCollectionCardSection *)v5 setCollectionStyle:v40];
    }
    v41 = [v4 objectForKeyedSubscript:@"titleButtonItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = [[_SFPBCommandButtonItem alloc] initWithDictionary:v41];
      [(_SFPBCollectionCardSection *)v5 setTitleButtonItem:v42];
    }
    v43 = v5;
  }
  return v5;
}

- (_SFPBCollectionCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBCollectionCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBCollectionCardSection *)self dictionaryRepresentation];
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
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBCollectionCardSection *)self backgroundColor];
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
  if (self->_buttonItem)
  {
    uint64_t v7 = [(_SFPBCollectionCardSection *)self buttonItem];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"buttonItem"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"buttonItem"];
    }
  }
  if (self->_canBeHidden)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCollectionCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v10 forKeyedSubscript:@"canBeHidden"];
  }
  if ([(NSArray *)self->_cardSections count])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v12 = self->_cardSections;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v52 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v51 + 1) + 8 * i) dictionaryRepresentation];
          if (v17)
          {
            [v11 addObject:v17];
          }
          else
          {
            v18 = [MEMORY[0x1E4F1CA98] null];
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"cardSections"];
  }
  if (self->_collectionStyle)
  {
    v19 = [(_SFPBCollectionCardSection *)self collectionStyle];
    v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"collectionStyle"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"collectionStyle"];
    }
  }
  if (self->_hasBottomPadding)
  {
    v22 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCollectionCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v22 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v23 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBCollectionCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v23 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v24 = [MEMORY[0x1E4F1CA48] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v25 = self->_punchoutOptions;
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v48 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = [*(id *)(*((void *)&v47 + 1) + 8 * j) dictionaryRepresentation];
          if (v30)
          {
            [v24 addObject:v30];
          }
          else
          {
            uint64_t v31 = [MEMORY[0x1E4F1CA98] null];
            [v24 addObject:v31];
          }
        }
        uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v32 = [(_SFPBCollectionCardSection *)self punchoutPickerDismissText];
    uint64_t v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v34 = [(_SFPBCollectionCardSection *)self punchoutPickerTitle];
    v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v36 = [(_SFPBCollectionCardSection *)self separatorStyle];
    if (v36 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v36);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = off_1E5A2F090[v36];
    }
    [v3 setObject:v37 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_title)
  {
    v38 = [(_SFPBCollectionCardSection *)self title];
    v39 = [v38 dictionaryRepresentation];
    if (v39)
    {
      [v3 setObject:v39 forKeyedSubscript:@"title"];
    }
    else
    {
      v40 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v40 forKeyedSubscript:@"title"];
    }
  }
  if (self->_titleButtonItem)
  {
    v41 = [(_SFPBCollectionCardSection *)self titleButtonItem];
    v42 = [v41 dictionaryRepresentation];
    if (v42)
    {
      [v3 setObject:v42 forKeyedSubscript:@"titleButtonItem"];
    }
    else
    {
      v43 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v43 forKeyedSubscript:@"titleButtonItem"];
    }
  }
  if (self->_type)
  {
    v44 = [(_SFPBCollectionCardSection *)self type];
    v45 = (void *)[v44 copy];
    [v3 setObject:v45 forKeyedSubscript:@"type"];
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
  uint64_t v11 = v10 ^ [(NSArray *)self->_cardSections hash];
  unint64_t v12 = v11 ^ [(_SFPBRichText *)self->_title hash];
  unint64_t v13 = v12 ^ [(_SFPBCommandButtonItem *)self->_buttonItem hash];
  unint64_t v14 = v13 ^ [(_SFPBCollectionStyle *)self->_collectionStyle hash];
  return v9 ^ v14 ^ [(_SFPBCommandButtonItem *)self->_titleButtonItem hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_56;
  }
  NSUInteger v5 = [(_SFPBCollectionCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v7 = [(_SFPBCollectionCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBCollectionCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBCollectionCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v12 = [(_SFPBCollectionCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_SFPBCollectionCardSection *)self punchoutPickerTitle];
    uint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBCollectionCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v17 = [(_SFPBCollectionCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBCollectionCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_56;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_56;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_56;
  }
  NSUInteger v5 = [(_SFPBCollectionCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v25 = [(_SFPBCollectionCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [(_SFPBCollectionCardSection *)self type];
    uint64_t v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_56;
  }
  NSUInteger v5 = [(_SFPBCollectionCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v31 = [(_SFPBCollectionCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    uint64_t v33 = [(_SFPBCollectionCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBCollectionCardSection *)self cardSections];
  uint64_t v6 = [v4 cardSections];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v36 = [(_SFPBCollectionCardSection *)self cardSections];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_SFPBCollectionCardSection *)self cardSections];
    v39 = [v4 cardSections];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBCollectionCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v41 = [(_SFPBCollectionCardSection *)self title];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [(_SFPBCollectionCardSection *)self title];
    v44 = [v4 title];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBCollectionCardSection *)self buttonItem];
  uint64_t v6 = [v4 buttonItem];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v46 = [(_SFPBCollectionCardSection *)self buttonItem];
  if (v46)
  {
    long long v47 = (void *)v46;
    long long v48 = [(_SFPBCollectionCardSection *)self buttonItem];
    long long v49 = [v4 buttonItem];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBCollectionCardSection *)self collectionStyle];
  uint64_t v6 = [v4 collectionStyle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_55;
  }
  uint64_t v51 = [(_SFPBCollectionCardSection *)self collectionStyle];
  if (v51)
  {
    long long v52 = (void *)v51;
    long long v53 = [(_SFPBCollectionCardSection *)self collectionStyle];
    long long v54 = [v4 collectionStyle];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_56;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBCollectionCardSection *)self titleButtonItem];
  uint64_t v6 = [v4 titleButtonItem];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_55:

    goto LABEL_56;
  }
  uint64_t v56 = [(_SFPBCollectionCardSection *)self titleButtonItem];
  if (!v56)
  {

LABEL_59:
    BOOL v61 = 1;
    goto LABEL_57;
  }
  uint64_t v57 = (void *)v56;
  long long v58 = [(_SFPBCollectionCardSection *)self titleButtonItem];
  long long v59 = [v4 titleButtonItem];
  char v60 = [v58 isEqual:v59];

  if (v60) {
    goto LABEL_59;
  }
LABEL_56:
  BOOL v61 = 0;
LABEL_57:

  return v61;
}

- (void)writeTo:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBCollectionCardSection *)self punchoutOptions];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBCollectionCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBCollectionCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBCollectionCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBCollectionCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBCollectionCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBCollectionCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBCollectionCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v13 = [(_SFPBCollectionCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v14 = [(_SFPBCollectionCardSection *)self cardSections];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  v19 = [(_SFPBCollectionCardSection *)self title];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  v20 = [(_SFPBCollectionCardSection *)self buttonItem];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  int v21 = [(_SFPBCollectionCardSection *)self collectionStyle];
  if (v21) {
    PBDataWriterWriteSubmessage();
  }

  v22 = [(_SFPBCollectionCardSection *)self titleButtonItem];
  if (v22) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBCollectionCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setTitleButtonItem:(id)a3
{
}

- (void)setCollectionStyle:(id)a3
{
}

- (void)setButtonItem:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (id)cardSectionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_cardSections objectAtIndexedSubscript:a3];
}

- (unint64_t)cardSectionsCount
{
  return [(NSArray *)self->_cardSections count];
}

- (void)addCardSections:(id)a3
{
  id v4 = a3;
  cardSections = self->_cardSections;
  id v8 = v4;
  if (!cardSections)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_cardSections;
    self->_cardSections = v6;

    id v4 = v8;
    cardSections = self->_cardSections;
  }
  [(NSArray *)cardSections addObject:v4];
}

- (void)clearCardSections
{
}

- (void)setCardSections:(id)a3
{
  self->_cardSections = (NSArray *)[a3 copy];
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