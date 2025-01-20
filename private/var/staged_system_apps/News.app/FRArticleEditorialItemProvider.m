@interface FRArticleEditorialItemProvider
- (BOOL)shouldShowBadgeForArticleID:(id)a3 currentDocumentVersion:(id)a4 lastSeenDocumentVersion:(id)a5;
- (FRArticleEditorialItemProvider)init;
- (FRArticleEditorialItemProvider)initWithEditorialItemEntryManager:(id)a3 thumbnailCreator:(id)a4 editorialItemCreator:(id)a5;
- (FREditorialItemCreator)editorialItemCreator;
- (FREditorialItemEntryManager)editorialItemEntryManager;
- (FREditorialItemThumbnailCreator)thumbnailCreator;
- (void)createEditorialItemWithContext:(id)a3 articleModifiedDate:(id)a4 articleID:(id)a5 headline:(id)a6 flintDataProvider:(id)a7 completion:(id)a8;
- (void)downloadThumbnailIconWithContext:(id)a3 flintDataProvider:(id)a4 iconIdentifier:(id)a5 completion:(id)a6;
- (void)setEditorialItemCreator:(id)a3;
- (void)setThumbnailCreator:(id)a3;
@end

@implementation FRArticleEditorialItemProvider

- (FRArticleEditorialItemProvider)initWithEditorialItemEntryManager:(id)a3 thumbnailCreator:(id)a4 editorialItemCreator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100076170();
    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000760AC();
  }
LABEL_6:
  if (!v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100075FE8();
  }
  v15.receiver = self;
  v15.super_class = (Class)FRArticleEditorialItemProvider;
  v12 = [(FRArticleEditorialItemProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_editorialItemEntryManager, a3);
    objc_storeStrong((id *)&v13->_thumbnailCreator, a4);
    objc_storeStrong((id *)&v13->_editorialItemCreator, a5);
  }

  return v13;
}

- (FRArticleEditorialItemProvider)init
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v2 = [objc_alloc((Class)NSString) initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRArticleEditorialItemProvider init]";
    __int16 v7 = 2080;
    v8 = "FRArticleEditorialItemProvider.m";
    __int16 v9 = 1024;
    int v10 = 35;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %s", @"Do not call method", "-[FRArticleEditorialItemProvider init]");
  id v4 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

- (void)createEditorialItemWithContext:(id)a3 articleModifiedDate:(id)a4 articleID:(id)a5 headline:(id)a6 flintDataProvider:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v58 = a7;
  id v63 = a8;
  v18 = [(FRArticleEditorialItemProvider *)self editorialItemEntryManager];
  v19 = [v18 editorialItemsByID];
  v20 = [v19 objectForKey:v16];

  id v57 = v14;
  v21 = [v14 documentController];
  v22 = [v21 metadata];

  v23 = [v22 documentVersion];
  v62 = v20;
  v55 = [v20 lastSeenDocumentVersion];
  unsigned int v24 = -[FRArticleEditorialItemProvider shouldShowBadgeForArticleID:currentDocumentVersion:lastSeenDocumentVersion:](self, "shouldShowBadgeForArticleID:currentDocumentVersion:lastSeenDocumentVersion:", v16, v23);
  v25 = [v22 feedNavigationAppearance];
  v26 = [v25 compactTitle];

  v27 = [v22 feedNavigationAppearance];
  v61 = [v27 subtitle];

  v28 = [v22 feedNavigationAppearance];
  v60 = [v28 subtitleColor];

  v59 = +[NSString stringWithFormat:@"https://apple.news/%@", v16];
  v29 = [v22 feedNavigationAppearance];
  v30 = [v29 iconImageIdentifier];

  v31 = FCDefaultLog;
  if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v97 = v26;
    __int16 v98 = 2112;
    v99 = v30;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Editorial Item Provider: compactitle=%@ iconIdentifier=%@", buf, 0x16u);
  }
  v56 = v23;
  if (v26)
  {
    v32 = +[NSMutableArray array];
    id v53 = v15;
    if (v24)
    {
      v33 = +[NSNumber numberWithInteger:0];
      [v32 addObject:v33];

      id v15 = v53;
    }
    id v54 = v17;
    if (v30)
    {
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_10003F4B8;
      v64[3] = &unk_1000C7A08;
      v52 = &v65;
      id v65 = v16;
      v51 = &v66;
      id v66 = v26;
      v50 = &v67;
      id v67 = v61;
      v49 = &v68;
      id v68 = v60;
      v48 = &v69;
      id v69 = v59;
      v47 = &v70;
      id v70 = v15;
      v46 = &v71;
      id v71 = v23;
      v34 = (id *)v72;
      id v35 = v62;
      char v76 = v24;
      v72[0] = v35;
      v72[1] = self;
      v36 = &v73;
      v73 = v32;
      v37 = &v74;
      id v74 = v17;
      v38 = &v75;
      id v75 = v63;
      id v39 = v32;
      v40 = self;
      v41 = v57;
      [(FRArticleEditorialItemProvider *)v40 downloadThumbnailIconWithContext:v57 flintDataProvider:v58 iconIdentifier:v30 completion:v64];
    }
    else
    {
      v77 = _NSConcreteStackBlock;
      uint64_t v78 = 3221225472;
      v79 = sub_10003F358;
      v80 = &unk_1000C79E0;
      v52 = &v81;
      id v81 = v16;
      v51 = &v82;
      id v82 = v26;
      v50 = &v83;
      id v83 = v61;
      v49 = &v84;
      id v84 = v60;
      v48 = &v85;
      id v85 = v59;
      v47 = &v86;
      id v86 = v15;
      v46 = &v87;
      id v87 = v23;
      v34 = (id *)v88;
      id v44 = v62;
      char v92 = v24;
      v88[0] = v44;
      v88[1] = self;
      v36 = &v89;
      v89 = v32;
      v37 = &v90;
      id v90 = v17;
      v38 = &v91;
      id v91 = v63;
      id v45 = v32;
      FCPerformBlockOnMainThread();
      v41 = v57;
    }

    id v15 = v53;
    id v17 = v54;
    v43 = v62;
    v42 = v63;
  }
  else
  {
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_10003F2CC;
    v93[3] = &unk_1000C79B8;
    v42 = v63;
    id v95 = v63;
    v93[4] = self;
    v43 = v62;
    id v94 = v62;
    sub_10003F2CC((uint64_t)v93);

    v32 = v95;
    v41 = v57;
  }
}

- (BOOL)shouldShowBadgeForArticleID:(id)a3 currentDocumentVersion:(id)a4 lastSeenDocumentVersion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = v9;
  if (!v8)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10003F830;
    v17[3] = &unk_1000C7A30;
    id v18 = v7;
    char v12 = sub_10003F830((uint64_t)v17);
    v13 = v18;
LABEL_9:

    goto LABEL_11;
  }
  if (!v9)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003F880;
    v15[3] = &unk_1000C7A30;
    id v16 = v7;
    char v12 = sub_10003F880((uint64_t)v15);
    v13 = v16;
    goto LABEL_9;
  }
  if ([v8 compare:v9 options:64] == (id)1)
  {
    __int16 v11 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v20 = v7;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      unsigned int v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Editorial Item Provider: New version of Editorial ArticleID: %{public}@ currentDocumentVersion: %{public}@ lastSeenDocumentVersion: %{public}@, showing badge", buf, 0x20u);
    }
    char v12 = 1;
  }
  else
  {
    char v12 = 0;
  }
LABEL_11:

  return v12;
}

- (void)downloadThumbnailIconWithContext:(id)a3 flintDataProvider:(id)a4 iconIdentifier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v15 = v9;
  id v16 = a5;
  id v17 = v10;
  id v18 = a6;
  id v11 = v18;
  id v12 = v10;
  id v13 = v16;
  id v14 = v9;
  FCPerformBlockOnMainThread();
}

- (FREditorialItemEntryManager)editorialItemEntryManager
{
  return self->_editorialItemEntryManager;
}

- (FREditorialItemThumbnailCreator)thumbnailCreator
{
  return self->_thumbnailCreator;
}

- (void)setThumbnailCreator:(id)a3
{
}

- (FREditorialItemCreator)editorialItemCreator
{
  return self->_editorialItemCreator;
}

- (void)setEditorialItemCreator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorialItemCreator, 0);
  objc_storeStrong((id *)&self->_thumbnailCreator, 0);

  objc_storeStrong((id *)&self->_editorialItemEntryManager, 0);
}

@end