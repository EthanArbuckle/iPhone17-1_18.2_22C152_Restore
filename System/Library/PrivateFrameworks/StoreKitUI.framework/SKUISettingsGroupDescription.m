@interface SKUISettingsGroupDescription
- (BOOL)hasEditableSettingDescriptions;
- (BOOL)hasFooter;
- (BOOL)hasHeader;
- (BOOL)hasNoVisibleSettings;
- (BOOL)isEmpty;
- (BOOL)isSettingDescriptionHidden:(id)a3;
- (SKUIClientContext)clientContext;
- (SKUIGroupViewElement)viewElement;
- (SKUISettingsGroupController)controller;
- (SKUISettingsGroupDescription)initWithParent:(id)a3 settingsContext:(id)a4;
- (SKUISettingsGroupsDescription)parent;
- (id)description;
- (id)editableSettingDescriptions;
- (id)footerDescription;
- (id)headerDescription;
- (id)indexPathForSettingDescription:(id)a3;
- (id)newSiblingWithClass:(Class)a3;
- (id)settingDescriptionAtIndex:(unint64_t)a3;
- (id)viewElementForSettingAtIndex:(unint64_t)a3;
- (unint64_t)index;
- (unint64_t)numberOfSettings;
- (void)_dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_dispatchUpdateForSettingDescription:(id)a3 updateType:(int64_t)a4;
- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_updatedEditsValid;
- (void)addSettingDescription:(id)a3;
- (void)addSettingViewElement:(id)a3;
- (void)addSibling:(id)a3;
- (void)deleteSettingDescription:(id)a3;
- (void)deleteSettingsGroup;
- (void)dispatchUpdate:(id)a3;
- (void)hideSettingDescription:(id)a3;
- (void)hideSettingsGroup;
- (void)recycle;
- (void)reloadData;
- (void)reloadSettingDescription:(id)a3;
- (void)requestLayoutForWidth:(double)a3 context:(id)a4;
- (void)revealSettingDescription:(id)a3;
- (void)revealSettingsGroup;
- (void)setController:(id)a3;
- (void)setFooterDescription:(id)a3;
- (void)setFooterViewElement:(id)a3;
- (void)setHeaderDescription:(id)a3;
- (void)setHeaderViewElement:(id)a3;
- (void)setParent:(id)a3;
- (void)setViewElement:(id)a3;
@end

@implementation SKUISettingsGroupDescription

- (SKUISettingsGroupDescription)initWithParent:(id)a3 settingsContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingsGroupDescription initWithParent:settingsContext:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUISettingsGroupDescription;
  v8 = [(SKUISettingsGroupDescription *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parent, v6);
    objc_storeWeak((id *)&v9->_settingsContext, v7);
    footerDescription = v9->_footerDescription;
    v9->_footerDescription = 0;

    headerDescription = v9->_headerDescription;
    v9->_headerDescription = 0;

    v12 = objc_alloc_init(SKUISettingsObjectStore);
    settingDescriptions = v9->_settingDescriptions;
    v9->_settingDescriptions = v12;
  }
  return v9;
}

- (void)addSettingDescription:(id)a3
{
  id v9 = a3;
  -[SKUISettingsObjectStore addObject:hidden:](self->_settingDescriptions, "addObject:hidden:", v9, [v9 _initiallyHidden]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_controller);
    [v5 attachSettingDescription:v9];
  }
  if ([(id)objc_opt_class() allowsEdit])
  {
    editableSettings = self->_editableSettings;
    if (!editableSettings)
    {
      id v7 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
      v8 = self->_editableSettings;
      self->_editableSettings = v7;

      editableSettings = self->_editableSettings;
    }
    [(NSMutableSet *)editableSettings addObject:v9];
  }
}

- (void)addSettingViewElement:(id)a3
{
  p_settingsContext = &self->_settingsContext;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_settingsContext);
  id v7 = [WeakRetained dequeueReusableSettingDescriptionForViewElement:v5 parent:self];

  [(SKUISettingsGroupDescription *)self addSettingDescription:v7];
}

- (void)addSibling:(id)a3
{
  id v4 = a3;
  [(SKUISettingsGroupDescription *)self addSettingDescription:v4];
  id v7 = [v4 indexPath];

  if (v7)
  {
    id v5 = [[SKUISettingsDescriptionUpdate alloc] initWithUpdateType:4];
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
    [(SKUISettingsDescriptionUpdate *)v5 setIndexPaths:v6];

    [(SKUISettingsGroupDescription *)self dispatchUpdate:v5];
  }
}

- (SKUIClientContext)clientContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  v3 = [WeakRetained clientContext];

  return (SKUIClientContext *)v3;
}

- (void)deleteSettingsGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained deleteSettingsGroupDescription:self];
}

- (void)deleteSettingDescription:(id)a3
{
  id v4 = a3;
  id v8 = [(SKUISettingsGroupDescription *)self indexPathForSettingDescription:v4];
  [(SKUISettingsObjectStore *)self->_settingDescriptions removeObject:v4];
  [(NSMutableSet *)self->_editableSettings removeObject:v4];

  if ([(SKUISettingsObjectStore *)self->_settingDescriptions numberOfObjects])
  {
    if ([(SKUISettingsObjectStore *)self->_settingDescriptions numberOfVisibleObjects])
    {
      id v5 = v8;
      if (!v8) {
        goto LABEL_8;
      }
      id v6 = [[SKUISettingsDescriptionUpdate alloc] initWithUpdateType:3];
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v8];
      [(SKUISettingsDescriptionUpdate *)v6 setIndexPaths:v7];

      [(SKUISettingsGroupDescription *)self dispatchUpdate:v6];
    }
    else
    {
      [(SKUISettingsGroupDescription *)self hideSettingsGroup];
    }
  }
  else
  {
    [(SKUISettingsGroupDescription *)self deleteSettingsGroup];
  }
  id v5 = v8;
LABEL_8:
}

- (void)dispatchUpdate:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  [WeakRetained dispatchUpdate:v4];
}

- (id)editableSettingDescriptions
{
  v2 = (void *)[(NSMutableSet *)self->_editableSettings copy];

  return v2;
}

- (id)footerDescription
{
  return self->_footerDescription;
}

- (BOOL)hasEditableSettingDescriptions
{
  editableSettings = self->_editableSettings;
  if (editableSettings) {
    LOBYTE(editableSettings) = [(NSMutableSet *)editableSettings count] != 0;
  }
  return (char)editableSettings;
}

- (BOOL)hasFooter
{
  return self->_footerDescription != 0;
}

- (BOOL)hasHeader
{
  return self->_headerDescription != 0;
}

- (BOOL)hasNoVisibleSettings
{
  return [(SKUISettingsGroupDescription *)self isEmpty]
      || [(SKUISettingsObjectStore *)self->_settingDescriptions numberOfVisibleObjects] == 0;
}

- (id)headerDescription
{
  return self->_headerDescription;
}

- (void)hideSettingsGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained hideSettingsGroupDescription:self];
}

- (void)hideSettingDescription:(id)a3
{
  id v4 = a3;
  id v8 = [(SKUISettingsGroupDescription *)self indexPathForSettingDescription:v4];
  [(SKUISettingsObjectStore *)self->_settingDescriptions hideObject:v4];

  if ([(SKUISettingsObjectStore *)self->_settingDescriptions numberOfVisibleObjects])
  {
    id v5 = v8;
    if (!v8) {
      goto LABEL_6;
    }
    id v6 = [[SKUISettingsDescriptionUpdate alloc] initWithUpdateType:3];
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v8];
    [(SKUISettingsDescriptionUpdate *)v6 setIndexPaths:v7];

    [(SKUISettingsGroupDescription *)self dispatchUpdate:v6];
  }
  else
  {
    [(SKUISettingsGroupDescription *)self hideSettingsGroup];
  }
  id v5 = v8;
LABEL_6:
}

- (unint64_t)index
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  unint64_t v4 = [WeakRetained indexOfSettingsGroupDescription:self];

  return v4;
}

- (id)indexPathForSettingDescription:(id)a3
{
  unint64_t v4 = [(SKUISettingsObjectStore *)self->_settingDescriptions indexOfVisibleObject:a3];
  unint64_t v5 = [(SKUISettingsGroupDescription *)self index];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:v4 inSection:v5];
  }

  return v6;
}

- (BOOL)isEmpty
{
  settingDescriptions = self->_settingDescriptions;
  return !settingDescriptions || [(SKUISettingsObjectStore *)settingDescriptions numberOfObjects] == 0;
}

- (BOOL)isSettingDescriptionHidden:(id)a3
{
  return ![(SKUISettingsObjectStore *)self->_settingDescriptions objectIsVisible:a3];
}

- (id)newSiblingWithClass:(Class)a3
{
  id v4 = [a3 alloc];

  return (id)[v4 initWithViewElement:0 parent:self];
}

- (unint64_t)numberOfSettings
{
  return [(SKUISettingsObjectStore *)self->_settingDescriptions numberOfVisibleObjects];
}

- (void)recycle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsContext);
  v3 = [(SKUISettingsObjectStore *)self->_settingDescriptions allObjects];
  [WeakRetained recycleSettingDescriptions:v3];
}

- (void)reloadData
{
}

uint64_t __42__SKUISettingsGroupDescription_reloadData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 reloadData];
}

- (void)reloadSettingDescription:(id)a3
{
}

- (void)requestLayoutForWidth:(double)a3 context:(id)a4
{
  id v6 = a4;
  if ([(SKUISettingsGroupDescription *)self hasFooter])
  {
    id v7 = +[SKUISettingsHeaderFooterDescription viewClassForSettingsHeaderFooterDescription:self->_footerDescription];
    [(objc_class *)v7 prefetchResourcesForSettingsHeaderFooterDescription:self->_footerDescription reason:0 context:v6];
    [(objc_class *)v7 requestLayoutForSettingsHeaderFooterDescription:self->_footerDescription width:v6 context:a3];
  }
  if ([(SKUISettingsGroupDescription *)self hasHeader])
  {
    id v8 = +[SKUISettingsHeaderFooterDescription viewClassForSettingsHeaderFooterDescription:self->_headerDescription];
    [(objc_class *)v8 prefetchResourcesForSettingsHeaderFooterDescription:self->_headerDescription reason:0 context:v6];
    [(objc_class *)v8 requestLayoutForSettingsHeaderFooterDescription:self->_headerDescription width:v6 context:a3];
  }
  settingDescriptions = self->_settingDescriptions;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__SKUISettingsGroupDescription_requestLayoutForWidth_context___block_invoke;
  v11[3] = &unk_1E6424E30;
  id v12 = v6;
  double v13 = a3;
  id v10 = v6;
  [(SKUISettingsObjectStore *)settingDescriptions enumerateObjects:v11];
}

void __62__SKUISettingsGroupDescription_requestLayoutForWidth_context___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = +[SKUISettingDescription viewClassForSettingDescription:v4];
  [(objc_class *)v3 prefetchResourcesForSettingDescription:v4 reason:0 context:*(void *)(a1 + 32)];
  [(objc_class *)v3 requestLayoutForSettingDescription:v4 width:*(void *)(a1 + 32) context:*(double *)(a1 + 40)];
}

- (void)revealSettingDescription:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(SKUISettingsObjectStore *)self->_settingDescriptions numberOfVisibleObjects];
  [(SKUISettingsObjectStore *)self->_settingDescriptions revealObject:v5];
  if (v4) {
    [(SKUISettingsGroupDescription *)self _dispatchUpdateForSettingDescription:v5 updateType:4];
  }
  else {
    [(SKUISettingsGroupDescription *)self revealSettingsGroup];
  }
}

- (void)revealSettingsGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained revealSettingsGroupDescription:self];
}

- (void)setFooterDescription:(id)a3
{
}

- (void)setFooterViewElement:(id)a3
{
  unint64_t v4 = +[SKUISettingsHeaderFooterDescription settingsHeaderFooterDescriptionWithViewElement:a3];
  footerDescription = self->_footerDescription;
  self->_footerDescription = v4;

  MEMORY[0x1F41817F8](v4, footerDescription);
}

- (void)setHeaderDescription:(id)a3
{
}

- (void)setHeaderViewElement:(id)a3
{
  unint64_t v4 = +[SKUISettingsHeaderFooterDescription settingsHeaderFooterDescriptionWithViewElement:a3];
  headerDescription = self->_headerDescription;
  self->_headerDescription = v4;

  MEMORY[0x1F41817F8](v4, headerDescription);
}

- (id)settingDescriptionAtIndex:(unint64_t)a3
{
  return [(SKUISettingsObjectStore *)self->_settingDescriptions visibleObjectAtIndex:a3];
}

- (id)viewElementForSettingAtIndex:(unint64_t)a3
{
  v3 = [(SKUISettingsGroupDescription *)self settingDescriptionAtIndex:a3];
  unint64_t v4 = [v3 viewElement];

  return v4;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v11.receiver = self;
  v11.super_class = (Class)SKUISettingsGroupDescription;
  unint64_t v4 = [(SKUISettingsGroupDescription *)&v11 description];
  id v5 = (void *)[v3 initWithFormat:@"%@: [", v4];

  settingDescriptions = self->_settingDescriptions;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__SKUISettingsGroupDescription_description__block_invoke;
  v9[3] = &unk_1E6424E58;
  id v7 = v5;
  id v10 = v7;
  [(SKUISettingsObjectStore *)settingDescriptions enumerateObjects:v9];
  [v7 appendString:@"\n]"];

  return v7;
}

void __43__SKUISettingsGroupDescription_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 description];
  [v2 appendFormat:@"\n %@", v3];
}

- (void)_dispatchUpdateForSettingDescription:(id)a3 updateType:(int64_t)a4
{
  id v8 = [(SKUISettingsGroupDescription *)self indexPathForSettingDescription:a3];
  if (v8)
  {
    id v6 = [[SKUISettingsDescriptionUpdate alloc] initWithUpdateType:a4];
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObject:v8];
    [(SKUISettingsDescriptionUpdate *)v6 setIndexPaths:v7];

    [(SKUISettingsGroupDescription *)self dispatchUpdate:v6];
  }
}

- (void)_dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  p_parent = &self->_parent;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  [WeakRetained _dismissViewController:v9 animated:v5 completion:v8];
}

- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  p_parent = &self->_parent;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  [WeakRetained _presentViewController:v9 animated:v5 completion:v8];
}

- (void)_updatedEditsValid
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained _updatedEditsValid];
}

- (SKUISettingsGroupController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (SKUISettingsGroupController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (SKUISettingsGroupsDescription)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (SKUISettingsGroupsDescription *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (SKUIGroupViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak((id *)&self->_settingsContext);
  objc_storeStrong((id *)&self->_settingDescriptions, 0);
  objc_storeStrong((id *)&self->_headerDescription, 0);
  objc_storeStrong((id *)&self->_footerDescription, 0);

  objc_storeStrong((id *)&self->_editableSettings, 0);
}

- (void)initWithParent:settingsContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISettingsGroupDescription initWithParent:settingsContext:]";
}

@end