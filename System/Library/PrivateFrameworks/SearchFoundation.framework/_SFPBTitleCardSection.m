@interface _SFPBTitleCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isCentered;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)subtitle;
- (NSString)title;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBTitleCardSection)initWithDictionary:(id)a3;
- (_SFPBTitleCardSection)initWithFacade:(id)a3;
- (_SFPBTitleCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addPunchoutOptions:(id)a3;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setIsCentered:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBTitleCardSection

- (_SFPBTitleCardSection)initWithFacade:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBTitleCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }

    [(_SFPBTitleCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBTitleCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBTitleCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBTitleCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBTitleCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBTitleCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBTitleCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBTitleCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBTitleCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [v4 title];
      [(_SFPBTitleCardSection *)v5 setTitle:v25];
    }
    v26 = [v4 subtitle];

    if (v26)
    {
      v27 = [v4 subtitle];
      [(_SFPBTitleCardSection *)v5 setSubtitle:v27];
    }
    if ([v4 hasIsCentered]) {
      -[_SFPBTitleCardSection setIsCentered:](v5, "setIsCentered:", [v4 isCentered]);
    }
    v28 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (BOOL)isCentered
{
  return self->_isCentered;
}

- (NSString)subtitle
{
  return self->_subtitle;
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

- (_SFPBTitleCardSection)initWithDictionary:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)_SFPBTitleCardSection;
  v5 = [(_SFPBTitleCardSection *)&v41 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v38;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v38 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBTitleCardSection *)v5 addPunchoutOptions:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBTitleCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBTitleCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTitleCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTitleCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTitleCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v36 = v6;
    v21 = objc_msgSend(v4, "objectForKeyedSubscript:", @"type", v18);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBTitleCardSection *)v5 setType:v22];
    }
    uint64_t v35 = v14;
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTitleCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    v34 = v16;
    v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBTitleCardSection *)v5 setBackgroundColor:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(_SFPBTitleCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = (void *)[v28 copy];
      [(_SFPBTitleCardSection *)v5 setSubtitle:v29];
    }
    long long v30 = [v4 objectForKeyedSubscript:@"isCentered"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBTitleCardSection setIsCentered:](v5, "setIsCentered:", [v30 BOOLValue]);
    }
    long long v31 = v5;
  }
  return v5;
}

- (_SFPBTitleCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBTitleCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBTitleCardSection *)self dictionaryRepresentation];
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBTitleCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTitleCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTitleCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v8 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTitleCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v9 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_isCentered)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBTitleCardSection isCentered](self, "isCentered"));
    [v3 setObject:v10 forKeyedSubscript:@"isCentered"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v12 = self->_punchoutOptions;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v32 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v19 = [(_SFPBTitleCardSection *)self punchoutPickerDismissText];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v21 = [(_SFPBTitleCardSection *)self punchoutPickerTitle];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v23 = [(_SFPBTitleCardSection *)self separatorStyle];
    if (v23 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E5A2F090[v23];
    }
    [v3 setObject:v24 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_subtitle)
  {
    v25 = [(_SFPBTitleCardSection *)self subtitle];
    v26 = (void *)[v25 copy];
    [v3 setObject:v26 forKeyedSubscript:@"subtitle"];
  }
  if (self->_title)
  {
    v27 = [(_SFPBTitleCardSection *)self title];
    v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"title"];
  }
  if (self->_type)
  {
    v29 = [(_SFPBTitleCardSection *)self type];
    long long v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"type"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v15 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v14 = [(NSString *)self->_punchoutPickerTitle hash];
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
  NSUInteger v10 = [(NSString *)self->_title hash];
  NSUInteger v11 = [(NSString *)self->_subtitle hash];
  if (self->_isCentered) {
    uint64_t v12 = 2654435761;
  }
  else {
    uint64_t v12 = 0;
  }
  return v14 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  uint64_t v5 = [(_SFPBTitleCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v7 = [(_SFPBTitleCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBTitleCardSection *)self punchoutOptions];
    NSUInteger v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTitleCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v12 = [(_SFPBTitleCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    NSUInteger v14 = [(_SFPBTitleCardSection *)self punchoutPickerTitle];
    uint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTitleCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v17 = [(_SFPBTitleCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBTitleCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_41;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_41;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_41;
  }
  uint64_t v5 = [(_SFPBTitleCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v25 = [(_SFPBTitleCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(_SFPBTitleCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_41;
  }
  uint64_t v5 = [(_SFPBTitleCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v31 = [(_SFPBTitleCardSection *)self backgroundColor];
  if (v31)
  {
    long long v32 = (void *)v31;
    long long v33 = [(_SFPBTitleCardSection *)self backgroundColor];
    long long v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTitleCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_40;
  }
  uint64_t v36 = [(_SFPBTitleCardSection *)self title];
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    long long v38 = [(_SFPBTitleCardSection *)self title];
    long long v39 = [v4 title];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_41;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBTitleCardSection *)self subtitle];
  uint64_t v6 = [v4 subtitle];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_40:

    goto LABEL_41;
  }
  uint64_t v41 = [(_SFPBTitleCardSection *)self subtitle];
  if (!v41)
  {

LABEL_44:
    int isCentered = self->_isCentered;
    BOOL v46 = isCentered == [v4 isCentered];
    goto LABEL_42;
  }
  v42 = (void *)v41;
  uint64_t v43 = [(_SFPBTitleCardSection *)self subtitle];
  v44 = [v4 subtitle];
  int v45 = [v43 isEqual:v44];

  if (v45) {
    goto LABEL_44;
  }
LABEL_41:
  BOOL v46 = 0;
LABEL_42:

  return v46;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBTitleCardSection *)self punchoutOptions];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  NSUInteger v10 = [(_SFPBTitleCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBTitleCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTitleCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBTitleCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBTitleCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBTitleCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTitleCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBTitleCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v14 = [(_SFPBTitleCardSection *)self title];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  uint64_t v15 = [(_SFPBTitleCardSection *)self subtitle];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBTitleCardSection *)self isCentered]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBTitleCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setIsCentered:(BOOL)a3
{
  self->_int isCentered = a3;
}

- (void)setSubtitle:(id)a3
{
  self->_subtitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
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