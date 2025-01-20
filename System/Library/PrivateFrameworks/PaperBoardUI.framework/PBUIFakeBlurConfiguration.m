@interface PBUIFakeBlurConfiguration
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)initWithVariant:(uint64_t)a3 style:(void *)a4 traitCollection:;
@end

@implementation PBUIFakeBlurConfiguration

- (void)initWithVariant:(uint64_t)a3 style:(void *)a4 traitCollection:
{
  id v7 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)PBUIFakeBlurConfiguration;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      v8[1] = a2;
      v8[2] = a3;
      uint64_t v9 = [v7 copy];
      v10 = (void *)a1[3];
      a1[3] = v9;
    }
  }

  return a1;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_variant];
  id v5 = (id)[v3 appendInteger:self->_requestedStyle];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  int64_t variant = self->_variant;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __37__PBUIFakeBlurConfiguration_isEqual___block_invoke;
  v20[3] = &unk_1E62B37E8;
  id v8 = v6;
  id v21 = v8;
  id v9 = (id)[v5 appendInteger:variant counterpart:v20];
  int64_t requestedStyle = self->_requestedStyle;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__PBUIFakeBlurConfiguration_isEqual___block_invoke_2;
  v18[3] = &unk_1E62B37E8;
  id v11 = v8;
  id v19 = v11;
  id v12 = (id)[v5 appendInteger:requestedStyle counterpart:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__PBUIFakeBlurConfiguration_isEqual___block_invoke_3;
  v16[3] = &unk_1E62B3810;
  v16[4] = self;
  id v17 = v11;
  id v13 = v11;
  id v14 = (id)objc_msgSend(v5, "appendEqualsBlocks:", v16, 0);
  LOBYTE(requestedStyle) = [v5 isEqual];

  return requestedStyle;
}

uint64_t __37__PBUIFakeBlurConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8);
}

uint64_t __37__PBUIFakeBlurConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 16);
}

uint64_t __37__PBUIFakeBlurConfiguration_isEqual___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsTraitsInCollection:*(void *)(*(void *)(a1 + 40) + 24)])return 1; {
  v3 = *(void **)(*(void *)(a1 + 40) + 24);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
  return [v3 containsTraitsInCollection:v4];
}

- (NSString)description
{
  return (NSString *)[(PBUIFakeBlurConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(PBUIFakeBlurConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = PBUIStringForWallpaperVariant(self->_variant);
  [v4 appendString:v5 withName:@"variant"];

  id v6 = PBUIWallpaperStyleDescription(self->_requestedStyle);
  [v4 appendString:v6 withName:@"requestedStyle"];

  id v7 = _UIUserInterfaceStyleDescription([(UITraitCollection *)self->_traitCollection userInterfaceStyle]);
  id v8 = (id)[v4 appendObject:v7 withName:@"traitCollection.userInterfaceStyle"];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(PBUIFakeBlurConfiguration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (void).cxx_destruct
{
}

@end