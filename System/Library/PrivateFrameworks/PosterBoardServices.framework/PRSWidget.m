@interface PRSWidget
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INIntent)intent;
- (NSString)containerBundleIdentifier;
- (NSString)description;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (NSString)uniqueIdentifier;
- (PRSWidget)initWithBSXPCCoder:(id)a3;
- (PRSWidget)initWithCoder:(id)a3;
- (PRSWidget)initWithUniqueIdentifier:(id)a3 kind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 family:(unint64_t)a7 intent:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)family;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerBundleIdentifier:(id)a3;
- (void)setExtensionBundleIdentifier:(id)a3;
- (void)setFamily:(unint64_t)a3;
- (void)setIntent:(id)a3;
- (void)setKind:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation PRSWidget

- (PRSWidget)initWithUniqueIdentifier:(id)a3 kind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 family:(unint64_t)a7 intent:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PRSWidget.m", 19, @"Invalid parameter not satisfying: %@", @"uniqueIdentifier" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"PRSWidget.m", 20, @"Invalid parameter not satisfying: %@", @"kind" object file lineNumber description];

LABEL_3:
  v32.receiver = self;
  v32.super_class = (Class)PRSWidget;
  v20 = [(PRSWidget *)&v32 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    uniqueIdentifier = v20->_uniqueIdentifier;
    v20->_uniqueIdentifier = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    kind = v20->_kind;
    v20->_kind = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    extensionBundleIdentifier = v20->_extensionBundleIdentifier;
    v20->_extensionBundleIdentifier = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    containerBundleIdentifier = v20->_containerBundleIdentifier;
    v20->_containerBundleIdentifier = (NSString *)v27;

    v20->_family = a7;
    objc_storeStrong((id *)&v20->_intent, a8);
  }

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uniqueIdentifier = self->_uniqueIdentifier;
  kind = self->_kind;
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  containerBundleIdentifier = self->_containerBundleIdentifier;
  unint64_t family = self->_family;
  intent = self->_intent;
  return (id)[v4 initWithUniqueIdentifier:uniqueIdentifier kind:kind extensionBundleIdentifier:extensionBundleIdentifier containerBundleIdentifier:containerBundleIdentifier family:family intent:intent];
}

- (NSString)description
{
  return (NSString *)[(PRSWidget *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  uniqueIdentifier = self->_uniqueIdentifier;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __21__PRSWidget_isEqual___block_invoke;
  v38[3] = &unk_1E5D01018;
  id v7 = v4;
  id v39 = v7;
  id v8 = (id)[v5 appendString:uniqueIdentifier counterpart:v38];
  kind = self->_kind;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __21__PRSWidget_isEqual___block_invoke_2;
  v36[3] = &unk_1E5D01018;
  id v10 = v7;
  id v37 = v10;
  id v11 = (id)[v5 appendString:kind counterpart:v36];
  containerBundleIdentifier = self->_containerBundleIdentifier;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __21__PRSWidget_isEqual___block_invoke_3;
  v34[3] = &unk_1E5D01018;
  id v13 = v10;
  id v35 = v13;
  id v14 = (id)[v5 appendString:containerBundleIdentifier counterpart:v34];
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __21__PRSWidget_isEqual___block_invoke_4;
  v32[3] = &unk_1E5D01018;
  id v16 = v13;
  id v33 = v16;
  id v17 = (id)[v5 appendString:extensionBundleIdentifier counterpart:v32];
  unint64_t family = self->_family;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __21__PRSWidget_isEqual___block_invoke_5;
  v30[3] = &unk_1E5D01550;
  id v19 = v16;
  id v31 = v19;
  id v20 = (id)[v5 appendUnsignedInteger:family counterpart:v30];
  intent = self->_intent;
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  uint64_t v27 = __21__PRSWidget_isEqual___block_invoke_6;
  v28 = &unk_1E5D01578;
  id v29 = v19;
  id v22 = v19;
  id v23 = (id)[v5 appendObject:intent counterpart:&v25];
  LOBYTE(intent) = objc_msgSend(v5, "isEqual", v25, v26, v27, v28);

  return (char)intent;
}

id __21__PRSWidget_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __21__PRSWidget_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __21__PRSWidget_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

id __21__PRSWidget_isEqual___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

uint64_t __21__PRSWidget_isEqual___block_invoke_5(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 40);
}

id __21__PRSWidget_isEqual___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendString:self->_uniqueIdentifier];
  id v5 = (id)[v3 appendString:self->_kind];
  id v6 = (id)[v3 appendString:self->_containerBundleIdentifier];
  id v7 = (id)[v3 appendString:self->_extensionBundleIdentifier];
  id v8 = (id)[v3 appendUnsignedInteger:self->_family];
  id v9 = (id)[v3 appendObject:self->_intent];
  unint64_t v10 = [v3 hash];

  return v10;
}

- (id)succinctDescription
{
  v2 = [(PRSWidget *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(PRSWidget *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(PRSWidget *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_uniqueIdentifier withName:@"uniqueIdentifier"];
  id v6 = (id)[v4 appendObject:self->_kind withName:@"kind"];
  id v7 = (id)[v4 appendObject:self->_extensionBundleIdentifier withName:@"extensionBundleIdentifier"];
  id v8 = (id)[v4 appendObject:self->_containerBundleIdentifier withName:@"containerBundleIdentifier"];
  id v9 = (id)[v4 appendInteger:self->_family withName:@"family"];
  id v10 = (id)[v4 appendObject:self->_intent withName:@"intent"];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueIdentifier = self->_uniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  [v5 encodeObject:self->_kind forKey:@"kind"];
  [v5 encodeObject:self->_extensionBundleIdentifier forKey:@"extensionBundleIdentifier"];
  [v5 encodeObject:self->_containerBundleIdentifier forKey:@"containerBundleIdentifier"];
  [v5 encodeInteger:self->_family forKey:@"family"];
  [v5 encodeObject:self->_intent forKey:@"intent"];
}

- (PRSWidget)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PRSWidget;
  id v5 = [(PRSWidget *)&v26 init];
  if (v5)
  {
    id v6 = self;
    id v7 = [v4 decodeObjectOfClass:v6 forKey:@"uniqueIdentifier"];
    uint64_t v8 = [v7 copy];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    id v10 = self;
    id v11 = [v4 decodeObjectOfClass:v10 forKey:@"kind"];
    uint64_t v12 = [v11 copy];
    kind = v5->_kind;
    v5->_kind = (NSString *)v12;

    id v14 = self;
    id v15 = [v4 decodeObjectOfClass:v14 forKey:@"extensionBundleIdentifier"];
    uint64_t v16 = [v15 copy];
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v16;

    id v18 = self;
    id v19 = [v4 decodeObjectOfClass:v18 forKey:@"containerBundleIdentifier"];
    uint64_t v20 = [v19 copy];
    containerBundleIdentifier = v5->_containerBundleIdentifier;
    v5->_containerBundleIdentifier = (NSString *)v20;

    v5->_unint64_t family = [v4 decodeIntegerForKey:@"family"];
    id v22 = self;
    uint64_t v23 = [v4 decodeObjectOfClass:v22 forKey:@"intent"];
    intent = v5->_intent;
    v5->_intent = (INIntent *)v23;
  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRSWidget)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"uniqueIdentifier"];

  id v7 = self;
  uint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"kind"];

  id v9 = self;
  id v10 = [v4 decodeObjectOfClass:v9 forKey:@"extensionBundleIdentifier"];

  id v11 = self;
  uint64_t v12 = [v4 decodeObjectOfClass:v11 forKey:@"containerBundleIdentifier"];

  uint64_t v13 = [v4 decodeUInt64ForKey:@"family"];
  id v14 = self;
  id v15 = [v4 decodeObjectOfClass:v14 forKey:@"intent"];

  uint64_t v16 = [(PRSWidget *)self initWithUniqueIdentifier:v6 kind:v8 extensionBundleIdentifier:v10 containerBundleIdentifier:v12 family:v13 intent:v15];
  return v16;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PRSWidget *)self uniqueIdentifier];
  [v4 encodeObject:v5 forKey:@"uniqueIdentifier"];

  id v6 = [(PRSWidget *)self kind];
  [v4 encodeObject:v6 forKey:@"kind"];

  id v7 = [(PRSWidget *)self extensionBundleIdentifier];
  [v4 encodeObject:v7 forKey:@"extensionBundleIdentifier"];

  uint64_t v8 = [(PRSWidget *)self containerBundleIdentifier];
  [v4 encodeObject:v8 forKey:@"containerBundleIdentifier"];

  objc_msgSend(v4, "encodeUInt64:forKey:", -[PRSWidget family](self, "family"), @"family");
  id v9 = [(PRSWidget *)self intent];
  [v4 encodeObject:v9 forKey:@"intent"];
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (void)setContainerBundleIdentifier:(id)a3
{
}

- (unint64_t)family
{
  return self->_family;
}

- (void)setFamily:(unint64_t)a3
{
  self->_unint64_t family = a3;
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end