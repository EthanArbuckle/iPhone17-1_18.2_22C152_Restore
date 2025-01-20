@interface NavigationRouteInterrupter
- (MapsSuggestionsEngine)suggestionsEngine;
- (NavigationRouteInterrupter)initWithSuggestionsEngine:(id)a3 delegate:(id)a4;
- (NavigationRouteInterruptingDelegate)delegate;
- (void)cancelInterruptionOnHistoryEntryRoute:(id)a3 completion:(id)a4;
- (void)interruptHistoryEntryRoute:(id)a3 withCompletion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NavigationRouteInterrupter

- (NavigationRouteInterrupter)initWithSuggestionsEngine:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NavigationRouteInterrupter;
  v9 = [(NavigationRouteInterrupter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestionsEngine, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)interruptHistoryEntryRoute:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = sub_10000AF10();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = [(NavigationRouteInterrupter *)self suggestionsEngine];
      *(_DWORD *)buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      v22 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "NavigationRouteInterrupter: Will interrupt route with history entry: %@, hinting refresh on engine: %@.", buf, 0x16u);
    }
    v11 = [(NavigationRouteInterrupter *)self suggestionsEngine];
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v6);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100A2E778;
    v13[3] = &unk_101314D20;
    objc_copyWeak(&v16, (id *)buf);
    objc_copyWeak(&v17, &location);
    v15 = v7;
    id v12 = v11;
    id v14 = v12;
    [v6 setNavigationInterrupted:1 completion:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "NavigationRouteInterrupter: Failed to interrupt route because history entry was nil.", buf, 2u);
    }

    if (v7) {
      v7[2](v7);
    }
  }
}

- (void)cancelInterruptionOnHistoryEntryRoute:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  if (v6)
  {
    unsigned __int8 v8 = [v6 isNavigationInterrupted];
    v9 = sub_10000AF10();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        v11 = [(NavigationRouteInterrupter *)self suggestionsEngine];
        *(_DWORD *)buf = 138412546;
        id v22 = v6;
        __int16 v23 = 2112;
        v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "NavigationRouteInterrupter: Will cancel route interruption on history entry: %@, hinting refresh on engine: %@.", buf, 0x16u);
      }
      id v12 = [(NavigationRouteInterrupter *)self suggestionsEngine];
      objc_initWeak((id *)buf, self);
      objc_initWeak(&location, v6);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100A2ED6C;
      v15[3] = &unk_101314D20;
      objc_copyWeak(&v18, (id *)buf);
      objc_copyWeak(&v19, &location);
      id v17 = v7;
      id v13 = v12;
      id v16 = v13;
      [v6 setNavigationInterrupted:0 completion:v15];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
      objc_destroyWeak((id *)buf);

      goto LABEL_14;
    }
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "NavigationRouteInterrupter: Skipping interruption because the route isn't paused.", buf, 2u);
    }

    if (v7) {
LABEL_13:
    }
      v7[2](v7);
  }
  else
  {
    id v14 = sub_10000AF10();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "NavigationRouteInterrupter: Failed to cancel interruption because history entry was nil.", buf, 2u);
    }

    if (v7) {
      goto LABEL_13;
    }
  }
LABEL_14:
}

- (NavigationRouteInterruptingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavigationRouteInterruptingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MapsSuggestionsEngine)suggestionsEngine
{
  return self->_suggestionsEngine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsEngine, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end