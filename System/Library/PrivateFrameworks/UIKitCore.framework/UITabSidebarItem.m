@interface UITabSidebarItem
+ (id)itemFromRequest:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)accessories;
- (UIAction)action;
- (UIBackgroundConfiguration)backgroundConfiguration;
- (UICellConfigurationState)configurationState;
- (UIContentConfiguration)contentConfiguration;
- (UITab)tab;
- (id)_initWithItem:(id)a3;
- (id)_initWithRequest:(id)a3;
- (id)_resolvedAccessories;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultBackgroundConfiguration;
- (id)defaultContentConfiguration;
- (void)setAccessories:(id)a3;
- (void)setBackgroundConfiguration:(id)a3;
- (void)setConfigurationState:(id)a3;
- (void)setContentConfiguration:(id)a3;
@end

@implementation UITabSidebarItem

- (id)_initWithRequest:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)UITabSidebarItem;
  v5 = [(UITabSidebarItem *)&v30 init];
  if (v5)
  {
    v6 = [v4 tab];
    v7 = [v4 action];
    v8 = [v4 _cell];
    v9 = [v8 defaultContentConfiguration];
    v10 = [v8 defaultBackgroundConfiguration];
    if (v6)
    {
      v11 = [(UITab *)v6 title];
      [(UIListContentConfiguration *)v9 setText:v11];

      v12 = [(UITab *)v6 subtitle];
      [(UIListContentConfiguration *)v9 setSecondaryText:v12];

      if (([v4 _isHeader] & 1) == 0)
      {
        v13 = [(UITab *)v6 image];
        [(UIListContentConfiguration *)v9 setImage:v13];
      }
      if (![(UITab *)v6 _isAction]) {
        goto LABEL_10;
      }
    }
    else
    {
      if (!v7)
      {
LABEL_10:
        tab = v5->_tab;
        v5->_tab = v6;
        v20 = v6;

        action = v5->_action;
        v5->_action = v7;
        v22 = v7;

        objc_storeStrong((id *)&v5->_contentConfiguration, v9);
        objc_storeStrong((id *)&v5->_backgroundConfiguration, v10);
        defaultContentConfiguration = v5->_defaultContentConfiguration;
        v5->_defaultContentConfiguration = v9;
        v24 = v9;

        defaultBackgroundConfiguration = v5->_defaultBackgroundConfiguration;
        v5->_defaultBackgroundConfiguration = v10;
        v26 = v10;

        uint64_t v27 = [v8 configurationState];
        configurationState = v5->_configurationState;
        v5->_configurationState = (UICellConfigurationState *)v27;

        goto LABEL_11;
      }
      v14 = [(UIMenuElement *)v7 title];
      [(UIListContentConfiguration *)v9 setText:v14];

      v15 = [(UIMenuElement *)v7 subtitle];
      [(UIListContentConfiguration *)v9 setSecondaryText:v15];

      v16 = [(UIMenuElement *)v7 image];
      [(UIListContentConfiguration *)v9 setImage:v16];
    }
    v17 = +[UIColor tintColor];
    v18 = [(UIListContentConfiguration *)v9 textProperties];
    [v18 setColor:v17];

    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (id)_initWithItem:(id)a3
{
  id v4 = (id *)a3;
  v19.receiver = self;
  v19.super_class = (Class)UITabSidebarItem;
  v5 = [(UITabSidebarItem *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 tab];
    tab = v5->_tab;
    v5->_tab = (UITab *)v6;

    uint64_t v8 = [v4 action];
    action = v5->_action;
    v5->_action = (UIAction *)v8;

    uint64_t v10 = [v4 configurationState];
    configurationState = v5->_configurationState;
    v5->_configurationState = (UICellConfigurationState *)v10;

    uint64_t v12 = [v4 contentConfiguration];
    contentConfiguration = v5->_contentConfiguration;
    v5->_contentConfiguration = (UIContentConfiguration *)v12;

    uint64_t v14 = [v4 backgroundConfiguration];
    backgroundConfiguration = v5->_backgroundConfiguration;
    v5->_backgroundConfiguration = (UIBackgroundConfiguration *)v14;

    uint64_t v16 = [v4 accessories];
    accessories = v5->_accessories;
    v5->_accessories = (NSArray *)v16;

    objc_storeStrong((id *)&v5->_defaultContentConfiguration, v4[1]);
    objc_storeStrong((id *)&v5->_defaultBackgroundConfiguration, v4[2]);
  }

  return v5;
}

+ (id)itemFromRequest:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithRequest:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 _initWithItem:self];
}

- (UIContentConfiguration)contentConfiguration
{
  v2 = (void *)[(UIContentConfiguration *)self->_contentConfiguration copyWithZone:0];
  return (UIContentConfiguration *)v2;
}

- (UIBackgroundConfiguration)backgroundConfiguration
{
  v2 = (void *)[(UIBackgroundConfiguration *)self->_backgroundConfiguration copy];
  return (UIBackgroundConfiguration *)v2;
}

- (NSArray)accessories
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_accessories copyItems:1];
  return (NSArray *)v2;
}

- (id)defaultContentConfiguration
{
  defaultContentConfiguration = self->_defaultContentConfiguration;
  v3 = [(UITabSidebarItem *)self configurationState];
  id v4 = [(UIListContentConfiguration *)defaultContentConfiguration updatedConfigurationForState:v3];

  return v4;
}

- (id)defaultBackgroundConfiguration
{
  defaultBackgroundConfiguration = self->_defaultBackgroundConfiguration;
  v3 = [(UITabSidebarItem *)self configurationState];
  id v4 = [(UIBackgroundConfiguration *)defaultBackgroundConfiguration updatedConfigurationForState:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = (UITabSidebarItem *)v4;
      uint64_t v6 = v5;
      if (v5 == self)
      {
LABEL_32:
        BOOL v12 = 1;
        goto LABEL_33;
      }
      tab = v5->_tab;
      uint64_t v8 = self->_tab;
      v9 = tab;
      if (v8 == v9)
      {
      }
      else
      {
        uint64_t v10 = v9;
        if (!v8 || !v9) {
          goto LABEL_28;
        }
        BOOL v11 = [(UITab *)v8 isEqual:v9];

        if (!v11) {
          goto LABEL_29;
        }
      }
      action = v6->_action;
      uint64_t v8 = self->_action;
      uint64_t v14 = action;
      if (v8 == v14)
      {
      }
      else
      {
        uint64_t v10 = v14;
        if (!v8 || !v14) {
          goto LABEL_28;
        }
        BOOL v15 = [(UITab *)v8 isEqual:v14];

        if (!v15) {
          goto LABEL_29;
        }
      }
      contentConfiguration = v6->_contentConfiguration;
      uint64_t v8 = self->_contentConfiguration;
      v17 = contentConfiguration;
      if (v8 == v17)
      {
      }
      else
      {
        uint64_t v10 = v17;
        if (!v8 || !v17) {
          goto LABEL_28;
        }
        BOOL v18 = [(UITab *)v8 isEqual:v17];

        if (!v18) {
          goto LABEL_29;
        }
      }
      backgroundConfiguration = v6->_backgroundConfiguration;
      uint64_t v8 = self->_backgroundConfiguration;
      v20 = backgroundConfiguration;
      if (v8 == v20)
      {

LABEL_31:
        if (UIEqual(self->_accessories, v6->_accessories)) {
          goto LABEL_32;
        }
LABEL_29:
        BOOL v12 = 0;
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v10 = v20;
      if (v8 && v20)
      {
        BOOL v21 = [(UITab *)v8 isEqual:v20];

        if (!v21) {
          goto LABEL_29;
        }
        goto LABEL_31;
      }
LABEL_28:

      goto LABEL_29;
    }
  }
  BOOL v12 = 0;
LABEL_34:

  return v12;
}

- (id)_resolvedAccessories
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(UITabSidebarItem *)self accessories];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:3];
  uint64_t v6 = objc_msgSend(v4, "count", v22, v23);
  if (v6 - 1 < 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    uint64_t v7 = v6;
    int v8 = 0;
    do
    {
      v9 = [v4 objectAtIndex:--v7];
      if ([v5 containsObject:objc_opt_class()])
      {
        [v4 removeObjectAtIndex:v7];
      }
      else
      {
        objc_opt_class();
        v8 |= objc_opt_isKindOfClass();
      }
    }
    while (v7 > 0);
  }
  uint64_t v10 = [(UITabSidebarItem *)self tab];
  char v11 = [v10 _isGroup];

  if (v11)
  {
    BOOL v12 = objc_alloc_init(UICellAccessoryOutlineDisclosure);
    [(UICellAccessoryOutlineDisclosure *)v12 setStyle:1];
LABEL_15:
    [v4 addObject:v12];

    goto LABEL_16;
  }
  v13 = [(UITabSidebarItem *)self tab];
  int v14 = [v13 _canBeReordered];

  if (v14)
  {
    BOOL v15 = objc_alloc_init(UICellAccessoryReorder);
    [(UICellAccessory *)v15 setDisplayedState:1];
    [(UICellAccessoryReorder *)v15 setShowsVerticalSeparator:0];
    [v4 addObject:v15];
  }
  uint64_t v16 = [(UITabSidebarItem *)self tab];
  int v17 = [v16 allowsHiding];

  if (v17)
  {
    BOOL v12 = objc_alloc_init(UICellAccessoryMultiselect);
    [(UICellAccessory *)v12 setDisplayedState:1];
    goto LABEL_15;
  }
LABEL_16:
  BOOL v18 = [(UITabSidebarItem *)self tab];
  objc_super v19 = [v18 badgeValue];

  if (!(([v19 length] == 0) | v8 & 1))
  {
    v20 = [[UICellAccessoryLabel alloc] initWithText:v19];
    [v4 addObject:v20];
  }
  return v4;
}

- (void)setContentConfiguration:(id)a3
{
}

- (void)setBackgroundConfiguration:(id)a3
{
}

- (void)setAccessories:(id)a3
{
}

- (UITab)tab
{
  return self->_tab;
}

- (UIAction)action
{
  return self->_action;
}

- (UICellConfigurationState)configurationState
{
  return self->_configurationState;
}

- (void)setConfigurationState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationState, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_tab, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_backgroundConfiguration, 0);
  objc_storeStrong((id *)&self->_contentConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultContentConfiguration, 0);
}

@end