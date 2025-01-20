@interface VisualLocalizationTraceRecorder
+ (NSURL)traceDirectory;
- (VisualLocalizationTraceRecorder)init;
- (void)_beginTraceIfNecessary;
- (void)_finishOnIsolationQueue;
- (void)_recordAttemptOnIsolationQueue:(id)a3;
- (void)finish;
- (void)recordAttempt:(id)a3;
- (void)start;
@end

@implementation VisualLocalizationTraceRecorder

+ (NSURL)traceDirectory
{
  if (qword_10160F538 != -1) {
    dispatch_once(&qword_10160F538, &stru_1012F4880);
  }
  v2 = (void *)qword_10160F540;

  return (NSURL *)v2;
}

- (VisualLocalizationTraceRecorder)init
{
  v7.receiver = self;
  v7.super_class = (Class)VisualLocalizationTraceRecorder;
  v2 = [(VisualLocalizationTraceRecorder *)&v7 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_began.lock._os_unfair_lock_opaque = 0;
    v2->_began.didRun = 0;
    v2->_finished.lock._os_unfair_lock_opaque = 0;
    v2->_finished.didRun = 0;
    v5 = v2;
  }

  return v2;
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006A54AC;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)finish
{
}

- (void)_beginTraceIfNecessary
{
}

- (void)recordAttempt:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1006A5B5C;
  v7[3] = &unk_1012E5D58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_recordAttemptOnIsolationQueue:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(VisualLocalizationTraceRecorder *)self _beginTraceIfNecessary];
  if (self->_baseDirectory)
  {
    v5 = +[NSUUID UUID];
    id v6 = [v5 UUIDString];

    objc_super v7 = [v4 pngData];
    if (v7)
    {
      uint64_t v8 = [(NSURL *)self->_imagesDirectory URLByAppendingPathComponent:v6];
      v9 = [(id)v8 URLByAppendingPathExtension:@"png"];

      id v39 = 0;
      LOBYTE(v8) = [v7 writeToURL:v9 options:0 error:&v39];
      v10 = v39;
      if ((v8 & 1) == 0)
      {
        v11 = sub_1006A5A70();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to write image: %{public}@", buf, 0xCu);
        }
      }
    }
    v12 = [v4 inputParameters];
    id v13 = [v12 mutableCopy];

    v14 = NSCollectionLayoutEdgeSpacing_ptr;
    if (v13)
    {
      [v13 setObject:v6 forKeyedSubscript:@"uuid"];
      id v38 = 0;
      v15 = +[NSJSONSerialization dataWithJSONObject:v13 options:0 error:&v38];
      v16 = v38;
      if (v15)
      {
        uint64_t v17 = [(NSURL *)self->_parametersDirectory URLByAppendingPathComponent:v6];
        v18 = [(id)v17 URLByAppendingPathExtension:@"json"];

        id v37 = 0;
        LOBYTE(v17) = [v15 writeToURL:v18 options:0 error:&v37];
        v19 = v37;
        if ((v17 & 1) == 0)
        {
          v20 = v7;
          v21 = sub_1006A5A70();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v41 = v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to write input parameters: %{public}@", buf, 0xCu);
          }

          objc_super v7 = v20;
        }

        v14 = NSCollectionLayoutEdgeSpacing_ptr;
      }
      else
      {
        v19 = sub_1006A5A70();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v16;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to JSON-encode input parameters: %{public}@", buf, 0xCu);
        }
      }
    }
    v22 = [v4 results];
    id v23 = [v22 mutableCopy];

    if (v23)
    {
      [v23 setObject:v6 forKeyedSubscript:@"uuid"];
      v24 = v14[30];
      id v36 = 0;
      v25 = [v24 dataWithJSONObject:v23 options:0 error:&v36];
      v26 = v36;
      if (v25)
      {
        v34 = v7;
        uint64_t v27 = [(NSURL *)self->_resultsDirectory URLByAppendingPathComponent:v6];
        v28 = [(id)v27 URLByAppendingPathExtension:@"json"];

        id v35 = 0;
        LOBYTE(v27) = [v25 writeToURL:v28 options:0 error:&v35];
        v29 = v35;
        if ((v27 & 1) == 0)
        {
          v30 = sub_1006A5A70();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v41 = v29;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to write results: %{public}@", buf, 0xCu);
          }
        }
        objc_super v7 = v34;
      }
      else
      {
        v29 = sub_1006A5A70();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v26;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to JSON-encode results: %{public}@", buf, 0xCu);
        }
      }
    }
    v31 = [v4 crowdsourcingDetails];

    if (v31)
    {
      v32 = [v4 crowdsourcingDetails];
      lastCrowdsourcingDetails = self->_lastCrowdsourcingDetails;
      self->_lastCrowdsourcingDetails = v32;
    }
  }
}

- (void)_finishOnIsolationQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((GEOVisualLocalizationCrowdsourcingIsSupported() & 1) == 0)
  {
    uint64_t v3 = sub_1006A5A70();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v11 = "Not capturing VL Crowdsourcing details because the feature is disabled";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    goto LABEL_22;
  }
  if ((GEOVisualLocalizationCrowdsourcingIsAllowed() & 1) == 0)
  {
    uint64_t v3 = sub_1006A5A70();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v11 = "Not capturing VL Crowdsourcing details because the feature is not supported for the current device posture";
    goto LABEL_21;
  }
  if ((GEOVisualLocalizationCrowdsourcingIsEnabled() & 1) == 0)
  {
    uint64_t v3 = sub_1006A5A70();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v11 = "Not capturing VL Crowdsourcing details because the user has not given permission";
    goto LABEL_21;
  }
  lastCrowdsourcingDetails = self->_lastCrowdsourcingDetails;
  uint64_t v3 = sub_1006A5A70();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (!lastCrowdsourcingDetails)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      v11 = "Not capturing VL Crowdsourcing details because we did not receive any";
      goto LABEL_21;
    }
LABEL_22:

    goto LABEL_23;
  }
  if (v4)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Capturing VL Crowdsourcing details", buf, 2u);
  }

  uint64_t v5 = +[GEOVLFCrowdsourcingDetails _vl_createWithVLCrowdsourcingDetails:self->_lastCrowdsourcingDetails];
  if (v5)
  {
    uint64_t v3 = v5;
    id v6 = [(NSURL *)self->_baseDirectory URLByAppendingPathComponent:@"crowdsourcing_details.bin" isDirectory:0];
    objc_super v7 = [v3 data];
    id v57 = 0;
    unsigned __int8 v8 = [v7 writeToURL:v6 options:0 error:&v57];
    id v9 = v57;

    if ((v8 & 1) == 0)
    {
      v10 = sub_1006A5A70();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v60 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to write crowdsourcing details: %{public}@", buf, 0xCu);
      }
    }
    goto LABEL_22;
  }
LABEL_23:
  v12 = +[NSFileManager defaultManager];
  id v13 = +[VisualLocalizationTraceRecorder traceDirectory];
  v14 = [v13 path];
  unsigned __int8 v15 = [v12 fileExistsAtPath:v14];

  if (v15)
  {
LABEL_26:
    v20 = +[VisualLocalizationTraceRecorder traceDirectory];
    v21 = [(NSURL *)self->_baseDirectory lastPathComponent];
    v22 = +[NSString stringWithFormat:@"VisualLocalization.%@", v21];
    id v23 = [v20 URLByAppendingPathComponent:v22];
    v24 = [v23 URLByAppendingPathExtension:@"tar.gz"];

    v25 = sub_1006A5A70();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v60 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Writing trace archive to %{public}@", buf, 0xCu);
    }

    archive_write_new();
    archive_write_set_format_v7tar();
    archive_write_add_filter_gzip();
    v47 = v24;
    id v26 = [v24 path];
    [v26 UTF8String];
    archive_write_open_filename();

    uint64_t v27 = +[NSFileManager defaultManager];
    v28 = [(NSURL *)self->_baseDirectory path];
    v29 = [v27 subpathsAtPath:v28];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v30 = v29;
    id v31 = [v30 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v53;
      obj = v30;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v53 != v33) {
            objc_enumerationMutation(obj);
          }
          id v35 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          id v37 = [(NSURL *)self->_baseDirectory URLByAppendingPathComponent:v35];
          unsigned __int8 v51 = 0;
          id v38 = +[NSFileManager defaultManager];
          id v39 = [v37 path];
          unsigned int v40 = [v38 fileExistsAtPath:v39 isDirectory:&v51];
          int v41 = v51;

          if (v40) {
            BOOL v42 = v41 == 0;
          }
          else {
            BOOL v42 = 0;
          }
          if (v42)
          {
            id v50 = 0;
            v43 = +[NSData dataWithContentsOfURL:v37 options:0 error:&v50];
            id v44 = v50;
            if (v43)
            {
              archive_entry_new();
              [v35 UTF8String];
              archive_entry_set_pathname();
              [v43 length];
              archive_entry_set_size();
              archive_entry_set_filetype();
              archive_entry_set_perm();
              archive_write_header();
              archive_entry_free();
              id v45 = v43;
              [v45 bytes];
              [v45 length];
              archive_write_data();
            }
            else
            {
              v46 = sub_1006A5A70();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v60 = v44;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "Failed to read data during archiving: %{public}@", buf, 0xCu);
              }
            }
          }
        }
        v30 = obj;
        id v32 = [obj countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v32);
    }

    archive_write_close();
    archive_write_free();
    id v19 = v47;
    goto LABEL_47;
  }
  v16 = +[NSFileManager defaultManager];
  uint64_t v17 = +[VisualLocalizationTraceRecorder traceDirectory];
  id v56 = 0;
  unsigned __int8 v18 = [v16 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:&v56];
  id v19 = v56;

  if (v18)
  {

    goto LABEL_26;
  }
  v30 = sub_1006A5A70();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v60 = v19;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to create trace directory: %{public}@", buf, 0xCu);
  }
LABEL_47:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCrowdsourcingDetails, 0);
  objc_storeStrong((id *)&self->_resultsDirectory, 0);
  objc_storeStrong((id *)&self->_parametersDirectory, 0);
  objc_storeStrong((id *)&self->_imagesDirectory, 0);
  objc_storeStrong((id *)&self->_baseDirectory, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end