@interface _UITextAttributeDefaults
+ (_UITextAttributeDefaultCategories)_unspecifiedDefaults;
+ (id)_defaultsForUserInterfaceIdiom:(int64_t)a3;
+ (void)_getFontSizesForUserInterfaceIdiom:(int64_t)a3 labelFontSize:(double *)a4 buttonFontSize:(double *)a5 systemFontSize:(double *)a6 smallSystemFontSize:(double *)a7;
- (BOOL)isEqual:(id)a3;
- (NSParagraphStyle)_paragraphStyle;
- (NSShadow)_shadow;
- (NSString)description;
- (UIColor)_textColor;
- (UIFont)_font;
- (_UITextAttributeDictionary)_attributes;
- (id)_init;
- (id)_initWithFallback:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_setFont:(id)a3;
- (void)_setParagraphStyle:(id)a3;
- (void)_setShadow:(id)a3;
- (void)_setTextColor:(id)a3;
@end

@implementation _UITextAttributeDefaults

+ (_UITextAttributeDefaultCategories)_unspecifiedDefaults
{
  if (qword_1EB25F460 != -1) {
    dispatch_once(&qword_1EB25F460, &__block_literal_global_120);
  }
  v2 = (void *)qword_1EB25F458;
  return (_UITextAttributeDefaultCategories *)v2;
}

- (UIColor)_textColor
{
  return (UIColor *)[(_UIMutableTextAttributeDictionary *)self->_attributes objectForKeyedSubscript:*(void *)off_1E52D2048];
}

- (UIFont)_font
{
  return (UIFont *)[(_UIMutableTextAttributeDictionary *)self->_attributes objectForKeyedSubscript:*(void *)off_1E52D2040];
}

- (_UITextAttributeDictionary)_attributes
{
  v2 = (void *)[(_UIMutableTextAttributeDictionary *)self->_attributes copy];
  return (_UITextAttributeDictionary *)v2;
}

- (void)_setShadow:(id)a3
{
}

- (id)_initWithFallback:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UITextAttributeDefaults;
  v5 = [(_UITextAttributeDefaults *)&v10 init];
  if (v5)
  {
    v6 = [v4 _attributes];
    uint64_t v7 = [v6 mutableCopy];
    attributes = v5->_attributes;
    v5->_attributes = (_UIMutableTextAttributeDictionary *)v7;
  }
  return v5;
}

- (void)_setTextColor:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UITextAttributeDefaults.m", 222, @"Invalid parameter not satisfying: %@", @"textColor" object file lineNumber description];

    id v5 = 0;
  }
  [(_UIMutableTextAttributeDictionary *)self->_attributes setObject:v5 forKeyedSubscript:*(void *)off_1E52D2048];
}

- (void)_setParagraphStyle:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UITextAttributeDefaults.m", 244, @"Invalid parameter not satisfying: %@", @"paragraphStyle" object file lineNumber description];

    id v5 = 0;
  }
  [(_UIMutableTextAttributeDictionary *)self->_attributes setObject:v5 forKeyedSubscript:*(void *)off_1E52D21B8];
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)_UITextAttributeDefaults;
  v2 = [(_UITextAttributeDefaults *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    attributes = v2->_attributes;
    v2->_attributes = (_UIMutableTextAttributeDictionary *)v3;
  }
  return v2;
}

+ (void)_getFontSizesForUserInterfaceIdiom:(int64_t)a3 labelFontSize:(double *)a4 buttonFontSize:(double *)a5 systemFontSize:(double *)a6 smallSystemFontSize:(double *)a7
{
  double v7 = 17.0;
  if (a3 == 5) {
    double v7 = 13.0;
  }
  *a4 = v7;
  double v8 = 18.0;
  if (a3 == 5) {
    double v8 = 14.0;
  }
  *a5 = v8;
  double v9 = 10.0;
  if (a3 != 5) {
    double v9 = 14.0;
  }
  *a6 = v9;
  double v10 = 12.0;
  if (a3 == 5) {
    double v10 = 9.0;
  }
  *a7 = v10;
}

- (void)_setFont:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UITextAttributeDefaults.m", 233, @"Invalid parameter not satisfying: %@", @"font" object file lineNumber description];

    id v5 = 0;
  }
  [(_UIMutableTextAttributeDictionary *)self->_attributes setObject:v5 forKeyedSubscript:*(void *)off_1E52D2040];
}

+ (id)_defaultsForUserInterfaceIdiom:(int64_t)a3
{
  uint64_t v3 = [[_UITextAttributeDefaultCategories alloc] initWithUserInterfaceIdiom:a3];
  return v3;
}

- (NSParagraphStyle)_paragraphStyle
{
  return (NSParagraphStyle *)[(_UIMutableTextAttributeDictionary *)self->_attributes objectForKeyedSubscript:*(void *)off_1E52D21B8];
}

- (NSShadow)_shadow
{
  return (NSShadow *)[(_UIMutableTextAttributeDictionary *)self->_attributes objectForKeyedSubscript:*(void *)off_1E52D2238];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  uint64_t v5 = [(_UIMutableTextAttributeDictionary *)self->_attributes mutableCopy];
  objc_super v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSString)description
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"attributes";
  uint64_t v3 = [(_UITextAttributeDefaults *)self _attributes];
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = +[UIDescriptionBuilder descriptionForObject:self namesAndObjects:v4];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UITextAttributeDefaults *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if (v4 == self)
  {
    char v11 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    attributes = self->_attributes;
    id v7 = [(_UITextAttributeDefaults *)v5 _attributes];
    double v8 = attributes;
    double v9 = v7;
    double v10 = v9;
    if (v8 == v9)
    {
      char v11 = 1;
    }
    else
    {
      char v11 = 0;
      if (v8 && v9) {
        char v11 = [(_UIMutableTextAttributeDictionary *)v8 isEqual:v9];
      }
    }
  }
  else
  {
LABEL_8:
    char v11 = 0;
  }
LABEL_12:

  return v11;
}

- (unint64_t)hash
{
  return [(_UIMutableTextAttributeDictionary *)self->_attributes hash];
}

- (void).cxx_destruct
{
}

@end