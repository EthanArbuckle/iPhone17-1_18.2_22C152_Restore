@interface ThumbnailProvider
- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation ThumbnailProvider

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v40 = a4;
  v6 = BooksThumbsLog();
  v7 = [v5 fileURL];
  [v5 maximumSize];
  if (v8 < 8.0) {
    double v8 = 8.0;
  }
  double v10 = fmin(v8, 1024.0);
  if (v9 >= 8.0) {
    double v11 = v9;
  }
  else {
    double v11 = 8.0;
  }
  double v12 = fmin(v11, 1024.0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v7;
    __int16 v47 = 2048;
    double v48 = v10;
    __int16 v49 = 2048;
    double v50 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "provideThumbnailForFileRequest for URL: %{public}@ size: %f,%f", buf, 0x20u);
  }
  if (+[BUZipFileArchive isZipArchiveAtURL:v7 error:0])
  {
    v13 = +[IMLibraryPlist purchasesRepositoryPath];
    v14 = v6;
    id v15 = v13;
    v16 = +[NSFileManager defaultManager];
    *(void *)buf = 0;
    unsigned __int8 v17 = [v16 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:buf];
    id v18 = *(id *)buf;

    if ((v17 & 1) == 0 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100003280();
    }

    v19 = +[NSFileManager defaultManager];
    v20 = [v7 lastPathComponent];
    v21 = [v19 bu_nonCollidingNameForFileName:v20 inDestPath:v15];

    v22 = [v15 stringByAppendingPathComponent:v21];
    v23 = +[NSURL fileURLWithPath:v22];

    id v45 = 0;
    unsigned int v24 = +[BUZipFileArchive extractArchiveFromURL:v7 toURL:v23 options:0 error:&v45];
    id v25 = v45;
    if (v24)
    {
      v26 = sub_100002D5C(v14, v23);
      v27 = +[NSFileManager defaultManager];
      [v27 removeItemAtURL:v23 error:0];
    }
    else
    {
      v26 = 0;
    }
  }
  else
  {
    v26 = sub_100002D5C(v6, v7);
    id v25 = 0;
  }
  if (v26)
  {
    id v28 = [objc_alloc((Class)UIImage) initWithData:v26];
    v29 = v28;
    if (v28)
    {
      [v28 size];
      double v32 = v30;
      double v33 = v31;
      if (v30 <= v10 && v31 <= v12) {
        goto LABEL_39;
      }
      if (v10 == 0.0 || v30 == 0.0 || v31 == 0.0 || v12 == 0.0)
      {
        v37 = BooksThumbsLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          sub_10000323C(v37);
        }
      }
      else
      {
        if (v30 / v31 > v10 / v12)
        {
          double v33 = v31 * (v10 / v30);
          double v32 = v10;
LABEL_39:
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_10000316C;
          v41[3] = &unk_1000041D8;
          id v35 = v29;
          id v42 = v35;
          double v43 = v32;
          double v44 = v33;
          v36 = +[QLThumbnailReply replyWithContextSize:currentContextDrawingBlock:](QLThumbnailReply, "replyWithContextSize:currentContextDrawingBlock:", v41, v32, v33);

          goto LABEL_40;
        }
        if (v30 / v31 < v10 / v12)
        {
          double v32 = v30 * (v12 / v31);
LABEL_38:
          double v33 = v12;
          goto LABEL_39;
        }
      }
      double v32 = v10;
      goto LABEL_38;
    }
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1000031D4();
  }
  id v35 = 0;
  v36 = 0;
LABEL_40:
  id v38 = objc_retainBlock(v40);
  v39 = v38;
  if (v38) {
    (*((void (**)(id, void *, id))v38 + 2))(v38, v36, v25);
  }
}

@end