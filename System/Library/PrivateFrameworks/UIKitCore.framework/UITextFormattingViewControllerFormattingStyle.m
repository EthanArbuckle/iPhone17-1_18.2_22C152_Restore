@interface UITextFormattingViewControllerFormattingStyle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)attributes;
- (NSString)styleKey;
- (NSString)title;
- (UITextFormattingViewControllerFormattingStyle)initWithCoder:(id)a3;
- (UITextFormattingViewControllerFormattingStyle)initWithStyleKey:(id)a3 title:(id)a4 attributes:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UITextFormattingViewControllerFormattingStyle

- (UITextFormattingViewControllerFormattingStyle)initWithStyleKey:(id)a3 title:(id)a4 attributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UITextFormattingViewControllerFormattingStyle;
  v11 = [(UITextFormattingViewControllerFormattingStyle *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    styleKey = v11->_styleKey;
    v11->_styleKey = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    title = v11->_title;
    v11->_title = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    attributes = v11->_attributes;
    v11->_attributes = (NSDictionary *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(UITextFormattingViewControllerFormattingStyle *)self styleKey];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  id v8 = [(UITextFormattingViewControllerFormattingStyle *)self title];
  uint64_t v9 = [v8 copy];
  id v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = [(UITextFormattingViewControllerFormattingStyle *)self attributes];
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[3];
  v4[3] = v12;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UITextFormattingViewControllerFormattingStyle *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(UITextFormattingViewControllerFormattingStyle *)self styleKey];
      v7 = [(UITextFormattingViewControllerFormattingStyle *)v5 styleKey];
      if ([v6 isEqualToString:v7])
      {
        id v8 = [(UITextFormattingViewControllerFormattingStyle *)self title];
        uint64_t v9 = [(UITextFormattingViewControllerFormattingStyle *)v5 title];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(UITextFormattingViewControllerFormattingStyle *)self styleKey];
  uint64_t v4 = [v3 hash];
  v5 = [(UITextFormattingViewControllerFormattingStyle *)self title];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(UITextFormattingViewControllerFormattingStyle *)self styleKey];
  [v4 encodeObject:v5 forKey:@"_StyleKey"];

  unint64_t v6 = [(UITextFormattingViewControllerFormattingStyle *)self title];
  [v4 encodeObject:v6 forKey:@"_Title"];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  id v8 = [(UITextFormattingViewControllerFormattingStyle *)self attributes];
  [v7 encodeObject:v8 forKey:@"_AttributesData"];

  [v7 finishEncoding];
  uint64_t v9 = [v7 encodedData];
  if (!v9) {
    uint64_t v9 = objc_opt_new();
  }
  [v4 encodeObject:v9 forKey:@"_AttributesData"];
}

- (UITextFormattingViewControllerFormattingStyle)initWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(UITextFormattingViewControllerFormattingStyle *)self init];
  if (v5)
  {
    unint64_t v6 = _UITextFormattingViewControllerFormattingStyleClasses();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"_StyleKey"];
    styleKey = v5->_styleKey;
    v5->_styleKey = (NSString *)v7;

    uint64_t v9 = _UITextFormattingViewControllerFormattingStyleClasses();
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_Title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    attributes = v5->_attributes;
    v13 = (void *)MEMORY[0x1E4F1CC08];
    v5->_attributes = (NSDictionary *)MEMORY[0x1E4F1CC08];

    uint64_t v14 = _UITextFormattingViewControllerFormattingStyleClasses();
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_AttributesData"];

    id v24 = 0;
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v15 error:&v24];
    id v17 = v24;
    v18 = v17;
    if (v16)
    {
      uint64_t v19 = [v16 decodeObjectOfClass:objc_opt_class() forKey:@"_AttributesData"];
      v20 = (void *)v19;
      if (v19) {
        v21 = (void *)v19;
      }
      else {
        v21 = v13;
      }
      objc_storeStrong((id *)&v5->_attributes, v21);
      if (!v18) {
        goto LABEL_11;
      }
    }
    else
    {
      v20 = 0;
      if (!v17)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("TextFormattingUI", &initWithCoder____s_category_0) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v18;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "Failed to create unarchiver for formatting style attributes: %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (NSString)styleKey
{
  return self->_styleKey;
}

- (NSString)title
{
  return self->_title;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_styleKey, 0);
}

@end