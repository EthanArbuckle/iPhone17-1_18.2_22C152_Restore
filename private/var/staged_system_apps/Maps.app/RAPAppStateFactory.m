@interface RAPAppStateFactory
+ (void)createAppStateWithMapView:(id)a3 lookAroundContext:(id)a4 traits:(id)a5 completion:(id)a6;
+ (void)createAppStateWithMapView:(id)a3 traits:(id)a4 place:(id)a5 searchDataSource:(id)a6 directionsDataSource:(id)a7 completion:(id)a8;
+ (void)createAppStateWithMapView:(id)a3 traits:(id)a4 place:(id)a5 searchDataSource:(id)a6 directionsDataSource:(id)a7 shouldLoadHomeWorkShortcuts:(BOOL)a8 completion:(id)a9;
+ (void)createAppStateWithTraits:(id)a3 curatedCollectionContext:(id)a4 completion:(id)a5;
@end

@implementation RAPAppStateFactory

+ (void)createAppStateWithMapView:(id)a3 traits:(id)a4 place:(id)a5 searchDataSource:(id)a6 directionsDataSource:(id)a7 completion:(id)a8
{
}

+ (void)createAppStateWithMapView:(id)a3 traits:(id)a4 place:(id)a5 searchDataSource:(id)a6 directionsDataSource:(id)a7 shouldLoadHomeWorkShortcuts:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v33 = a3;
  id v32 = a4;
  id v31 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a9;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = sub_100104450;
  v72[4] = sub_100104A98;
  id v73 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = sub_100104450;
  v70[4] = sub_100104A98;
  id v71 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = sub_100104450;
  v68[4] = sub_100104A98;
  id v69 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = sub_100104450;
  v66[4] = sub_100104A98;
  id v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = sub_100104450;
  v64[4] = sub_100104A98;
  id v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = sub_100104450;
  v62[4] = sub_100104A98;
  id v63 = 0;
  v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  v18 = +[RAPStorageHistoryContainer searchRecordingStorage];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100C0691C;
  v59[3] = &unk_1012FF230;
  v61 = v72;
  v19 = v17;
  v60 = v19;
  +[HistoryRAPUserSearch loadAllSearchesFromStorage:v18 completion:v59];

  dispatch_group_enter(v19);
  v20 = +[RAPStorageHistoryContainer directionsRecordingStorage];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_100C0697C;
  v56[3] = &unk_1012FF230;
  v58 = v70;
  v21 = v19;
  v57 = v21;
  +[HistoryRAPUserDirectionRequest loadAllRequestsFromStorage:v20 completion:v56];

  dispatch_group_enter(v21);
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100C069DC;
  v53[3] = &unk_10131B630;
  v55 = v68;
  v22 = v21;
  v54 = v22;
  +[RAPAuxiliaryControlsRecorder fetchCurrentlyConnectedControlsWithCompletion:v53];
  if (v9)
  {
    dispatch_group_enter(v22);
    v23 = sub_100018584();
    v24 = [v23 oneFavorites];

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100C06A3C;
    v48[3] = &unk_10131B658;
    v50 = v66;
    v51 = v64;
    v52 = v62;
    v49 = v22;
    [v24 loadAllShortcutsWithHandler:v48];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C06C30;
  block[3] = &unk_10131B6A8;
  BOOL v47 = v9;
  id v35 = v33;
  id v36 = v32;
  v41 = v72;
  v42 = v70;
  id v37 = v31;
  id v38 = v14;
  v43 = v68;
  v44 = v66;
  v45 = v64;
  v46 = v62;
  id v39 = v15;
  id v40 = v16;
  id v25 = v16;
  id v26 = v15;
  id v27 = v14;
  id v28 = v31;
  id v29 = v32;
  id v30 = v33;
  dispatch_group_notify(v22, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);

  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v72, 8);
}

+ (void)createAppStateWithMapView:(id)a3 lookAroundContext:(id)a4 traits:(id)a5 completion:(id)a6
{
  BOOL v9 = (void (**)(id, RAPAppState *))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[RAPAppState alloc] initWithMapView:v12 lookAroundContext:v11 traits:v10];

  v9[2](v9, v13);
}

+ (void)createAppStateWithTraits:(id)a3 curatedCollectionContext:(id)a4 completion:(id)a5
{
  v7 = (void (**)(id, RAPAppState *))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[RAPAppState alloc] initWithTraits:v9 curatedCollectionContext:v8];

  v7[2](v7, v10);
}

@end