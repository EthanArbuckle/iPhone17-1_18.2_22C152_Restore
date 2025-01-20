@interface _UILabelContent
- (BOOL)_isContentEqualToContent:(id)a3;
- (BOOL)isAttribute:(id)a3 uniformlyEqualToValue:(id)a4;
- (BOOL)isAttributed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAttributedString:(id)a3;
- (BOOL)isEqualToContent:(id)a3 byAttribute:(id)a4;
- (BOOL)isEqualToString:(id)a3;
- (BOOL)isNil;
- (BOOL)isWidthVariant;
- (_UILabelContent)contentWithAttributedString:(id)a3;
- (_UILabelContent)contentWithDefaultAttributes:(id)a3;
- (_UILabelContent)contentWithString:(id)a3;
- (_UILabelContent)initWithDefaultAttributes:(id)a3;
- (id)attributedString;
- (id)backgroundColor;
- (id)contentByAddingAttribute:(id)a3 toDefaultAttributesWithValue:(id)a4;
- (id)contentByAddingAttributesToDefaultAttributes:(id)a3;
- (id)contentByApplyingAttribute:(id)a3 value:(id)a4 toRange:(_NSRange)a5;
- (id)contentByApplyingAttributeToEntireRange:(id)a3 value:(id)a4;
- (id)contentByCompletingDefaultAttributesWithAttributes:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultAttributes;
- (id)defaultValueForAttribute:(id)a3;
- (id)description;
- (id)font;
- (id)intelligenceLightAttributedStrings;
- (id)labelViewTextAttachments;
- (id)paragraphStyle;
- (id)shadow;
- (id)string;
- (id)textColor;
- (id)widthVariantContentForView:(id)a3;
- (int64_t)differenceVersusContent:(id)a3;
- (int64_t)length;
- (unint64_t)hash;
@end

@implementation _UILabelContent

- (void).cxx_destruct
{
}

- (id)paragraphStyle
{
  return [(_UILabelContent *)self defaultValueForAttribute:*(void *)off_1E52D21B8];
}

- (id)defaultValueForAttribute:(id)a3
{
  return [(NSDictionary *)self->_defaultAttributes objectForKeyedSubscript:a3];
}

- (id)font
{
  return [(_UILabelContent *)self defaultValueForAttribute:*(void *)off_1E52D2040];
}

- (id)shadow
{
  return [(_UILabelContent *)self defaultValueForAttribute:*(void *)off_1E52D2238];
}

- (id)widthVariantContentForView:(id)a3
{
  id v4 = a3;
  if ([(_UILabelContent *)self isWidthVariant])
  {
    v5 = [(_UILabelContent *)self string];
    v6 = _UIAdaptLocalizedStringForView(v5, v4);
    v7 = [(_UILabelContent *)self contentWithString:v6];
  }
  else
  {
    v7 = self;
  }

  return v7;
}

- (id)contentByApplyingAttributeToEntireRange:(id)a3 value:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[_UILabelContent contentByApplyingAttribute:value:toRange:](self, "contentByApplyingAttribute:value:toRange:", v7, v6, 0, [(_UILabelContent *)self length]);

  return v8;
}

- (id)contentByApplyingAttribute:(id)a3 value:(id)a4 toRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a3;
  id v10 = a4;
  if (!v9 || location || length != [(_UILabelContent *)self length]) {
    goto LABEL_14;
  }
  v11 = [(NSDictionary *)self->_defaultAttributes objectForKeyedSubscript:v9];
  v12 = v11;
  if (v10 || !v11)
  {
    if (v10)
    {
      id v15 = v11;
      id v16 = v10;
      v17 = v16;
      if (v15 == v16)
      {
      }
      else
      {
        if (!v12)
        {

LABEL_19:
          v14 = [(_UILabelContent *)self contentByAddingAttribute:v9 toDefaultAttributesWithValue:v17];
          goto LABEL_20;
        }
        char v18 = [v15 isEqual:v16];

        if ((v18 & 1) == 0) {
          goto LABEL_19;
        }
      }
    }

LABEL_14:
    v14 = self;
    goto LABEL_15;
  }
  v13 = (void *)[(NSDictionary *)self->_defaultAttributes mutableCopy];
  [v13 removeObjectForKey:v9];
  v14 = [(_UILabelContent *)self contentWithDefaultAttributes:v13];

LABEL_20:
LABEL_15:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UILabelContent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (BOOL v6 = [(_UILabelContent *)v5 isNil], v6 == [(_UILabelContent *)self isNil])
         && (BOOL v7 = [(_UILabelContent *)v5 isAttributed],
             v7 == [(_UILabelContent *)self isAttributed])
         && (BOOL v8 = [(_UILabelContent *)v5 isWidthVariant],
             v8 == [(_UILabelContent *)self isWidthVariant])
         && (uint64_t v9 = [(_UILabelContent *)v5 length], v9 == [(_UILabelContent *)self length]))
  {
    char v10 = [(_UILabelContent *)v5 _isContentEqualToContent:self];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isNil
{
  return 1;
}

- (int64_t)differenceVersusContent:(id)a3
{
  id v4 = (_UILabelContent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    int64_t v15 = 0;
  }
  else if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [(_UILabelContent *)v5 isNil];
      int v7 = v6 ^ [(_UILabelContent *)self isNil];
      BOOL v8 = [(_UILabelContent *)v5 isAttributed];
      if (v8 ^ [(_UILabelContent *)self isAttributed] | v7) {
        uint64_t v9 = 256;
      }
      else {
        uint64_t v9 = 0;
      }
      BOOL v10 = [(_UILabelContent *)v5 isWidthVariant];
      if (v10 != [(_UILabelContent *)self isWidthVariant]) {
        uint64_t v11 = 8448;
      }
      else {
        uint64_t v11 = v9;
      }
      v12 = [(_UILabelContent *)v5 defaultAttributes];
      v13 = [(_UILabelContent *)self defaultAttributes];
      BOOL v14 = [(_UILabelContent *)v5 isAttributed] || [(_UILabelContent *)self isAttributed];
      id v16 = v12;
      id v17 = v13;
      char v18 = v17;
      if (v16 == v17)
      {
      }
      else
      {
        if (!v16 || !v17)
        {

          goto LABEL_24;
        }
        char v19 = [v16 isEqual:v17];

        if ((v19 & 1) == 0)
        {
LABEL_24:
          v11 |= 0x200uLL;
          if (v14)
          {
            int v20 = 0;
          }
          else
          {
            v21 = *(void **)off_1E52D2048;
            id v22 = v16;
            uint64_t v64 = v11;
            id v23 = v18;
            LODWORD(v21) = HasAttributeDifferenceDefaults(v21, v22, v23);
            if (HasAttributeDifferenceDefaults(*(void **)off_1E52D1F58, v22, v23) | v21) {
              uint64_t v24 = 0x20000;
            }
            else {
              uint64_t v24 = 0;
            }
            if (HasAttributeDifferenceDefaults(*(void **)off_1E52D21B8, v22, v23)) {
              v24 |= 0xC000uLL;
            }
            uint64_t v25 = v24 | GetShadowAttributeDifferenceDefaults(v22, v23);
            int v62 = HasAttributeDifferenceDefaults(*(void **)off_1E52D2040, v22, v23);
            BOOL v26 = v14;
            v27 = v18;
            int v28 = HasAttributeDifferenceDefaults((void *)*MEMORY[0x1E4F24480], v22, v23);
            id v29 = v16;
            int v30 = HasAttributeDifferenceDefaults((void *)*MEMORY[0x1E4F24580], v22, v23);

            int v31 = v30 | v28;
            char v18 = v27;
            BOOL v14 = v26;
            int v20 = 0;
            id v16 = v29;
            BOOL v32 = (v31 | v62) == 0;
            uint64_t v33 = v25 | 0x14000;
            if (v32) {
              uint64_t v33 = v25;
            }
            uint64_t v11 = v33 | v64;
          }
LABEL_35:
          uint64_t v34 = [(_UILabelContent *)v5 length];
          if (v34 != [(_UILabelContent *)self length])
          {
            v11 |= 0x1800uLL;
LABEL_78:
            int64_t v15 = (8 * (int)v11) & 0x4000 | v11;

            goto LABEL_79;
          }
          if (!v14)
          {
            v46 = [(_UILabelContent *)v5 string];
            v47 = [(_UILabelContent *)self string];
            id v48 = v46;
            id v49 = v47;
            v50 = v49;
            if (v48 == v49)
            {
              int v51 = 1;
            }
            else
            {
              int v51 = 0;
              if (v48 && v49) {
                int v51 = [v48 isEqual:v49];
              }
            }

            if (!v51) {
              v11 |= 0x4800uLL;
            }
            goto LABEL_78;
          }
          v35 = [(_UILabelContent *)v5 attributedString];
          v36 = [(_UILabelContent *)self attributedString];
          if (!v20 || ([v35 isEqualToAttributedString:v36] & 1) == 0)
          {
            v63 = v16;
            v65 = v18;
            uint64_t v37 = v11;
            uint64_t v38 = [(_UILabelContent *)self length];
            v39 = [v35 string];
            v40 = [v36 string];
            char v41 = [v39 isEqualToString:v40];

            if (v41)
            {
              if (v38)
              {
                uint64_t v68 = 0;
                uint64_t v69 = 0;
                uint64_t v66 = 0;
                uint64_t v67 = 0;
                v42 = objc_msgSend(v35, "attributesAtIndex:longestEffectiveRange:inRange:", 0, &v68, 0, v38);
                v43 = objc_msgSend(v36, "attributesAtIndex:longestEffectiveRange:inRange:", 0, &v66, 0, v38);
                if (v69 == v38 && v68 == v66 && v38 == v67)
                {
                  id v16 = v63;
                  v44 = (void *)[v63 mutableCopy];
                  [v44 addEntriesFromDictionary:v42];
                  v45 = (void *)[v65 mutableCopy];
                  [v45 addEntriesFromDictionary:v43];
                  if (UIEqual(v44, v45))
                  {
                    uint64_t v11 = v37;
                    if (UIEqual(v42, v43))
                    {

LABEL_76:
                      char v18 = v65;

                      goto LABEL_77;
                    }
                    v56 = (uint64_t (*)(uint64_t, id, id))HasAttributeDifferenceDefaults;
                    v57 = GetShadowAttributeDifferenceDefaults;
                    v58 = v42;
                    v59 = v43;
LABEL_70:
                    if (GetAttributeDifference(v56, v57, v58, v59))
                    {

                      uint64_t AttributeDifference = 8;
                      goto LABEL_72;
                    }

                    goto LABEL_74;
                  }
                  v54 = (uint64_t (*)(uint64_t, id, id))HasAttributeDifferenceDefaults;
                  v55 = GetShadowAttributeDifferenceDefaults;
                }
                else
                {
                  v52 = [(_UILabelContent *)v5 defaultAttributes];
                  v44 = [(NSAttributedString *)v35 _ui_synthesizeAttributedSubstringFromRange:v38 usingDefaultAttributes:v52];

                  v53 = [(_UILabelContent *)self defaultAttributes];
                  v45 = [(NSAttributedString *)v36 _ui_synthesizeAttributedSubstringFromRange:v38 usingDefaultAttributes:v53];

                  if ([v44 isEqualToAttributedString:v45])
                  {
                    uint64_t v11 = v37;
                    if ([v35 isEqualToAttributedString:v36])
                    {

LABEL_75:
                      id v16 = v63;
                      goto LABEL_76;
                    }
                    v56 = (uint64_t (*)(uint64_t, id, id))HasAttributeDifferenceString;
                    v57 = GetShadowAttributeDifferenceString;
                    v58 = v35;
                    v59 = v36;
                    goto LABEL_70;
                  }
                  v54 = (uint64_t (*)(uint64_t, id, id))HasAttributeDifferenceString;
                  v55 = GetShadowAttributeDifferenceString;
                }
                uint64_t AttributeDifference = GetAttributeDifference(v54, v55, v44, v45);
                uint64_t v11 = v37;

                if (AttributeDifference)
                {
LABEL_72:
                  v11 |= AttributeDifference;
                  goto LABEL_75;
                }
LABEL_74:
                v11 |= 0x4400uLL;
                goto LABEL_75;
              }
              if ((v20 & 1) == 0)
              {
                id v16 = v63;
                char v18 = v65;
                uint64_t v11 = GetAttributeDifference((uint64_t (*)(uint64_t, id, id))HasAttributeDifferenceDefaults, GetShadowAttributeDifferenceDefaults, v63, v65) | v37;
                goto LABEL_77;
              }
              uint64_t v11 = v37;
            }
            else
            {
              uint64_t v11 = v37 | 0x800;
            }
            id v16 = v63;
            char v18 = v65;
          }
LABEL_77:

          goto LABEL_78;
        }
      }
      int v20 = 1;
      goto LABEL_35;
    }
    int64_t v15 = 4;
  }
  else
  {
    int64_t v15 = 2;
  }
LABEL_79:

  return v15;
}

- (int64_t)length
{
  return 0;
}

- (BOOL)isAttributed
{
  return 0;
}

- (id)defaultAttributes
{
  return self->_defaultAttributes;
}

- (BOOL)isWidthVariant
{
  return 0;
}

- (id)string
{
  return 0;
}

- (id)labelViewTextAttachments
{
  return 0;
}

- (id)contentByAddingAttribute:(id)a3 toDefaultAttributesWithValue:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSDictionary *)self->_defaultAttributes objectForKeyedSubscript:v6];
  id v9 = v7;
  BOOL v10 = v9;
  if (v8 == v9)
  {

    goto LABEL_7;
  }
  if (v9 && v8)
  {
    int v11 = [v8 isEqual:v9];

    if (!v11) {
      goto LABEL_9;
    }
LABEL_7:
    v12 = self;
    goto LABEL_10;
  }

LABEL_9:
  id v15 = v6;
  v16[0] = v10;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v12 = [(_UILabelContent *)self contentByAddingAttributesToDefaultAttributes:v13];

LABEL_10:
  return v12;
}

- (BOOL)_isContentEqualToContent:(id)a3
{
  id v4 = a3;
  v5 = (void *)v4[1];
  id v6 = self->_defaultAttributes;
  id v7 = v5;
  id v8 = v7;
  if (v6 == v7)
  {
    char v10 = 1;
  }
  else
  {
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9) {
      char v10 = 0;
    }
    else {
      char v10 = [(NSDictionary *)v6 isEqual:v7];
    }
  }

  return v10;
}

- (BOOL)isAttribute:(id)a3 uniformlyEqualToValue:(id)a4
{
  id v6 = a4;
  id v7 = [(_UILabelContent *)self defaultValueForAttribute:a3];
  id v8 = v6;
  BOOL v9 = v8;
  if (v7 == v8)
  {
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
    if (v8 && v7) {
      char v10 = [v7 isEqual:v8];
    }
  }

  return v10;
}

- (_UILabelContent)contentWithString:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_UILabelStringContent alloc] initWithString:v4 defaultAttributes:self->_defaultAttributes];
  }
  else
  {
    v5 = self;
  }
  return (_UILabelContent *)v5;
}

- (id)contentByAddingAttributesToDefaultAttributes:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_12;
  }
  if (![(NSDictionary *)self->_defaultAttributes count])
  {
    int v11 = [(_UILabelContent *)self contentWithDefaultAttributes:v4];
LABEL_13:
    v12 = v11;
    goto LABEL_14;
  }
  if (![v4 count])
  {
LABEL_12:
    int v11 = self;
    goto LABEL_13;
  }
  v5 = (void *)[(NSDictionary *)self->_defaultAttributes mutableCopy];
  [v5 addEntriesFromDictionary:v4];
  defaultAttributes = self->_defaultAttributes;
  id v7 = v5;
  id v8 = defaultAttributes;
  if (v7 == v8)
  {

LABEL_11:
    goto LABEL_12;
  }
  BOOL v9 = v8;
  if (v7 && v8)
  {
    int v10 = [(NSDictionary *)v7 isEqual:v8];

    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_11;
  }

LABEL_18:
  v12 = (_UILabelContent *)[(_UILabelContent *)self copy];
  uint64_t v14 = [(NSDictionary *)v7 copy];
  id v15 = v12->_defaultAttributes;
  v12->_defaultAttributes = (NSDictionary *)v14;

LABEL_14:
  return v12;
}

- (_UILabelContent)initWithDefaultAttributes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UILabelContent;
  v5 = [(_UILabelContent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    defaultAttributes = v5->_defaultAttributes;
    v5->_defaultAttributes = (NSDictionary *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_UILabelContent alloc];
  defaultAttributes = self->_defaultAttributes;
  return [(_UILabelContent *)v4 initWithDefaultAttributes:defaultAttributes];
}

- (id)attributedString
{
  return 0;
}

- (_UILabelContent)contentWithDefaultAttributes:(id)a3
{
  id v4 = a3;
  defaultAttributes = self->_defaultAttributes;
  uint64_t v6 = (NSDictionary *)v4;
  id v7 = defaultAttributes;
  if (v7 == v6)
  {

    goto LABEL_7;
  }
  id v8 = v7;
  if (v6 && v7)
  {
    int v9 = [(NSDictionary *)v6 isEqual:v7];

    if (!v9) {
      goto LABEL_9;
    }
LABEL_7:
    int v10 = self;
    goto LABEL_10;
  }

LABEL_9:
  int v10 = (_UILabelContent *)[(_UILabelContent *)self copy];
  uint64_t v11 = [(NSDictionary *)v6 copy];
  v12 = v10->_defaultAttributes;
  v10->_defaultAttributes = (NSDictionary *)v11;

LABEL_10:
  return v10;
}

- (_UILabelContent)contentWithAttributedString:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_UILabelAttributedStringContent alloc] initWithAttributedString:v4 defaultAttributes:self->_defaultAttributes];
  }
  else
  {
    v5 = self;
  }
  return (_UILabelContent *)v5;
}

- (id)contentByCompletingDefaultAttributesWithAttributes:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_15;
  }
  if (![(NSDictionary *)self->_defaultAttributes count])
  {
    v13 = [(_UILabelContent *)self contentWithDefaultAttributes:v4];
LABEL_16:
    uint64_t v14 = v13;
    goto LABEL_17;
  }
  if (![v4 count])
  {
LABEL_15:
    v13 = self;
    goto LABEL_16;
  }
  v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = v5;
  if (self->_defaultAttributes) {
    defaultAttributes = self->_defaultAttributes;
  }
  else {
    defaultAttributes = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  [v5 addEntriesFromDictionary:defaultAttributes];
  id v8 = self->_defaultAttributes;
  int v9 = v6;
  int v10 = v8;
  if (v9 == v10)
  {

LABEL_14:
    goto LABEL_15;
  }
  uint64_t v11 = v10;
  if (v9 && v10)
  {
    int v12 = [(NSDictionary *)v9 isEqual:v10];

    if (!v12) {
      goto LABEL_21;
    }
    goto LABEL_14;
  }

LABEL_21:
  uint64_t v14 = (_UILabelContent *)[(_UILabelContent *)self copy];
  uint64_t v16 = [(NSDictionary *)v9 copy];
  id v17 = v14->_defaultAttributes;
  v14->_defaultAttributes = (NSDictionary *)v16;

LABEL_17:
  return v14;
}

- (BOOL)isEqualToString:(id)a3
{
  return a3 == 0;
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  return a3 == 0;
}

- (BOOL)isEqualToContent:(id)a3 byAttribute:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UILabelContent *)self defaultValueForAttribute:v6];
  int v9 = [v7 defaultValueForAttribute:v6];

  id v10 = v8;
  id v11 = v9;
  int v12 = v11;
  if (v10 == v11)
  {
    char v13 = 1;
  }
  else
  {
    char v13 = 0;
    if (v10 && v11) {
      char v13 = [v10 isEqual:v11];
    }
  }

  return v13;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_defaultAttributes hash];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    id v11 = [NSString stringWithFormat:@"<%@:%p (empty) attr=%@>", objc_opt_class(), self, self->_defaultAttributes];
  }
  else
  {
    id v4 = [(_UILabelContent *)self string];
    if ((unint64_t)[v4 length] >= 0x21)
    {
      v5 = objc_msgSend(v4, "substringWithRange:", 0, 32);
      uint64_t v6 = [v5 stringByAppendingString:@"..."];

      id v4 = (void *)v6;
    }
    id v7 = NSString;
    uint64_t v8 = objc_opt_class();
    if ([(_UILabelContent *)self isAttributed]) {
      int v9 = @"(attributed string) ";
    }
    else {
      int v9 = @"(string) ";
    }
    if ([(_UILabelContent *)self isWidthVariant]) {
      id v10 = @"variant ";
    }
    else {
      id v10 = &stru_1ED0E84C0;
    }
    id v11 = [v7 stringWithFormat:@"<%@:%p %@%@len=%ld %@ attr=%@>", v8, self, v9, v10, -[_UILabelContent length](self, "length"), v4, self->_defaultAttributes];
  }
  return v11;
}

- (id)intelligenceLightAttributedStrings
{
  return 0;
}

- (id)textColor
{
  return [(_UILabelContent *)self defaultValueForAttribute:*(void *)off_1E52D2048];
}

- (id)backgroundColor
{
  return [(_UILabelContent *)self defaultValueForAttribute:*(void *)off_1E52D1F58];
}

@end