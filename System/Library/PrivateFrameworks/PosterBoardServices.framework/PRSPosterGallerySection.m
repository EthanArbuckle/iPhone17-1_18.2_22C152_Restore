@interface PRSPosterGallerySection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (NSString)localizedDescriptiveText;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)symbolColorName;
- (NSString)symbolImageName;
- (NSString)unityDescription;
- (PRSPosterGallerySection)initWithCoder:(id)a3;
- (PRSPosterGallerySection)initWithProactiveRepresentation:(id)a3;
- (PRSPosterGallerySection)initWithType:(int64_t)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5 localizedDescriptiveText:(id)a6 symbolImageName:(id)a7 symbolColorName:(id)a8 unityDescription:(id)a9 items:(id)a10;
- (id)copyWithZone:(_NSZone *)a3;
- (id)proactiveRepresentation;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterGallerySection

- (PRSPosterGallerySection)initWithType:(int64_t)a3 localizedTitle:(id)a4 localizedSubtitle:(id)a5 localizedDescriptiveText:(id)a6 symbolImageName:(id)a7 symbolColorName:(id)a8 unityDescription:(id)a9 items:(id)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  v40.receiver = self;
  v40.super_class = (Class)PRSPosterGallerySection;
  v23 = [(PRSPosterGallerySection *)&v40 init];
  v24 = v23;
  if (v23)
  {
    v23->_type = a3;
    uint64_t v25 = [v16 copy];
    localizedTitle = v24->_localizedTitle;
    v24->_localizedTitle = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    localizedSubtitle = v24->_localizedSubtitle;
    v24->_localizedSubtitle = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    localizedDescriptiveText = v24->_localizedDescriptiveText;
    v24->_localizedDescriptiveText = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    symbolImageName = v24->_symbolImageName;
    v24->_symbolImageName = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    symbolColorName = v24->_symbolColorName;
    v24->_symbolColorName = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    unityDescription = v24->_unityDescription;
    v24->_unityDescription = (NSString *)v35;

    uint64_t v37 = [v22 copy];
    items = v24->_items;
    v24->_items = (NSArray *)v37;
  }
  return v24;
}

- (PRSPosterGallerySection)initWithProactiveRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 items];
  v6 = objc_msgSend(v5, "bs_map:", &__block_literal_global_6);

  uint64_t v7 = [v4 type];
  if ((unint64_t)(v7 - 1) >= 3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  v9 = [v4 localizedTitle];
  v10 = [v4 localizedSubtitle];
  v11 = [v4 localizedDescriptiveText];
  v12 = [v4 symbolImageName];
  v13 = [v4 symbolColorName];
  v14 = [v4 unityDescription];
  v15 = [(PRSPosterGallerySection *)self initWithType:v8 localizedTitle:v9 localizedSubtitle:v10 localizedDescriptiveText:v11 symbolImageName:v12 symbolColorName:v13 unityDescription:v14 items:v6];

  return v15;
}

uint64_t __59__PRSPosterGallerySection_initWithProactiveRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 posterBoardRepresentation];
}

- (id)proactiveRepresentation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4B038]) initWithPosterBoardRepresentation:self];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithType:localizedTitle:localizedSubtitle:localizedDescriptiveText:symbolImageName:symbolColorName:unityDescription:items:", self->_type, self->_localizedTitle, self->_localizedSubtitle, self->_localizedDescriptiveText, self->_symbolImageName, self->_symbolColorName, self->_unityDescription, self->_items);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRSPosterGallerySection *)a3;
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
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    v9 = v7;

    if (v9)
    {
      v10 = [MEMORY[0x1E4F4F738] builder];
      int64_t type = self->_type;
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __35__PRSPosterGallerySection_isEqual___block_invoke;
      v52[3] = &unk_1E5D008C8;
      v12 = v9;
      v53 = v12;
      id v13 = (id)[v10 appendInteger:type counterpart:v52];
      localizedTitle = self->_localizedTitle;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_2;
      v50[3] = &unk_1E5D00878;
      v15 = v12;
      v51 = v15;
      id v16 = (id)[v10 appendObject:localizedTitle counterpart:v50];
      localizedSubtitle = self->_localizedSubtitle;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_3;
      v48[3] = &unk_1E5D00878;
      id v18 = v15;
      v49 = v18;
      id v19 = (id)[v10 appendObject:localizedSubtitle counterpart:v48];
      localizedDescriptiveText = self->_localizedDescriptiveText;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_4;
      v46[3] = &unk_1E5D00878;
      id v21 = v18;
      v47 = v21;
      id v22 = (id)[v10 appendObject:localizedDescriptiveText counterpart:v46];
      symbolImageName = self->_symbolImageName;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_5;
      v44[3] = &unk_1E5D00878;
      v24 = v21;
      v45 = v24;
      id v25 = (id)[v10 appendObject:symbolImageName counterpart:v44];
      symbolColorName = self->_symbolColorName;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_6;
      v42[3] = &unk_1E5D00878;
      uint64_t v27 = v24;
      id v43 = v27;
      id v28 = (id)[v10 appendObject:symbolColorName counterpart:v42];
      unityDescription = self->_unityDescription;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __35__PRSPosterGallerySection_isEqual___block_invoke_7;
      v40[3] = &unk_1E5D00878;
      id v30 = v27;
      id v41 = v30;
      id v31 = (id)[v10 appendObject:unityDescription counterpart:v40];
      items = self->_items;
      uint64_t v35 = MEMORY[0x1E4F143A8];
      uint64_t v36 = 3221225472;
      uint64_t v37 = __35__PRSPosterGallerySection_isEqual___block_invoke_8;
      v38 = &unk_1E5D00878;
      id v39 = v30;
      id v33 = (id)[v10 appendObject:items counterpart:&v35];
      char v8 = objc_msgSend(v10, "isEqual", v35, v36, v37, v38);
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

uint64_t __35__PRSPosterGallerySection_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_7(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 56);
}

id __35__PRSPosterGallerySection_isEqual___block_invoke_8(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 64);
}

- (unint64_t)hash
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_type];
  id v5 = (id)[v3 appendObject:self->_localizedTitle];
  id v6 = (id)[v3 appendObject:self->_localizedSubtitle];
  id v7 = (id)[v3 appendObject:self->_localizedDescriptiveText];
  id v8 = (id)[v3 appendObject:self->_symbolImageName];
  id v9 = (id)[v3 appendObject:self->_symbolColorName];
  id v10 = (id)[v3 appendObject:self->_unityDescription];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v11 = self->_items;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (id)objc_msgSend(v3, "appendObject:", *(void *)(*((void *)&v19 + 1) + 8 * v15++), (void)v19);
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  unint64_t v17 = [v3 hash];
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGallerySection)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = NSStringFromSelector(sel_type);
  uint64_t v5 = [v3 decodeIntegerForKey:v4];

  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(sel_localizedTitle);
  id v8 = [v3 decodeObjectOfClass:v6 forKey:v7];

  uint64_t v9 = objc_opt_class();
  id v10 = NSStringFromSelector(sel_localizedSubtitle);
  v11 = [v3 decodeObjectOfClass:v9 forKey:v10];

  uint64_t v12 = objc_opt_class();
  uint64_t v13 = NSStringFromSelector(sel_localizedDescriptiveText);
  uint64_t v14 = [v3 decodeObjectOfClass:v12 forKey:v13];

  uint64_t v15 = objc_opt_class();
  id v16 = NSStringFromSelector(sel_symbolImageName);
  unint64_t v17 = [v3 decodeObjectOfClass:v15 forKey:v16];

  uint64_t v18 = objc_opt_class();
  long long v19 = NSStringFromSelector(sel_symbolColorName);
  long long v20 = [v3 decodeObjectOfClass:v18 forKey:v19];

  uint64_t v21 = objc_opt_class();
  long long v22 = NSStringFromSelector(sel_unityDescription);
  v23 = [v3 decodeObjectOfClass:v21 forKey:v22];

  uint64_t v24 = objc_opt_class();
  id v25 = NSStringFromSelector(sel_items);
  v26 = [v3 decodeArrayOfObjectsOfClass:v24 forKey:v25];

  uint64_t v27 = [(PRSPosterGallerySection *)self initWithType:v5 localizedTitle:v8 localizedSubtitle:v11 localizedDescriptiveText:v14 symbolImageName:v17 symbolColorName:v20 unityDescription:v23 items:v26];
  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_type);
  [v5 encodeInteger:type forKey:v6];

  localizedTitle = self->_localizedTitle;
  id v8 = NSStringFromSelector(sel_localizedTitle);
  [v5 encodeObject:localizedTitle forKey:v8];

  localizedSubtitle = self->_localizedSubtitle;
  id v10 = NSStringFromSelector(sel_localizedSubtitle);
  [v5 encodeObject:localizedSubtitle forKey:v10];

  localizedDescriptiveText = self->_localizedDescriptiveText;
  uint64_t v12 = NSStringFromSelector(sel_localizedDescriptiveText);
  [v5 encodeObject:localizedDescriptiveText forKey:v12];

  symbolImageName = self->_symbolImageName;
  uint64_t v14 = NSStringFromSelector(sel_symbolImageName);
  [v5 encodeObject:symbolImageName forKey:v14];

  symbolColorName = self->_symbolColorName;
  id v16 = NSStringFromSelector(sel_symbolColorName);
  [v5 encodeObject:symbolColorName forKey:v16];

  unityDescription = self->_unityDescription;
  uint64_t v18 = NSStringFromSelector(sel_unityDescription);
  [v5 encodeObject:unityDescription forKey:v18];

  items = self->_items;
  NSStringFromSelector(sel_items);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:items forKey:v20];
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (NSString)localizedDescriptiveText
{
  return self->_localizedDescriptiveText;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (NSString)symbolColorName
{
  return self->_symbolColorName;
}

- (NSString)unityDescription
{
  return self->_unityDescription;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_unityDescription, 0);
  objc_storeStrong((id *)&self->_symbolColorName, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_localizedDescriptiveText, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end