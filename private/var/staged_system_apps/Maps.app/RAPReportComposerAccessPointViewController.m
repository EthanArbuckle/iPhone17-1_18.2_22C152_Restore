@interface RAPReportComposerAccessPointViewController
- (RAPReportComposerAccessPointViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (id)_doneBarItem;
- (id)tableParts;
- (int)_analyticTargetForMapPicker;
- (int)analyticTarget;
- (void)_mapPickerDone;
- (void)_updateDoneBarItem;
- (void)inlineMapViewModelRequestsDisplayPowerActions:(id)a3;
- (void)presentLocationPicker;
- (void)reloadLocationRow;
@end

@implementation RAPReportComposerAccessPointViewController

- (RAPReportComposerAccessPointViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerAccessPointViewController;
  v10 = [(RAPReportTableViewController *)&v15 initWithReport:a3 question:v9 completion:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = [(RAPReportTableViewController *)v11 sendButtonItem];
    v13 = [(RAPReportComposerAccessPointViewController *)v11 navigationItem];
    [v13 setRightBarButtonItem:v12];
  }
  return v11;
}

- (void)inlineMapViewModelRequestsDisplayPowerActions:(id)a3
{
}

- (id)tableParts
{
  v3 = +[NSMutableArray array];
  v4 = [(RAPReportTableViewController *)self userInfoPart];
  [v3 addObject:v4];

  locationPart = self->_locationPart;
  if (!locationPart)
  {
    v6 = [RAPReportComposerMapFeaturePickerPart alloc];
    [(RAPAccessPointQuestion *)self->_question selectedCoordinate];
    v7 = -[RAPReportComposerMapFeaturePickerPart initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:](v6, "initWithFeatureKind:centerCoordinate:delegate:markerViewAttributes:", 3, self, 0);
    v8 = self->_locationPart;
    self->_locationPart = v7;

    locationPart = self->_locationPart;
  }
  [v3 addObject:locationPart];
  if (objc_opt_respondsToSelector())
  {
    entranceDetailsPart = self->_entranceDetailsPart;
    if (!entranceDetailsPart)
    {
      v10 = [RAPReportComposerEntranceDetailsPart alloc];
      v11 = [(RAPAccessPointQuestion *)self->_question accessPointName];
      v12 = [(RAPReportComposerEntranceDetailsPart *)v10 initWithCorrectableString:v11];
      v13 = self->_entranceDetailsPart;
      self->_entranceDetailsPart = v12;

      entranceDetailsPart = self->_entranceDetailsPart;
    }
    [v3 addObject:entranceDetailsPart];
  }
  commentPart = self->_commentPart;
  if (!commentPart)
  {
    objc_super v15 = [RAPReportComposerCommentPart alloc];
    v16 = [(RAPAccessPointQuestion *)self->_question commentQuestion];
    v17 = [(RAPReportComposerCommentPart *)v15 initWithCommentQuestion:v16];
    v18 = self->_commentPart;
    self->_commentPart = v17;

    commentPart = self->_commentPart;
  }
  [v3 addObject:commentPart];

  return v3;
}

- (int)analyticTarget
{
  return [(RAPAccessPointQuestion *)self->_question analyticTarget];
}

- (int)_analyticTargetForMapPicker
{
  unsigned int v2 = [(RAPAccessPointQuestion *)self->_question analyticTarget];
  if (v2 == 1105) {
    int v3 = 1142;
  }
  else {
    int v3 = 0;
  }
  if (v2 == 1110) {
    return 1109;
  }
  else {
    return v3;
  }
}

- (void)presentLocationPicker
{
  objc_initWeak(&location, self);
  int v3 = [RAPMapFeaturePickerViewController alloc];
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"Pan the map to position the entrance [Report a Problem]" value:@"localized string not found" table:0];
  [(RAPAccessPointQuestion *)self->_question selectedCoordinate];
  double v7 = v6;
  double v9 = v8;
  [(RAPAccessPointQuestion *)self->_question visibleMapRect];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  uint64_t v18 = [(RAPReportComposerAccessPointViewController *)self _analyticTargetForMapPicker];
  v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  v28 = sub_100A714A8;
  v29 = &unk_1012F9E20;
  objc_copyWeak(&v30, &location);
  id v19 = -[RAPMapFeaturePickerViewController initForPickingFeatureOfKind:withPrompt:title:initialFeatureCoordinate:inMapRect:withCamera:analyticsTarget:selection:](v3, "initForPickingFeatureOfKind:withPrompt:title:initialFeatureCoordinate:inMapRect:withCamera:analyticsTarget:selection:", 3, v5, 0, 0, v18, &v26, v7, v9, v11, v13, v15, v17);

  v20 = [(RAPReportComposerAccessPointViewController *)self _doneBarItem];
  v21 = [v19 navigationItem];
  [v21 setRightBarButtonItem:v20];

  v22 = [(RAPReportComposerAccessPointViewController *)self navigationItem];
  v23 = [v22 title];
  v24 = [v19 navigationItem];
  [v24 setTitle:v23];

  v25 = [(RAPReportComposerAccessPointViewController *)self navigationController];
  [v25 pushViewController:v19 animated:1];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (id)_doneBarItem
{
  doneBarItem = self->_doneBarItem;
  if (!doneBarItem)
  {
    v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_mapPickerDone"];
    v5 = self->_doneBarItem;
    self->_doneBarItem = v4;

    [(RAPReportComposerAccessPointViewController *)self _updateDoneBarItem];
    doneBarItem = self->_doneBarItem;
  }

  return doneBarItem;
}

- (void)_mapPickerDone
{
  -[RAPAccessPointQuestion setSelectedCoordinate:](self->_question, "setSelectedCoordinate:", self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude);
  [(RAPReportComposerAccessPointViewController *)self reloadLocationRow];
  id v4 = [(RAPReportComposerAccessPointViewController *)self navigationController];
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)_updateDoneBarItem
{
  [(RAPAccessPointQuestion *)self->_question originalCoordinate];
  BOOL v4 = vabdd_f64(v3, self->_selectedCoordinate.latitude) >= 0.00000000999999994;
  uint64_t v6 = vabdd_f64(v5, self->_selectedCoordinate.longitude) >= 0.00000000999999994 || v4;
  doneBarItem = self->_doneBarItem;

  [(UIBarButtonItem *)doneBarItem setEnabled:v6];
}

- (void)reloadLocationRow
{
  [(RAPAccessPointQuestion *)self->_question originalCoordinate];
  double v4 = v3;
  double v6 = v5;
  [(RAPAccessPointQuestion *)self->_question selectedCoordinate];
  if (vabdd_f64(v4, v8) >= 0.00000000999999994 || vabdd_f64(v6, v7) >= 0.00000000999999994)
  {
    locationPart = self->_locationPart;
    [(RAPAccessPointQuestion *)self->_question selectedCoordinate];
    -[RAPReportComposerMapFeaturePickerPart updateCoordinate:](locationPart, "updateCoordinate:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneBarItem, 0);
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_entranceDetailsPart, 0);
  objc_storeStrong((id *)&self->_locationPart, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end