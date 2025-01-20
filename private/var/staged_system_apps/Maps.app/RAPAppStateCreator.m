@interface RAPAppStateCreator
- (RAPAppStateCreator)initWithSceneDelegate:(id)a3;
- (id)createReportAProblemAppState;
- (void)_saveDirectionRecordingsIfNeededWithCompletion:(id)a3;
- (void)createCuratedCollectionReportAProblemAppStateWithContext:(id)a3 completion:(id)a4;
- (void)createLookAroundReportAProblemAppStateWithLookAroundContext:(id)a3 completion:(id)a4;
- (void)createPlacecardImageryReportAProblemAppStateWithContext:(id)a3 completion:(id)a4;
- (void)createReportAProblemAppStateAndPrefetchShortcutsWithCompletion:(id)a3;
- (void)createReportAProblemAppStateWithCompletion:(id)a3;
@end

@implementation RAPAppStateCreator

- (RAPAppStateCreator)initWithSceneDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPAppStateCreator;
  v5 = [(RAPAppStateCreator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_sceneDelegate, v4);
  }

  return v6;
}

- (void)createReportAProblemAppStateWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1005AEB38;
  v4[3] = &unk_1012F0BB0;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(RAPAppStateCreator *)v5 _saveDirectionRecordingsIfNeededWithCompletion:v4];
}

- (void)createLookAroundReportAProblemAppStateWithLookAroundContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  p_sceneDelegate = &self->_sceneDelegate;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  v10 = [WeakRetained chromeViewController];
  v11 = [v10 mapView];
  id v12 = objc_loadWeakRetained((id *)p_sceneDelegate);
  v13 = [v12 chromeViewController];
  v14 = [v13 currentTraits];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1005AEE4C;
  v16[3] = &unk_1012F0BD8;
  id v17 = v6;
  id v15 = v6;
  +[RAPAppStateFactory createAppStateWithMapView:v11 lookAroundContext:v8 traits:v14 completion:v16];
}

- (void)createReportAProblemAppStateAndPrefetchShortcutsWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1005AEEFC;
  v4[3] = &unk_1012F0BB0;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(RAPAppStateCreator *)v5 _saveDirectionRecordingsIfNeededWithCompletion:v4];
}

- (id)createReportAProblemAppState
{
  id v3 = [RAPAppState alloc];
  p_sceneDelegate = &self->_sceneDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  id v6 = [WeakRetained chromeViewController];
  v7 = [v6 mapView];
  id v8 = objc_loadWeakRetained((id *)p_sceneDelegate);
  v9 = [v8 chromeViewController];
  v10 = [v9 currentTraits];
  v11 = [(RAPAppState *)v3 initWithMapView:v7 traits:v10 searchHistory:&__NSArray0__struct directionHistory:&__NSArray0__struct place:0 searchDataSource:0 directionsDataSource:0 currentlyConnectedAuxiliaryControls:0];

  return v11;
}

- (void)createCuratedCollectionReportAProblemAppStateWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  v9 = [WeakRetained chromeViewController];
  v10 = [v9 currentTraits];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1005AF2C8;
  v12[3] = &unk_1012F0BD8;
  id v13 = v6;
  id v11 = v6;
  +[RAPAppStateFactory createAppStateWithTraits:v10 curatedCollectionContext:v7 completion:v12];
}

- (void)_saveDirectionRecordingsIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  id v6 = [WeakRetained platformController];
  id v7 = [v6 sessionStack];

  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v12 = [v8 reportAProblemRecorder];

  if (v12)
  {
    id v13 = [v8 reportAProblemRecorder];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1005AF4DC;
    v14[3] = &unk_1012F0C00;
    id v15 = v4;
    [v13 savePartialRecordingWithCompletion:v14];
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)createPlacecardImageryReportAProblemAppStateWithContext:(id)a3 completion:(id)a4
{
  id v12 = (void (**)(id, id, void))a4;
  id v6 = a3;
  id v7 = [RAPAppState alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneDelegate);
  uint64_t v9 = [WeakRetained chromeViewController];
  v10 = [v9 currentTraits];
  id v11 = [(RAPAppState *)v7 initWithTraits:v10 placecardImageryContext:v6];

  if (v12) {
    v12[2](v12, v11, 0);
  }
}

- (void).cxx_destruct
{
}

@end