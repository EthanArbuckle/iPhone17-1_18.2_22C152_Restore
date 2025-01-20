@interface _SFPBMiniCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBImage)image;
- (_SFPBMiniCardSection)initWithDictionary:(id)a3;
- (_SFPBMiniCardSection)initWithFacade:(id)a3;
- (_SFPBMiniCardSection)initWithJSON:(id)a3;
- (_SFPBRichText)subtitle;
- (_SFPBRichText)title;
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
- (void)setImage:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMiniCardSection

- (_SFPBMiniCardSection)initWithFacade:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBMiniCardSection *)self init];
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
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
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
        uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v10);
    }

    [(_SFPBMiniCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBMiniCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBMiniCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBMiniCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBMiniCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBMiniCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBMiniCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBMiniCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBMiniCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [_SFPBRichText alloc];
      v26 = [v4 title];
      v27 = [(_SFPBRichText *)v25 initWithFacade:v26];
      [(_SFPBMiniCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 subtitle];

    if (v28)
    {
      v29 = [_SFPBRichText alloc];
      v30 = [v4 subtitle];
      v31 = [(_SFPBRichText *)v29 initWithFacade:v30];
      [(_SFPBMiniCardSection *)v5 setSubtitle:v31];
    }
    v32 = [v4 image];

    if (v32)
    {
      v33 = [_SFPBImage alloc];
      v34 = [v4 image];
      v35 = [(_SFPBImage *)v33 initWithFacade:v34];
      [(_SFPBMiniCardSection *)v5 setImage:v35];
    }
    v36 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (_SFPBImage)image
{
  return self->_image;
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

- (_SFPBMiniCardSection)initWithDictionary:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_SFPBMiniCardSection;
  v5 = [(_SFPBMiniCardSection *)&v43 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v40;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v40 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBMiniCardSection *)v5 addPunchoutOptions:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBMiniCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v37 = v14;
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBMiniCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v36 = v16;
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMiniCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMiniCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMiniCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v35 = v18;
    long long v38 = v6;
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBMiniCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMiniCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    v34 = v19;
    v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBMiniCardSection *)v5 setBackgroundColor:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBRichText alloc] initWithDictionary:v26];
      [(_SFPBMiniCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBRichText alloc] initWithDictionary:v28];
      [(_SFPBMiniCardSection *)v5 setSubtitle:v29];
    }
    v30 = [v4 objectForKeyedSubscript:@"image"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBImage alloc] initWithDictionary:v30];
      [(_SFPBMiniCardSection *)v5 setImage:v31];
    }
    v32 = v5;
  }
  return v5;
}

- (_SFPBMiniCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMiniCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMiniCardSection *)self dictionaryRepresentation];
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
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBMiniCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMiniCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMiniCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v8 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMiniCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v9 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_image)
  {
    uint64_t v10 = [(_SFPBMiniCardSection *)self image];
    uint64_t v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"image"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"image"];
    }
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v14 = self->_punchoutOptions;
    uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          if (v19)
          {
            [v13 addObject:v19];
          }
          else
          {
            v20 = [MEMORY[0x1E4F1CA98] null];
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v21 = [(_SFPBMiniCardSection *)self punchoutPickerDismissText];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v23 = [(_SFPBMiniCardSection *)self punchoutPickerTitle];
    v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v25 = [(_SFPBMiniCardSection *)self separatorStyle];
    if (v25 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v25);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E5A2F090[v25];
    }
    [v3 setObject:v26 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_subtitle)
  {
    v27 = [(_SFPBMiniCardSection *)self subtitle];
    v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"subtitle"];
    }
    else
    {
      v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"subtitle"];
    }
  }
  if (self->_title)
  {
    v30 = [(_SFPBMiniCardSection *)self title];
    v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"title"];
    }
    else
    {
      v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"title"];
    }
  }
  if (self->_type)
  {
    v33 = [(_SFPBMiniCardSection *)self type];
    v34 = (void *)[v33 copy];
    [v3 setObject:v34 forKeyedSubscript:@"type"];
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
  unint64_t v12 = v11 ^ [(_SFPBRichText *)self->_subtitle hash];
  return v9 ^ v12 ^ [(_SFPBImage *)self->_image hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  NSUInteger v5 = [(_SFPBMiniCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v7 = [(_SFPBMiniCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBMiniCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMiniCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v12 = [(_SFPBMiniCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBMiniCardSection *)self punchoutPickerTitle];
    uint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMiniCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v17 = [(_SFPBMiniCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBMiniCardSection *)self punchoutPickerDismissText];
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
  NSUInteger v5 = [(_SFPBMiniCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v25 = [(_SFPBMiniCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(_SFPBMiniCardSection *)self type];
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
  NSUInteger v5 = [(_SFPBMiniCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v31 = [(_SFPBMiniCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_SFPBMiniCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMiniCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v36 = [(_SFPBMiniCardSection *)self title];
  if (v36)
  {
    long long v37 = (void *)v36;
    long long v38 = [(_SFPBMiniCardSection *)self title];
    long long v39 = [v4 title];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMiniCardSection *)self subtitle];
  uint64_t v6 = [v4 subtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_45;
  }
  uint64_t v41 = [(_SFPBMiniCardSection *)self subtitle];
  if (v41)
  {
    long long v42 = (void *)v41;
    objc_super v43 = [(_SFPBMiniCardSection *)self subtitle];
    v44 = [v4 subtitle];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_46;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMiniCardSection *)self image];
  uint64_t v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v46 = [(_SFPBMiniCardSection *)self image];
  if (!v46)
  {

LABEL_49:
    BOOL v51 = 1;
    goto LABEL_47;
  }
  v47 = (void *)v46;
  v48 = [(_SFPBMiniCardSection *)self image];
  v49 = [v4 image];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBMiniCardSection *)self punchoutOptions];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBMiniCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBMiniCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMiniCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMiniCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMiniCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBMiniCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMiniCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  v13 = [(_SFPBMiniCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  v14 = [(_SFPBMiniCardSection *)self title];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v15 = [(_SFPBMiniCardSection *)self subtitle];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBMiniCardSection *)self image];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMiniCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setImage:(id)a3
{
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