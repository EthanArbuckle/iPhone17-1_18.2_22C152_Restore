@interface _SFPBGridCardSection
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
- (_SFPBColor)backgroundColor;
- (_SFPBGridCardSection)initWithDictionary:(id)a3;
- (_SFPBGridCardSection)initWithFacade:(id)a3;
- (_SFPBGridCardSection)initWithJSON:(id)a3;
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
- (void)setCanBeHidden:(BOOL)a3;
- (void)setCardSections:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBGridCardSection

- (_SFPBGridCardSection)initWithFacade:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBGridCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v38 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v10);
    }

    [(_SFPBGridCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBGridCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBGridCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBGridCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBGridCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBGridCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBGridCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBGridCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBGridCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 cardSections];
    if (v24) {
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v25 = 0;
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v26 = objc_msgSend(v4, "cardSections", 0);
    uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [[_SFPBCardSection alloc] initWithFacade:*(void *)(*((void *)&v34 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v28);
    }

    [(_SFPBGridCardSection *)v5 setCardSections:v25];
    v32 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSections, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
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

- (_SFPBGridCardSection)initWithDictionary:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)_SFPBGridCardSection;
  v5 = [(_SFPBGridCardSection *)&v54 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v56 count:16];
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
            uint64_t v13 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[_SFPBPunchout alloc] initWithDictionary:v13];
              [(_SFPBGridCardSection *)v5 addPunchoutOptions:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v56 count:16];
        }
        while (v10);
      }

      v6 = v7;
    }
    v15 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(_SFPBGridCardSection *)v5 setPunchoutPickerTitle:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBGridCardSection *)v5 setPunchoutPickerDismissText:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBGridCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v45 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBGridCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBGridCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v21 BOOLValue]);
    }
    v43 = v21;
    uint64_t v22 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    uint64_t v44 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      v23 = v19;
      v24 = (void *)[v44 copy];
      [(_SFPBGridCardSection *)v5 setType:v24];

      v19 = v23;
    }
    id v25 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBGridCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v25 intValue]);
    }
    v42 = v25;
    v26 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [[_SFPBColor alloc] initWithDictionary:v26];
      [(_SFPBGridCardSection *)v5 setBackgroundColor:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"cardSections"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v38 = v26;
      long long v39 = v19;
      long long v40 = v15;
      long long v41 = v6;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v47;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v47 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v46 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v35 = [[_SFPBCardSection alloc] initWithDictionary:v34];
              [(_SFPBGridCardSection *)v5 addCardSections:v35];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v55 count:16];
        }
        while (v31);
      }

      v15 = v40;
      v6 = v41;
      v19 = v39;
      v26 = v38;
    }
    long long v36 = v5;
  }
  return v5;
}

- (_SFPBGridCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBGridCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBGridCardSection *)self dictionaryRepresentation];
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
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBGridCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBGridCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if ([(NSArray *)self->_cardSections count])
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v9 = self->_cardSections;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"cardSections"];
  }
  if (self->_hasBottomPadding)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBGridCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v16 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBGridCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v17 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v18 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v19 = self->_punchoutOptions;
    uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v35 + 1) + 8 * j) dictionaryRepresentation];
          if (v24)
          {
            [v18 addObject:v24];
          }
          else
          {
            id v25 = [MEMORY[0x1E4F1CA98] null];
            [v18 addObject:v25];
          }
        }
        uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v26 = [(_SFPBGridCardSection *)self punchoutPickerDismissText];
    uint64_t v27 = (void *)[v26 copy];
    [v3 setObject:v27 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    uint64_t v28 = [(_SFPBGridCardSection *)self punchoutPickerTitle];
    id v29 = (void *)[v28 copy];
    [v3 setObject:v29 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v30 = [(_SFPBGridCardSection *)self separatorStyle];
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
  if (self->_type)
  {
    uint64_t v32 = [(_SFPBGridCardSection *)self type];
    v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"type"];
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
  return v9 ^ v10 ^ [(NSArray *)self->_cardSections hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  NSUInteger v5 = [(_SFPBGridCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v7 = [(_SFPBGridCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBGridCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBGridCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v12 = [(_SFPBGridCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(_SFPBGridCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBGridCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v17 = [(_SFPBGridCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBGridCardSection *)self punchoutPickerDismissText];
    uint64_t v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_36;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_36;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_36;
  }
  NSUInteger v5 = [(_SFPBGridCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v25 = [(_SFPBGridCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    uint64_t v27 = [(_SFPBGridCardSection *)self type];
    uint64_t v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_36;
  }
  NSUInteger v5 = [(_SFPBGridCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v31 = [(_SFPBGridCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    v33 = [(_SFPBGridCardSection *)self backgroundColor];
    uint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBGridCardSection *)self cardSections];
  uint64_t v6 = [v4 cardSections];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v36 = [(_SFPBGridCardSection *)self cardSections];
  if (!v36)
  {

LABEL_39:
    BOOL v41 = 1;
    goto LABEL_37;
  }
  long long v37 = (void *)v36;
  long long v38 = [(_SFPBGridCardSection *)self cardSections];
  long long v39 = [v4 cardSections];
  char v40 = [v38 isEqual:v39];

  if (v40) {
    goto LABEL_39;
  }
LABEL_36:
  BOOL v41 = 0;
LABEL_37:

  return v41;
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBGridCardSection *)self punchoutOptions];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBGridCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBGridCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBGridCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBGridCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBGridCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBGridCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBGridCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBGridCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  v14 = [(_SFPBGridCardSection *)self cardSections];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v16);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBGridCardSectionReadFrom(self, (uint64_t)a3);
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