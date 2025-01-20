@interface _SFPBButtonListCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)buttons;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)SectionTitle;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)showMoreButtonTitle;
- (NSString)type;
- (_SFPBButtonListCardSection)initWithDictionary:(id)a3;
- (_SFPBButtonListCardSection)initWithFacade:(id)a3;
- (_SFPBButtonListCardSection)initWithJSON:(id)a3;
- (_SFPBColor)backgroundColor;
- (id)buttonsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)buttonsCount;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addButtons:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)clearButtons;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSectionTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setShowMoreButtonTitle:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBButtonListCardSection

- (_SFPBButtonListCardSection)initWithFacade:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBButtonListCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v43 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v10);
    }

    [(_SFPBButtonListCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBButtonListCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBButtonListCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBButtonListCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBButtonListCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBButtonListCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBButtonListCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBButtonListCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBButtonListCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 SectionTitle];

    if (v24)
    {
      v25 = [v4 SectionTitle];
      [(_SFPBButtonListCardSection *)v5 setSectionTitle:v25];
    }
    v26 = [v4 buttons];
    if (v26) {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v27 = 0;
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v28 = objc_msgSend(v4, "buttons", 0);
    uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [[_SFPBButtonItem alloc] initWithFacade:*(void *)(*((void *)&v38 + 1) + 8 * j)];
          if (v33) {
            [v27 addObject:v33];
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v30);
    }

    [(_SFPBButtonListCardSection *)v5 setButtons:v27];
    v34 = [v4 showMoreButtonTitle];

    if (v34)
    {
      v35 = [v4 showMoreButtonTitle];
      [(_SFPBButtonListCardSection *)v5 setShowMoreButtonTitle:v35];
    }
    v36 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showMoreButtonTitle, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_SectionTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (NSString)showMoreButtonTitle
{
  return self->_showMoreButtonTitle;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (NSString)SectionTitle
{
  return self->_SectionTitle;
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

- (_SFPBButtonListCardSection)initWithDictionary:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)_SFPBButtonListCardSection;
  v5 = [(_SFPBButtonListCardSection *)&v61 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
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
              [(_SFPBButtonListCardSection *)v5 addPunchoutOptions:v13];
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
      [(_SFPBButtonListCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBButtonListCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBButtonListCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v52 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBButtonListCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v51 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBButtonListCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    uint64_t v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v50 = (void *)v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = v14;
      v23 = v18;
      v24 = (void *)[v50 copy];
      [(_SFPBButtonListCardSection *)v5 setType:v24];

      v18 = v23;
      v14 = v22;
    }
    v25 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBButtonListCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v25 intValue]);
    }
    v49 = v16;
    v26 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = v26;
      v28 = [[_SFPBColor alloc] initWithDictionary:v26];
      [(_SFPBButtonListCardSection *)v5 setBackgroundColor:v28];

      v26 = v27;
    }
    uint64_t v48 = v25;
    uint64_t v29 = [v4 objectForKeyedSubscript:@"SectionTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v30 = (void *)[v29 copy];
      [(_SFPBButtonListCardSection *)v5 setSectionTitle:v30];
    }
    v47 = v29;
    uint64_t v31 = [v4 objectForKeyedSubscript:@"buttons"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v43 = v26;
      long long v44 = v18;
      long long v45 = v14;
      v46 = v6;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v54 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v53 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v38 = [[_SFPBButtonItem alloc] initWithDictionary:v37];
              [(_SFPBButtonListCardSection *)v5 addButtons:v38];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v53 objects:v62 count:16];
        }
        while (v34);
      }

      v14 = v45;
      v6 = v46;
      v26 = v43;
    }
    long long v39 = objc_msgSend(v4, "objectForKeyedSubscript:", @"showMoreButtonTitle", v43, v44, v45, v46);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v40 = (void *)[v39 copy];
      [(_SFPBButtonListCardSection *)v5 setShowMoreButtonTitle:v40];
    }
    long long v41 = v5;
  }
  return v5;
}

- (_SFPBButtonListCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBButtonListCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBButtonListCardSection *)self dictionaryRepresentation];
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
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_SectionTitle)
  {
    id v4 = [(_SFPBButtonListCardSection *)self SectionTitle];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"SectionTitle"];
  }
  if (self->_backgroundColor)
  {
    v6 = [(_SFPBButtonListCardSection *)self backgroundColor];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"backgroundColor"];
    }
  }
  if ([(NSArray *)self->_buttons count])
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v10 = self->_buttons;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentation];
          if (v15)
          {
            [v9 addObject:v15];
          }
          else
          {
            v16 = [MEMORY[0x1E4F1CA98] null];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"buttons"];
  }
  if (self->_canBeHidden)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBButtonListCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v17 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    v18 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBButtonListCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v18 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v19 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBButtonListCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v19 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v20 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v21 = self->_punchoutOptions;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v39 + 1) + 8 * j) dictionaryRepresentation];
          if (v26)
          {
            [v20 addObject:v26];
          }
          else
          {
            id v27 = [MEMORY[0x1E4F1CA98] null];
            [v20 addObject:v27];
          }
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v28 = [(_SFPBButtonListCardSection *)self punchoutPickerDismissText];
    uint64_t v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    uint64_t v30 = [(_SFPBButtonListCardSection *)self punchoutPickerTitle];
    uint64_t v31 = (void *)[v30 copy];
    [v3 setObject:v31 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v32 = [(_SFPBButtonListCardSection *)self separatorStyle];
    if (v32 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v32);
      uint64_t v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v33 = off_1E5A2F090[v32];
    }
    [v3 setObject:v33 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_showMoreButtonTitle)
  {
    uint64_t v34 = [(_SFPBButtonListCardSection *)self showMoreButtonTitle];
    uint64_t v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"showMoreButtonTitle"];
  }
  if (self->_type)
  {
    v36 = [(_SFPBButtonListCardSection *)self type];
    uint64_t v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"type"];
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
  NSUInteger v11 = v10 ^ [(NSString *)self->_SectionTitle hash];
  uint64_t v12 = v11 ^ [(NSArray *)self->_buttons hash];
  return v9 ^ v12 ^ [(NSString *)self->_showMoreButtonTitle hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  NSUInteger v5 = [(_SFPBButtonListCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v7 = [(_SFPBButtonListCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBButtonListCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBButtonListCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v12 = [(_SFPBButtonListCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_SFPBButtonListCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBButtonListCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v17 = [(_SFPBButtonListCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBButtonListCardSection *)self punchoutPickerDismissText];
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
  NSUInteger v5 = [(_SFPBButtonListCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v25 = [(_SFPBButtonListCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    id v27 = [(_SFPBButtonListCardSection *)self type];
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
  NSUInteger v5 = [(_SFPBButtonListCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v31 = [(_SFPBButtonListCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = [(_SFPBButtonListCardSection *)self backgroundColor];
    uint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBButtonListCardSection *)self SectionTitle];
  uint64_t v6 = [v4 SectionTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v36 = [(_SFPBButtonListCardSection *)self SectionTitle];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    long long v38 = [(_SFPBButtonListCardSection *)self SectionTitle];
    long long v39 = [v4 SectionTitle];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBButtonListCardSection *)self buttons];
  uint64_t v6 = [v4 buttons];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v41 = [(_SFPBButtonListCardSection *)self buttons];
  if (v41)
  {
    long long v42 = (void *)v41;
    long long v43 = [(_SFPBButtonListCardSection *)self buttons];
    long long v44 = [v4 buttons];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBButtonListCardSection *)self showMoreButtonTitle];
  uint64_t v6 = [v4 showMoreButtonTitle];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v46 = [(_SFPBButtonListCardSection *)self showMoreButtonTitle];
  if (!v46)
  {

LABEL_49:
    BOOL v51 = 1;
    goto LABEL_47;
  }
  v47 = (void *)v46;
  uint64_t v48 = [(_SFPBButtonListCardSection *)self showMoreButtonTitle];
  uint64_t v49 = [v4 showMoreButtonTitle];
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
  NSUInteger v5 = [(_SFPBButtonListCardSection *)self punchoutOptions];
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

  unint64_t v10 = [(_SFPBButtonListCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBButtonListCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBButtonListCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBButtonListCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBButtonListCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBButtonListCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBButtonListCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBButtonListCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  v14 = [(_SFPBButtonListCardSection *)self SectionTitle];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  v15 = [(_SFPBButtonListCardSection *)self buttons];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v17);
  }

  v20 = [(_SFPBButtonListCardSection *)self showMoreButtonTitle];
  if (v20) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBButtonListCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setShowMoreButtonTitle:(id)a3
{
  self->_showMoreButtonTitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)buttonsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_buttons objectAtIndexedSubscript:a3];
}

- (unint64_t)buttonsCount
{
  return [(NSArray *)self->_buttons count];
}

- (void)addButtons:(id)a3
{
  id v4 = a3;
  buttons = self->_buttons;
  id v8 = v4;
  if (!buttons)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_buttons;
    self->_buttons = v6;

    id v4 = v8;
    buttons = self->_buttons;
  }
  [(NSArray *)buttons addObject:v4];
}

- (void)clearButtons
{
}

- (void)setButtons:(id)a3
{
  self->_buttons = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSectionTitle:(id)a3
{
  self->_SectionTitle = (NSString *)[a3 copy];
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