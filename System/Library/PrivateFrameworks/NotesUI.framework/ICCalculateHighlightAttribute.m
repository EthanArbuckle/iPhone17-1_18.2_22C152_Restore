@interface ICCalculateHighlightAttribute
- (BOOL)isEqual:(id)a3;
- (ICCalculateHighlightAttribute)init;
- (NSArray)errors;
- (NSArray)suggestions;
- (NSString)tooltip;
- (UIColor)color;
- (UIColor)underlineColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)underlineStyle;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setErrors:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation ICCalculateHighlightAttribute

- (ICCalculateHighlightAttribute)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICCalculateHighlightAttribute;
  v2 = [(ICCalculateHighlightAttribute *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_type = 0;
    uint64_t v4 = [MEMORY[0x1E4F1C978] array];
    errors = v3->_errors;
    v3->_errors = (NSArray *)v4;
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(ICCalculateHighlightAttribute *)self type];
  objc_super v7 = @"None";
  if (v6 == 1) {
    objc_super v7 = @"Variable";
  }
  if (v6 == 2) {
    objc_super v7 = @"Result";
  }
  v8 = v7;
  v9 = [(ICCalculateHighlightAttribute *)self errors];
  v10 = [v3 stringWithFormat:@"<%@: %p, type: %@, errors: %@>", v5, self, v8, v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();

  uint64_t v6 = [v5 type];
  if (v6 == [(ICCalculateHighlightAttribute *)self type])
  {
    objc_super v7 = [v5 errors];
    v8 = [(ICCalculateHighlightAttribute *)self errors];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ICCalculateHighlightAttribute type](self, "type"));
  uint64_t v4 = [v3 hash];
  id v5 = [(ICCalculateHighlightAttribute *)self errors];
  uint64_t v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  uint64_t v8 = [v7 hash];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v8 = ICHashWithObject(*(void **)(*((void *)&v23 + 1) + 8 * i)) - v8 + 32 * v8;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  unint64_t v21 = ICHashWithHashKeys(v4, v14, v15, v16, v17, v18, v19, v20, v8);
  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[ICCalculateHighlightAttribute allocWithZone:a3] init];
  [(ICCalculateHighlightAttribute *)v4 setType:[(ICCalculateHighlightAttribute *)self type]];
  id v5 = [(ICCalculateHighlightAttribute *)self errors];
  uint64_t v6 = (void *)[v5 copy];
  [(ICCalculateHighlightAttribute *)v4 setErrors:v6];

  return v4;
}

- (UIColor)color
{
  if ([(ICCalculateHighlightAttribute *)self type] == 1)
  {
    v2 = [MEMORY[0x1E4FB1618] ICControlAccentColor];
  }
  else
  {
    v2 = 0;
  }
  return (UIColor *)v2;
}

- (int64_t)underlineStyle
{
  if (ICInternalSettingsIsMathDebugHighlightingEnabled()) {
    return 2;
  }
  else {
    return 0;
  }
}

- (UIColor)underlineColor
{
  if (ICInternalSettingsIsMathDebugHighlightingEnabled())
  {
    v3 = [(ICCalculateHighlightAttribute *)self errors];
    if ([v3 count]) {
      [MEMORY[0x1E4FB1618] systemRedColor];
    }
    else {
    uint64_t v4 = [MEMORY[0x1E4FB1618] systemGreenColor];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (UIColor *)v4;
}

- (NSString)tooltip
{
  v3 = [(ICCalculateHighlightAttribute *)self errors];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(ICCalculateHighlightAttribute *)self errors];
    uint64_t v6 = objc_msgSend(v5, "ic_map:", &__block_literal_global_67);
    objc_super v7 = [v6 componentsJoinedByString:@", "];
  }
  else
  {
    objc_super v7 = 0;
  }
  return (NSString *)v7;
}

uint64_t __40__ICCalculateHighlightAttribute_tooltip__block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizedDescription];
}

- (NSArray)suggestions
{
  v2 = [(ICCalculateHighlightAttribute *)self errors];
  v3 = objc_msgSend(v2, "ic_flatMap:", &__block_literal_global_20);

  return (NSArray *)v3;
}

id __44__ICCalculateHighlightAttribute_suggestions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  v3 = [v2 userInfo];

  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F568A0]];
  id v5 = ICDynamicCast();
  uint64_t v6 = v5;
  if (!v5) {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v5;

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end