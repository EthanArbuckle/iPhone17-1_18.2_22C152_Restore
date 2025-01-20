@interface TSPFileManager
+ (BOOL)copyDataFromReadChannel:(id)a3 decryptionInfo:(id)a4 size:(unint64_t)a5 toWriteChannel:(id)a6 encryptionInfo:(id)a7 encodedLength:(unint64_t *)a8 error:(id *)a9;
+ (BOOL)linkOrCloneItemAtURL:(id)a3 toURL:(id)a4 canLink:(BOOL)a5 canClone:(BOOL)a6 error:(id *)a7;
+ (BOOL)linkOrCloneItemAtURL:(id)a3 toURL:(id)a4 canLink:(BOOL)a5 error:(id *)a6;
+ (BOOL)linkOrCopyItemAtURL:(id)a3 decryptionInfo:(id)a4 toURL:(id)a5 encryptionInfo:(id)a6 canLink:(BOOL)a7 encodedLength:(unint64_t *)a8 error:(id *)a9;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 sourcePath:(id)a5 targetPath:(id)a6;
+ (id)ioCompletionQueue;
+ (void)copyDataFromReadChannel:(id)a3 decryptionInfo:(id)a4 size:(unint64_t)a5 toWriteChannel:(id)a6 encryptionInfo:(id)a7 synchronous:(BOOL)a8 completion:(id)a9;
+ (void)copyDataFromReadChannel:(id)a3 decryptionInfo:(id)a4 toWriteChannel:(id)a5 encryptionInfo:(id)a6 completion:(id)a7;
+ (void)copyDataFromReadChannel:(id)a3 size:(unint64_t)a4 toWriteChannel:(id)a5 synchronous:(BOOL)a6 completion:(id)a7;
+ (void)transcodeReadChannel:(id)a3 decryptionInfo:(id)a4 size:(unint64_t)a5 toWriteChannel:(id)a6 encryptionInfo:(id)a7 synchronous:(BOOL)a8 completion:(id)a9;
@end

@implementation TSPFileManager

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 sourcePath:(id)a5 targetPath:(id)a6
{
  id v9 = a3;
  unint64_t v10 = (unint64_t)a5;
  unint64_t v11 = (unint64_t)a6;
  if (v10 | v11)
  {
    id v12 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    v13 = v12;
    if (v10) {
      [v12 setObject:v10 forKeyedSubscript:NSFilePathErrorKey];
    }
    if (v11) {
      [v13 setObject:v11 forKeyedSubscript:@"TSPTargetFilePath"];
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = [v13 copy];
  v15 = +[NSError errorWithDomain:v9 code:a4 userInfo:v14];

  return v15;
}

+ (BOOL)linkOrCloneItemAtURL:(id)a3 toURL:(id)a4 canLink:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = +[NSFileManager defaultManager];
  id v13 = objc_msgSend(v12, "tsu_canCloneItemAtURL:toURL:", v11, v10);

  LOBYTE(a6) = [a1 linkOrCloneItemAtURL:v11 toURL:v10 canLink:v7 canClone:v13 error:a6];
  return (char)a6;
}

+ (BOOL)linkOrCloneItemAtURL:(id)a3 toURL:(id)a4 canLink:(BOOL)a5 canClone:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  if (v8)
  {
    id v14 = +[NSFileManager defaultManager];
    unsigned __int8 v15 = [v14 copyItemAtURL:v12 toURL:v13 error:a7];
LABEL_18:

    goto LABEL_19;
  }
  if (v9)
  {
    id v14 = [v12 path];
    v16 = [v13 path];
    v17 = UnsafePointer();
    v18 = [v17 bundlePath];
    v19 = [v18 stringByStandardizingPath];
    uint64_t v20 = [v19 precomposedStringWithCanonicalMapping];

    v21 = [v14 stringByStandardizingPath];
    v22 = [v21 precomposedStringWithCanonicalMapping];
    v34 = (void *)v20;
    v23 = [(id)v20 stringByAppendingString:@"/"];
    LOBYTE(v20) = [v22 hasPrefix:v23];

    if (v20)
    {
      if (a7)
      {
        v24 = v16;
        v25 = [a1 errorWithDomain:NSCocoaErrorDomain code:257 sourcePath:v14 targetPath:v16];
        v26 = v34;
        goto LABEL_12;
      }
      unsigned __int8 v15 = 0;
      v24 = v16;
    }
    else
    {
      id v33 = v14;
      v28 = (const char *)[v33 fileSystemRepresentation];
      v29 = v16;
      id v30 = v16;
      int v31 = link(v28, (const char *)[v30 fileSystemRepresentation]);
      unsigned __int8 v15 = v31 == 0;
      if (a7)
      {
        v24 = v16;
        v26 = v34;
        if (!v31)
        {
LABEL_17:

          goto LABEL_18;
        }
        v24 = v29;
        v25 = [a1 errorWithDomain:NSPOSIXErrorDomain code:*__error() sourcePath:v33 targetPath:v30];
LABEL_12:
        unsigned __int8 v15 = 0;
        *a7 = v25;
        goto LABEL_17;
      }
      v24 = v16;
    }
    v26 = v34;
    goto LABEL_17;
  }
  if (a7)
  {
    id v14 = [v12 path];
    v27 = [v13 path];
    *a7 = [a1 errorWithDomain:NSCocoaErrorDomain code:257 sourcePath:v14 targetPath:v27];

    unsigned __int8 v15 = 0;
    goto LABEL_18;
  }
  unsigned __int8 v15 = 0;
LABEL_19:

  return v15;
}

+ (BOOL)linkOrCopyItemAtURL:(id)a3 decryptionInfo:(id)a4 toURL:(id)a5 encryptionInfo:(id)a6 canLink:(BOOL)a7 encodedLength:(unint64_t *)a8 error:(id *)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  LOBYTE(v19) = 0;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = sub_100005864;
  v66 = sub_100005874;
  id v67 = 0;
  if (v15 && v17)
  {
    if (UnsafePointer(v16, v18))
    {
      uint64_t v20 = [TSUFileIOChannel alloc];
      v21 = (id *)(v63 + 5);
      id obj = (id)v63[5];
      id v22 = [(TSUFileIOChannel *)v20 initForReadingURL:v15 error:&obj];
      objc_storeStrong(v21, obj);
      if (v22)
      {
        v23 = [TSUFileIOChannel alloc];
        v24 = (id *)(v63 + 5);
        id v57 = (id)v63[5];
        id v25 = [(TSUFileIOChannel *)v23 initForStreamWritingURL:v17 error:&v57];
        objc_storeStrong(v24, v57);
        if (v25)
        {
          id v56 = 0;
          id v55 = 0;
          unsigned __int8 v26 = [v15 getResourceValue:&v56 forKey:NSURLFileSizeKey error:&v55];
          id v27 = v56;
          id v52 = v55;
          if ((v26 & 1) == 0)
          {

            if (TSUDefaultCat_init_token != -1) {
              dispatch_once(&TSUDefaultCat_init_token, &stru_1001C5090);
            }
            v28 = TSUDefaultCat_log_t;
            if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
            {
              id v51 = [v15 path];
              v46 = (objc_class *)objc_opt_class();
              NSStringFromClass(v46);
              id v49 = (id)objc_claimAutoreleasedReturnValue();
              id v47 = [v52 domain];
              id v48 = [v52 code];
              *(_DWORD *)buf = 138413314;
              id v73 = v51;
              __int16 v74 = 2114;
              id v75 = v49;
              __int16 v76 = 2114;
              id v77 = v47;
              __int16 v78 = 2048;
              id v79 = v48;
              __int16 v80 = 2112;
              id v81 = v52;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_ERROR, "Failed to retrieve file size for path: %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
            }
            id v27 = 0;
          }
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_100005904;
          v54[3] = &unk_1001C50B8;
          v54[4] = &v68;
          v54[5] = &v62;
          objc_msgSend(a1, "transcodeReadChannel:decryptionInfo:size:toWriteChannel:encryptionInfo:synchronous:completion:", v22, v16, objc_msgSend(v27, "unsignedLongLongValue"), v25, v18, 1, v54);
          uint64_t v19 = v63[5];
          [v25 close];
          LOBYTE(v19) = v19 == 0;
        }
        else
        {
          LOBYTE(v19) = 0;
        }
        [v22 close];
      }
      else
      {
        LOBYTE(v19) = 0;
      }
    }
    else
    {
      if (v10
        && (+[NSFileManager defaultManager],
            v29 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v30 = objc_msgSend(v29, "tsu_canCloneItemAtURL:toURL:", v15, v17),
            v29,
            (v30 & 1) == 0)
        && ([a1 linkOrCloneItemAtURL:v15 toURL:v17 canLink:1 canClone:0 error:0] & 1) != 0)
      {
        LODWORD(v19) = 1;
      }
      else
      {
        int v31 = +[NSFileManager defaultManager];
        v32 = (id *)(v63 + 5);
        id v61 = (id)v63[5];
        LODWORD(v19) = [v31 copyItemAtURL:v15 toURL:v17 error:&v61];
        objc_storeStrong(v32, v61);
      }
      if (a8 && v19)
      {
        id v60 = 0;
        id v59 = 0;
        unsigned int v33 = [v17 getResourceValue:&v60 forKey:NSURLFileSizeKey error:&v59];
        id v34 = v60;
        id v35 = v59;
        if (v33)
        {
          id v36 = [v34 unsignedLongLongValue];
          v69[3] = (uint64_t)v36;
        }
        else
        {
          if (TSUDefaultCat_init_token != -1) {
            dispatch_once(&TSUDefaultCat_init_token, &stru_1001C5070);
          }
          v37 = TSUDefaultCat_log_t;
          if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
          {
            v50 = [v17 path];
            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            id v53 = (id)objc_claimAutoreleasedReturnValue();
            id v44 = [v35 domain];
            id v45 = [v35 code];
            *(_DWORD *)buf = 138413314;
            id v73 = v50;
            __int16 v74 = 2114;
            id v75 = v53;
            __int16 v76 = 2114;
            id v77 = v44;
            __int16 v78 = 2048;
            id v79 = v45;
            __int16 v80 = 2112;
            id v81 = v35;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v37, OS_LOG_TYPE_ERROR, "Failed to retrieve file size for path: %@. errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x34u);
          }
        }

        LOBYTE(v19) = 1;
        goto LABEL_33;
      }
    }
  }
  if (a8) {
LABEL_33:
  }
    *a8 = v69[3];
  if (a9 && (v19 & 1) == 0)
  {
    v38 = (void *)v63[5];
    if (v38)
    {
      *a9 = v38;
    }
    else
    {
      v39 = [v15 path];
      v40 = [v17 path];
      id v41 = [a1 errorWithDomain:NSCocoaErrorDomain code:4 sourcePath:v39 targetPath:v40];
      *a9 = v41;
    }
  }
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(&v68, 8);
  return v19;
}

+ (BOOL)copyDataFromReadChannel:(id)a3 decryptionInfo:(id)a4 size:(unint64_t)a5 toWriteChannel:(id)a6 encryptionInfo:(id)a7 encodedLength:(unint64_t *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  uint64_t v29 = 0;
  unsigned __int8 v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unsigned __int8 v26 = sub_100005864;
  id v27 = sub_100005874;
  id v28 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100005AEC;
  v22[3] = &unk_1001C50B8;
  v22[4] = &v29;
  v22[5] = &v23;
  [a1 copyDataFromReadChannel:v15 decryptionInfo:v16 size:a5 toWriteChannel:v17 encryptionInfo:v18 synchronous:1 completion:v22];
  if (a8) {
    *a8 = v30[3];
  }
  uint64_t v19 = (void *)v24[5];
  if (a9 && v19)
  {
    *a9 = v19;
    uint64_t v19 = (void *)v24[5];
  }
  BOOL v20 = v19 == 0;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v20;
}

+ (void)copyDataFromReadChannel:(id)a3 decryptionInfo:(id)a4 toWriteChannel:(id)a5 encryptionInfo:(id)a6 completion:(id)a7
{
}

+ (void)copyDataFromReadChannel:(id)a3 decryptionInfo:(id)a4 size:(unint64_t)a5 toWriteChannel:(id)a6 encryptionInfo:(id)a7 synchronous:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v20 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void (**)(id, void, void *))a9;
  if (v20 && v16)
  {
    if (UnsafePointer(v15, v17)) {
      [a1 transcodeReadChannel:v20 decryptionInfo:v15 size:a5 toWriteChannel:v16 encryptionInfo:v17 synchronous:v9 completion:v18];
    }
    else {
      [a1 copyDataFromReadChannel:v20 size:a5 toWriteChannel:v16 synchronous:v9 completion:v18];
    }
  }
  else if (v18)
  {
    uint64_t v19 = +[NSError tsp_unknownReadErrorWithUserInfo:0];
    v18[2](v18, 0, v19);
  }
}

+ (void)transcodeReadChannel:(id)a3 decryptionInfo:(id)a4 size:(unint64_t)a5 toWriteChannel:(id)a6 encryptionInfo:(id)a7 synchronous:(BOOL)a8 completion:(id)a9
{
  BOOL v9 = a8;
  id v21 = a6;
  id v15 = (void (**)(id, void, void *))a9;
  id v16 = a7;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [[TSPCryptoTranscodeReadChannel alloc] initWithReadChannel:v18 decryptionInfo:v17 encryptionInfo:v16];

  if (v19)
  {
    [a1 copyDataFromReadChannel:v19 size:a5 toWriteChannel:v21 synchronous:v9 completion:v15];
    [(TSPCryptoTranscodeReadChannel *)v19 close];
  }
  else if (v15)
  {
    id v20 = +[NSError tsp_unknownReadErrorWithUserInfo:0];
    v15[2](v15, 0, v20);
  }
}

+ (id)ioCompletionQueue
{
  if (qword_1001EB308 != -1) {
    dispatch_once(&qword_1001EB308, &stru_1001C50D8);
  }
  v2 = (void *)qword_1001EB300;
  return v2;
}

+ (void)copyDataFromReadChannel:(id)a3 size:(unint64_t)a4 toWriteChannel:(id)a5 synchronous:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = (void (**)(void, void, void))v14;
  if (v12 && v13)
  {
    id v16 = 0;
    uint64_t v40 = 0;
    id v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = sub_100005864;
    id v44 = sub_100005874;
    id v45 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    char v39 = 0;
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    if (v8)
    {
      id v16 = +[NSProgress currentProgress];

      if (v16)
      {
        id v16 = +[NSProgress progressWithTotalUnitCount:a4];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1000061F0;
        v33[3] = &unk_1001C5100;
        v33[4] = v38;
        [v16 setCancellationHandler:v33];
      }
    }
    id v17 = dispatch_group_create();
    dispatch_group_enter(v17);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100006204;
    v26[3] = &unk_1001C5150;
    unsigned __int8 v30 = &v40;
    id v18 = v17;
    id v27 = v18;
    id v28 = v13;
    uint64_t v31 = &v34;
    id v19 = v16;
    id v29 = v19;
    uint64_t v32 = v38;
    [v12 readWithHandler:v26];
    if (v8)
    {
      dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
      if (v15) {
        v15[2](v15, v35[3], v41[5]);
      }
    }
    else if (v15)
    {
      id v21 = [a1 ioCompletionQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000064A8;
      block[3] = &unk_1001C5178;
      uint64_t v23 = v15;
      v24 = &v34;
      uint64_t v25 = &v40;
      dispatch_group_notify(v18, v21, block);
    }
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(v38, 8);
    _Block_object_dispose(&v40, 8);
  }
  else if (v14)
  {
    id v20 = +[NSError tsp_unknownReadErrorWithUserInfo:0];
    ((void (**)(void, void, void *))v15)[2](v15, 0, v20);
  }
}

@end