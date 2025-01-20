@interface SBHApplicationWidgetCollection
- (BOOL)containsWidgetDescriptorMatchingDescriptor:(id)a3;
- (BOOL)isDisfavored;
- (NSArray)filteredWidgetDescriptors;
- (NSArray)widgetDescriptors;
- (NSString)collectionIdentifier;
- (NSString)containerName;
- (NSString)description;
- (NSString)displayName;
- (NSString)iconImageApplicationBundleIdentifier;
- (NSString)uniqueIdentifier;
- (NSString)vendorName;
- (SBHApplicationWidgetCollection)initWithCustomImage:(id)a3 iconBackgroundColor:(id)a4 displayName:(id)a5 galleryItems:(id)a6 vendorName:(id)a7;
- (SBHApplicationWidgetCollection)initWithCustomImage:(id)a3 iconBackgroundColor:(id)a4 displayName:(id)a5 galleryItems:(id)a6 vendorName:(id)a7 uniqueIdentifier:(id)a8;
- (SBHApplicationWidgetCollection)initWithIcon:(id)a3 galleryItems:(id)a4 vendorName:(id)a5;
- (SBHApplicationWidgetCollection)initWithIcon:(id)a3 galleryItems:(id)a4 vendorName:(id)a5 uniqueIdentifier:(id)a6;
- (SBLeafIcon)icon;
- (UIColor)customImageBackgroundColor;
- (UIImage)customImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)indexOfWidgetDescriptorMatchingDescriptor:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setDisfavored:(BOOL)a3;
- (void)setFilteredWidgetDescriptors:(id)a3;
- (void)setIconImageApplicationBundleIdentifier:(id)a3;
- (void)setWidgetDescriptors:(id)a3;
@end

@implementation SBHApplicationWidgetCollection

- (SBHApplicationWidgetCollection)initWithCustomImage:(id)a3 iconBackgroundColor:(id)a4 displayName:(id)a5 galleryItems:(id)a6 vendorName:(id)a7
{
  v12 = (void *)MEMORY[0x1E4F29128];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [v12 UUID];
  v19 = [v18 UUIDString];
  v20 = [(SBHApplicationWidgetCollection *)self initWithCustomImage:v17 iconBackgroundColor:v16 displayName:v15 galleryItems:v14 vendorName:v13 uniqueIdentifier:v19];

  return v20;
}

- (SBHApplicationWidgetCollection)initWithCustomImage:(id)a3 iconBackgroundColor:(id)a4 displayName:(id)a5 galleryItems:(id)a6 vendorName:(id)a7 uniqueIdentifier:(id)a8
{
  id v23 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v18 = [(SBHApplicationWidgetCollection *)self initWithIcon:0 galleryItems:a6 vendorName:a7];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_customImage, a3);
    objc_storeStrong((id *)&v19->_customImageBackgroundColor, a4);
    objc_storeStrong((id *)&v19->_containerName, a5);
    uint64_t v20 = [v17 copy];
    uniqueIdentifier = v19->_uniqueIdentifier;
    v19->_uniqueIdentifier = (NSString *)v20;
  }
  return v19;
}

- (SBHApplicationWidgetCollection)initWithIcon:(id)a3 galleryItems:(id)a4 vendorName:(id)a5
{
  v8 = (void *)MEMORY[0x1E4F29128];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 UUID];
  id v13 = [v12 UUIDString];
  id v14 = [(SBHApplicationWidgetCollection *)self initWithIcon:v11 galleryItems:v10 vendorName:v9 uniqueIdentifier:v13];

  return v14;
}

- (SBHApplicationWidgetCollection)initWithIcon:(id)a3 galleryItems:(id)a4 vendorName:(id)a5 uniqueIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBHApplicationWidgetCollection;
  id v15 = [(SBHApplicationWidgetCollection *)&v24 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_icon, a3);
    uint64_t v17 = [v12 copy];
    widgetDescriptors = v16->_widgetDescriptors;
    v16->_widgetDescriptors = (NSArray *)v17;

    uint64_t v19 = [v13 copy];
    vendorName = v16->_vendorName;
    v16->_vendorName = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    uniqueIdentifier = v16->_uniqueIdentifier;
    v16->_uniqueIdentifier = (NSString *)v21;
  }
  return v16;
}

- (NSString)description
{
  return (NSString *)[(SBHApplicationWidgetCollection *)self descriptionWithMultilinePrefix:0];
}

- (NSString)displayName
{
  if (self->_containerName)
  {
    id v3 = [(SBHApplicationWidgetCollection *)self containerName];
  }
  else
  {
    icon = self->_icon;
    if (icon)
    {
      v5 = [(SBIcon *)icon displayName];
      v6 = v5;
      if (v5)
      {
        id v3 = v5;
      }
      else
      {
        v7 = [(NSArray *)self->_widgetDescriptors firstObject];
        objc_msgSend(v7, "sbh_appName");
        id v3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v3 = 0;
    }
  }
  v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v9 = [v3 stringByTrimmingCharactersInSet:v8];

  return (NSString *)v9;
}

- (NSString)collectionIdentifier
{
  collectionIdentifier = self->_collectionIdentifier;
  if (!collectionIdentifier)
  {
    BOOL v5 = [(SBHApplicationWidgetCollection *)self isDisfavored];
    v6 = [(SBHApplicationWidgetCollection *)self containerName];
    if (v6)
    {
    }
    else
    {
      v7 = [(SBHApplicationWidgetCollection *)self iconImageApplicationBundleIdentifier];

      if (!v7)
      {
        id v16 = NSString;
        id v9 = [(SBLeafIcon *)self->_icon leafIdentifier];
        id v10 = v9;
        if (!v9)
        {
          v2 = [MEMORY[0x1E4F29128] UUID];
          id v10 = [v2 UUIDString];
        }
        uint64_t v17 = [v16 stringWithFormat:@"APP_COLLECTION:'%@'-isDisfavored:%d", v10, v5];
        v18 = self->_collectionIdentifier;
        self->_collectionIdentifier = v17;

        if (v9) {
          goto LABEL_7;
        }
        goto LABEL_6;
      }
    }
    v8 = NSString;
    id v9 = [(SBHApplicationWidgetCollection *)self containerName];
    v2 = [(SBHApplicationWidgetCollection *)self iconImageApplicationBundleIdentifier];
    id v10 = [MEMORY[0x1E4F29128] UUID];
    id v11 = [v10 UUIDString];
    id v12 = [v8 stringWithFormat:@"FRAMEWORK_COLLECTION:'%@'-'%@'-isDisfavored:%d-uniqueIdentifier:%@", v9, v2, v5, v11];
    id v13 = self->_collectionIdentifier;
    self->_collectionIdentifier = v12;

LABEL_6:
LABEL_7:

    collectionIdentifier = self->_collectionIdentifier;
  }
  id v14 = collectionIdentifier;
  return v14;
}

- (unint64_t)indexOfWidgetDescriptorMatchingDescriptor:(id)a3
{
  v4 = objc_msgSend(a3, "sbh_galleryItemIdentifier");
  BOOL v5 = [(SBHApplicationWidgetCollection *)self widgetDescriptors];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__SBHApplicationWidgetCollection_indexOfWidgetDescriptorMatchingDescriptor___block_invoke;
  v9[3] = &unk_1E6AAFD98;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [v5 indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __76__SBHApplicationWidgetCollection_indexOfWidgetDescriptorMatchingDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(a2, "sbh_galleryItemIdentifier");
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)containsWidgetDescriptorMatchingDescriptor:(id)a3
{
  return [(SBHApplicationWidgetCollection *)self indexOfWidgetDescriptorMatchingDescriptor:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)succinctDescription
{
  v2 = [(SBHApplicationWidgetCollection *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBHApplicationWidgetCollection *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHApplicationWidgetCollection *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__SBHApplicationWidgetCollection_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AACA90;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __72__SBHApplicationWidgetCollection_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"icon"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"decriptors"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_customImage && self->_customImageBackgroundColor) {
    id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCustomImage:self->_customImage iconBackgroundColor:self->_customImageBackgroundColor displayName:self->_containerName galleryItems:self->_widgetDescriptors vendorName:self->_vendorName uniqueIdentifier:self->_uniqueIdentifier];
  }
  else {
    id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIcon:self->_icon galleryItems:self->_widgetDescriptors vendorName:self->_vendorName uniqueIdentifier:self->_uniqueIdentifier];
  }
  BOOL v5 = v4;
  [v4 setContainerName:self->_containerName];
  [v5 setIconImageApplicationBundleIdentifier:self->_iconImageApplicationBundleIdentifier];
  [v5 setDisfavored:self->_disfavored];
  return v5;
}

- (SBLeafIcon)icon
{
  return self->_icon;
}

- (UIImage)customImage
{
  return self->_customImage;
}

- (UIColor)customImageBackgroundColor
{
  return self->_customImageBackgroundColor;
}

- (NSArray)widgetDescriptors
{
  return self->_widgetDescriptors;
}

- (void)setWidgetDescriptors:(id)a3
{
}

- (NSArray)filteredWidgetDescriptors
{
  return self->_filteredWidgetDescriptors;
}

- (void)setFilteredWidgetDescriptors:(id)a3
{
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (BOOL)isDisfavored
{
  return self->_disfavored;
}

- (void)setDisfavored:(BOOL)a3
{
  self->_disfavored = a3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
}

- (NSString)iconImageApplicationBundleIdentifier
{
  return self->_iconImageApplicationBundleIdentifier;
}

- (void)setIconImageApplicationBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_filteredWidgetDescriptors, 0);
  objc_storeStrong((id *)&self->_widgetDescriptors, 0);
  objc_storeStrong((id *)&self->_customImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_customImage, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
}

@end