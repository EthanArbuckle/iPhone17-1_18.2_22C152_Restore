@interface SBAppClipPlaceholderWorkspaceEntity
+ (BOOL)isAppClipUpdateAvailableForBundleIdentifier:(id)a3;
- (BOOL)_supportsLayoutRole:(int64_t)a3;
- (BOOL)isAppClipPlaceholderEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsUpdate;
- (BOOL)supportsPresentationAtAnySize;
- (BOOL)wantsExclusiveForeground;
- (Class)viewControllerClass;
- (NSString)bundleIdentifier;
- (NSString)futureSceneIdentifier;
- (SBAppClipPlaceholderWorkspaceEntity)initWithBundleIdentifier:(id)a3 futureSceneIdentifier:(id)a4 needsUpdate:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)entityGenerator;
- (unint64_t)hash;
@end

@implementation SBAppClipPlaceholderWorkspaceEntity

+ (BOOL)isAppClipUpdateAvailableForBundleIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = (objc_class *)MEMORY[0x1E4F223C8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];

  v6 = [v5 appClipMetadata];

  BOOL v8 = [v5 updateAvailability] == 1 && v6 != 0;
  return v8;
}

- (SBAppClipPlaceholderWorkspaceEntity)initWithBundleIdentifier:(id)a3 futureSceneIdentifier:(id)a4 needsUpdate:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (v10)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBAppClipPlaceholderWorkspaceEntity.m", 27, @"Invalid parameter not satisfying: %@", @"futureSceneIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SBAppClipPlaceholderWorkspaceEntity.m", 28, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

LABEL_3:
  v11 = [NSString stringWithFormat:@"Placeholder-%@", v10];
  v20.receiver = self;
  v20.super_class = (Class)SBAppClipPlaceholderWorkspaceEntity;
  v12 = [(SBWorkspaceEntity *)&v20 initWithIdentifier:v11 displayChangeSettings:0];

  if (v12)
  {
    uint64_t v13 = [v9 copy];
    bundleIdentifier = v12->_bundleIdentifier;
    v12->_bundleIdentifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    futureSceneIdentifier = v12->_futureSceneIdentifier;
    v12->_futureSceneIdentifier = (NSString *)v15;

    v12->_needsUpdate = a5;
  }

  return v12;
}

- (BOOL)_supportsLayoutRole:(int64_t)a3
{
  return a3 == 1;
}

- (BOOL)supportsPresentationAtAnySize
{
  return 0;
}

- (BOOL)wantsExclusiveForeground
{
  return 0;
}

- (id)entityGenerator
{
  id v4 = self->_bundleIdentifier;
  v5 = self->_futureSceneIdentifier;
  v6 = v5;
  BOOL needsUpdate = self->_needsUpdate;
  if (v4)
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SBAppClipPlaceholderWorkspaceEntity.m", 56, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"SBAppClipPlaceholderWorkspaceEntity.m", 57, @"Invalid parameter not satisfying: %@", @"futureSceneIdentifier" object file lineNumber description];

LABEL_3:
  uint64_t v8 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __54__SBAppClipPlaceholderWorkspaceEntity_entityGenerator__block_invoke;
  v16[3] = &unk_1E6AFB370;
  v18 = v6;
  uint64_t v19 = v8;
  v17 = v4;
  BOOL v20 = needsUpdate;
  id v9 = v6;
  id v10 = v4;
  v11 = (void *)MEMORY[0x1D948C7A0](v16);
  v12 = (void *)MEMORY[0x1D948C7A0]();

  return v12;
}

id __54__SBAppClipPlaceholderWorkspaceEntity_entityGenerator__block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(*(Class *)(a1 + 48)) initWithBundleIdentifier:*(void *)(a1 + 32) futureSceneIdentifier:*(void *)(a1 + 40) needsUpdate:*(unsigned __int8 *)(a1 + 56)];
  return v1;
}

- (Class)viewControllerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAppClipPlaceholderEntity
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBAppClipPlaceholderWorkspaceEntity *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      bundleIdentifier = self->_bundleIdentifier;
      v7 = [(SBAppClipPlaceholderWorkspaceEntity *)v5 bundleIdentifier];
      if ([(NSString *)bundleIdentifier isEqualToString:v7])
      {
        futureSceneIdentifier = self->_futureSceneIdentifier;
        id v9 = [(SBAppClipPlaceholderWorkspaceEntity *)v5 futureSceneIdentifier];
        char v10 = [(NSString *)futureSceneIdentifier isEqualToString:v9];
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
  return [(NSString *)self->_futureSceneIdentifier hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBAppClipPlaceholderWorkspaceEntity;
  id v4 = [(SBWorkspaceEntity *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_bundleIdentifier copy];
  v6 = (void *)v4[6];
  v4[6] = v5;

  uint64_t v7 = [(NSString *)self->_futureSceneIdentifier copy];
  uint64_t v8 = (void *)v4[7];
  v4[7] = v7;

  *((unsigned char *)v4 + 40) = self->_needsUpdate;
  return v4;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)futureSceneIdentifier
{
  return self->_futureSceneIdentifier;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_futureSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end