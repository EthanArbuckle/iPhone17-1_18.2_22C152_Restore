@interface RTIStyledIntermediateText
+ (BOOL)supportsSecureCoding;
+ (id)_attributedStringAllowedClasses;
+ (id)intermediateTextWithInputString:(id)a3 displayString:(id)a4;
+ (id)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5;
+ (id)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSAttributedString)displayString;
- (NSString)inputString;
- (NSString)searchString;
- (RTIStyledIntermediateText)initWithCoder:(id)a3;
- (RTIStyledIntermediateText)initWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6;
- (_NSRange)selectedRange;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)cursorVisibility;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)selectedRange;
- (void)setCursorVisibility:(int64_t)a3;
@end

@implementation RTIStyledIntermediateText

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)intermediateTextWithInputString:(id)a3 displayString:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputString:v6 displayString:v5 selectionLocation:0x7FFFFFFFFFFFFFFFLL searchString:0];

  return v7;
}

+ (id)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputString:v8 displayString:v7 selectionLocation:a5 searchString:0];

  return v9;
}

+ (id)intermediateTextWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInputString:v11 displayString:v10 selectionLocation:a5 searchString:v9];

  return v12;
}

- (RTIStyledIntermediateText)initWithInputString:(id)a3 displayString:(id)a4 selectionLocation:(unint64_t)a5 searchString:(id)a6
{
  v25[6] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)RTIStyledIntermediateText;
  v13 = [(RTIStyledIntermediateText *)&v24 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    inputString = v13->_inputString;
    v13->_inputString = (NSString *)v14;

    v25[0] = @"NSUnderline";
    v25[1] = @"NSUnderlineColor";
    v25[2] = @"NSMarkedClauseSegment";
    v25[3] = @"NSColor";
    v25[4] = @"NSBackgroundColor";
    v25[5] = @"NSTextAnimation";
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:6];
    uint64_t v17 = +[RTIUtilities _codableAttributedString:v11 validAttributes:v16];
    displayString = v13->_displayString;
    v13->_displayString = (NSAttributedString *)v17;

    unint64_t v19 = [(NSAttributedString *)v13->_displayString length];
    unint64_t v20 = v19 - a5;
    if (v19 < a5) {
      unint64_t v20 = 0;
    }
    v13->_selectionOffset = v20;
    uint64_t v21 = [v12 copy];
    searchString = v13->_searchString;
    v13->_searchString = (NSString *)v21;
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_inputString copyWithZone:a3];
    id v7 = (void *)v5[2];
    v5[2] = v6;

    uint64_t v8 = [(NSAttributedString *)self->_displayString copyWithZone:a3];
    id v9 = (void *)v5[3];
    v5[3] = v8;

    v5[1] = self->_selectionOffset;
    uint64_t v10 = [(NSString *)self->_searchString copyWithZone:a3];
    id v11 = (void *)v5[4];
    v5[4] = v10;

    v5[5] = self->_cursorVisibility;
  }
  return v5;
}

+ (id)_attributedStringAllowedClasses
{
  if (_attributedStringAllowedClasses_onceToken != -1) {
    dispatch_once(&_attributedStringAllowedClasses_onceToken, &__block_literal_global);
  }
  v2 = (void *)_attributedStringAllowedClasses_allowedClasses;
  return v2;
}

void __60__RTIStyledIntermediateText__attributedStringAllowedClasses__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_attributedStringAllowedClasses_allowedClasses;
  _attributedStringAllowedClasses_allowedClasses = v2;
}

- (RTIStyledIntermediateText)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v17.receiver = self;
  v17.super_class = (Class)RTIStyledIntermediateText;
  id v5 = [(RTIStyledIntermediateText *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputString"];
    uint64_t v7 = [v6 copy];
    inputString = v5->_inputString;
    v5->_inputString = (NSString *)v7;

    id v9 = [(id)objc_opt_class() _attributedStringAllowedClasses];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"styledDisplayString"];
    uint64_t v11 = [v10 copy];
    displayString = v5->_displayString;
    v5->_displayString = (NSAttributedString *)v11;

    v5->_selectionOffset = [v4 decodeIntegerForKey:@"selectionOffset"];
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchString"];
    uint64_t v14 = [v13 copy];
    searchString = v5->_searchString;
    v5->_searchString = (NSString *)v14;

    if ([v4 containsValueForKey:@"cursorVisibility"]) {
      v5->_cursorVisibility = [v4 decodeIntegerForKey:@"cursorVisibility"];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  if (([v10 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  inputString = self->_inputString;
  if (inputString) {
    [v10 encodeObject:inputString forKey:@"inputString"];
  }
  displayString = self->_displayString;
  uint64_t v6 = v10;
  if (displayString)
  {
    [v10 encodeObject:displayString forKey:@"styledDisplayString"];
    uint64_t v6 = v10;
  }
  unint64_t selectionOffset = self->_selectionOffset;
  if (selectionOffset)
  {
    [v10 encodeInteger:selectionOffset forKey:@"selectionOffset"];
    uint64_t v6 = v10;
  }
  searchString = self->_searchString;
  if (searchString)
  {
    [v10 encodeObject:searchString forKey:@"searchString"];
    uint64_t v6 = v10;
  }
  int64_t cursorVisibility = self->_cursorVisibility;
  if (cursorVisibility)
  {
    [v10 encodeInteger:cursorVisibility forKey:@"cursorVisibility"];
    uint64_t v6 = v10;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(RTIStyledIntermediateText *)self inputString];
    uint64_t v7 = [v5 inputString];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      id v9 = [(RTIStyledIntermediateText *)self inputString];
      id v10 = [v5 inputString];
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [(RTIStyledIntermediateText *)self displayString];
    uint64_t v14 = [v5 displayString];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(RTIStyledIntermediateText *)self displayString];
      objc_super v17 = [v5 displayString];
      int v18 = [v16 isEqualToAttributedString:v17];

      if (!v18) {
        goto LABEL_13;
      }
    }
    unint64_t v19 = [(RTIStyledIntermediateText *)self searchString];
    uint64_t v20 = [v5 searchString];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      uint64_t v21 = (void *)v20;
      v22 = [(RTIStyledIntermediateText *)self searchString];
      v23 = [v5 searchString];
      int v24 = [v22 isEqualToString:v23];

      if (!v24)
      {
LABEL_13:
        BOOL v12 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    uint64_t v25 = [(RTIStyledIntermediateText *)self selectedRange];
    uint64_t v27 = v26;
    BOOL v12 = 0;
    if (v25 == [v5 selectedRange] && v27 == v28)
    {
      int64_t v29 = [(RTIStyledIntermediateText *)self cursorVisibility];
      BOOL v12 = v29 == [v5 cursorVisibility];
    }
    goto LABEL_18;
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(RTIStyledIntermediateText *)self inputString];
  uint64_t v4 = [v3 hash];

  id v5 = [(RTIStyledIntermediateText *)self displayString];
  uint64_t v6 = [v5 hash] + 257 * v4;

  uint64_t v7 = [(RTIStyledIntermediateText *)self searchString];
  uint64_t v8 = [v7 hash] + 257 * v6;

  unint64_t v9 = [(RTIStyledIntermediateText *)self selectedRange] + 257 * v8;
  if ([(RTIStyledIntermediateText *)self cursorVisibility]) {
    return [(RTIStyledIntermediateText *)self cursorVisibility] + 257 * v9;
  }
  return v9;
}

- (_NSRange)selectedRange
{
  unint64_t selectionOffset = self->_selectionOffset;
  if (selectionOffset > [(NSAttributedString *)self->_displayString length]) {
    -[RTIStyledIntermediateText selectedRange]();
  }
  NSUInteger v4 = [(NSAttributedString *)self->_displayString length] - self->_selectionOffset;
  NSUInteger v5 = 0;
  result.length = v5;
  result.location = v4;
  return result;
}

- (NSString)inputString
{
  return self->_inputString;
}

- (NSAttributedString)displayString
{
  return self->_displayString;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (int64_t)cursorVisibility
{
  return self->_cursorVisibility;
}

- (void)setCursorVisibility:(int64_t)a3
{
  self->_int64_t cursorVisibility = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
}

- (void)selectedRange
{
  __assert_rtn("-[RTIStyledIntermediateText selectedRange]", "RTIStyledIntermediateText.m", 157, "_selectionOffset <= [_displayString length]");
}

@end