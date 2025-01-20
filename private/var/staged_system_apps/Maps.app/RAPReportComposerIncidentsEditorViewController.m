@interface RAPReportComposerIncidentsEditorViewController
- (RAPReportComposerIncidentsEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (id)tableParts;
- (int)analyticTarget;
- (void)_presentMapPicker;
- (void)inlineMapViewModelRequestsDisplayPowerActions:(id)a3;
@end

@implementation RAPReportComposerIncidentsEditorViewController

- (RAPReportComposerIncidentsEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerIncidentsEditorViewController;
  v10 = [(RAPReportTableViewController *)&v15 initWithReport:a3 question:v9 completion:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_question, a4);
    v12 = [(RAPReportTableViewController *)v11 sendButtonItem];
    v13 = [(RAPReportComposerIncidentsEditorViewController *)v11 navigationItem];
    [v13 setRightBarButtonItem:v12];
  }
  return v11;
}

- (int)analyticTarget
{
  return 741;
}

- (id)tableParts
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  labelMarkerPickerPart = self->_labelMarkerPickerPart;
  if (!labelMarkerPickerPart)
  {
    v5 = [(RAPIncidentsQuestion *)self->_question incidentLayoutItem];
    v6 = +[TrafficIncidentLayoutItem styleAttributesForType:](TrafficIncidentLayoutItem, "styleAttributesForType:", [v5 incidentType]);

    v7 = [[RAPMarkerViewAttributes alloc] initWithTitle:0 styleAttributes:v6];
    v8 = [RAPReportComposerMapFeaturePickerPart alloc];
    id v9 = [(RAPQuestion *)self->_question report];
    v10 = [v9 _context];
    v11 = [v10 mapCamera];
    v12 = [(RAPReportComposerMapFeaturePickerPart *)v8 initWithFeatureKind:1 camera:v11 delegate:self markerViewAttributes:v7];
    v13 = self->_labelMarkerPickerPart;
    self->_labelMarkerPickerPart = v12;

    labelMarkerPickerPart = self->_labelMarkerPickerPart;
  }
  [v3 addObject:labelMarkerPickerPart];
  commentPart = self->_commentPart;
  if (!commentPart)
  {
    objc_super v15 = [RAPReportComposerCommentPart alloc];
    v16 = [(RAPIncidentsQuestion *)self->_question commentQuestion];
    v17 = [(RAPReportComposerCommentPart *)v15 initWithCommentQuestion:v16];
    v18 = self->_commentPart;
    self->_commentPart = v17;

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
  id v3 = [(RAPIncidentsQuestion *)self->_question incidentLayoutItem];
  v4 = +[TrafficIncidentLayoutItem styleAttributesForType:](TrafficIncidentLayoutItem, "styleAttributesForType:", [v3 incidentType]);

  v5 = [[RAPMarkerViewAttributes alloc] initWithTitle:0 styleAttributes:v4];
  objc_initWeak(&location, self);
  v6 = [RAPEditLocationViewController alloc];
  [(RAPIncidentsQuestion *)self->_question selectedCoordinate];
  double v8 = v7;
  double v10 = v9;
  [(RAPIncidentsQuestion *)self->_question coordinatePickingMapRect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [[RAPCorrectableEntryPoints alloc] initWithGEORoadAccessPoints:&__NSArray0__struct];
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_1008C682C;
  v27 = &unk_1012FABB8;
  objc_copyWeak(&v28, &location);
  v20 = -[RAPEditLocationViewController initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:allowEditingEntryPoints:correctableEntryPoints:selectionHandler:cancelSelectionHandler:](v6, "initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:allowEditingEntryPoints:correctableEntryPoints:selectionHandler:cancelSelectionHandler:", 1158, v5, 0, v19, &v24, 0, v8, v10, v12, v14, v16, v18);
  mapPicker = self->_mapPicker;
  self->_mapPicker = v20;

  v22 = [(RAPIncidentsQuestion *)self->_question localizedTitle];
  [(RAPEditLocationViewController *)self->_mapPicker setNavigationTitle:v22];

  v23 = [(RAPReportComposerIncidentsEditorViewController *)self navigationController];
  [v23 pushViewController:self->_mapPicker animated:1];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentPart, 0);
  objc_storeStrong((id *)&self->_labelMarkerPickerPart, 0);
  objc_storeStrong((id *)&self->_mapPicker, 0);

  objc_storeStrong((id *)&self->_question, 0);
}

@end