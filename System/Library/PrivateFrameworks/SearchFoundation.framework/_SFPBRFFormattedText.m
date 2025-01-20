@interface _SFPBRFFormattedText
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)attributions;
- (NSArray)highlighted_substrings;
- (NSData)jsonData;
- (NSString)text;
- (_SFPBRFColor)background_color;
- (_SFPBRFColor)color;
- (_SFPBRFEngageable)engageable;
- (_SFPBRFFont)font;
- (_SFPBRFFormattedText)initWithDictionary:(id)a3;
- (_SFPBRFFormattedText)initWithFacade:(id)a3;
- (_SFPBRFFormattedText)initWithJSON:(id)a3;
- (_SFPBRFImageElement)inline_image_element;
- (_SFPBRFOptionalBool)is_bold;
- (_SFPBRFOptionalBool)is_highlighted;
- (_SFPBRFOptionalBool)is_italic;
- (_SFPBRFOptionalBool)is_underlined;
- (_SFPBRFTextEncapsulation)text_encapsulation;
- (id)attributionsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)highlighted_substringsAtIndex:(unint64_t)a3;
- (int)design;
- (int)weight;
- (unint64_t)attributionsCount;
- (unint64_t)hash;
- (unint64_t)highlighted_substringsCount;
- (unint64_t)whichValue;
- (void)addAttributions:(id)a3;
- (void)addHighlighted_substrings:(id)a3;
- (void)clearAttributions;
- (void)clearHighlighted_substrings;
- (void)setAttributions:(id)a3;
- (void)setBackground_color:(id)a3;
- (void)setColor:(id)a3;
- (void)setDesign:(int)a3;
- (void)setEngageable:(id)a3;
- (void)setFont:(id)a3;
- (void)setHighlighted_substrings:(id)a3;
- (void)setInline_image_element:(id)a3;
- (void)setIs_bold:(id)a3;
- (void)setIs_highlighted:(id)a3;
- (void)setIs_italic:(id)a3;
- (void)setIs_underlined:(id)a3;
- (void)setText:(id)a3;
- (void)setText_encapsulation:(id)a3;
- (void)setWeight:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFFormattedText

- (_SFPBRFFormattedText)initWithFacade:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBRFFormattedText *)self init];
  if (v5)
  {
    if ([v4 hasText])
    {
      v6 = [v4 text];

      if (v6)
      {
        v7 = [v4 text];
        [(_SFPBRFFormattedText *)v5 setText:v7];
      }
    }
    if (objc_msgSend(v4, "hasInline_image_element"))
    {
      v8 = objc_msgSend(v4, "inline_image_element");

      if (v8)
      {
        v9 = [_SFPBRFImageElement alloc];
        v10 = objc_msgSend(v4, "inline_image_element");
        v11 = [(_SFPBRFImageElement *)v9 initWithFacade:v10];
        [(_SFPBRFFormattedText *)v5 setInline_image_element:v11];
      }
    }
    v12 = [v4 color];

    if (v12)
    {
      v13 = [_SFPBRFColor alloc];
      v14 = [v4 color];
      v15 = [(_SFPBRFColor *)v13 initWithFacade:v14];
      [(_SFPBRFFormattedText *)v5 setColor:v15];
    }
    v16 = objc_msgSend(v4, "is_italic");

    if (v16)
    {
      v17 = [_SFPBRFOptionalBool alloc];
      v18 = objc_msgSend(v4, "is_italic");
      v19 = [(_SFPBRFOptionalBool *)v17 initWithFacade:v18];
      [(_SFPBRFFormattedText *)v5 setIs_italic:v19];
    }
    v20 = objc_msgSend(v4, "is_bold");

    if (v20)
    {
      v21 = [_SFPBRFOptionalBool alloc];
      v22 = objc_msgSend(v4, "is_bold");
      v23 = [(_SFPBRFOptionalBool *)v21 initWithFacade:v22];
      [(_SFPBRFFormattedText *)v5 setIs_bold:v23];
    }
    v24 = objc_msgSend(v4, "text_encapsulation");

    if (v24)
    {
      v25 = [_SFPBRFTextEncapsulation alloc];
      v26 = objc_msgSend(v4, "text_encapsulation");
      v27 = [(_SFPBRFTextEncapsulation *)v25 initWithFacade:v26];
      [(_SFPBRFFormattedText *)v5 setText_encapsulation:v27];
    }
    v28 = objc_msgSend(v4, "is_highlighted");

    if (v28)
    {
      v29 = [_SFPBRFOptionalBool alloc];
      v30 = objc_msgSend(v4, "is_highlighted");
      v31 = [(_SFPBRFOptionalBool *)v29 initWithFacade:v30];
      [(_SFPBRFFormattedText *)v5 setIs_highlighted:v31];
    }
    v32 = objc_msgSend(v4, "background_color");

    if (v32)
    {
      v33 = [_SFPBRFColor alloc];
      v34 = objc_msgSend(v4, "background_color");
      v35 = [(_SFPBRFColor *)v33 initWithFacade:v34];
      [(_SFPBRFFormattedText *)v5 setBackground_color:v35];
    }
    v36 = [v4 attributions];
    if (v36) {
      id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v37 = 0;
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v38 = [v4 attributions];
    uint64_t v39 = [v38 countByEnumeratingWithState:&v70 objects:v75 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v71 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = [[_SFPBRFAttribution alloc] initWithFacade:*(void *)(*((void *)&v70 + 1) + 8 * i)];
          if (v43) {
            [v37 addObject:v43];
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v70 objects:v75 count:16];
      }
      while (v40);
    }

    [(_SFPBRFFormattedText *)v5 setAttributions:v37];
    v44 = objc_msgSend(v4, "highlighted_substrings");
    if (v44) {
      id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v45 = 0;
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v46 = objc_msgSend(v4, "highlighted_substrings", 0);
    uint64_t v47 = [v46 countByEnumeratingWithState:&v66 objects:v74 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      uint64_t v49 = *(void *)v67;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v67 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = [[_SFPBRFHighlightedSubstring alloc] initWithFacade:*(void *)(*((void *)&v66 + 1) + 8 * j)];
          if (v51) {
            [v45 addObject:v51];
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v66 objects:v74 count:16];
      }
      while (v48);
    }

    [(_SFPBRFFormattedText *)v5 setHighlighted_substrings:v45];
    v52 = [v4 font];

    if (v52)
    {
      v53 = [_SFPBRFFont alloc];
      v54 = [v4 font];
      v55 = [(_SFPBRFFont *)v53 initWithFacade:v54];
      [(_SFPBRFFormattedText *)v5 setFont:v55];
    }
    v56 = objc_msgSend(v4, "is_underlined");

    if (v56)
    {
      v57 = [_SFPBRFOptionalBool alloc];
      v58 = objc_msgSend(v4, "is_underlined");
      v59 = [(_SFPBRFOptionalBool *)v57 initWithFacade:v58];
      [(_SFPBRFFormattedText *)v5 setIs_underlined:v59];
    }
    v60 = [v4 engageable];

    if (v60)
    {
      v61 = [_SFPBRFEngageable alloc];
      v62 = [v4 engageable];
      v63 = [(_SFPBRFEngageable *)v61 initWithFacade:v62];
      [(_SFPBRFFormattedText *)v5 setEngageable:v63];
    }
    if ([v4 hasWeight]) {
      -[_SFPBRFFormattedText setWeight:](v5, "setWeight:", [v4 weight]);
    }
    if ([v4 hasDesign]) {
      -[_SFPBRFFormattedText setDesign:](v5, "setDesign:", [v4 design]);
    }
    v64 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engageable, 0);
  objc_storeStrong((id *)&self->_is_underlined, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_highlighted_substrings, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_background_color, 0);
  objc_storeStrong((id *)&self->_is_highlighted, 0);
  objc_storeStrong((id *)&self->_text_encapsulation, 0);
  objc_storeStrong((id *)&self->_is_bold, 0);
  objc_storeStrong((id *)&self->_is_italic, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_inline_image_element, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (unint64_t)whichValue
{
  return self->_whichValue;
}

- (int)design
{
  return self->_design;
}

- (int)weight
{
  return self->_weight;
}

- (_SFPBRFEngageable)engageable
{
  return self->_engageable;
}

- (_SFPBRFOptionalBool)is_underlined
{
  return self->_is_underlined;
}

- (_SFPBRFFont)font
{
  return self->_font;
}

- (NSArray)highlighted_substrings
{
  return self->_highlighted_substrings;
}

- (NSArray)attributions
{
  return self->_attributions;
}

- (_SFPBRFColor)background_color
{
  return self->_background_color;
}

- (_SFPBRFOptionalBool)is_highlighted
{
  return self->_is_highlighted;
}

- (_SFPBRFTextEncapsulation)text_encapsulation
{
  return self->_text_encapsulation;
}

- (_SFPBRFOptionalBool)is_bold
{
  return self->_is_bold;
}

- (_SFPBRFOptionalBool)is_italic
{
  return self->_is_italic;
}

- (_SFPBRFColor)color
{
  return self->_color;
}

- (_SFPBRFFormattedText)initWithDictionary:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)_SFPBRFFormattedText;
  v5 = [(_SFPBRFFormattedText *)&v65 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"text"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBRFFormattedText *)v5 setText:v7];
    }
    v54 = v6;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"inlineImageElement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBRFImageElement alloc] initWithDictionary:v8];
      [(_SFPBRFFormattedText *)v5 setInline_image_element:v9];
    }
    v53 = (void *)v8;
    uint64_t v10 = [v4 objectForKeyedSubscript:@"color"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[_SFPBRFColor alloc] initWithDictionary:v10];
      [(_SFPBRFFormattedText *)v5 setColor:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"isItalic"];
    objc_opt_class();
    v13 = off_1E5A2E000;
    if (objc_opt_isKindOfClass())
    {
      v14 = [[_SFPBRFOptionalBool alloc] initWithDictionary:v12];
      [(_SFPBRFFormattedText *)v5 setIs_italic:v14];
    }
    uint64_t v15 = [v4 objectForKeyedSubscript:@"isBold"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [[_SFPBRFOptionalBool alloc] initWithDictionary:v15];
      [(_SFPBRFFormattedText *)v5 setIs_bold:v16];
    }
    v17 = [v4 objectForKeyedSubscript:@"textEncapsulation"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [[_SFPBRFTextEncapsulation alloc] initWithDictionary:v17];
      [(_SFPBRFFormattedText *)v5 setText_encapsulation:v18];
    }
    uint64_t v19 = [v4 objectForKeyedSubscript:@"isHighlighted"];
    objc_opt_class();
    v56 = (void *)v19;
    if (objc_opt_isKindOfClass())
    {
      v20 = [[_SFPBRFOptionalBool alloc] initWithDictionary:v19];
      [(_SFPBRFFormattedText *)v5 setIs_highlighted:v20];
    }
    v50 = (void *)v15;
    v51 = (void *)v12;
    v52 = (void *)v10;
    uint64_t v21 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [[_SFPBRFColor alloc] initWithDictionary:v21];
      [(_SFPBRFFormattedText *)v5 setBackground_color:v22];
    }
    uint64_t v49 = (void *)v21;
    v23 = [v4 objectForKeyedSubscript:@"attributions"];
    objc_opt_class();
    v55 = v23;
    if (objc_opt_isKindOfClass())
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v61 objects:v67 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v62 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v61 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v30 = [[_SFPBRFAttribution alloc] initWithDictionary:v29];
              [(_SFPBRFFormattedText *)v5 addAttributions:v30];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v61 objects:v67 count:16];
        }
        while (v26);
      }

      v13 = off_1E5A2E000;
    }
    v31 = [v4 objectForKeyedSubscript:@"highlightedSubstrings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v32 = v31;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v58;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v58 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v57 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v38 = [[_SFPBRFHighlightedSubstring alloc] initWithDictionary:v37];
              [(_SFPBRFFormattedText *)v5 addHighlighted_substrings:v38];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v57 objects:v66 count:16];
        }
        while (v34);
      }

      v13 = off_1E5A2E000;
    }
    uint64_t v39 = [v4 objectForKeyedSubscript:@"font"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v40 = [[_SFPBRFFont alloc] initWithDictionary:v39];
      [(_SFPBRFFormattedText *)v5 setFont:v40];
    }
    uint64_t v41 = [v4 objectForKeyedSubscript:@"isUnderlined"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = (void *)[objc_alloc(v13[50]) initWithDictionary:v41];
      [(_SFPBRFFormattedText *)v5 setIs_underlined:v42];
    }
    v43 = [v4 objectForKeyedSubscript:@"engageable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44 = [[_SFPBRFEngageable alloc] initWithDictionary:v43];
      [(_SFPBRFFormattedText *)v5 setEngageable:v44];
    }
    id v45 = [v4 objectForKeyedSubscript:@"weight"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFFormattedText setWeight:](v5, "setWeight:", [v45 intValue]);
    }
    v46 = [v4 objectForKeyedSubscript:@"design"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBRFFormattedText setDesign:](v5, "setDesign:", [v46 intValue]);
    }
    uint64_t v47 = v5;
  }
  return v5;
}

- (_SFPBRFFormattedText)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFFormattedText *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFFormattedText *)self dictionaryRepresentation];
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
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_attributions count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v5 = self->_attributions;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v62 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v61 + 1) + 8 * i) dictionaryRepresentation];
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"attributions"];
  }
  if (self->_background_color)
  {
    uint64_t v12 = [(_SFPBRFFormattedText *)self background_color];
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
  if (self->_color)
  {
    uint64_t v15 = [(_SFPBRFFormattedText *)self color];
    v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"color"];
    }
    else
    {
      v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"color"];
    }
  }
  if (self->_design)
  {
    uint64_t v18 = [(_SFPBRFFormattedText *)self design];
    if (v18 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v18);
      uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v19 = off_1E5A2F070[v18];
    }
    [v3 setObject:v19 forKeyedSubscript:@"design"];
  }
  if (self->_engageable)
  {
    v20 = [(_SFPBRFFormattedText *)self engageable];
    uint64_t v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"engageable"];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"engageable"];
    }
  }
  if (self->_font)
  {
    v23 = [(_SFPBRFFormattedText *)self font];
    id v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"font"];
    }
    else
    {
      uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"font"];
    }
  }
  if ([(NSArray *)self->_highlighted_substrings count])
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v27 = self->_highlighted_substrings;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v58 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = [*(id *)(*((void *)&v57 + 1) + 8 * j) dictionaryRepresentation];
          if (v32)
          {
            [v26 addObject:v32];
          }
          else
          {
            uint64_t v33 = [MEMORY[0x1E4F1CA98] null];
            [v26 addObject:v33];
          }
        }
        uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v29);
    }

    [v3 setObject:v26 forKeyedSubscript:@"highlightedSubstrings"];
  }
  if (self->_inline_image_element)
  {
    uint64_t v34 = [(_SFPBRFFormattedText *)self inline_image_element];
    uint64_t v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"inlineImageElement"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"inlineImageElement"];
    }
  }
  if (self->_is_bold)
  {
    uint64_t v37 = [(_SFPBRFFormattedText *)self is_bold];
    v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"isBold"];
    }
    else
    {
      uint64_t v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"isBold"];
    }
  }
  if (self->_is_highlighted)
  {
    uint64_t v40 = [(_SFPBRFFormattedText *)self is_highlighted];
    uint64_t v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"isHighlighted"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"isHighlighted"];
    }
  }
  if (self->_is_italic)
  {
    v43 = [(_SFPBRFFormattedText *)self is_italic];
    v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"isItalic"];
    }
    else
    {
      id v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"isItalic"];
    }
  }
  if (self->_is_underlined)
  {
    v46 = [(_SFPBRFFormattedText *)self is_underlined];
    uint64_t v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"isUnderlined"];
    }
    else
    {
      uint64_t v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"isUnderlined"];
    }
  }
  if (self->_text)
  {
    uint64_t v49 = [(_SFPBRFFormattedText *)self text];
    v50 = (void *)[v49 copy];
    [v3 setObject:v50 forKeyedSubscript:@"text"];
  }
  if (self->_text_encapsulation)
  {
    v51 = [(_SFPBRFFormattedText *)self text_encapsulation];
    v52 = [v51 dictionaryRepresentation];
    if (v52)
    {
      [v3 setObject:v52 forKeyedSubscript:@"textEncapsulation"];
    }
    else
    {
      v53 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v53 forKeyedSubscript:@"textEncapsulation"];
    }
  }
  if (self->_weight)
  {
    uint64_t v54 = [(_SFPBRFFormattedText *)self weight];
    if (v54 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v54);
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v55 = off_1E5A2ED30[v54];
    }
    [v3 setObject:v55 forKeyedSubscript:@"weight"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v15 = [(NSString *)self->_text hash];
  unint64_t v14 = [(_SFPBRFImageElement *)self->_inline_image_element hash];
  unint64_t v13 = [(_SFPBRFColor *)self->_color hash];
  unint64_t v3 = [(_SFPBRFOptionalBool *)self->_is_italic hash];
  unint64_t v4 = [(_SFPBRFOptionalBool *)self->_is_bold hash];
  unint64_t v5 = [(_SFPBRFTextEncapsulation *)self->_text_encapsulation hash];
  unint64_t v6 = [(_SFPBRFOptionalBool *)self->_is_highlighted hash];
  unint64_t v7 = [(_SFPBRFColor *)self->_background_color hash];
  uint64_t v8 = [(NSArray *)self->_attributions hash];
  uint64_t v9 = [(NSArray *)self->_highlighted_substrings hash];
  unint64_t v10 = [(_SFPBRFFont *)self->_font hash];
  unint64_t v11 = [(_SFPBRFOptionalBool *)self->_is_underlined hash];
  return v14 ^ v15 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(_SFPBRFEngageable *)self->_engageable hash] ^ (2654435761 * self->_weight) ^ (2654435761 * self->_design);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_67;
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self text];
  unint64_t v6 = [v4 text];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v7 = [(_SFPBRFFormattedText *)self text];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBRFFormattedText *)self text];
    unint64_t v10 = [v4 text];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self inline_image_element];
  unint64_t v6 = objc_msgSend(v4, "inline_image_element");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v12 = [(_SFPBRFFormattedText *)self inline_image_element];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    unint64_t v14 = [(_SFPBRFFormattedText *)self inline_image_element];
    NSUInteger v15 = objc_msgSend(v4, "inline_image_element");
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self color];
  unint64_t v6 = [v4 color];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v17 = [(_SFPBRFFormattedText *)self color];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBRFFormattedText *)self color];
    v20 = [v4 color];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self is_italic];
  unint64_t v6 = objc_msgSend(v4, "is_italic");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v22 = [(_SFPBRFFormattedText *)self is_italic];
  if (v22)
  {
    v23 = (void *)v22;
    id v24 = [(_SFPBRFFormattedText *)self is_italic];
    uint64_t v25 = objc_msgSend(v4, "is_italic");
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self is_bold];
  unint64_t v6 = objc_msgSend(v4, "is_bold");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v27 = [(_SFPBRFFormattedText *)self is_bold];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    uint64_t v29 = [(_SFPBRFFormattedText *)self is_bold];
    uint64_t v30 = objc_msgSend(v4, "is_bold");
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self text_encapsulation];
  unint64_t v6 = objc_msgSend(v4, "text_encapsulation");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v32 = [(_SFPBRFFormattedText *)self text_encapsulation];
  if (v32)
  {
    uint64_t v33 = (void *)v32;
    uint64_t v34 = [(_SFPBRFFormattedText *)self text_encapsulation];
    uint64_t v35 = objc_msgSend(v4, "text_encapsulation");
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self is_highlighted];
  unint64_t v6 = objc_msgSend(v4, "is_highlighted");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v37 = [(_SFPBRFFormattedText *)self is_highlighted];
  if (v37)
  {
    v38 = (void *)v37;
    uint64_t v39 = [(_SFPBRFFormattedText *)self is_highlighted];
    uint64_t v40 = objc_msgSend(v4, "is_highlighted");
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self background_color];
  unint64_t v6 = objc_msgSend(v4, "background_color");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v42 = [(_SFPBRFFormattedText *)self background_color];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_SFPBRFFormattedText *)self background_color];
    id v45 = objc_msgSend(v4, "background_color");
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self attributions];
  unint64_t v6 = [v4 attributions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v47 = [(_SFPBRFFormattedText *)self attributions];
  if (v47)
  {
    uint64_t v48 = (void *)v47;
    uint64_t v49 = [(_SFPBRFFormattedText *)self attributions];
    v50 = [v4 attributions];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self highlighted_substrings];
  unint64_t v6 = objc_msgSend(v4, "highlighted_substrings");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v52 = [(_SFPBRFFormattedText *)self highlighted_substrings];
  if (v52)
  {
    v53 = (void *)v52;
    uint64_t v54 = [(_SFPBRFFormattedText *)self highlighted_substrings];
    v55 = objc_msgSend(v4, "highlighted_substrings");
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self font];
  unint64_t v6 = [v4 font];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v57 = [(_SFPBRFFormattedText *)self font];
  if (v57)
  {
    long long v58 = (void *)v57;
    long long v59 = [(_SFPBRFFormattedText *)self font];
    long long v60 = [v4 font];
    int v61 = [v59 isEqual:v60];

    if (!v61) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self is_underlined];
  unint64_t v6 = objc_msgSend(v4, "is_underlined");
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_66;
  }
  uint64_t v62 = [(_SFPBRFFormattedText *)self is_underlined];
  if (v62)
  {
    long long v63 = (void *)v62;
    long long v64 = [(_SFPBRFFormattedText *)self is_underlined];
    objc_super v65 = objc_msgSend(v4, "is_underlined");
    int v66 = [v64 isEqual:v65];

    if (!v66) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_SFPBRFFormattedText *)self engageable];
  unint64_t v6 = [v4 engageable];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_66:

    goto LABEL_67;
  }
  uint64_t v67 = [(_SFPBRFFormattedText *)self engageable];
  if (v67)
  {
    uint64_t v68 = (void *)v67;
    long long v69 = [(_SFPBRFFormattedText *)self engageable];
    long long v70 = [v4 engageable];
    int v71 = [v69 isEqual:v70];

    if (!v71) {
      goto LABEL_67;
    }
  }
  else
  {
  }
  int weight = self->_weight;
  if (weight == [v4 weight])
  {
    int design = self->_design;
    BOOL v72 = design == [v4 design];
    goto LABEL_68;
  }
LABEL_67:
  BOOL v72 = 0;
LABEL_68:

  return v72;
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_SFPBRFFormattedText *)self text];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  unint64_t v6 = [(_SFPBRFFormattedText *)self inline_image_element];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBRFFormattedText *)self color];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v8 = [(_SFPBRFFormattedText *)self is_italic];
  if (v8) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v9 = [(_SFPBRFFormattedText *)self is_bold];
  if (v9) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v10 = [(_SFPBRFFormattedText *)self text_encapsulation];
  if (v10) {
    PBDataWriterWriteSubmessage();
  }

  int v11 = [(_SFPBRFFormattedText *)self is_highlighted];
  if (v11) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v12 = [(_SFPBRFFormattedText *)self background_color];
  if (v12) {
    PBDataWriterWriteSubmessage();
  }

  unint64_t v13 = [(_SFPBRFFormattedText *)self attributions];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v31;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v31 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [(_SFPBRFFormattedText *)self highlighted_substrings];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  v23 = [(_SFPBRFFormattedText *)self font];
  if (v23) {
    PBDataWriterWriteSubmessage();
  }

  id v24 = [(_SFPBRFFormattedText *)self is_underlined];
  if (v24) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v25 = [(_SFPBRFFormattedText *)self engageable];
  if (v25) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBRFFormattedText *)self weight]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBRFFormattedText *)self design]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFFormattedTextReadFrom(self, (uint64_t)a3);
}

- (void)setDesign:(int)a3
{
  self->_int design = a3;
}

- (void)setWeight:(int)a3
{
  self->_int weight = a3;
}

- (void)setEngageable:(id)a3
{
}

- (void)setIs_underlined:(id)a3
{
}

- (void)setFont:(id)a3
{
}

- (id)highlighted_substringsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_highlighted_substrings objectAtIndexedSubscript:a3];
}

- (unint64_t)highlighted_substringsCount
{
  return [(NSArray *)self->_highlighted_substrings count];
}

- (void)addHighlighted_substrings:(id)a3
{
  id v4 = a3;
  highlighted_substrings = self->_highlighted_substrings;
  id v8 = v4;
  if (!highlighted_substrings)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_highlighted_substrings;
    self->_highlighted_substrings = v6;

    id v4 = v8;
    highlighted_substrings = self->_highlighted_substrings;
  }
  [(NSArray *)highlighted_substrings addObject:v4];
}

- (void)clearHighlighted_substrings
{
}

- (void)setHighlighted_substrings:(id)a3
{
  self->_highlighted_substrings = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)attributionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_attributions objectAtIndexedSubscript:a3];
}

- (unint64_t)attributionsCount
{
  return [(NSArray *)self->_attributions count];
}

- (void)addAttributions:(id)a3
{
  id v4 = a3;
  attributions = self->_attributions;
  id v8 = v4;
  if (!attributions)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_attributions;
    self->_attributions = v6;

    id v4 = v8;
    attributions = self->_attributions;
  }
  [(NSArray *)attributions addObject:v4];
}

- (void)clearAttributions
{
}

- (void)setAttributions:(id)a3
{
  self->_attributions = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setBackground_color:(id)a3
{
}

- (void)setIs_highlighted:(id)a3
{
}

- (void)setText_encapsulation:(id)a3
{
}

- (void)setIs_bold:(id)a3
{
}

- (void)setIs_italic:(id)a3
{
}

- (void)setColor:(id)a3
{
}

- (_SFPBRFImageElement)inline_image_element
{
  if (self->_whichValue == 2) {
    v2 = self->_inline_image_element;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setInline_image_element:(id)a3
{
  id v4 = (_SFPBRFImageElement *)a3;
  text = self->_text;
  self->_text = 0;

  self->_whichValue = 2 * (v4 != 0);
  inline_image_element = self->_inline_image_element;
  self->_inline_image_element = v4;
}

- (NSString)text
{
  if (self->_whichValue == 1) {
    v2 = self->_text;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setText:(id)a3
{
  inline_image_element = self->_inline_image_element;
  self->_inline_image_element = 0;
  id v7 = a3;

  self->_whichValue = v7 != 0;
  unint64_t v5 = (NSString *)[v7 copy];
  text = self->_text;
  self->_text = v5;
}

@end