@interface SBSFocusModesHomeScreenSettingsRequest
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)appendExistingPages;
- (BOOL)excludeWallpaper;
- (NSArray)listsToAdd;
- (NSArray)listsToRemove;
- (NSArray)proactivePages;
- (NSString)description;
- (NSString)focusModeIdentifier;
- (SBSFocusModesHomeScreenSettingsRequest)initWithBSXPCCoder:(id)a3;
- (SBSFocusModesHomeScreenSettingsRequest)initWithFocusModeIdentifier:(id)a3;
- (double)snapshotDelay;
- (double)snapshotScale;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setAppendExistingPages:(BOOL)a3;
- (void)setExcludeWallpaper:(BOOL)a3;
- (void)setListsToAdd:(id)a3;
- (void)setListsToRemove:(id)a3;
- (void)setProactivePages:(id)a3;
- (void)setSnapshotDelay:(double)a3;
- (void)setSnapshotScale:(double)a3;
@end

@implementation SBSFocusModesHomeScreenSettingsRequest

- (SBSFocusModesHomeScreenSettingsRequest)initWithFocusModeIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSFocusModesHomeScreenSettingsRequest;
  v5 = [(SBSFocusModesHomeScreenSettingsRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    focusModeIdentifier = v5->_focusModeIdentifier;
    v5->_focusModeIdentifier = (NSString *)v6;

    v5->_snapshotScale = 0.5;
  }

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  focusModeIdentifier = self->_focusModeIdentifier;
  id v5 = a3;
  [v5 encodeObject:focusModeIdentifier forKey:@"focusModeIdentifier"];
  [v5 encodeCollection:self->_listsToAdd forKey:@"listsToAdd"];
  [v5 encodeCollection:self->_listsToRemove forKey:@"listsToRemove"];
  [v5 encodeObject:self->_proactivePages forKey:@"proactivePages"];
  [v5 encodeDouble:@"snapshotDelay" forKey:self->_snapshotDelay];
  [v5 encodeBool:self->_appendExistingPages forKey:@"appendExistingPages"];
  [v5 encodeBool:self->_excludeWallpaper forKey:@"excludeWallpaper"];
  [v5 encodeDouble:@"snapshotScale" forKey:self->_snapshotScale];
}

- (SBSFocusModesHomeScreenSettingsRequest)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeStringForKey:@"focusModeIdentifier"];
  if (v5)
  {
    uint64_t v6 = [(SBSFocusModesHomeScreenSettingsRequest *)self initWithFocusModeIdentifier:v5];
    uint64_t v7 = objc_opt_class();
    v8 = [v4 decodeCollectionOfClass:v7 containingClass:objc_opt_class() forKey:@"listsToAdd"];
    [(SBSFocusModesHomeScreenSettingsRequest *)v6 setListsToAdd:v8];
    uint64_t v9 = objc_opt_class();
    v10 = [v4 decodeCollectionOfClass:v9 containingClass:objc_opt_class() forKey:@"listsToRemove"];
    [(SBSFocusModesHomeScreenSettingsRequest *)v6 setListsToRemove:v10];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v11 = (void *)getATXHomeScreenPageClass_softClass;
    uint64_t v20 = getATXHomeScreenPageClass_softClass;
    if (!getATXHomeScreenPageClass_softClass)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __getATXHomeScreenPageClass_block_invoke;
      v16[3] = &unk_1E566BD10;
      v16[4] = &v17;
      __getATXHomeScreenPageClass_block_invoke((uint64_t)v16);
      v11 = (void *)v18[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v17, 8);
    if (v12)
    {
      v13 = [v4 decodeCollectionOfClass:objc_opt_class() containingClass:v12 forKey:@"proactivePages"];
      [(SBSFocusModesHomeScreenSettingsRequest *)v6 setProactivePages:v13];
    }
    else
    {
      v13 = SBLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[SBSFocusModesHomeScreenSettingsRequest initWithBSXPCCoder:](v13);
      }
    }

    [v4 decodeDoubleForKey:@"snapshotDelay"];
    -[SBSFocusModesHomeScreenSettingsRequest setSnapshotDelay:](v6, "setSnapshotDelay:");
    -[SBSFocusModesHomeScreenSettingsRequest setAppendExistingPages:](v6, "setAppendExistingPages:", [v4 decodeBoolForKey:@"appendExistingPages"]);
    -[SBSFocusModesHomeScreenSettingsRequest setExcludeWallpaper:](v6, "setExcludeWallpaper:", [v4 decodeBoolForKey:@"excludeWallpaper"]);
    [v4 decodeDoubleForKey:@"snapshotScale"];
    -[SBSFocusModesHomeScreenSettingsRequest setSnapshotScale:](v6, "setSnapshotScale:");
    self = v6;

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)description
{
  return (NSString *)[(SBSFocusModesHomeScreenSettingsRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSFocusModesHomeScreenSettingsRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSFocusModesHomeScreenSettingsRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSFocusModesHomeScreenSettingsRequest *)self succinctDescriptionBuilder];
  id v5 = [(SBSFocusModesHomeScreenSettingsRequest *)self focusModeIdentifier];
  [v4 appendString:v5 withName:@"focusModeIdentifier"];

  uint64_t v6 = [(SBSFocusModesHomeScreenSettingsRequest *)self listsToAdd];
  [v4 appendArraySection:v6 withName:@"listsToAdd" skipIfEmpty:0];

  uint64_t v7 = [(SBSFocusModesHomeScreenSettingsRequest *)self listsToRemove];
  [v4 appendArraySection:v7 withName:@"listsToRemove" skipIfEmpty:0];

  return v4;
}

- (NSString)focusModeIdentifier
{
  return self->_focusModeIdentifier;
}

- (NSArray)listsToAdd
{
  return self->_listsToAdd;
}

- (void)setListsToAdd:(id)a3
{
}

- (NSArray)listsToRemove
{
  return self->_listsToRemove;
}

- (void)setListsToRemove:(id)a3
{
}

- (NSArray)proactivePages
{
  return self->_proactivePages;
}

- (void)setProactivePages:(id)a3
{
}

- (double)snapshotDelay
{
  return self->_snapshotDelay;
}

- (void)setSnapshotDelay:(double)a3
{
  self->_snapshotDelay = a3;
}

- (BOOL)appendExistingPages
{
  return self->_appendExistingPages;
}

- (void)setAppendExistingPages:(BOOL)a3
{
  self->_appendExistingPages = a3;
}

- (BOOL)excludeWallpaper
{
  return self->_excludeWallpaper;
}

- (void)setExcludeWallpaper:(BOOL)a3
{
  self->_excludeWallpaper = a3;
}

- (double)snapshotScale
{
  return self->_snapshotScale;
}

- (void)setSnapshotScale:(double)a3
{
  self->_snapshotScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactivePages, 0);
  objc_storeStrong((id *)&self->_listsToRemove, 0);
  objc_storeStrong((id *)&self->_listsToAdd, 0);
  objc_storeStrong((id *)&self->_focusModeIdentifier, 0);
}

- (void)initWithBSXPCCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18FBC5000, log, OS_LOG_TYPE_FAULT, "Could not load ATXHomeScreenPage from SpringBoardServices", v1, 2u);
}

@end