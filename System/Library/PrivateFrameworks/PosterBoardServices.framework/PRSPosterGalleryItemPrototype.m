@interface PRSPosterGalleryItemPrototype
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)containerBundleIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)identifier;
- (PRSPosterGalleryItemOptions)galleryOptions;
- (PRSPosterGalleryItemPrototype)initWithCoder:(id)a3;
- (PRSPosterGalleryItemPrototype)initWithIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 galleryOptions:(id)a6;
- (PRSPosterGalleryItemPrototype)initWithProactiveRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)proactiveRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterGalleryItemPrototype

- (PRSPosterGalleryItemPrototype)initWithIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 galleryOptions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PRSPosterGalleryItemPrototype;
  v14 = [(PRSPosterGalleryItemPrototype *)&v26 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    extensionBundleIdentifier = v14->_extensionBundleIdentifier;
    v14->_extensionBundleIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    containerBundleIdentifier = v14->_containerBundleIdentifier;
    v14->_containerBundleIdentifier = (NSString *)v19;

    v21 = (void *)[v13 copy];
    v22 = v21;
    if (v21) {
      v23 = v21;
    }
    else {
      v23 = objc_alloc_init(PRSPosterGalleryItemOptions);
    }
    galleryOptions = v14->_galleryOptions;
    v14->_galleryOptions = v23;
  }
  return v14;
}

- (PRSPosterGalleryItemPrototype)initWithProactiveRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [v4 extensionBundleIdentifier];
  v7 = [v4 containerBundleIdentifier];
  v8 = [v4 galleryOptions];

  v9 = [v8 posterBoardRepresentation];
  id v10 = [(PRSPosterGalleryItemPrototype *)self initWithIdentifier:v5 extensionBundleIdentifier:v6 containerBundleIdentifier:v7 galleryOptions:v9];

  return v10;
}

- (id)proactiveRepresentation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4B268]) initWithPosterBoardRepresentation:self];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  containerBundleIdentifier = self->_containerBundleIdentifier;
  galleryOptions = self->_galleryOptions;
  return (id)[v4 initWithIdentifier:identifier extensionBundleIdentifier:extensionBundleIdentifier containerBundleIdentifier:containerBundleIdentifier galleryOptions:galleryOptions];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRSPosterGalleryItemPrototype *)a3;
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
    v9 = v7;

    if (v9)
    {
      id v10 = [MEMORY[0x1E4F4F738] builder];
      identifier = self->_identifier;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke;
      v32[3] = &unk_1E5D00878;
      id v12 = v9;
      v33 = v12;
      id v13 = (id)[v10 appendObject:identifier counterpart:v32];
      extensionBundleIdentifier = self->_extensionBundleIdentifier;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_2;
      v30[3] = &unk_1E5D00878;
      uint64_t v15 = v12;
      v31 = v15;
      id v16 = (id)[v10 appendObject:extensionBundleIdentifier counterpart:v30];
      containerBundleIdentifier = self->_containerBundleIdentifier;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_3;
      v28[3] = &unk_1E5D00878;
      v18 = v15;
      v29 = v18;
      id v19 = (id)[v10 appendObject:containerBundleIdentifier counterpart:v28];
      galleryOptions = self->_galleryOptions;
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_4;
      objc_super v26 = &unk_1E5D00878;
      v27 = v18;
      id v21 = (id)[v10 appendObject:galleryOptions counterpart:&v23];
      char v8 = objc_msgSend(v10, "isEqual", v23, v24, v25, v26);
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

id __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __41__PRSPosterGalleryItemPrototype_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_identifier];
  id v5 = (id)[v3 appendObject:self->_extensionBundleIdentifier];
  id v6 = (id)[v3 appendObject:self->_containerBundleIdentifier];
  id v7 = (id)[v3 appendObject:self->_galleryOptions];
  unint64_t v8 = [v3 hash];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGalleryItemPrototype)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_identifier);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_extensionBundleIdentifier);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  id v12 = NSStringFromSelector(sel_containerBundleIdentifier);
  id v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  uint64_t v14 = objc_opt_class();
  uint64_t v15 = NSStringFromSelector(sel_galleryOptions);
  id v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

  uint64_t v17 = [(PRSPosterGalleryItemPrototype *)self initWithIdentifier:v7 extensionBundleIdentifier:v10 containerBundleIdentifier:v13 galleryOptions:v16];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  id v6 = NSStringFromSelector(sel_identifier);
  [v5 encodeObject:identifier forKey:v6];

  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  uint64_t v8 = NSStringFromSelector(sel_extensionBundleIdentifier);
  [v5 encodeObject:extensionBundleIdentifier forKey:v8];

  containerBundleIdentifier = self->_containerBundleIdentifier;
  id v10 = NSStringFromSelector(sel_containerBundleIdentifier);
  [v5 encodeObject:containerBundleIdentifier forKey:v10];

  galleryOptions = self->_galleryOptions;
  NSStringFromSelector(sel_galleryOptions);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:galleryOptions forKey:v12];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (PRSPosterGalleryItemOptions)galleryOptions
{
  return self->_galleryOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryOptions, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end