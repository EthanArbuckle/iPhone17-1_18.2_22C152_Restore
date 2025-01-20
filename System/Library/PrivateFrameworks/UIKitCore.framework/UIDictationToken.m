@interface UIDictationToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)removeSpaceAfter;
- (BOOL)removeSpaceBefore;
- (NSString)text;
- (UIDictationToken)initWithCoder:(id)a3;
- (UIDictationToken)initWithText:(id)a3 removeSpaceBefore:(BOOL)a4 removeSpaceAfter:(BOOL)a5;
- (id)_descriptionExtra;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setRemoveSpaceBefore:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation UIDictationToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationToken)initWithText:(id)a3 removeSpaceBefore:(BOOL)a4 removeSpaceAfter:(BOOL)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIDictationToken;
  v10 = [(UIDictationToken *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_text, a3);
    v11->_removeSpaceBefore = a4;
    v11->_removeSpaceAfter = a5;
    v12 = v11;
  }

  return v11;
}

- (UIDictationToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationToken;
  v5 = [(UIDictationToken *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_removeSpaceBefore = [v4 decodeBoolForKey:@"removeSpaceBefore"];
    v5->_removeSpaceAfter = [v4 decodeBoolForKey:@"removeSpaceAfter"];
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  [v5 encodeBool:self->_removeSpaceBefore forKey:@"removeSpaceBefore"];
  [v5 encodeBool:self->_removeSpaceAfter forKey:@"removeSpaceAfter"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    text = self->_text;
    uint64_t v6 = [v4 text];
    if ([(NSString *)text isEqualToString:v6]
      && (int removeSpaceBefore = self->_removeSpaceBefore,
          removeSpaceBefore == [v4 removeSpaceBefore]))
    {
      int removeSpaceAfter = self->_removeSpaceAfter;
      BOOL v9 = removeSpaceAfter == [v4 removeSpaceAfter];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  text = self->_text;
  if (self->_removeSpaceBefore) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  if (self->_removeSpaceAfter) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  BOOL v9 = [(UIDictationToken *)self _descriptionExtra];
  objc_super v10 = [v3 stringWithFormat:@"<%@ token=\"%@\", removeSpaceBefore/After=%s/%s%@>", v5, text, v7, v8, v9];

  return v10;
}

- (id)_descriptionExtra
{
  return &stru_1ED0E84C0;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (BOOL)removeSpaceBefore
{
  return self->_removeSpaceBefore;
}

- (void)setRemoveSpaceBefore:(BOOL)a3
{
  self->_int removeSpaceBefore = a3;
}

- (BOOL)removeSpaceAfter
{
  return self->_removeSpaceAfter;
}

- (void).cxx_destruct
{
}

@end