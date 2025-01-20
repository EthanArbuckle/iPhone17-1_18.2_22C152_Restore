@interface _SFPBInfoCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)infoTuples;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBInfoCardSection)initWithDictionary:(id)a3;
- (_SFPBInfoCardSection)initWithFacade:(id)a3;
- (_SFPBInfoCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)infoTuplesAtIndex:(unint64_t)a3;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)hash;
- (unint64_t)infoTuplesCount;
- (unint64_t)initiallyVisibleTuples;
- (unint64_t)punchoutOptionsCount;
- (void)addInfoTuples:(id)a3;
- (void)addPunchoutOptions:(id)a3;
- (void)clearInfoTuples;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setInfoTuples:(id)a3;
- (void)setInitiallyVisibleTuples:(unint64_t)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBInfoCardSection

- (_SFPBInfoCardSection)initWithFacade:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBInfoCardSection *)self init];
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

    [(_SFPBInfoCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBInfoCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBInfoCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBInfoCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBInfoCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBInfoCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBInfoCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBInfoCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBInfoCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 infoTuples];
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
    v26 = objc_msgSend(v4, "infoTuples", 0);
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
          v31 = [[_SFPBInfoTuple alloc] initWithFacade:*(void *)(*((void *)&v34 + 1) + 8 * j)];
          if (v31) {
            [v25 addObject:v31];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v28);
    }

    [(_SFPBInfoCardSection *)v5 setInfoTuples:v25];
    if ([v4 hasInitiallyVisibleTuples]) {
      -[_SFPBInfoCardSection setInitiallyVisibleTuples:](v5, "setInitiallyVisibleTuples:", [v4 initiallyVisibleTuples]);
    }
    v32 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoTuples, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (unint64_t)initiallyVisibleTuples
{
  return self->_initiallyVisibleTuples;
}

- (NSArray)infoTuples
{
  return self->_infoTuples;
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

- (_SFPBInfoCardSection)initWithDictionary:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)_SFPBInfoCardSection;
  v5 = [(_SFPBInfoCardSection *)&v55 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v7 = v6;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v52 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v14 = [[_SFPBPunchout alloc] initWithDictionary:v13];
              [(_SFPBInfoCardSection *)v5 addPunchoutOptions:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
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
      [(_SFPBInfoCardSection *)v5 setPunchoutPickerTitle:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = (void *)[v17 copy];
      [(_SFPBInfoCardSection *)v5 setPunchoutPickerDismissText:v18];
    }
    v19 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBInfoCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBInfoCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v46 = v21;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBInfoCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v21 BOOLValue]);
    }
    uint64_t v22 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v45 = (void *)v22;
    if (objc_opt_isKindOfClass())
    {
      v23 = v20;
      v24 = (void *)[v45 copy];
      [(_SFPBInfoCardSection *)v5 setType:v24];

      v20 = v23;
    }
    id v25 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBInfoCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v25 intValue]);
    }
    v43 = v25;
    uint64_t v26 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    uint64_t v44 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v27 = [[_SFPBColor alloc] initWithDictionary:v26];
      [(_SFPBInfoCardSection *)v5 setBackgroundColor:v27];
    }
    uint64_t v28 = [v4 objectForKeyedSubscript:@"infoTuples"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v39 = v20;
      long long v40 = v17;
      long long v41 = v15;
      v42 = v6;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v29 = v28;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v48;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v48 != v32) {
              objc_enumerationMutation(v29);
            }
            uint64_t v34 = *(void *)(*((void *)&v47 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v35 = [[_SFPBInfoTuple alloc] initWithDictionary:v34];
              [(_SFPBInfoCardSection *)v5 addInfoTuples:v35];
            }
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v47 objects:v56 count:16];
        }
        while (v31);
      }

      v15 = v41;
      v6 = v42;
      v17 = v40;
      v20 = v39;
    }
    long long v36 = [v4 objectForKeyedSubscript:@"initiallyVisibleTuples"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBInfoCardSection setInitiallyVisibleTuples:](v5, "setInitiallyVisibleTuples:", [v36 unsignedLongLongValue]);
    }
    long long v37 = v5;
  }
  return v5;
}

- (_SFPBInfoCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBInfoCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBInfoCardSection *)self dictionaryRepresentation];
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
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBInfoCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBInfoCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBInfoCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v8 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBInfoCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v9 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_infoTuples count])
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v11 = self->_infoTuples;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"infoTuples"];
  }
  if (self->_initiallyVisibleTuples)
  {
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBInfoCardSection initiallyVisibleTuples](self, "initiallyVisibleTuples"));
    [v3 setObject:v18 forKeyedSubscript:@"initiallyVisibleTuples"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v20 = self->_punchoutOptions;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v37 != v23) {
            objc_enumerationMutation(v20);
          }
          id v25 = [*(id *)(*((void *)&v36 + 1) + 8 * j) dictionaryRepresentation];
          if (v25)
          {
            [v19 addObject:v25];
          }
          else
          {
            uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
            [v19 addObject:v26];
          }
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    uint64_t v27 = [(_SFPBInfoCardSection *)self punchoutPickerDismissText];
    uint64_t v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    id v29 = [(_SFPBInfoCardSection *)self punchoutPickerTitle];
    uint64_t v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v31 = [(_SFPBInfoCardSection *)self separatorStyle];
    if (v31 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v31);
      uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v32 = off_1E5A2F090[v31];
    }
    [v3 setObject:v32 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_type)
  {
    v33 = [(_SFPBInfoCardSection *)self type];
    uint64_t v34 = (void *)[v33 copy];
    [v3 setObject:v34 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v12 = [(NSArray *)self->_punchoutOptions hash];
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
  return v3 ^ v12 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSArray *)self->_infoTuples hash] ^ (2654435761u * self->_initiallyVisibleTuples);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  uint64_t v5 = [(_SFPBInfoCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v7 = [(_SFPBInfoCardSection *)self punchoutOptions];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(_SFPBInfoCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBInfoCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v12 = [(_SFPBInfoCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBInfoCardSection *)self punchoutPickerTitle];
    v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBInfoCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v17 = [(_SFPBInfoCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBInfoCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
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
  uint64_t v5 = [(_SFPBInfoCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v25 = [(_SFPBInfoCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [(_SFPBInfoCardSection *)self type];
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
  uint64_t v5 = [(_SFPBInfoCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_35;
  }
  uint64_t v31 = [(_SFPBInfoCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    v33 = [(_SFPBInfoCardSection *)self backgroundColor];
    uint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_36;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBInfoCardSection *)self infoTuples];
  uint64_t v6 = [v4 infoTuples];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_35:

    goto LABEL_36;
  }
  uint64_t v36 = [(_SFPBInfoCardSection *)self infoTuples];
  if (!v36)
  {

LABEL_39:
    unint64_t initiallyVisibleTuples = self->_initiallyVisibleTuples;
    BOOL v41 = initiallyVisibleTuples == [v4 initiallyVisibleTuples];
    goto LABEL_37;
  }
  long long v37 = (void *)v36;
  long long v38 = [(_SFPBInfoCardSection *)self infoTuples];
  long long v39 = [v4 infoTuples];
  int v40 = [v38 isEqual:v39];

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
  uint64_t v5 = [(_SFPBInfoCardSection *)self punchoutOptions];
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

  unint64_t v10 = [(_SFPBInfoCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBInfoCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBInfoCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBInfoCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBInfoCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBInfoCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBInfoCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBInfoCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBInfoCardSection *)self infoTuples];
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

  if ([(_SFPBInfoCardSection *)self initiallyVisibleTuples]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBInfoCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setInitiallyVisibleTuples:(unint64_t)a3
{
  self->_unint64_t initiallyVisibleTuples = a3;
}

- (id)infoTuplesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_infoTuples objectAtIndexedSubscript:a3];
}

- (unint64_t)infoTuplesCount
{
  return [(NSArray *)self->_infoTuples count];
}

- (void)addInfoTuples:(id)a3
{
  id v4 = a3;
  infoTuples = self->_infoTuples;
  id v8 = v4;
  if (!infoTuples)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_infoTuples;
    self->_infoTuples = v6;

    id v4 = v8;
    infoTuples = self->_infoTuples;
  }
  [(NSArray *)infoTuples addObject:v4];
}

- (void)clearInfoTuples
{
}

- (void)setInfoTuples:(id)a3
{
  self->_infoTuples = (NSArray *)[a3 copy];
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