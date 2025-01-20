@interface SBCaptureExtensionWorkspaceEntity
- (BOOL)_supportsLayoutRole:(int64_t)a3;
- (BOOL)isCaptureExtensionEntity;
- (BOOL)isEqual:(id)a3;
- (CSHostableEntity)hostableEntity;
- (NSString)bundleIdentifier;
- (SBCaptureExtensionWorkspaceEntity)initWithBundleIdentifier:(id)a3 hostableEntity:(id)a4;
- (id)_generator;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SBCaptureExtensionWorkspaceEntity

- (SBCaptureExtensionWorkspaceEntity)initWithBundleIdentifier:(id)a3 hostableEntity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [NSString stringWithFormat:@"CaptureExtension-%@", v6];
  v13.receiver = self;
  v13.super_class = (Class)SBCaptureExtensionWorkspaceEntity;
  v9 = [(SBWorkspaceEntity *)&v13 initWithIdentifier:v8 displayChangeSettings:0];

  if (v9)
  {
    uint64_t v10 = [v6 copy];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_hostableEntity, a4);
  }

  return v9;
}

- (BOOL)_supportsLayoutRole:(int64_t)a3
{
  return a3 == 1;
}

- (id)_generator
{
  v3 = (void *)[(NSString *)self->_bundleIdentifier copy];
  v4 = self->_hostableEntity;
  uint64_t v5 = objc_opt_class();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__SBCaptureExtensionWorkspaceEntity__generator__block_invoke;
  v11[3] = &unk_1E6B0C658;
  objc_super v13 = v4;
  uint64_t v14 = v5;
  id v12 = v3;
  id v6 = v4;
  id v7 = v3;
  v8 = (void *)MEMORY[0x1D948C7A0](v11);
  v9 = (void *)MEMORY[0x1D948C7A0]();

  return v9;
}

id __47__SBCaptureExtensionWorkspaceEntity__generator__block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(*(Class *)(a1 + 48)) initWithBundleIdentifier:*(void *)(a1 + 32) hostableEntity:*(void *)(a1 + 40)];
  return v1;
}

- (BOOL)isCaptureExtensionEntity
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  v8 = v7;

  if (v8 == self)
  {
    char v9 = 1;
  }
  else if (v8 && [(NSString *)v8->_bundleIdentifier isEqualToString:self->_bundleIdentifier])
  {
    char v9 = [(CSHostableEntity *)v8->_hostableEntity isEqual:self->_hostableEntity];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_bundleIdentifier hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBCaptureExtensionWorkspaceEntity;
  id v4 = [(SBWorkspaceEntity *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_bundleIdentifier copy];
  id v6 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v5;

  objc_storeStrong((id *)v4 + 6, self->_hostableEntity);
  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (CSHostableEntity)hostableEntity
{
  return self->_hostableEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostableEntity, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end