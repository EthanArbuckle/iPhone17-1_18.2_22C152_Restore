@interface _SFPBVerticalLayoutCardSection
- (BOOL)canBeHidden;
- (BOOL)contentsLeading;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)useAppIconMetrics;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBImage)thumbnail;
- (_SFPBRichText)footnote;
- (_SFPBRichText)thumbnailOverlayText;
- (_SFPBRichText)title;
- (_SFPBVerticalLayoutCardSection)initWithDictionary:(id)a3;
- (_SFPBVerticalLayoutCardSection)initWithFacade:(id)a3;
- (_SFPBVerticalLayoutCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)separatorStyle;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addPunchoutOptions:(id)a3;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setContentsLeading:(BOOL)a3;
- (void)setFootnote:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setThumbnail:(id)a3;
- (void)setThumbnailOverlayText:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(id)a3;
- (void)setUseAppIconMetrics:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBVerticalLayoutCardSection

- (_SFPBVerticalLayoutCardSection)initWithFacade:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBVerticalLayoutCardSection *)self init];
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
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
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
        uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v10);
    }

    [(_SFPBVerticalLayoutCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBVerticalLayoutCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBVerticalLayoutCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBVerticalLayoutCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBVerticalLayoutCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBVerticalLayoutCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBVerticalLayoutCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBVerticalLayoutCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBVerticalLayoutCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 thumbnail];

    if (v24)
    {
      v25 = [_SFPBImage alloc];
      v26 = [v4 thumbnail];
      v27 = [(_SFPBImage *)v25 initWithFacade:v26];
      [(_SFPBVerticalLayoutCardSection *)v5 setThumbnail:v27];
    }
    v28 = [v4 title];

    if (v28)
    {
      v29 = [_SFPBRichText alloc];
      v30 = [v4 title];
      v31 = [(_SFPBRichText *)v29 initWithFacade:v30];
      [(_SFPBVerticalLayoutCardSection *)v5 setTitle:v31];
    }
    v32 = [v4 footnote];

    if (v32)
    {
      v33 = [_SFPBRichText alloc];
      v34 = [v4 footnote];
      v35 = [(_SFPBRichText *)v33 initWithFacade:v34];
      [(_SFPBVerticalLayoutCardSection *)v5 setFootnote:v35];
    }
    if ([v4 hasContentsLeading]) {
      -[_SFPBVerticalLayoutCardSection setContentsLeading:](v5, "setContentsLeading:", [v4 contentsLeading]);
    }
    v36 = [v4 thumbnailOverlayText];

    if (v36)
    {
      v37 = [_SFPBRichText alloc];
      v38 = [v4 thumbnailOverlayText];
      v39 = [(_SFPBRichText *)v37 initWithFacade:v38];
      [(_SFPBVerticalLayoutCardSection *)v5 setThumbnailOverlayText:v39];
    }
    if ([v4 hasUseAppIconMetrics]) {
      -[_SFPBVerticalLayoutCardSection setUseAppIconMetrics:](v5, "setUseAppIconMetrics:", [v4 useAppIconMetrics]);
    }
    v40 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailOverlayText, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (BOOL)useAppIconMetrics
{
  return self->_useAppIconMetrics;
}

- (_SFPBRichText)thumbnailOverlayText
{
  return self->_thumbnailOverlayText;
}

- (BOOL)contentsLeading
{
  return self->_contentsLeading;
}

- (_SFPBRichText)footnote
{
  return self->_footnote;
}

- (_SFPBRichText)title
{
  return self->_title;
}

- (_SFPBImage)thumbnail
{
  return self->_thumbnail;
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

- (_SFPBVerticalLayoutCardSection)initWithDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)_SFPBVerticalLayoutCardSection;
  v5 = [(_SFPBVerticalLayoutCardSection *)&v50 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v47;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v47 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v46 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBVerticalLayoutCardSection *)v5 addPunchoutOptions:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBVerticalLayoutCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBVerticalLayoutCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBVerticalLayoutCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBVerticalLayoutCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBVerticalLayoutCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    long long v42 = v18;
    long long v45 = v6;
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBVerticalLayoutCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBVerticalLayoutCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    v39 = v23;
    long long v44 = v14;
    v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBVerticalLayoutCardSection *)v5 setBackgroundColor:v25];
    }
    long long v43 = v16;
    v26 = [v4 objectForKeyedSubscript:@"thumbnail"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBImage alloc] initWithDictionary:v26];
      [(_SFPBVerticalLayoutCardSection *)v5 setThumbnail:v27];
    }
    v41 = v19;
    v28 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = [[_SFPBRichText alloc] initWithDictionary:v28];
      [(_SFPBVerticalLayoutCardSection *)v5 setTitle:v29];
    }
    v40 = v21;
    v30 = [v4 objectForKeyedSubscript:@"footnote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBRichText alloc] initWithDictionary:v30];
      [(_SFPBVerticalLayoutCardSection *)v5 setFootnote:v31];
    }
    v32 = v20;
    v33 = [v4 objectForKeyedSubscript:@"contentsLeading"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBVerticalLayoutCardSection setContentsLeading:](v5, "setContentsLeading:", [v33 BOOLValue]);
    }
    v34 = [v4 objectForKeyedSubscript:@"thumbnailOverlayText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = [[_SFPBRichText alloc] initWithDictionary:v34];
      [(_SFPBVerticalLayoutCardSection *)v5 setThumbnailOverlayText:v35];
    }
    v36 = [v4 objectForKeyedSubscript:@"useAppIconMetrics"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBVerticalLayoutCardSection setUseAppIconMetrics:](v5, "setUseAppIconMetrics:", [v36 BOOLValue]);
    }
    v37 = v5;
  }
  return v5;
}

- (_SFPBVerticalLayoutCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBVerticalLayoutCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBVerticalLayoutCardSection *)self dictionaryRepresentation];
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
    id v4 = [(_SFPBVerticalLayoutCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBVerticalLayoutCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_contentsLeading)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBVerticalLayoutCardSection contentsLeading](self, "contentsLeading"));
    [v3 setObject:v8 forKeyedSubscript:@"contentsLeading"];
  }
  if (self->_footnote)
  {
    uint64_t v9 = [(_SFPBVerticalLayoutCardSection *)self footnote];
    uint64_t v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"footnote"];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"footnote"];
    }
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBVerticalLayoutCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v12 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBVerticalLayoutCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v13 forKeyedSubscript:@"hasTopPadding"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v14 = [MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v15 = self->_punchoutOptions;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v41 + 1) + 8 * i) dictionaryRepresentation];
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
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v17);
    }

    [v3 setObject:v14 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v22 = [(_SFPBVerticalLayoutCardSection *)self punchoutPickerDismissText];
    v23 = (void *)[v22 copy];
    [v3 setObject:v23 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v24 = [(_SFPBVerticalLayoutCardSection *)self punchoutPickerTitle];
    v25 = (void *)[v24 copy];
    [v3 setObject:v25 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v26 = [(_SFPBVerticalLayoutCardSection *)self separatorStyle];
    if (v26 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v26);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_1E5A2F090[v26];
    }
    [v3 setObject:v27 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_thumbnail)
  {
    v28 = [(_SFPBVerticalLayoutCardSection *)self thumbnail];
    v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"thumbnail"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"thumbnail"];
    }
  }
  if (self->_thumbnailOverlayText)
  {
    v31 = [(_SFPBVerticalLayoutCardSection *)self thumbnailOverlayText];
    v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"thumbnailOverlayText"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"thumbnailOverlayText"];
    }
  }
  if (self->_title)
  {
    v34 = [(_SFPBVerticalLayoutCardSection *)self title];
    v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"title"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"title"];
    }
  }
  if (self->_type)
  {
    v37 = [(_SFPBVerticalLayoutCardSection *)self type];
    v38 = (void *)[v37 copy];
    [v3 setObject:v38 forKeyedSubscript:@"type"];
  }
  if (self->_useAppIconMetrics)
  {
    v39 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBVerticalLayoutCardSection useAppIconMetrics](self, "useAppIconMetrics"));
    [v3 setObject:v39 forKeyedSubscript:@"useAppIconMetrics"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v21 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v20 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v3 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v18 = v4;
  NSUInteger v19 = v3;
  if (self->_hasTopPadding) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v17 = v5;
  if (self->_hasBottomPadding) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_type hash];
  uint64_t v8 = 2654435761 * self->_separatorStyle;
  unint64_t v9 = [(_SFPBColor *)self->_backgroundColor hash];
  unint64_t v10 = [(_SFPBImage *)self->_thumbnail hash];
  unint64_t v11 = [(_SFPBRichText *)self->_title hash];
  unint64_t v12 = [(_SFPBRichText *)self->_footnote hash];
  if (self->_contentsLeading) {
    uint64_t v13 = 2654435761;
  }
  else {
    uint64_t v13 = 0;
  }
  unint64_t v14 = [(_SFPBRichText *)self->_thumbnailOverlayText hash];
  if (self->_useAppIconMetrics) {
    uint64_t v15 = 2654435761;
  }
  else {
    uint64_t v15 = 0;
  }
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  uint64_t v5 = [(_SFPBVerticalLayoutCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v7 = [(_SFPBVerticalLayoutCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBVerticalLayoutCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBVerticalLayoutCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v12 = [(_SFPBVerticalLayoutCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    unint64_t v14 = [(_SFPBVerticalLayoutCardSection *)self punchoutPickerTitle];
    uint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBVerticalLayoutCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v17 = [(_SFPBVerticalLayoutCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    NSUInteger v19 = [(_SFPBVerticalLayoutCardSection *)self punchoutPickerDismissText];
    NSUInteger v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_52;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_52;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_52;
  }
  uint64_t v5 = [(_SFPBVerticalLayoutCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v25 = [(_SFPBVerticalLayoutCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    v27 = [(_SFPBVerticalLayoutCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_52;
  }
  uint64_t v5 = [(_SFPBVerticalLayoutCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v31 = [(_SFPBVerticalLayoutCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_SFPBVerticalLayoutCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBVerticalLayoutCardSection *)self thumbnail];
  uint64_t v6 = [v4 thumbnail];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v36 = [(_SFPBVerticalLayoutCardSection *)self thumbnail];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_SFPBVerticalLayoutCardSection *)self thumbnail];
    v39 = [v4 thumbnail];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBVerticalLayoutCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v41 = [(_SFPBVerticalLayoutCardSection *)self title];
  if (v41)
  {
    long long v42 = (void *)v41;
    long long v43 = [(_SFPBVerticalLayoutCardSection *)self title];
    long long v44 = [v4 title];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBVerticalLayoutCardSection *)self footnote];
  uint64_t v6 = [v4 footnote];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_51;
  }
  uint64_t v46 = [(_SFPBVerticalLayoutCardSection *)self footnote];
  if (v46)
  {
    long long v47 = (void *)v46;
    long long v48 = [(_SFPBVerticalLayoutCardSection *)self footnote];
    long long v49 = [v4 footnote];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  int contentsLeading = self->_contentsLeading;
  if (contentsLeading != [v4 contentsLeading]) {
    goto LABEL_52;
  }
  uint64_t v5 = [(_SFPBVerticalLayoutCardSection *)self thumbnailOverlayText];
  uint64_t v6 = [v4 thumbnailOverlayText];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_51:

    goto LABEL_52;
  }
  uint64_t v52 = [(_SFPBVerticalLayoutCardSection *)self thumbnailOverlayText];
  if (!v52)
  {

LABEL_55:
    int useAppIconMetrics = self->_useAppIconMetrics;
    BOOL v57 = useAppIconMetrics == [v4 useAppIconMetrics];
    goto LABEL_53;
  }
  v53 = (void *)v52;
  v54 = [(_SFPBVerticalLayoutCardSection *)self thumbnailOverlayText];
  v55 = [v4 thumbnailOverlayText];
  int v56 = [v54 isEqual:v55];

  if (v56) {
    goto LABEL_55;
  }
LABEL_52:
  BOOL v57 = 0;
LABEL_53:

  return v57;
}

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBVerticalLayoutCardSection *)self punchoutOptions];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBVerticalLayoutCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBVerticalLayoutCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBVerticalLayoutCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBVerticalLayoutCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBVerticalLayoutCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBVerticalLayoutCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBVerticalLayoutCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBVerticalLayoutCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v14 = [(_SFPBVerticalLayoutCardSection *)self thumbnail];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v15 = [(_SFPBVerticalLayoutCardSection *)self title];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBVerticalLayoutCardSection *)self footnote];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBVerticalLayoutCardSection *)self contentsLeading]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v17 = [(_SFPBVerticalLayoutCardSection *)self thumbnailOverlayText];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBVerticalLayoutCardSection *)self useAppIconMetrics]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBVerticalLayoutCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setUseAppIconMetrics:(BOOL)a3
{
  self->_int useAppIconMetrics = a3;
}

- (void)setThumbnailOverlayText:(id)a3
{
}

- (void)setContentsLeading:(BOOL)a3
{
  self->_int contentsLeading = a3;
}

- (void)setFootnote:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setThumbnail:(id)a3
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