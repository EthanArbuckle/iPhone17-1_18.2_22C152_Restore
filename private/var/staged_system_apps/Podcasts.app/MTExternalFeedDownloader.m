@interface MTExternalFeedDownloader
- (BOOL)createPrivateTempDirIfNeeded;
- (BOOL)isFileExpired:(id)a3 inDirectory:(id)a4;
- (BOOL)sessionTaskStateReloaded;
- (MTExternalFeedDownloader)initWithDelegate:(id)a3;
- (MTExternalFeedDownloaderDelegate)delegate;
- (OS_dispatch_queue)workQueue;
- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration;
- (id)backgroundSessionConfigurationIdentifier;
- (id)privatePathForDownload;
- (id)temporaryDirectory;
- (void)_enqueueTempFilesDeletion;
- (void)_removeTempFiles;
- (void)configureSession:(id)a3;
- (void)restoreBackgroundDownloadTasksWithCompletion:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSessionTaskStateReloaded:(BOOL)a3;
- (void)setWorkQueue:(id)a3;
- (void)startDownloadTaskForFeedURL:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5;
- (void)task:(id)a3 didCompleteWithDownloadedContentUrl:(id)a4;
- (void)task:(id)a3 didFailWithError:(id)a4 orStatusCode:(int64_t)a5;
@end

@implementation MTExternalFeedDownloader

- (id)temporaryDirectory
{
  v3 = NSTemporaryDirectory();
  v4 = [(MTExternalFeedDownloader *)self configuration];
  unsigned int v5 = [v4 keepsFeedFileInTempDirAfterDownload];

  if (v5)
  {
    uint64_t v6 = [v3 stringByAppendingPathComponent:@"FeedUpdateDownloads"];

    v3 = (void *)v6;
  }

  return v3;
}

- (void)_removeTempFiles
{
  v3 = dispatch_get_global_queue(-32768, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018E14;
  block[3] = &unk_10054D570;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  objc_storeWeak((id *)&self->_delegate, obj);
}

- (void)configureSession:(id)a3
{
  id v4 = a3;
  [v4 setTimeoutIntervalForRequest:60.0];
  id v5 = [(MTExternalFeedDownloader *)self configuration];
  [v5 timeoutIntervalForResource];
  [v4 setTimeoutIntervalForResource];
}

- (MTExternalFeedDownloader)initWithDelegate:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MTExternalFeedDownloader;
  id v5 = [(MTExternalFeedDownloader *)&v17 init];
  if (v5)
  {
    uint64_t v6 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MTExternalFeedDownloader allocated: %@", buf, 0xCu);
    }

    v7 = +[FeedManagerLocalConfiguration platformSpecificConfiguration];
    [(MTExternalFeedDownloader *)v5 setConfiguration:v7];

    if (v4) {
      [(MTExternalFeedDownloader *)v5 setDelegate:v4];
    }
    [(MTExternalFeedDownloader *)v5 _enqueueTempFilesDeletion];
    v8 = [(MTExternalFeedDownloader *)v5 configuration];
    unsigned int v9 = [v8 workQueueConcurrent];
    v10 = &_dispatch_queue_attr_concurrent;
    if (!v9) {
      v10 = 0;
    }
    v11 = v10;

    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    id v14 = +[NSString stringWithFormat:@"%@-worker", v13];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], v11);

    [(MTExternalFeedDownloader *)v5 setWorkQueue:v15];
  }

  return v5;
}

- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration
{
  return self->_configuration;
}

- (void)setWorkQueue:(id)a3
{
}

- (void)setConfiguration:(id)a3
{
}

- (void)_enqueueTempFilesDeletion
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100059058;
  block[3] = &unk_10054D570;
  block[4] = self;
  if (qword_10060A828 != -1) {
    dispatch_once(&qword_10060A828, block);
  }
}

- (void)restoreBackgroundDownloadTasksWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  unsigned __int8 v6 = [(MTExternalFeedDownloader *)v5 sessionTaskStateReloaded];
  [(MTExternalFeedDownloader *)v5 setSessionTaskStateReloaded:1];
  objc_sync_exit(v5);

  if ((v6 & 1) == 0)
  {
    [(MTExternalFeedDownloader *)v5 loadSessionsIfNeeded];
    v7 = [(MTExternalFeedDownloader *)v5 sessionForBackgroundDownloads];

    if (v7)
    {
      v8 = [(MTExternalFeedDownloader *)v5 workQueue];
      dispatch_suspend(v8);

      unsigned int v9 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [(MTExternalFeedDownloader *)v5 workQueue];
        *(_DWORD *)buf = 138412290;
        dispatch_queue_t v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Rebuild pending network tasks - SUSPENDING workQueue: %@.", buf, 0xCu);
      }
      v11 = [(MTExternalFeedDownloader *)v5 sessionForBackgroundDownloads];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10003F86C;
      v13[3] = &unk_100550320;
      v13[4] = v5;
      [v11 getAllTasksWithCompletionHandler:v13];
    }
  }
  v12 = [(MTExternalFeedDownloader *)v5 workQueue];
  dispatch_async(v12, v4);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (id)backgroundSessionConfigurationIdentifier
{
  v3 = [(MTExternalFeedDownloader *)self delegate];

  if (v3)
  {
    id v4 = [(MTExternalFeedDownloader *)self delegate];
    id v5 = (objc_class *)objc_opt_class();
    unsigned __int8 v6 = NSStringFromClass(v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MTExternalFeedDownloader;
    unsigned __int8 v6 = [(MTExternalFeedDownloader *)&v8 backgroundSessionConfigurationIdentifier];
  }

  return v6;
}

- (MTExternalFeedDownloaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTExternalFeedDownloaderDelegate *)WeakRetained;
}

- (void)setSessionTaskStateReloaded:(BOOL)a3
{
  self->_sessionTaskStateReloaded = a3;
}

- (BOOL)sessionTaskStateReloaded
{
  return self->_sessionTaskStateReloaded;
}

- (void)startDownloadTaskForFeedURL:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  unsigned int v9 = [(MTExternalFeedDownloader *)self delegate];

  if (v9)
  {
    v10 = [(MTExternalFeedDownloader *)self configuration];
    if ([v10 keepsFeedFileInTempDirAfterDownload])
    {
      unsigned __int8 v11 = [(MTExternalFeedDownloader *)self createPrivateTempDirIfNeeded];

      if ((v11 & 1) == 0) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    v12 = [(MTExternalFeedDownloader *)self privatePathForDownload];
    v14.receiver = self;
    v14.super_class = (Class)MTExternalFeedDownloader;
    [(MTExternalFeedDownloader *)&v14 startDownloadTaskForURL:v8 userInitiated:v6 useBackgroundFetch:v5 usePrivatePath:v12 downloadStartedBlock:0];
  }
  else
  {
    v12 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v8 urlRawString];
      *(_DWORD *)buf = 138412290;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ - Could not start download task for external feedUrl - external feed downloader has no delegate.", buf, 0xCu);
    }
  }

LABEL_10:
}

- (void)task:(id)a3 didCompleteWithDownloadedContentUrl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(id)objc_opt_class() statusCodeForTask:v6];
  BOOL v10 = v8 == (id)200 || v8 == (id)206;
  if (v7 && v10)
  {
    v48 = [(id)objc_opt_class() originalURLForTask:v6];
    unsigned int v47 = [v6 useBackgroundFetch];
    unsigned __int8 v11 = [(MTExternalFeedDownloader *)self configuration];
    unsigned int v12 = [v11 keepsFeedFileInTempDirAfterDownload];

    if (v12)
    {
      id v13 = v7;
    }
    else
    {
      objc_super v14 = +[NSProcessInfo processInfo];
      dispatch_queue_t v15 = [v14 globallyUniqueString];
      v16 = +[NSString stringWithFormat:@"%@%@", v15, @"_feed"];

      objc_super v17 = NSTemporaryDirectory();
      v18 = +[NSURL fileURLWithPath:v17];
      id v13 = [v18 URLByAppendingPathComponent:v16];

      v19 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = [v7 absoluteString];
        v21 = [v13 absoluteString];
        *(_DWORD *)buf = 138543618;
        v60 = v20;
        __int16 v61 = 2114;
        v62 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Moving downloaded feed from %{public}@ to %{public}@", buf, 0x16u);
      }
      v22 = +[NSFileManager defaultManager];
      id v52 = 0;
      unsigned int v23 = [v22 moveItemAtURL:v7 toURL:v13 error:&v52];
      id v24 = v52;

      if (!v23)
      {
        v57[0] = NSLocalizedDescriptionKey;
        v57[1] = NSUnderlyingErrorKey;
        v58[0] = @"Failed to move downloaded file to tmp folder";
        v58[1] = v24;
        v41 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
        v42 = +[NSError errorWithDomain:@"com.apple.podcasts.externalfeeddownloader" code:-1 userInfo:v41];

        v43 = [(MTExternalFeedDownloader *)self delegate];
        [v43 didDownloadFeedWithError:v42 data:0 task:v6 requestedUrl:v48 useBackgroundFetch:v47];

LABEL_34:
        goto LABEL_35;
      }
      v25 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [v48 absoluteString];
        *(_DWORD *)buf = 138412290;
        v60 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Downloaded feed: %@", buf, 0xCu);
      }
    }
    id v27 = objc_initWeak(&location, self);
    v28 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [v48 absoluteString];
      *(_DWORD *)buf = 138412290;
      v60 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Started processing feed: %@", buf, 0xCu);
    }
    v30 = [v13 path];
    id v50 = 0;
    v31 = +[NSData dataWithContentsOfFile:v30 options:9 error:&v50];
    v32 = (__CFString *)v50;

    if (v31)
    {
      v33 = +[NSFileManager defaultManager];
      id v49 = 0;
      unsigned __int8 v34 = [v33 removeItemAtURL:v13 error:&v49];
      id v35 = v49;

      if (v34)
      {
        v36 = _MTLogCategoryFeedUpdate();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v37 = [v13 path];
          *(_DWORD *)buf = 138412290;
          v60 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "Temporary feed file has been removed:%@", buf, 0xCu);
        }
        v38 = 0;
      }
      else
      {
        v53[0] = NSLocalizedDescriptionKey;
        v53[1] = NSUnderlyingErrorKey;
        v54[0] = @"Failed to remove temporary feed file";
        v54[1] = v35;
        v36 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
        v38 = +[NSError errorWithDomain:@"com.apple.podcasts.externalfeeddownloader" code:-1 userInfo:v36];
      }

      v44 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = [v48 absoluteString];
        *(_DWORD *)buf = 138412290;
        v60 = v45;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Finished processing feed: %@", buf, 0xCu);
      }
      v46 = [(MTExternalFeedDownloader *)self delegate];
      [v46 didDownloadFeedWithError:v38 data:v31 task:v6 requestedUrl:v48 useBackgroundFetch:v47];
    }
    else
    {
      v55[0] = NSLocalizedDescriptionKey;
      v55[1] = NSUnderlyingErrorKey;
      CFStringRef v39 = @"[no error]";
      if (v32) {
        CFStringRef v39 = v32;
      }
      v56[0] = @"Failed to read feed data from file";
      v56[1] = v39;
      v40 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
      v38 = +[NSError errorWithDomain:@"com.apple.podcasts.externalfeeddownloader" code:-1 userInfo:v40];

      id v35 = [(MTExternalFeedDownloader *)self delegate];
      [v35 didDownloadFeedWithError:v38 data:0 task:v6 requestedUrl:v48 useBackgroundFetch:v47];
    }

    objc_destroyWeak(&location);
    goto LABEL_34;
  }
  [(MTExternalFeedDownloader *)self task:v6 didFailWithError:0 orStatusCode:v8];
LABEL_35:
}

- (void)task:(id)a3 didFailWithError:(id)a4 orStatusCode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(id)objc_opt_class() originalURLForTask:v8];
  unsigned __int8 v11 = _MTLogCategoryFeedUpdate();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2048;
    int64_t v43 = a5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "didFailWithError: %@, error: %@, status: %ld", buf, 0x20u);
  }

  id v12 = [v9 code];
  id v13 = +[MTDB sharedInstance];
  objc_super v14 = [v13 importContext];

  if (a5 == 401 || v12 == (id)-1013 || v12 == (id)-1012)
  {
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000EFFC8;
    v37[3] = &unk_10054D9B0;
    id v38 = v14;
    id v39 = v10;
    [v38 performBlock:v37];

    id v16 = v38;
LABEL_14:

    goto LABEL_15;
  }
  if (v9 || a5 >= 1)
  {
    dispatch_queue_t v15 = [v8 currentRequest];
    id v16 = [v15 URL];

    if (a5 >= 400)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000F0050;
      v33[3] = &unk_10054D8F0;
      id v34 = v14;
      id v35 = v10;
      int64_t v36 = a5;
      [v34 performBlock:v33];
    }
    objc_super v17 = [v16 absoluteString];
    unsigned int v22 = +[MTPodcast isRedirectURL:v17];

    if (v22)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      int64_t v43 = (int64_t)sub_10005702C;
      v44 = sub_1000572E0;
      id v45 = 0;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000F016C;
      v29[3] = &unk_10054DA00;
      id v30 = v14;
      id v31 = v10;
      v32 = buf;
      [v30 performBlockAndWait:v29];
      v18 = +[MTFeedUpdateManager sharedInstance];
      objc_msgSend(v18, "_updatePodcastWithUUID:userInitiated:useBackgroundFetch:source:tryRedirectURL:", *(void *)(*(void *)&buf[8] + 40), objc_msgSend(v8, "isInteractive"), objc_msgSend(v8, "useBackgroundFetch"), 15, 0);

      _Block_object_dispose(buf, 8);
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000F01F8;
    v23[3] = &unk_1005513C8;
    id v24 = v14;
    id v25 = v10;
    int64_t v27 = a5;
    id v26 = v9;
    char v28 = v22;
    [v24 performBlock:v23];

    goto LABEL_14;
  }
LABEL_15:

  v40[0] = NSLocalizedDescriptionKey;
  v40[1] = NSUnderlyingErrorKey;
  v41[0] = @"Feed download failed";
  v41[1] = @"[no error]";
  v19 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
  v20 = +[NSError errorWithDomain:@"com.apple.podcasts.externalfeeddownloader" code:-1 userInfo:v19];

  v21 = [(MTExternalFeedDownloader *)self delegate];
  [v21 didDownloadFeedWithError:v20 data:0 task:v8 requestedUrl:v10 useBackgroundFetch:[v8 useBackgroundFetch]];
}

- (id)privatePathForDownload
{
  v3 = [(MTExternalFeedDownloader *)self configuration];
  unsigned int v4 = [v3 keepsFeedFileInTempDirAfterDownload];

  if (v4)
  {
    BOOL v5 = +[NSProcessInfo processInfo];
    id v6 = [v5 globallyUniqueString];
    id v7 = +[NSString stringWithFormat:@"%@%@", v6, @"_feed"];

    id v8 = [(MTExternalFeedDownloader *)self temporaryDirectory];
    id v9 = +[NSURL fileURLWithPath:v8];
    BOOL v10 = [v9 URLByAppendingPathComponent:v7];

    id v11 = v10;
    id v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", [v11 fileSystemRepresentation], 4);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)createPrivateTempDirIfNeeded
{
  v2 = [(MTExternalFeedDownloader *)self temporaryDirectory];
  v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    id v6 = +[NSFileManager defaultManager];
    id v10 = 0;
    unsigned __int8 v5 = [v6 createDirectoryAtPath:v2 withIntermediateDirectories:0 attributes:0 error:&v10];
    id v7 = v10;

    if ((v5 & 1) == 0)
    {
      id v8 = _MTLogCategoryFeedUpdate();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to create feed-update response download directory. Error=%@ ", buf, 0xCu);
      }
    }
  }

  return v5;
}

- (BOOL)isFileExpired:(id)a3 inDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSFileManager defaultManager];
  id v8 = [v6 stringByAppendingPathComponent:v5];

  id v20 = 0;
  id v9 = [v7 attributesOfItemAtPath:v8 error:&v20];
  id v10 = v20;

  if (v9)
  {
    id v11 = [v9 objectForKey:NSFileModificationDate];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = [v9 objectForKey:NSFileCreationDate];
    }
    dispatch_queue_t v15 = v13;
    [v13 timeIntervalSinceReferenceDate];
    double v17 = v16;
    +[NSDate timeIntervalSinceReferenceDate];
    BOOL v14 = v17 + 10800.0 <= v18;
  }
  else
  {
    id v12 = _MTLogCategoryFeedUpdate();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v5;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to obtain attributes for file:%@, error:%@", buf, 0x16u);
    }
    BOOL v14 = 1;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end