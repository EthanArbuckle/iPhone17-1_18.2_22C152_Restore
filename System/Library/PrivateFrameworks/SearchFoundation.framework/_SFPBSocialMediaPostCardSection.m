@interface _SFPBSocialMediaPostCardSection
- (BOOL)canBeHidden;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)nameNoWrap;
- (BOOL)readFrom:(id)a3;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)footnote;
- (NSString)handle;
- (NSString)name;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)timestamp;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBImage)picture;
- (_SFPBImage)profilePicture;
- (_SFPBImage)verifiedGlyph;
- (_SFPBRichText)post;
- (_SFPBSocialMediaPostCardSection)initWithDictionary:(id)a3;
- (_SFPBSocialMediaPostCardSection)initWithFacade:(id)a3;
- (_SFPBSocialMediaPostCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)nameMaxLines;
- (int)separatorStyle;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addPunchoutOptions:(id)a3;
- (void)clearPunchoutOptions;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setFootnote:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setNameMaxLines:(int)a3;
- (void)setNameNoWrap:(BOOL)a3;
- (void)setPicture:(id)a3;
- (void)setPost:(id)a3;
- (void)setProfilePicture:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setTimestamp:(id)a3;
- (void)setType:(id)a3;
- (void)setVerifiedGlyph:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBSocialMediaPostCardSection

- (_SFPBSocialMediaPostCardSection)initWithFacade:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBSocialMediaPostCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v53 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v52 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v10);
    }

    [(_SFPBSocialMediaPostCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBSocialMediaPostCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBSocialMediaPostCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBSocialMediaPostCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBSocialMediaPostCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBSocialMediaPostCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBSocialMediaPostCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBSocialMediaPostCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBSocialMediaPostCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 name];

    if (v24)
    {
      v25 = [v4 name];
      [(_SFPBSocialMediaPostCardSection *)v5 setName:v25];
    }
    if ([v4 hasNameNoWrap]) {
      -[_SFPBSocialMediaPostCardSection setNameNoWrap:](v5, "setNameNoWrap:", [v4 nameNoWrap]);
    }
    v26 = [v4 nameMaxLines];

    if (v26)
    {
      v27 = [v4 nameMaxLines];
      -[_SFPBSocialMediaPostCardSection setNameMaxLines:](v5, "setNameMaxLines:", [v27 intValue]);
    }
    v28 = [v4 handle];

    if (v28)
    {
      v29 = [v4 handle];
      [(_SFPBSocialMediaPostCardSection *)v5 setHandle:v29];
    }
    v30 = [v4 verifiedGlyph];

    if (v30)
    {
      v31 = [_SFPBImage alloc];
      v32 = [v4 verifiedGlyph];
      v33 = [(_SFPBImage *)v31 initWithFacade:v32];
      [(_SFPBSocialMediaPostCardSection *)v5 setVerifiedGlyph:v33];
    }
    v34 = [v4 profilePicture];

    if (v34)
    {
      v35 = [_SFPBImage alloc];
      v36 = [v4 profilePicture];
      v37 = [(_SFPBImage *)v35 initWithFacade:v36];
      [(_SFPBSocialMediaPostCardSection *)v5 setProfilePicture:v37];
    }
    v38 = [v4 post];

    if (v38)
    {
      v39 = [_SFPBRichText alloc];
      v40 = [v4 post];
      v41 = [(_SFPBRichText *)v39 initWithFacade:v40];
      [(_SFPBSocialMediaPostCardSection *)v5 setPost:v41];
    }
    v42 = [v4 picture];

    if (v42)
    {
      v43 = [_SFPBImage alloc];
      v44 = [v4 picture];
      v45 = [(_SFPBImage *)v43 initWithFacade:v44];
      [(_SFPBSocialMediaPostCardSection *)v5 setPicture:v45];
    }
    v46 = [v4 timestamp];

    if (v46)
    {
      v47 = [v4 timestamp];
      [(_SFPBSocialMediaPostCardSection *)v5 setTimestamp:v47];
    }
    v48 = [v4 footnote];

    if (v48)
    {
      v49 = [v4 footnote];
      [(_SFPBSocialMediaPostCardSection *)v5 setFootnote:v49];
    }
    v50 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_picture, 0);
  objc_storeStrong((id *)&self->_post, 0);
  objc_storeStrong((id *)&self->_profilePicture, 0);
  objc_storeStrong((id *)&self->_verifiedGlyph, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (NSString)footnote
{
  return self->_footnote;
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (_SFPBImage)picture
{
  return self->_picture;
}

- (_SFPBRichText)post
{
  return self->_post;
}

- (_SFPBImage)profilePicture
{
  return self->_profilePicture;
}

- (_SFPBImage)verifiedGlyph
{
  return self->_verifiedGlyph;
}

- (NSString)handle
{
  return self->_handle;
}

- (int)nameMaxLines
{
  return self->_nameMaxLines;
}

- (BOOL)nameNoWrap
{
  return self->_nameNoWrap;
}

- (NSString)name
{
  return self->_name;
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

- (_SFPBSocialMediaPostCardSection)initWithDictionary:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)_SFPBSocialMediaPostCardSection;
  v5 = [(_SFPBSocialMediaPostCardSection *)&v62 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v59 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v58 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBSocialMediaPostCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v58 objects:v63 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBSocialMediaPostCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    long long v52 = v14;
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBSocialMediaPostCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v51 = v16;
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSocialMediaPostCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSocialMediaPostCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSocialMediaPostCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    uint64_t v57 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBSocialMediaPostCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    v56 = v23;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSocialMediaPostCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    long long v55 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBSocialMediaPostCardSection *)v5 setBackgroundColor:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    long long v54 = v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(_SFPBSocialMediaPostCardSection *)v5 setName:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"nameNoWrap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSocialMediaPostCardSection setNameNoWrap:](v5, "setNameNoWrap:", [v28 BOOLValue]);
    }
    v47 = v28;
    v49 = v19;
    v29 = [v4 objectForKeyedSubscript:@"nameMaxLines"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBSocialMediaPostCardSection setNameMaxLines:](v5, "setNameMaxLines:", [v29 intValue]);
    }
    v30 = objc_msgSend(v4, "objectForKeyedSubscript:", @"handle", v29);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = (void *)[v30 copy];
      [(_SFPBSocialMediaPostCardSection *)v5 setHandle:v31];
    }
    v48 = v20;
    v32 = [v4 objectForKeyedSubscript:@"verifiedGlyph"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = [[_SFPBImage alloc] initWithDictionary:v32];
      [(_SFPBSocialMediaPostCardSection *)v5 setVerifiedGlyph:v33];
    }
    long long v53 = v6;
    v34 = [v4 objectForKeyedSubscript:@"profilePicture"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = [[_SFPBImage alloc] initWithDictionary:v34];
      [(_SFPBSocialMediaPostCardSection *)v5 setProfilePicture:v35];
    }
    v36 = [v4 objectForKeyedSubscript:@"post"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v37 = [[_SFPBRichText alloc] initWithDictionary:v36];
      [(_SFPBSocialMediaPostCardSection *)v5 setPost:v37];
    }
    v50 = v18;
    v38 = [v4 objectForKeyedSubscript:@"picture"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [[_SFPBImage alloc] initWithDictionary:v38];
      [(_SFPBSocialMediaPostCardSection *)v5 setPicture:v39];
    }
    v40 = [v4 objectForKeyedSubscript:@"timestamp"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v41 = (void *)[v40 copy];
      [(_SFPBSocialMediaPostCardSection *)v5 setTimestamp:v41];
    }
    v42 = [v4 objectForKeyedSubscript:@"footnote"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v43 = (void *)[v42 copy];
      [(_SFPBSocialMediaPostCardSection *)v5 setFootnote:v43];
    }
    v44 = v5;
  }
  return v5;
}

- (_SFPBSocialMediaPostCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBSocialMediaPostCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBSocialMediaPostCardSection *)self dictionaryRepresentation];
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
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_backgroundColor)
  {
    id v4 = [(_SFPBSocialMediaPostCardSection *)self backgroundColor];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBSocialMediaPostCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v7 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_footnote)
  {
    uint64_t v8 = [(_SFPBSocialMediaPostCardSection *)self footnote];
    uint64_t v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"footnote"];
  }
  if (self->_handle)
  {
    uint64_t v10 = [(_SFPBSocialMediaPostCardSection *)self handle];
    uint64_t v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"handle"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBSocialMediaPostCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v12 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBSocialMediaPostCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v13 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_name)
  {
    v14 = [(_SFPBSocialMediaPostCardSection *)self name];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"name"];
  }
  if (self->_nameMaxLines)
  {
    v16 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBSocialMediaPostCardSection nameMaxLines](self, "nameMaxLines"));
    [v3 setObject:v16 forKeyedSubscript:@"nameMaxLines"];
  }
  if (self->_nameNoWrap)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBSocialMediaPostCardSection nameNoWrap](self, "nameNoWrap"));
    [v3 setObject:v17 forKeyedSubscript:@"nameNoWrap"];
  }
  if (self->_picture)
  {
    v18 = [(_SFPBSocialMediaPostCardSection *)self picture];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"picture"];
    }
    else
    {
      v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"picture"];
    }
  }
  if (self->_post)
  {
    v21 = [(_SFPBSocialMediaPostCardSection *)self post];
    v22 = [v21 dictionaryRepresentation];
    if (v22)
    {
      [v3 setObject:v22 forKeyedSubscript:@"post"];
    }
    else
    {
      v23 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v23 forKeyedSubscript:@"post"];
    }
  }
  if (self->_profilePicture)
  {
    uint64_t v24 = [(_SFPBSocialMediaPostCardSection *)self profilePicture];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"profilePicture"];
    }
    else
    {
      v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"profilePicture"];
    }
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v27 = [MEMORY[0x1E4F1CA48] array];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v28 = self->_punchoutOptions;
    uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v50 != v31) {
            objc_enumerationMutation(v28);
          }
          v33 = [*(id *)(*((void *)&v49 + 1) + 8 * i) dictionaryRepresentation];
          if (v33)
          {
            [v27 addObject:v33];
          }
          else
          {
            v34 = [MEMORY[0x1E4F1CA98] null];
            [v27 addObject:v34];
          }
        }
        uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v30);
    }

    [v3 setObject:v27 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v35 = [(_SFPBSocialMediaPostCardSection *)self punchoutPickerDismissText];
    v36 = (void *)[v35 copy];
    [v3 setObject:v36 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v37 = [(_SFPBSocialMediaPostCardSection *)self punchoutPickerTitle];
    v38 = (void *)[v37 copy];
    [v3 setObject:v38 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v39 = [(_SFPBSocialMediaPostCardSection *)self separatorStyle];
    if (v39 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v39);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = off_1E5A2F090[v39];
    }
    [v3 setObject:v40 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_timestamp)
  {
    v41 = [(_SFPBSocialMediaPostCardSection *)self timestamp];
    v42 = (void *)[v41 copy];
    [v3 setObject:v42 forKeyedSubscript:@"timestamp"];
  }
  if (self->_type)
  {
    v43 = [(_SFPBSocialMediaPostCardSection *)self type];
    v44 = (void *)[v43 copy];
    [v3 setObject:v44 forKeyedSubscript:@"type"];
  }
  if (self->_verifiedGlyph)
  {
    v45 = [(_SFPBSocialMediaPostCardSection *)self verifiedGlyph];
    v46 = [v45 dictionaryRepresentation];
    if (v46)
    {
      [v3 setObject:v46 forKeyedSubscript:@"verifiedGlyph"];
    }
    else
    {
      v47 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v47 forKeyedSubscript:@"verifiedGlyph"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v21 = [(NSArray *)self->_punchoutOptions hash];
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
  NSUInteger v11 = [(NSString *)self->_name hash];
  if (self->_nameNoWrap) {
    uint64_t v12 = 2654435761;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v3 ^ v21 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ (2654435761 * self->_nameMaxLines);
  NSUInteger v14 = [(NSString *)self->_handle hash];
  unint64_t v15 = v14 ^ [(_SFPBImage *)self->_verifiedGlyph hash];
  unint64_t v16 = v15 ^ [(_SFPBImage *)self->_profilePicture hash];
  unint64_t v17 = v16 ^ [(_SFPBRichText *)self->_post hash];
  unint64_t v18 = v17 ^ [(_SFPBImage *)self->_picture hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_timestamp hash];
  return v13 ^ v19 ^ [(NSString *)self->_footnote hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_73;
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v7 = [(_SFPBSocialMediaPostCardSection *)self punchoutOptions];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(_SFPBSocialMediaPostCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v12 = [(_SFPBSocialMediaPostCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    NSUInteger v14 = [(_SFPBSocialMediaPostCardSection *)self punchoutPickerTitle];
    unint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v17 = [(_SFPBSocialMediaPostCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    unint64_t v18 = (void *)v17;
    NSUInteger v19 = [(_SFPBSocialMediaPostCardSection *)self punchoutPickerDismissText];
    v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_73;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_73;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_73;
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v25 = [(_SFPBSocialMediaPostCardSection *)self type];
  if (v25)
  {
    v26 = (void *)v25;
    v27 = [(_SFPBSocialMediaPostCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_73;
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v31 = [(_SFPBSocialMediaPostCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_SFPBSocialMediaPostCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self name];
  uint64_t v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v36 = [(_SFPBSocialMediaPostCardSection *)self name];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_SFPBSocialMediaPostCardSection *)self name];
    uint64_t v39 = [v4 name];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  int nameNoWrap = self->_nameNoWrap;
  if (nameNoWrap != [v4 nameNoWrap]) {
    goto LABEL_73;
  }
  int nameMaxLines = self->_nameMaxLines;
  if (nameMaxLines != [v4 nameMaxLines]) {
    goto LABEL_73;
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self handle];
  uint64_t v6 = [v4 handle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v43 = [(_SFPBSocialMediaPostCardSection *)self handle];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(_SFPBSocialMediaPostCardSection *)self handle];
    v46 = [v4 handle];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self verifiedGlyph];
  uint64_t v6 = [v4 verifiedGlyph];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v48 = [(_SFPBSocialMediaPostCardSection *)self verifiedGlyph];
  if (v48)
  {
    long long v49 = (void *)v48;
    long long v50 = [(_SFPBSocialMediaPostCardSection *)self verifiedGlyph];
    long long v51 = [v4 verifiedGlyph];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self profilePicture];
  uint64_t v6 = [v4 profilePicture];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v53 = [(_SFPBSocialMediaPostCardSection *)self profilePicture];
  if (v53)
  {
    uint64_t v54 = (void *)v53;
    long long v55 = [(_SFPBSocialMediaPostCardSection *)self profilePicture];
    v56 = [v4 profilePicture];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self post];
  uint64_t v6 = [v4 post];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v58 = [(_SFPBSocialMediaPostCardSection *)self post];
  if (v58)
  {
    long long v59 = (void *)v58;
    long long v60 = [(_SFPBSocialMediaPostCardSection *)self post];
    long long v61 = [v4 post];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self picture];
  uint64_t v6 = [v4 picture];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v63 = [(_SFPBSocialMediaPostCardSection *)self picture];
  if (v63)
  {
    uint64_t v64 = (void *)v63;
    v65 = [(_SFPBSocialMediaPostCardSection *)self picture];
    v66 = [v4 picture];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self timestamp];
  uint64_t v6 = [v4 timestamp];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_72;
  }
  uint64_t v68 = [(_SFPBSocialMediaPostCardSection *)self timestamp];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(_SFPBSocialMediaPostCardSection *)self timestamp];
    v71 = [v4 timestamp];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_73;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self footnote];
  uint64_t v6 = [v4 footnote];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_72:

    goto LABEL_73;
  }
  uint64_t v73 = [(_SFPBSocialMediaPostCardSection *)self footnote];
  if (!v73)
  {

LABEL_76:
    BOOL v78 = 1;
    goto LABEL_74;
  }
  v74 = (void *)v73;
  v75 = [(_SFPBSocialMediaPostCardSection *)self footnote];
  v76 = [v4 footnote];
  char v77 = [v75 isEqual:v76];

  if (v77) {
    goto LABEL_76;
  }
LABEL_73:
  BOOL v78 = 0;
LABEL_74:

  return v78;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBSocialMediaPostCardSection *)self punchoutOptions];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  unint64_t v10 = [(_SFPBSocialMediaPostCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBSocialMediaPostCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBSocialMediaPostCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBSocialMediaPostCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBSocialMediaPostCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBSocialMediaPostCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBSocialMediaPostCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v13 = [(_SFPBSocialMediaPostCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v14 = [(_SFPBSocialMediaPostCardSection *)self name];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBSocialMediaPostCardSection *)self nameNoWrap]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBSocialMediaPostCardSection *)self nameMaxLines]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v15 = [(_SFPBSocialMediaPostCardSection *)self handle];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  int v16 = [(_SFPBSocialMediaPostCardSection *)self verifiedGlyph];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBSocialMediaPostCardSection *)self profilePicture];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v18 = [(_SFPBSocialMediaPostCardSection *)self post];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v19 = [(_SFPBSocialMediaPostCardSection *)self picture];
  if (v19) {
    PBDataWriterWriteSubmessage();
  }

  v20 = [(_SFPBSocialMediaPostCardSection *)self timestamp];
  if (v20) {
    PBDataWriterWriteStringField();
  }

  int v21 = [(_SFPBSocialMediaPostCardSection *)self footnote];
  if (v21) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSocialMediaPostCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setFootnote:(id)a3
{
  self->_footnote = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTimestamp:(id)a3
{
  self->_timestamp = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPicture:(id)a3
{
}

- (void)setPost:(id)a3
{
}

- (void)setProfilePicture:(id)a3
{
}

- (void)setVerifiedGlyph:(id)a3
{
}

- (void)setHandle:(id)a3
{
  self->_handle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setNameMaxLines:(int)a3
{
  self->_int nameMaxLines = a3;
}

- (void)setNameNoWrap:(BOOL)a3
{
  self->_int nameNoWrap = a3;
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];
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