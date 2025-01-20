@interface MTURLPresentationController
- (BOOL)_canShowInApp;
- (BOOL)canShowWithPresentingViewController:(id)a3;
- (MTURLPresentationController)initWithURL:(id)a3;
- (NSURL)url;
- (void)_showURL:(id)a3 presentingViewController:(id)a4;
- (void)showWithPresentingViewController:(id)a3;
@end

@implementation MTURLPresentationController

- (MTURLPresentationController)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTURLPresentationController;
  v6 = [(MTURLPresentationController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (BOOL)canShowWithPresentingViewController:(id)a3
{
  BOOL result = [(MTURLPresentationController *)self _canShowInApp];
  if (!a3) {
    return 0;
  }
  return result;
}

- (void)showWithPresentingViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(MTURLPresentationController *)self url];
  [(MTURLPresentationController *)self _showURL:v5 presentingViewController:v4];
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

- (BOOL)_canShowInApp
{
  v2 = [(MTURLPresentationController *)self url];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 scheme];
    id v5 = [v4 lowercaseString];

    if ([v5 isEqualToString:@"http"]) {
      unsigned __int8 v6 = 1;
    }
    else {
      unsigned __int8 v6 = [v5 isEqualToString:@"https"];
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)_showURL:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(MTURLPresentationController *)self _canShowInApp];
  if (v6)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid parameter.  url can not be nil", buf, 2u);
    }

    if (v7)
    {
LABEL_3:
      if (v8) {
        goto LABEL_4;
      }
LABEL_14:
      v12 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Invalid use.  _canShowInApp is NO, so we shouldn't attempt to show in-app", v15, 2u);
      }
      goto LABEL_16;
    }
  }
  v14 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Invalid parameter.  presentingViewController can not be nil", v16, 2u);
  }

  if ((v8 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_4:
  if (v6)
  {
    if (v7)
    {
      objc_super v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      unsigned __int8 v11 = [v10 isEqual:@"_UIContextMenuActionsOnlyViewController"];

      if ((v11 & 1) == 0)
      {
        v12 = [objc_alloc((Class)SFSafariViewController) initWithURL:v6];
        [v12 setModalPresentationStyle:1];
        [v7 presentViewController:v12 animated:1 completion:0];
LABEL_16:
      }
    }
  }
}

@end