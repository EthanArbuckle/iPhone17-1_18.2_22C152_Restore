@interface RAPWebBundleHomeViewController
- (RAPWebBundleHomeViewController)initWithReport:(id)a3 completion:(id)a4;
- (id)_headerTitle;
- (void)_contextFromQuestionWithLocales:(id)a3 withReplyHandler:(id)a4;
- (void)_dismiss;
- (void)_presentAddressUI;
- (void)_presentAutocompleteViewController:(id)a3 forItemKind:(int64_t)a4;
- (void)_presentContainmentUIIsParentContainment:(BOOL)a3 currentlySelectedMUIDs:(id)a4;
- (void)_reportSent;
- (void)_reportSentWithDismissalGesture:(BOOL)a3;
- (void)_submit;
- (void)_uploadForm:(id)a3;
- (void)categoryChooserViewController:(id)a3 categoriesDidNotChange:(id)a4;
- (void)categoryChooserViewController:(id)a3 didReceiveSelectedCategories:(id)a4;
- (void)didDismissByGesture;
- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5;
- (void)rapSearchAutocompleteViewController:(id)a3 finishedPickingAutocompleteResult:(id)a4 isAutocompleteResult:(BOOL)a5;
- (void)rapSearchAutocompleteViewControllerDidCancel:(id)a3;
- (void)setupViews;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RAPWebBundleHomeViewController

- (RAPWebBundleHomeViewController)initWithReport:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPWebBundleHomeViewController;
  v9 = [(RAPWebBundleBaseMapViewController *)&v14 initWithReport:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_report, a3);
    id v11 = objc_retainBlock(v8);
    id completion = v10->_completion;
    v10->_id completion = v11;
  }
  return v10;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)RAPWebBundleHomeViewController;
  [(RAPWebBundleBaseMapViewController *)&v3 viewDidLoad];
  [(RAPWebBundleBaseViewController *)self loadWebView];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RAPWebBundleHomeViewController;
  [(RAPWebBundleHomeViewController *)&v4 viewDidAppear:a3];
  +[RAPAnalyticsManager captureRAPRevealActionFromReport:self->_report];
}

- (void)_dismiss
{
  +[RAPAnalyticsManager captureRAPCancelActionFromReport:self->_report];
  [(RAPWebBundleBaseViewController *)self removeAllPhotos];
  id completion = self->_completion;
  if (completion)
  {
    objc_super v4 = (void (*)(void))*((void *)completion + 2);
    v4();
  }
}

- (void)_reportSent
{
}

- (void)_reportSentWithDismissalGesture:(BOOL)a3
{
  +[RAPAnalyticsManager captureRAPAcknowledgementDoneActionFromReport:self->_report];
  [(RAPWebBundleBaseViewController *)self removeAllPhotos];
  id completion = self->_completion;
  if (completion)
  {
    v5 = (void (*)(void))*((void *)completion + 2);
    v5();
  }
}

- (void)_submit
{
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100717DEC;
  v10[3] = &unk_1012E6708;
  objc_copyWeak(&v11, &location);
  objc_super v3 = objc_retainBlock(v10);
  objc_super v4 = [(RAPWebBundleBaseViewController *)self webBundleQuestion];
  if ([v4 isAnonymous])
  {
  }
  else
  {
    v5 = +[UserProfileReportHistoryManager sharedInstance];
    unsigned __int8 v6 = [v5 inChina];

    if ((v6 & 1) == 0)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100717F84;
      v7[3] = &unk_1012F6748;
      objc_copyWeak(&v9, &location);
      id v8 = v3;
      +[RAPPrivacy performPrivacyCheckWithAppearance:4 completion:v7];

      objc_destroyWeak(&v9);
      goto LABEL_6;
    }
  }
  ((void (*)(void *))v3[2])(v3);
LABEL_6:

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)setupViews
{
  [(RAPWebBundleHomeViewController *)self setAccessibilityIdentifier:@"RAPHomeView"];
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_dismiss"];
  objc_super v4 = [(RAPWebBundleHomeViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  id v5 = objc_alloc((Class)UIBarButtonItem);
  unsigned __int8 v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"[RAP Web UI] Send" value:@"localized string not found" table:0];
  id v8 = [v5 initWithTitle:v7 style:2 target:self action:"_submit"];
  id v9 = [(RAPWebBundleHomeViewController *)self navigationItem];
  [v9 setRightBarButtonItem:v8];

  v10 = [(RAPWebBundleHomeViewController *)self _headerTitle];
  id v11 = [(RAPWebBundleHomeViewController *)self navigationItem];
  [v11 setTitle:v10];

  v12.receiver = self;
  v12.super_class = (Class)RAPWebBundleHomeViewController;
  [(RAPWebBundleBaseViewController *)&v12 setupViews];
}

- (id)_headerTitle
{
  v2 = [(RAPWebBundleBaseViewController *)self webBundleQuestion];
  id v3 = [v2 questionType];

  switch((unint64_t)v3)
  {
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 0x1CuLL:
      int BOOL = GEOConfigGetBOOL();
      id v5 = +[NSBundle mainBundle];
      unsigned __int8 v6 = v5;
      if (BOOL) {
        CFStringRef v7 = @"[RAP Web UI] Report Something Missing";
      }
      else {
        CFStringRef v7 = @"[RAP Web UI] Add to Maps";
      }
      break;
    case 0xDuLL:
      id v5 = +[NSBundle mainBundle];
      unsigned __int8 v6 = v5;
      CFStringRef v7 = @"[RAP Web UI] Add Address";
      break;
    case 0xEuLL:
      id v5 = +[NSBundle mainBundle];
      unsigned __int8 v6 = v5;
      CFStringRef v7 = @"[RAP Web UI] Add Hours";
      break;
    case 0xFuLL:
      id v5 = +[NSBundle mainBundle];
      unsigned __int8 v6 = v5;
      CFStringRef v7 = @"[RAP Web UI] Add Phone Number";
      break;
    case 0x10uLL:
      id v5 = +[NSBundle mainBundle];
      unsigned __int8 v6 = v5;
      CFStringRef v7 = @"[RAP Web UI] Add Website";
      break;
    default:
      id v5 = +[NSBundle mainBundle];
      unsigned __int8 v6 = v5;
      CFStringRef v7 = @"[RAP Web UI] Report an Issue";
      break;
  }
  id v8 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

  return v8;
}

- (void)_uploadForm:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPWebBundleBaseViewController *)self webBundleQuestion];
  [v5 setDynamicForm:v4];
  unsigned __int8 v6 = sub_1009A033C();
  objc_initWeak(&location, self);
  report = self->_report;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1007184F0;
  v14[3] = &unk_1012E97E8;
  objc_copyWeak(&v16, &location);
  id v8 = v6;
  id v15 = v8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007185C0;
  v10[3] = &unk_1012E9D00;
  objc_copyWeak(&v13, &location);
  id v9 = v8;
  id v11 = v9;
  objc_super v12 = self;
  [(RAPReport *)report submitWithPrivacyRequestHandler:&stru_1012F6768 willStartSubmitting:v14 didFinishSubmitting:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)didDismissByGesture
{
  id v3 = [(RAPWebBundleHomeViewController *)self navigationController];
  id v4 = [v3 topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(RAPWebBundleHomeViewController *)self _reportSentWithDismissalGesture:1];
  }
}

- (void)didReceiveMessageFromUserContentController:(id)a3 message:(id)a4 replyHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v53.receiver = self;
  v53.super_class = (Class)RAPWebBundleHomeViewController;
  [(RAPWebBundleBaseMapViewController *)&v53 didReceiveMessageFromUserContentController:v8 message:v9 replyHandler:v10];
  id v11 = [v9 objectForKeyedSubscript:@"name"];
  unsigned int v12 = [v11 isEqualToString:@"context"];

  if (v12)
  {
    id v13 = [v9 objectForKeyedSubscript:@"supportedLocales"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v14 = +[NSArray array];

      id v13 = (void *)v14;
    }
    [(RAPWebBundleHomeViewController *)self _contextFromQuestionWithLocales:v13 withReplyHandler:v10];
  }
  else
  {
    id v15 = [v9 objectForKeyedSubscript:@"name"];
    unsigned int v16 = [v15 isEqualToString:@"setValid"];

    if (v16)
    {
      v17 = [(RAPWebBundleBaseViewController *)self delegate];
      [v17 enableDismissByGesture:0];
    }
    else
    {
      v18 = [v9 objectForKeyedSubscript:@"name"];
      unsigned int v19 = [v18 isEqualToString:@"getAddress"];

      if (v19)
      {
        id v20 = objc_retainBlock(v10);
        id replyHandler = self->_replyHandler;
        self->_id replyHandler = v20;

        [(RAPWebBundleHomeViewController *)self _presentAddressUI];
      }
      else
      {
        v22 = [v9 objectForKeyedSubscript:@"name"];
        unsigned int v23 = [v22 isEqualToString:@"getCategories"];

        if (v23)
        {
          id v24 = objc_retainBlock(v10);
          id v25 = self->_replyHandler;
          self->_id replyHandler = v24;

          v26 = [v9 objectForKeyedSubscript:@"categories"];
          v27 = [[ReportAProblemCategoryChooserViewController alloc] initWithPresentationStyle:1 selectedCategoryNames:v26];
          [(ReportAProblemCategoryChooserViewController *)v27 setChooserDelegate:self];
          [(RAPWebBundleBaseViewController *)self presentAccessoryViewController:v27];
        }
        else
        {
          v28 = [v9 objectForKeyedSubscript:@"name"];
          unsigned int v29 = [v28 isEqualToString:@"showPoi"];

          if (v29)
          {
            v30 = [v9 objectForKeyedSubscript:@"id"];
            v31 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v30 unsignedLongLongValue]);

            v32 = +[GEOMapService sharedService];
            v54 = v31;
            v33 = +[NSArray arrayWithObjects:&v54 count:1];
            v34 = +[GEOMapService sharedService];
            v35 = [v34 defaultTraits];
            v36 = [v32 ticketForMUIDs:v33 traits:v35];

            objc_initWeak(&location, self);
            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472;
            v49[2] = sub_100718F38;
            v49[3] = &unk_1012E7418;
            objc_copyWeak(&v51, &location);
            id v37 = v31;
            id v50 = v37;
            id v38 = &_dispatch_main_q;
            [v36 submitWithHandler:v49 networkActivity:0 queue:&_dispatch_main_q];

            objc_destroyWeak(&v51);
            objc_destroyWeak(&location);
          }
          else
          {
            v39 = [v9 objectForKeyedSubscript:@"name"];
            unsigned int v40 = [v39 isEqualToString:@"getPoi"];

            if (v40)
            {
              id v41 = objc_retainBlock(v10);
              id v42 = self->_replyHandler;
              self->_id replyHandler = v41;

              [(RAPWebBundleHomeViewController *)self _presentContainmentUIIsParentContainment:0 currentlySelectedMUIDs:&__NSArray0__struct];
            }
            else
            {
              v43 = [v9 objectForKeyedSubscript:@"name"];
              unsigned int v44 = [v43 hasPrefix:@"showModal"];

              if (v44)
              {
                v45 = [v9 objectForKeyedSubscript:@"url"];
                v46 = [v9 objectForKeyedSubscript:@"title"];
                v47 = [v9 objectForKeyedSubscript:@"modalData"];
                v48 = [[RAPWebBundleDataDrivenViewController alloc] initWithEntryPoint:v45 report:self->_report title:v46 data:v47 replyHandler:v10];
                [(RAPWebBundleBaseViewController *)self presentAccessoryViewController:v48];
              }
            }
          }
        }
      }
    }
  }
}

- (void)_presentAddressUI
{
  id v16 = [(RAPWebBundleBaseViewController *)self webBundleQuestion];
  id v3 = [RAPPlaceCorrectableAddress alloc];
  id v4 = [v16 reportedPlace];
  id v5 = [v4 mapItem];
  id v6 = [(RAPPlaceCorrectableAddress *)v3 _initWithMapItem:v5];

  CFStringRef v7 = [v6 freeformAddress];
  id v8 = [v7 value];
  id v9 = +[RAPSearchAutocompleteViewController addressAutocompleteViewControllerWithInitialSearchString:v8];

  id v10 = [(RAPWebBundleBaseViewController *)self webBundleQuestion];
  id v11 = (char *)[v10 questionType];

  if ((unint64_t)(v11 - 2) < 5 || v11 == (char *)28)
  {
    unsigned int v12 = +[NSBundle mainBundle];
    id v13 = v12;
    CFStringRef v14 = @"Add Address [RAP]";
  }
  else
  {
    unsigned int v12 = +[NSBundle mainBundle];
    id v13 = v12;
    CFStringRef v14 = @"Change Address [RAP]";
  }
  id v15 = [v12 localizedStringForKey:v14 value:@"localized string not found" table:0];
  [v9 setTitleText:v15];

  [(RAPWebBundleHomeViewController *)self _presentAutocompleteViewController:v9 forItemKind:0];
}

- (void)_contextFromQuestionWithLocales:(id)a3 withReplyHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RAPWebBundleBaseViewController *)self webBundleQuestion];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10071932C;
  v10[3] = &unk_1012F67B8;
  objc_copyWeak(&v12, &location);
  void v10[4] = self;
  id v9 = v7;
  id v11 = v9;
  [v8 retrieveContextwithLocales:v6 contextCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_presentContainmentUIIsParentContainment:(BOOL)a3 currentlySelectedMUIDs:(id)a4
{
  id v5 = a4;
  id v6 = [(RAPWebBundleBaseViewController *)self webBundleQuestion];
  id v7 = [v6 report];
  id v8 = [v7 _context];
  id v9 = [v8 mapCamera];
  [v9 centerCoordinate];

  GEOCoordinateRegionMakeWithDistance();
  id v17 = [objc_alloc((Class)GEOMapRegion) initWithCoordinateRegion:v10, v11, v12, v13];
  CFStringRef v14 = +[RAPSearchAutocompleteViewController poiAutocompleteViewControllerWithBoundedMapRegion:v17 excludedMUIDs:v5];

  id v15 = +[NSBundle mainBundle];
  id v16 = [v15 localizedStringForKey:@"Choose a Place [RAP]" value:@"localized string not found" table:0];
  [v14 setTitleText:v16];

  [(RAPWebBundleHomeViewController *)self _presentAutocompleteViewController:v14 forItemKind:1];
}

- (void)_presentAutocompleteViewController:(id)a3 forItemKind:(int64_t)a4
{
  self->_currentAutocompleteSelectionKind = a4;
  id v5 = a3;
  [v5 setDelegate:self];
  [(RAPWebBundleBaseViewController *)self presentAccessoryViewController:v5];
}

- (void)rapSearchAutocompleteViewController:(id)a3 finishedPickingAutocompleteResult:(id)a4 isAutocompleteResult:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  double v10 = v9;
  int64_t currentAutocompleteSelectionKind = self->_currentAutocompleteSelectionKind;
  if (currentAutocompleteSelectionKind)
  {
    if (currentAutocompleteSelectionKind == 1)
    {
      id v46 = v8;
      double v12 = [v9 selectedMapItem];
      double v13 = objc_alloc_init(RAPWebBundleImageContext);
      CFStringRef v14 = [v12 _styleAttributes];
      id v15 = +[UIScreen mainScreen];
      [v15 scale];
      +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v14, 3, 0);
      id v16 = (UIImage *)objc_claimAutoreleasedReturnValue();

      id v17 = UIImagePNGRepresentation(v16);
      [(RAPWebBundleImageContext *)v13 setImage:v17];

      v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%llu", [v12 _muid]);
      [(RAPWebBundleImageContext *)v13 setIdentifier:v18];
      unsigned int v19 = [(RAPWebBundleImageContext *)v13 identifier];
      v45 = v16;
      [(RAPWebBundleBaseViewController *)self saveImage:v16 withIdentifier:v19];

      id v20 = objc_alloc_init(RAPWebBundlePlaceSummaryContext);
      [(RAPWebBundlePlaceSummaryContext *)v20 setIdentifier:v18];
      v21 = [v12 name];
      [(RAPWebBundlePlaceSummaryContext *)v20 setTitle:v21];

      v22 = [v12 _addressFormattedAsShortenedAddress];
      [(RAPWebBundlePlaceSummaryContext *)v20 setSubtitle:v22];

      id v23 = [[RAPPlaceCorrectableAddress alloc] _initWithMapItem:v12];
      id v24 = [v23 freeformAddress];
      id v25 = [v24 value];
      [(RAPWebBundlePlaceSummaryContext *)v20 setAddress:v25];

      [(RAPWebBundlePlaceSummaryContext *)v20 setImageContext:v13];
      id replyHandler = (void (**)(id, void *, void))self->_replyHandler;
      if (replyHandler)
      {
        v27 = [(RAPWebBundlePlaceSummaryContext *)v20 context];
        replyHandler[2](replyHandler, v27, 0);

        id v28 = self->_replyHandler;
        self->_id replyHandler = 0;
      }
      id v8 = v46;
    }
  }
  else
  {
    uint64_t v29 = [v9 searchBarText];
    v30 = (void *)v29;
    v31 = &stru_101324E70;
    if (v29) {
      v31 = (__CFString *)v29;
    }
    v32 = v31;

    if (v5)
    {
      v33 = [RAPPlaceCorrectableAddress alloc];
      v34 = [v10 selectedMapItem];
      id v35 = [(RAPPlaceCorrectableAddress *)v33 _initWithMapItem:v34];

      v36 = [v35 freeformAddress];
      id v37 = [v36 value];
      id v38 = [v37 length];

      if (v38)
      {
        v39 = [v35 freeformAddress];
        uint64_t v40 = [v39 value];

        v32 = (__CFString *)v40;
      }
    }
    id v41 = (void (**)(id, void *, void))self->_replyHandler;
    if (v41)
    {
      v47 = v32;
      CFStringRef v48 = @"formattedAddress";
      id v42 = +[NSArray arrayWithObjects:&v47 count:1];
      v49 = v42;
      v43 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      v41[2](v41, v43, 0);

      id v44 = self->_replyHandler;
      self->_id replyHandler = 0;
    }
  }
}

- (void)rapSearchAutocompleteViewControllerDidCancel:(id)a3
{
}

- (void)categoryChooserViewController:(id)a3 didReceiveSelectedCategories:(id)a4
{
  id replyHandler = (void (**)(id, void *, void))self->_replyHandler;
  if (replyHandler)
  {
    CFStringRef v9 = @"categories";
    id v10 = a4;
    id v6 = a4;
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    replyHandler[2](replyHandler, v7, 0);

    id v8 = self->_replyHandler;
    self->_id replyHandler = 0;
  }
}

- (void)categoryChooserViewController:(id)a3 categoriesDidNotChange:(id)a4
{
  id replyHandler = (void (**)(id, void *, void))self->_replyHandler;
  if (replyHandler)
  {
    CFStringRef v9 = @"categories";
    id v10 = a4;
    id v6 = a4;
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    replyHandler[2](replyHandler, v7, 0);

    id v8 = self->_replyHandler;
    self->_id replyHandler = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_replyHandler, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end