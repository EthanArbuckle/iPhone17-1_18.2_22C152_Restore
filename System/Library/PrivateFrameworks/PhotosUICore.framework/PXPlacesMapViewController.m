@interface PXPlacesMapViewController
- (PKExtendedTraitCollection)pk_extendedTraitCollection;
- (PXPlacesMapController)mapController;
- (PXPlacesMapViewController)init;
- (PXPlacesMapViewController)initWithCoder:(id)a3;
- (PXPlacesMapViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)sendTraitNotification;
- (void)setMapController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PXPlacesMapViewController

- (void).cxx_destruct
{
}

- (void)setMapController:(id)a3
{
}

- (PXPlacesMapController)mapController
{
  return self->_mapController;
}

- (void)sendTraitNotification
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PXPlacesMapViewController *)self pk_extendedTraitCollection];
  v5 = @"kPKExtendedTraitCollectionKey";
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"kPKExtendedTraitCollectionChangedNotification" object:0 userInfo:v3];
}

- (PKExtendedTraitCollection)pk_extendedTraitCollection
{
  v2 = [(UIViewController *)self px_extendedTraitCollection];
  v3 = objc_alloc_init(PXPlacesUtils);
  v4 = [(PXPlacesUtils *)v3 pkExtendedTraitCollectionFromPXExtendedTraitCollection:v2];

  return (PKExtendedTraitCollection *)v4;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapViewController;
  [(PXPlacesMapViewController *)&v5 viewDidDisappear:a3];
  v4 = [(PXPlacesMapViewController *)self mapController];
  [v4 mapContainerViewDidDisappear];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapViewController;
  [(PXPlacesMapViewController *)&v5 viewWillDisappear:a3];
  v4 = [(PXPlacesMapViewController *)self mapController];
  [v4 mapContainerViewWillDisappear];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapViewController;
  [(PXPlacesMapViewController *)&v5 viewDidAppear:a3];
  v4 = [(PXPlacesMapViewController *)self mapController];
  [v4 mapContainerViewDidAppear];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPlacesMapViewController;
  [(PXPlacesMapViewController *)&v5 viewWillAppear:a3];
  v4 = [(PXPlacesMapViewController *)self mapController];
  [v4 mapContainerViewWillAppear];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PXPlacesMapViewController;
  [(PXPlacesMapViewController *)&v4 viewDidLoad];
  v3 = [(UIViewController *)self px_extendedTraitCollection];
  [v3 registerChangeObserver:self context:0];

  [(PXPlacesMapViewController *)self sendTraitNotification];
}

- (void)loadView
{
  v3 = [(PXPlacesMapViewController *)self nibName];

  if (v3)
  {
    v10.receiver = self;
    v10.super_class = (Class)PXPlacesMapViewController;
    [(PXPlacesMapViewController *)&v10 loadView];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    objc_super v4 = [(PXPlacesMapViewController *)self mapController];
    objc_super v5 = [v4 mapView];

    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 addSubview:v5];
    v6 = _NSDictionaryOfVariableBindings(&cfstr_Mapview.isa, v5, 0);
    v7 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[mapView]|" options:0 metrics:0 views:v6];
    [v9 addConstraints:v7];

    v8 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[mapView]|" options:0 metrics:0 views:v6];
    [v9 addConstraints:v8];

    [(PXPlacesMapViewController *)self setView:v9];
  }
}

- (PXPlacesMapViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapViewController.m", 38, @"%s is not available as initializer", "-[PXPlacesMapViewController initWithCoder:]");

  abort();
}

- (PXPlacesMapViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesMapViewController.m", 34, @"%s is not available as initializer", "-[PXPlacesMapViewController initWithNibName:bundle:]");

  abort();
}

- (PXPlacesMapViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXPlacesMapViewController;
  v2 = [(PXPlacesMapViewController *)&v7 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2)
  {
    [(UIViewController *)v2 px_enableExtendedTraitCollection];
    objc_super v4 = objc_alloc_init(PXPlacesMapController);
    mapController = v3->_mapController;
    v3->_mapController = v4;
  }
  return v3;
}

@end