@interface SBHWidget
+ (BOOL)supportsSecureCoding;
- (BOOL)iconSupportsConfiguration:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3;
- (CHSExtensionIdentity)extensionIdentity;
- (NSString)containerBundleIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (NSString)uniqueIdentifier;
- (SBHIconGridSizeClassSet)supportedGridSizeClasses;
- (SBHWidget)initWithCoder:(id)a3;
- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4;
- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5;
- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 supportedGridSizeClasses:(id)a6;
- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 supportedGridSizeClasses:(id)a5;
- (SBHWidget)initWithUniqueIdentifier:(id)a3 kind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6;
- (SBHWidget)initWithUniqueIdentifier:(id)a3 kind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 supportedGridSizeClasses:(id)a7;
- (id)chsWidgetWithGridSizeClass:(id)a3 intent:(id)a4;
- (id)copyWithSuggestionSource:(int64_t)a3;
- (id)copyWithUniqueIdentifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)suggestionSource;
- (unint64_t)hash;
- (unint64_t)priorityForIcon:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)resetDisplayName;
@end

@implementation SBHWidget

- (SBHWidget)initWithUniqueIdentifier:(id)a3 kind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 supportedGridSizeClasses:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SBHWidget;
  v17 = [(SBHWidget *)&v29 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    uniqueIdentifier = v17->_uniqueIdentifier;
    v17->_uniqueIdentifier = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    kind = v17->_kind;
    v17->_kind = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    extensionBundleIdentifier = v17->_extensionBundleIdentifier;
    v17->_extensionBundleIdentifier = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    containerBundleIdentifier = v17->_containerBundleIdentifier;
    v17->_containerBundleIdentifier = (NSString *)v24;

    v17->_suggestionSource = 0;
    uint64_t v26 = [v16 copy];
    supportedGridSizeClasses = v17->_supportedGridSizeClasses;
    v17->_supportedGridSizeClasses = (SBHIconGridSizeClassSet *)v26;
  }
  return v17;
}

- (SBHWidget)initWithUniqueIdentifier:(id)a3 kind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[SBHIconGridSizeClassSet gridSizeClassSetForAllNonDefaultGridSizeClasses];
  id v15 = [(SBHWidget *)self initWithUniqueIdentifier:v13 kind:v12 extensionBundleIdentifier:v11 containerBundleIdentifier:v10 supportedGridSizeClasses:v14];

  return v15;
}

- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 UUID];
  id v13 = [v12 UUIDString];
  id v14 = [(SBHWidget *)self initWithUniqueIdentifier:v13 kind:v11 extensionBundleIdentifier:v10 containerBundleIdentifier:v9];

  return v14;
}

- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 supportedGridSizeClasses:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F29128];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v10 UUID];
  id v16 = [v15 UUIDString];
  v17 = [(SBHWidget *)self initWithUniqueIdentifier:v16 kind:v14 extensionBundleIdentifier:v13 containerBundleIdentifier:v12 supportedGridSizeClasses:v11];

  return v17;
}

- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 UUID];
  id v10 = [v9 UUIDString];
  id v11 = [(SBHWidget *)self initWithUniqueIdentifier:v10 kind:v8 extensionBundleIdentifier:v7 containerBundleIdentifier:0];

  return v11;
}

- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 supportedGridSizeClasses:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 UUID];
  id v13 = [v12 UUIDString];
  id v14 = [(SBHWidget *)self initWithUniqueIdentifier:v13 kind:v11 extensionBundleIdentifier:v10 containerBundleIdentifier:0 supportedGridSizeClasses:v9];

  return v14;
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (!displayName)
  {
    v4 = [(SBHWidget *)self extensionBundleIdentifier];
    v5 = SBHContainingBundleRecordForWidgetWithBundleIdentifier(v4);

    if (!v5)
    {
      id v9 = SBHBundle();
      id v10 = [v9 localizedStringForKey:@"WAITING_ICON_LABEL" value:&stru_1F2FA0300 table:@"SpringBoardHome"];

      goto LABEL_9;
    }
    v6 = [v5 localizedName];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [v5 localizedShortName];
    }
    id v11 = v8;

    id v12 = (NSString *)[v11 copy];
    id v13 = self->_displayName;
    self->_displayName = v12;

    displayName = self->_displayName;
  }
  id v10 = displayName;
LABEL_9:
  return v10;
}

- (void)resetDisplayName
{
  displayName = self->_displayName;
  self->_displayName = 0;
}

- (NSString)containerBundleIdentifier
{
  containerBundleIdentifier = self->_containerBundleIdentifier;
  if (!containerBundleIdentifier)
  {
    v4 = [(SBHWidget *)self extensionBundleIdentifier];
    v5 = SBHContainingBundleIdentifierForWidgetWithBundleIdentifier(v4);
    v6 = (NSString *)[v5 copy];
    id v7 = self->_containerBundleIdentifier;
    self->_containerBundleIdentifier = v6;

    containerBundleIdentifier = self->_containerBundleIdentifier;
  }
  return containerBundleIdentifier;
}

- (CHSExtensionIdentity)extensionIdentity
{
  id v3 = objc_alloc(MEMORY[0x1E4F58CC0]);
  v4 = [(SBHWidget *)self extensionBundleIdentifier];
  v5 = [(SBHWidget *)self containerBundleIdentifier];
  v6 = (void *)[v3 initWithExtensionBundleIdentifier:v4 containerBundleIdentifier:v5 deviceIdentifier:0];

  return (CHSExtensionIdentity *)v6;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  v5 = [(SBHWidget *)self extensionIdentity];
  v6 = [v4 extensionIdentity];
  int v7 = BSEqualObjects();

  if (v7)
  {
    id v8 = [(SBHWidget *)self kind];
    id v9 = [v4 kind];
    char v10 = BSEqualObjects();
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)chsWidgetWithGridSizeClass:(id)a3 intent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBHWidget *)self kind];
  id v9 = [(SBHWidget *)self extensionBundleIdentifier];
  char v10 = [(SBHWidget *)self containerBundleIdentifier];
  uint64_t v11 = CHSWidgetFamilyForSBHIconGridSizeClass(v7);

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F58CC0]) initWithExtensionBundleIdentifier:v9 containerBundleIdentifier:v10 deviceIdentifier:0];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F58DD8]) initWithExtensionIdentity:v12 kind:v8 family:v11 intent:v6 activityIdentifier:0];

  return v13;
}

- (id)copyWithUniqueIdentifier
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [v4 UUIDString];
  id v6 = (void *)[v3 initWithUniqueIdentifier:v5 kind:self->_kind extensionBundleIdentifier:self->_extensionBundleIdentifier containerBundleIdentifier:self->_containerBundleIdentifier supportedGridSizeClasses:self->_supportedGridSizeClasses];

  v6[6] = self->_suggestionSource;
  return v6;
}

- (id)copyWithSuggestionSource:(int64_t)a3
{
  if (self->_suggestionSource == a3)
  {
    return self;
  }
  else
  {
    id result = (id)[objc_alloc((Class)objc_opt_class()) initWithUniqueIdentifier:self->_uniqueIdentifier kind:self->_kind extensionBundleIdentifier:self->_extensionBundleIdentifier containerBundleIdentifier:self->_containerBundleIdentifier supportedGridSizeClasses:self->_supportedGridSizeClasses];
    *((void *)result + 6) = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBHWidget *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      if (BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && self->_suggestionSource == v7->_suggestionSource)
      {
        char v8 = BSEqualObjects();
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_kind hash] + v3;
  NSUInteger v5 = [(NSString *)self->_extensionBundleIdentifier hash];
  supportedGridSizeClasses = self->_supportedGridSizeClasses;
  NSUInteger v7 = v4 + v5 + self->_suggestionSource;
  return v7 + [(SBHIconGridSizeClassSet *)supportedGridSizeClasses hash];
}

- (NSString)description
{
  return (NSString *)[(SBHWidget *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHWidget *)self succinctDescriptionBuilder];
  NSUInteger v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  NSUInteger v3 = [(SBHWidget *)self descriptionBuilderWithMultilinePrefix:a3];
  NSUInteger v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  NSUInteger v4 = [(SBHWidget *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_uniqueIdentifier withName:@"uniqueIdentifier"];
  id v6 = (id)[v4 appendObject:self->_kind withName:@"kind"];
  id v7 = (id)[v4 appendObject:self->_extensionBundleIdentifier withName:@"extensionBundleIdentifier"];
  char v8 = [(SBHWidget *)self displayName];
  id v9 = (id)[v4 appendObject:v8 withName:@"displayName"];

  id v10 = (id)[v4 appendInteger:self->_suggestionSource withName:@"suggestionSource"];
  uint64_t v11 = [(SBHWidget *)self supportedGridSizeClasses];
  id v12 = (id)[v4 appendObject:v11 withName:@"supportedGridSizeClasses"];

  return v4;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  id v10 = [(SBHWidget *)self containerBundleIdentifier];
  uint64_t v11 = SBHGetApplicationIconImage(v10, 0, v9, v8, v7);

  return v11;
}

- (BOOL)iconSupportsConfiguration:(id)a3
{
  return 1;
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
  [v5 encodeInteger:self->_suggestionSource forKey:@"suggestionSource"];
  [v5 encodeObject:self->_supportedGridSizeClasses forKey:@"supportedGridSizeClasses"];
}

- (SBHWidget)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBHWidget;
  id v5 = [(SBHWidget *)&v23 init];
  if (v5)
  {
    double v6 = self;
    double v7 = [v4 decodeObjectOfClass:v6 forKey:@"uniqueIdentifier"];
    uint64_t v8 = [v7 copy];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    id v10 = self;
    uint64_t v11 = [v4 decodeObjectOfClass:v10 forKey:@"kind"];
    uint64_t v12 = [v11 copy];
    kind = v5->_kind;
    v5->_kind = (NSString *)v12;

    id v14 = self;
    id v15 = [v4 decodeObjectOfClass:v14 forKey:@"extensionBundleIdentifier"];
    uint64_t v16 = [v15 copy];
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v16;

    v5->_suggestionSource = [v4 decodeIntegerForKey:@"suggestionSource"];
    uint64_t v18 = self;
    v19 = [v4 decodeObjectOfClass:v18 forKey:@"supportedGridSizeClasses"];
    uint64_t v20 = [v19 copy];
    supportedGridSizeClasses = v5->_supportedGridSizeClasses;
    v5->_supportedGridSizeClasses = (SBHIconGridSizeClassSet *)v20;
  }
  return v5;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (int64_t)suggestionSource
{
  return self->_suggestionSource;
}

- (SBHIconGridSizeClassSet)supportedGridSizeClasses
{
  return self->_supportedGridSizeClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
}

@end