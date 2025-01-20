@interface MapsWebLinkPresenter
- (BOOL)_isValidURLForWebView:(id)a3;
- (BOOL)_isValidURLToOpen:(id)a3;
- (MapsWebLinkPresenter)initWithPresentingViewController:(id)a3;
- (void)presentWebURL:(id)a3;
@end

@implementation MapsWebLinkPresenter

- (MapsWebLinkPresenter)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MapsWebLinkPresenter;
  v5 = [(MapsWebLinkPresenter *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
  }

  return v6;
}

- (void)presentWebURL:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4
    || ([v4 absoluteString],
        v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 length],
        v6,
        !v7))
  {
    v9 = sub_10036846C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "URL is nil, early exit", buf, 2u);
    }
    goto LABEL_10;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if (sub_1000BBB44(WeakRetained) == 5)
  {

LABEL_9:
    v9 = +[MKSystemController sharedInstance];
    [v9 openURL:v5 completionHandler:0];
LABEL_10:

    goto LABEL_11;
  }
  int IsEnabled_PlaceCardWebView = MapsFeature_IsEnabled_PlaceCardWebView();

  if (!IsEnabled_PlaceCardWebView) {
    goto LABEL_9;
  }
  v11 = (void *)UIApp;
  UIApplicationOpenExternalURLOptionsKey v16 = UIApplicationOpenURLOptionUniversalLinksOnly;
  v17 = &__kCFBooleanTrue;
  v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003684C0;
  v13[3] = &unk_1012E6160;
  v13[4] = self;
  id v14 = v5;
  [v11 _openURL:v14 originatingView:0 options:v12 completionHandler:v13];

LABEL_11:
}

- (BOOL)_isValidURLForWebView:(id)a3
{
  v3 = [a3 scheme];
  id v4 = [v3 lowercaseString];

  if ([v4 isEqualToString:@"http"]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [v4 isEqualToString:@"https"];
  }

  return v5;
}

- (BOOL)_isValidURLToOpen:(id)a3
{
  v3 = [a3 scheme];
  id v4 = [v3 lowercaseString];

  LOBYTE(v3) = [v4 isEqualToString:@"mailto"];
  return (char)v3;
}

- (void).cxx_destruct
{
}

@end