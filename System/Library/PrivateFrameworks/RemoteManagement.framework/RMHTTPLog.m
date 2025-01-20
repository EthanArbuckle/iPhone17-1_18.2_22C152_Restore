@interface RMHTTPLog
+ (id)_logDirectoryForEnrollmentToken:(id)a3;
+ (void)_writeRequestLogToURL:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7;
+ (void)logHTTPDetailsForEnrollmentToken:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7;
+ (void)logHTTPDetailsForEnrollmentToken:(id)a3 request:(id)a4 response:(id)a5 responseURL:(id)a6 responseError:(id)a7;
@end

@implementation RMHTTPLog

+ (void)logHTTPDetailsForEnrollmentToken:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (+[RMFeatureOverrides useHTTPLogging])
  {
    v16 = [a1 _logDirectoryForEnrollmentToken:v17];
    if (v16) {
      [a1 _writeRequestLogToURL:v16 request:v12 response:v13 responseData:v14 responseError:v15];
    }
  }
}

+ (void)logHTTPDetailsForEnrollmentToken:(id)a3 request:(id)a4 response:(id)a5 responseURL:(id)a6 responseError:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (+[RMFeatureOverrides useHTTPLogging])
  {
    v16 = [v14 absoluteString];
    id v17 = +[NSString stringWithFormat:@"Downloaded data to file: %@", v16];

    v18 = [v17 dataUsingEncoding:4];
    [a1 logHTTPDetailsForEnrollmentToken:v19 request:v12 response:v13 responseData:v18 responseError:v15];
  }
}

+ (void)_writeRequestLogToURL:(id)a3 request:(id)a4 response:(id)a5 responseData:(id)a6 responseError:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v71 = a5;
  id v69 = a6;
  id v70 = a7;
  id v13 = objc_opt_new();
  id v14 = +[RMDateFormat stringLocalTimeZoneFractionalSecondsWithDate:v13];

  id v15 = v12;
  v16 = [v12 HTTPMethod];
  id v17 = +[NSString stringWithFormat:@"%@-%@.txt", v14, v16];

  v72 = v11;
  v18 = [v11 URLByAppendingPathComponent:v17 isDirectory:0];
  for (uint64_t i = 1; ; ++i)
  {
    v20 = +[NSFileManager defaultManager];
    v21 = [v18 path];
    unsigned int v22 = [v20 fileExistsAtPath:v21];

    if (!v22 || (unint64_t)(i - 1) > 0x63) {
      break;
    }
    v23 = [v12 HTTPMethod];
    uint64_t v24 = +[NSString stringWithFormat:@"%@-%@-%lu.txt", v14, v23, i];

    uint64_t v25 = [v72 URLByAppendingPathComponent:v24 isDirectory:0];

    v18 = (void *)v25;
    id v17 = (void *)v24;
  }
  v26 = +[NSFileManager defaultManager];
  v27 = [v18 path];
  unsigned __int8 v28 = [v26 createFileAtPath:v27 contents:0 attributes:0];

  if (v28)
  {
    v81[0] = 0;
    v29 = +[NSFileHandle fileHandleForWritingToURL:v18 error:v81];
    id v30 = v81[0];
    v31 = v71;
    if (v29)
    {
      v32 = +[NSMutableArray array];
      [v32 addObject:@"<<<<< Request"];
      v66 = v30;
      v33 = [v15 HTTPMethod];
      uint64_t v34 = [v15 URL];
      [(id)v34 path];
      v36 = v35 = v29;
      v37 = +[NSString stringWithFormat:@"%@ %@ HTTP/1.1", v33, v36];
      [v32 addObject:v37];

      v38 = [v15 allHTTPHeaderFields];
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472;
      v79[2] = sub_100040838;
      v79[3] = &unk_1000C6020;
      id v39 = v32;
      id v80 = v39;
      [v38 enumerateKeysAndObjectsUsingBlock:v79];

      [v39 addObject:@"\n"];
      v40 = [v39 componentsJoinedByString:@"\n"];
      v41 = [v40 dataUsingEncoding:4];
      id v78 = 0;
      v68 = v35;
      LOBYTE(v34) = [v35 writeData:v41 error:&v78];
      id v42 = v78;

      if ((v34 & 1) == 0)
      {
        v43 = +[RMLog httpLogging];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_100040BDC();
        }
      }
      uint64_t v44 = [v15 HTTPBody];
      v31 = v71;
      v67 = (void *)v44;
      if (v44)
      {
        id v77 = 0;
        unsigned __int8 v45 = [v68 writeData:v44 error:&v77];
        id v46 = v77;
        v47 = v42;
        id v42 = v46;

        if ((v45 & 1) == 0)
        {
          v48 = +[RMLog httpLogging];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_100040B74();
          }
        }
      }
      v65 = v42;
      v49 = +[NSMutableArray array];

      [v49 addObject:@"\n>>>>> Response"];
      if (v71)
      {
        id v50 = [v71 statusCode];
        v51 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", [v71 statusCode]);
        v52 = +[NSString stringWithFormat:@"HTTP/1.1 %ld %@", v50, v51];
        [v49 addObject:v52];

        v53 = [v71 allHeaderFields];
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472;
        v75[2] = sub_1000408A0;
        v75[3] = &unk_1000C6020;
        v54 = v49;
        v76 = v54;
        [v53 enumerateKeysAndObjectsUsingBlock:v75];

        [v54 addObject:@"\n"];
      }
      else if (v70)
      {
        [v49 addObject:@"--- Error ---"];
        v57 = [v70 description];
        [v49 addObject:v57];
      }
      else
      {
        [v49 addObject:@"--- Unknown Error ---"];
      }
      v58 = [v49 componentsJoinedByString:@"\n"];
      v59 = [v58 dataUsingEncoding:4];
      id v74 = 0;
      unsigned __int8 v60 = [v68 writeData:v59 error:&v74];
      id v30 = v74;

      v56 = v69;
      if ((v60 & 1) == 0)
      {
        v61 = +[RMLog httpLogging];
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_100040B0C();
        }
      }
      if (v69)
      {
        id v73 = 0;
        v29 = v68;
        unsigned __int8 v62 = [v68 writeData:v69 error:&v73];
        id v63 = v73;

        if ((v62 & 1) == 0)
        {
          v64 = +[RMLog httpLogging];
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
            sub_100040AA4();
          }
        }
        id v30 = v63;
        v31 = v71;
      }
      else
      {
        v29 = v68;
      }
      [v29 closeFile];
    }
    else
    {
      v49 = +[RMLog httpLogging];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_100040A3C();
      }
      v56 = v69;
    }
    v55 = v70;
  }
  else
  {
    v29 = +[RMLog httpLogging];
    v55 = v70;
    v31 = v71;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100040C44((uint64_t)v18, v29);
    }
    id v30 = 0;
    v56 = v69;
  }
}

+ (id)_logDirectoryForEnrollmentToken:(id)a3
{
  id v3 = a3;
  v4 = +[RMLocations httpLoggingDirectoryURLCreateIfNeeded:1];
  v5 = [v4 URLByAppendingPathComponent:v3 isDirectory:1];

  v6 = +[NSFileManager defaultManager];
  id v12 = 0;
  unsigned int v7 = [v6 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:0 error:&v12];
  id v8 = v12;

  if (v7)
  {
    id v9 = v5;
  }
  else
  {
    v10 = +[RMLog httpLogging];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100040CBC();
    }

    id v9 = 0;
  }

  return v9;
}

@end