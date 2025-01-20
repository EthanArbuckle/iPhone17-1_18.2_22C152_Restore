@interface _SFPBLeadingTrailingCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)leadingCardSections;
- (NSArray)punchoutOptions;
- (NSArray)trailingCardSections;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBGraphicalFloat)leadingToTrailingRatio;
- (_SFPBLeadingTrailingCardSection)initWithDictionary:(id)a3;
- (_SFPBLeadingTrailingCardSection)initWithFacade:(id)a3;
- (_SFPBLeadingTrailingCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)leadingCardSectionsAtIndex:(unint64_t)a3;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (id)trailingCardSectionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)hash;
- (unint64_t)leadingCardSectionsCount;
- (unint64_t)punchoutOptionsCount;
- (unint64_t)trailingCardSectionsCount;
- (void)addLeadingCardSections:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)addTrailingCardSections:(id)a3;
- (void)clearLeadingCardSections;
- (void)clearPunchoutOptions;
- (void)clearTrailingCardSections;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setLeadingCardSections:(id)a3;
- (void)setLeadingToTrailingRatio:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setTrailingCardSections:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBLeadingTrailingCardSection

- (_SFPBLeadingTrailingCardSection)initWithFacade:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBLeadingTrailingCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v54 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v53 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v10);
    }

    [(_SFPBLeadingTrailingCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBLeadingTrailingCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBLeadingTrailingCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBLeadingTrailingCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBLeadingTrailingCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBLeadingTrailingCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBLeadingTrailingCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBLeadingTrailingCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBLeadingTrailingCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 leadingCardSections];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v26 = [v4 leadingCardSections];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v50 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[_SFPBCardSection alloc] initWithFacade:*(void *)(*((void *)&v49 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v28);
    }

    [(_SFPBLeadingTrailingCardSection *)v5 setLeadingCardSections:v25];
    v32 = [v4 trailingCardSections];
    v44 = v5;
    if (v32) {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v33 = 0;
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v34 = [v4 trailingCardSections];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v46 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = [[_SFPBCardSection alloc] initWithFacade:*(void *)(*((void *)&v45 + 1) + 8 * k)];
          if (v39) {
            [v33 addObject:v39];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v36);
    }

    v5 = v44;
    [(_SFPBLeadingTrailingCardSection *)v44 setTrailingCardSections:v33];
    if ([v4 hasLeadingToTrailingRatio])
    {
      v40 = [_SFPBGraphicalFloat alloc];
      [v4 leadingToTrailingRatio];
      v41 = -[_SFPBGraphicalFloat initWithCGFloat:](v40, "initWithCGFloat:");
      [(_SFPBLeadingTrailingCardSection *)v44 setLeadingToTrailingRatio:v41];
    }
    v42 = v44;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingToTrailingRatio, 0);
  objc_storeStrong((id *)&self->_trailingCardSections, 0);
  objc_storeStrong((id *)&self->_leadingCardSections, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (_SFPBGraphicalFloat)leadingToTrailingRatio
{
  return self->_leadingToTrailingRatio;
}

- (NSArray)trailingCardSections
{
  return self->_trailingCardSections;
}

- (NSArray)leadingCardSections
{
  return self->_leadingCardSections;
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

- (_SFPBLeadingTrailingCardSection)initWithDictionary:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)_SFPBLeadingTrailingCardSection;
  v5 = [(_SFPBLeadingTrailingCardSection *)&v68 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v64 objects:v71 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v65 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v64 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBLeadingTrailingCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v64 objects:v71 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBLeadingTrailingCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    long long v51 = v14;
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBLeadingTrailingCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    long long v50 = v16;
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBLeadingTrailingCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    long long v55 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBLeadingTrailingCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    long long v54 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBLeadingTrailingCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    long long v53 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBLeadingTrailingCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBLeadingTrailingCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBLeadingTrailingCardSection *)v5 setBackgroundColor:v25];
    }
    long long v47 = (void *)v24;
    v26 = [v4 objectForKeyedSubscript:@"leadingCardSections"];
    objc_opt_class();
    long long v52 = v26;
    long long v48 = v23;
    long long v49 = v18;
    if (objc_opt_isKindOfClass())
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v27 = v26;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v60 objects:v70 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v61;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v61 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v60 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v33 = [[_SFPBCardSection alloc] initWithDictionary:v32];
              [(_SFPBLeadingTrailingCardSection *)v5 addLeadingCardSections:v33];
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v60 objects:v70 count:16];
        }
        while (v29);
      }

      v23 = v48;
      v18 = v49;
    }
    v34 = [v4 objectForKeyedSubscript:@"trailingCardSections"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v46 = v6;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v35 = v34;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v56 objects:v69 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v57;
        do
        {
          for (uint64_t k = 0; k != v37; ++k)
          {
            if (*(void *)v57 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v56 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v41 = [[_SFPBCardSection alloc] initWithDictionary:v40];
              [(_SFPBLeadingTrailingCardSection *)v5 addTrailingCardSections:v41];
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v56 objects:v69 count:16];
        }
        while (v37);
      }

      v6 = v46;
      v23 = v48;
      v18 = v49;
    }
    v42 = objc_msgSend(v4, "objectForKeyedSubscript:", @"leadingToTrailingRatio", v46);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = [[_SFPBGraphicalFloat alloc] initWithDictionary:v42];
      [(_SFPBLeadingTrailingCardSection *)v5 setLeadingToTrailingRatio:v43];
    }
    v44 = v5;
  }
  return v5;
}

- (_SFPBLeadingTrailingCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBLeadingTrailingCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBLeadingTrailingCardSection *)self dictionaryRepresentation];
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
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBLeadingTrailingCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBLeadingTrailingCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBLeadingTrailingCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v8 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBLeadingTrailingCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v9 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_leadingCardSections count])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v11 = self->_leadingCardSections;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v55 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v54 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"leadingCardSections"];
  }
  if (self->_leadingToTrailingRatio)
  {
    v18 = [(_SFPBLeadingTrailingCardSection *)self leadingToTrailingRatio];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"leadingToTrailingRatio"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"leadingToTrailingRatio"];
    }
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v22 = self->_punchoutOptions;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = [*(id *)(*((void *)&v50 + 1) + 8 * j) dictionaryRepresentation];
          if (v27)
          {
            [v21 addObject:v27];
          }
          else
          {
            uint64_t v28 = [MEMORY[0x1E4F1CA98] null];
            [v21 addObject:v28];
          }
        }
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    uint64_t v29 = [(_SFPBLeadingTrailingCardSection *)self punchoutPickerDismissText];
    uint64_t v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v31 = [(_SFPBLeadingTrailingCardSection *)self punchoutPickerTitle];
    uint64_t v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v33 = [(_SFPBLeadingTrailingCardSection *)self separatorStyle];
    if (v33 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v33);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_1E5A2F090[v33];
    }
    [v3 setObject:v34 forKeyedSubscript:@"separatorStyle"];
  }
  if ([(NSArray *)self->_trailingCardSections count])
  {
    id v35 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v36 = self->_trailingCardSections;
    uint64_t v37 = [(NSArray *)v36 countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v47;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v47 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = [*(id *)(*((void *)&v46 + 1) + 8 * k) dictionaryRepresentation];
          if (v41)
          {
            [v35 addObject:v41];
          }
          else
          {
            v42 = [MEMORY[0x1E4F1CA98] null];
            [v35 addObject:v42];
          }
        }
        uint64_t v38 = [(NSArray *)v36 countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v38);
    }

    [v3 setObject:v35 forKeyedSubscript:@"trailingCardSections"];
  }
  if (self->_type)
  {
    v43 = [(_SFPBLeadingTrailingCardSection *)self type];
    v44 = (void *)[v43 copy];
    [v3 setObject:v44 forKeyedSubscript:@"type"];
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
  uint64_t v11 = v10 ^ [(NSArray *)self->_leadingCardSections hash];
  uint64_t v12 = v11 ^ [(NSArray *)self->_trailingCardSections hash];
  return v9 ^ v12 ^ [(_SFPBGraphicalFloat *)self->_leadingToTrailingRatio hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  NSUInteger v5 = [(_SFPBLeadingTrailingCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v7 = [(_SFPBLeadingTrailingCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBLeadingTrailingCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBLeadingTrailingCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v12 = [(_SFPBLeadingTrailingCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBLeadingTrailingCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBLeadingTrailingCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v17 = [(_SFPBLeadingTrailingCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBLeadingTrailingCardSection *)self punchoutPickerDismissText];
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
  NSUInteger v5 = [(_SFPBLeadingTrailingCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v25 = [(_SFPBLeadingTrailingCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    id v27 = [(_SFPBLeadingTrailingCardSection *)self type];
    uint64_t v28 = [v4 type];
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
  NSUInteger v5 = [(_SFPBLeadingTrailingCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v31 = [(_SFPBLeadingTrailingCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = [(_SFPBLeadingTrailingCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBLeadingTrailingCardSection *)self leadingCardSections];
  uint64_t v6 = [v4 leadingCardSections];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v36 = [(_SFPBLeadingTrailingCardSection *)self leadingCardSections];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    uint64_t v38 = [(_SFPBLeadingTrailingCardSection *)self leadingCardSections];
    uint64_t v39 = [v4 leadingCardSections];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBLeadingTrailingCardSection *)self trailingCardSections];
  uint64_t v6 = [v4 trailingCardSections];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v41 = [(_SFPBLeadingTrailingCardSection *)self trailingCardSections];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [(_SFPBLeadingTrailingCardSection *)self trailingCardSections];
    v44 = [v4 trailingCardSections];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBLeadingTrailingCardSection *)self leadingToTrailingRatio];
  uint64_t v6 = [v4 leadingToTrailingRatio];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v46 = [(_SFPBLeadingTrailingCardSection *)self leadingToTrailingRatio];
  if (!v46)
  {

LABEL_49:
    BOOL v51 = 1;
    goto LABEL_47;
  }
  long long v47 = (void *)v46;
  long long v48 = [(_SFPBLeadingTrailingCardSection *)self leadingToTrailingRatio];
  long long v49 = [v4 leadingToTrailingRatio];
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
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBLeadingTrailingCardSection *)self punchoutOptions];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBLeadingTrailingCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBLeadingTrailingCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBLeadingTrailingCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBLeadingTrailingCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBLeadingTrailingCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBLeadingTrailingCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBLeadingTrailingCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBLeadingTrailingCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBLeadingTrailingCardSection *)self leadingCardSections];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v16);
  }

  v19 = [(_SFPBLeadingTrailingCardSection *)self trailingCardSections];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v21);
  }

  uint64_t v24 = [(_SFPBLeadingTrailingCardSection *)self leadingToTrailingRatio];
  if (v24) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBLeadingTrailingCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setLeadingToTrailingRatio:(id)a3
{
}

- (id)trailingCardSectionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_trailingCardSections objectAtIndexedSubscript:a3];
}

- (unint64_t)trailingCardSectionsCount
{
  return [(NSArray *)self->_trailingCardSections count];
}

- (void)addTrailingCardSections:(id)a3
{
  id v4 = a3;
  trailingCardSections = self->_trailingCardSections;
  id v8 = v4;
  if (!trailingCardSections)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_trailingCardSections;
    self->_trailingCardSections = v6;

    id v4 = v8;
    trailingCardSections = self->_trailingCardSections;
  }
  [(NSArray *)trailingCardSections addObject:v4];
}

- (void)clearTrailingCardSections
{
}

- (void)setTrailingCardSections:(id)a3
{
  self->_trailingCardSections = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)leadingCardSectionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_leadingCardSections objectAtIndexedSubscript:a3];
}

- (unint64_t)leadingCardSectionsCount
{
  return [(NSArray *)self->_leadingCardSections count];
}

- (void)addLeadingCardSections:(id)a3
{
  id v4 = a3;
  leadingCardSections = self->_leadingCardSections;
  id v8 = v4;
  if (!leadingCardSections)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_leadingCardSections;
    self->_leadingCardSections = v6;

    id v4 = v8;
    leadingCardSections = self->_leadingCardSections;
  }
  [(NSArray *)leadingCardSections addObject:v4];
}

- (void)clearLeadingCardSections
{
}

- (void)setLeadingCardSections:(id)a3
{
  self->_leadingCardSections = (NSArray *)[a3 copy];
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