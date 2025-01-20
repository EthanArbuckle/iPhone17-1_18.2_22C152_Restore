@interface SFStartPageSingleSectionDataSource
- (BOOL)startPageCollectionViewController:(id)a3 isSectionExpanded:(id)a4;
- (SFStartPageSingleSectionDataSource)initWithReloadHandler:(id)a3 navigationItemHandler:(id)a4;
- (id)sectionsForStartPageCollectionViewController:(id)a3;
- (int64_t)customizationControlPolicyForStartPageCollectionViewController:(id)a3;
- (void)_reloadSection;
- (void)connectToViewController:(id)a3;
- (void)reloadDataAnimatingDifferences:(BOOL)a3;
- (void)reloadNavigationItemAnimated:(BOOL)a3;
- (void)startPageCollectionViewControllerWillUpdateNavigationBar:(id)a3;
@end

@implementation SFStartPageSingleSectionDataSource

- (SFStartPageSingleSectionDataSource)initWithReloadHandler:(id)a3 navigationItemHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFStartPageSingleSectionDataSource;
  v8 = [(SFStartPageSingleSectionDataSource *)&v15 init];
  if (v8)
  {
    v9 = _Block_copy(v6);
    id reloadHandler = v8->_reloadHandler;
    v8->_id reloadHandler = v9;

    v11 = _Block_copy(v7);
    id navigationItemHandler = v8->_navigationItemHandler;
    v8->_id navigationItemHandler = v11;

    v13 = v8;
  }

  return v8;
}

- (void)connectToViewController:(id)a3
{
  id v4 = a3;
  id obj = v4;
  if (!self->_section)
  {
    [(SFStartPageSingleSectionDataSource *)self _reloadSection];
    id v4 = obj;
  }
  [v4 setDisplaysSectionHeaders:0];
  [obj setStrongDataSource:self];
  objc_storeWeak((id *)&self->_collectionViewController, obj);
}

- (void)_reloadSection
{
  (*((void (**)(void))self->_reloadHandler + 2))();
  v3 = (WBSStartPageSection *)objc_claimAutoreleasedReturnValue();
  section = self->_section;
  self->_section = v3;
}

- (void)reloadDataAnimatingDifferences:(BOOL)a3
{
  BOOL v3 = a3;
  [(SFStartPageSingleSectionDataSource *)self _reloadSection];
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
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_section)
  {
    v5[0] = self->_section;
    BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (BOOL)startPageCollectionViewController:(id)a3 isSectionExpanded:(id)a4
{
  return 1;
}

- (void)startPageCollectionViewControllerWillUpdateNavigationBar:(id)a3
{
  id v5 = [a3 navigationItem];
  (*((void (**)(void))self->_navigationItemHandler + 2))();
  id v4 = [(WBSStartPageSection *)self->_section title];
  [v5 setTitle:v4];
}

- (int64_t)customizationControlPolicyForStartPageCollectionViewController:(id)a3
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_navigationItemHandler, 0);
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_storeStrong((id *)&self->_section, 0);

  objc_destroyWeak((id *)&self->_collectionViewController);
}

@end