@interface RAPPlaceViewController
- (RAPPlaceViewController)initWithMapItem:(id)a3;
- (void)actionButtonTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation RAPPlaceViewController

- (RAPPlaceViewController)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPPlaceViewController;
  v6 = [(RAPPlaceViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)RAPPlaceViewController;
  [(RAPPlaceViewController *)&v38 viewDidLoad];
  v3 = [(MKMapItem *)self->_mapItem name];
  [(RAPPlaceViewController *)self setTitle:v3];

  v4 = +[UIColor systemGroupedBackgroundColor];
  id v5 = [(RAPPlaceViewController *)self view];
  [v5 setBackgroundColor:v4];

  id v37 = objc_alloc_init((Class)MUPlaceViewControllerConfiguration);
  [v37 setOptions:35658312];
  v6 = (MUPlaceViewController *)[objc_alloc((Class)MUPlaceViewController) initWithConfiguration:v37];
  placeViewController = self->_placeViewController;
  self->_placeViewController = v6;

  [(MUPlaceViewController *)self->_placeViewController setMapItem:self->_mapItem];
  v8 = [(MUPlaceViewController *)self->_placeViewController view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(RAPPlaceViewController *)self addChildViewController:self->_placeViewController];
  objc_super v9 = [(RAPPlaceViewController *)self view];
  v10 = [(MUPlaceViewController *)self->_placeViewController view];
  [v9 addSubview:v10];

  [(MUPlaceViewController *)self->_placeViewController didMoveToParentViewController:self];
  v36 = [(MUPlaceViewController *)self->_placeViewController view];
  v34 = [v36 leadingAnchor];
  v35 = [(RAPPlaceViewController *)self view];
  v33 = [v35 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v39[0] = v32;
  v31 = [(MUPlaceViewController *)self->_placeViewController view];
  v29 = [v31 trailingAnchor];
  v30 = [(RAPPlaceViewController *)self view];
  v28 = [v30 trailingAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v39[1] = v27;
  v26 = [(MUPlaceViewController *)self->_placeViewController view];
  v25 = [v26 topAnchor];
  v11 = [(RAPPlaceViewController *)self view];
  v12 = [v11 topAnchor];
  v13 = [v25 constraintEqualToAnchor:v12];
  v39[2] = v13;
  v14 = [(MUPlaceViewController *)self->_placeViewController view];
  v15 = [v14 bottomAnchor];
  v16 = [(RAPPlaceViewController *)self view];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v39[3] = v18;
  v19 = +[NSArray arrayWithObjects:v39 count:4];
  +[NSLayoutConstraint activateConstraints:v19];

  id v20 = objc_alloc((Class)UIBarButtonItem);
  v21 = +[NSBundle mainBundle];
  v22 = [v21 localizedStringForKey:@"Done" value:@"localized string not found" table:0];
  id v23 = [v20 initWithTitle:v22 style:2 target:self action:"actionButtonTapped:"];
  v24 = [(RAPPlaceViewController *)self navigationItem];
  [v24 setRightBarButtonItem:v23];
}

- (void)actionButtonTapped:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_placeViewController, 0);
}

@end