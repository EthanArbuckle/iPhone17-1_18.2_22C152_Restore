@interface EVOnboardingVehicleAddedViewController
- (EVOnboardingVehicleAddedViewController)initWithVehicle:(id)a3 isLastPresentedController:(BOOL)a4 delegate:(id)a5;
- (id)obViewController;
- (void)_donePressed;
- (void)_nextPressed;
@end

@implementation EVOnboardingVehicleAddedViewController

- (EVOnboardingVehicleAddedViewController)initWithVehicle:(id)a3 isLastPresentedController:(BOOL)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EVOnboardingVehicleAddedViewController;
  v11 = [(EVOnboardingBaseViewController *)&v14 initWithDelegate:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_vehicle, a3);
    v12->_isLastPresentedController = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (id)obViewController
{
  v3 = +[NSBundle mainBundle];
  uint64_t v4 = [v3 localizedStringForKey:@"[EV Onboarding] Vehicle added title" value:@"localized string not found" table:0];

  v5 = self;
  v46 = self;
  v6 = [(VGVehicle *)self->_vehicle combinedDisplayName];
  v52 = (void *)v4;
  uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v6);

  v8 = +[NSBundle mainBundle];
  uint64_t v9 = [v8 localizedStringForKey:@"[EV Onboarding] Vehicle added subtitle" value:@"localized string not found" table:0];

  id v10 = [(VGVehicle *)v5->_vehicle combinedDisplayName];
  v50 = (void *)v9;
  uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);

  v51 = (void *)v7;
  v49 = (void *)v11;
  id v42 = [objc_alloc((Class)OBWelcomeController) initWithTitle:v7 detailText:v11 icon:0];
  [v42 setModalPresentationStyle:2];
  v12 = +[UIImage systemImageNamed:@"bolt.car.fill"];
  uint64_t v13 = [v12 imageWithoutBaseline];

  v48 = (void *)v13;
  objc_super v14 = -[PersonalizedImageView initWithMainImage:mainImageSize:userImageDiameter:userImageExtensionPastMainImage:]([PersonalizedImageView alloc], "initWithMainImage:mainImageSize:userImageDiameter:userImageExtensionPastMainImage:", v13, 135.0, 100.0, 48.0, 3.0);
  [(PersonalizedImageView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  v15 = [v42 headerView];
  v16 = [v15 customIconContainerView];

  [v16 addSubview:v14];
  v45 = [(PersonalizedImageView *)v14 topAnchor];
  v44 = [v16 topAnchor];
  v43 = [v45 constraintGreaterThanOrEqualToAnchor:v44];
  v53[0] = v43;
  v41 = [(PersonalizedImageView *)v14 leadingAnchor];
  v40 = [v16 leadingAnchor];
  v39 = [v41 constraintGreaterThanOrEqualToAnchor:v40];
  v53[1] = v39;
  v38 = [(PersonalizedImageView *)v14 trailingAnchor];
  v37 = [v16 trailingAnchor];
  v36 = [v38 constraintLessThanOrEqualToAnchor:v37];
  v53[2] = v36;
  v35 = [(PersonalizedImageView *)v14 bottomAnchor];
  v17 = [v16 bottomAnchor];
  v18 = [v35 constraintLessThanOrEqualToAnchor:v17];
  v53[3] = v18;
  v19 = [(PersonalizedImageView *)v14 centerXAnchor];
  v20 = [v16 centerXAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v53[4] = v21;
  v22 = [(PersonalizedImageView *)v14 centerYAnchor];
  v47 = v16;
  v23 = [v16 centerYAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  v53[5] = v24;
  v25 = +[NSArray arrayWithObjects:v53 count:6];
  +[NSLayoutConstraint activateConstraints:v25];

  v26 = [v42 headerView];
  [v26 setTitleTrailingSymbol:@"checkmark"];

  v27 = +[OBBoldTrayButton boldButton];
  v28 = v27;
  if (v46->_isLastPresentedController)
  {
    [v27 addTarget:action:forControlEvents:];
    v29 = +[NSBundle mainBundle];
    v30 = v29;
    CFStringRef v31 = @"[EV Onboarding] Done button";
  }
  else
  {
    [v27 addTarget:action:forControlEvents:];
    v29 = +[NSBundle mainBundle];
    v30 = v29;
    CFStringRef v31 = @"[EV Onboarding] Next button";
  }
  v32 = [v29 localizedStringForKey:v31 value:@"localized string not found" table:0];
  [v28 setTitle:v32 forState:0];

  [v28 setAccessibilityIdentifier:@"ConnectButton"];
  v33 = [v42 buttonTray];
  [v33 addButton:v28];

  return v42;
}

- (void)_donePressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained vehicleAddedViewControllerDidSelectDone:self];
}

- (void)_nextPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained vehicleAddedViewControllerDidSelectNext:self];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end