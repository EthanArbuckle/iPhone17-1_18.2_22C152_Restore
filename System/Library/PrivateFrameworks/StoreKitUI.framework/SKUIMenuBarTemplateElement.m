@interface SKUIMenuBarTemplateElement
- (SKUIMenuBarViewElement)menuBar;
- (SKUINavigationBarViewElement)navigationBarElement;
- (id)_menuBarChildOfElement:(id)a3;
- (void)menuBar;
- (void)navigationBarElement;
@end

@implementation SKUIMenuBarTemplateElement

- (SKUIMenuBarViewElement)menuBar
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuBarTemplateElement menuBar]();
  }
  v3 = [(SKUIMenuBarTemplateElement *)self _menuBarChildOfElement:self];
  if (!v3)
  {
    v4 = [(SKUIMenuBarTemplateElement *)self navigationBarElement];
    v3 = [(SKUIMenuBarTemplateElement *)self _menuBarChildOfElement:v4];
  }

  return (SKUIMenuBarViewElement *)v3;
}

- (id)_menuBarChildOfElement:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [a3 children];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F1DC2DC0, (void)v9))
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (SKUINavigationBarViewElement)navigationBarElement
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuBarTemplateElement navigationBarElement]();
  }
  id v3 = [(SKUIViewElement *)self firstChildForElementType:74];

  return (SKUINavigationBarViewElement *)v3;
}

- (void)menuBar
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMenuBarTemplateElement menuBar]";
}

- (void)navigationBarElement
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMenuBarTemplateElement navigationBarElement]";
}

@end