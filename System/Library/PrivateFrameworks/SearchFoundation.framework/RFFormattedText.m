@interface RFFormattedText
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDesign;
- (BOOL)hasInline_image_element;
- (BOOL)hasText;
- (BOOL)hasWeight;
- (BOOL)isEqual:(id)a3;
- (NSArray)attributions;
- (NSArray)highlighted_substrings;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)text;
- (RFColor)background_color;
- (RFColor)color;
- (RFEngageable)engageable;
- (RFFont)font;
- (RFFormattedText)initWithCoder:(id)a3;
- (RFFormattedText)initWithProtobuf:(id)a3;
- (RFImageElement)inline_image_element;
- (RFOptionalBool)is_bold;
- (RFOptionalBool)is_highlighted;
- (RFOptionalBool)is_italic;
- (RFOptionalBool)is_underlined;
- (RFTextEncapsulation)text_encapsulation;
- (id)copyWithZone:(_NSZone *)a3;
- (int)design;
- (int)weight;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
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
@end

@implementation RFFormattedText

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (int)design
{
  return self->_design;
}

- (int)weight
{
  return self->_weight;
}

- (void)setEngageable:(id)a3
{
}

- (RFEngageable)engageable
{
  return self->_engageable;
}

- (void)setIs_underlined:(id)a3
{
}

- (RFOptionalBool)is_underlined
{
  return self->_is_underlined;
}

- (void)setFont:(id)a3
{
}

- (RFFont)font
{
  return self->_font;
}

- (void)setHighlighted_substrings:(id)a3
{
}

- (NSArray)highlighted_substrings
{
  return self->_highlighted_substrings;
}

- (void)setAttributions:(id)a3
{
}

- (NSArray)attributions
{
  return self->_attributions;
}

- (void)setBackground_color:(id)a3
{
}

- (RFColor)background_color
{
  return self->_background_color;
}

- (void)setIs_highlighted:(id)a3
{
}

- (RFOptionalBool)is_highlighted
{
  return self->_is_highlighted;
}

- (void)setText_encapsulation:(id)a3
{
}

- (RFTextEncapsulation)text_encapsulation
{
  return self->_text_encapsulation;
}

- (void)setIs_bold:(id)a3
{
}

- (RFOptionalBool)is_bold
{
  return self->_is_bold;
}

- (void)setIs_italic:(id)a3
{
}

- (RFOptionalBool)is_italic
{
  return self->_is_italic;
}

- (void)setColor:(id)a3
{
}

- (RFColor)color
{
  return self->_color;
}

- (RFImageElement)inline_image_element
{
  return self->_inline_image_element;
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)hash
{
  v31 = [(RFFormattedText *)self text];
  uint64_t v3 = [v31 hash];
  v30 = [(RFFormattedText *)self inline_image_element];
  uint64_t v4 = [v30 hash] ^ v3;
  v29 = [(RFFormattedText *)self color];
  uint64_t v5 = [v29 hash];
  v28 = [(RFFormattedText *)self is_italic];
  uint64_t v6 = v4 ^ v5 ^ [v28 hash];
  v27 = [(RFFormattedText *)self is_bold];
  uint64_t v7 = [v27 hash];
  v26 = [(RFFormattedText *)self text_encapsulation];
  uint64_t v8 = v7 ^ [v26 hash];
  v9 = [(RFFormattedText *)self is_highlighted];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(RFFormattedText *)self background_color];
  uint64_t v12 = [v11 hash];
  v13 = [(RFFormattedText *)self attributions];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(RFFormattedText *)self highlighted_substrings];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(RFFormattedText *)self font];
  uint64_t v18 = v10 ^ v16 ^ [v17 hash];
  v19 = [(RFFormattedText *)self is_underlined];
  uint64_t v20 = [v19 hash];
  v21 = [(RFFormattedText *)self engageable];
  uint64_t v22 = v20 ^ [v21 hash];
  uint64_t v23 = v22 ^ [(RFFormattedText *)self weight];
  unint64_t v24 = v18 ^ v23 ^ [(RFFormattedText *)self design];

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (RFFormattedText *)a3;
  if (self == v4)
  {
    BOOL v19 = 1;
    goto LABEL_92;
  }
  if (![(RFFormattedText *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v19 = 0;
    goto LABEL_92;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [(RFFormattedText *)self text];
  id v122 = [(RFFormattedText *)v5 text];
  id v123 = v6;
  int v120 = v122 != 0;
  int v121 = v6 == 0;
  if (v121 == v120)
  {
    uint64_t v119 = 0;
    memset(v118, 0, sizeof(v118));
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    memset(v117, 0, sizeof(v117));
    int v14 = 0;
    memset(v124, 0, sizeof(v124));
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    BOOL v19 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = [(RFFormattedText *)self text];
  BOOL v9 = v8 != 0;
  v116 = (void *)v8;
  if (!v8
    || ([(RFFormattedText *)self text],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        [(RFFormattedText *)v5 text],
        v112 = objc_claimAutoreleasedReturnValue(),
        v113 = v10,
        objc_msgSend(v10, "isEqual:")))
  {
    v115 = [(RFFormattedText *)self inline_image_element];
    v114 = [(RFFormattedText *)v5 inline_image_element];
    HIDWORD(v119) = v9;
    if ((v115 == 0) == (v114 != 0))
    {
      LODWORD(v119) = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      memset(v117, 0, sizeof(v117));
      int v14 = 0;
      memset(v124, 0, sizeof(v124));
      memset(v118, 0, 44);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      BOOL v19 = 0;
      HIDWORD(v118[5]) = 1;
      goto LABEL_15;
    }
    uint64_t v20 = [(RFFormattedText *)self inline_image_element];
    BOOL v21 = v20 != 0;
    v111 = (void *)v20;
    if (v20)
    {
      uint64_t v22 = [(RFFormattedText *)self inline_image_element];
      v107 = [(RFFormattedText *)v5 inline_image_element];
      v108 = v22;
      if (!objc_msgSend(v22, "isEqual:"))
      {
        memset(v118, 0, 40);
        int v11 = 0;
        int v12 = 0;
        int v13 = 0;
        memset(v117, 0, sizeof(v117));
        int v14 = 0;
        memset(v124, 0, sizeof(v124));
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        v118[5] = 0x100000001;
        LODWORD(v119) = 1;
        goto LABEL_15;
      }
    }
    v110 = [(RFFormattedText *)self color];
    v109 = [(RFFormattedText *)v5 color];
    LODWORD(v119) = v21;
    if ((v110 == 0) == (v109 != 0))
    {
      memset(v118, 0, 32);
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      memset(v117, 0, sizeof(v117));
      int v14 = 0;
      memset(v124, 0, sizeof(v124));
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      BOOL v19 = 0;
      v118[5] = 0x100000001;
      v118[4] = 1;
      goto LABEL_15;
    }
    uint64_t v28 = [(RFFormattedText *)self color];
    HIDWORD(v124[4]) = v28 != 0;
    v106 = (void *)v28;
    if (v28
      && ([(RFFormattedText *)self color],
          v29 = objc_claimAutoreleasedReturnValue(),
          v53 = v5,
          [(RFFormattedText *)v5 color],
          v102 = objc_claimAutoreleasedReturnValue(),
          v103 = v29,
          !objc_msgSend(v29, "isEqual:")))
    {
      memset(v118, 0, 32);
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      memset(v117, 0, sizeof(v117));
      int v14 = 0;
      int v15 = 0;
      memset(v124, 0, 36);
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      BOOL v19 = 0;
      v118[5] = 0x100000001;
      v118[4] = 0x100000001;
      HIDWORD(v124[4]) = 1;
    }
    else
    {
      v105 = [(RFFormattedText *)self is_italic];
      v104 = [(RFFormattedText *)v5 is_italic];
      if ((v105 == 0) == (v104 != 0))
      {
        memset(v118, 0, 24);
        int v11 = 0;
        int v12 = 0;
        int v13 = 0;
        memset(v117, 0, sizeof(v117));
        int v14 = 0;
        int v15 = 0;
        memset(v124, 0, 36);
        int v16 = 0;
        int v17 = 0;
        int v18 = 0;
        BOOL v19 = 0;
        v118[5] = 0x100000001;
        v118[4] = 0x100000001;
        v118[3] = 1;
        goto LABEL_15;
      }
      uint64_t v30 = [(RFFormattedText *)self is_italic];
      LODWORD(v124[4]) = v30 != 0;
      v101 = (void *)v30;
      if (!v30
        || ([(RFFormattedText *)self is_italic],
            v31 = objc_claimAutoreleasedReturnValue(),
            v53 = v5,
            [(RFFormattedText *)v5 is_italic],
            v97 = objc_claimAutoreleasedReturnValue(),
            v98 = v31,
            objc_msgSend(v31, "isEqual:")))
      {
        v100 = [(RFFormattedText *)self is_bold];
        v99 = [(RFFormattedText *)v5 is_bold];
        if ((v100 == 0) == (v99 != 0))
        {
          v118[0] = 0;
          v118[1] = 0;
          int v11 = 0;
          int v12 = 0;
          memset(v124, 0, 32);
          int v13 = 0;
          memset(v117, 0, sizeof(v117));
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          int v18 = 0;
          BOOL v19 = 0;
          v118[5] = 0x100000001;
          v118[4] = 0x100000001;
          v118[3] = 0x100000001;
          v118[2] = 1;
          goto LABEL_15;
        }
        uint64_t v32 = [(RFFormattedText *)self is_bold];
        HIDWORD(v124[3]) = v32 != 0;
        v96 = (void *)v32;
        if (v32)
        {
          v33 = [(RFFormattedText *)self is_bold];
          v92 = [(RFFormattedText *)v5 is_bold];
          v93 = v33;
          if (!objc_msgSend(v33, "isEqual:"))
          {
            v118[0] = 0;
            v118[1] = 0;
            int v11 = 0;
            int v12 = 0;
            int v13 = 0;
            memset(v117, 0, sizeof(v117));
            int v14 = 0;
            int v15 = 0;
            memset(v124, 0, 28);
            int v16 = 0;
            int v17 = 0;
            int v18 = 0;
            BOOL v19 = 0;
            v118[5] = 0x100000001;
            v118[4] = 0x100000001;
            v118[3] = 0x100000001;
            v118[2] = 0x100000001;
            HIDWORD(v124[3]) = 1;
            goto LABEL_15;
          }
        }
        uint64_t v34 = [(RFFormattedText *)self text_encapsulation];
        v94 = [(RFFormattedText *)v5 text_encapsulation];
        v95 = (void *)v34;
        if ((v34 == 0) == (v94 != 0))
        {
          v118[0] = 0;
          int v11 = 0;
          int v12 = 0;
          int v13 = 0;
          memset(v117, 0, sizeof(v117));
          int v14 = 0;
          int v15 = 0;
          memset(v124, 0, 28);
          int v16 = 0;
          int v17 = 0;
          int v18 = 0;
          BOOL v19 = 0;
          v118[5] = 0x100000001;
          v118[4] = 0x100000001;
          v118[3] = 0x100000001;
          v118[2] = 0x100000001;
          v118[1] = 1;
          goto LABEL_15;
        }
        v91 = [(RFFormattedText *)self text_encapsulation];
        LODWORD(v124[3]) = v91 != 0;
        if (v91)
        {
          v35 = [(RFFormattedText *)self text_encapsulation];
          v87 = [(RFFormattedText *)v5 text_encapsulation];
          v88 = v35;
          if (!objc_msgSend(v35, "isEqual:"))
          {
            v118[0] = 0;
            int v11 = 0;
            int v12 = 0;
            int v13 = 0;
            memset(v117, 0, sizeof(v117));
            int v14 = 0;
            memset(v124, 0, 24);
            int v15 = 0;
            int v16 = 0;
            int v17 = 0;
            int v18 = 0;
            BOOL v19 = 0;
            v118[5] = 0x100000001;
            v118[4] = 0x100000001;
            v118[3] = 0x100000001;
            v118[2] = 0x100000001;
            v118[1] = 0x100000001;
            LODWORD(v124[3]) = 1;
            goto LABEL_15;
          }
        }
        v90 = [(RFFormattedText *)self is_highlighted];
        v89 = [(RFFormattedText *)v5 is_highlighted];
        if ((v90 == 0) == (v89 != 0))
        {
          *(void *)&v117[12] = 0;
          v118[0] = 0;
          int v11 = 0;
          int v12 = 0;
          *(void *)v117 = 0;
          int v13 = 0;
          int v14 = 0;
          memset(v124, 0, 24);
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          int v18 = 0;
          BOOL v19 = 0;
          v118[5] = 0x100000001;
          v118[4] = 0x100000001;
          v118[3] = 0x100000001;
          v118[2] = 0x100000001;
          v118[1] = 0x100000001;
          *(_DWORD *)&v117[8] = 1;
          goto LABEL_15;
        }
        v86 = [(RFFormattedText *)self is_highlighted];
        HIDWORD(v124[2]) = v86 != 0;
        if (v86)
        {
          v36 = [(RFFormattedText *)self is_highlighted];
          v82 = [(RFFormattedText *)v5 is_highlighted];
          v83 = v36;
          if (!objc_msgSend(v36, "isEqual:"))
          {
            int v11 = 0;
            *(void *)&v117[12] = 0;
            int v12 = 0;
            *(void *)v117 = 0;
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            memset(v124, 0, 20);
            int v16 = 0;
            int v17 = 0;
            int v18 = 0;
            BOOL v19 = 0;
            v118[5] = 0x100000001;
            v118[4] = 0x100000001;
            v118[3] = 0x100000001;
            v118[2] = 0x100000001;
            v118[1] = 0x100000001;
            *(_DWORD *)&v117[8] = 1;
            v118[0] = 0x100000000;
            HIDWORD(v124[2]) = 1;
            goto LABEL_15;
          }
        }
        v85 = [(RFFormattedText *)self background_color];
        v84 = [(RFFormattedText *)v5 background_color];
        if ((v85 == 0) == (v84 != 0))
        {
          *(void *)&v117[12] = 0;
          int v12 = 0;
          *(void *)v117 = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          memset(v124, 0, 20);
          int v16 = 0;
          int v17 = 0;
          int v18 = 0;
          BOOL v19 = 0;
          v118[5] = 0x100000001;
          v118[4] = 0x100000001;
          v118[3] = 0x100000001;
          v118[2] = 0x100000001;
          v118[1] = 0x100000001;
          *(_DWORD *)&v117[8] = 1;
          v118[0] = 0x100000000;
          int v11 = 1;
          goto LABEL_15;
        }
        uint64_t v37 = [(RFFormattedText *)self background_color];
        LODWORD(v124[2]) = v37 != 0;
        v81 = (void *)v37;
        if (v37)
        {
          v38 = [(RFFormattedText *)self background_color];
          v39 = v5;
          v77 = [(RFFormattedText *)v5 background_color];
          v78 = v38;
          if (!objc_msgSend(v38, "isEqual:"))
          {
            int v12 = 0;
            *(void *)v117 = 0;
            v124[0] = 0;
            v124[1] = 0;
            int v13 = 0;
            int v14 = 0;
            int v15 = 0;
            int v16 = 0;
            int v17 = 0;
            int v18 = 0;
            BOOL v19 = 0;
            v118[5] = 0x100000001;
            v118[4] = 0x100000001;
            v118[3] = 0x100000001;
            v118[2] = 0x100000001;
            v118[1] = 0x100000001;
            *(_DWORD *)&v117[8] = 1;
            *(void *)&v117[12] = 0x100000000;
            v118[0] = 0x100000000;
            int v11 = 1;
            LODWORD(v124[2]) = 1;
            goto LABEL_156;
          }
        }
        else
        {
          v39 = v5;
        }
        v80 = [(RFFormattedText *)self attributions];
        v79 = [(RFFormattedText *)v39 attributions];
        if ((v80 == 0) == (v79 != 0))
        {
          *(void *)v117 = 0;
          v124[0] = 0;
          v124[1] = 0;
          int v13 = 0;
          int v14 = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          int v18 = 0;
          BOOL v19 = 0;
          v118[5] = 0x100000001;
          v118[4] = 0x100000001;
          v118[3] = 0x100000001;
          v118[2] = 0x100000001;
          v118[1] = 0x100000001;
          *(void *)&v117[8] = 1;
          v118[0] = 0x100000000;
          int v11 = 1;
          *(_DWORD *)&v117[16] = 1;
          int v12 = 1;
        }
        else
        {
          uint64_t v40 = [(RFFormattedText *)self attributions];
          HIDWORD(v124[1]) = v40 != 0;
          v76 = (void *)v40;
          if (!v40
            || ([(RFFormattedText *)self attributions],
                v41 = objc_claimAutoreleasedReturnValue(),
                [(RFFormattedText *)v39 attributions],
                v72 = objc_claimAutoreleasedReturnValue(),
                v73 = v41,
                objc_msgSend(v41, "isEqual:")))
          {
            v75 = [(RFFormattedText *)self highlighted_substrings];
            v74 = [(RFFormattedText *)v39 highlighted_substrings];
            if ((v75 == 0) == (v74 != 0))
            {
              *(void *)&v117[12] = 0x100000000;
              *(void *)((char *)v124 + 4) = 0;
              *(void *)v117 = 0x100000000;
              int v14 = 0;
              int v15 = 0;
              LODWORD(v124[0]) = 0;
              int v16 = 0;
              int v17 = 0;
              int v18 = 0;
              BOOL v19 = 0;
              v118[5] = 0x100000001;
              v118[4] = 0x100000001;
              v118[3] = 0x100000001;
              v118[2] = 0x100000001;
              v118[1] = 0x100000001;
              *(_DWORD *)&v117[8] = 1;
              v118[0] = 0x100000000;
              int v11 = 1;
              int v12 = 1;
              int v13 = 1;
            }
            else
            {
              uint64_t v42 = [(RFFormattedText *)self highlighted_substrings];
              LODWORD(v124[1]) = v42 != 0;
              v71 = (void *)v42;
              if (!v42
                || ([(RFFormattedText *)self highlighted_substrings],
                    v43 = objc_claimAutoreleasedReturnValue(),
                    [(RFFormattedText *)v39 highlighted_substrings],
                    v67 = objc_claimAutoreleasedReturnValue(),
                    v68 = v43,
                    objc_msgSend(v43, "isEqual:")))
              {
                v70 = [(RFFormattedText *)self font];
                v69 = [(RFFormattedText *)v39 font];
                if ((v70 == 0) == (v69 != 0))
                {
                  int v14 = 0;
                  v124[0] = 0;
                  int v15 = 0;
                  int v16 = 0;
                  int v17 = 0;
                  int v18 = 0;
                  BOOL v19 = 0;
                  v118[5] = 0x100000001;
                  v118[4] = 0x100000001;
                  v118[3] = 0x100000001;
                  v118[2] = 0x100000001;
                  v118[1] = 0x100000001;
                  *(_DWORD *)&v117[8] = 1;
                  v118[0] = 0x100000000;
                  int v11 = 1;
                  *(void *)&v117[12] = 0x100000001;
                  int v12 = 1;
                  int v13 = 1;
                  *(void *)v117 = 0x100000001;
                }
                else
                {
                  uint64_t v44 = [(RFFormattedText *)self font];
                  HIDWORD(v124[0]) = v44 != 0;
                  v66 = (void *)v44;
                  if (!v44
                    || ([(RFFormattedText *)self font],
                        v45 = objc_claimAutoreleasedReturnValue(),
                        [(RFFormattedText *)v39 font],
                        v62 = objc_claimAutoreleasedReturnValue(),
                        v63 = v45,
                        objc_msgSend(v45, "isEqual:")))
                  {
                    v65 = [(RFFormattedText *)self is_underlined];
                    v64 = [(RFFormattedText *)v39 is_underlined];
                    if ((v65 == 0) == (v64 != 0))
                    {
                      int v15 = 0;
                      LODWORD(v124[0]) = 0;
                      int v16 = 0;
                      int v17 = 0;
                      int v18 = 0;
                      BOOL v19 = 0;
                      v118[5] = 0x100000001;
                      v118[4] = 0x100000001;
                      v118[3] = 0x100000001;
                      v118[2] = 0x100000001;
                      v118[1] = 0x100000001;
                      *(_DWORD *)&v117[8] = 1;
                      int v11 = 1;
                      *(void *)&v117[12] = 0x100000001;
                      int v12 = 1;
                      int v13 = 1;
                      *(void *)v117 = 0x100000001;
                      int v14 = 1;
                      v118[0] = 0x100000001;
                    }
                    else
                    {
                      uint64_t v46 = [(RFFormattedText *)self is_underlined];
                      LODWORD(v124[0]) = v46 != 0;
                      v61 = (void *)v46;
                      if (!v46
                        || ([(RFFormattedText *)self is_underlined],
                            v47 = objc_claimAutoreleasedReturnValue(),
                            [(RFFormattedText *)v39 is_underlined],
                            v57 = objc_claimAutoreleasedReturnValue(),
                            v58 = v47,
                            objc_msgSend(v47, "isEqual:")))
                      {
                        v60 = [(RFFormattedText *)self engageable];
                        v59 = [(RFFormattedText *)v39 engageable];
                        if ((v60 == 0) == (v59 != 0))
                        {
                          int v17 = 0;
                          int v18 = 0;
                          BOOL v19 = 0;
                          v118[5] = 0x100000001;
                          v118[4] = 0x100000001;
                          v118[3] = 0x100000001;
                          v118[2] = 0x100000001;
                          v118[1] = 0x100000001;
                          *(_DWORD *)&v117[8] = 1;
                          v118[0] = 0x100000001;
                          int v11 = 1;
                          *(void *)&v117[12] = 0x100000001;
                          int v12 = 1;
                          int v13 = 1;
                          *(void *)v117 = 0x100000001;
                          int v14 = 1;
                          int v15 = 1;
                          int v16 = 1;
                        }
                        else
                        {
                          uint64_t v48 = [(RFFormattedText *)self engageable];
                          BOOL v54 = v48 != 0;
                          v56 = (void *)v48;
                          if (!v48
                            || ([(RFFormattedText *)self engageable],
                                v49 = objc_claimAutoreleasedReturnValue(),
                                [(RFFormattedText *)v39 engageable],
                                v55 = v49,
                                uint64_t v52 = objc_claimAutoreleasedReturnValue(),
                                objc_msgSend(v49, "isEqual:")))
                          {
                            int v50 = [(RFFormattedText *)self weight];
                            if (v50 == [(RFFormattedText *)v39 weight])
                            {
                              int v51 = [(RFFormattedText *)self design];
                              uint64_t v5 = v39;
                              BOOL v19 = v51 == [(RFFormattedText *)v39 design];
                              v118[5] = 0x100000001;
                              v118[4] = 0x100000001;
                              v118[3] = 0x100000001;
                              v118[2] = 0x100000001;
                              v118[1] = 0x100000001;
                              *(_DWORD *)&v117[8] = 1;
                              v118[0] = 0x100000001;
                              int v11 = 1;
                              *(void *)&v117[12] = 0x100000001;
                              int v12 = 1;
                              int v13 = 1;
                              *(void *)v117 = 0x100000001;
                              int v14 = 1;
                              int v15 = 1;
                              int v16 = 1;
                              int v17 = 1;
                              int v18 = v54;
                              uint64_t v7 = (void *)v52;
                              goto LABEL_15;
                            }
                            BOOL v19 = 0;
                            v118[5] = 0x100000001;
                            v118[4] = 0x100000001;
                            v118[3] = 0x100000001;
                            v118[2] = 0x100000001;
                            v118[1] = 0x100000001;
                            *(_DWORD *)&v117[8] = 1;
                            v118[0] = 0x100000001;
                            int v11 = 1;
                            *(void *)&v117[12] = 0x100000001;
                            int v12 = 1;
                            int v13 = 1;
                            *(void *)v117 = 0x100000001;
                            int v14 = 1;
                            int v15 = 1;
                            int v16 = 1;
                            int v17 = 1;
                            int v18 = v54;
                          }
                          else
                          {
                            BOOL v19 = 0;
                            v118[5] = 0x100000001;
                            v118[4] = 0x100000001;
                            v118[3] = 0x100000001;
                            v118[2] = 0x100000001;
                            v118[1] = 0x100000001;
                            *(_DWORD *)&v117[8] = 1;
                            v118[0] = 0x100000001;
                            int v11 = 1;
                            *(void *)&v117[12] = 0x100000001;
                            int v12 = 1;
                            int v13 = 1;
                            *(void *)v117 = 0x100000001;
                            int v14 = 1;
                            int v15 = 1;
                            int v16 = 1;
                            int v17 = 1;
                            int v18 = 1;
                          }
                          uint64_t v7 = (void *)v52;
                        }
                      }
                      else
                      {
                        int v16 = 0;
                        int v17 = 0;
                        int v18 = 0;
                        BOOL v19 = 0;
                        v118[5] = 0x100000001;
                        v118[4] = 0x100000001;
                        v118[3] = 0x100000001;
                        v118[2] = 0x100000001;
                        v118[1] = 0x100000001;
                        *(_DWORD *)&v117[8] = 1;
                        v118[0] = 0x100000001;
                        int v11 = 1;
                        *(void *)&v117[12] = 0x100000001;
                        int v12 = 1;
                        int v13 = 1;
                        *(void *)v117 = 0x100000001;
                        int v14 = 1;
                        int v15 = 1;
                        LODWORD(v124[0]) = 1;
                      }
                    }
                  }
                  else
                  {
                    int v15 = 0;
                    v124[0] = 0x100000000;
                    int v16 = 0;
                    int v17 = 0;
                    int v18 = 0;
                    BOOL v19 = 0;
                    v118[5] = 0x100000001;
                    v118[4] = 0x100000001;
                    v118[3] = 0x100000001;
                    v118[2] = 0x100000001;
                    v118[1] = 0x100000001;
                    *(_DWORD *)&v117[8] = 1;
                    v118[0] = 0x100000000;
                    int v11 = 1;
                    *(void *)&v117[12] = 0x100000001;
                    int v12 = 1;
                    int v13 = 1;
                    *(void *)v117 = 0x100000001;
                    int v14 = 1;
                  }
                }
              }
              else
              {
                *(void *)v117 = 0x100000000;
                int v14 = 0;
                v124[0] = 0;
                int v15 = 0;
                int v16 = 0;
                int v17 = 0;
                int v18 = 0;
                BOOL v19 = 0;
                v118[5] = 0x100000001;
                v118[4] = 0x100000001;
                v118[3] = 0x100000001;
                v118[2] = 0x100000001;
                v118[1] = 0x100000001;
                *(_DWORD *)&v117[8] = 1;
                v118[0] = 0x100000000;
                int v11 = 1;
                *(void *)&v117[12] = 0x100000001;
                int v12 = 1;
                int v13 = 1;
                LODWORD(v124[1]) = 1;
              }
            }
          }
          else
          {
            int v13 = 0;
            *(void *)&v117[12] = 0x100000000;
            *(void *)((char *)v124 + 4) = 0;
            *(void *)v117 = 0x100000000;
            int v14 = 0;
            int v15 = 0;
            LODWORD(v124[0]) = 0;
            int v16 = 0;
            int v17 = 0;
            int v18 = 0;
            BOOL v19 = 0;
            v118[5] = 0x100000001;
            v118[4] = 0x100000001;
            v118[3] = 0x100000001;
            v118[2] = 0x100000001;
            v118[1] = 0x100000001;
            *(_DWORD *)&v117[8] = 1;
            v118[0] = 0x100000000;
            int v11 = 1;
            int v12 = 1;
            HIDWORD(v124[1]) = 1;
          }
        }
LABEL_156:
        uint64_t v5 = v39;
        goto LABEL_15;
      }
      memset(v118, 0, 24);
      int v11 = 0;
      int v12 = 0;
      memset(v124, 0, 32);
      int v13 = 0;
      memset(v117, 0, sizeof(v117));
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      BOOL v19 = 0;
      v118[5] = 0x100000001;
      v118[4] = 0x100000001;
      v118[3] = 0x100000001;
      LODWORD(v124[4]) = 1;
    }
    uint64_t v5 = v53;
    goto LABEL_15;
  }
  uint64_t v119 = 0x100000000;
  memset(v118, 0, sizeof(v118));
  int v11 = 0;
  int v12 = 0;
  int v13 = 0;
  memset(v117, 0, sizeof(v117));
  int v14 = 0;
  memset(v124, 0, sizeof(v124));
  int v15 = 0;
  int v16 = 0;
  int v17 = 0;
  int v18 = 0;
  BOOL v19 = 0;
LABEL_15:
  if (v18)
  {
    int v23 = v14;
    int v24 = v15;
    int v25 = v16;
    int v26 = v17;

    int v17 = v26;
    int v16 = v25;
    int v15 = v24;
    int v14 = v23;
  }
  if (v17) {

  }
  if (v16)
  {
  }
  if (LODWORD(v124[0]))
  {
  }
  if (v15) {

  }
  if (LODWORD(v118[0]))
  {
  }
  if (HIDWORD(v124[0]))
  {
  }
  if (v14) {

  }
  if (*(_DWORD *)v117)
  {
  }
  if (LODWORD(v124[1]))
  {
  }
  if (*(_DWORD *)&v117[12]) {

  }
  if (v13)
  {
  }
  if (HIDWORD(v124[1]))
  {
  }
  if (*(_DWORD *)&v117[4]) {

  }
  if (v12)
  {
  }
  if (LODWORD(v124[2]))
  {
  }
  if (*(_DWORD *)&v117[16]) {

  }
  if (v11)
  {
  }
  if (HIDWORD(v124[2]))
  {
  }
  if (HIDWORD(v118[0])) {

  }
  if (*(_DWORD *)&v117[8])
  {
  }
  if (LODWORD(v124[3]))
  {
  }
  if (HIDWORD(v118[1])) {

  }
  if (LODWORD(v118[1]))
  {
  }
  if (HIDWORD(v124[3]))
  {
  }
  if (HIDWORD(v118[2])) {

  }
  if (LODWORD(v118[2]))
  {
  }
  if (LODWORD(v124[4]))
  {
  }
  if (HIDWORD(v118[3])) {

  }
  if (LODWORD(v118[3]))
  {
  }
  if (HIDWORD(v124[4]))
  {
  }
  if (HIDWORD(v118[4])) {

  }
  if (LODWORD(v118[4]))
  {
  }
  if (v119)
  {
  }
  if (LODWORD(v118[5])) {

  }
  if (HIDWORD(v118[5]))
  {
  }
  if (HIDWORD(v119))
  {
  }
  if (v121 != v120) {

  }
LABEL_92:
  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(RFFormattedText *)self hasText])
  {
    uint64_t v5 = [(RFFormattedText *)self text];
    uint64_t v6 = (void *)[v5 copy];
    [v4 setText:v6];
  }
  if ([(RFFormattedText *)self hasInline_image_element])
  {
    uint64_t v7 = [(RFFormattedText *)self inline_image_element];
    uint64_t v8 = (void *)[v7 copy];
    objc_msgSend(v4, "setInline_image_element:", v8);
  }
  BOOL v9 = [(RFFormattedText *)self color];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setColor:v10];

  int v11 = [(RFFormattedText *)self is_italic];
  int v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setIs_italic:", v12);

  int v13 = [(RFFormattedText *)self is_bold];
  int v14 = (void *)[v13 copy];
  objc_msgSend(v4, "setIs_bold:", v14);

  int v15 = [(RFFormattedText *)self text_encapsulation];
  int v16 = (void *)[v15 copy];
  objc_msgSend(v4, "setText_encapsulation:", v16);

  int v17 = [(RFFormattedText *)self is_highlighted];
  int v18 = (void *)[v17 copy];
  objc_msgSend(v4, "setIs_highlighted:", v18);

  BOOL v19 = [(RFFormattedText *)self background_color];
  uint64_t v20 = (void *)[v19 copy];
  objc_msgSend(v4, "setBackground_color:", v20);

  BOOL v21 = [(RFFormattedText *)self attributions];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setAttributions:v22];

  int v23 = [(RFFormattedText *)self highlighted_substrings];
  int v24 = (void *)[v23 copy];
  objc_msgSend(v4, "setHighlighted_substrings:", v24);

  int v25 = [(RFFormattedText *)self font];
  int v26 = (void *)[v25 copy];
  [v4 setFont:v26];

  v27 = [(RFFormattedText *)self is_underlined];
  uint64_t v28 = (void *)[v27 copy];
  objc_msgSend(v4, "setIs_underlined:", v28);

  v29 = [(RFFormattedText *)self engageable];
  uint64_t v30 = (void *)[v29 copy];
  [v4 setEngageable:v30];

  objc_msgSend(v4, "setWeight:", -[RFFormattedText weight](self, "weight"));
  objc_msgSend(v4, "setDesign:", -[RFFormattedText design](self, "design"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFFormattedText alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBRFFormattedText *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFFormattedText alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBRFFormattedText *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFFormattedText alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBRFFormattedText *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFFormattedText)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFFormattedText alloc] initWithData:v5];
  uint64_t v7 = [(RFFormattedText *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasDesign
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDesign:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_design = a3;
}

- (BOOL)hasWeight
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWeight:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_weight = a3;
}

- (BOOL)hasInline_image_element
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setInline_image_element:(id)a3
{
  *(unsigned char *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_inline_image_element, a3);
  id v6 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  text = self->_text;
  self->_text = 0;
}

- (BOOL)hasText
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setText:(id)a3
{
  *(unsigned char *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_text, a3);
  id v6 = a3;
  *(unsigned char *)&self->_has &= ~2u;
  inline_image_element = self->_inline_image_element;
  self->_inline_image_element = 0;
}

- (RFFormattedText)initWithProtobuf:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v74.receiver = self;
  v74.super_class = (Class)RFFormattedText;
  uint64_t v5 = [(RFFormattedText *)&v74 init];
  if (v5)
  {
    id v6 = [v4 text];

    if (v6)
    {
      uint64_t v7 = [v4 text];
      [(RFFormattedText *)v5 setText:v7];
    }
    uint64_t v8 = objc_msgSend(v4, "inline_image_element");

    if (v8)
    {
      BOOL v9 = [RFImageElement alloc];
      uint64_t v10 = objc_msgSend(v4, "inline_image_element");
      int v11 = [(RFImageElement *)v9 initWithProtobuf:v10];
      [(RFFormattedText *)v5 setInline_image_element:v11];
    }
    int v12 = [v4 color];

    if (v12)
    {
      int v13 = [RFColor alloc];
      int v14 = [v4 color];
      int v15 = [(RFColor *)v13 initWithProtobuf:v14];
      [(RFFormattedText *)v5 setColor:v15];
    }
    int v16 = objc_msgSend(v4, "is_italic");

    if (v16)
    {
      int v17 = [RFOptionalBool alloc];
      int v18 = objc_msgSend(v4, "is_italic");
      BOOL v19 = [(RFOptionalBool *)v17 initWithProtobuf:v18];
      [(RFFormattedText *)v5 setIs_italic:v19];
    }
    uint64_t v20 = objc_msgSend(v4, "is_bold");

    if (v20)
    {
      BOOL v21 = [RFOptionalBool alloc];
      uint64_t v22 = objc_msgSend(v4, "is_bold");
      int v23 = [(RFOptionalBool *)v21 initWithProtobuf:v22];
      [(RFFormattedText *)v5 setIs_bold:v23];
    }
    int v24 = objc_msgSend(v4, "text_encapsulation");

    if (v24)
    {
      int v25 = [RFTextEncapsulation alloc];
      int v26 = objc_msgSend(v4, "text_encapsulation");
      v27 = [(RFTextEncapsulation *)v25 initWithProtobuf:v26];
      [(RFFormattedText *)v5 setText_encapsulation:v27];
    }
    uint64_t v28 = objc_msgSend(v4, "is_highlighted");

    if (v28)
    {
      v29 = [RFOptionalBool alloc];
      uint64_t v30 = objc_msgSend(v4, "is_highlighted");
      v31 = [(RFOptionalBool *)v29 initWithProtobuf:v30];
      [(RFFormattedText *)v5 setIs_highlighted:v31];
    }
    uint64_t v32 = objc_msgSend(v4, "background_color");

    if (v32)
    {
      v33 = [RFColor alloc];
      uint64_t v34 = objc_msgSend(v4, "background_color");
      v35 = [(RFColor *)v33 initWithProtobuf:v34];
      [(RFFormattedText *)v5 setBackground_color:v35];
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
    uint64_t v39 = [v38 countByEnumeratingWithState:&v70 objects:v76 count:16];
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
          v43 = [[RFAttribution alloc] initWithProtobuf:*(void *)(*((void *)&v70 + 1) + 8 * i)];
          if (v43) {
            [v37 addObject:v43];
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v70 objects:v76 count:16];
      }
      while (v40);
    }

    [(RFFormattedText *)v5 setAttributions:v37];
    uint64_t v44 = objc_msgSend(v4, "highlighted_substrings");
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
    uint64_t v46 = objc_msgSend(v4, "highlighted_substrings", 0);
    uint64_t v47 = [v46 countByEnumeratingWithState:&v66 objects:v75 count:16];
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
          int v51 = [[RFHighlightedSubstring alloc] initWithProtobuf:*(void *)(*((void *)&v66 + 1) + 8 * j)];
          if (v51) {
            [v45 addObject:v51];
          }
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v48);
    }

    [(RFFormattedText *)v5 setHighlighted_substrings:v45];
    uint64_t v52 = [v4 font];

    if (v52)
    {
      v53 = [RFFont alloc];
      BOOL v54 = [v4 font];
      v55 = [(RFFont *)v53 initWithProtobuf:v54];
      [(RFFormattedText *)v5 setFont:v55];
    }
    v56 = objc_msgSend(v4, "is_underlined");

    if (v56)
    {
      v57 = [RFOptionalBool alloc];
      v58 = objc_msgSend(v4, "is_underlined");
      v59 = [(RFOptionalBool *)v57 initWithProtobuf:v58];
      [(RFFormattedText *)v5 setIs_underlined:v59];
    }
    v60 = [v4 engageable];

    if (v60)
    {
      v61 = [RFEngageable alloc];
      v62 = [v4 engageable];
      v63 = [(RFEngageable *)v61 initWithProtobuf:v62];
      [(RFFormattedText *)v5 setEngageable:v63];
    }
    if ([v4 weight]) {
      -[RFFormattedText setWeight:](v5, "setWeight:", [v4 weight]);
    }
    if ([v4 design]) {
      -[RFFormattedText setDesign:](v5, "setDesign:", [v4 design]);
    }
    v64 = v5;
  }
  return v5;
}

@end