@interface FRArticleNotificationServiceArticleSource
- (FRArticleNotificationServiceArticleSource)init;
- (void)_cleanupFilesInDirectory:(id)a3;
- (void)_downloadFileURL:(id)a3 toDirectory:(id)a4 withCompletion:(id)a5;
- (void)fetchAssetsWithCachesDirectory:(id)a3 thumbnailURLString:(id)a4 publisherLogoURLString:(id)a5 publisherLogoMaskURLString:(id)a6 publisherLogoCompactURLString:(id)a7 flintDocumentURLString:(id)a8 completion:(id)a9;
@end

@implementation FRArticleNotificationServiceArticleSource

- (FRArticleNotificationServiceArticleSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)FRArticleNotificationServiceArticleSource;
  return [(FRArticleNotificationServiceArticleSource *)&v3 init];
}

- (void)fetchAssetsWithCachesDirectory:(id)a3 thumbnailURLString:(id)a4 publisherLogoURLString:(id)a5 publisherLogoMaskURLString:(id)a6 publisherLogoCompactURLString:(id)a7 flintDocumentURLString:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v38 = a5;
  id v34 = a6;
  v17 = (uint64_t (*)(uint64_t, uint64_t))a7;
  id v36 = a8;
  id v18 = a9;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v38;
    *(_WORD *)&buf[22] = 2112;
    v75 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Source URLs to download - %@, %@, %@", buf, 0x20u);
  }
  v35 = v17;
  v37 = v16;
  if (v15)
  {
    v19 = v38;
    if (v18)
    {
LABEL_13:
      v20 = dispatch_group_create();
      dispatch_group_enter(v20);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v75 = sub_100007D2C;
      v76 = sub_100007D3C;
      id v77 = 0;
      v72[0] = 0;
      v72[1] = v72;
      v72[2] = 0x3032000000;
      v72[3] = sub_100007D2C;
      v72[4] = sub_100007D3C;
      id v73 = 0;
      if (v37)
      {
        uint64_t v21 = +[NSURL URLWithString:](NSURL, "URLWithString:");
      }
      else
      {
        uint64_t v21 = 0;
      }
      dispatch_group_enter(v20);
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_100007D44;
      v68[3] = &unk_100028E30;
      v70 = v72;
      v71 = buf;
      v22 = v20;
      v69 = v22;
      v33 = (void *)v21;
      [(FRArticleNotificationServiceArticleSource *)self _downloadFileURL:v21 toDirectory:v15 withCompletion:v68];
      v66[0] = 0;
      v66[1] = v66;
      v66[2] = 0x3032000000;
      v66[3] = sub_100007D2C;
      v66[4] = sub_100007D3C;
      id v67 = 0;
      v64[0] = 0;
      v64[1] = v64;
      v64[2] = 0x3032000000;
      v64[3] = sub_100007D2C;
      v64[4] = sub_100007D3C;
      id v65 = 0;
      v23 = +[UIScreen mainScreen];
      v24 = [v23 traitCollection];
      id v25 = [v24 userInterfaceStyle];

      if (v25 == (id)2)
      {
        if (v34)
        {
          v26 = +[NSURL URLWithString:](NSURL, "URLWithString:");
        }
        else
        {
          v26 = 0;
        }
        dispatch_group_enter(v22);
        v27 = v63;
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_100007E50;
        v63[3] = &unk_100028E30;
        v63[5] = v64;
        v63[6] = buf;
        v63[4] = v22;
        [(FRArticleNotificationServiceArticleSource *)self _downloadFileURL:v26 toDirectory:v15 withCompletion:v63];
      }
      else
      {
        if (v38)
        {
          v26 = +[NSURL URLWithString:v38];
        }
        else
        {
          v26 = 0;
        }
        dispatch_group_enter(v22);
        v27 = v62;
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_100007F5C;
        v62[3] = &unk_100028E30;
        v62[5] = v66;
        v62[6] = buf;
        v62[4] = v22;
        [(FRArticleNotificationServiceArticleSource *)self _downloadFileURL:v26 toDirectory:v15 withCompletion:v62];
      }

      v60[0] = 0;
      v60[1] = v60;
      v60[2] = 0x3032000000;
      v60[3] = sub_100007D2C;
      v60[4] = sub_100007D3C;
      id v61 = 0;
      if (v35)
      {
        v28 = +[NSURL URLWithString:](NSURL, "URLWithString:");
      }
      else
      {
        v28 = 0;
      }
      dispatch_group_enter(v22);
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100008068;
      v56[3] = &unk_100028E30;
      v58 = v60;
      v59 = buf;
      v29 = v22;
      v57 = v29;
      [(FRArticleNotificationServiceArticleSource *)self _downloadFileURL:v28 toDirectory:v15 withCompletion:v56];
      v54[0] = 0;
      v54[1] = v54;
      v54[2] = 0x3032000000;
      v54[3] = sub_100007D2C;
      v54[4] = sub_100007D3C;
      id v55 = 0;
      if (v36)
      {
        v30 = +[NSURL URLWithString:](NSURL, "URLWithString:");
      }
      else
      {
        v30 = 0;
      }
      dispatch_group_enter(v29);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100008174;
      v50[3] = &unk_100028E30;
      v52 = v54;
      v53 = buf;
      v31 = v29;
      v51 = v31;
      [(FRArticleNotificationServiceArticleSource *)self _downloadFileURL:v30 toDirectory:v15 withCompletion:v50];
      dispatch_group_enter(v31);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100008280;
      block[3] = &unk_100028E58;
      block[4] = self;
      id v48 = v15;
      v49 = v31;
      v32 = v31;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000082C0;
      v39[3] = &unk_100028E80;
      v41 = v72;
      v42 = v66;
      v43 = v64;
      v44 = v60;
      v45 = v54;
      v46 = buf;
      id v40 = v18;
      dispatch_group_notify(v32, (dispatch_queue_t)&_dispatch_main_q, v39);

      dispatch_group_leave(v32);
      v19 = v38;

      _Block_object_dispose(v54, 8);
      _Block_object_dispose(v60, 8);

      _Block_object_dispose(v64, 8);
      _Block_object_dispose(v66, 8);

      _Block_object_dispose(v72, 8);
      _Block_object_dispose(buf, 8);

      goto LABEL_32;
    }
  }
  else
  {
    v19 = v38;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001EF4C();
    }
    if (v18)
    {
      (*((void (**)(id, void, void, void, void, void, void))v18 + 2))(v18, 0, 0, 0, 0, 0, 0);
      goto LABEL_32;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001EE68();
  }
  if (v15) {
    goto LABEL_13;
  }
LABEL_32:
}

- (void)_cleanupFilesInDirectory:(id)a3
{
  objc_super v3 = [a3 path];
  v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    v33 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
    v6 = +[NSFileManager defaultManager];
    v32 = v3;
    v7 = [v6 enumeratorAtPath:v3];

    v8 = +[NSMutableArray array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obj = v7;
    id v9 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v41;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          v14 = [obj fileAttributes];
          id v15 = [v14 objectForKey:NSFileCreationDate];
          id v16 = [v33 earlierDate:v15];

          if (v16 == v15)
          {
            v17 = [v32 stringByAppendingPathComponent:v13];
            [v8 addObject:v17];
            id v18 = [v8 count];

            if ((unint64_t)v18 > 9)
            {

              goto LABEL_13;
            }
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v19 = [v8 count];
      *(_DWORD *)buf = 134217984;
      id v45 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Trying to remove %lu files…", buf, 0xCu);
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v20 = v8;
    id v21 = [v20 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v21)
    {
      id v23 = v21;
      v24 = 0;
      uint64_t v25 = *(void *)v37;
      *(void *)&long long v22 = 138412546;
      long long v31 = v22;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v20);
          }
          v27 = *(void **)(*((void *)&v36 + 1) + 8 * (void)j);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v45 = v27;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Trying to remove %@…", buf, 0xCu);
          }
          v28 = +[NSFileManager defaultManager];
          id v35 = 0;
          unsigned int v29 = [v28 removeItemAtPath:v27 error:&v35];
          id v30 = v35;

          if (v29)
          {
            ++v24;
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            id v45 = v27;
            __int16 v46 = 2112;
            id v47 = v30;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't remove file at path %@ - %@", buf, 0x16u);
          }
        }
        id v23 = [v20 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v23);
    }
    else
    {
      v24 = 0;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      id v45 = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Removed %lu files", buf, 0xCu);
    }

    objc_super v3 = v32;
  }
}

- (void)_downloadFileURL:(id)a3 toDirectory:(id)a4 withCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v7)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100008A58;
    v16[3] = &unk_100028ED0;
    id v11 = v7;
    id v17 = v11;
    id v12 = v8;
    id v18 = v12;
    id v19 = v10;
    uint64_t v13 = objc_retainBlock(v16);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Starting download of %@ to %@", buf, 0x16u);
    }
    v14 = +[NSURLSession sharedSession];
    id v15 = [v14 downloadTaskWithURL:v11 completionHandler:v13];
    [v15 resume];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

@end