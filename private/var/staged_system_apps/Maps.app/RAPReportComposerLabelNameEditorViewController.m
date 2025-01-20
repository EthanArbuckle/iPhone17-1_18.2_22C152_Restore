@interface RAPReportComposerLabelNameEditorViewController
- (RAPReportComposerLabelNameEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (id)tableParts;
- (int)analyticTarget;
- (void)_instrumentSelectingLabel;
- (void)_labelPickerFinishedSelectingMarker;
- (void)_presentMapPicker;
- (void)_updateLabelPickerDoneBarItem;
- (void)inlineMapViewModelRequestsDisplayPowerActions:(id)a3;
@end

@implementation RAPReportComposerLabelNameEditorViewController

- (RAPReportComposerLabelNameEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)RAPReportComposerLabelNameEditorViewController;
  v10 = [(RAPReportTableViewController *)&v17 initWithReport:a3 question:v9 completion:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = [(RAPReportTableViewController *)v11 sendButtonItem];
    v13 = [(RAPReportComposerLabelNameEditorViewController *)v11 navigationItem];
    [v13 setRightBarButtonItem:v12];

    v14 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v11 action:"_labelPickerFinishedSelectingMarker"];
    labelPickerDoneBarItem = v11->_labelPickerDoneBarItem;
    v11->_labelPickerDoneBarItem = v14;

    [(RAPReportComposerLabelNameEditorViewController *)v11 _updateLabelPickerDoneBarItem];
  }

  return v11;
}

- (int)analyticTarget
{
  return 1127;
}

- (id)tableParts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(RAPReportTableViewController *)self userInfoPart];
  [v3 addObject:v4];

  labelMarkerPickerPart = self->_labelMarkerPickerPart;
  if (!labelMarkerPickerPart)
  {
    v6 = [RAPReportComposerMapFeaturePickerPart alloc];
    v7 = [(RAPQuestion *)self->_question report];
    v8 = [v7 _context];
    id v9 = [v8 mapCamera];
    v10 = [(RAPReportComposerMapFeaturePickerPart *)v6 initWithFeatureKind:0 camera:v9 delegate:self markerViewAttributes:0];
    v11 = self->_labelMarkerPickerPart;
    self->_labelMarkerPickerPart = v10;

    labelMarkerPickerPart = self->_labelMarkerPickerPart;
  }
  [v3 addObject:labelMarkerPickerPart];
  nameEditorPart = self->_nameEditorPart;
  if (!nameEditorPart)
  {
    v13 = [RAPReportComposerIncorrectNamePart alloc];
    v14 = [(RAPLabelCorrectionsQuestion *)self->_question correctableName];
    v15 = [(RAPReportComposerIncorrectNamePart *)v13 initWithCorrectableString:v14];
    v16 = self->_nameEditorPart;
    self->_nameEditorPart = v15;

    nameEditorPart = self->_nameEditorPart;
  }
  [v3 addObject:nameEditorPart];
  labelStatusPart = self->_labelStatusPart;
  if (!labelStatusPart)
  {
    v18 = [RAPReportComposerLabelStatusPart alloc];
    v19 = [(RAPLabelCorrectionsQuestion *)self->_question removeLabelCorrectableFlag];
    v20 = [(RAPReportComposerLabelStatusPart *)v18 initWithCorrectableFlag:v19];
    v21 = self->_labelStatusPart;
    self->_labelStatusPart = v20;

    labelStatusPart = self->_labelStatusPart;
  }
  [v3 addObject:labelStatusPart];
  commentPart = self->_commentPart;
  if (!commentPart)
  {
    v23 = [RAPReportComposerCommentPart alloc];
    v24 = [(RAPLabelCorrectionsQuestion *)self->_question commentQuestion];
    v25 = [(RAPReportComposerCommentPart *)v23 initWithCommentQuestion:v24];
    v26 = self->_commentPart;
    self->_commentPart = v25;

    commentPart = self->_commentPart;
  }
  [v3 addObject:commentPart];

  return v3;
}

- (void)inlineMapViewModelRequestsDisplayPowerActions:(id)a3
{
}

- (void)_presentMapPicker
{
  id v3 = [(RAPLabelCorrectionsQuestion *)self->_question labelMarker];
  editedLabelMarker = self->_editedLabelMarker;
  self->_editedLabelMarker = v3;

  v5 = [(RAPReportTableViewController *)self report];
  v6 = [v5 _context];
  v7 = [v6 mapCamera];

  v8 = self->_editedLabelMarker;
  if (v8)
  {
    [(VKLabelMarker *)v8 coordinate];
    CLLocationDegrees v10 = v9;
    [(VKLabelMarker *)self->_editedLabelMarker coordinate];
    CLLocationCoordinate2D v12 = CLLocationCoordinate2DMake(v10, v11);
    [v7 setCenterCoordinate:v12.latitude, v12.longitude];
  }
  else
  {
    v13 = [(RAPQuestion *)self->_question _context];
    v14 = [v13 mapCamera];
    [v14 centerCoordinate];
    [v7 setCenterCoordinate:];
  }
  objc_initWeak(&location, self);
  v15 = [RAPMapFeaturePickerViewController alloc];
  v16 = [(RAPLabelCorrectionsQuestion *)self->_question localizedLabelMarkerPickingPrompt];
  objc_super v17 = [(RAPLabelCorrectionsQuestion *)self->_question localizedTitle];
  [(RAPLabelCorrectionsQuestion *)self->_question initialLabelMarkerPickingMapRect];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  unint64_t v26 = [(RAPLabelCorrectionsQuestion *)self->_question coordinatePickingMapType];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10081AD10;
  v32[3] = &unk_1012F9E20;
  objc_copyWeak(&v33, &location);
  v27 = -[RAPMapFeaturePickerViewController initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:preferredMapType:selection:](v15, "initForPickingFeatureOfKind:withPrompt:title:inMapRect:withCamera:analyticsTarget:preferredMapType:selection:", 0, v16, v17, v7, 1126, v26, v19, v21, v23, v25, v32);
  mapPicker = self->_mapPicker;
  self->_mapPicker = v27;

  if (self->_editedLabelMarker) {
    -[RAPMapFeaturePickerViewController setSelectedLabelMarker:](self->_mapPicker, "setSelectedLabelMarker:");
  }
  labelPickerDoneBarItem = self->_labelPickerDoneBarItem;
  v30 = [(RAPMapFeaturePickerViewController *)self->_mapPicker navigationItem];
  [v30 setRightBarButtonItem:labelPickerDoneBarItem];

  v31 = [(RAPReportComposerLabelNameEditorViewController *)self navigationController];
  [v31 pushViewController:self->_mapPicker animated:1];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

- (void)_instrumentSelectingLabel
{
  id v3 = +[MKMapService sharedService];
  [v3 captureUserAction:10153 onTarget:[self->_mapPicker analyticTarget] eventValue:0];
}

- (void)_updateLabelPickerDoneBarItem
{
  [(VKLabelMarker *)self->_editedLabelMarker coordinate];
  double v4 = v3;
  double v6 = v5;
  v7 = [(RAPLabelCorrectionsQuestion *)self->_question labelMarker];
  [v7 coordinate];
  double v9 = v8;
  double v11 = v10;

  BOOL v12 = (vabdd_f64(v4, v9) >= 0.00000000999999994 || vabdd_f64(v6, v11) >= 0.00000000999999994)
     && self->_editedLabelMarker != 0;
  labelPickerDoneBarItem = self->_labelPickerDoneBarItem;

  [(UIBarButtonItem *)labelPickerDoneBarItem setEnabled:v12];
}

- (void)_labelPickerFinishedSelectingMarker
{
  [(VKLabelMarker *)self->_editedLabelMarker coordinate];
  CLLocationDegrees v4 = v3;
  [(VKLabelMarker *)self->_editedLabelMarker coordinate];
  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(v4, v5);
  -[RAPReportComposerMapFeaturePickerPart updateCoordinate:](self->_labelMarkerPickerPart, "updateCoordinate:", v6.latitude, v6.longitude);
  v7 = [(RAPMapFeaturePickerViewController *)self->_mapPicker selectedLabelMarker];
  [(RAPLabelCorrectionsQuestion *)self->_question setLabelMarker:v7];

  double v8 = [(RAPMapFeaturePickerViewController *)self->_mapPicker mapViewReportContext];
  [(RAPLabelCorrectionsQuestion *)self->_question setLabelMarkerPickingMapContext:v8];

  double v9 = [(RAPLabelCorrectionsQuestion *)self->_question correctableName];
  [(RAPReportComposerIncorrectNamePart *)self->_nameEditorPart setCorrectableString:v9];

  [(UIBarButtonItem *)self->_labelPickerDoneBarItem setEnabled:[(RAPLabelCorrectionsQuestion *)self->_question isComplete]];
  id v11 = [(RAPReportComposerLabelNameEditorViewController *)self navigationController];
  id v10 = [v11 popViewControllerAnimated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_labelStatusPart, 0);
  objc_storeStrong((id *)&self->_nameEditorPart, 0);
  objc_storeStrong((id *)&self->_labelMarkerPickerPart, 0);
  objc_storeStrong((id *)&self->_editedLabelMarker, 0);
  objc_storeStrong((id *)&self->_labelPickerDoneBarItem, 0);
  objc_storeStrong((id *)&self->_mapPicker, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end