@interface PRPosterConfiguredProperties
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)configuredPropertiesSanitizedForPassingToExtension:(id)a3;
+ (id)defaultConfiguredPropertiesForRole:(id)a3;
- (BOOL)_isImmutable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguredProperties:(id)a3;
- (BOOL)isEqualToConfiguredProperties:(id)a3 comparingPropertiesAffectingSnapshotsOnly:(BOOL)a4;
- (NSDictionary)userInfo;
- (NSString)description;
- (PRPosterAmbientConfiguration)ambientConfiguration;
- (PRPosterAmbientWidgetLayout)ambientWidgetLayout;
- (PRPosterColorVariationsConfiguration)colorVariationsConfiguration;
- (PRPosterComplicationLayout)complicationLayout;
- (PRPosterConfiguredProperties)init;
- (PRPosterConfiguredProperties)initWithAmbientConfiguration:(id)a3 widgetLayout:(id)a4 otherMetadata:(id)a5 userInfo:(id)a6;
- (PRPosterConfiguredProperties)initWithBSXPCCoder:(id)a3;
- (PRPosterConfiguredProperties)initWithCoder:(id)a3;
- (PRPosterConfiguredProperties)initWithTitleStyleConfiguration:(id)a3 focusConfiguration:(id)a4 complicationLayout:(id)a5 renderingConfiguration:(id)a6 homeScreenConfiguration:(id)a7 colorVariationsConfiguration:(id)a8 quickActionsConfiguration:(id)a9 ambientConfiguration:(id)a10 ambientWidgetLayout:(id)a11 suggestionMetadata:(id)a12 otherMetadata:(id)a13 userInfo:(id)a14;
- (PRPosterConfiguredProperties)initWithTitleStyleConfiguration:(id)a3 focusConfiguration:(id)a4 complicationLayout:(id)a5 renderingConfiguration:(id)a6 homeScreenConfiguration:(id)a7 colorVariationsConfiguration:(id)a8 quickActionsConfiguration:(id)a9 suggestionMetadata:(id)a10 otherMetadata:(id)a11 userInfo:(id)a12;
- (PRPosterFocusConfiguration)focusConfiguration;
- (PRPosterHomeScreenConfiguration)homeScreenConfiguration;
- (PRPosterMetadata)otherMetadata;
- (PRPosterQuickActionsConfiguration)quickActionsConfiguration;
- (PRPosterRenderingConfiguration)renderingConfiguration;
- (PRPosterSuggestionMetadata)suggestionMetadata;
- (PRPosterTitleStyleConfiguration)titleStyleConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)persistenceIdentifierWithComplications:(BOOL)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAmbientConfiguration:(id)a3;
- (void)setAmbientWidgetLayout:(id)a3;
- (void)setColorVariationsConfiguration:(id)a3;
- (void)setComplicationLayout:(id)a3;
- (void)setFocusConfiguration:(id)a3;
- (void)setHomeScreenConfiguration:(id)a3;
- (void)setOtherMetadata:(id)a3;
- (void)setQuickActionsConfiguration:(id)a3;
- (void)setRenderingConfiguration:(id)a3;
- (void)setSuggestionMetadata:(id)a3;
- (void)setTitleStyleConfiguration:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation PRPosterConfiguredProperties

- (PRPosterRenderingConfiguration)renderingConfiguration
{
  return self->_renderingConfiguration;
}

- (PRPosterHomeScreenConfiguration)homeScreenConfiguration
{
  return self->_homeScreenConfiguration;
}

+ (id)configuredPropertiesSanitizedForPassingToExtension:(id)a3
{
  id v3 = a3;
  v4 = [PRPosterConfiguredProperties alloc];
  v5 = [v3 titleStyleConfiguration];
  v6 = [v3 colorVariationsConfiguration];
  v7 = [v3 userInfo];

  v8 = [(PRPosterConfiguredProperties *)v4 initWithTitleStyleConfiguration:v5 focusConfiguration:0 complicationLayout:0 renderingConfiguration:0 homeScreenConfiguration:0 colorVariationsConfiguration:v6 quickActionsConfiguration:0 ambientConfiguration:0 ambientWidgetLayout:0 suggestionMetadata:0 otherMetadata:0 userInfo:v7];
  return v8;
}

+ (id)defaultConfiguredPropertiesForRole:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"PRPosterRoleLockScreen"])
  {
    v4 = +[PRPosterTimeFontConfiguration defaultConfiguration];
    v5 = [PRPosterTitleStyleConfiguration alloc];
    v6 = +[PRPosterTitleStyleConfiguration defaultTitleColor];
    +[PRPosterTitleStyleConfiguration defaultContentsLuminance];
    LOBYTE(v12) = 1;
    v7 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](v5, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v4, 0, 0, v6, 0, 0, v12, 0);

    v8 = [[PRPosterConfiguredProperties alloc] initWithTitleStyleConfiguration:v7 focusConfiguration:0 complicationLayout:0 renderingConfiguration:0 homeScreenConfiguration:0 colorVariationsConfiguration:0 quickActionsConfiguration:0 suggestionMetadata:0 otherMetadata:0 userInfo:0];
  }
  else if ([v3 isEqual:@"PRPosterRoleAmbient"])
  {
    v9 = [PRPosterConfiguredProperties alloc];
    v10 = [[PRPosterAmbientConfiguration alloc] initWithSupportedDataLayout:0];
    v8 = [(PRPosterConfiguredProperties *)v9 initWithAmbientConfiguration:v10 widgetLayout:0 otherMetadata:0 userInfo:0];
  }
  else
  {
    v8 = (PRPosterConfiguredProperties *)objc_opt_new();
  }

  return v8;
}

- (PRPosterConfiguredProperties)initWithTitleStyleConfiguration:(id)a3 focusConfiguration:(id)a4 complicationLayout:(id)a5 renderingConfiguration:(id)a6 homeScreenConfiguration:(id)a7 colorVariationsConfiguration:(id)a8 quickActionsConfiguration:(id)a9 ambientConfiguration:(id)a10 ambientWidgetLayout:(id)a11 suggestionMetadata:(id)a12 otherMetadata:(id)a13 userInfo:(id)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v47 = a6;
  id v46 = a7;
  id v45 = a8;
  v22 = v20;
  id v44 = a9;
  id v23 = a10;
  id v24 = a11;
  v25 = v21;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  v48.receiver = self;
  v48.super_class = (Class)PRPosterConfiguredProperties;
  v29 = [(PRPosterConfiguredProperties *)&v48 init];
  if (v29)
  {
    v30 = (void *)[v19 copy];
    [(PRPosterConfiguredProperties *)v29 setTitleStyleConfiguration:v30];

    v31 = (void *)[v22 copy];
    [(PRPosterConfiguredProperties *)v29 setFocusConfiguration:v31];

    v32 = (void *)[v25 copy];
    [(PRPosterConfiguredProperties *)v29 setComplicationLayout:v32];

    v33 = (void *)[v47 copy];
    [(PRPosterConfiguredProperties *)v29 setRenderingConfiguration:v33];

    v34 = (void *)[v46 copy];
    [(PRPosterConfiguredProperties *)v29 setHomeScreenConfiguration:v34];

    v35 = (void *)[v45 copy];
    [(PRPosterConfiguredProperties *)v29 setColorVariationsConfiguration:v35];

    v36 = (void *)[v44 copy];
    [(PRPosterConfiguredProperties *)v29 setQuickActionsConfiguration:v36];

    v37 = (void *)[v23 copy];
    [(PRPosterConfiguredProperties *)v29 setAmbientConfiguration:v37];

    v38 = (void *)[v24 copy];
    [(PRPosterConfiguredProperties *)v29 setAmbientWidgetLayout:v38];

    v39 = (void *)[v26 copy];
    [(PRPosterConfiguredProperties *)v29 setSuggestionMetadata:v39];

    v40 = (void *)[v27 copy];
    [(PRPosterConfiguredProperties *)v29 setOtherMetadata:v40];

    v41 = (void *)[v28 copy];
    [(PRPosterConfiguredProperties *)v29 setUserInfo:v41];
  }
  return v29;
}

- (PRPosterConfiguredProperties)initWithTitleStyleConfiguration:(id)a3 focusConfiguration:(id)a4 complicationLayout:(id)a5 renderingConfiguration:(id)a6 homeScreenConfiguration:(id)a7 colorVariationsConfiguration:(id)a8 quickActionsConfiguration:(id)a9 suggestionMetadata:(id)a10 otherMetadata:(id)a11 userInfo:(id)a12
{
  id v17 = a3;
  id v39 = a4;
  id v38 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v40.receiver = self;
  v40.super_class = (Class)PRPosterConfiguredProperties;
  v25 = [(PRPosterConfiguredProperties *)&v40 init];
  if (v25)
  {
    id v26 = (void *)[v17 copy];
    [(PRPosterConfiguredProperties *)v25 setTitleStyleConfiguration:v26];

    id v27 = (void *)[v39 copy];
    [(PRPosterConfiguredProperties *)v25 setFocusConfiguration:v27];

    id v28 = (void *)[v38 copy];
    [(PRPosterConfiguredProperties *)v25 setComplicationLayout:v28];

    v29 = (void *)[v18 copy];
    [(PRPosterConfiguredProperties *)v25 setRenderingConfiguration:v29];

    v30 = (void *)[v19 copy];
    [(PRPosterConfiguredProperties *)v25 setHomeScreenConfiguration:v30];

    v31 = (void *)[v20 copy];
    [(PRPosterConfiguredProperties *)v25 setColorVariationsConfiguration:v31];

    v32 = (void *)[v21 copy];
    [(PRPosterConfiguredProperties *)v25 setQuickActionsConfiguration:v32];

    v33 = (void *)[v22 copy];
    [(PRPosterConfiguredProperties *)v25 setSuggestionMetadata:v33];

    v34 = (void *)[v23 copy];
    [(PRPosterConfiguredProperties *)v25 setOtherMetadata:v34];

    v35 = (void *)[v24 copy];
    [(PRPosterConfiguredProperties *)v25 setUserInfo:v35];
  }
  return v25;
}

- (PRPosterConfiguredProperties)initWithAmbientConfiguration:(id)a3 widgetLayout:(id)a4 otherMetadata:(id)a5 userInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PRPosterConfiguredProperties;
  v14 = [(PRPosterConfiguredProperties *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(PRPosterConfiguredProperties *)v14 setAmbientConfiguration:v10];
    [(PRPosterConfiguredProperties *)v15 setAmbientWidgetLayout:v11];
    [(PRPosterConfiguredProperties *)v15 setOtherMetadata:v12];
    [(PRPosterConfiguredProperties *)v15 setUserInfo:v13];
  }

  return v15;
}

- (PRPosterConfiguredProperties)init
{
  return [(PRPosterConfiguredProperties *)self initWithTitleStyleConfiguration:0 focusConfiguration:0 complicationLayout:0 renderingConfiguration:0 homeScreenConfiguration:0 colorVariationsConfiguration:0 quickActionsConfiguration:0 ambientConfiguration:0 ambientWidgetLayout:0 suggestionMetadata:0 otherMetadata:0 userInfo:0];
}

- (PRPosterConfiguredProperties)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = self;
  v30 = [v3 decodeObjectOfClass:v4 forKey:@"titleStyleConfiguration"];

  v5 = self;
  v25 = [v3 decodeObjectOfClass:v5 forKey:@"focusConfiguration"];

  v6 = self;
  v29 = [v3 decodeObjectOfClass:v6 forKey:@"complicationLayout"];

  v7 = self;
  v8 = [v3 decodeObjectOfClass:v7 forKey:@"renderingConfiguration"];

  v9 = self;
  id v10 = [v3 decodeObjectOfClass:v9 forKey:@"homeScreenConfiguration"];

  id v11 = self;
  id v26 = [v3 decodeObjectOfClass:v11 forKey:@"colorVariationsConfiguration"];

  id v12 = self;
  id v13 = [v3 decodeObjectOfClass:v12 forKey:@"quickActionsConfiguration"];

  v14 = self;
  v15 = [v3 decodeObjectOfClass:v14 forKey:@"ambientConfiguration"];

  v16 = self;
  id v24 = [v3 decodeObjectOfClass:v16 forKey:@"suggestionMetadata"];

  objc_super v17 = self;
  id v18 = [v3 decodeObjectOfClass:v17 forKey:@"otherMetadata"];

  id v19 = self;
  id v20 = [v3 decodeObjectOfClass:v19 forKey:@"ambientWidgetLayout"];

  id v21 = self;
  id v22 = [v3 decodeObjectOfClass:v21 forKey:@"userInfo"];

  id v28 = [(PRPosterConfiguredProperties *)self initWithTitleStyleConfiguration:v30 focusConfiguration:v25 complicationLayout:v29 renderingConfiguration:v8 homeScreenConfiguration:v10 colorVariationsConfiguration:v26 quickActionsConfiguration:v13 ambientConfiguration:v15 ambientWidgetLayout:v20 suggestionMetadata:v24 otherMetadata:v18 userInfo:v22];
  return v28;
}

- (BOOL)_isImmutable
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PRPosterConfiguredProperties *)self titleStyleConfiguration];
  [v4 encodeObject:v5 forKey:@"titleStyleConfiguration"];

  v6 = [(PRPosterConfiguredProperties *)self focusConfiguration];
  [v4 encodeObject:v6 forKey:@"focusConfiguration"];

  v7 = [(PRPosterConfiguredProperties *)self complicationLayout];
  [v4 encodeObject:v7 forKey:@"complicationLayout"];

  v8 = [(PRPosterConfiguredProperties *)self renderingConfiguration];
  [v4 encodeObject:v8 forKey:@"renderingConfiguration"];

  v9 = [(PRPosterConfiguredProperties *)self homeScreenConfiguration];
  [v4 encodeObject:v9 forKey:@"homeScreenConfiguration"];

  id v10 = [(PRPosterConfiguredProperties *)self colorVariationsConfiguration];
  [v4 encodeObject:v10 forKey:@"colorVariationsConfiguration"];

  id v11 = [(PRPosterConfiguredProperties *)self quickActionsConfiguration];
  [v4 encodeObject:v11 forKey:@"quickActionsConfiguration"];

  id v12 = [(PRPosterConfiguredProperties *)self ambientConfiguration];
  [v4 encodeObject:v12 forKey:@"ambientConfiguration"];

  id v13 = [(PRPosterConfiguredProperties *)self ambientWidgetLayout];
  [v4 encodeObject:v13 forKey:@"ambientWidgetLayout"];

  v14 = [(PRPosterConfiguredProperties *)self suggestionMetadata];
  [v4 encodeObject:v14 forKey:@"suggestionMetadata"];

  v15 = [(PRPosterConfiguredProperties *)self otherMetadata];
  [v4 encodeObject:v15 forKey:@"otherMetadata"];

  id v16 = [(PRPosterConfiguredProperties *)self userInfo];
  [v4 encodeObject:v16 forKey:@"userInfo"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v17 = [PRPosterConfiguredProperties alloc];
  id v16 = [(PRPosterConfiguredProperties *)self titleStyleConfiguration];
  v15 = [(PRPosterConfiguredProperties *)self focusConfiguration];
  id v4 = [(PRPosterConfiguredProperties *)self complicationLayout];
  v5 = [(PRPosterConfiguredProperties *)self renderingConfiguration];
  v14 = [(PRPosterConfiguredProperties *)self homeScreenConfiguration];
  id v13 = [(PRPosterConfiguredProperties *)self colorVariationsConfiguration];
  v6 = [(PRPosterConfiguredProperties *)self quickActionsConfiguration];
  v7 = [(PRPosterConfiguredProperties *)self ambientConfiguration];
  v8 = [(PRPosterConfiguredProperties *)self ambientWidgetLayout];
  v9 = [(PRPosterConfiguredProperties *)self suggestionMetadata];
  id v10 = [(PRPosterConfiguredProperties *)self otherMetadata];
  id v11 = [(PRPosterConfiguredProperties *)self userInfo];
  id v18 = [(PRPosterConfiguredProperties *)v17 initWithTitleStyleConfiguration:v16 focusConfiguration:v15 complicationLayout:v4 renderingConfiguration:v5 homeScreenConfiguration:v14 colorVariationsConfiguration:v13 quickActionsConfiguration:v6 ambientConfiguration:v7 ambientWidgetLayout:v8 suggestionMetadata:v9 otherMetadata:v10 userInfo:v11];

  return v18;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v17 = [PRPosterMutableConfiguredProperties alloc];
  id v16 = [(PRPosterConfiguredProperties *)self titleStyleConfiguration];
  v15 = [(PRPosterConfiguredProperties *)self focusConfiguration];
  id v4 = [(PRPosterConfiguredProperties *)self complicationLayout];
  v5 = [(PRPosterConfiguredProperties *)self renderingConfiguration];
  v14 = [(PRPosterConfiguredProperties *)self homeScreenConfiguration];
  id v13 = [(PRPosterConfiguredProperties *)self colorVariationsConfiguration];
  v6 = [(PRPosterConfiguredProperties *)self quickActionsConfiguration];
  v7 = [(PRPosterConfiguredProperties *)self ambientConfiguration];
  v8 = [(PRPosterConfiguredProperties *)self ambientWidgetLayout];
  v9 = [(PRPosterConfiguredProperties *)self suggestionMetadata];
  id v10 = [(PRPosterConfiguredProperties *)self otherMetadata];
  id v11 = [(PRPosterConfiguredProperties *)self userInfo];
  id v18 = [(PRPosterConfiguredProperties *)v17 initWithTitleStyleConfiguration:v16 focusConfiguration:v15 complicationLayout:v4 renderingConfiguration:v5 homeScreenConfiguration:v14 colorVariationsConfiguration:v13 quickActionsConfiguration:v6 ambientConfiguration:v7 ambientWidgetLayout:v8 suggestionMetadata:v9 otherMetadata:v10 userInfo:v11];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterConfiguredProperties *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PRPosterConfiguredProperties *)self isEqualToConfiguredProperties:v4];
  }

  return v5;
}

- (BOOL)isEqualToConfiguredProperties:(id)a3
{
  return [(PRPosterConfiguredProperties *)self isEqualToConfiguredProperties:a3 comparingPropertiesAffectingSnapshotsOnly:0];
}

- (BOOL)isEqualToConfiguredProperties:(id)a3 comparingPropertiesAffectingSnapshotsOnly:(BOOL)a4
{
  v6 = (PRPosterConfiguredProperties *)a3;
  v7 = v6;
  if (v6 == self)
  {
    BOOL v18 = 1;
  }
  else
  {
    if (v6)
    {
      v8 = [(PRPosterConfiguredProperties *)self titleStyleConfiguration];
      v9 = [(PRPosterConfiguredProperties *)v7 titleStyleConfiguration];
      if (!BSEqualObjects())
      {
        BOOL v18 = 0;
LABEL_40:

        goto LABEL_41;
      }
      id v10 = [(PRPosterConfiguredProperties *)self renderingConfiguration];
      id v11 = [(PRPosterConfiguredProperties *)v7 renderingConfiguration];
      if (!BSEqualObjects())
      {
        BOOL v18 = 0;
LABEL_39:

        goto LABEL_40;
      }
      id v12 = [(PRPosterConfiguredProperties *)self colorVariationsConfiguration];
      id v13 = [(PRPosterConfiguredProperties *)v7 colorVariationsConfiguration];
      if (!BSEqualObjects())
      {
        BOOL v18 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v14 = [(PRPosterConfiguredProperties *)self complicationLayout];
      uint64_t v44 = [(PRPosterConfiguredProperties *)v7 complicationLayout];
      id v45 = v14;
      if (!BSEqualObjects())
      {
        BOOL v18 = 0;
        id v19 = (void *)v44;
LABEL_37:

        goto LABEL_38;
      }
      uint64_t v15 = [(PRPosterConfiguredProperties *)self homeScreenConfiguration];
      v42 = [(PRPosterConfiguredProperties *)v7 homeScreenConfiguration];
      v43 = (void *)v15;
      if (!BSEqualObjects())
      {
        BOOL v18 = 0;
        id v19 = (void *)v44;
        v14 = v45;
LABEL_36:

        goto LABEL_37;
      }
      uint64_t v16 = [(PRPosterConfiguredProperties *)self quickActionsConfiguration];
      objc_super v40 = [(PRPosterConfiguredProperties *)v7 quickActionsConfiguration];
      v41 = (void *)v16;
      if (!BSEqualObjects())
      {
        BOOL v18 = 0;
LABEL_35:
        id v19 = (void *)v44;
        v14 = v45;

        goto LABEL_36;
      }
      objc_super v17 = [(PRPosterConfiguredProperties *)self userInfo];
      uint64_t v39 = [(PRPosterConfiguredProperties *)v7 userInfo];
      if (!BSEqualObjects()) {
        goto LABEL_32;
      }
      if (a4) {
        goto LABEL_11;
      }
      id v38 = v17;
      id v20 = [(PRPosterConfiguredProperties *)self focusConfiguration];
      id v21 = [(PRPosterConfiguredProperties *)v7 focusConfiguration];
      if ((BSEqualObjects() & 1) == 0)
      {

        BOOL v18 = 0;
        objc_super v17 = v38;
        id v28 = (void *)v39;
LABEL_34:

        goto LABEL_35;
      }
      v36 = v21;
      v37 = v20;
      uint64_t v22 = [(PRPosterConfiguredProperties *)self suggestionMetadata];
      [(PRPosterConfiguredProperties *)v7 suggestionMetadata];
      id v23 = v35 = (void *)v22;
      if (BSEqualObjects())
      {
        uint64_t v24 = [(PRPosterConfiguredProperties *)self otherMetadata];
        v33 = [(PRPosterConfiguredProperties *)v7 otherMetadata];
        v34 = (void *)v24;
        if (BSEqualObjects())
        {
          uint64_t v25 = [(PRPosterConfiguredProperties *)self ambientConfiguration];
          [(PRPosterConfiguredProperties *)v7 ambientConfiguration];
          id v26 = v32 = (void *)v25;
          if (BSEqualObjects())
          {
            v31 = [(PRPosterConfiguredProperties *)self ambientWidgetLayout];
            v30 = [(PRPosterConfiguredProperties *)v7 ambientWidgetLayout];
            int v27 = BSEqualObjects() ^ 1;
          }
          else
          {
            int v27 = 1;
          }
        }
        else
        {
          int v27 = 1;
        }
      }
      else
      {
        int v27 = 1;
      }

      objc_super v17 = v38;
      if (!v27) {
LABEL_11:
      }
        BOOL v18 = 1;
      else {
LABEL_32:
      }
        BOOL v18 = 0;
      id v28 = (void *)v39;
      goto LABEL_34;
    }
    BOOL v18 = 0;
  }
LABEL_41:

  return v18;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(PRPosterConfiguredProperties *)self titleStyleConfiguration];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(PRPosterConfiguredProperties *)self focusConfiguration];
  id v7 = (id)[v3 appendObject:v6];

  v8 = [(PRPosterConfiguredProperties *)self complicationLayout];
  id v9 = (id)[v3 appendObject:v8];

  id v10 = [(PRPosterConfiguredProperties *)self renderingConfiguration];
  id v11 = (id)[v3 appendObject:v10];

  id v12 = [(PRPosterConfiguredProperties *)self homeScreenConfiguration];
  id v13 = (id)[v3 appendObject:v12];

  v14 = [(PRPosterConfiguredProperties *)self colorVariationsConfiguration];
  id v15 = (id)[v3 appendObject:v14];

  uint64_t v16 = [(PRPosterConfiguredProperties *)self quickActionsConfiguration];
  id v17 = (id)[v3 appendObject:v16];

  BOOL v18 = [(PRPosterConfiguredProperties *)self ambientConfiguration];
  id v19 = (id)[v3 appendObject:v18];

  id v20 = [(PRPosterConfiguredProperties *)self ambientWidgetLayout];
  id v21 = (id)[v3 appendObject:v20];

  uint64_t v22 = [(PRPosterConfiguredProperties *)self suggestionMetadata];
  id v23 = (id)[v3 appendObject:v22];

  uint64_t v24 = [(PRPosterConfiguredProperties *)self otherMetadata];
  id v25 = (id)[v3 appendObject:v24];

  id v26 = [(PRPosterConfiguredProperties *)self userInfo];
  id v27 = (id)[v3 appendObject:v26];

  unint64_t v28 = [v3 hash];
  return v28;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __43__PRPosterConfiguredProperties_description__block_invoke;
  id v10 = &unk_1E54DAA08;
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __43__PRPosterConfiguredProperties_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (id)persistenceIdentifierWithComplications:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if ([(PRPosterConfiguredProperties *)self _isImmutable])
  {
    if (v4)
    {
      persistenceIdentifierWithComplications = self->_persistenceIdentifierWithComplications;
      if (persistenceIdentifierWithComplications)
      {
LABEL_4:
        uint64_t v7 = persistenceIdentifierWithComplications;
        goto LABEL_44;
      }
    }
    else
    {
      persistenceIdentifierWithComplications = self->_persistenceIdentifierWithoutComplications;
      if (persistenceIdentifierWithComplications) {
        goto LABEL_4;
      }
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [(PRPosterConfiguredProperties *)self titleStyleConfiguration];
  id v10 = [v9 titleColor];
  if (v10
    || ([v9 isUserConfigured] & 1) == 0
    && (+[PRPosterTitleStyleConfiguration defaultTitleColor], (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = [v10 identifier];
    [v8 addObject:v11];
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v12 = [v9 timeFontConfiguration];
  id v13 = [v12 uniqueIdentifier];
  v14 = v13;
  if (!v13)
  {
    id v3 = +[PRPosterTimeFontConfiguration defaultConfiguration];
    v14 = [v3 uniqueIdentifier];
  }
  v56 = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  if (!v13)
  {
  }
  uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v51 != v18) {
          objc_enumerationMutation(v15);
        }
        [v8 addObject:*(void *)(*((void *)&v50 + 1) + 8 * i)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v57 count:16];
    }
    while (v17);
  }

  if (v4)
  {
    id v20 = [(PRPosterConfiguredProperties *)self complicationLayout];
    id v21 = [v20 inlineComplication];

    if (v21)
    {
      uint64_t v22 = [(PRPosterConfiguredProperties *)self complicationLayout];
      id v23 = [v22 inlineComplication];
      uint64_t v24 = PersistentIdentifierForPRSWidget(v23);
      [v8 addObject:v24];
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v25 = [(PRPosterConfiguredProperties *)self complicationLayout];
    id v26 = [v25 complications];

    uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v47 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = PersistentIdentifierForPRSWidget(*(void **)(*((void *)&v46 + 1) + 8 * j));
          [v8 addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v28);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v32 = [(PRPosterConfiguredProperties *)self complicationLayout];
    v33 = [v32 sidebarComplications];

    uint64_t v34 = [v33 countByEnumeratingWithState:&v42 objects:v54 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v43;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v43 != v36) {
            objc_enumerationMutation(v33);
          }
          id v38 = PersistentIdentifierForPRSWidget(*(void **)(*((void *)&v42 + 1) + 8 * k));
          [v8 addObject:v38];
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v42 objects:v54 count:16];
      }
      while (v35);
    }
  }
  uint64_t v39 = [v8 componentsJoinedByString:@"_"];
  objc_msgSend(v39, "pf_sha256Hash");
  uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  if ([(PRPosterConfiguredProperties *)self _isImmutable])
  {
    uint64_t v40 = 16;
    if (v4) {
      uint64_t v40 = 8;
    }
    objc_storeStrong((id *)((char *)&self->super.isa + v40), v7);
  }

LABEL_44:
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterConfiguredProperties)initWithBSXPCCoder:(id)a3
{
  id v3 = a3;
  BOOL v4 = self;
  v30 = [v3 decodeObjectOfClass:v4 forKey:@"titleStyleConfiguration"];

  id v5 = self;
  id v25 = [v3 decodeObjectOfClass:v5 forKey:@"focusConfiguration"];

  v6 = self;
  uint64_t v29 = [v3 decodeObjectOfClass:v6 forKey:@"complicationLayout"];

  uint64_t v7 = self;
  uint64_t v8 = [v3 decodeObjectOfClass:v7 forKey:@"renderingConfiguration"];

  id v9 = self;
  id v10 = [v3 decodeObjectOfClass:v9 forKey:@"homeScreenConfiguration"];

  id v11 = self;
  id v26 = [v3 decodeObjectOfClass:v11 forKey:@"colorVariationsConfiguration"];

  id v12 = self;
  id v13 = [v3 decodeObjectOfClass:v12 forKey:@"quickActionsConfiguration"];

  v14 = self;
  id v15 = [v3 decodeObjectOfClass:v14 forKey:@"ambientConfiguration"];

  uint64_t v16 = self;
  uint64_t v24 = [v3 decodeObjectOfClass:v16 forKey:@"suggestionMetadata"];

  uint64_t v17 = self;
  uint64_t v18 = [v3 decodeObjectOfClass:v17 forKey:@"otherMetadata"];

  id v19 = self;
  id v20 = [v3 decodeObjectOfClass:v19 forKey:@"ambientWidgetLayout"];

  id v21 = self;
  uint64_t v22 = [v3 decodeObjectOfClass:v21 forKey:@"userInfo"];

  uint64_t v28 = [(PRPosterConfiguredProperties *)self initWithTitleStyleConfiguration:v30 focusConfiguration:v25 complicationLayout:v29 renderingConfiguration:v8 homeScreenConfiguration:v10 colorVariationsConfiguration:v26 quickActionsConfiguration:v13 ambientConfiguration:v15 ambientWidgetLayout:v20 suggestionMetadata:v24 otherMetadata:v18 userInfo:v22];
  return v28;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PRPosterConfiguredProperties *)self titleStyleConfiguration];
  [v4 encodeObject:v5 forKey:@"titleStyleConfiguration"];

  v6 = [(PRPosterConfiguredProperties *)self focusConfiguration];
  [v4 encodeObject:v6 forKey:@"focusConfiguration"];

  uint64_t v7 = [(PRPosterConfiguredProperties *)self complicationLayout];
  [v4 encodeObject:v7 forKey:@"complicationLayout"];

  uint64_t v8 = [(PRPosterConfiguredProperties *)self renderingConfiguration];
  [v4 encodeObject:v8 forKey:@"renderingConfiguration"];

  id v9 = [(PRPosterConfiguredProperties *)self homeScreenConfiguration];
  [v4 encodeObject:v9 forKey:@"homeScreenConfiguration"];

  id v10 = [(PRPosterConfiguredProperties *)self colorVariationsConfiguration];
  [v4 encodeObject:v10 forKey:@"colorVariationsConfiguration"];

  id v11 = [(PRPosterConfiguredProperties *)self quickActionsConfiguration];
  [v4 encodeObject:v11 forKey:@"quickActionsConfiguration"];

  id v12 = [(PRPosterConfiguredProperties *)self ambientConfiguration];
  [v4 encodeObject:v12 forKey:@"ambientConfiguration"];

  id v13 = [(PRPosterConfiguredProperties *)self ambientWidgetLayout];
  [v4 encodeObject:v13 forKey:@"ambientWidgetLayout"];

  v14 = [(PRPosterConfiguredProperties *)self suggestionMetadata];
  [v4 encodeObject:v14 forKey:@"suggestionMetadata"];

  id v15 = [(PRPosterConfiguredProperties *)self otherMetadata];
  [v4 encodeObject:v15 forKey:@"otherMetadata"];

  id v16 = [(PRPosterConfiguredProperties *)self userInfo];
  [v4 encodeObject:v16 forKey:@"userInfo"];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v28 = a3;
  id v4 = [(PRPosterConfiguredProperties *)self titleStyleConfiguration];
  id v5 = (id)[v28 appendObject:v4 withName:@"titleStyleConfiguration"];

  v6 = [(PRPosterConfiguredProperties *)self focusConfiguration];
  id v7 = (id)[v28 appendObject:v6 withName:@"focusConfiguration"];

  uint64_t v8 = [(PRPosterConfiguredProperties *)self complicationLayout];
  id v9 = (id)[v28 appendObject:v8 withName:@"complicationLayout"];

  id v10 = [(PRPosterConfiguredProperties *)self renderingConfiguration];
  id v11 = (id)[v28 appendObject:v10 withName:@"renderingConfiguration"];

  id v12 = [(PRPosterConfiguredProperties *)self homeScreenConfiguration];
  id v13 = (id)[v28 appendObject:v12 withName:@"homeScreenConfiguration"];

  v14 = [(PRPosterConfiguredProperties *)self colorVariationsConfiguration];
  id v15 = (id)[v28 appendObject:v14 withName:@"colorVariationsConfiguration"];

  id v16 = [(PRPosterConfiguredProperties *)self quickActionsConfiguration];
  id v17 = (id)[v28 appendObject:v16 withName:@"quickActionsConfiguration"];

  uint64_t v18 = [(PRPosterConfiguredProperties *)self ambientConfiguration];
  id v19 = (id)[v28 appendObject:v18 withName:@"ambientConfiguration"];

  id v20 = [(PRPosterConfiguredProperties *)self suggestionMetadata];
  id v21 = (id)[v28 appendObject:v20 withName:@"suggestionMetadata"];

  uint64_t v22 = [(PRPosterConfiguredProperties *)self otherMetadata];
  id v23 = (id)[v28 appendObject:v22 withName:@"otherMetadata"];

  uint64_t v24 = [(PRPosterConfiguredProperties *)self ambientWidgetLayout];
  id v25 = (id)[v28 appendObject:v24 withName:@"ambientWidgetLayout"];

  id v26 = [(PRPosterConfiguredProperties *)self userInfo];
  id v27 = (id)[v28 appendObject:v26 withName:@"userInfo"];
}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  return self->_titleStyleConfiguration;
}

- (void)setTitleStyleConfiguration:(id)a3
{
}

- (PRPosterFocusConfiguration)focusConfiguration
{
  return self->_focusConfiguration;
}

- (void)setFocusConfiguration:(id)a3
{
}

- (PRPosterComplicationLayout)complicationLayout
{
  return self->_complicationLayout;
}

- (void)setComplicationLayout:(id)a3
{
}

- (void)setRenderingConfiguration:(id)a3
{
}

- (void)setHomeScreenConfiguration:(id)a3
{
}

- (PRPosterColorVariationsConfiguration)colorVariationsConfiguration
{
  return self->_colorVariationsConfiguration;
}

- (void)setColorVariationsConfiguration:(id)a3
{
}

- (PRPosterQuickActionsConfiguration)quickActionsConfiguration
{
  return self->_quickActionsConfiguration;
}

- (void)setQuickActionsConfiguration:(id)a3
{
}

- (PRPosterSuggestionMetadata)suggestionMetadata
{
  return self->_suggestionMetadata;
}

- (void)setSuggestionMetadata:(id)a3
{
}

- (PRPosterMetadata)otherMetadata
{
  return self->_otherMetadata;
}

- (void)setOtherMetadata:(id)a3
{
}

- (PRPosterAmbientConfiguration)ambientConfiguration
{
  return self->_ambientConfiguration;
}

- (void)setAmbientConfiguration:(id)a3
{
}

- (PRPosterAmbientWidgetLayout)ambientWidgetLayout
{
  return self->_ambientWidgetLayout;
}

- (void)setAmbientWidgetLayout:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_ambientWidgetLayout, 0);
  objc_storeStrong((id *)&self->_ambientConfiguration, 0);
  objc_storeStrong((id *)&self->_otherMetadata, 0);
  objc_storeStrong((id *)&self->_suggestionMetadata, 0);
  objc_storeStrong((id *)&self->_quickActionsConfiguration, 0);
  objc_storeStrong((id *)&self->_colorVariationsConfiguration, 0);
  objc_storeStrong((id *)&self->_homeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_renderingConfiguration, 0);
  objc_storeStrong((id *)&self->_complicationLayout, 0);
  objc_storeStrong((id *)&self->_focusConfiguration, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifierWithoutComplications, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifierWithComplications, 0);
}

@end