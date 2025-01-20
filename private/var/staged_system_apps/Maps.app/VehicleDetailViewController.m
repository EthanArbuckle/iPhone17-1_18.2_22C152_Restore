@interface VehicleDetailViewController
- (BOOL)_isMinimumViableVehicle;
- (NSArray)tableStructure;
- (UIImageView)vehicleIconView;
- (UILabel)vehicleNameLabel;
- (UITableView)tableView;
- (UIView)headerView;
- (UIView)vehicleColorView;
- (VehicleAppCell)appCell;
- (VehicleBatteryView)vehicleBatteryView;
- (VehicleDetailViewController)initWithVehicle:(id)a3 delegate:(id)a4;
- (VehicleDetailViewControllerDelegate)delegate;
- (VehicleLabelCell)addNetworksCell;
- (VehicleLabelCell)deleteCell;
- (VehicleLabelCell)editLicensePlateCell;
- (VehicleTitleDetailCell)editPlugsCell;
- (VehicleTitleDetailCell)licensePlateCell;
- (VehicleTitleDetailCell)vehicleMakeCell;
- (VehicleTitleDetailCell)vehicleModelCell;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)vehicleCount;
- (void)_pressedEdit;
- (void)_pressedOpen;
- (void)_reloadAndSave:(BOOL)a3;
- (void)_saveIfAppropriate;
- (void)_updateContent;
- (void)confirmRemoveVehicle;
- (void)dismiss;
- (void)editVehicleViewController:(id)a3 didSelectColor:(id)a4 nickname:(id)a5 removedNetworks:(id)a6;
- (void)editVehicleViewControllerDidSelectDone:(id)a3;
- (void)networkPickerControllerDidSelectNetworks:(id)a3;
- (void)setAddNetworksCell:(id)a3;
- (void)setAppCell:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteCell:(id)a3;
- (void)setEditLicensePlateCell:(id)a3;
- (void)setEditPlugsCell:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setLicensePlateCell:(id)a3;
- (void)setTableStructure:(id)a3;
- (void)setTableView:(id)a3;
- (void)setVehicleBatteryView:(id)a3;
- (void)setVehicleColorView:(id)a3;
- (void)setVehicleCount:(unint64_t)a3;
- (void)setVehicleIconView:(id)a3;
- (void)setVehicleMakeCell:(id)a3;
- (void)setVehicleModelCell:(id)a3;
- (void)setVehicleNameLabel:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation VehicleDetailViewController

- (VehicleDetailViewController)initWithVehicle:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VehicleDetailViewController;
  v8 = [(VehicleDetailViewController *)&v16 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = (VGVehicle *)[v6 copy];
    vehicle = v9->_vehicle;
    v9->_vehicle = v10;

    id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:2 target:v9 action:"_pressedEdit"];
    v13 = [(VehicleDetailViewController *)v9 navigationItem];
    [v13 setRightBarButtonItem:v12];

    v14 = +[VGVirtualGarageService sharedService];
    [v14 registerObserver:v9];
  }
  return v9;
}

- (NSArray)tableStructure
{
  tableStructure = self->_tableStructure;
  if (!tableStructure)
  {
    v4 = NSCollectionLayoutEdgeSpacing_ptr;
    v5 = objc_opt_new();
    if (MapsFeature_IsEnabled_Alberta())
    {
      id v6 = objc_opt_new();
      id v7 = [(VGVehicle *)self->_vehicle licensePlate];
      id v8 = [v7 length];

      if (v8)
      {
        v9 = [(VehicleDetailViewController *)self licensePlateCell];
        [v6 addObject:v9];
      }
      v10 = [(VehicleDetailViewController *)self editLicensePlateCell];
      [v6 addObject:v10];

      v11 = [[VehicleDetailTableSection alloc] initWithCells:v6];
      id v12 = +[NSBundle mainBundle];
      v13 = [v12 localizedStringForKey:@"[Virtual Garage] LPR Information" value:@"localized string not found" table:0];
      [(VehicleDetailTableSection *)v11 setHeaderTitle:v13];

      [v5 addObject:v11];
      v4 = NSCollectionLayoutEdgeSpacing_ptr;
    }
    if ([(VGVehicle *)self->_vehicle isPureElectricVehicle]
      && MapsFeature_IsEnabled_EVRoutingEnhancements())
    {
      v14 = [(VGVehicle *)self->_vehicle preferredChargingNetworks];
      v15 = [v14 allObjects];
      v50 = [v15 sortedArrayUsingComparator:&stru_101317338];

      v49 = sub_100099700(v50, &stru_101317358);
      objc_super v16 = [VehicleDetailTableSection alloc];
      v17 = [(VehicleDetailViewController *)self addNetworksCell];
      v18 = [v49 arrayByAddingObject:v17];
      v19 = [(VehicleDetailTableSection *)v16 initWithCells:v18];

      v20 = +[NSBundle mainBundle];
      v21 = [v20 localizedStringForKey:@"[Virtual Garage] Preferred Charging Networks header" value:@"localized string not found" table:0];
      [(VehicleDetailTableSection *)v19 setHeaderTitle:v21];

      v22 = +[NSBundle mainBundle];
      v23 = [v22 localizedStringForKey:@"[Virtual Garage] Preferred Charging Networks footer" value:@"localized string not found" table:0];
      [(VehicleDetailTableSection *)v19 setFooterText:v23];

      [v5 addObject:v19];
    }
    id v24 = objc_alloc_init((Class)v4[42]);
    v25 = [(VGVehicle *)self->_vehicle manufacturer];
    id v26 = [v25 length];

    if (v26)
    {
      v27 = [(VehicleDetailViewController *)self vehicleMakeCell];
      [v24 addObject:v27];
    }
    v28 = [(VGVehicle *)self->_vehicle model];
    id v29 = [v28 length];

    if (v29)
    {
      v30 = [(VehicleDetailViewController *)self vehicleModelCell];
      [v24 addObject:v30];
    }
    v31 = +[NSUserDefaults standardUserDefaults];
    BOOL v32 = ([v31 BOOLForKey:@"VirtualGarageEditConnectorPlugs"] & 1) != 0
       || [(VGVehicle *)self->_vehicle supportedConnectors] != 0;

    if ([(VGVehicle *)self->_vehicle isPureElectricVehicle] && v32)
    {
      v33 = [(VehicleDetailViewController *)self editPlugsCell];
      [v24 addObject:v33];
    }
    if ([v24 count])
    {
      v34 = [[VehicleDetailTableSection alloc] initWithCells:v24];
      v35 = +[NSBundle mainBundle];
      v36 = [v35 localizedStringForKey:@"[Virtual Garage] Vehicle Information" value:@"localized string not found" table:0];
      [(VehicleDetailTableSection *)v34 setHeaderTitle:v36];

      [v5 addObject:v34];
    }
    v37 = [(VGVehicle *)self->_vehicle applicationRecord];

    if (v37)
    {
      v38 = [VehicleDetailTableSection alloc];
      v39 = [(VehicleDetailViewController *)self appCell];
      v52 = v39;
      v40 = +[NSArray arrayWithObjects:&v52 count:1];
      v41 = [(VehicleDetailTableSection *)v38 initWithCells:v40];

      [v5 addObject:v41];
    }
    v42 = [VehicleDetailTableSection alloc];
    v43 = [(VehicleDetailViewController *)self deleteCell];
    v51 = v43;
    v44 = +[NSArray arrayWithObjects:&v51 count:1];
    v45 = [(VehicleDetailTableSection *)v42 initWithCells:v44];
    [v5 addObject:v45];

    v46 = (NSArray *)[v5 copy];
    v47 = self->_tableStructure;
    self->_tableStructure = v46;

    tableStructure = self->_tableStructure;
  }

  return tableStructure;
}

- (UITableView)tableView
{
  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_tableView;
    self->_tableView = v4;

    [(UITableView *)self->_tableView setAccessibilityIdentifier:@"VehicleDetailTableView"];
    [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)self->_tableView setDataSource:self];
    [(UITableView *)self->_tableView setDelegate:self];
    id v6 = [(VehicleDetailViewController *)self headerView];
    [(UITableView *)self->_tableView setTableHeaderView:v6];

    [(UITableView *)self->_tableView setKeyboardDismissMode:1];
    tableView = self->_tableView;
  }

  return tableView;
}

- (UIView)headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    v4 = (UIView *)objc_opt_new();
    v5 = self->_headerView;
    self->_headerView = v4;

    [(UIView *)self->_headerView setAccessibilityIdentifier:@"VehicleDetailHeader"];
    id v6 = self->_headerView;
    id v7 = [(VehicleDetailViewController *)self vehicleColorView];
    [(UIView *)v6 addSubview:v7];

    id v8 = self->_headerView;
    v9 = [(VehicleDetailViewController *)self vehicleNameLabel];
    [(UIView *)v8 addSubview:v9];

    v10 = self->_headerView;
    v11 = [(VehicleDetailViewController *)self vehicleBatteryView];
    [(UIView *)v10 addSubview:v11];

    v42 = self->_headerView;
    v62 = [(VehicleDetailViewController *)self vehicleColorView];
    v61 = [v62 centerXAnchor];
    v60 = [(UIView *)self->_headerView centerXAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v63[0] = v59;
    v58 = [(VehicleDetailViewController *)self vehicleColorView];
    v57 = [v58 topAnchor];
    v56 = [(UIView *)self->_headerView topAnchor];
    v55 = [v57 constraintEqualToAnchor:v56 constant:32.0];
    v63[1] = v55;
    v54 = [(VehicleDetailViewController *)self vehicleColorView];
    v53 = [v54 widthAnchor];
    v52 = [v53 constraintEqualToConstant:100.0];
    v63[2] = v52;
    v51 = [(VehicleDetailViewController *)self vehicleColorView];
    v50 = [v51 heightAnchor];
    v49 = [v50 constraintEqualToConstant:100.0];
    v63[3] = v49;
    v48 = [(VehicleDetailViewController *)self vehicleNameLabel];
    v46 = [v48 topAnchor];
    v47 = [(VehicleDetailViewController *)self vehicleColorView];
    v45 = [v47 bottomAnchor];
    v44 = [v46 constraintEqualToAnchor:v45 constant:16.0];
    v63[4] = v44;
    v43 = [(VehicleDetailViewController *)self vehicleNameLabel];
    v41 = [v43 leadingAnchor];
    v40 = [(UIView *)self->_headerView leadingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 constant:8.0];
    v63[5] = v39;
    v38 = [(VehicleDetailViewController *)self vehicleNameLabel];
    v37 = [v38 trailingAnchor];
    v36 = [(UIView *)self->_headerView trailingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:-8.0];
    v63[6] = v35;
    v34 = [(VehicleDetailViewController *)self vehicleBatteryView];
    BOOL v32 = [v34 topAnchor];
    v33 = [(VehicleDetailViewController *)self vehicleNameLabel];
    v31 = [v33 bottomAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 constant:2.0];
    v63[7] = v30;
    id v29 = [(VehicleDetailViewController *)self vehicleBatteryView];
    v28 = [v29 centerXAnchor];
    v27 = [(UIView *)self->_headerView centerXAnchor];
    id v26 = [v28 constraintEqualToAnchor:v27];
    v63[8] = v26;
    v25 = [(VehicleDetailViewController *)self vehicleBatteryView];
    id v24 = [v25 leadingAnchor];
    v23 = [(UIView *)self->_headerView leadingAnchor];
    v22 = [v24 constraintGreaterThanOrEqualToAnchor:v23 constant:8.0];
    v63[9] = v22;
    v21 = [(VehicleDetailViewController *)self vehicleBatteryView];
    id v12 = [v21 trailingAnchor];
    v13 = [(UIView *)self->_headerView trailingAnchor];
    v14 = [v12 constraintLessThanOrEqualToAnchor:v13 constant:-8.0];
    v63[10] = v14;
    v15 = [(VehicleDetailViewController *)self vehicleBatteryView];
    objc_super v16 = [v15 bottomAnchor];
    v17 = [(UIView *)self->_headerView bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 constant:-24.0];
    v63[11] = v18;
    v19 = +[NSArray arrayWithObjects:v63 count:12];
    [(UIView *)v42 addConstraints:v19];

    headerView = self->_headerView;
  }

  return headerView;
}

- (UIView)vehicleColorView
{
  vehicleColorView = self->_vehicleColorView;
  if (!vehicleColorView)
  {
    v4 = (UIView *)objc_opt_new();
    v5 = self->_vehicleColorView;
    self->_vehicleColorView = v4;

    [(UIView *)self->_vehicleColorView setAccessibilityIdentifier:@"VehicleColorView"];
    [(UIView *)self->_vehicleColorView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [(UIView *)self->_vehicleColorView layer];
    [v6 setCornerRadius:50.0];

    id v7 = self->_vehicleColorView;
    id v8 = [(VehicleDetailViewController *)self vehicleIconView];
    [(UIView *)v7 addSubview:v8];

    v20 = self->_vehicleColorView;
    v27 = [(VehicleDetailViewController *)self vehicleIconView];
    id v26 = [v27 centerXAnchor];
    v25 = [(UIView *)self->_vehicleColorView centerXAnchor];
    id v24 = [v26 constraintEqualToAnchor:v25];
    v28[0] = v24;
    v23 = [(VehicleDetailViewController *)self vehicleIconView];
    v22 = [v23 centerYAnchor];
    v21 = [(UIView *)self->_vehicleColorView centerYAnchor];
    v19 = [v22 constraintEqualToAnchor:v21];
    v28[1] = v19;
    v18 = [(VehicleDetailViewController *)self vehicleIconView];
    v9 = [v18 widthAnchor];
    v10 = [(UIView *)self->_vehicleColorView widthAnchor];
    v11 = [v9 constraintLessThanOrEqualToAnchor:v10];
    v28[2] = v11;
    id v12 = [(VehicleDetailViewController *)self vehicleIconView];
    v13 = [v12 heightAnchor];
    v14 = [(UIView *)self->_vehicleColorView heightAnchor];
    v15 = [v13 constraintLessThanOrEqualToAnchor:v14];
    v28[3] = v15;
    objc_super v16 = +[NSArray arrayWithObjects:v28 count:4];
    [(UIView *)v20 addConstraints:v16];

    vehicleColorView = self->_vehicleColorView;
  }

  return vehicleColorView;
}

- (UIImageView)vehicleIconView
{
  vehicleIconView = self->_vehicleIconView;
  if (!vehicleIconView)
  {
    v4 = sub_1004BE4A0((int)[(VGVehicle *)self->_vehicle isPureElectricVehicle]);
    v5 = [v4 imageWithRenderingMode:2];

    id v6 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v5];
    id v7 = self->_vehicleIconView;
    self->_vehicleIconView = v6;

    [(UIImageView *)self->_vehicleIconView setAccessibilityIdentifier:@"VehicleIcon"];
    [(UIImageView *)self->_vehicleIconView setContentMode:1];
    [(UIImageView *)self->_vehicleIconView setTranslatesAutoresizingMaskIntoConstraints:0];

    vehicleIconView = self->_vehicleIconView;
  }

  return vehicleIconView;
}

- (UILabel)vehicleNameLabel
{
  vehicleNameLabel = self->_vehicleNameLabel;
  if (!vehicleNameLabel)
  {
    v4 = (UILabel *)objc_opt_new();
    v5 = self->_vehicleNameLabel;
    self->_vehicleNameLabel = v4;

    [(UILabel *)self->_vehicleNameLabel setAccessibilityIdentifier:@"VehicleNameLabel"];
    [(UILabel *)self->_vehicleNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle2 weight:UIFontWeightBold];
    [(UILabel *)self->_vehicleNameLabel setFont:v6];

    id v7 = +[UIColor labelColor];
    [(UILabel *)self->_vehicleNameLabel setTextColor:v7];

    [(UILabel *)self->_vehicleNameLabel setTextAlignment:1];
    LODWORD(v8) = 1148846080;
    [(UILabel *)self->_vehicleNameLabel setContentCompressionResistancePriority:1 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [(UILabel *)self->_vehicleNameLabel setContentHuggingPriority:1 forAxis:v9];
    vehicleNameLabel = self->_vehicleNameLabel;
  }

  return vehicleNameLabel;
}

- (VehicleBatteryView)vehicleBatteryView
{
  vehicleBatteryView = self->_vehicleBatteryView;
  if (!vehicleBatteryView)
  {
    v4 = [[VehicleBatteryView alloc] initWithVehicle:0 configuration:2 batteryChargeTextAtEdge:8];
    v5 = self->_vehicleBatteryView;
    self->_vehicleBatteryView = v4;

    [(VehicleBatteryView *)self->_vehicleBatteryView setAccessibilityIdentifier:@"VehicleBatteryView"];
    [(VehicleBatteryView *)self->_vehicleBatteryView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v6) = 1148846080;
    [(VehicleBatteryView *)self->_vehicleBatteryView setContentCompressionResistancePriority:1 forAxis:v6];
    LODWORD(v7) = 1148846080;
    [(VehicleBatteryView *)self->_vehicleBatteryView setContentHuggingPriority:1 forAxis:v7];
    vehicleBatteryView = self->_vehicleBatteryView;
  }

  return vehicleBatteryView;
}

- (VehicleLabelCell)addNetworksCell
{
  addNetworksCell = self->_addNetworksCell;
  if (!addNetworksCell)
  {
    v4 = (VehicleLabelCell *)objc_opt_new();
    v5 = self->_addNetworksCell;
    self->_addNetworksCell = v4;

    [(VehicleLabelCell *)self->_addNetworksCell setAccessibilityIdentifier:@"AddNetworksCell"];
    double v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"[Virtual Garage][Button] Add Network" value:@"localized string not found" table:0];
    double v8 = [(VehicleLabelCell *)self->_addNetworksCell label];
    [v8 setText:v7];

    double v9 = +[UIColor systemBlueColor];
    v10 = [(VehicleLabelCell *)self->_addNetworksCell label];
    [v10 setTextColor:v9];

    [(VehicleLabelCell *)self->_addNetworksCell setAccessoryType:0];
    addNetworksCell = self->_addNetworksCell;
  }

  return addNetworksCell;
}

- (VehicleTitleDetailCell)editPlugsCell
{
  editPlugsCell = self->_editPlugsCell;
  if (!editPlugsCell)
  {
    v4 = (VehicleTitleDetailCell *)objc_opt_new();
    v5 = self->_editPlugsCell;
    self->_editPlugsCell = v4;

    [(VehicleTitleDetailCell *)self->_editPlugsCell setAccessibilityIdentifier:@"EditPlugsCell"];
    double v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"[Virtual Garage][Button] Plug Type" value:@"localized string not found" table:0];
    double v8 = [(VehicleTitleDetailCell *)self->_editPlugsCell titleLabel];
    [v8 setText:v7];

    [(VehicleTitleDetailCell *)self->_editPlugsCell setAccessoryType:1];
    editPlugsCell = self->_editPlugsCell;
  }

  return editPlugsCell;
}

- (VehicleTitleDetailCell)licensePlateCell
{
  licensePlateCell = self->_licensePlateCell;
  if (!licensePlateCell)
  {
    v4 = (VehicleTitleDetailCell *)objc_opt_new();
    v5 = self->_licensePlateCell;
    self->_licensePlateCell = v4;

    [(VehicleTitleDetailCell *)self->_licensePlateCell setAccessibilityIdentifier:@"LicensePlateCell"];
    double v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"[Virtual Garage] License Plate Number" value:@"localized string not found" table:0];
    double v8 = [(VehicleTitleDetailCell *)self->_licensePlateCell titleLabel];
    [v8 setText:v7];

    licensePlateCell = self->_licensePlateCell;
  }

  return licensePlateCell;
}

- (VehicleLabelCell)editLicensePlateCell
{
  editLicensePlateCell = self->_editLicensePlateCell;
  if (!editLicensePlateCell)
  {
    v4 = (VehicleLabelCell *)objc_opt_new();
    v5 = self->_editLicensePlateCell;
    self->_editLicensePlateCell = v4;

    [(VehicleLabelCell *)self->_editLicensePlateCell setAccessibilityIdentifier:@"EditLicensePlateCell"];
    editLicensePlateCell = self->_editLicensePlateCell;
  }

  return editLicensePlateCell;
}

- (VehicleAppCell)appCell
{
  appCell = self->_appCell;
  if (!appCell)
  {
    v4 = (VehicleAppCell *)objc_opt_new();
    v5 = self->_appCell;
    self->_appCell = v4;

    double v6 = [(VGVehicle *)self->_vehicle applicationRecord];
    [(VehicleAppCell *)self->_appCell setApplicationRecord:v6];

    [(VehicleAppCell *)self->_appCell setAccessibilityIdentifier:@"AppCell"];
    [(VehicleAppCell *)self->_appCell setSelectionStyle:0];
    double v7 = [(VehicleAppCell *)self->_appCell openButton];
    [v7 addTarget:self action:"_pressedOpen" forControlEvents:64];

    appCell = self->_appCell;
  }

  return appCell;
}

- (VehicleTitleDetailCell)vehicleMakeCell
{
  vehicleMakeCell = self->_vehicleMakeCell;
  if (!vehicleMakeCell)
  {
    v4 = (VehicleTitleDetailCell *)objc_opt_new();
    v5 = self->_vehicleMakeCell;
    self->_vehicleMakeCell = v4;

    [(VehicleTitleDetailCell *)self->_vehicleMakeCell setAccessibilityIdentifier:@"VehicleMakeCell"];
    [(VehicleTitleDetailCell *)self->_vehicleMakeCell setSelectionStyle:0];
    double v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"[Virtual Garage] Manufacturer" value:@"localized string not found" table:0];
    double v8 = [(VehicleTitleDetailCell *)self->_vehicleMakeCell titleLabel];
    [v8 setText:v7];

    vehicleMakeCell = self->_vehicleMakeCell;
  }

  return vehicleMakeCell;
}

- (VehicleTitleDetailCell)vehicleModelCell
{
  vehicleModelCell = self->_vehicleModelCell;
  if (!vehicleModelCell)
  {
    v4 = (VehicleTitleDetailCell *)objc_opt_new();
    v5 = self->_vehicleModelCell;
    self->_vehicleModelCell = v4;

    [(VehicleTitleDetailCell *)self->_vehicleModelCell setAccessibilityIdentifier:@"VehicleModelCell"];
    [(VehicleTitleDetailCell *)self->_vehicleModelCell setSelectionStyle:0];
    double v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"[Virtual Garage] Model" value:@"localized string not found" table:0];
    double v8 = [(VehicleTitleDetailCell *)self->_vehicleModelCell titleLabel];
    [v8 setText:v7];

    vehicleModelCell = self->_vehicleModelCell;
  }

  return vehicleModelCell;
}

- (VehicleLabelCell)deleteCell
{
  deleteCell = self->_deleteCell;
  if (!deleteCell)
  {
    v4 = (VehicleLabelCell *)objc_opt_new();
    v5 = self->_deleteCell;
    self->_deleteCell = v4;

    [(VehicleLabelCell *)self->_deleteCell setAccessibilityIdentifier:@"DeleteCell"];
    double v6 = +[UIColor systemRedColor];
    double v7 = [(VehicleLabelCell *)self->_deleteCell label];
    [v7 setTextColor:v6];

    double v8 = +[NSBundle mainBundle];
    double v9 = [v8 localizedStringForKey:@"[Virtual Garage] Remove This Vehicle" value:@"localized string not found" table:0];
    v10 = [(VehicleLabelCell *)self->_deleteCell label];
    [v10 setText:v9];

    deleteCell = self->_deleteCell;
  }

  return deleteCell;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)VehicleDetailViewController;
  [(VehicleDetailViewController *)&v31 viewDidLoad];
  v3 = [(VehicleDetailViewController *)self view];
  [v3 setAccessibilityIdentifier:@"VehicleDetailView"];

  v4 = [(VehicleDetailViewController *)self view];
  v5 = [(VehicleDetailViewController *)self tableView];
  [v4 addSubview:v5];

  v30 = [(VehicleDetailViewController *)self tableView];
  v28 = [v30 leadingAnchor];
  id v29 = [(VehicleDetailViewController *)self view];
  v27 = [v29 leadingAnchor];
  id v26 = [v28 constraintEqualToAnchor:v27];
  v32[0] = v26;
  v25 = [(VehicleDetailViewController *)self tableView];
  v23 = [v25 trailingAnchor];
  id v24 = [(VehicleDetailViewController *)self view];
  v22 = [v24 trailingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v32[1] = v21;
  v20 = [(VehicleDetailViewController *)self tableView];
  v19 = [v20 topAnchor];
  double v6 = [(VehicleDetailViewController *)self view];
  double v7 = [v6 topAnchor];
  double v8 = [v19 constraintEqualToAnchor:v7];
  v32[2] = v8;
  double v9 = [(VehicleDetailViewController *)self tableView];
  v10 = [v9 bottomAnchor];
  v11 = [(VehicleDetailViewController *)self view];
  id v12 = [v11 bottomAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v32[3] = v13;
  v14 = +[NSArray arrayWithObjects:v32 count:4];
  +[NSLayoutConstraint activateConstraints:v14];

  id v15 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"dismiss"];
  objc_super v16 = [(VehicleDetailViewController *)self navigationItem];
  [v16 setLeftBarButtonItem:v15];

  v17 = [(VehicleDetailViewController *)self navigationItem];
  v18 = [v17 leftBarButtonItem];
  [v18 setAccessibilityIdentifier:@"DoneButton"];

  [(VehicleDetailViewController *)self _updateContent];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VehicleDetailViewController;
  -[VehicleDetailViewController viewWillAppear:](&v9, "viewWillAppear:");
  v5 = [(VehicleDetailViewController *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    double v7 = +[UIApplication sharedMapsDelegate];
    [v7 setLockedOrientations:2];

    double v8 = +[UIDevice currentDevice];
    [v8 setOrientation:1 animated:v3];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VehicleDetailViewController;
  [(VehicleDetailViewController *)&v7 viewWillDisappear:a3];
  v4 = [(VehicleDetailViewController *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];

  if (!v5)
  {
    id v6 = +[UIApplication sharedMapsDelegate];
    [v6 setLockedOrientations:0];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VehicleDetailViewController;
  [(VehicleDetailViewController *)&v6 viewIsAppearing:a3];
  -[UIView systemLayoutSizeFittingSize:](self->_headerView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  -[UIView setFrame:](self->_headerView, "setFrame:", CGPointZero.x, CGPointZero.y, v4, v5);
  [(VehicleDetailViewController *)self _reloadAndSave:0];
}

- (void)dismiss
{
  BOOL v3 = +[MKMapService sharedService];
  [v3 captureUserAction:445 onTarget:662 eventValue:0];

  id v4 = [(VehicleDetailViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v5 = [(VehicleDetailViewController *)self tableStructure];
  objc_super v6 = [v5 objectAtIndexedSubscript:a4];

  objc_super v7 = [v6 headerTitle];

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)UITableViewHeaderFooterView);
  double v8 = +[UIListContentConfiguration prominentInsetGroupedHeaderConfiguration];
  objc_super v9 = [(VehicleDetailViewController *)self tableView:v6 titleForHeaderInSection:a4];

  [v8 setText:v9];
  v10 = +[UIColor secondaryLabelColor];
  v11 = [v8 textProperties];
  [v11 setColor:v10];

  id v12 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleSubheadline weight:UIFontWeightBold];
  v13 = [v8 textProperties];
  [v13 setFont:v12];

  [v7 setContentConfiguration:v8];

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  double v5 = [(VehicleDetailViewController *)self tableStructure];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  id v7 = [v6 footerText];

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  BOOL v3 = [(VehicleDetailViewController *)self tableStructure];
  id v4 = [v3 count];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v5 = [(VehicleDetailViewController *)self tableStructure];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  id v7 = [v6 cells];
  id v8 = [v7 count];

  return (int64_t)v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(VehicleDetailViewController *)self tableStructure];
  id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));

  id v8 = [v7 cells];
  id v9 = [v5 row];

  v10 = [v8 objectAtIndexedSubscript:v9];

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VehicleDetailViewController *)self tableStructure];
  id v9 = [v8 objectAtIndexedSubscript:[v6 section]];

  v10 = [v9 cells];
  id v11 = [v6 row];

  id v12 = [v10 objectAtIndexedSubscript:v11];

  [v7 frame];
  double Width = CGRectGetWidth(v21);
  [v7 layoutMargins];
  double v15 = Width - v14;
  [v7 layoutMargins];
  double v17 = v16;

  [v12 cellHeightWithWidth:v15 - v17];
  double v19 = v18;

  return v19;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return UITableViewAutomaticDimension;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 deselectRowAtIndexPath:v6 animated:1];
  id v40 = [v7 cellForRowAtIndexPath:v6];

  id v8 = [(VehicleDetailViewController *)self editPlugsCell];

  if (v40 == v8)
  {
    double v14 = +[MKMapService sharedService];
    [v14 captureUserAction:438 onTarget:662 eventValue:0];

    double v15 = [[VehicleConnectorListViewController alloc] initWithVehicle:self->_vehicle];
    double v16 = [(VehicleDetailViewController *)self navigationController];
    [v16 pushViewController:v15 animated:1];

LABEL_14:
    goto LABEL_15;
  }
  id v9 = [(VehicleDetailViewController *)self addNetworksCell];

  if (v40 == v9)
  {
    double v17 = +[MKMapService sharedService];
    [v17 captureUserAction:453 onTarget:662 eventValue:0];

    if (sub_1000BBB44(self) == 5) {
      double v18 = MacChargingNetworksPickerViewController;
    }
    else {
      double v18 = _TtC4Maps35ChargingNetworkPickerViewController;
    }
    id v24 = [v18 alloc];
    v25 = [(VGVehicle *)self->_vehicle preferredChargingNetworks];
    double v15 = (VehicleConnectorListViewController *)[v24 initWithExcludedNetworks:v25 delegate:self];

    id v26 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v15];
    v27 = [(VehicleDetailViewController *)self topMostPresentedViewController];
    [v27 presentViewController:v26 animated:1 completion:0];

    goto LABEL_14;
  }
  id v10 = [(VehicleDetailViewController *)self licensePlateCell];

  if (v40 == v10)
  {
    double v19 = +[MKMapService sharedService];
    [v19 captureUserAction:2125 onTarget:662 eventValue:0];

    v20 = [(VehicleDetailViewController *)self _maps_mapsSceneDelegate];
    CGRect v21 = [v20 appCoordinator];
    v22 = [v21 baseActionCoordinator];

    vehicle = self->_vehicle;
LABEL_11:
    [v22 presentLPRWithVehicle:vehicle scenario:1 presenter:self completionBlock:0];

    goto LABEL_15;
  }
  id v11 = [(VehicleDetailViewController *)self editLicensePlateCell];

  if (v40 == v11)
  {
    v28 = [(VGVehicle *)self->_vehicle licensePlate];
    id v29 = [v28 length];

    v30 = +[MKMapService sharedService];
    objc_super v31 = v30;
    if (v29)
    {
      BOOL v32 = +[NSNumber numberWithUnsignedInteger:[(VehicleDetailViewController *)self vehicleCount]];
      v33 = [v32 stringValue];
      [v31 captureUserAction:2124 onTarget:660 eventValue:v33];

      v34 = [(VGVehicle *)self->_vehicle displayName];
      id v35 = [v34 length];

      if (!v35)
      {
        v36 = +[NSBundle mainBundle];
        v37 = [v36 localizedStringForKey:@"[Vehicle Selection] My Vehicle" value:@"localized string not found" table:0];
        [(VGVehicle *)self->_vehicle setDisplayName:v37];
      }
      [(VGVehicle *)self->_vehicle setLicensePlate:0];
      [(VehicleDetailViewController *)self _reloadAndSave:1];
      goto LABEL_15;
    }
    [v30 captureUserAction:2115 onTarget:660 eventValue:0];

    v38 = [(VehicleDetailViewController *)self _maps_mapsSceneDelegate];
    v39 = [v38 appCoordinator];
    v22 = [v39 baseActionCoordinator];

    vehicle = self->_vehicle;
    goto LABEL_11;
  }
  id v12 = [(VehicleDetailViewController *)self deleteCell];

  v13 = v40;
  if (v40 != v12) {
    goto LABEL_16;
  }
  [(VehicleDetailViewController *)self confirmRemoveVehicle];
LABEL_15:
  v13 = v40;
LABEL_16:
}

- (void)_updateContent
{
  BOOL v3 = [(VGVehicle *)self->_vehicle colorHex];
  id v4 = +[UIColor _maps_colorFromHexRepresentation:v3];
  id v5 = v4;
  if (!v4)
  {
    id v5 = +[UIColor systemBlueColor];
  }
  id v6 = [(VehicleDetailViewController *)self vehicleColorView];
  [v6 setBackgroundColor:v5];

  if (!v4) {
  id v7 = [(VehicleDetailViewController *)self vehicleColorView];
  }
  id v8 = [v7 backgroundColor];
  id v9 = +[UIColor whiteColor];
  [v8 _maps_euclideanDistanceFromColor:v9];
  double v11 = v10;

  if (v11 >= 0.1)
  {
    id v12 = +[UIColor systemWhiteColor];
    v13 = [(VehicleDetailViewController *)self vehicleIconView];
    [v13 setTintColor:v12];
  }
  else
  {
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    v13 = [(VehicleDetailViewController *)self traitCollection];
    double v14 = +[UIColor colorNamed:@"TertiaryVehicleTint" inBundle:v12 compatibleWithTraitCollection:v13];
    double v15 = [(VehicleDetailViewController *)self vehicleIconView];
    [v15 setTintColor:v14];
  }
  double v16 = [(VGVehicle *)self->_vehicle displayName];
  id v17 = [v16 length];
  vehicle = self->_vehicle;
  if (v17) {
    [(VGVehicle *)vehicle displayName];
  }
  else {
  id v51 = [(VGVehicle *)vehicle licensePlate];
  }

  double v19 = [(VehicleDetailViewController *)self vehicleNameLabel];
  [v19 setText:v51];

  uint64_t v20 = [(VGVehicle *)self->_vehicle isPureElectricVehicle] ^ 1;
  CGRect v21 = [(VehicleDetailViewController *)self vehicleBatteryView];
  [v21 setHidden:v20];

  if ([(VGVehicle *)self->_vehicle isPureElectricVehicle])
  {
    v22 = self->_vehicle;
    v23 = [(VehicleDetailViewController *)self vehicleBatteryView];
    [v23 setVehicle:v22];
  }
  id v24 = [(VGVehicle *)self->_vehicle licensePlate];
  v25 = [(VehicleDetailViewController *)self licensePlateCell];
  id v26 = [v25 detailLabel];
  [v26 setText:v24];

  v27 = [(VGVehicle *)self->_vehicle manufacturer];
  v28 = [(VehicleDetailViewController *)self vehicleMakeCell];
  id v29 = [v28 detailLabel];
  [v29 setText:v27];

  v30 = [(VGVehicle *)self->_vehicle model];
  objc_super v31 = [(VehicleDetailViewController *)self vehicleModelCell];
  BOOL v32 = [v31 detailLabel];
  [v32 setText:v30];

  [(VGVehicle *)self->_vehicle supportedConnectors];
  v33 = VGChargingConnectorTypeOptionsUnpacked();
  v34 = sub_100099700(v33, &stru_101317398);
  id v35 = [v34 componentsJoinedByString:@", "];
  v36 = [(VehicleDetailViewController *)self editPlugsCell];
  v37 = [v36 detailLabel];
  [v37 setText:v35];

  v38 = [(VGVehicle *)self->_vehicle licensePlate];
  id v39 = [v38 length];

  id v40 = +[NSBundle mainBundle];
  v41 = v40;
  if (v39)
  {
    v42 = [v40 localizedStringForKey:@"[Virtual Garage] Remove License Plate Number" value:@"localized string not found" table:0];
    v43 = [(VehicleDetailViewController *)self editLicensePlateCell];
    v44 = [v43 label];
    [v44 setText:v42];

    +[UIColor systemRedColor];
  }
  else
  {
    v45 = [v40 localizedStringForKey:@"[Virtual Garage] Update License Plate Number" value:@"localized string not found" table:0];
    v46 = [(VehicleDetailViewController *)self editLicensePlateCell];
    v47 = [v46 label];
    [v47 setText:v45];

    +[UIColor labelColor];
  v48 = };
  v49 = [(VehicleDetailViewController *)self editLicensePlateCell];
  v50 = [v49 label];
  [v50 setTextColor:v48];
}

- (void)confirmRemoveVehicle
{
  BOOL v3 = [(VehicleDetailViewController *)self title];
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"[Virtual Garage] Remove Vehicle Alert" value:@"localized string not found" table:0];
  id v6 = +[UIAlertController alertControllerWithTitle:v3 message:v5 preferredStyle:0];

  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"[Virtual Garage] Remove Vehicle Alert Action" value:@"localized string not found" table:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100AF0A40;
  v13[3] = &unk_1012E6DE0;
  v13[4] = self;
  id v9 = +[UIAlertAction actionWithTitle:v8 style:2 handler:v13];
  [v6 addAction:v9];

  double v10 = +[NSBundle mainBundle];
  double v11 = [v10 localizedStringForKey:@"[Virtual Garage] Remove Vehicle Alert Action Cancel" value:@"localized string not found" table:0];
  id v12 = +[UIAlertAction actionWithTitle:v11 style:1 handler:0];
  [v6 addAction:v12];

  [(VehicleDetailViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (BOOL)_isMinimumViableVehicle
{
  v2 = [(VGVehicle *)self->_vehicle combinedDisplayName];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)_saveIfAppropriate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AF0C8C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_pressedEdit
{
  BOOL v3 = +[MKMapService sharedService];
  [v3 captureUserAction:2120 onTarget:662 eventValue:0];

  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [(VehicleDetailViewController *)self traitCollection];
  id v5 = [EditVehicleViewController alloc];
  id v6 = sub_1004BE53C(v9, v4);
  id v7 = [(EditVehicleViewController *)v5 initWithColors:v6 vehicle:self->_vehicle delegate:self];

  id v8 = [(VehicleDetailViewController *)self navigationController];
  [v8 pushViewController:v7 animated:1];
}

- (void)_pressedOpen
{
  BOOL v3 = [(VGVehicle *)self->_vehicle pairedAppIdentifier];

  if (v3)
  {
    id v4 = +[MKMapService sharedService];
    [v4 captureUserAction:2110 onTarget:662 eventValue:0];

    id v8 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
    id v5 = [(VGVehicle *)self->_vehicle pairedAppIdentifier];
    [v8 openApplication:v5 withOptions:0 completion:0];
  }
  else
  {
    id v6 = sub_1000519B4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      vehicle = self->_vehicle;
      *(_DWORD *)buf = 138412290;
      double v10 = vehicle;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Tried to open an app for vehicle that doesn't have a pairedAppId: %@", buf, 0xCu);
    }
  }
}

- (void)_reloadAndSave:(BOOL)a3
{
  BOOL v3 = a3;
  [(VehicleDetailViewController *)self _updateContent];
  if (v3) {
    [(VehicleDetailViewController *)self _saveIfAppropriate];
  }
  [(VehicleDetailViewController *)self setTableStructure:0];
  id v5 = [(VehicleDetailViewController *)self tableView];
  [v5 reloadData];
}

- (void)networkPickerControllerDidSelectNetworks:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(VGVehicle *)self->_vehicle preferredChargingNetworks];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = +[NSSet set];
    }
    id v8 = v7;

    id v9 = sub_1000519B4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = v4;
      double v11 = v10;
      if (v10)
      {
        if ([v10 count])
        {
          id v12 = [v11 componentsJoinedByString:@", "];
          v13 = +[NSString stringWithFormat:@"<%p> [%@]", v11, v12];
        }
        else
        {
          v13 = +[NSString stringWithFormat:@"<%p> (empty)", v11];
        }
      }
      else
      {
        v13 = @"<nil>";
      }

      double v14 = v13;
      double v15 = [(VGVehicle *)self->_vehicle displayName];
      id v16 = [v8 allObjects];
      id v17 = v16;
      if (v16)
      {
        if ([v16 count])
        {
          double v18 = [v17 componentsJoinedByString:@", "];
          double v19 = +[NSString stringWithFormat:@"<%p> [%@]", v17, v18];
        }
        else
        {
          double v19 = +[NSString stringWithFormat:@"<%p> (empty)", v17];
        }
      }
      else
      {
        double v19 = @"<nil>";
      }

      *(_DWORD *)buf = 138412802;
      v23 = v14;
      __int16 v24 = 2112;
      v25 = v15;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Network Picker VC did select networks: %@, will update vehicle: %@ (current networks: %@)", buf, 0x20u);
    }
    uint64_t v20 = [v8 setByAddingObjectsFromArray:v4];
    [(VGVehicle *)self->_vehicle setPreferredChargingNetworks:v20];
    CGRect v21 = +[VGVirtualGarageService sharedService];
    [v21 virtualGarageSaveVehicle:self->_vehicle];
  }
  else
  {
    id v8 = sub_1000519B4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Network Picker VC did not select any network. Ignoring.", buf, 2u);
    }
  }
}

- (void)editVehicleViewController:(id)a3 didSelectColor:(id)a4 nickname:(id)a5 removedNetworks:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = sub_1000519B4();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = v11;
    double v14 = v13;
    if (v13)
    {
      if ([v13 count])
      {
        double v15 = [v14 componentsJoinedByString:@", "];
        id v16 = +[NSString stringWithFormat:@"<%p> [%@]", v14, v15];
      }
      else
      {
        id v16 = +[NSString stringWithFormat:@"<%p> (empty)", v14];
      }
    }
    else
    {
      id v16 = @"<nil>";
    }

    *(_DWORD *)buf = 138412802;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    __int16 v21 = 2112;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "edit vehicle VC selected color: %@, nickname: %@, removedNetworks: %@", buf, 0x20u);
  }
  [(VehicleDetailViewController *)self _reloadAndSave:1];
}

- (void)editVehicleViewControllerDidSelectDone:(id)a3
{
  id v5 = [(VehicleDetailViewController *)self navigationController];
  id v4 = [v5 popToViewController:self animated:1];
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4 = a3;
  if (self->_deletingVehicle)
  {
    id v5 = +[MKMapService sharedService];
    id v6 = [v4 vehicles];
    id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
    id v8 = [v7 stringValue];
    [v5 captureUserAction:2112 onTarget:662 eventValue:v8];

    id v9 = +[MKMapService sharedService];
    id v10 = [v4 vehicles];
    id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 count]);
    id v12 = [v11 stringValue];
    [v9 captureUserAction:2111 onTarget:660 eventValue:v12];

    self->_deletingVehicle = 0;
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100AF1698;
  v14[3] = &unk_1012E5D58;
  v14[4] = self;
  id v15 = v4;
  id v13 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
}

- (VehicleDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VehicleDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)vehicleCount
{
  return self->_vehicleCount;
}

- (void)setVehicleCount:(unint64_t)a3
{
  self->_vehicleCount = a3;
}

- (void)setTableStructure:(id)a3
{
}

- (void)setTableView:(id)a3
{
}

- (void)setHeaderView:(id)a3
{
}

- (void)setVehicleColorView:(id)a3
{
}

- (void)setVehicleIconView:(id)a3
{
}

- (void)setVehicleNameLabel:(id)a3
{
}

- (void)setVehicleBatteryView:(id)a3
{
}

- (void)setAddNetworksCell:(id)a3
{
}

- (void)setEditPlugsCell:(id)a3
{
}

- (void)setLicensePlateCell:(id)a3
{
}

- (void)setEditLicensePlateCell:(id)a3
{
}

- (void)setAppCell:(id)a3
{
}

- (void)setVehicleMakeCell:(id)a3
{
}

- (void)setVehicleModelCell:(id)a3
{
}

- (void)setDeleteCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteCell, 0);
  objc_storeStrong((id *)&self->_vehicleModelCell, 0);
  objc_storeStrong((id *)&self->_vehicleMakeCell, 0);
  objc_storeStrong((id *)&self->_appCell, 0);
  objc_storeStrong((id *)&self->_editLicensePlateCell, 0);
  objc_storeStrong((id *)&self->_licensePlateCell, 0);
  objc_storeStrong((id *)&self->_editPlugsCell, 0);
  objc_storeStrong((id *)&self->_addNetworksCell, 0);
  objc_storeStrong((id *)&self->_vehicleBatteryView, 0);
  objc_storeStrong((id *)&self->_vehicleNameLabel, 0);
  objc_storeStrong((id *)&self->_vehicleIconView, 0);
  objc_storeStrong((id *)&self->_vehicleColorView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableStructure, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_strongSelf, 0);

  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end