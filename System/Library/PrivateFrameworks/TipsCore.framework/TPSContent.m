@interface TPSContent
+ (BOOL)supportsSecureCoding;
- (BOOL)bodyContainsLink;
- (BOOL)isEqual:(id)a3;
- (NSArray)bodyContent;
- (NSArray)titleContent;
- (NSString)bodyText;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)title;
- (TPSAssets)assets;
- (TPSContent)initWithCoder:(id)a3;
- (TPSContent)initWithDictionary:(id)a3 metadata:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)labelStyle;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssets:(id)a3;
- (void)setBodyContainsLink:(BOOL)a3;
- (void)setBodyContent:(id)a3;
- (void)setBodyText:(id)a3;
- (void)setLabelStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleContent:(id)a3;
@end

@implementation TPSContent

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TPSContent;
  id v4 = a3;
  [(TPSSerializableObject *)&v10 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSContent labelStyle](self, "labelStyle", v10.receiver, v10.super_class), @"labelStyle");
  v5 = [(TPSContent *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(TPSContent *)self titleContent];
  [v4 encodeObject:v6 forKey:@"titleContent"];

  v7 = [(TPSContent *)self bodyText];
  [v4 encodeObject:v7 forKey:@"text"];

  v8 = [(TPSContent *)self bodyContent];
  [v4 encodeObject:v8 forKey:@"body"];

  objc_msgSend(v4, "encodeBool:forKey:", -[TPSContent bodyContainsLink](self, "bodyContainsLink"), @"bodyContainsLink");
  v9 = [(TPSContent *)self assets];
  [v4 encodeObject:v9 forKey:@"asset"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TPSContent;
  id v4 = [(TPSSerializableObject *)&v11 copyWithZone:a3];
  objc_msgSend(v4, "setLabelStyle:", -[TPSContent labelStyle](self, "labelStyle"));
  v5 = [(TPSContent *)self title];
  [v4 setTitle:v5];

  v6 = [(TPSContent *)self titleContent];
  [v4 setTitleContent:v6];

  v7 = [(TPSContent *)self bodyText];
  [v4 setBodyText:v7];

  v8 = [(TPSContent *)self bodyContent];
  [v4 setBodyContent:v8];

  objc_msgSend(v4, "setBodyContainsLink:", -[TPSContent bodyContainsLink](self, "bodyContainsLink"));
  v9 = [(TPSContent *)self assets];
  [v4 setAssets:v9];

  return v4;
}

- (TPSAssets)assets
{
  return self->_assets;
}

- (NSArray)bodyContent
{
  return self->_bodyContent;
}

- (int64_t)labelStyle
{
  return self->_labelStyle;
}

- (BOOL)bodyContainsLink
{
  return self->_bodyContainsLink;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitleContent:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setLabelStyle:(int64_t)a3
{
  self->_labelStyle = a3;
}

- (void)setBodyText:(id)a3
{
}

- (void)setBodyContent:(id)a3
{
}

- (void)setBodyContainsLink:(BOOL)a3
{
  self->_bodyContainsLink = a3;
}

- (void)setAssets:(id)a3
{
}

- (NSArray)titleContent
{
  return self->_titleContent;
}

- (TPSContent)initWithDictionary:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)TPSContent;
  v8 = [(TPSSerializableObject *)&v31 initWithDictionary:v6];
  if (!v8) {
    goto LABEL_18;
  }
  v9 = [v6 TPSSafeObjectForKey:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v10 = v9;
    title = v8->_title;
    v8->_title = v10;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    title = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [(NSString *)title TPSSafeArrayForKey:@"content"];
      titleContent = v8->_titleContent;
      v8->_titleContent = (NSArray *)v12;

      if (v8->_titleContent)
      {
        uint64_t v14 = +[TPSConstellationContentUtilities textRepresentationForContent:](TPSConstellationContentUtilities, "textRepresentationForContent:");
        v15 = v8->_title;
        v8->_title = (NSString *)v14;
      }
    }
  }

LABEL_9:
  uint64_t v16 = [v6 TPSSafeStringForKey:@"text"];
  bodyText = v8->_bodyText;
  v8->_bodyText = (NSString *)v16;

  if (v8->_bodyText)
  {
LABEL_17:
    v26 = [v6 TPSSafeStringForKey:@"labelStyle"];
    v8->_labelStyle = [v26 isEqualToString:@"white"];
    v27 = +[TPSAssets assetsFromDictionary:v6];
    v28 = [[TPSAssets alloc] initWithDictionary:v27 metadata:v7];
    assets = v8->_assets;
    v8->_assets = v28;

LABEL_18:
    v25 = v8;
    goto LABEL_19;
  }
  v18 = [v6 TPSSafeDictionaryForKey:@"body"];
  v19 = v18;
  if (!v18)
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v20 = [v18 TPSSafeArrayForKey:@"content"];
  bodyContent = v8->_bodyContent;
  v8->_bodyContent = (NSArray *)v20;

  if (v8->_bodyContent)
  {
    uint64_t v22 = +[TPSConstellationContentUtilities textRepresentationForContent:](TPSConstellationContentUtilities, "textRepresentationForContent:");
    v23 = v8->_bodyText;
    v8->_bodyText = (NSString *)v22;

    if (v8->_bodyText)
    {
      v24 = v8->_bodyContent;
      v8->_bodyContent = 0;
    }
    else
    {
      v8->_bodyContainsLink = +[TPSConstellationContentUtilities contentContainsLink:v8->_bodyContent];
    }
    goto LABEL_16;
  }

  v25 = 0;
LABEL_19:

  return v25;
}

uint64_t __25__TPSContent_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 bodyContent];
}

uint64_t __25__TPSContent_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 bodyText];
}

uint64_t __25__TPSContent_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 titleContent];
}

uint64_t __25__TPSContent_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 title];
}

uint64_t __25__TPSContent_na_identity__block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 assets];
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

id __25__TPSContent_na_identity__block_invoke()
{
  if (TPSContentLabelStyleWhiteValue_block_invoke_na_once_token_0 != -1) {
    dispatch_once(&TPSContentLabelStyleWhiteValue_block_invoke_na_once_token_0, &__block_literal_global_64);
  }
  v0 = (void *)TPSContentLabelStyleWhiteValue_block_invoke_na_once_object_0;
  return v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_bodyContent, 0);
  objc_storeStrong((id *)&self->_titleContent, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

uint64_t __25__TPSContent_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 bodyContainsLink];
  return [v2 numberWithBool:v3];
}

uint64_t __25__TPSContent_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 labelStyle];
  return [v2 numberWithInteger:v3];
}

- (TPSContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSContent;
  v5 = [(TPSSerializableObject *)&v23 initWithCoder:v4];
  if (v5)
  {
    v5->_labelStyle = [v4 decodeIntegerForKey:@"labelStyle"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"titleContent"];
    titleContent = v5->_titleContent;
    v5->_titleContent = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    bodyText = v5->_bodyText;
    v5->_bodyText = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClasses:v13 forKey:@"body"];
    bodyContent = v5->_bodyContent;
    v5->_bodyContent = (NSArray *)v18;

    v5->_bodyContainsLink = [v4 decodeBoolForKey:@"bodyContainsLink"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"asset"];
    assets = v5->_assets;
    v5->_assets = (TPSAssets *)v20;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __25__TPSContent_na_identity__block_invoke_2()
{
  uint64_t v0 = __25__TPSContent_na_identity__block_invoke_3();
  uint64_t v1 = TPSContentLabelStyleWhiteValue_block_invoke_na_once_object_0;
  TPSContentLabelStyleWhiteValue_block_invoke_na_once_object_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

id __25__TPSContent_na_identity__block_invoke_3()
{
  uint64_t v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_71];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_74];
  id v3 = (id)[v0 appendCharacteristic:&__block_literal_global_77];
  id v4 = (id)[v0 appendCharacteristic:&__block_literal_global_79];
  id v5 = (id)[v0 appendCharacteristic:&__block_literal_global_81];
  id v6 = (id)[v0 appendCharacteristic:&__block_literal_global_83];
  id v7 = (id)[v0 appendCharacteristic:&__block_literal_global_86];
  v8 = [v0 build];

  return v8;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v12.receiver = self;
  v12.super_class = (Class)TPSContent;
  id v4 = [(TPSContent *)&v12 description];
  id v5 = (void *)[v3 initWithString:v4];

  id v6 = [(TPSContent *)self title];

  if (v6)
  {
    uint64_t v7 = [(TPSContent *)self title];
    v8 = (void *)v7;
    uint64_t v9 = @"title";
  }
  else
  {
    uint64_t v10 = [(TPSContent *)self titleContent];

    if (!v10) {
      goto LABEL_6;
    }
    uint64_t v7 = [(TPSContent *)self titleContent];
    v8 = (void *)v7;
    uint64_t v9 = @"titleContent";
  }
  [v5 appendFormat:@" %@ = %@\n", v9, v7];

LABEL_6:
  return (NSString *)v5;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v18.receiver = self;
  v18.super_class = (Class)TPSContent;
  id v4 = [(TPSSerializableObject *)&v18 debugDescription];
  id v5 = (void *)[v3 initWithString:v4];

  [v5 appendString:@"\n"];
  id v6 = [(TPSContent *)self title];

  if (v6)
  {
    uint64_t v7 = [(TPSContent *)self title];
    [v5 appendFormat:@"\n  %@ = %@\n", @"title", v7];
  }
  v8 = [(TPSContent *)self titleContent];

  if (v8)
  {
    uint64_t v9 = [(TPSContent *)self titleContent];
    [v5 appendFormat:@"  %@ = %@\n", @"titleContent", v9];
  }
  if ([(TPSContent *)self labelStyle] >= 1) {
    [v5 appendFormat:@"\n  %@ = %ld\n", @"labelStyle", -[TPSContent labelStyle](self, "labelStyle")];
  }
  uint64_t v10 = [(TPSContent *)self bodyText];

  if (v10)
  {
    uint64_t v11 = [(TPSContent *)self bodyText];
    [v5 appendFormat:@"  %@ = %@\n", @"text", v11];
  }
  objc_super v12 = [(TPSContent *)self bodyContent];

  if (v12)
  {
    v13 = [(TPSContent *)self bodyContent];
    [v5 appendFormat:@"  %@ = %@\n", @"body", v13];
  }
  uint64_t v14 = [(TPSContent *)self assets];

  if (v14)
  {
    v15 = [(TPSContent *)self assets];
    uint64_t v16 = [v15 debugDescription];
    [v5 appendFormat:@"%@ = %@\n", @"asset", v16];
  }
  [v5 appendFormat:@"  %@ = %d\n", @"bodyContainsLink", -[TPSContent bodyContainsLink](self, "bodyContainsLink")];
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

@end