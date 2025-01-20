@interface RAPReportMenuProvider
- (BOOL)_mapIsSprMap:(id)a3;
- (RAPReportMenuProvider)init;
- (id)getReportMenuFromEntryPoint:(int)a3 sceneDelegate:(id)a4;
- (void)_handleMenuAction:(int64_t)a3 entryPoint:(int)a4 sceneDelegate:(id)a5;
- (void)_populateMenuSection;
- (void)dealloc;
@end

@implementation RAPReportMenuProvider

- (RAPReportMenuProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)RAPReportMenuProvider;
  v2 = [(RAPReportMenuProvider *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(ReportLinkFactory);
    linkFactory = v2->_linkFactory;
    v2->_linkFactory = v3;

    v5 = +[TrafficIncidentLayoutManager sharedInstance];
    [v5 addObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[TrafficIncidentLayoutManager sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RAPReportMenuProvider;
  [(RAPReportMenuProvider *)&v4 dealloc];
}

- (void)_populateMenuSection
{
  v3 = +[NSMutableArray arrayWithArray:&off_1013ADE48];
  menuSections = self->_menuSections;
  self->_menuSections = v3;

  v5 = +[GEOPlatform sharedPlatform];
  unsigned int v6 = [v5 supportsNavigation];

  if (v6)
  {
    [(NSMutableArray *)self->_menuSections addObject:&off_1013A8458];
    objc_super v7 = +[TrafficIncidentLayoutManager sharedInstance];
    unsigned int v8 = [v7 isIncidentReportingEnabled];

    if (v8)
    {
      v9 = self->_menuSections;
      [(NSMutableArray *)v9 addObject:&off_1013A8470];
    }
  }
}

- (id)getReportMenuFromEntryPoint:(int)a3 sceneDelegate:(id)a4
{
  id v16 = a4;
  if (!self->_menuSections) {
    [(RAPReportMenuProvider *)self _populateMenuSection];
  }
  v5 = +[NSMutableArray array];
  if ([(NSMutableArray *)self->_menuSections count])
  {
    unint64_t v6 = 0;
    do
    {
      objc_super v7 = [(NSMutableArray *)self->_menuSections objectAtIndexedSubscript:v6];
      id v8 = [v7 integerValue];

      v9 = [(ReportLinkFactory *)self->_linkFactory createModelForType:v8];
      objc_initWeak(&location, self);
      v10 = [v9 title];
      v11 = [v9 icon];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10074B1C8;
      v17[3] = &unk_1012F74D8;
      objc_copyWeak(v19, &location);
      v19[1] = v8;
      int v20 = a3;
      id v18 = v16;
      v12 = +[UIAction actionWithTitle:v10 image:v11 identifier:0 handler:v17];

      [v5 addObject:v12];
      objc_destroyWeak(v19);
      objc_destroyWeak(&location);

      ++v6;
    }
    while (v6 < (unint64_t)[(NSMutableArray *)self->_menuSections count]);
  }
  v13 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:16 children:v5];

  return v13;
}

- (void)_handleMenuAction:(int64_t)a3 entryPoint:(int)a4 sceneDelegate:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v17 = a5;
  id v8 = [v17 rapPresenter];
  v9 = v8;
  uint64_t v10 = 229;
  uint64_t v11 = 12;
  switch(a3)
  {
    case 0:
      unsigned int v12 = [(RAPReportMenuProvider *)self _mapIsSprMap:v17];
      int BOOL = GEOConfigGetBOOL();
      if (v12)
      {
        uint64_t v14 = 4;
        uint64_t v15 = 6;
      }
      else
      {
        uint64_t v14 = 3;
        uint64_t v15 = 5;
      }
      if (BOOL) {
        uint64_t v11 = v15;
      }
      else {
        uint64_t v11 = v14;
      }
      uint64_t v10 = 222;
      goto LABEL_15;
    case 1:
      [v8 presentIncidentsReportOptions:12];
      uint64_t v10 = 2152;
      goto LABEL_16;
    case 2:
      if ([(RAPReportMenuProvider *)self _mapIsSprMap:v17]) {
        uint64_t v11 = 22;
      }
      else {
        uint64_t v11 = 21;
      }
      uint64_t v10 = 224;
      goto LABEL_15;
    case 3:
LABEL_15:
      [v9 presentRAPWebBundleQuestionType:v11 mapItem:0 fromEntryPoint:v5 withCompletion:&stru_1012F7518];
      goto LABEL_16;
    case 4:
      [v8 presentRouteListReportFromEntryPoint:v5];
      uint64_t v10 = 10117;
LABEL_16:
      if (v5 == 29) {
        uint64_t v16 = 39;
      }
      else {
        uint64_t v16 = v5;
      }
      +[GEOAPPortal captureUserAction:v10 target:v16 value:0];
      break;
    default:
      break;
  }
}

- (BOOL)_mapIsSprMap:(id)a3
{
  v3 = [a3 chromeViewController];
  objc_super v4 = [v3 mapView];
  unsigned __int8 v5 = [v4 _isShowingCuratedElevatedGround];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuSections, 0);

  objc_storeStrong((id *)&self->_linkFactory, 0);
}

@end