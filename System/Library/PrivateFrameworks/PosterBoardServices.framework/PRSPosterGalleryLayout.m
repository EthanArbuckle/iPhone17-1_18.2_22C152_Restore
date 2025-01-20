@interface PRSPosterGalleryLayout
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)sections;
- (NSLocale)locale;
- (PRSPosterGalleryLayout)initWithCoder:(id)a3;
- (PRSPosterGalleryLayout)initWithProactiveRepresentation:(id)a3;
- (PRSPosterGalleryLayout)initWithSections:(id)a3 locale:(id)a4;
- (PRSPosterGalleryLayout)initWithSections:(id)a3 locale:(id)a4 source:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)proactiveRepresentation;
- (int64_t)source;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterGalleryLayout

- (PRSPosterGalleryLayout)initWithSections:(id)a3 locale:(id)a4
{
  return [(PRSPosterGalleryLayout *)self initWithSections:a3 locale:a4 source:0];
}

- (PRSPosterGalleryLayout)initWithSections:(id)a3 locale:(id)a4 source:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PRSPosterGalleryLayout;
  v10 = [(PRSPosterGalleryLayout *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v10->_sections, v13);

    if (v9)
    {
      v14 = (NSLocale *)v9;
    }
    else
    {
      v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    locale = v10->_locale;
    v10->_locale = v14;

    v10->_source = a5;
  }

  return v10;
}

- (PRSPosterGalleryLayout)initWithProactiveRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 sections];
  v6 = objc_msgSend(v5, "bs_map:", &__block_literal_global_4);

  v7 = [v4 locale];
  uint64_t v8 = [v4 source];

  id v9 = [(PRSPosterGalleryLayout *)self initWithSections:v6 locale:v7 source:v8 != 0];
  return v9;
}

uint64_t __58__PRSPosterGalleryLayout_initWithProactiveRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 posterBoardRepresentation];
}

- (id)proactiveRepresentation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4B028]) initWithPosterBoardRepresentation:self];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  sections = self->_sections;
  locale = self->_locale;
  int64_t source = self->_source;
  return (id)[v4 initWithSections:sections locale:locale source:source];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRSPosterGalleryLayout *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v9 = v7;

    if (v9)
    {
      v10 = [MEMORY[0x1E4F4F738] builder];
      sections = self->_sections;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __34__PRSPosterGalleryLayout_isEqual___block_invoke;
      v24[3] = &unk_1E5D00878;
      v12 = v9;
      v25 = v12;
      id v13 = (id)[v10 appendObject:sections counterpart:v24];
      locale = self->_locale;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __34__PRSPosterGalleryLayout_isEqual___block_invoke_2;
      v22[3] = &unk_1E5D00878;
      v15 = v12;
      v23 = v15;
      id v16 = (id)[v10 appendObject:locale counterpart:v22];
      int64_t source = self->_source;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __34__PRSPosterGalleryLayout_isEqual___block_invoke_3;
      v20[3] = &unk_1E5D008C8;
      v21 = v15;
      id v18 = (id)[v10 appendInteger:source counterpart:v20];
      char v8 = [v10 isEqual];
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

id __34__PRSPosterGalleryLayout_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __34__PRSPosterGalleryLayout_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

uint64_t __34__PRSPosterGalleryLayout_isEqual___block_invoke_3(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 24);
}

- (unint64_t)hash
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F4F758] builder];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_sections;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (id)objc_msgSend(v3, "appendObject:", *(void *)(*((void *)&v14 + 1) + 8 * v8++), (void)v14);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v10 = (id)[v3 appendObject:self->_locale];
  id v11 = (id)[v3 appendInteger:self->_source];
  unint64_t v12 = [v3 hash];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGalleryLayout)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_sections);
  uint64_t v7 = [v4 decodeArrayOfObjectsOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_locale);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  id v11 = NSStringFromSelector(sel_source);
  uint64_t v12 = [v4 decodeIntegerForKey:v11];

  id v13 = [(PRSPosterGalleryLayout *)self initWithSections:v7 locale:v10 source:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  sections = self->_sections;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_sections);
  [v5 encodeObject:sections forKey:v6];

  locale = self->_locale;
  uint64_t v8 = NSStringFromSelector(sel_locale);
  [v5 encodeObject:locale forKey:v8];

  int64_t source = self->_source;
  NSStringFromSelector(sel_source);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:source forKey:v10];
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end