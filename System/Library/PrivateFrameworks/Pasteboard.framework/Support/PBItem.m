@interface PBItem
- (id)persistentBookmarkFileNameForType:(id)a3;
- (id)persistentFileNameForType:(id)a3;
- (void)_saveRepresentationsToBaseURL:(id)a3 types:(id)a4 fileProtectionType:(id)a5 allowedToCopyOnPaste:(BOOL)a6 completionBlock:(id)a7;
- (void)saveRepresentationsToStorageBaseURL:(id)a3 fileProtectionType:(id)a4 allowedToCopyOnPaste:(BOOL)a5 completionBlock:(id)a6;
- (void)setStorageBaseURL:(id)a3;
@end

@implementation PBItem

- (id)persistentBookmarkFileNameForType:(id)a3
{
  id v4 = a3;
  v5 = [(PBItem *)self UUID];
  v6 = sub_100016EDC(v5, v4);

  v7 = [v6 stringByAppendingString:@".bookmark"];

  return v7;
}

- (id)persistentFileNameForType:(id)a3
{
  id v4 = a3;
  v5 = [(PBItem *)self UUID];
  v6 = sub_100016EDC(v5, v4);

  return v6;
}

- (void)setStorageBaseURL:(id)a3
{
  id v4 = a3;
  v5 = PBItemQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017094;
  v7[3] = &unk_100031310;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)_saveRepresentationsToBaseURL:(id)a3 types:(id)a4 fileProtectionType:(id)a5 allowedToCopyOnPaste:(BOOL)a6 completionBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v41 = a5;
  id v42 = a7;
  if ([v14 count])
  {
    BOOL v37 = a6;
    v15 = [v14 firstObject];
    v16 = [(PBItem *)self UUID];
    v17 = sub_10001730C(v16, v13, v15);

    v18 = [v17 URLByAppendingPathExtension:@"bookmark"];
    unsigned int v19 = [v17 isFileURL];
    v38 = v17;
    v39 = v13;
    v40 = v18;
    if (v19)
    {
      v18 = +[NSFileManager defaultManager];
      v7 = [v17 path];
      if ([v18 fileExistsAtPath:v7])
      {

LABEL_14:
        v23 = _PBLog();
        v24 = v38;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v82 = v38;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Skipping save for already existing item representation: %@", buf, 0xCu);
        }

        v25 = objc_msgSend(v14, "subarrayWithRange:", 1, (char *)objc_msgSend(v14, "count") - 1);
        v71 = _NSConcreteStackBlock;
        uint64_t v72 = 3221225472;
        v73 = sub_100018448;
        v74 = &unk_100031A90;
        v75 = self;
        id v13 = v39;
        id v76 = v39;
        v77 = v25;
        id v78 = v41;
        BOOL v80 = v37;
        id v79 = v42;
        id v26 = v25;
        PBDispatchAsyncCallback();

        goto LABEL_24;
      }
      if (([v40 isFileURL] & 1) == 0)
      {

        goto LABEL_18;
      }
    }
    else if (([v18 isFileURL] & 1) == 0)
    {
      goto LABEL_18;
    }
    v20 = +[NSFileManager defaultManager];
    v21 = [v40 path];
    unsigned int v22 = [v20 fileExistsAtPath:v21];

    if (v19)
    {

      id v14 = v36;
      if (v22) {
        goto LABEL_14;
      }
    }
    else
    {
      id v14 = v36;
      if (v22) {
        goto LABEL_14;
      }
    }
LABEL_18:
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100018460;
    v64[3] = &unk_100031A90;
    id v65 = v14;
    v66 = self;
    id v13 = v39;
    id v67 = v39;
    id v27 = v41;
    id v68 = v27;
    BOOL v70 = v37;
    id v28 = v42;
    id v69 = v28;
    v29 = objc_retainBlock(v64);
    v30 = [(PBItem *)self representationConformingToType:v15];
    if ([v30 preferredRepresentation])
    {
      if ([v30 preferredRepresentation] == (id)2)
      {
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_1000187E8;
        v49[3] = &unk_100031AE0;
        BOOL v56 = v37;
        v31 = &v50;
        id v50 = v40;
        v24 = v38;
        id v51 = v38;
        v52 = self;
        id v53 = v15;
        v54 = v29;
        id v55 = v28;
        id v32 = [v30 loadOpenInPlaceWithCompletion:v49];

        v33 = v51;
      }
      else
      {
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100018AF8;
        v44[3] = &unk_100031B08;
        v31 = (id *)v45;
        v24 = v38;
        v45[0] = v38;
        v45[1] = self;
        id v46 = v15;
        id v47 = v28;
        v48 = v29;
        id v35 = [v30 loadFileCopyWithCompletion:v44];

        v33 = v46;
      }
    }
    else
    {
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_10001856C;
      v57[3] = &unk_100031AB8;
      v31 = &v58;
      v24 = v38;
      id v58 = v38;
      id v59 = v27;
      v60 = self;
      id v61 = v15;
      id v62 = v28;
      v63 = v29;
      id v34 = [v30 loadDataWithCompletion:v57];

      v33 = v59;
    }

    id v26 = v65;
LABEL_24:

    goto LABEL_25;
  }
  if (v42)
  {
    id v43 = v42;
    PBDispatchAsyncCallback();
    v15 = v43;
LABEL_25:
  }
}

- (void)saveRepresentationsToStorageBaseURL:(id)a3 fileProtectionType:(id)a4 allowedToCopyOnPaste:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v21 = 0;
  unsigned int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_100018F08;
  v25 = sub_100018F18;
  id v26 = 0;
  id v13 = PBItemQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018F20;
  block[3] = &unk_100030D30;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(v13, block);

  uint64_t v14 = v22[5];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100018F88;
  v17[3] = &unk_100031B30;
  v17[4] = self;
  id v15 = v10;
  id v18 = v15;
  id v16 = v12;
  id v19 = v16;
  [(PBItem *)self _saveRepresentationsToBaseURL:v15 types:v14 fileProtectionType:v11 allowedToCopyOnPaste:v7 completionBlock:v17];

  _Block_object_dispose(&v21, 8);
}

@end