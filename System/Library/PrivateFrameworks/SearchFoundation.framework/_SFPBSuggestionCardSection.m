@interface _SFPBSuggestionCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)scopedSearchSectionBundleIdentifier;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBFormattedText)trailingBottomText;
- (_SFPBFormattedText)trailingMiddleText;
- (_SFPBImage)thumbnail;
- (_SFPBRichText)detailText;
- (_SFPBRichText)suggestionText;
- (_SFPBSuggestionCardSection)initWithDictionary:(id)a3;
- (_SFPBSuggestionCardSection)initWithFacade:(id)a3;
- (_SFPBSuggestionCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (int)suggestionType;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addPunchoutOptions:(id)a3;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setDetailText:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setIsContact:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setScopedSearchSectionBundleIdentifier:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSuggestionText:(id)a3;
- (void)setSuggestionType:(int)a3;
- (void)setThumbnail:(id)a3;
- (void)setTrailingBottomText:(id)a3;
- (void)setTrailingMiddleText:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSuggestionCardSection

- (_SFPBSuggestionCardSection)initWithFacade:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBSuggestionCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v49 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v48 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
      }
      while (v10);
    }

    [(_SFPBSuggestionCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBSuggestionCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBSuggestionCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBSuggestionCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBSuggestionCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBSuggestionCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBSuggestionCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBSuggestionCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBSuggestionCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 suggestionText];

    if (v24)
    {
      v25 = [_SFPBRichText alloc];
      v26 = [v4 suggestionText];
      v27 = [(_SFPBRichText *)v25 initWithFacade:v26];
      [(_SFPBSuggestionCardSection *)v5 setSuggestionText:v27];
    }
    if ([v4 hasIsContact]) {
      -[_SFPBSuggestionCardSection setIsContact:](v5, "setIsContact:", [v4 isContact]);
    }
    v28 = [v4 scopedSearchSectionBundleIdentifier];

    if (v28)
    {
      v29 = [v4 scopedSearchSectionBundleIdentifier];
      [(_SFPBSuggestionCardSection *)v5 setScopedSearchSectionBundleIdentifier:v29];
    }
    if ([v4 hasSuggestionType]) {
      -[_SFPBSuggestionCardSection setSuggestionType:](v5, "setSuggestionType:", [v4 suggestionType]);
    }
    v30 = [v4 detailText];

    if (v30)
    {
      v31 = [_SFPBRichText alloc];
      v32 = [v4 detailText];
      v33 = [(_SFPBRichText *)v31 initWithFacade:v32];
      [(_SFPBSuggestionCardSection *)v5 setDetailText:v33];
    }
    v34 = [v4 thumbnail];

    if (v34)
    {
      v35 = [_SFPBImage alloc];
      v36 = [v4 thumbnail];
      v37 = [(_SFPBImage *)v35 initWithFacade:v36];
      [(_SFPBSuggestionCardSection *)v5 setThumbnail:v37];
    }
    v38 = [v4 trailingMiddleText];

    if (v38)
    {
      v39 = [_SFPBFormattedText alloc];
      v40 = [v4 trailingMiddleText];
      v41 = [(_SFPBFormattedText *)v39 initWithFacade:v40];
      [(_SFPBSuggestionCardSection *)v5 setTrailingMiddleText:v41];
    }
    v42 = [v4 trailingBottomText];

    if (v42)
    {
      v43 = [_SFPBFormattedText alloc];
      v44 = [v4 trailingBottomText];
      v45 = [(_SFPBFormattedText *)v43 initWithFacade:v44];
      [(_SFPBSuggestionCardSection *)v5 setTrailingBottomText:v45];
    }
    v46 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingBottomText, 0);
  objc_storeStrong((id *)&self->_trailingMiddleText, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_scopedSearchSectionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionText, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (_SFPBFormattedText)trailingBottomText
{
  return self->_trailingBottomText;
}

- (_SFPBFormattedText)trailingMiddleText
{
  return self->_trailingMiddleText;
}

- (_SFPBImage)thumbnail
{
  return self->_thumbnail;
}

- (_SFPBRichText)detailText
{
  return self->_detailText;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (NSString)scopedSearchSectionBundleIdentifier
{
  return self->_scopedSearchSectionBundleIdentifier;
}

- (BOOL)isContact
{
  return self->_isContact;
}

- (_SFPBRichText)suggestionText
{
  return self->_suggestionText;
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

- (_SFPBSuggestionCardSection)initWithDictionary:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)_SFPBSuggestionCardSection;
  v5 = [(_SFPBSuggestionCardSection *)&v57 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v54 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v53 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBSuggestionCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBSuggestionCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBSuggestionCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSuggestionCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v52 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSuggestionCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    long long v51 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSuggestionCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    long long v50 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBSuggestionCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    long long v49 = v23;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSuggestionCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    v44 = v18;
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBSuggestionCardSection *)v5 setBackgroundColor:v25];
    }
    v43 = (void *)v24;
    uint64_t v26 = [v4 objectForKeyedSubscript:@"suggestionText"];
    objc_opt_class();
    long long v48 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBRichText alloc] initWithDictionary:v26];
      [(_SFPBSuggestionCardSection *)v5 setSuggestionText:v27];
    }
    v46 = v14;
    v28 = [v4 objectForKeyedSubscript:@"isContact"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSuggestionCardSection setIsContact:](v5, "setIsContact:", [v28 BOOLValue]);
    }
    v42 = v28;
    v45 = v16;
    v29 = [v4 objectForKeyedSubscript:@"scopedSearchSectionBundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = (void *)[v29 copy];
      [(_SFPBSuggestionCardSection *)v5 setScopedSearchSectionBundleIdentifier:v30];
    }
    v31 = [v4 objectForKeyedSubscript:@"suggestionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSuggestionCardSection setSuggestionType:](v5, "setSuggestionType:", [v31 intValue]);
    }
    v32 = [v4 objectForKeyedSubscript:@"detailText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBRichText alloc] initWithDictionary:v32];
      [(_SFPBSuggestionCardSection *)v5 setDetailText:v33];
    }
    v47 = v6;
    v34 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = [[_SFPBImage alloc] initWithDictionary:v34];
      [(_SFPBSuggestionCardSection *)v5 setThumbnail:v35];
    }
    v36 = [v4 objectForKeyedSubscript:@"trailingMiddleText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[_SFPBFormattedText alloc] initWithDictionary:v36];
      [(_SFPBSuggestionCardSection *)v5 setTrailingMiddleText:v37];
    }
    v38 = [v4 objectForKeyedSubscript:@"trailingBottomText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [[_SFPBFormattedText alloc] initWithDictionary:v38];
      [(_SFPBSuggestionCardSection *)v5 setTrailingBottomText:v39];
    }
    v40 = v5;
  }
  return v5;
}

- (_SFPBSuggestionCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSuggestionCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSuggestionCardSection *)self dictionaryRepresentation];
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
    id v4 = [(_SFPBSuggestionCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBSuggestionCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_detailText)
  {
    uint64_t v8 = [(_SFPBSuggestionCardSection *)self detailText];
    uint64_t v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"detailText"];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"detailText"];
    }
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBSuggestionCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v11 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBSuggestionCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v12 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_isContact)
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBSuggestionCardSection isContact](self, "isContact"));
    [v3 setObject:v13 forKeyedSubscript:@"isContact"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v14 = [MEMORY[0x1E4F1CA48] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v15 = self->_punchoutOptions;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v48 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v47 + 1) + 8 * i) dictionaryRepresentation];
          if (v20)
          {
            [v14 addObject:v20];
          }
          else
          {
            v21 = [MEMORY[0x1E4F1CA98] null];
            [v14 addObject:v21];
          }
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v22 = [(_SFPBSuggestionCardSection *)self punchoutPickerDismissText];
    v23 = (void *)[v22 copy];
    [v3 setObject:v23 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    uint64_t v24 = [(_SFPBSuggestionCardSection *)self punchoutPickerTitle];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_scopedSearchSectionBundleIdentifier)
  {
    uint64_t v26 = [(_SFPBSuggestionCardSection *)self scopedSearchSectionBundleIdentifier];
    v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"scopedSearchSectionBundleIdentifier"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v28 = [(_SFPBSuggestionCardSection *)self separatorStyle];
    if (v28 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v28);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E5A2F090[v28];
    }
    [v3 setObject:v29 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_suggestionText)
  {
    v30 = [(_SFPBSuggestionCardSection *)self suggestionText];
    v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"suggestionText"];
    }
    else
    {
      v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"suggestionText"];
    }
  }
  if (self->_suggestionType)
  {
    uint64_t v33 = [(_SFPBSuggestionCardSection *)self suggestionType];
    if (v33 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v33);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_1E5A2EF58[v33];
    }
    [v3 setObject:v34 forKeyedSubscript:@"suggestionType"];
  }
  if (self->_thumbnail)
  {
    v35 = [(_SFPBSuggestionCardSection *)self thumbnail];
    v36 = [v35 dictionaryRepresentation];
    if (v36)
    {
      [v3 setObject:v36 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v37 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v37 forKeyedSubscript:@"thumbnail"];
    }
  }
  if (self->_trailingBottomText)
  {
    v38 = [(_SFPBSuggestionCardSection *)self trailingBottomText];
    v39 = [v38 dictionaryRepresentation];
    if (v39)
    {
      [v3 setObject:v39 forKeyedSubscript:@"trailingBottomText"];
    }
    else
    {
      v40 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v40 forKeyedSubscript:@"trailingBottomText"];
    }
  }
  if (self->_trailingMiddleText)
  {
    v41 = [(_SFPBSuggestionCardSection *)self trailingMiddleText];
    v42 = [v41 dictionaryRepresentation];
    if (v42)
    {
      [v3 setObject:v42 forKeyedSubscript:@"trailingMiddleText"];
    }
    else
    {
      v43 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v43 forKeyedSubscript:@"trailingMiddleText"];
    }
  }
  if (self->_type)
  {
    v44 = [(_SFPBSuggestionCardSection *)self type];
    v45 = (void *)[v44 copy];
    [v3 setObject:v45 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v18 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v17 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v16 = [(NSString *)self->_punchoutPickerDismissText hash];
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
  unint64_t v9 = [(_SFPBRichText *)self->_suggestionText hash];
  if (self->_isContact) {
    uint64_t v10 = 2654435761;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = v17 ^ v18 ^ v16 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSString *)self->_scopedSearchSectionBundleIdentifier hash] ^ (2654435761 * self->_suggestionType);
  unint64_t v12 = [(_SFPBRichText *)self->_detailText hash];
  unint64_t v13 = v12 ^ [(_SFPBImage *)self->_thumbnail hash];
  unint64_t v14 = v13 ^ [(_SFPBFormattedText *)self->_trailingMiddleText hash];
  return v11 ^ v14 ^ [(_SFPBFormattedText *)self->_trailingBottomText hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_63;
  }
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self punchoutOptions];
  NSUInteger v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_62;
  }
  uint64_t v7 = [(_SFPBSuggestionCardSection *)self punchoutOptions];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBSuggestionCardSection *)self punchoutOptions];
    uint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self punchoutPickerTitle];
  NSUInteger v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_62;
  }
  uint64_t v12 = [(_SFPBSuggestionCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_SFPBSuggestionCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self punchoutPickerDismissText];
  NSUInteger v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_62;
  }
  uint64_t v17 = [(_SFPBSuggestionCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(_SFPBSuggestionCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_63;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_63;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_63;
  }
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self type];
  NSUInteger v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_62;
  }
  uint64_t v25 = [(_SFPBSuggestionCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    v27 = [(_SFPBSuggestionCardSection *)self type];
    uint64_t v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_63;
  }
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self backgroundColor];
  NSUInteger v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_62;
  }
  uint64_t v31 = [(_SFPBSuggestionCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    uint64_t v33 = [(_SFPBSuggestionCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self suggestionText];
  NSUInteger v6 = [v4 suggestionText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_62;
  }
  uint64_t v36 = [(_SFPBSuggestionCardSection *)self suggestionText];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_SFPBSuggestionCardSection *)self suggestionText];
    v39 = [v4 suggestionText];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  int isContact = self->_isContact;
  if (isContact != [v4 isContact]) {
    goto LABEL_63;
  }
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self scopedSearchSectionBundleIdentifier];
  NSUInteger v6 = [v4 scopedSearchSectionBundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_62;
  }
  uint64_t v42 = [(_SFPBSuggestionCardSection *)self scopedSearchSectionBundleIdentifier];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_SFPBSuggestionCardSection *)self scopedSearchSectionBundleIdentifier];
    v45 = [v4 scopedSearchSectionBundleIdentifier];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  int suggestionType = self->_suggestionType;
  if (suggestionType != [v4 suggestionType]) {
    goto LABEL_63;
  }
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self detailText];
  NSUInteger v6 = [v4 detailText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_62;
  }
  uint64_t v48 = [(_SFPBSuggestionCardSection *)self detailText];
  if (v48)
  {
    long long v49 = (void *)v48;
    long long v50 = [(_SFPBSuggestionCardSection *)self detailText];
    long long v51 = [v4 detailText];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self thumbnail];
  NSUInteger v6 = [v4 thumbnail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_62;
  }
  uint64_t v53 = [(_SFPBSuggestionCardSection *)self thumbnail];
  if (v53)
  {
    long long v54 = (void *)v53;
    long long v55 = [(_SFPBSuggestionCardSection *)self thumbnail];
    long long v56 = [v4 thumbnail];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self trailingMiddleText];
  NSUInteger v6 = [v4 trailingMiddleText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_62;
  }
  uint64_t v58 = [(_SFPBSuggestionCardSection *)self trailingMiddleText];
  if (v58)
  {
    uint64_t v59 = (void *)v58;
    v60 = [(_SFPBSuggestionCardSection *)self trailingMiddleText];
    v61 = [v4 trailingMiddleText];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self trailingBottomText];
  NSUInteger v6 = [v4 trailingBottomText];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_62:

    goto LABEL_63;
  }
  uint64_t v63 = [(_SFPBSuggestionCardSection *)self trailingBottomText];
  if (!v63)
  {

LABEL_66:
    BOOL v68 = 1;
    goto LABEL_64;
  }
  v64 = (void *)v63;
  v65 = [(_SFPBSuggestionCardSection *)self trailingBottomText];
  v66 = [v4 trailingBottomText];
  char v67 = [v65 isEqual:v66];

  if (v67) {
    goto LABEL_66;
  }
LABEL_63:
  BOOL v68 = 0;
LABEL_64:

  return v68;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBSuggestionCardSection *)self punchoutOptions];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v10 = [(_SFPBSuggestionCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBSuggestionCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBSuggestionCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBSuggestionCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBSuggestionCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBSuggestionCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBSuggestionCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v13 = [(_SFPBSuggestionCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v14 = [(_SFPBSuggestionCardSection *)self suggestionText];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBSuggestionCardSection *)self isContact]) {
    PBDataWriterWriteBOOLField();
  }
  v15 = [(_SFPBSuggestionCardSection *)self scopedSearchSectionBundleIdentifier];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBSuggestionCardSection *)self suggestionType]) {
    PBDataWriterWriteInt32Field();
  }
  int v16 = [(_SFPBSuggestionCardSection *)self detailText];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBSuggestionCardSection *)self thumbnail];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v18 = [(_SFPBSuggestionCardSection *)self trailingMiddleText];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  v19 = [(_SFPBSuggestionCardSection *)self trailingBottomText];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSuggestionCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setTrailingBottomText:(id)a3
{
}

- (void)setTrailingMiddleText:(id)a3
{
}

- (void)setThumbnail:(id)a3
{
}

- (void)setDetailText:(id)a3
{
}

- (void)setSuggestionType:(int)a3
{
  self->_int suggestionType = a3;
}

- (void)setScopedSearchSectionBundleIdentifier:(id)a3
{
  self->_scopedSearchSectionBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setIsContact:(BOOL)a3
{
  self->_int isContact = a3;
}

- (void)setSuggestionText:(id)a3
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