@interface NavContactSearchViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NavActionCoordination)navActionCoordinator;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_contactValuesSelected:(id)a3;
- (void)loadContaineeHeaderView;
- (void)setNavActionCoordinator:(id)a3;
- (void)viewDidLoad;
@end

@implementation NavContactSearchViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)NavContactSearchViewController;
  [(ContactSearchViewController *)&v11 viewDidLoad];
  v3 = [(ContaineeViewController *)self cardPresentationController];
  [v3 setBlurInCardView:0];

  v4 = +[UIColor colorNamed:@"NavigationMaterialColor"];
  v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 setCardColor:v4];

  id v6 = objc_alloc((Class)NSOrderedSet);
  v7 = +[MSPSharedTripService sharedInstance];
  v8 = [v7 receivers];
  v9 = (NSOrderedSet *)[v6 initWithArray:v8];
  activeContactsValues = self->_activeContactsValues;
  self->_activeContactsValues = v9;
}

- (void)loadContaineeHeaderView
{
  v3 = [ModalCardHeaderView alloc];
  v4 = +[ModalCardHeaderConfiguration leadingNavigationModalCardHeaderCompactConfiguration];
  v13 = [(ModalCardHeaderView *)v3 initWithConfiguration:v4];

  [(ModalCardHeaderView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"[SharedETA] Contacts Title" value:@"localized string not found" table:0];
  [(ModalCardHeaderView *)v13 setTitle:v6];

  v7 = [(ModalCardHeaderView *)v13 trailingButton];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"[SharedETA] Contacts cancel button" value:@"localized string not found" table:0];
  [v7 setTitle:v9 forState:0];

  v10 = [(ModalCardHeaderView *)v13 trailingButton];
  [v10 addTarget:self action:"_cancelAction:" forControlEvents:64];

  objc_super v11 = [(ModalCardHeaderView *)v13 bottomHairline];
  [v11 setAlpha:0.0];

  v12 = [(NavContactSearchViewController *)self view];
  [v12 addSubview:v13];

  [(ContactSearchViewController *)self setTitleHeaderView:v13];
}

- (void)_contactValuesSelected:(id)a3
{
  id v4 = a3;
  v5 = [(ContactSearchViewController *)self suggestionDataSource];
  [v5 toggleContact:v4];

  [(ContaineeViewController *)self handleDismissAction:0];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(ContactSearchViewController *)self contactValues];
  id v7 = [v5 row];

  v8 = [v6 objectAtIndexedSubscript:v7];

  LOBYTE(self) = ![(NSOrderedSet *)self->_activeContactsValues containsObject:v8];
  return (char)self;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ContactSearchViewController *)self contactValues];
  v9 = [v8 objectAtIndexedSubscript:[v6 row]];

  v13.receiver = self;
  v13.super_class = (Class)NavContactSearchViewController;
  v10 = [(ContactSearchViewController *)&v13 tableView:v7 cellForRowAtIndexPath:v6];

  if ([(NSOrderedSet *)self->_activeContactsValues containsObject:v9])
  {
    objc_super v11 = +[UIColor secondaryLabelColor];
    [v10 setCapabilityColor:v11];
  }

  return v10;
}

- (NavActionCoordination)navActionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navActionCoordinator);

  return (NavActionCoordination *)WeakRetained;
}

- (void)setNavActionCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navActionCoordinator);

  objc_storeStrong((id *)&self->_activeContactsValues, 0);
}

@end