@interface _SFPBMetaInfoCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)trending;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBImage)badge;
- (_SFPBMetaInfoCardSection)initWithDictionary:(id)a3;
- (_SFPBMetaInfoCardSection)initWithFacade:(id)a3;
- (_SFPBMetaInfoCardSection)initWithJSON:(id)a3;
- (_SFPBURL)contentURL;
- (_SFPBURL)hostPageURL;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addPunchoutOptions:(id)a3;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setBadge:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setContentURL:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setHostPageURL:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setTrending:(BOOL)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMetaInfoCardSection

- (_SFPBMetaInfoCardSection)initWithFacade:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBMetaInfoCardSection *)self init];
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

    [(_SFPBMetaInfoCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBMetaInfoCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBMetaInfoCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBMetaInfoCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBMetaInfoCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBMetaInfoCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBMetaInfoCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBMetaInfoCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBMetaInfoCardSection *)v5 setBackgroundColor:v23];
    }
    if ([v4 hasTrending]) {
      -[_SFPBMetaInfoCardSection setTrending:](v5, "setTrending:", [v4 trending]);
    }
    v24 = [v4 contentURL];

    if (v24)
    {
      v25 = [_SFPBURL alloc];
      v26 = [v4 contentURL];
      v27 = [(_SFPBURL *)v25 initWithNSURL:v26];
      [(_SFPBMetaInfoCardSection *)v5 setContentURL:v27];
    }
    v28 = [v4 hostPageURL];

    if (v28)
    {
      v29 = [_SFPBURL alloc];
      v30 = [v4 hostPageURL];
      v31 = [(_SFPBURL *)v29 initWithNSURL:v30];
      [(_SFPBMetaInfoCardSection *)v5 setHostPageURL:v31];
    }
    v32 = [v4 badge];

    if (v32)
    {
      v33 = [_SFPBImage alloc];
      v34 = [v4 badge];
      v35 = [(_SFPBImage *)v33 initWithFacade:v34];
      [(_SFPBMetaInfoCardSection *)v5 setBadge:v35];
    }
    v36 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_hostPageURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (_SFPBImage)badge
{
  return self->_badge;
}

- (_SFPBURL)hostPageURL
{
  return self->_hostPageURL;
}

- (_SFPBURL)contentURL
{
  return self->_contentURL;
}

- (BOOL)trending
{
  return self->_trending;
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

- (_SFPBMetaInfoCardSection)initWithDictionary:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)_SFPBMetaInfoCardSection;
  v5 = [(_SFPBMetaInfoCardSection *)&v45 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v42;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v42 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBMetaInfoCardSection *)v5 addPunchoutOptions:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBMetaInfoCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    long long v39 = v14;
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBMetaInfoCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    long long v38 = v16;
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMetaInfoCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMetaInfoCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMetaInfoCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v37 = v18;
    long long v40 = v6;
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBMetaInfoCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMetaInfoCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBMetaInfoCardSection *)v5 setBackgroundColor:v25];
    }
    v36 = v19;
    v26 = objc_msgSend(v4, "objectForKeyedSubscript:", @"trending", v20);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMetaInfoCardSection setTrending:](v5, "setTrending:", [v26 BOOLValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"contentURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[_SFPBURL alloc] initWithDictionary:v27];
      [(_SFPBMetaInfoCardSection *)v5 setContentURL:v28];
    }
    v29 = [v4 objectForKeyedSubscript:@"hostPageURL"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = [[_SFPBURL alloc] initWithDictionary:v29];
      [(_SFPBMetaInfoCardSection *)v5 setHostPageURL:v30];
    }
    v31 = [v4 objectForKeyedSubscript:@"badge"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = [[_SFPBImage alloc] initWithDictionary:v31];
      [(_SFPBMetaInfoCardSection *)v5 setBadge:v32];
    }
    v33 = v5;
  }
  return v5;
}

- (_SFPBMetaInfoCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMetaInfoCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMetaInfoCardSection *)self dictionaryRepresentation];
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
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBMetaInfoCardSection *)self backgroundColor];
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
  if (self->_badge)
  {
    uint64_t v7 = [(_SFPBMetaInfoCardSection *)self badge];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"badge"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"badge"];
    }
  }
  if (self->_canBeHidden)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMetaInfoCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v10 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_contentURL)
  {
    uint64_t v11 = [(_SFPBMetaInfoCardSection *)self contentURL];
    uint64_t v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"contentURL"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"contentURL"];
    }
  }
  if (self->_hasBottomPadding)
  {
    v14 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMetaInfoCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v14 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMetaInfoCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v15 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_hostPageURL)
  {
    v16 = [(_SFPBMetaInfoCardSection *)self hostPageURL];
    v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"hostPageURL"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"hostPageURL"];
    }
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v20 = self->_punchoutOptions;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v27 = [(_SFPBMetaInfoCardSection *)self punchoutPickerDismissText];
    v28 = (void *)[v27 copy];
    [v3 setObject:v28 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v29 = [(_SFPBMetaInfoCardSection *)self punchoutPickerTitle];
    v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v31 = [(_SFPBMetaInfoCardSection *)self separatorStyle];
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
  if (self->_trending)
  {
    v33 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMetaInfoCardSection trending](self, "trending"));
    [v3 setObject:v33 forKeyedSubscript:@"trending"];
  }
  if (self->_type)
  {
    v34 = [(_SFPBMetaInfoCardSection *)self type];
    v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"type"];
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
  NSUInteger v9 = [(NSString *)self->_type hash];
  uint64_t v10 = 2654435761 * self->_separatorStyle;
  unint64_t v11 = [(_SFPBColor *)self->_backgroundColor hash];
  if (self->_trending) {
    uint64_t v12 = 2654435761;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  unint64_t v14 = v11 ^ v12 ^ [(_SFPBURL *)self->_contentURL hash];
  unint64_t v15 = v14 ^ [(_SFPBURL *)self->_hostPageURL hash];
  return v13 ^ v15 ^ [(_SFPBImage *)self->_badge hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  NSUInteger v5 = [(_SFPBMetaInfoCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v7 = [(_SFPBMetaInfoCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBMetaInfoCardSection *)self punchoutOptions];
    uint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMetaInfoCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v12 = [(_SFPBMetaInfoCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    unint64_t v14 = [(_SFPBMetaInfoCardSection *)self punchoutPickerTitle];
    unint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMetaInfoCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v17 = [(_SFPBMetaInfoCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBMetaInfoCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_47;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_47;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_47;
  }
  NSUInteger v5 = [(_SFPBMetaInfoCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v25 = [(_SFPBMetaInfoCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(_SFPBMetaInfoCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_47;
  }
  NSUInteger v5 = [(_SFPBMetaInfoCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v31 = [(_SFPBMetaInfoCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_SFPBMetaInfoCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  int trending = self->_trending;
  if (trending != [v4 trending]) {
    goto LABEL_47;
  }
  NSUInteger v5 = [(_SFPBMetaInfoCardSection *)self contentURL];
  uint64_t v6 = [v4 contentURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v37 = [(_SFPBMetaInfoCardSection *)self contentURL];
  if (v37)
  {
    long long v38 = (void *)v37;
    long long v39 = [(_SFPBMetaInfoCardSection *)self contentURL];
    long long v40 = [v4 contentURL];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMetaInfoCardSection *)self hostPageURL];
  uint64_t v6 = [v4 hostPageURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v42 = [(_SFPBMetaInfoCardSection *)self hostPageURL];
  if (v42)
  {
    long long v43 = (void *)v42;
    long long v44 = [(_SFPBMetaInfoCardSection *)self hostPageURL];
    objc_super v45 = [v4 hostPageURL];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMetaInfoCardSection *)self badge];
  uint64_t v6 = [v4 badge];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_46:

    goto LABEL_47;
  }
  uint64_t v47 = [(_SFPBMetaInfoCardSection *)self badge];
  if (!v47)
  {

LABEL_50:
    BOOL v52 = 1;
    goto LABEL_48;
  }
  v48 = (void *)v47;
  v49 = [(_SFPBMetaInfoCardSection *)self badge];
  v50 = [v4 badge];
  char v51 = [v49 isEqual:v50];

  if (v51) {
    goto LABEL_50;
  }
LABEL_47:
  BOOL v52 = 0;
LABEL_48:

  return v52;
}

- (void)writeTo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBMetaInfoCardSection *)self punchoutOptions];
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

  uint64_t v10 = [(_SFPBMetaInfoCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBMetaInfoCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMetaInfoCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMetaInfoCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBMetaInfoCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBMetaInfoCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMetaInfoCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v13 = [(_SFPBMetaInfoCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBMetaInfoCardSection *)self trending]) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v14 = [(_SFPBMetaInfoCardSection *)self contentURL];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v15 = [(_SFPBMetaInfoCardSection *)self hostPageURL];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBMetaInfoCardSection *)self badge];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMetaInfoCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setBadge:(id)a3
{
}

- (void)setHostPageURL:(id)a3
{
}

- (void)setContentURL:(id)a3
{
}

- (void)setTrending:(BOOL)a3
{
  self->_int trending = a3;
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