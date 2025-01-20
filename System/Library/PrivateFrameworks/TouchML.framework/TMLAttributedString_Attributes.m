@interface TMLAttributedString_Attributes
- (BOOL)accessibilitySpeechPunctuation;
- (NSDictionary)attributes;
- (NSNumber)accessibilitySpeechPitch;
- (NSNumber)accessibilitySpeechQueueAnnouncement;
- (NSNumber)accessibilityTextHeadingLevel;
- (NSNumber)kern;
- (NSParagraphStyle)paragraphStyle;
- (NSShadow)shadow;
- (NSString)accessibilitySpeechIPANotation;
- (NSString)accessibilitySpeechLanguage;
- (NSString)textEffect;
- (NSTextAttachment)attachment;
- (TMLAttributedString_Attributes)init;
- (TMLAttributedString_Attributes)initWithDictionary:(id)a3;
- (UIColor)backgroundColor;
- (UIColor)foregroundColor;
- (UIColor)strokeColor;
- (UIColor)underlineColor;
- (UIFont)font;
- (_NSRange)range;
- (double)baselineOffset;
- (double)expansion;
- (double)obliqueness;
- (double)strokeWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)link;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)ligature;
- (int64_t)strikethroughStyle;
- (int64_t)superscript;
- (int64_t)underlineStyle;
- (int64_t)verticalGlyphForm;
- (void)setAXAttribute:(id)a3 value:(id)a4;
- (void)setAccessibilitySpeechIPANotation:(id)a3;
- (void)setAccessibilitySpeechLanguage:(id)a3;
- (void)setAccessibilitySpeechPitch:(id)a3;
- (void)setAccessibilitySpeechPunctuation:(BOOL)a3;
- (void)setAccessibilitySpeechQueueAnnouncement:(id)a3;
- (void)setAccessibilityTextHeadingLevel:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setAttribute:(id)a3 value:(id)a4;
- (void)setAttributes:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBaselineOffset:(double)a3;
- (void)setExpansion:(double)a3;
- (void)setFont:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setKern:(id)a3;
- (void)setLigature:(int64_t)a3;
- (void)setLink:(id)a3;
- (void)setObliqueness:(double)a3;
- (void)setParagraphStyle:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setShadow:(id)a3;
- (void)setStrikethroughStyle:(int64_t)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeWidth:(double)a3;
- (void)setSuperscript:(int64_t)a3;
- (void)setTextEffect:(id)a3;
- (void)setUnderlineColor:(id)a3;
- (void)setUnderlineStyle:(int64_t)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setVerticalGlyphForm:(int64_t)a3;
- (void)tmlObjectCompleted;
@end

@implementation TMLAttributedString_Attributes

- (TMLAttributedString_Attributes)init
{
  return (TMLAttributedString_Attributes *)((uint64_t (*)(TMLAttributedString_Attributes *, char *))MEMORY[0x270F9A6D0])(self, sel_initWithDictionary_);
}

- (TMLAttributedString_Attributes)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TMLAttributedString_Attributes;
  v6 = [(TMLAttributedString_Attributes *)&v14 init];
  if (v6)
  {
    if (v4)
    {
      uint64_t v8 = objc_msgSend_mutableCopy(v4, v5, v7);
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x263EFF9A0]);
      uint64_t v8 = objc_msgSend_initWithCapacity_(v9, v10, v11, 16);
    }
    attributes = v6->_attributes;
    v6->_attributes = (NSMutableDictionary *)v8;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v4, v5, v6, a3);
  return (id)MEMORY[0x270F9A6D0](v7, sel_initWithDictionary_, v8);
}

- (void)tmlObjectCompleted
{
  self->_created = 1;
  objc_msgSend_tmlParent(self, a2, v2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addAttributes_range_(v6, v4, v5, self->_attributes, self->_range.location, self->_range.length);
}

- (void)setAttribute:(id)a3 value:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  objc_msgSend_setObject_forKeyedSubscript_(self->_attributes, v7, v8, v6, v14);
  if (self->_created)
  {
    double v11 = objc_msgSend_tmlParent(self, v9, v10);
    objc_msgSend_addAttribute_value_range_(v11, v12, v13, v14, v6, self->_range.location, self->_range.length);
  }
}

- (void)setAXAttribute:(id)a3 value:(id)a4
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_attributes, a2, v4, a4, a3);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  objc_msgSend_setAttribute_value_(self, a2, v4, a4, a3);
}

- (id)valueForUndefinedKey:(id)a3
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v3, a3);
}

- (UIFont)font
{
  return (UIFont *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F814F0]);
}

- (void)setFont:(id)a3
{
  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x263F814F0], a3);
}

- (NSParagraphStyle)paragraphStyle
{
  return (NSParagraphStyle *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81540]);
}

- (void)setParagraphStyle:(id)a3
{
  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x263F81540], a3);
}

- (UIColor)foregroundColor
{
  return (UIColor *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81500]);
}

- (void)setForegroundColor:(id)a3
{
  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x263F81500], a3);
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F814A8]);
}

- (void)setBackgroundColor:(id)a3
{
  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x263F814A8], a3);
}

- (int64_t)ligature
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81518]);
  int64_t v6 = objc_msgSend_integerValue(v3, v4, v5);

  return v6;
}

- (void)setLigature:(int64_t)a3
{
  uint64_t v5 = *MEMORY[0x263F81518];
  objc_msgSend_numberWithInteger_(NSNumber, a2, v3, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v6, v7, v5, v8);
}

- (NSNumber)kern
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81510]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v4 = v3;
  }
  else {
    double v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)setKern:(id)a3
{
  uint64_t v5 = *MEMORY[0x263F81510];
  if (a3)
  {
    uint64_t v7 = *MEMORY[0x263F81510];
    objc_msgSend_setAttribute_value_(self, a2, v3, v7, a3);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], a2, v3);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAttribute_value_(self, v8, v9, v5, v10);
  }
}

- (int64_t)strikethroughStyle
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81570]);
  int64_t v6 = objc_msgSend_integerValue(v3, v4, v5);

  return v6;
}

- (void)setStrikethroughStyle:(int64_t)a3
{
  uint64_t v5 = *MEMORY[0x263F81570];
  objc_msgSend_numberWithInteger_(NSNumber, a2, v3, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v6, v7, v5, v8);
}

- (int64_t)underlineStyle
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F815F8]);
  int64_t v6 = objc_msgSend_integerValue(v3, v4, v5);

  return v6;
}

- (void)setUnderlineStyle:(int64_t)a3
{
  uint64_t v5 = *MEMORY[0x263F815F8];
  objc_msgSend_numberWithInteger_(NSNumber, a2, v3, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v6, v7, v5, v8);
}

- (UIColor)strokeColor
{
  return (UIColor *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81578]);
}

- (void)setStrokeColor:(id)a3
{
  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x263F81578], a3);
}

- (double)strokeWidth
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81580]);
  objc_msgSend_floatValue(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (void)setStrokeWidth:(double)a3
{
  uint64_t v4 = *MEMORY[0x263F81580];
  objc_msgSend_numberWithDouble_(NSNumber, a2, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v5, v6, v4, v7);
}

- (NSString)textEffect
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81598]);
}

- (void)setTextEffect:(id)a3
{
  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x263F81598], a3);
}

- (NSTextAttachment)attachment
{
  return (NSTextAttachment *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F814A0]);
}

- (void)setAttachment:(id)a3
{
  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x263F814A0], a3);
}

- (UIColor)underlineColor
{
  return (UIColor *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F815F0]);
}

- (void)setUnderlineColor:(id)a3
{
  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x263F815F0], a3);
}

- (double)obliqueness
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81528]);
  objc_msgSend_floatValue(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (void)setObliqueness:(double)a3
{
  uint64_t v4 = *MEMORY[0x263F81528];
  objc_msgSend_numberWithDouble_(NSNumber, a2, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v5, v6, v4, v7);
}

- (double)expansion
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F814E0]);
  objc_msgSend_floatValue(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (void)setExpansion:(double)a3
{
  uint64_t v4 = *MEMORY[0x263F814E0];
  objc_msgSend_numberWithDouble_(NSNumber, a2, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v5, v6, v4, v7);
}

- (id)link
{
  return (id)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81520]);
}

- (void)setLink:(id)a3
{
  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x263F81520], a3);
}

- (NSShadow)shadow
{
  return (NSShadow *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81560]);
}

- (void)setShadow:(id)a3
{
  objc_msgSend_setAttribute_value_(self, a2, v3, *MEMORY[0x263F81560], a3);
}

- (double)baselineOffset
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F814B8]);
  objc_msgSend_floatValue(v3, v4, v5);
  double v7 = v6;

  return v7;
}

- (void)setBaselineOffset:(double)a3
{
  uint64_t v4 = *MEMORY[0x263F814B8];
  objc_msgSend_numberWithDouble_(NSNumber, a2, a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v5, v6, v4, v7);
}

- (int64_t)superscript
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F03CC0]);
  int64_t v6 = objc_msgSend_integerValue(v3, v4, v5);

  return v6;
}

- (void)setSuperscript:(int64_t)a3
{
  uint64_t v5 = *MEMORY[0x263F03CC0];
  objc_msgSend_numberWithInteger_(NSNumber, a2, v3, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v6, v7, v5, v8);
}

- (int64_t)verticalGlyphForm
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F81600]);
  int64_t v6 = objc_msgSend_integerValue(v3, v4, v5);

  return v6;
}

- (void)setVerticalGlyphForm:(int64_t)a3
{
  uint64_t v5 = *MEMORY[0x263F81600];
  objc_msgSend_numberWithInteger_(NSNumber, a2, v3, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAttribute_value_(self, v6, v7, v5, v8);
}

- (NSNumber)accessibilitySpeechPitch
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F1CE98]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)setAccessibilitySpeechPitch:(id)a3
{
  uint64_t v5 = *MEMORY[0x263F1CE98];
  if (a3)
  {
    uint64_t v7 = *MEMORY[0x263F1CE98];
    objc_msgSend_setAXAttribute_value_(self, a2, v3, v7, a3);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], a2, v3);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAXAttribute_value_(self, v8, v9, v5, v10);
  }
}

- (BOOL)accessibilitySpeechPunctuation
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F1CEA0]);
  char v6 = objc_msgSend_BOOLValue(v3, v4, v5);

  return v6;
}

- (void)setAccessibilitySpeechPunctuation:(BOOL)a3
{
  uint64_t v5 = *MEMORY[0x263F1CEA0];
  objc_msgSend_numberWithBool_(NSNumber, a2, v3, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAXAttribute_value_(self, v6, v7, v5, v8);
}

- (NSString)accessibilitySpeechLanguage
{
  return (NSString *)objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F1CE90]);
}

- (void)setAccessibilitySpeechLanguage:(id)a3
{
  objc_msgSend_setAXAttribute_value_(self, a2, v3, *MEMORY[0x263F1CE90], a3);
}

- (NSNumber)accessibilitySpeechQueueAnnouncement
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F1CEA8]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)setAccessibilitySpeechQueueAnnouncement:(id)a3
{
  uint64_t v5 = *MEMORY[0x263F1CEA8];
  if (a3)
  {
    uint64_t v7 = *MEMORY[0x263F1CEA8];
    objc_msgSend_setAXAttribute_value_(self, a2, v3, v7, a3);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], a2, v3);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAXAttribute_value_(self, v8, v9, v5, v10);
  }
}

- (NSString)accessibilitySpeechIPANotation
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F1CE88]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)setAccessibilitySpeechIPANotation:(id)a3
{
  uint64_t v5 = *MEMORY[0x263F1CE88];
  if (a3)
  {
    uint64_t v7 = *MEMORY[0x263F1CE88];
    objc_msgSend_setAXAttribute_value_(self, a2, v3, v7, a3);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], a2, v3);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAXAttribute_value_(self, v8, v9, v5, v10);
  }
}

- (NSNumber)accessibilityTextHeadingLevel
{
  double v3 = objc_msgSend_objectForKeyedSubscript_(self->_attributes, a2, v2, *MEMORY[0x263F1CEC8]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)setAccessibilityTextHeadingLevel:(id)a3
{
  uint64_t v5 = *MEMORY[0x263F1CEC8];
  if (a3)
  {
    uint64_t v7 = *MEMORY[0x263F1CEC8];
    objc_msgSend_setAXAttribute_value_(self, a2, v3, v7, a3);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], a2, v3);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAXAttribute_value_(self, v8, v9, v5, v10);
  }
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSDictionary)attributes
{
  return &self->_attributes->super;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end