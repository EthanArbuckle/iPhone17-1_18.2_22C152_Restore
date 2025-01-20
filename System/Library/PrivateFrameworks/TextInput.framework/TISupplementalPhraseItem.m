@interface TISupplementalPhraseItem
+ (BOOL)supportsSecureCoding;
- (NSString)phoneticTitle;
- (NSString)title;
- (TISupplementalPhraseItem)initWithCoder:(id)a3;
- (TISupplementalPhraseItem)initWithTitle:(id)a3;
- (TISupplementalPhraseItem)initWithTitle:(id)a3 phoneticTitle:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setPhoneticTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TISupplementalPhraseItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticTitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setPhoneticTitle:(id)a3
{
}

- (NSString)phoneticTitle
{
  return self->_phoneticTitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (id)description
{
  v18[4] = *MEMORY[0x1E4F143B8];
  title = self->_title;
  v18[0] = "title";
  v18[1] = title;
  phoneticTitle = self->_phoneticTitle;
  v18[2] = "phoneticTitle";
  v18[3] = phoneticTitle;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  uint64_t v6 = 0;
  char v7 = 1;
  do
  {
    char v8 = v7;
    v9 = &v18[2 * v6];
    uint64_t v11 = *v9;
    v10 = (void *)v9[1];
    if ([v10 length])
    {
      v12 = [NSString stringWithFormat:@"%s=\"%@\"", v11, v10];
      [v5 addObject:v12];
    }
    char v7 = 0;
    uint64_t v6 = 1;
  }
  while ((v8 & 1) != 0);
  v13 = NSString;
  uint64_t v14 = objc_opt_class();
  v15 = [v5 componentsJoinedByString:@", "];
  objc_msgSend(v13, "stringWithFormat:", @"<%@: %p; %@, identifier=%llu>",
    v14,
    self,
    v15,
  v16 = [(TISupplementalItem *)self identifier]);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TISupplementalPhraseItem;
  id v4 = a3;
  [(TISupplementalItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"title", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_phoneticTitle forKey:@"phoneticTitle"];
}

- (TISupplementalPhraseItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TISupplementalPhraseItem;
  objc_super v5 = [(TISupplementalItem *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneticTitle"];
    phoneticTitle = v5->_phoneticTitle;
    v5->_phoneticTitle = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (TISupplementalPhraseItem)initWithTitle:(id)a3 phoneticTitle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TISupplementalPhraseItem;
  uint64_t v8 = [(TISupplementalItem *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    phoneticTitle = v8->_phoneticTitle;
    v8->_phoneticTitle = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (TISupplementalPhraseItem)initWithTitle:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TISupplementalPhraseItem;
  objc_super v5 = [(TISupplementalItem *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end