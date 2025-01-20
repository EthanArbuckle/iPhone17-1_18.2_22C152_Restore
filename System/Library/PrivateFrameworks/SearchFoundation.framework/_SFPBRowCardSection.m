@interface _SFPBRowCardSection
- (BOOL)canBeHidden;
- (BOOL)cardPaddingBottom;
- (BOOL)hasBottomPadding;
- (BOOL)hasTopPadding;
- (BOOL)imageIsRightAligned;
- (BOOL)isEqual:(id)a3;
- (BOOL)keyNoWrap;
- (BOOL)readFrom:(id)a3;
- (BOOL)valueNoWrap;
- (NSArray)punchoutOptions;
- (NSData)jsonData;
- (NSString)key;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)type;
- (NSString)value;
- (_SFPBColor)backgroundColor;
- (_SFPBImage)attributionImage;
- (_SFPBImage)image;
- (_SFPBRichText)leadingSubtitle;
- (_SFPBRichText)leadingText;
- (_SFPBRichText)trailingSubtitle;
- (_SFPBRichText)trailingText;
- (_SFPBRowCardSection)initWithDictionary:(id)a3;
- (_SFPBRowCardSection)initWithFacade:(id)a3;
- (_SFPBRowCardSection)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)punchoutOptionsAtIndex:(unint64_t)a3;
- (int)keyWeight;
- (int)separatorStyle;
- (int)valueWeight;
- (unint64_t)hash;
- (unint64_t)punchoutOptionsCount;
- (void)addPunchoutOptions:(id)a3;
- (void)clearPunchoutOptions;
- (void)setAttributionImage:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setCardPaddingBottom:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageIsRightAligned:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setKeyNoWrap:(BOOL)a3;
- (void)setKeyWeight:(int)a3;
- (void)setLeadingSubtitle:(id)a3;
- (void)setLeadingText:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setTrailingSubtitle:(id)a3;
- (void)setTrailingText:(id)a3;
- (void)setType:(id)a3;
- (void)setValue:(id)a3;
- (void)setValueNoWrap:(BOOL)a3;
- (void)setValueWeight:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRowCardSection

- (_SFPBRowCardSection)initWithFacade:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRowCardSection *)self init];
  if (v5)
  {
    v6 = [v4 punchoutOptions];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v8 = objc_msgSend(v4, "punchoutOptions", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v58 objects:v62 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v59 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v58 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v58 objects:v62 count:16];
      }
      while (v10);
    }

    [(_SFPBRowCardSection *)v5 setPunchoutOptions:v7];
    v14 = [v4 punchoutPickerTitle];

    if (v14)
    {
      v15 = [v4 punchoutPickerTitle];
      [(_SFPBRowCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 punchoutPickerDismissText];

    if (v16)
    {
      v17 = [v4 punchoutPickerDismissText];
      [(_SFPBRowCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    if ([v4 hasCanBeHidden]) {
      -[_SFPBRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v4 canBeHidden]);
    }
    if ([v4 hasHasTopPadding]) {
      -[_SFPBRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v4 hasTopPadding]);
    }
    if ([v4 hasHasBottomPadding]) {
      -[_SFPBRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v4 hasBottomPadding]);
    }
    v18 = [v4 type];

    if (v18)
    {
      v19 = [v4 type];
      [(_SFPBRowCardSection *)v5 setType:v19];
    }
    if ([v4 hasSeparatorStyle]) {
      -[_SFPBRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v4 separatorStyle]);
    }
    v20 = [v4 backgroundColor];

    if (v20)
    {
      v21 = [_SFPBColor alloc];
      v22 = [v4 backgroundColor];
      v23 = [(_SFPBColor *)v21 initWithFacade:v22];
      [(_SFPBRowCardSection *)v5 setBackgroundColor:v23];
    }
    v24 = [v4 image];

    if (v24)
    {
      v25 = [_SFPBImage alloc];
      v26 = [v4 image];
      v27 = [(_SFPBImage *)v25 initWithFacade:v26];
      [(_SFPBRowCardSection *)v5 setImage:v27];
    }
    if ([v4 hasImageIsRightAligned]) {
      -[_SFPBRowCardSection setImageIsRightAligned:](v5, "setImageIsRightAligned:", [v4 imageIsRightAligned]);
    }
    v28 = [v4 leadingText];

    if (v28)
    {
      v29 = [_SFPBRichText alloc];
      v30 = [v4 leadingText];
      v31 = [(_SFPBRichText *)v29 initWithFacade:v30];
      [(_SFPBRowCardSection *)v5 setLeadingText:v31];
    }
    v32 = [v4 trailingText];

    if (v32)
    {
      v33 = [_SFPBRichText alloc];
      v34 = [v4 trailingText];
      v35 = [(_SFPBRichText *)v33 initWithFacade:v34];
      [(_SFPBRowCardSection *)v5 setTrailingText:v35];
    }
    v36 = [v4 attributionImage];

    if (v36)
    {
      v37 = [_SFPBImage alloc];
      v38 = [v4 attributionImage];
      v39 = [(_SFPBImage *)v37 initWithFacade:v38];
      [(_SFPBRowCardSection *)v5 setAttributionImage:v39];
    }
    v40 = [v4 key];

    if (v40)
    {
      v41 = [v4 key];
      [(_SFPBRowCardSection *)v5 setKey:v41];
    }
    if ([v4 hasKeyNoWrap]) {
      -[_SFPBRowCardSection setKeyNoWrap:](v5, "setKeyNoWrap:", [v4 keyNoWrap]);
    }
    v42 = [v4 keyWeight];

    if (v42)
    {
      v43 = [v4 keyWeight];
      -[_SFPBRowCardSection setKeyWeight:](v5, "setKeyWeight:", [v43 intValue]);
    }
    v44 = [v4 value];

    if (v44)
    {
      v45 = [v4 value];
      [(_SFPBRowCardSection *)v5 setValue:v45];
    }
    if ([v4 hasValueNoWrap]) {
      -[_SFPBRowCardSection setValueNoWrap:](v5, "setValueNoWrap:", [v4 valueNoWrap]);
    }
    v46 = [v4 valueWeight];

    if (v46)
    {
      v47 = [v4 valueWeight];
      -[_SFPBRowCardSection setValueWeight:](v5, "setValueWeight:", [v47 intValue]);
    }
    if ([v4 hasCardPaddingBottom]) {
      -[_SFPBRowCardSection setCardPaddingBottom:](v5, "setCardPaddingBottom:", [v4 cardPaddingBottom]);
    }
    v48 = [v4 leadingSubtitle];

    if (v48)
    {
      v49 = [_SFPBRichText alloc];
      v50 = [v4 leadingSubtitle];
      v51 = [(_SFPBRichText *)v49 initWithFacade:v50];
      [(_SFPBRowCardSection *)v5 setLeadingSubtitle:v51];
    }
    v52 = [v4 trailingSubtitle];

    if (v52)
    {
      v53 = [_SFPBRichText alloc];
      v54 = [v4 trailingSubtitle];
      v55 = [(_SFPBRichText *)v53 initWithFacade:v54];
      [(_SFPBRowCardSection *)v5 setTrailingSubtitle:v55];
    }
    v56 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingSubtitle, 0);
  objc_storeStrong((id *)&self->_leadingSubtitle, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_attributionImage, 0);
  objc_storeStrong((id *)&self->_trailingText, 0);
  objc_storeStrong((id *)&self->_leadingText, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
}

- (_SFPBRichText)trailingSubtitle
{
  return self->_trailingSubtitle;
}

- (_SFPBRichText)leadingSubtitle
{
  return self->_leadingSubtitle;
}

- (BOOL)cardPaddingBottom
{
  return self->_cardPaddingBottom;
}

- (int)valueWeight
{
  return self->_valueWeight;
}

- (BOOL)valueNoWrap
{
  return self->_valueNoWrap;
}

- (NSString)value
{
  return self->_value;
}

- (int)keyWeight
{
  return self->_keyWeight;
}

- (BOOL)keyNoWrap
{
  return self->_keyNoWrap;
}

- (NSString)key
{
  return self->_key;
}

- (_SFPBImage)attributionImage
{
  return self->_attributionImage;
}

- (_SFPBRichText)trailingText
{
  return self->_trailingText;
}

- (_SFPBRichText)leadingText
{
  return self->_leadingText;
}

- (BOOL)imageIsRightAligned
{
  return self->_imageIsRightAligned;
}

- (_SFPBImage)image
{
  return self->_image;
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

- (_SFPBRowCardSection)initWithDictionary:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)_SFPBRowCardSection;
  v5 = [(_SFPBRowCardSection *)&v70 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"punchoutOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v66 objects:v71 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v67;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v67 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v66 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = [[_SFPBPunchout alloc] initWithDictionary:v12];
              [(_SFPBRowCardSection *)v5 addPunchoutOptions:v13];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v66 objects:v71 count:16];
        }
        while (v9);
      }
    }
    v14 = [v4 objectForKeyedSubscript:@"punchoutPickerTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[v14 copy];
      [(_SFPBRowCardSection *)v5 setPunchoutPickerTitle:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"punchoutPickerDismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(_SFPBRowCardSection *)v5 setPunchoutPickerDismissText:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"canBeHidden"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRowCardSection setCanBeHidden:](v5, "setCanBeHidden:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"hasTopPadding"];
    objc_opt_class();
    v65 = v19;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRowCardSection setHasTopPadding:](v5, "setHasTopPadding:", [v19 BOOLValue]);
    }
    v20 = [v4 objectForKeyedSubscript:@"hasBottomPadding"];
    objc_opt_class();
    v64 = v20;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRowCardSection setHasBottomPadding:](v5, "setHasBottomPadding:", [v20 BOOLValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"type"];
    objc_opt_class();
    uint64_t v63 = v21;
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBRowCardSection *)v5 setType:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"separatorStyle"];
    objc_opt_class();
    v62 = v23;
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRowCardSection setSeparatorStyle:](v5, "setSeparatorStyle:", [v23 intValue]);
    }
    v56 = v14;
    uint64_t v24 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[_SFPBColor alloc] initWithDictionary:v24];
      [(_SFPBRowCardSection *)v5 setBackgroundColor:v25];
    }
    v53 = (void *)v24;
    uint64_t v26 = [v4 objectForKeyedSubscript:@"image"];
    objc_opt_class();
    long long v61 = (void *)v26;
    if (objc_opt_isKindOfClass())
    {
      v27 = [[_SFPBImage alloc] initWithDictionary:v26];
      [(_SFPBRowCardSection *)v5 setImage:v27];
    }
    v28 = [v4 objectForKeyedSubscript:@"imageIsRightAligned"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRowCardSection setImageIsRightAligned:](v5, "setImageIsRightAligned:", [v28 BOOLValue]);
    }
    v52 = v28;
    uint64_t v29 = [v4 objectForKeyedSubscript:@"leadingText"];
    objc_opt_class();
    long long v60 = (void *)v29;
    if (objc_opt_isKindOfClass())
    {
      v30 = [[_SFPBRichText alloc] initWithDictionary:v29];
      [(_SFPBRowCardSection *)v5 setLeadingText:v30];
    }
    uint64_t v31 = [v4 objectForKeyedSubscript:@"trailingText"];
    objc_opt_class();
    long long v59 = (void *)v31;
    if (objc_opt_isKindOfClass())
    {
      v32 = [[_SFPBRichText alloc] initWithDictionary:v31];
      [(_SFPBRowCardSection *)v5 setTrailingText:v32];
    }
    uint64_t v33 = [v4 objectForKeyedSubscript:@"attributionImage"];
    objc_opt_class();
    long long v58 = (void *)v33;
    if (objc_opt_isKindOfClass())
    {
      v34 = [[_SFPBImage alloc] initWithDictionary:v33];
      [(_SFPBRowCardSection *)v5 setAttributionImage:v34];
    }
    v35 = [v4 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = (void *)[v35 copy];
      [(_SFPBRowCardSection *)v5 setKey:v36];
    }
    v37 = [v4 objectForKeyedSubscript:@"keyNoWrap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRowCardSection setKeyNoWrap:](v5, "setKeyNoWrap:", [v37 BOOLValue]);
    }
    v51 = v35;
    v38 = objc_msgSend(v4, "objectForKeyedSubscript:", @"keyWeight", v37);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRowCardSection setKeyWeight:](v5, "setKeyWeight:", [v38 intValue]);
    }
    v39 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = (void *)[v39 copy];
      [(_SFPBRowCardSection *)v5 setValue:v40];
    }
    v55 = v16;
    v41 = [v4 objectForKeyedSubscript:@"valueNoWrap"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRowCardSection setValueNoWrap:](v5, "setValueNoWrap:", [v41 BOOLValue]);
    }
    v54 = v18;
    v42 = [v4 objectForKeyedSubscript:@"valueWeight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRowCardSection setValueWeight:](v5, "setValueWeight:", [v42 intValue]);
    }
    v57 = v6;
    v43 = [v4 objectForKeyedSubscript:@"cardPaddingBottom"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRowCardSection setCardPaddingBottom:](v5, "setCardPaddingBottom:", [v43 BOOLValue]);
    }
    v44 = [v4 objectForKeyedSubscript:@"leadingSubtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = [[_SFPBRichText alloc] initWithDictionary:v44];
      [(_SFPBRowCardSection *)v5 setLeadingSubtitle:v45];
    }
    v46 = [v4 objectForKeyedSubscript:@"trailingSubtitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v47 = [[_SFPBRichText alloc] initWithDictionary:v46];
      [(_SFPBRowCardSection *)v5 setTrailingSubtitle:v47];
    }
    v48 = v5;
  }
  return v5;
}

- (_SFPBRowCardSection)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRowCardSection *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRowCardSection *)self dictionaryRepresentation];
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
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_attributionImage)
  {
    id v4 = [(_SFPBRowCardSection *)self attributionImage];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"attributionImage"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"attributionImage"];
    }
  }
  if (self->_backgroundColor)
  {
    uint64_t v7 = [(_SFPBRowCardSection *)self backgroundColor];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"backgroundColor"];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"backgroundColor"];
    }
  }
  if (self->_canBeHidden)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRowCardSection canBeHidden](self, "canBeHidden"));
    [v3 setObject:v10 forKeyedSubscript:@"canBeHidden"];
  }
  if (self->_cardPaddingBottom)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRowCardSection cardPaddingBottom](self, "cardPaddingBottom"));
    [v3 setObject:v11 forKeyedSubscript:@"cardPaddingBottom"];
  }
  if (self->_hasBottomPadding)
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRowCardSection hasBottomPadding](self, "hasBottomPadding"));
    [v3 setObject:v12 forKeyedSubscript:@"hasBottomPadding"];
  }
  if (self->_hasTopPadding)
  {
    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRowCardSection hasTopPadding](self, "hasTopPadding"));
    [v3 setObject:v13 forKeyedSubscript:@"hasTopPadding"];
  }
  if (self->_image)
  {
    v14 = [(_SFPBRowCardSection *)self image];
    v15 = [v14 dictionaryRepresentation];
    if (v15)
    {
      [v3 setObject:v15 forKeyedSubscript:@"image"];
    }
    else
    {
      v16 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v16 forKeyedSubscript:@"image"];
    }
  }
  if (self->_imageIsRightAligned)
  {
    v17 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRowCardSection imageIsRightAligned](self, "imageIsRightAligned"));
    [v3 setObject:v17 forKeyedSubscript:@"imageIsRightAligned"];
  }
  if (self->_key)
  {
    v18 = [(_SFPBRowCardSection *)self key];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"key"];
  }
  if (self->_keyNoWrap)
  {
    v20 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRowCardSection keyNoWrap](self, "keyNoWrap"));
    [v3 setObject:v20 forKeyedSubscript:@"keyNoWrap"];
  }
  if (self->_keyWeight)
  {
    v21 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBRowCardSection keyWeight](self, "keyWeight"));
    [v3 setObject:v21 forKeyedSubscript:@"keyWeight"];
  }
  if (self->_leadingSubtitle)
  {
    v22 = [(_SFPBRowCardSection *)self leadingSubtitle];
    v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"leadingSubtitle"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"leadingSubtitle"];
    }
  }
  if (self->_leadingText)
  {
    v25 = [(_SFPBRowCardSection *)self leadingText];
    uint64_t v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"leadingText"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"leadingText"];
    }
  }
  if ([(NSArray *)self->_punchoutOptions count])
  {
    v28 = [MEMORY[0x1E4F1CA48] array];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v29 = self->_punchoutOptions;
    uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v55 objects:v59 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v56 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [*(id *)(*((void *)&v55 + 1) + 8 * i) dictionaryRepresentation];
          if (v34)
          {
            [v28 addObject:v34];
          }
          else
          {
            v35 = [MEMORY[0x1E4F1CA98] null];
            [v28 addObject:v35];
          }
        }
        uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v55 objects:v59 count:16];
      }
      while (v31);
    }

    [v3 setObject:v28 forKeyedSubscript:@"punchoutOptions"];
  }
  if (self->_punchoutPickerDismissText)
  {
    v36 = [(_SFPBRowCardSection *)self punchoutPickerDismissText];
    v37 = (void *)[v36 copy];
    [v3 setObject:v37 forKeyedSubscript:@"punchoutPickerDismissText"];
  }
  if (self->_punchoutPickerTitle)
  {
    v38 = [(_SFPBRowCardSection *)self punchoutPickerTitle];
    v39 = (void *)[v38 copy];
    [v3 setObject:v39 forKeyedSubscript:@"punchoutPickerTitle"];
  }
  if (self->_separatorStyle)
  {
    uint64_t v40 = [(_SFPBRowCardSection *)self separatorStyle];
    if (v40 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v40);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_1E5A2F090[v40];
    }
    [v3 setObject:v41 forKeyedSubscript:@"separatorStyle"];
  }
  if (self->_trailingSubtitle)
  {
    v42 = [(_SFPBRowCardSection *)self trailingSubtitle];
    v43 = [v42 dictionaryRepresentation];
    if (v43)
    {
      [v3 setObject:v43 forKeyedSubscript:@"trailingSubtitle"];
    }
    else
    {
      v44 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v44 forKeyedSubscript:@"trailingSubtitle"];
    }
  }
  if (self->_trailingText)
  {
    v45 = [(_SFPBRowCardSection *)self trailingText];
    v46 = [v45 dictionaryRepresentation];
    if (v46)
    {
      [v3 setObject:v46 forKeyedSubscript:@"trailingText"];
    }
    else
    {
      v47 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v47 forKeyedSubscript:@"trailingText"];
    }
  }
  if (self->_type)
  {
    v48 = [(_SFPBRowCardSection *)self type];
    v49 = (void *)[v48 copy];
    [v3 setObject:v49 forKeyedSubscript:@"type"];
  }
  if (self->_value)
  {
    v50 = [(_SFPBRowCardSection *)self value];
    v51 = (void *)[v50 copy];
    [v3 setObject:v51 forKeyedSubscript:@"value"];
  }
  if (self->_valueNoWrap)
  {
    v52 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBRowCardSection valueNoWrap](self, "valueNoWrap"));
    [v3 setObject:v52 forKeyedSubscript:@"valueNoWrap"];
  }
  if (self->_valueWeight)
  {
    v53 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBRowCardSection valueWeight](self, "valueWeight"));
    [v3 setObject:v53 forKeyedSubscript:@"valueWeight"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v30 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v29 = [(NSString *)self->_punchoutPickerTitle hash];
  NSUInteger v3 = [(NSString *)self->_punchoutPickerDismissText hash];
  if (self->_canBeHidden) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v27 = v4;
  NSUInteger v28 = v3;
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
  uint64_t v25 = v6;
  uint64_t v26 = v5;
  NSUInteger v7 = [(NSString *)self->_type hash];
  uint64_t v23 = 2654435761 * self->_separatorStyle;
  NSUInteger v24 = v7;
  unint64_t v22 = [(_SFPBColor *)self->_backgroundColor hash];
  unint64_t v8 = [(_SFPBImage *)self->_image hash];
  if (self->_imageIsRightAligned) {
    uint64_t v9 = 2654435761;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(_SFPBRichText *)self->_leadingText hash];
  unint64_t v11 = [(_SFPBRichText *)self->_trailingText hash];
  unint64_t v12 = [(_SFPBImage *)self->_attributionImage hash];
  NSUInteger v13 = [(NSString *)self->_key hash];
  if (self->_keyNoWrap) {
    uint64_t v14 = 2654435761;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = 2654435761 * self->_keyWeight;
  NSUInteger v16 = [(NSString *)self->_value hash];
  if (self->_valueNoWrap) {
    uint64_t v17 = 2654435761;
  }
  else {
    uint64_t v17 = 0;
  }
  if (self->_cardPaddingBottom) {
    uint64_t v18 = 2654435761;
  }
  else {
    uint64_t v18 = 0;
  }
  uint64_t v19 = v17 ^ (2654435761 * self->_valueWeight) ^ v18;
  unint64_t v20 = v29 ^ v30 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v19 ^ [(_SFPBRichText *)self->_leadingSubtitle hash];
  return v20 ^ [(_SFPBRichText *)self->_trailingSubtitle hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_77;
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self punchoutOptions];
  uint64_t v6 = [v4 punchoutOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v7 = [(_SFPBRowCardSection *)self punchoutOptions];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRowCardSection *)self punchoutOptions];
    unint64_t v10 = [v4 punchoutOptions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self punchoutPickerTitle];
  uint64_t v6 = [v4 punchoutPickerTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v12 = [(_SFPBRowCardSection *)self punchoutPickerTitle];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    uint64_t v14 = [(_SFPBRowCardSection *)self punchoutPickerTitle];
    uint64_t v15 = [v4 punchoutPickerTitle];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self punchoutPickerDismissText];
  uint64_t v6 = [v4 punchoutPickerDismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v17 = [(_SFPBRowCardSection *)self punchoutPickerDismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRowCardSection *)self punchoutPickerDismissText];
    unint64_t v20 = [v4 punchoutPickerDismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  int canBeHidden = self->_canBeHidden;
  if (canBeHidden != [v4 canBeHidden]) {
    goto LABEL_77;
  }
  int hasTopPadding = self->_hasTopPadding;
  if (hasTopPadding != [v4 hasTopPadding]) {
    goto LABEL_77;
  }
  int hasBottomPadding = self->_hasBottomPadding;
  if (hasBottomPadding != [v4 hasBottomPadding]) {
    goto LABEL_77;
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self type];
  uint64_t v6 = [v4 type];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v25 = [(_SFPBRowCardSection *)self type];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    uint64_t v27 = [(_SFPBRowCardSection *)self type];
    NSUInteger v28 = [v4 type];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  int separatorStyle = self->_separatorStyle;
  if (separatorStyle != [v4 separatorStyle]) {
    goto LABEL_77;
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self backgroundColor];
  uint64_t v6 = [v4 backgroundColor];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v31 = [(_SFPBRowCardSection *)self backgroundColor];
  if (v31)
  {
    uint64_t v32 = (void *)v31;
    uint64_t v33 = [(_SFPBRowCardSection *)self backgroundColor];
    v34 = [v4 backgroundColor];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self image];
  uint64_t v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v36 = [(_SFPBRowCardSection *)self image];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [(_SFPBRowCardSection *)self image];
    v39 = [v4 image];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  int imageIsRightAligned = self->_imageIsRightAligned;
  if (imageIsRightAligned != [v4 imageIsRightAligned]) {
    goto LABEL_77;
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self leadingText];
  uint64_t v6 = [v4 leadingText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v42 = [(_SFPBRowCardSection *)self leadingText];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_SFPBRowCardSection *)self leadingText];
    v45 = [v4 leadingText];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self trailingText];
  uint64_t v6 = [v4 trailingText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v47 = [(_SFPBRowCardSection *)self trailingText];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_SFPBRowCardSection *)self trailingText];
    v50 = [v4 trailingText];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self attributionImage];
  uint64_t v6 = [v4 attributionImage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v52 = [(_SFPBRowCardSection *)self attributionImage];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_SFPBRowCardSection *)self attributionImage];
    long long v55 = [v4 attributionImage];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self key];
  uint64_t v6 = [v4 key];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v57 = [(_SFPBRowCardSection *)self key];
  if (v57)
  {
    long long v58 = (void *)v57;
    long long v59 = [(_SFPBRowCardSection *)self key];
    uint64_t v60 = [v4 key];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  int keyNoWrap = self->_keyNoWrap;
  if (keyNoWrap != [v4 keyNoWrap]) {
    goto LABEL_77;
  }
  int keyWeight = self->_keyWeight;
  if (keyWeight != [v4 keyWeight]) {
    goto LABEL_77;
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self value];
  uint64_t v6 = [v4 value];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v64 = [(_SFPBRowCardSection *)self value];
  if (v64)
  {
    v65 = (void *)v64;
    long long v66 = [(_SFPBRowCardSection *)self value];
    long long v67 = [v4 value];
    int v68 = [v66 isEqual:v67];

    if (!v68) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  int valueNoWrap = self->_valueNoWrap;
  if (valueNoWrap != [v4 valueNoWrap]) {
    goto LABEL_77;
  }
  int valueWeight = self->_valueWeight;
  if (valueWeight != [v4 valueWeight]) {
    goto LABEL_77;
  }
  int cardPaddingBottom = self->_cardPaddingBottom;
  if (cardPaddingBottom != [v4 cardPaddingBottom]) {
    goto LABEL_77;
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self leadingSubtitle];
  uint64_t v6 = [v4 leadingSubtitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_76;
  }
  uint64_t v72 = [(_SFPBRowCardSection *)self leadingSubtitle];
  if (v72)
  {
    v73 = (void *)v72;
    v74 = [(_SFPBRowCardSection *)self leadingSubtitle];
    v75 = [v4 leadingSubtitle];
    int v76 = [v74 isEqual:v75];

    if (!v76) {
      goto LABEL_77;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBRowCardSection *)self trailingSubtitle];
  uint64_t v6 = [v4 trailingSubtitle];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_76:

    goto LABEL_77;
  }
  uint64_t v77 = [(_SFPBRowCardSection *)self trailingSubtitle];
  if (!v77)
  {

LABEL_80:
    BOOL v82 = 1;
    goto LABEL_78;
  }
  v78 = (void *)v77;
  v79 = [(_SFPBRowCardSection *)self trailingSubtitle];
  v80 = [v4 trailingSubtitle];
  char v81 = [v79 isEqual:v80];

  if (v81) {
    goto LABEL_80;
  }
LABEL_77:
  BOOL v82 = 0;
LABEL_78:

  return v82;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_SFPBRowCardSection *)self punchoutOptions];
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

  unint64_t v10 = [(_SFPBRowCardSection *)self punchoutPickerTitle];
  if (v10) {
    PBDataWriterWriteStringField();
  }

  int v11 = [(_SFPBRowCardSection *)self punchoutPickerDismissText];
  if (v11) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBRowCardSection *)self canBeHidden]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBRowCardSection *)self hasTopPadding]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBRowCardSection *)self hasBottomPadding]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v12 = [(_SFPBRowCardSection *)self type];
  if (v12) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBRowCardSection *)self separatorStyle]) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v13 = [(_SFPBRowCardSection *)self backgroundColor];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBRowCardSection *)self image];
  if (v14) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRowCardSection *)self imageIsRightAligned]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v15 = [(_SFPBRowCardSection *)self leadingText];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBRowCardSection *)self trailingText];
  if (v16) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v17 = [(_SFPBRowCardSection *)self attributionImage];
  if (v17) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v18 = [(_SFPBRowCardSection *)self key];
  if (v18) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBRowCardSection *)self keyNoWrap]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBRowCardSection *)self keyWeight]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v19 = [(_SFPBRowCardSection *)self value];
  if (v19) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBRowCardSection *)self valueNoWrap]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBRowCardSection *)self valueWeight]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRowCardSection *)self cardPaddingBottom]) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v20 = [(_SFPBRowCardSection *)self leadingSubtitle];
  if (v20) {
    PBDataWriterWriteSubmessage();
  }

  int v21 = [(_SFPBRowCardSection *)self trailingSubtitle];
  if (v21) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRowCardSectionReadFrom(self, (uint64_t)a3);
}

- (void)setTrailingSubtitle:(id)a3
{
}

- (void)setLeadingSubtitle:(id)a3
{
}

- (void)setCardPaddingBottom:(BOOL)a3
{
  self->_int cardPaddingBottom = a3;
}

- (void)setValueWeight:(int)a3
{
  self->_int valueWeight = a3;
}

- (void)setValueNoWrap:(BOOL)a3
{
  self->_int valueNoWrap = a3;
}

- (void)setValue:(id)a3
{
  self->_value = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setKeyWeight:(int)a3
{
  self->_int keyWeight = a3;
}

- (void)setKeyNoWrap:(BOOL)a3
{
  self->_int keyNoWrap = a3;
}

- (void)setKey:(id)a3
{
  self->_key = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAttributionImage:(id)a3
{
}

- (void)setTrailingText:(id)a3
{
}

- (void)setLeadingText:(id)a3
{
}

- (void)setImageIsRightAligned:(BOOL)a3
{
  self->_int imageIsRightAligned = a3;
}

- (void)setImage:(id)a3
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