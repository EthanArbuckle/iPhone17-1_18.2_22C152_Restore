@interface PRSPosterGallerySuggestedComplication
+ (BOOL)supportsSecureCoding;
+ (PRSPosterGallerySuggestedComplication)suggestedComplicationWithDictionaryRepresentation:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesPersonality:(id)a3;
- (INIntent)intent;
- (NSString)containerBundleIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (PRSPosterGallerySuggestedComplication)initWithCoder:(id)a3;
- (PRSPosterGallerySuggestedComplication)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 intent:(id)a7 source:(int64_t)a8;
- (PRSPosterGallerySuggestedComplication)initWithProactiveRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)proactiveRepresentation;
- (int64_t)source;
- (int64_t)widgetFamily;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterGallerySuggestedComplication

- (PRSPosterGallerySuggestedComplication)initWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 containerBundleIdentifier:(id)a5 widgetFamily:(int64_t)a6 intent:(id)a7 source:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PRSPosterGallerySuggestedComplication;
  v18 = [(PRSPosterGallerySuggestedComplication *)&v26 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    extensionBundleIdentifier = v18->_extensionBundleIdentifier;
    v18->_extensionBundleIdentifier = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    kind = v18->_kind;
    v18->_kind = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    containerBundleIdentifier = v18->_containerBundleIdentifier;
    v18->_containerBundleIdentifier = (NSString *)v23;

    v18->_widgetFamily = a6;
    objc_storeStrong((id *)&v18->_intent, a7);
    v18->_source = a8;
  }

  return v18;
}

- (PRSPosterGallerySuggestedComplication)initWithProactiveRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 extensionBundleIdentifier];
  v6 = [v4 kind];
  v7 = [v4 containerBundleIdentifier];
  uint64_t v8 = [v4 widgetFamily];
  v9 = [v4 intent];
  int v10 = [v4 source];

  uint64_t v11 = (v10 - 1);
  if (v11 < 6) {
    uint64_t v12 = v11 + 1;
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = [(PRSPosterGallerySuggestedComplication *)self initWithExtensionBundleIdentifier:v5 kind:v6 containerBundleIdentifier:v7 widgetFamily:v8 intent:v9 source:v12];

  return v13;
}

- (id)proactiveRepresentation
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F4AF50]) initWithPosterBoardRepresentation:self];
  return v2;
}

+ (PRSPosterGallerySuggestedComplication)suggestedComplicationWithDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = NSStringFromSelector(sel_extensionBundleIdentifier);
  uint64_t v8 = [v6 objectForKey:v7];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    v13 = NSStringFromSelector(sel_kind);
    id v14 = [v6 objectForKey:v13];
    uint64_t v15 = objc_opt_class();
    id v16 = v14;
    if (v15)
    {
      if (objc_opt_isKindOfClass()) {
        id v17 = v16;
      }
      else {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = 0;
    }
    id v19 = v17;

    if (!v19)
    {
      if (a4)
      {
        v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_37;
    }
    v20 = NSStringFromSelector(sel_containerBundleIdentifier);
    uint64_t v21 = [v6 objectForKey:v20];
    uint64_t v22 = objc_opt_class();
    id v23 = v21;
    if (v22)
    {
      if (objc_opt_isKindOfClass()) {
        v24 = v23;
      }
      else {
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
    }
    id v25 = v24;

    objc_super v26 = NSStringFromSelector(sel_widgetFamily);
    v27 = [v6 objectForKey:v26];
    uint64_t v28 = objc_opt_class();
    id v29 = v27;
    if (v28)
    {
      if (objc_opt_isKindOfClass()) {
        v30 = v29;
      }
      else {
        v30 = 0;
      }
    }
    else
    {
      v30 = 0;
    }
    id v31 = v30;

    if (v31)
    {
      uint64_t v32 = CHSWidgetFamilyFromString();
      if ((CHSWidgetFamilyIsAccessory() & 1) != 0 || v32 == 1)
      {
        v18 = (void *)[objc_alloc((Class)a1) initWithExtensionBundleIdentifier:v12 kind:v19 containerBundleIdentifier:v25 widgetFamily:v32 intent:0 source:0];
        goto LABEL_36;
      }
      if (!a4)
      {
        v18 = 0;
        goto LABEL_36;
      }
    }
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  if (a4)
  {
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_38:

  return (PRSPosterGallerySuggestedComplication *)v18;
}

- (id)dictionaryRepresentation
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromWidgetFamily();
  id v4 = NSStringFromSelector(sel_extensionBundleIdentifier);
  v12[0] = v4;
  v13[0] = self->_extensionBundleIdentifier;
  v5 = NSStringFromSelector(sel_kind);
  v12[1] = v5;
  v13[1] = self->_kind;
  id v6 = NSStringFromSelector(sel_containerBundleIdentifier);
  v12[2] = v6;
  containerBundleIdentifier = self->_containerBundleIdentifier;
  uint64_t v8 = containerBundleIdentifier;
  if (!containerBundleIdentifier)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v8;
  uint64_t v9 = NSStringFromSelector(sel_widgetFamily);
  v12[3] = v9;
  v13[3] = v3;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  if (!containerBundleIdentifier) {
  return v10;
  }
}

- (BOOL)matchesPersonality:(id)a3
{
  id v4 = a3;
  v5 = [(PRSPosterGallerySuggestedComplication *)self extensionBundleIdentifier];
  id v6 = [v4 extensionBundleIdentifier];
  if (BSEqualStrings())
  {
    v7 = [(PRSPosterGallerySuggestedComplication *)self kind];
    uint64_t v8 = [v4 kind];
    char v9 = BSEqualStrings();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  kind = self->_kind;
  containerBundleIdentifier = self->_containerBundleIdentifier;
  int64_t widgetFamily = self->_widgetFamily;
  intent = self->_intent;
  int64_t source = self->_source;
  return (id)[v4 initWithExtensionBundleIdentifier:extensionBundleIdentifier kind:kind containerBundleIdentifier:containerBundleIdentifier widgetFamily:widgetFamily intent:intent source:source];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRSPosterGallerySuggestedComplication *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
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
    char v9 = v7;

    if (v9)
    {
      id v10 = [MEMORY[0x1E4F4F738] builder];
      extensionBundleIdentifier = self->_extensionBundleIdentifier;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke;
      v42[3] = &unk_1E5D00878;
      id v12 = v9;
      v43 = v12;
      id v13 = (id)[v10 appendObject:extensionBundleIdentifier counterpart:v42];
      kind = self->_kind;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_2;
      v40[3] = &unk_1E5D01018;
      uint64_t v15 = v12;
      v41 = v15;
      id v16 = (id)[v10 appendString:kind counterpart:v40];
      containerBundleIdentifier = self->_containerBundleIdentifier;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_3;
      v38[3] = &unk_1E5D00878;
      v18 = v15;
      v39 = v18;
      id v19 = (id)[v10 appendObject:containerBundleIdentifier counterpart:v38];
      int64_t widgetFamily = self->_widgetFamily;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_4;
      v36[3] = &unk_1E5D008C8;
      uint64_t v21 = v18;
      v37 = v21;
      id v22 = (id)[v10 appendInteger:widgetFamily counterpart:v36];
      intent = self->_intent;
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_5;
      v34[3] = &unk_1E5D00878;
      v24 = v21;
      v35 = v24;
      id v25 = (id)[v10 appendObject:intent counterpart:v34];
      int64_t source = self->_source;
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      id v31 = __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_6;
      uint64_t v32 = &unk_1E5D008C8;
      v33 = v24;
      id v27 = (id)[v10 appendInteger:source counterpart:&v29];
      char v8 = objc_msgSend(v10, "isEqual", v29, v30, v31, v32);
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

id __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

uint64_t __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_4(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 32);
}

id __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_5(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

uint64_t __49__PRSPosterGallerySuggestedComplication_isEqual___block_invoke_6(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 48);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_extensionBundleIdentifier];
  id v5 = (id)[v3 appendObject:self->_kind];
  id v6 = (id)[v3 appendObject:self->_containerBundleIdentifier];
  id v7 = (id)[v3 appendInteger:self->_widgetFamily];
  id v8 = (id)[v3 appendObject:self->_intent];
  id v9 = (id)[v3 appendInteger:self->_source];
  unint64_t v10 = [v3 hash];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSPosterGallerySuggestedComplication)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_extensionBundleIdentifier);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_kind);
  unint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  id v12 = NSStringFromSelector(sel_containerBundleIdentifier);
  id v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  id v14 = NSStringFromSelector(sel_widgetFamily);
  uint64_t v15 = [v4 decodeIntegerForKey:v14];

  uint64_t v16 = objc_opt_class();
  id v17 = NSStringFromSelector(sel_intent);
  v18 = [v4 decodeObjectOfClass:v16 forKey:v17];

  id v19 = NSStringFromSelector(sel_source);
  uint64_t v20 = [v4 decodeIntegerForKey:v19];

  uint64_t v21 = [(PRSPosterGallerySuggestedComplication *)self initWithExtensionBundleIdentifier:v7 kind:v10 containerBundleIdentifier:v13 widgetFamily:v15 intent:v18 source:v20];
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  id v5 = a3;
  id v6 = NSStringFromSelector(sel_extensionBundleIdentifier);
  [v5 encodeObject:extensionBundleIdentifier forKey:v6];

  kind = self->_kind;
  uint64_t v8 = NSStringFromSelector(sel_kind);
  [v5 encodeObject:kind forKey:v8];

  containerBundleIdentifier = self->_containerBundleIdentifier;
  unint64_t v10 = NSStringFromSelector(sel_containerBundleIdentifier);
  [v5 encodeObject:containerBundleIdentifier forKey:v10];

  int64_t widgetFamily = self->_widgetFamily;
  id v12 = NSStringFromSelector(sel_widgetFamily);
  [v5 encodeInteger:widgetFamily forKey:v12];

  intent = self->_intent;
  id v14 = NSStringFromSelector(sel_intent);
  [v5 encodeObject:intent forKey:v14];

  int64_t source = self->_source;
  NSStringFromSelector(sel_source);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:source forKey:v16];
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (INIntent)intent
{
  return self->_intent;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end