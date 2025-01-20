@interface SUUIMenuBarTemplateElement
- (SUUIMenuBarViewElement)menuBar;
- (SUUINavigationBarViewElement)navigationBarElement;
- (id)_menuBarChildOfElement:(id)a3;
@end

@implementation SUUIMenuBarTemplateElement

- (SUUIMenuBarViewElement)menuBar
{
  v3 = [(SUUIMenuBarTemplateElement *)self _menuBarChildOfElement:self];
  if (!v3)
  {
    v4 = [(SUUIMenuBarTemplateElement *)self navigationBarElement];
    v3 = [(SUUIMenuBarTemplateElement *)self _menuBarChildOfElement:v4];
  }
  return (SUUIMenuBarViewElement *)v3;
}

- (id)_menuBarChildOfElement:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
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
        if (objc_msgSend(v7, "conformsToProtocol:", &unk_2706343E0, (void)v9))
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

- (SUUINavigationBarViewElement)navigationBarElement
{
  return (SUUINavigationBarViewElement *)[(SUUIViewElement *)self firstChildForElementType:74];
}

@end