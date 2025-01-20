@interface SFStartPageMultiSectionDataSource
- (BOOL)startPageCollectionViewController:(id)a3 isSectionExpanded:(id)a4;
- (NSString)title;
- (SFStartPageMultiSectionDataSource)initWithSectionTitle:(id)a3 reloadHandler:(id)a4 navigationItemHandler:(id)a5;
- (id)navigationItemHandler;
- (id)reloadHandler;
- (id)sectionsForStartPageCollectionViewController:(id)a3;
- (int64_t)customizationControlPolicyForStartPageCollectionViewController:(id)a3;
- (void)_reloadSections;
- (void)connectToViewController:(id)a3;
- (void)reloadDataAnimatingDifferences:(BOOL)a3;
- (void)reloadNavigationItemAnimated:(BOOL)a3;
- (void)startPageCollectionViewControllerWillUpdateNavigationBar:(id)a3;
@end

@implementation SFStartPageMultiSectionDataSource

- (SFStartPageMultiSectionDataSource)initWithSectionTitle:(id)a3 reloadHandler:(id)a4 navigationItemHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SFStartPageMultiSectionDataSource;
  v12 = [(SFStartPageMultiSectionDataSource *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    v14 = _Block_copy(v10);
    id reloadHandler = v13->_reloadHandler;
    v13->_id reloadHandler = v14;

    v16 = _Block_copy(v11);
    id navigationItemHandler = v13->_navigationItemHandler;
    v13->_id navigationItemHandler = v16;

    v18 = v13;
  }

  return v13;
}

- (void)connectToViewController:(id)a3
{
  sections = self->_sections;
  id obj = a3;
  if (![(NSArray *)sections count]) {
    [(SFStartPageMultiSectionDataSource *)self _reloadSections];
  }
  [obj setDisplaysSectionHeaders:1];
  [obj setStrongDataSource:self];
  objc_storeWeak((id *)&self->_collectionViewController, obj);
}

- (void)_reloadSections
{
  (*((void (**)(void))self->_reloadHandler + 2))();
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sections = self->_sections;
  self->_sections = v3;
}

- (void)reloadDataAnimatingDifferences:(BOOL)a3
{
  BOOL v3 = a3;
  [(SFStartPageMultiSectionDataSource *)self _reloadSections];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionViewController);
  [WeakRetained reloadDataAnimatingDifferences:v3];
}

- (void)reloadNavigationItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionViewController);
  [WeakRetained reloadNavigationItemAnimated:v3];
}

- (id)sectionsForStartPageCollectionViewController:(id)a3
{
  return self->_sections;
}

- (BOOL)startPageCollectionViewController:(id)a3 isSectionExpanded:(id)a4
{
  return 1;
}

- (void)startPageCollectionViewControllerWillUpdateNavigationBar:(id)a3
{
  id v5 = [a3 navigationItem];
  (*((void (**)(void))self->_navigationItemHandler + 2))();
  if (self->_title) {
    title = (__CFString *)self->_title;
  }
  else {
    title = &stru_1EDA07C28;
  }
  [v5 setTitle:title];
}

- (int64_t)customizationControlPolicyForStartPageCollectionViewController:(id)a3
{
  return 2;
}

- (NSString)title
{
  return self->_title;
}

- (id)reloadHandler
{
  return self->_reloadHandler;
}

- (id)navigationItemHandler
{
  return self->_navigationItemHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_navigationItemHandler, 0);
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sections, 0);

  objc_destroyWeak((id *)&self->_collectionViewController);
}

@end