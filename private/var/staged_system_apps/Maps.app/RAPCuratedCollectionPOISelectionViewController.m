@interface RAPCuratedCollectionPOISelectionViewController
- (RAPCuratedCollectionPOISelectionViewController)initWithReport:(id)a3 parentQuestion:(id)a4 completion:(id)a5;
- (id)_mapItemAtIndex:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_numberOfMapItems;
- (void)_cancel;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation RAPCuratedCollectionPOISelectionViewController

- (RAPCuratedCollectionPOISelectionViewController)initWithReport:(id)a3 parentQuestion:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)RAPCuratedCollectionPOISelectionViewController;
  v12 = [(RAPCuratedCollectionPOISelectionViewController *)&v21 initWithStyle:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_question, a4);
    objc_storeStrong((id *)&v13->_report, a3);
    id v14 = [v11 copy];
    id completion = v13->_completion;
    v13->_id completion = v14;

    v16 = [(RAPCuratedCollectionPOISelectionViewController *)v13 tableView];
    [v16 _maps_initializeRAPAppearance];

    v17 = [(RAPCuratedCollectionPOISelectionViewController *)v13 tableView];
    uint64_t v18 = objc_opt_class();
    v19 = +[RAPTwoLinesMenuTableViewCell reuseIdentifier];
    [v17 registerClass:v18 forCellReuseIdentifier:v19];
  }
  return v13;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)RAPCuratedCollectionPOISelectionViewController;
  [(RAPCuratedCollectionPOISelectionViewController *)&v11 viewDidLoad];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Report an Individual Place [Curated Collections]" value:@"localized string not found" table:0];
  v5 = [(RAPCuratedCollectionPOISelectionViewController *)self navigationItem];
  [v5 setTitle:v4];

  id v6 = objc_alloc((Class)UIBarButtonItem);
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"Cancel [Report a Problem Placecard]" value:@"localized string not found" table:0];
  id v9 = [v6 initWithTitle:v8 style:0 target:self action:"_cancel"];

  id v10 = [(RAPCuratedCollectionPOISelectionViewController *)self navigationItem];
  [v10 setLeftBarButtonItem:v9];
}

- (void)_cancel
{
  id completion = (void (**)(id, RAPCuratedCollectionPOISelectionViewController *, void))self->_completion;
  if (completion) {
    completion[2](completion, self, 0);
  }
}

- (id)_mapItemAtIndex:(unint64_t)a3
{
  v4 = [(RAPReport *)self->_report _context];
  v5 = [v4 curatedCollectionContext];
  id v6 = [v5 placeCollectionMapItems];
  v7 = [v6 objectAtIndexedSubscript:a3];

  v8 = [v7 mapItem];

  return v8;
}

- (unint64_t)_numberOfMapItems
{
  v2 = [(RAPReport *)self->_report _context];
  v3 = [v2 curatedCollectionContext];
  v4 = [v3 placeCollectionMapItems];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(RAPCuratedCollectionPOISelectionViewController *)self _numberOfMapItems];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"Pick the Place [RAP]" value:@"localized string not found" table:0];
  v7 = [v4 _maps_groupedHeaderViewWithTitle:v6];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[RAPTwoLinesMenuTableViewCell reuseIdentifier];
  id v9 = [v7 dequeueReusableCellWithIdentifier:v8];

  id v10 = [v6 row];
  objc_super v11 = [(RAPCuratedCollectionPOISelectionViewController *)self _mapItemAtIndex:v10];
  v12 = +[RAPTwoLinesViewModelImpl viewModelFromMapItem:v11];
  [v9 setViewModel:v12];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[RAPCuratedCollectionPOISelectionViewController _mapItemAtIndex:](self, "_mapItemAtIndex:", [v7 row]);
  [v6 deselectRowAtIndexPath:v7 animated:1];
  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100517AF4;
  v15 = &unk_1012EDBC8;
  objc_copyWeak(&v16, &location);
  id v9 = objc_retainBlock(&v12);
  id v10 = [(RAPCuratedCollectionPOISelectionViewController *)self _maps_mapsSceneDelegate];
  objc_super v11 = [v10 rapPresenter];
  [v11 presentRAPWebBundleWithMapItem:v8 fromEntryPoint:259 completion:v9];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_report, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end