@interface _SFPBHeroCardSection
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
- (_SFPBHeroCardSection)initWithDictionary:(id)a3;
- (_SFPBHeroCardSection)initWithFacade:(id)a3;
- (_SFPBHeroCardSection)initWithJSON:(id)a3;
- (_SFPBImage)image;
- (_SFPBRichText)subtitle;
- (_SFPBRichText)title;
- (id)buttonItemsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)imageAlign;
- (int)separatorStyle;
- (unint64_t)buttonItemsCount;
- (unint64_t)hash;
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
- (void)setImage:(id)a3;
- (void)setImageAlign:(int)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBHeroCardSection

- (_SFPBHeroCardSection)initWithFacade:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBHeroCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v51 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v50 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v10);
    }

    [(_SFPBHeroCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBHeroCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBHeroCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBHeroCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBHeroCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBHeroCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBHeroCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBHeroCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBHeroCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [_SFPBRichText alloc];
      v26 = [v4 title];
      v27 = [(_SFPBRichText *)v25 initWithFacade:v26];
      [(_SFPBHeroCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 subtitle];

    if (v28)
    {
      v29 = [_SFPBRichText alloc];
      v30 = [v4 subtitle];
      v31 = [(_SFPBRichText *)v29 initWithFacade:v30];
      [(_SFPBHeroCardSection *)v5 setSubtitle:v31];
    }
    v32 = [v4 buttonItems];
    if (v32) {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v33 = 0;
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v34 = objc_msgSend(v4, "buttonItems", 0);
    uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v47 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = [[_SFPBButtonItem alloc] initWithFacade:*(void *)(*((void *)&v46 + 1) + 8 * j)];
          if (v39) {
            [v33 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v36);
    }

    [(_SFPBHeroCardSection *)v5 setButtonItems:v33];
    v40 = [v4 image];

    if (v40)
    {
      v41 = [_SFPBImage alloc];
      v42 = [v4 image];
      v43 = [(_SFPBImage *)v41 initWithFacade:v42];
      [(_SFPBHeroCardSection *)v5 setImage:v43];
    }
    if ([v4 hasImageAlign]) {
      -[_SFPBHeroCardSection setImageAlign:](v5, "setImageAlign:", [v4 imageAlign]);
    }
    v44 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_buttonItems, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (int)imageAlign
{
  return self->_imageAlign;
}

- (_SFPBImage)image
{
  return self->_image;
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

- (_SFPBHeroCardSection)initWithDictionary:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)_SFPBHeroCardSection;
  v5 = [(_SFPBHeroCardSection *)&v66 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v68 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v63 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v62 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[_SFPBPunchout alloc] initWithDictionary:v13];
              [(_SFPBHeroCardSection *)v5 addPunchoutOptions:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v62 objects:v68 count:16];
        }
        while (v10);
      }

      v6 = v7;
    }
    v57 = v6;
    v15 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(_SFPBHeroCardSection *)v5 setPunchoutPickerTitle:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBHeroCardSection *)v5 setPunchoutPickerDismissText:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHeroCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHeroCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    uint64_t v56 = v21;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHeroCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(_SFPBHeroCardSection *)v5 setType:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    v55 = v24;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHeroCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v24 intValue]);
    }
    uint64_t v25 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [[_SFPBColor alloc] initWithDictionary:v25];
      [(_SFPBHeroCardSection *)v5 setBackgroundColor:v26];
    }
    long long v51 = (void *)v25;
    v54 = v17;
    v27 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[_SFPBRichText alloc] initWithDictionary:v27];
      v29 = v27;
      v30 = v15;
      v31 = v28;
      [(_SFPBHeroCardSection *)v5 setTitle:v28];

      v15 = v30;
      v27 = v29;
    }
    long long v52 = v20;
    long long v53 = v19;
    uint64_t v32 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v33 = [[_SFPBRichText alloc] initWithDictionary:v32];
      [(_SFPBHeroCardSection *)v5 setSubtitle:v33];
    }
    long long v50 = (void *)v32;
    v34 = [v4 objectForKeyedSubscript:@"buttonItems"];
    objc_opt_class();
    uint64_t v35 = v57;
    if (objc_opt_isKindOfClass())
    {
      long long v48 = v22;
      long long v49 = v15;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v36 = v34;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v58 objects:v67 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v59;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v59 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = *(void *)(*((void *)&v58 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v42 = [[_SFPBButtonItem alloc] initWithDictionary:v41];
              [(_SFPBHeroCardSection *)v5 addButtonItems:v42];
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v58 objects:v67 count:16];
        }
        while (v38);
      }

      uint64_t v35 = v57;
      v22 = v48;
      v15 = v49;
    }
    v43 = [v4 objectForKeyedSubscript:@"image"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44 = [[_SFPBImage alloc] initWithDictionary:v43];
      [(_SFPBHeroCardSection *)v5 setImage:v44];
    }
    v45 = [v4 objectForKeyedSubscript:@"imageAlign"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBHeroCardSection setImageAlign:](v5, "setImageAlign:", [v45 intValue]);
    }
    long long v46 = v5;
  }
  return v5;
}

- (_SFPBHeroCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBHeroCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBHeroCardSection *)self dictionaryRepresentation];
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
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBHeroCardSection *)self backgroundColor];
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
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v8 = self->_buttonItems;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v51 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v50 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKeyedSubscript:@"buttonItems"];
  }
  if (self->_canBeHidden)
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBHeroCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v15 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBHeroCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v16 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBHeroCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v17 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_image)
  {
    v18 = [(_SFPBHeroCardSection *)self image];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"image"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"image"];
    }
  }
  if (self->_imageAlign)
  {
    uint64_t v21 = [(_SFPBHeroCardSection *)self imageAlign];
    if (v21 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v21);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E5A2EF58[v21];
    }
    [v3 setObject:v22 forKeyedSubscript:@"imageAlign"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v23 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v24 = self->_punchoutOptions;
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v47 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v46 + 1) + 8 * j) dictionaryRepresentation];
          if (v29)
          {
            [v23 addObject:v29];
          }
          else
          {
            v30 = [MEMORY[0x1E4F1CA98] null];
            [v23 addObject:v30];
          }
        }
        uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v31 = [(_SFPBHeroCardSection *)self punchoutPickerDismissText];
    uint64_t v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    id v33 = [(_SFPBHeroCardSection *)self punchoutPickerTitle];
    v34 = (void *)[v33 copy];
    [v3 setObject:v34 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v35 = [(_SFPBHeroCardSection *)self separatorStyle];
    if (v35 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v35);
      id v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v36 = off_1E5A2F090[v35];
    }
    [v3 setObject:v36 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_subtitle)
  {
    uint64_t v37 = [(_SFPBHeroCardSection *)self subtitle];
    uint64_t v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"subtitle"];
    }
    else
    {
      uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"subtitle"];
    }
  }
  if (self->_title)
  {
    v40 = [(_SFPBHeroCardSection *)self title];
    uint64_t v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"title"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"title"];
    }
  }
  if (self->_type)
  {
    v43 = [(_SFPBHeroCardSection *)self type];
    v44 = (void *)[v43 copy];
    [v3 setObject:v44 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v17 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v16 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v3 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  if (self->_hasTopPadding) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  if (self->_hasBottomPadding) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_type hash];
  uint64_t v8 = 2654435761 * self->_separatorStyle;
  unint64_t v9 = [(_SFPBColor *)self->_backgroundColor hash];
  unint64_t v10 = [(_SFPBRichText *)self->_title hash];
  unint64_t v11 = [(_SFPBRichText *)self->_subtitle hash];
  uint64_t v12 = [(NSArray *)self->_buttonItems hash];
  return v16 ^ v17 ^ v15 ^ v14 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(_SFPBImage *)self->_image hash] ^ (2654435761 * self->_imageAlign);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  uint64_t v5 = [(_SFPBHeroCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v7 = [(_SFPBHeroCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBHeroCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBHeroCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v12 = [(_SFPBHeroCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBHeroCardSection *)self punchoutPickerTitle];
    uint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBHeroCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v17 = [(_SFPBHeroCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBHeroCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_51;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_51;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_51;
  }
  uint64_t v5 = [(_SFPBHeroCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v25 = [(_SFPBHeroCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [(_SFPBHeroCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_51;
  }
  uint64_t v5 = [(_SFPBHeroCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v31 = [(_SFPBHeroCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    id v33 = [(_SFPBHeroCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBHeroCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v36 = [(_SFPBHeroCardSection *)self title];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    uint64_t v38 = [(_SFPBHeroCardSection *)self title];
    uint64_t v39 = [v4 title];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBHeroCardSection *)self subtitle];
  uint64_t v6 = [v4 subtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v41 = [(_SFPBHeroCardSection *)self subtitle];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [(_SFPBHeroCardSection *)self subtitle];
    v44 = [v4 subtitle];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBHeroCardSection *)self buttonItems];
  uint64_t v6 = [v4 buttonItems];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_50;
  }
  uint64_t v46 = [(_SFPBHeroCardSection *)self buttonItems];
  if (v46)
  {
    long long v47 = (void *)v46;
    long long v48 = [(_SFPBHeroCardSection *)self buttonItems];
    long long v49 = [v4 buttonItems];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBHeroCardSection *)self image];
  uint64_t v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_50:

    goto LABEL_51;
  }
  uint64_t v51 = [(_SFPBHeroCardSection *)self image];
  if (!v51)
  {

LABEL_54:
    int imageAlign = self->_imageAlign;
    BOOL v56 = imageAlign == [v4 imageAlign];
    goto LABEL_52;
  }
  long long v52 = (void *)v51;
  long long v53 = [(_SFPBHeroCardSection *)self image];
  v54 = [v4 image];
  int v55 = [v53 isEqual:v54];

  if (v55) {
    goto LABEL_54;
  }
LABEL_51:
  BOOL v56 = 0;
LABEL_52:

  return v56;
}

- (void)writeTo:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBHeroCardSection *)self punchoutOptions];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBHeroCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBHeroCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBHeroCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBHeroCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBHeroCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBHeroCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBHeroCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBHeroCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBHeroCardSection *)self title];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v15 = [(_SFPBHeroCardSection *)self subtitle];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBHeroCardSection *)self buttonItems];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v18);
  }

  int v21 = [(_SFPBHeroCardSection *)self image];
  if (v21) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBHeroCardSection *)self imageAlign]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBHeroCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setImageAlign:(int)a3
{
  self->_int imageAlign = a3;
}

- (void)setImage:(id)a3
{
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