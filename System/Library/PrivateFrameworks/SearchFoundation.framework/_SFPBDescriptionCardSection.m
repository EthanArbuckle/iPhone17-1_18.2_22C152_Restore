@interface _SFPBDescriptionCardSection
- (BOOL)canBeHidden;
- (BOOL)descriptionExpand;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)titleNoWrap;
- (NSArray)punchoutOptions;
- (NSArray)richDescriptions;
- (NSData)jsonData;
- (NSString)attributionText;
- (NSString)expandText;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)subtitle;
- (NSString)title;
- (NSString)type;
- (_SFPBColor)backgroundColor;
- (_SFPBDescriptionCardSection)initWithDictionary:(id)a3;
- (_SFPBDescriptionCardSection)initWithFacade:(id)a3;
- (_SFPBDescriptionCardSection)initWithJSON:(id)a3;
- (_SFPBImage)attributionGlyph;
- (_SFPBImage)image;
- (_SFPBText)descriptionText;
- (_SFPBURL)attributionURL;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (id)richDescriptionsAtIndex:(unint64_t)a3;
- (int)descriptionSize;
- (int)descriptionWeight;
- (int)imageAlign;
- (int)separatorStyle;
- (int)textAlign;
- (int)titleWeight;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (unint64_t)richDescriptionsCount;
- (void)addPunchoutOptions:(id)a3;
- (void)addRichDescriptions:(id)a3;
- (void)clearPunchoutOptions;
- (void)clearRichDescriptions;
- (void)setAttributionGlyph:(id)a3;
- (void)setAttributionText:(id)a3;
- (void)setAttributionURL:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setDescriptionExpand:(BOOL)a3;
- (void)setDescriptionSize:(int)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDescriptionWeight:(int)a3;
- (void)setExpandText:(id)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageAlign:(int)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setRichDescriptions:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setTextAlign:(int)a3;
- (void)setTitle:(id)a3;
- (void)setTitleNoWrap:(BOOL)a3;
- (void)setTitleWeight:(int)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBDescriptionCardSection

- (_SFPBDescriptionCardSection)initWithFacade:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBDescriptionCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v8 = [v4 punchoutOptions];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v68 objects:v73 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v69 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v68 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v68 objects:v73 count:16];
      }
      while (v10);
    }

    [(_SFPBDescriptionCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBDescriptionCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBDescriptionCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBDescriptionCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBDescriptionCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBDescriptionCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBDescriptionCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBDescriptionCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBDescriptionCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 title];

    if (v24)
    {
      v25 = [v4 title];
      [(_SFPBDescriptionCardSection *)v5 setTitle:v25];
    }
    v26 = [v4 subtitle];

    if (v26)
    {
      v27 = [v4 subtitle];
      [(_SFPBDescriptionCardSection *)v5 setSubtitle:v27];
    }
    v28 = [v4 descriptionText];

    if (v28)
    {
      v29 = [_SFPBText alloc];
      v30 = [v4 descriptionText];
      v31 = [(_SFPBText *)v29 initWithFacade:v30];
      [(_SFPBDescriptionCardSection *)v5 setDescriptionText:v31];
    }
    v32 = [v4 expandText];

    if (v32)
    {
      v33 = [v4 expandText];
      [(_SFPBDescriptionCardSection *)v5 setExpandText:v33];
    }
    v34 = [v4 image];

    if (v34)
    {
      v35 = [_SFPBImage alloc];
      v36 = [v4 image];
      v37 = [(_SFPBImage *)v35 initWithFacade:v36];
      [(_SFPBDescriptionCardSection *)v5 setImage:v37];
    }
    if ([v4 hasTitleNoWrap]) {
      -[_SFPBDescriptionCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", [v4 titleNoWrap]);
    }
    v38 = [v4 titleWeight];

    if (v38)
    {
      v39 = [v4 titleWeight];
      -[_SFPBDescriptionCardSection setTitleWeight:](v5, "setTitleWeight:", [v39 intValue]);
    }
    v40 = [v4 descriptionSize];

    if (v40)
    {
      v41 = [v4 descriptionSize];
      -[_SFPBDescriptionCardSection setDescriptionSize:](v5, "setDescriptionSize:", [v41 intValue]);
    }
    v42 = [v4 descriptionWeight];

    if (v42)
    {
      v43 = [v4 descriptionWeight];
      -[_SFPBDescriptionCardSection setDescriptionWeight:](v5, "setDescriptionWeight:", [v43 intValue]);
    }
    if ([v4 hasDescriptionExpand]) {
      -[_SFPBDescriptionCardSection setDescriptionExpand:](v5, "setDescriptionExpand:", [v4 descriptionExpand]);
    }
    if ([v4 hasImageAlign]) {
      -[_SFPBDescriptionCardSection setImageAlign:](v5, "setImageAlign:", [v4 imageAlign]);
    }
    if ([v4 hasTextAlign]) {
      -[_SFPBDescriptionCardSection setTextAlign:](v5, "setTextAlign:", [v4 textAlign]);
    }
    v44 = [v4 attributionText];

    if (v44)
    {
      v45 = [v4 attributionText];
      [(_SFPBDescriptionCardSection *)v5 setAttributionText:v45];
    }
    v46 = [v4 attributionURL];

    if (v46)
    {
      v47 = [_SFPBURL alloc];
      v48 = [v4 attributionURL];
      v49 = [(_SFPBURL *)v47 initWithNSURL:v48];
      [(_SFPBDescriptionCardSection *)v5 setAttributionURL:v49];
    }
    v50 = [v4 attributionGlyph];

    if (v50)
    {
      v51 = [_SFPBImage alloc];
      v52 = [v4 attributionGlyph];
      v53 = [(_SFPBImage *)v51 initWithFacade:v52];
      [(_SFPBDescriptionCardSection *)v5 setAttributionGlyph:v53];
    }
    v54 = [v4 richDescriptions];
    if (v54) {
      id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v55 = 0;
    }

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v56 = objc_msgSend(v4, "richDescriptions", 0);
    uint64_t v57 = [v56 countByEnumeratingWithState:&v64 objects:v72 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v65;
      do
      {
        for (uint64_t j = 0; j != v58; ++j)
        {
          if (*(void *)v65 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = [[_SFPBRichText alloc] initWithFacade:*(void *)(*((void *)&v64 + 1) + 8 * j)];
          if (v61) {
            [v55 addObject:v61];
          }
        }
        uint64_t v58 = [v56 countByEnumeratingWithState:&v64 objects:v72 count:16];
      }
      while (v58);
    }

    [(_SFPBDescriptionCardSection *)v5 setRichDescriptions:v55];
    v62 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richDescriptions, 0);
  objc_storeStrong((id *)&self->_attributionGlyph, 0);
  objc_storeStrong((id *)&self->_attributionURL, 0);
  objc_storeStrong((id *)&self->_attributionText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_expandText, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (NSArray)richDescriptions
{
  return self->_richDescriptions;
}

- (_SFPBImage)attributionGlyph
{
  return self->_attributionGlyph;
}

- (_SFPBURL)attributionURL
{
  return self->_attributionURL;
}

- (NSString)attributionText
{
  return self->_attributionText;
}

- (int)textAlign
{
  return self->_textAlign;
}

- (int)imageAlign
{
  return self->_imageAlign;
}

- (BOOL)descriptionExpand
{
  return self->_descriptionExpand;
}

- (int)descriptionWeight
{
  return self->_descriptionWeight;
}

- (int)descriptionSize
{
  return self->_descriptionSize;
}

- (int)titleWeight
{
  return self->_titleWeight;
}

- (BOOL)titleNoWrap
{
  return self->_titleNoWrap;
}

- (_SFPBImage)image
{
  return self->_image;
}

- (NSString)expandText
{
  return self->_expandText;
}

- (_SFPBText)descriptionText
{
  return self->_descriptionText;
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

- (_SFPBDescriptionCardSection)initWithDictionary:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)_SFPBDescriptionCardSection;
  v5 = [(_SFPBDescriptionCardSection *)&v93 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v89 objects:v95 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v90;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v90 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v89 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBDescriptionCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v89 objects:v95 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBDescriptionCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v84 = v14;
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBDescriptionCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDescriptionCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v83 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDescriptionCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v82 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDescriptionCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    v81 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBDescriptionCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    v80 = v23;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDescriptionCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    v79 = (void *)v24;
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBDescriptionCardSection *)v5 setBackgroundColor:v25];
    }
    v26 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    v78 = v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = (void *)[v26 copy];
      [(_SFPBDescriptionCardSection *)v5 setTitle:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"subtitle"];
    objc_opt_class();
    v77 = v28;
    if (objc_opt_isKindOfClass())
    {
      v29 = (void *)[v28 copy];
      [(_SFPBDescriptionCardSection *)v5 setSubtitle:v29];
    }
    uint64_t v30 = [v4 objectForKeyedSubscript:@"descriptionText"];
    objc_opt_class();
    v76 = (void *)v30;
    if (objc_opt_isKindOfClass())
    {
      v31 = [[_SFPBText alloc] initWithDictionary:v30];
      [(_SFPBDescriptionCardSection *)v5 setDescriptionText:v31];
    }
    long long v69 = v18;
    v32 = [v4 objectForKeyedSubscript:@"expandText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = (void *)[v32 copy];
      [(_SFPBDescriptionCardSection *)v5 setExpandText:v33];
    }
    long long v68 = v32;
    uint64_t v34 = [v4 objectForKeyedSubscript:@"image"];
    objc_opt_class();
    v75 = (void *)v34;
    if (objc_opt_isKindOfClass())
    {
      v35 = [[_SFPBImage alloc] initWithDictionary:v34];
      [(_SFPBDescriptionCardSection *)v5 setImage:v35];
    }
    v36 = [v4 objectForKeyedSubscript:@"titleNoWrap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDescriptionCardSection setTitleNoWrap:](v5, "setTitleNoWrap:", [v36 BOOLValue]);
    }
    v37 = [v4 objectForKeyedSubscript:@"titleWeight"];
    objc_opt_class();
    uint64_t v74 = v37;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDescriptionCardSection setTitleWeight:](v5, "setTitleWeight:", [v37 intValue]);
    }
    v38 = v6;
    v39 = [v4 objectForKeyedSubscript:@"descriptionSize"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDescriptionCardSection setDescriptionSize:](v5, "setDescriptionSize:", [v39 intValue]);
    }
    v40 = [v4 objectForKeyedSubscript:@"descriptionWeight"];
    objc_opt_class();
    v73 = v40;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDescriptionCardSection setDescriptionWeight:](v5, "setDescriptionWeight:", [v40 intValue]);
    }
    uint64_t v41 = [v4 objectForKeyedSubscript:@"descriptionExpand"];
    objc_opt_class();
    v72 = (void *)v41;
    v42 = v38;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDescriptionCardSection setDescriptionExpand:](v5, "setDescriptionExpand:", [v72 BOOLValue]);
    }
    v43 = [v4 objectForKeyedSubscript:@"imageAlign"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDescriptionCardSection setImageAlign:](v5, "setImageAlign:", [v43 intValue]);
    }
    long long v67 = v36;
    v44 = [v4 objectForKeyedSubscript:@"textAlign"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBDescriptionCardSection setTextAlign:](v5, "setTextAlign:", [v44 intValue]);
    }
    long long v66 = v44;
    v45 = [v4 objectForKeyedSubscript:@"attributionText"];
    objc_opt_class();
    v46 = v84;
    if (objc_opt_isKindOfClass())
    {
      v47 = (void *)[v45 copy];
      [(_SFPBDescriptionCardSection *)v5 setAttributionText:v47];
    }
    uint64_t v48 = [v4 objectForKeyedSubscript:@"attributionURL"];
    objc_opt_class();
    long long v71 = (void *)v48;
    if (objc_opt_isKindOfClass())
    {
      v49 = [[_SFPBURL alloc] initWithDictionary:v48];
      [(_SFPBDescriptionCardSection *)v5 setAttributionURL:v49];
    }
    uint64_t v50 = [v4 objectForKeyedSubscript:@"attributionGlyph"];
    objc_opt_class();
    long long v70 = (void *)v50;
    if (objc_opt_isKindOfClass())
    {
      v51 = [[_SFPBImage alloc] initWithDictionary:v50];
      [(_SFPBDescriptionCardSection *)v5 setAttributionGlyph:v51];
    }
    v52 = [v4 objectForKeyedSubscript:@"richDescriptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v62 = v45;
      v63 = v43;
      long long v64 = v39;
      long long v65 = v42;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v53 = v52;
      uint64_t v54 = [v53 countByEnumeratingWithState:&v85 objects:v94 count:16];
      if (v54)
      {
        uint64_t v55 = v54;
        uint64_t v56 = *(void *)v86;
        do
        {
          for (uint64_t j = 0; j != v55; ++j)
          {
            if (*(void *)v86 != v56) {
              objc_enumerationMutation(v53);
            }
            uint64_t v58 = *(void *)(*((void *)&v85 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v59 = [[_SFPBRichText alloc] initWithDictionary:v58];
              [(_SFPBDescriptionCardSection *)v5 addRichDescriptions:v59];
            }
          }
          uint64_t v55 = [v53 countByEnumeratingWithState:&v85 objects:v94 count:16];
        }
        while (v55);
      }

      v42 = v65;
      v46 = v84;
      v43 = v63;
      v39 = v64;
      v45 = v62;
    }
    v60 = v5;
  }
  return v5;
}

- (_SFPBDescriptionCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBDescriptionCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBDescriptionCardSection *)self dictionaryRepresentation];
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
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_attributionGlyph)
  {
    id v4 = [(_SFPBDescriptionCardSection *)self attributionGlyph];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"attributionGlyph"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"attributionGlyph"];
    }
  }
  if (self->_attributionText)
  {
    uint64_t v7 = [(_SFPBDescriptionCardSection *)self attributionText];
    uint64_t v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"attributionText"];
  }
  if (self->_attributionURL)
  {
    uint64_t v9 = [(_SFPBDescriptionCardSection *)self attributionURL];
    uint64_t v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"attributionURL"];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"attributionURL"];
    }
  }
  if (self->_backgroundColor)
  {
    uint64_t v12 = [(_SFPBDescriptionCardSection *)self backgroundColor];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"backgroundColor"];
    }
  }
  unint64_t v15 = 0x1E4F28000uLL;
  if (self->_canBeHidden)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDescriptionCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v16 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_descriptionExpand)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDescriptionCardSection descriptionExpand](self, "descriptionExpand"));
    [v3 setObject:v17 forKeyedSubscript:@"descriptionExpand"];
  }
  if (self->_descriptionSize)
  {
    v18 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBDescriptionCardSection descriptionSize](self, "descriptionSize"));
    [v3 setObject:v18 forKeyedSubscript:@"descriptionSize"];
  }
  if (self->_descriptionText)
  {
    v19 = [(_SFPBDescriptionCardSection *)self descriptionText];
    v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"descriptionText"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"descriptionText"];
    }
  }
  if (self->_descriptionWeight)
  {
    v22 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBDescriptionCardSection descriptionWeight](self, "descriptionWeight"));
    [v3 setObject:v22 forKeyedSubscript:@"descriptionWeight"];
  }
  if (self->_expandText)
  {
    v23 = [(_SFPBDescriptionCardSection *)self expandText];
    uint64_t v24 = (void *)[v23 copy];
    [v3 setObject:v24 forKeyedSubscript:@"expandText"];
  }
  if (self->_hasBottomPadding)
  {
    v25 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDescriptionCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v25 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v26 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBDescriptionCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v26 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_image)
  {
    v27 = [(_SFPBDescriptionCardSection *)self image];
    v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"image"];
    }
    else
    {
      v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"image"];
    }
  }
  if (self->_imageAlign)
  {
    uint64_t v30 = [(_SFPBDescriptionCardSection *)self imageAlign];
    if (v30 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v30);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E5A2EF58[v30];
    }
    [v3 setObject:v31 forKeyedSubscript:@"imageAlign"];
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v32 = [MEMORY[0x1E4F1CA48] array];
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v33 = self->_punchoutOptions;
    uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v71 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [*(id *)(*((void *)&v70 + 1) + 8 * i) dictionaryRepresentation];
          if (v38)
          {
            [v32 addObject:v38];
          }
          else
          {
            v39 = [MEMORY[0x1E4F1CA98] null];
            [v32 addObject:v39];
          }
        }
        uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v70 objects:v75 count:16];
      }
      while (v35);
    }

    [v3 setObject:v32 forKeyedSubscript:@"punchoutOptions"];
    unint64_t v15 = 0x1E4F28000;
  }
  if (self->_punchoutPickerDismissText)
  {
    v40 = [(_SFPBDescriptionCardSection *)self punchoutPickerDismissText];
    uint64_t v41 = (void *)[v40 copy];
    [v3 setObject:v41 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v42 = [(_SFPBDescriptionCardSection *)self punchoutPickerTitle];
    v43 = (void *)[v42 copy];
    [v3 setObject:v43 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if ([(NSArray *)self->_richDescriptions count])
  {
    v44 = [MEMORY[0x1E4F1CA48] array];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    v45 = self->_richDescriptions;
    uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v67;
      do
      {
        for (uint64_t j = 0; j != v47; ++j)
        {
          if (*(void *)v67 != v48) {
            objc_enumerationMutation(v45);
          }
          uint64_t v50 = [*(id *)(*((void *)&v66 + 1) + 8 * j) dictionaryRepresentation];
          if (v50)
          {
            [v44 addObject:v50];
          }
          else
          {
            v51 = [MEMORY[0x1E4F1CA98] null];
            [v44 addObject:v51];
          }
        }
        uint64_t v47 = [(NSArray *)v45 countByEnumeratingWithState:&v66 objects:v74 count:16];
      }
      while (v47);
    }

    [v3 setObject:v44 forKeyedSubscript:@"richDescriptions"];
    unint64_t v15 = 0x1E4F28000uLL;
  }
  if (self->_separatorStyle)
  {
    uint64_t v52 = [(_SFPBDescriptionCardSection *)self separatorStyle];
    if (v52 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v52);
      id v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v53 = off_1E5A2F090[v52];
    }
    [v3 setObject:v53 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_subtitle)
  {
    uint64_t v54 = [(_SFPBDescriptionCardSection *)self subtitle];
    uint64_t v55 = (void *)[v54 copy];
    [v3 setObject:v55 forKeyedSubscript:@"subtitle"];
  }
  if (self->_textAlign)
  {
    uint64_t v56 = [(_SFPBDescriptionCardSection *)self textAlign];
    if (v56 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v56);
      uint64_t v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v57 = off_1E5A2F058[v56];
    }
    [v3 setObject:v57 forKeyedSubscript:@"textAlign"];
  }
  if (self->_title)
  {
    uint64_t v58 = [(_SFPBDescriptionCardSection *)self title];
    uint64_t v59 = (void *)[v58 copy];
    [v3 setObject:v59 forKeyedSubscript:@"title"];
  }
  if (self->_titleNoWrap)
  {
    v60 = objc_msgSend(*(id *)(v15 + 3792), "numberWithBool:", -[_SFPBDescriptionCardSection titleNoWrap](self, "titleNoWrap"));
    [v3 setObject:v60 forKeyedSubscript:@"titleNoWrap"];
  }
  if (self->_titleWeight)
  {
    v61 = objc_msgSend(*(id *)(v15 + 3792), "numberWithInt:", -[_SFPBDescriptionCardSection titleWeight](self, "titleWeight"));
    [v3 setObject:v61 forKeyedSubscript:@"titleWeight"];
  }
  if (self->_type)
  {
    v62 = [(_SFPBDescriptionCardSection *)self type];
    v63 = (void *)[v62 copy];
    [v3 setObject:v63 forKeyedSubscript:@"type"];
  }
  id v64 = v3;

  return v64;
}

- (unint64_t)hash
{
  uint64_t v26 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v25 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v3 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v23 = v4;
  NSUInteger v24 = v3;
  if (self->_hasTopPadding) {
    uint64_t v5 = 2654435761;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v22 = v5;
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
  unint64_t v12 = [(_SFPBText *)self->_descriptionText hash];
  NSUInteger v13 = [(NSString *)self->_expandText hash];
  unint64_t v14 = [(_SFPBImage *)self->_image hash];
  if (self->_titleNoWrap) {
    uint64_t v15 = 2654435761;
  }
  else {
    uint64_t v15 = 0;
  }
  if (self->_descriptionExpand) {
    uint64_t v16 = 2654435761;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v17 = v25 ^ v26 ^ v24 ^ v23 ^ v22 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ (2654435761
                                                                                             * self->_titleWeight) ^ (2654435761 * self->_descriptionSize) ^ (2654435761 * self->_descriptionWeight) ^ v16 ^ (2654435761 * self->_imageAlign) ^ (2654435761 * self->_textAlign);
  NSUInteger v18 = [(NSString *)self->_attributionText hash];
  unint64_t v19 = v18 ^ [(_SFPBURL *)self->_attributionURL hash];
  unint64_t v20 = v19 ^ [(_SFPBImage *)self->_attributionGlyph hash];
  return v17 ^ v20 ^ [(NSArray *)self->_richDescriptions hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_83;
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v7 = [(_SFPBDescriptionCardSection *)self punchoutOptions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    unint64_t v9 = [(_SFPBDescriptionCardSection *)self punchoutOptions];
    NSUInteger v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v12 = [(_SFPBDescriptionCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    unint64_t v14 = [(_SFPBDescriptionCardSection *)self punchoutPickerTitle];
    uint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v17 = [(_SFPBDescriptionCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    NSUInteger v18 = (void *)v17;
    unint64_t v19 = [(_SFPBDescriptionCardSection *)self punchoutPickerDismissText];
    unint64_t v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_83;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_83;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_83;
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v25 = [(_SFPBDescriptionCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    v27 = [(_SFPBDescriptionCardSection *)self type];
    v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_83;
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v31 = [(_SFPBDescriptionCardSection *)self backgroundColor];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(_SFPBDescriptionCardSection *)self backgroundColor];
    uint64_t v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v36 = [(_SFPBDescriptionCardSection *)self title];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_SFPBDescriptionCardSection *)self title];
    v39 = [v4 title];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self subtitle];
  uint64_t v6 = [v4 subtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v41 = [(_SFPBDescriptionCardSection *)self subtitle];
  if (v41)
  {
    v42 = (void *)v41;
    v43 = [(_SFPBDescriptionCardSection *)self subtitle];
    v44 = [v4 subtitle];
    int v45 = [v43 isEqual:v44];

    if (!v45) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self descriptionText];
  uint64_t v6 = [v4 descriptionText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v46 = [(_SFPBDescriptionCardSection *)self descriptionText];
  if (v46)
  {
    uint64_t v47 = (void *)v46;
    uint64_t v48 = [(_SFPBDescriptionCardSection *)self descriptionText];
    v49 = [v4 descriptionText];
    int v50 = [v48 isEqual:v49];

    if (!v50) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self expandText];
  uint64_t v6 = [v4 expandText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v51 = [(_SFPBDescriptionCardSection *)self expandText];
  if (v51)
  {
    uint64_t v52 = (void *)v51;
    id v53 = [(_SFPBDescriptionCardSection *)self expandText];
    uint64_t v54 = [v4 expandText];
    int v55 = [v53 isEqual:v54];

    if (!v55) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self image];
  uint64_t v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v56 = [(_SFPBDescriptionCardSection *)self image];
  if (v56)
  {
    uint64_t v57 = (void *)v56;
    uint64_t v58 = [(_SFPBDescriptionCardSection *)self image];
    uint64_t v59 = [v4 image];
    int v60 = [v58 isEqual:v59];

    if (!v60) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  int titleNoWrap = self->_titleNoWrap;
  if (titleNoWrap != [v4 titleNoWrap]) {
    goto LABEL_83;
  }
  int titleWeight = self->_titleWeight;
  if (titleWeight != [v4 titleWeight]) {
    goto LABEL_83;
  }
  int descriptionSize = self->_descriptionSize;
  if (descriptionSize != [v4 descriptionSize]) {
    goto LABEL_83;
  }
  int descriptionWeight = self->_descriptionWeight;
  if (descriptionWeight != [v4 descriptionWeight]) {
    goto LABEL_83;
  }
  int descriptionExpand = self->_descriptionExpand;
  if (descriptionExpand != [v4 descriptionExpand]) {
    goto LABEL_83;
  }
  int imageAlign = self->_imageAlign;
  if (imageAlign != [v4 imageAlign]) {
    goto LABEL_83;
  }
  int textAlign = self->_textAlign;
  if (textAlign != [v4 textAlign]) {
    goto LABEL_83;
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self attributionText];
  uint64_t v6 = [v4 attributionText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v68 = [(_SFPBDescriptionCardSection *)self attributionText];
  if (v68)
  {
    long long v69 = (void *)v68;
    long long v70 = [(_SFPBDescriptionCardSection *)self attributionText];
    long long v71 = [v4 attributionText];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self attributionURL];
  uint64_t v6 = [v4 attributionURL];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v73 = [(_SFPBDescriptionCardSection *)self attributionURL];
  if (v73)
  {
    uint64_t v74 = (void *)v73;
    v75 = [(_SFPBDescriptionCardSection *)self attributionURL];
    uint64_t v76 = [v4 attributionURL];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self attributionGlyph];
  uint64_t v6 = [v4 attributionGlyph];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_82;
  }
  uint64_t v78 = [(_SFPBDescriptionCardSection *)self attributionGlyph];
  if (v78)
  {
    v79 = (void *)v78;
    v80 = [(_SFPBDescriptionCardSection *)self attributionGlyph];
    v81 = [v4 attributionGlyph];
    int v82 = [v80 isEqual:v81];

    if (!v82) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self richDescriptions];
  uint64_t v6 = [v4 richDescriptions];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_82:

    goto LABEL_83;
  }
  uint64_t v83 = [(_SFPBDescriptionCardSection *)self richDescriptions];
  if (!v83)
  {

LABEL_86:
    BOOL v88 = 1;
    goto LABEL_84;
  }
  v84 = (void *)v83;
  long long v85 = [(_SFPBDescriptionCardSection *)self richDescriptions];
  long long v86 = [v4 richDescriptions];
  char v87 = [v85 isEqual:v86];

  if (v87) {
    goto LABEL_86;
  }
LABEL_83:
  BOOL v88 = 0;
LABEL_84:

  return v88;
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBDescriptionCardSection *)self punchoutOptions];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v7);
  }

  NSUInteger v10 = [(_SFPBDescriptionCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBDescriptionCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBDescriptionCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBDescriptionCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBDescriptionCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBDescriptionCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBDescriptionCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v13 = [(_SFPBDescriptionCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v14 = [(_SFPBDescriptionCardSection *)self title];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  uint64_t v15 = [(_SFPBDescriptionCardSection *)self subtitle];
  if (v15) {
    PBDataWriterWriteStringField();
  }

  int v16 = [(_SFPBDescriptionCardSection *)self descriptionText];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBDescriptionCardSection *)self expandText];
  if (v17) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v18 = [(_SFPBDescriptionCardSection *)self image];
  if (v18) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBDescriptionCardSection *)self titleNoWrap]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBDescriptionCardSection *)self titleWeight]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBDescriptionCardSection *)self descriptionSize]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBDescriptionCardSection *)self descriptionWeight]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBDescriptionCardSection *)self descriptionExpand]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBDescriptionCardSection *)self imageAlign]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBDescriptionCardSection *)self textAlign]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v19 = [(_SFPBDescriptionCardSection *)self attributionText];
  if (v19) {
    PBDataWriterWriteStringField();
  }

  unint64_t v20 = [(_SFPBDescriptionCardSection *)self attributionURL];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  int v21 = [(_SFPBDescriptionCardSection *)self attributionGlyph];
  if (v21) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v22 = [(_SFPBDescriptionCardSection *)self richDescriptions];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v24);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDescriptionCardSectionReadFrom(self, (uint64_t)a3);
}

- (id)richDescriptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_richDescriptions objectAtIndexedSubscript:a3];
}

- (unint64_t)richDescriptionsCount
{
  return [(NSArray *)self->_richDescriptions count];
}

- (void)addRichDescriptions:(id)a3
{
  id v4 = a3;
  richDescriptions = self->_richDescriptions;
  id v8 = v4;
  if (!richDescriptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_richDescriptions;
    self->_richDescriptions = v6;

    id v4 = v8;
    richDescriptions = self->_richDescriptions;
  }
  [(NSArray *)richDescriptions addObject:v4];
}

- (void)clearRichDescriptions
{
}

- (void)setRichDescriptions:(id)a3
{
  self->_richDescriptions = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAttributionGlyph:(id)a3
{
}

- (void)setAttributionURL:(id)a3
{
}

- (void)setAttributionText:(id)a3
{
  self->_attributionText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTextAlign:(int)a3
{
  self->_int textAlign = a3;
}

- (void)setImageAlign:(int)a3
{
  self->_int imageAlign = a3;
}

- (void)setDescriptionExpand:(BOOL)a3
{
  self->_int descriptionExpand = a3;
}

- (void)setDescriptionWeight:(int)a3
{
  self->_int descriptionWeight = a3;
}

- (void)setDescriptionSize:(int)a3
{
  self->_int descriptionSize = a3;
}

- (void)setTitleWeight:(int)a3
{
  self->_int titleWeight = a3;
}

- (void)setTitleNoWrap:(BOOL)a3
{
  self->_int titleNoWrap = a3;
}

- (void)setImage:(id)a3
{
}

- (void)setExpandText:(id)a3
{
  self->_expandText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDescriptionText:(id)a3
{
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