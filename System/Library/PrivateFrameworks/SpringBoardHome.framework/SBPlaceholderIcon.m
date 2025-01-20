@interface SBPlaceholderIcon
+ (BOOL)hasIconImage;
+ (id)clusteredIconPlaceholderForIcons:(id)a3;
+ (id)grabbedIconPlaceholderForIcon:(id)a3;
+ (id)grabbedIconPlaceholderForIcons:(id)a3;
+ (id)placeholderForIcon:(id)a3;
+ (id)placeholderForReason:(id)a3;
+ (id)placeholderNodeIdentifierForIcon:(id)a3;
+ (id)placeholderNodeIdentifierForIconNodeIdentifier:(id)a3;
- (BOOL)canReceiveGrabbedIcon;
- (BOOL)isGridSizeClassAllowed:(id)a3;
- (BOOL)isPlaceholder;
- (BOOL)isUninstallSupported;
- (BOOL)referencesIcon:(id)a3;
- (BOOL)referencesIconWithIdentifier:(id)a3;
- (NSArray)referencedIcons;
- (SBIcon)referencedIcon;
- (id)_initWithNodeIdentifier:(id)a3 icon:(id)a4;
- (id)_initWithNodeIdentifier:(id)a3 icons:(id)a4;
- (id)automationID;
- (id)folder;
- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3;
- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3;
- (id)gridCellImage;
- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (id)nodeIdentifier;
- (void)updateReferencedIcons:(id)a3;
@end

@implementation SBPlaceholderIcon

- (id)_initWithNodeIdentifier:(id)a3 icon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBPlaceholderIcon;
  v9 = [(SBIcon *)&v13 init];
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    objc_storeStrong(&v9->_nodeIdentifier, a3);
    objc_storeStrong(p_isa + 9, a4);
    if (v8)
    {
      v11 = [v8 gridSizeClass];
      [p_isa setGridSizeClass:v11];
    }
  }

  return p_isa;
}

- (id)_initWithNodeIdentifier:(id)a3 icons:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)SBPlaceholderIcon;
  v9 = [(SBIcon *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_nodeIdentifier, a3);
    uint64_t v11 = [v8 copy];
    icons = v10->_icons;
    v10->_icons = (NSArray *)v11;

    objc_super v13 = @"SBHIconGridSizeClassDefault";
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v18), "gridSizeClass", (void)v23);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19 > v13)
          {
            v21 = v19;

            objc_super v13 = v21;
          }

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v16);
    }

    [(SBIcon *)v10 setGridSizeClass:v13];
  }

  return v10;
}

+ (id)placeholderNodeIdentifierForIcon:(id)a3
{
  v4 = [a3 nodeIdentifier];
  v5 = [a1 placeholderNodeIdentifierForIconNodeIdentifier:v4];

  return v5;
}

+ (id)placeholderNodeIdentifierForIconNodeIdentifier:(id)a3
{
  v3 = SBIconIndexDebugStringForNodeIdentifier(a3);
  v4 = [@"Placeholder: " stringByAppendingString:v3];

  return v4;
}

+ (id)placeholderForIcon:(id)a3
{
  id v4 = a3;
  v5 = [a1 placeholderNodeIdentifierForIcon:v4];
  v6 = (void *)[objc_alloc((Class)a1) _initWithNodeIdentifier:v5 icon:v4];

  return v6;
}

+ (id)grabbedIconPlaceholderForIcon:(id)a3
{
  id v3 = a3;
  id v4 = [SBGrabbedPlaceholderIcon alloc];
  v5 = NSString;
  v6 = [v3 nodeIdentifier];
  id v7 = SBIconIndexDebugStringForNodeIdentifier(v6);
  id v8 = [v5 stringWithFormat:@"Placeholder: Grabbed %@", v7];
  id v9 = [(SBPlaceholderIcon *)v4 _initWithNodeIdentifier:v8 icon:v3];

  return v9;
}

+ (id)grabbedIconPlaceholderForIcons:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) nodeIdentifier];
        uint64_t v11 = SBIconIndexDebugStringForNodeIdentifier(v10);

        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v12 = [SBGrabbedPlaceholderIcon alloc];
  objc_super v13 = NSString;
  id v14 = [v4 componentsJoinedByString:@", "];
  uint64_t v15 = [v13 stringWithFormat:@"Placeholder: Grabbed %@", v14];
  id v16 = [(SBPlaceholderIcon *)v12 _initWithNodeIdentifier:v15 icons:v5];

  return v16;
}

+ (id)clusteredIconPlaceholderForIcons:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) nodeIdentifier];
        uint64_t v11 = SBIconIndexDebugStringForNodeIdentifier(v10);

        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v12 = [SBClusteredPlaceholderIcon alloc];
  objc_super v13 = NSString;
  id v14 = [v4 componentsJoinedByString:@", "];
  uint64_t v15 = [v13 stringWithFormat:@"Placeholder: Clustered %@", v14];
  id v16 = [(SBPlaceholderIcon *)v12 _initWithNodeIdentifier:v15 icons:v5];

  return v16;
}

+ (id)placeholderForReason:(id)a3
{
  id v3 = a3;
  id v4 = [[SBCustomPlaceholderIcon alloc] initWithReason:v3];

  return v4;
}

- (id)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (id)automationID
{
  return (id)[@"BTN " stringByAppendingString:@"DestinationHole"];
}

- (id)generateIconImageWithInfo:(SBIconImageInfo *)a3
{
  return 0;
}

- (id)makeIconLayerWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  return 0;
}

- (id)genericIconImageWithInfo:(SBIconImageInfo *)a3
{
  return 0;
}

+ (BOOL)hasIconImage
{
  return 0;
}

- (BOOL)isPlaceholder
{
  return 1;
}

- (SBIcon)referencedIcon
{
  icon = self->_icon;
  if (icon)
  {
    id v3 = icon;
  }
  else
  {
    id v3 = [(NSArray *)self->_icons firstObject];
  }
  return v3;
}

- (NSArray)referencedIcons
{
  v5[1] = *MEMORY[0x1E4F143B8];
  icons = self->_icons;
  if (icons)
  {
    id v3 = icons;
  }
  else if (self->_icon)
  {
    v5[0] = self->_icon;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (BOOL)referencesIcon:(id)a3
{
  return self->_icon == a3 || -[NSArray containsObject:](self->_icons, "containsObject:");
}

- (BOOL)referencesIconWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIcon *)self->_icon nodeIdentifier];
  char v6 = [v4 isEqual:v5];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    icons = self->_icons;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__SBPlaceholderIcon_referencesIconWithIdentifier___block_invoke;
    v10[3] = &unk_1E6AAF238;
    id v11 = v4;
    BOOL v7 = [(NSArray *)icons indexOfObjectPassingTest:v10] != 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

uint64_t __50__SBPlaceholderIcon_referencesIconWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 nodeIdentifier];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (void)updateReferencedIcons:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  icons = self->_icons;
  self->_icons = v4;
}

- (id)gridCellImage
{
  return 0;
}

- (BOOL)isUninstallSupported
{
  return 0;
}

- (BOOL)isGridSizeClassAllowed:(id)a3
{
  return 1;
}

- (BOOL)canReceiveGrabbedIcon
{
  return 0;
}

- (id)folder
{
  v2 = [(SBPlaceholderIcon *)self referencedIcon];
  id v3 = [v2 folder];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong(&self->_nodeIdentifier, 0);
}

@end