@interface WFGizmoFaceCollectionProvider
- (NTKPersistentFaceCollection)collection;
- (OS_os_log)log;
- (id)collectionForIdentifier:(id)a3;
- (id)completion;
- (void)faceCollectionDidLoad:(id)a3;
- (void)getFacesForCollection:(id)a3 completion:(id)a4;
- (void)getWatchFaceObjectsForLibraryCollection:(id)a3;
- (void)processCollectionAndFinish:(id)a3;
- (void)setCollection:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation WFGizmoFaceCollectionProvider

- (void)getWatchFaceObjectsForLibraryCollection:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v5 = (void *)qword_10000D538;
  uint64_t v10 = qword_10000D538;
  if (!qword_10000D538)
  {
    v6 = (void *)sub_100004A80();
    v8[3] = (uint64_t)dlsym(v6, "NTKCollectionIdentifierLibraryFaces");
    qword_10000D538 = v8[3];
    v5 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v5) {
    sub_100006084();
  }
  [(WFGizmoFaceCollectionProvider *)self getFacesForCollection:*v5 completion:v4];
}

- (void)getFacesForCollection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = objc_retainBlock(a4);
  id completion = self->_completion;
  self->_id completion = v7;

  uint64_t v9 = [(WFGizmoFaceCollectionProvider *)self log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "getting a collection", buf, 2u);
  }

  uint64_t v10 = [(WFGizmoFaceCollectionProvider *)self collectionForIdentifier:v6];

  unsigned int v11 = [v10 hasLoaded];
  v12 = [(WFGizmoFaceCollectionProvider *)self log];
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "collection is loaded, moving to process", v15, 2u);
    }

    [(WFGizmoFaceCollectionProvider *)self processCollectionAndFinish:v10];
  }
  else
  {
    if (v13)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "collection was not loaded, waiting for collection loading", v14, 2u);
    }

    [v10 addObserver:self];
  }
}

- (id)collectionForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[CLKDevice currentDevice];
  id v6 = [v5 nrDevice];
  id v7 = [v6 pairingID];

  v8 = [(NTKPersistentFaceCollection *)self->_collection deviceUUID];
  unsigned int v9 = [v8 isEqual:v7];

  uint64_t v10 = [(NTKPersistentFaceCollection *)self->_collection collectionIdentifier];
  unsigned int v11 = [v10 isEqualToString:v4];

  collection = self->_collection;
  if (!collection) {
    goto LABEL_11;
  }
  if ([(NTKPersistentFaceCollection *)collection hasLoaded] & v11 & v9) {
    goto LABEL_19;
  }
  BOOL v13 = self->_collection;
  if (v13)
  {
    unsigned int v14 = [(NTKPersistentFaceCollection *)v13 hasLoaded];
    CFStringRef v15 = @"requesting a new collection type";
    if (v11) {
      CFStringRef v15 = 0;
    }
    if (!v9) {
      CFStringRef v15 = @"uuid has changed";
    }
    if (v14) {
      CFStringRef v16 = v15;
    }
    else {
      CFStringRef v16 = @"collection is there but not loaded";
    }
  }
  else
  {
LABEL_11:
    CFStringRef v16 = @"_collection is nil";
  }
  v17 = [(WFGizmoFaceCollectionProvider *)self log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "collection creation: creating a new collection because %@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v18 = (void *)qword_10000D548;
  uint64_t v29 = qword_10000D548;
  if (!qword_10000D548)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v31 = sub_100004BF4;
    v32 = &unk_1000081B0;
    v33 = &v26;
    sub_100004BF4((uint64_t)&buf);
    v18 = (void *)v27[3];
  }
  v19 = v18;
  _Block_object_dispose(&v26, 8);
  id v20 = [v19 alloc];
  v21 = (NTKPersistentFaceCollection *)objc_msgSend(v20, "initWithCollectionIdentifier:deviceUUID:", v4, v7, v26);
  v22 = self->_collection;
  self->_collection = v21;

  v23 = [(WFGizmoFaceCollectionProvider *)self log];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "collection finished creation", (uint8_t *)&buf, 2u);
  }

LABEL_19:
  v24 = self->_collection;

  return v24;
}

- (void)processCollectionAndFinish:(id)a3
{
  id v4 = a3;
  v5 = [(WFGizmoFaceCollectionProvider *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "starting process", buf, 2u);
  }

  uint64_t v6 = (uint64_t)[v4 numberOfFaces];
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v6];
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      unsigned int v9 = [v4 faceAtIndex:i];
      uint64_t v10 = [v4 uuidForFace:v9];
      unsigned int v11 = [v10 UUIDString];

      v12 = [v9 name];
      BOOL v13 = [[COSWatchFace alloc] initWithIdentifier:v11 displayString:v12];
      unsigned int v14 = [v4 selectedFace];
      if (v14 == v9) {
        CFStringRef v15 = &__kCFBooleanTrue;
      }
      else {
        CFStringRef v15 = &__kCFBooleanFalse;
      }
      [(COSWatchFace *)v13 setIsActive:v15];

      [v7 addObject:v13];
    }
  }
  CFStringRef v16 = [(WFGizmoFaceCollectionProvider *)self log];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "process finished, calling completion", v18, 2u);
  }

  v17 = [(WFGizmoFaceCollectionProvider *)self completion];
  ((void (**)(void, id, id, void))v17)[2](v17, v4, v7, 0);
}

- (void)faceCollectionDidLoad:(id)a3
{
  id v4 = a3;
  v5 = [(WFGizmoFaceCollectionProvider *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "collection loaded, moving to process", v6, 2u);
  }

  [(WFGizmoFaceCollectionProvider *)self processCollectionAndFinish:v4];
}

- (OS_os_log)log
{
  log = self->_log;
  if (!log)
  {
    id v4 = (OS_os_log *)os_log_create("BridgeIntents", "COSSetGizmoFaceIntent");
    v5 = self->_log;
    self->_log = v4;

    log = self->_log;
  }
  return log;
}

- (NTKPersistentFaceCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end