@interface LibrarySectionController
- (LibraryConfiguration)configuration;
- (LibraryContentObserver)contentObserver;
- (LibrarySectionController)initWithConfiguration:(id)a3;
- (NSArray)filteredItemControllers;
- (NSArray)itemControllers;
- (NSString)title;
- (UIViewController)presentingViewController;
- (id)itemControllerToHandleDropItemsFromSession:(id)a3 withProposedDestinationItemController:(id)a4 atIndex:(int64_t)a5;
- (void)contentDidChange;
- (void)setContentObserver:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation LibrarySectionController

- (LibrarySectionController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LibrarySectionController;
  v6 = [(LibrarySectionController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)filteredItemControllers
{
  v2 = [(LibrarySectionController *)self itemControllers];
  v3 = objc_msgSend(v2, "safari_filterObjectsUsingBlock:", &__block_literal_global_4);

  return (NSArray *)v3;
}

uint64_t __51__LibrarySectionController_filteredItemControllers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (void)contentDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentObserver);
  [WeakRetained librarySectionContentDidChange:self];
}

- (id)itemControllerToHandleDropItemsFromSession:(id)a3 withProposedDestinationItemController:(id)a4 atIndex:(int64_t)a5
{
  id v5 = a4;
  return v5;
}

- (LibraryConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)itemControllers
{
  return self->_itemControllers;
}

- (LibraryContentObserver)contentObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentObserver);
  return (LibraryContentObserver *)WeakRetained;
}

- (void)setContentObserver:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_contentObserver);
  objc_storeStrong((id *)&self->_itemControllers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end