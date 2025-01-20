@interface TransparencyAuditorReportServer
+ (void)makeReports:(id)a3 additionalData:(id)a4 auditorURI:(id)a5 logClient:(id)a6 completionBlock:(id)a7;
@end

@implementation TransparencyAuditorReportServer

+ (void)makeReports:(id)a3 additionalData:(id)a4 auditorURI:(id)a5 logClient:(id)a6 completionBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v47 = a5;
  id v49 = a6;
  v50 = (void (**)(id, void *))a7;
  v55 = +[NSMutableDictionary dictionary];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v11;
  id v13 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v68;
    uint64_t v15 = kTransparencyAuditorReportApplication;
    uint64_t v53 = kTransparencyAuditorReportUUID;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v68 != v14) {
          objc_enumerationMutation(obj);
        }
        v17 = +[NSMutableDictionary dictionaryWithDictionary:*(void *)(*((void *)&v67 + 1) + 8 * (void)v16)];
        v18 = v17;
        if (v12) {
          [v17 setObject:v12 forKeyedSubscript:@"userInput"];
        }
        v19 = [v18 objectForKeyedSubscript:v15];
        if (v19)
        {
          v20 = +[TransparencyApplication applicationValueForIdentifier:v19];
          BOOL v21 = v20 == 0;

          if (v21)
          {
            if (qword_10032F060 != -1) {
              dispatch_once(&qword_10032F060, &stru_1002C6150);
            }
            v29 = (void *)qword_10032F068;
            if (os_log_type_enabled((os_log_t)qword_10032F068, OS_LOG_TYPE_ERROR))
            {
              v30 = v29;
              v31 = [v18 objectForKeyedSubscript:v53];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v19;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v31;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "skipping auditor report with unknown application %@ : %@", buf, 0x16u);
            }
          }
          else
          {
            v22 = [v55 objectForKeyedSubscript:v19];
            BOOL v23 = v22 == 0;

            if (v23)
            {
              v24 = +[NSMutableArray array];
              [v55 setObject:v24 forKeyedSubscript:v19];
            }
            v25 = [v55 objectForKeyedSubscript:v19];
            [v25 addObject:v18];
          }
        }
        else
        {
          if (qword_10032F060 != -1) {
            dispatch_once(&qword_10032F060, &stru_1002C6130);
          }
          v26 = (void *)qword_10032F068;
          if (os_log_type_enabled((os_log_t)qword_10032F068, OS_LOG_TYPE_ERROR))
          {
            v27 = v26;
            v28 = [v18 objectForKeyedSubscript:v53];
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "skipping auditor report with missing application: %@", buf, 0xCu);
          }
        }

        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      id v13 = [obj countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v13);
  }

  v32 = [v55 allKeys];
  BOOL v33 = [v32 count] == 0;

  if (v33)
  {
    v46 = +[TransparencyError errorWithDomain:kTransparencyErrorInterface code:-178 description:@"no auditor reports with valid applications"];
    v50[2](v50, v46);
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v73 = sub_1001BBAD8;
    v74 = sub_1001BBAE8;
    id v75 = 0;
    group = dispatch_group_create();
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v34 = v55;
    id v35 = [v34 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v64;
      uint64_t v52 = kTransparencyErrorInterface;
      v48 = v34;
LABEL_26:
      uint64_t v37 = 0;
      while (1)
      {
        if (*(void *)v64 != v36) {
          objc_enumerationMutation(v34);
        }
        uint64_t v38 = *(void *)(*((void *)&v63 + 1) + 8 * v37);
        v39 = [v34 objectForKeyedSubscript:v38];
        v40 = +[NSUUID UUID];
        if (+[NSJSONSerialization isValidJSONObject:v39])
        {
          id v62 = 0;
          v41 = +[NSJSONSerialization dataWithJSONObject:v39 options:0 error:&v62];
          id v42 = v62;
          if (v41)
          {
            dispatch_group_enter(group);
            v59[0] = _NSConcreteStackBlock;
            v59[1] = 3221225472;
            v59[2] = sub_1001BBAF0;
            v59[3] = &unk_1002C6178;
            v61 = buf;
            v60 = group;
            v34 = v48;
            [v49 postReport:v41 uuid:v40 application:v38 completionHandler:v59];

            int v43 = 0;
          }
          else
          {
            v50[2](v50, v42);
            int v43 = 1;
          }
        }
        else
        {
          id v42 = +[TransparencyError errorWithDomain:v52 code:-300 description:@"auditor report is not a valid JSON object"];
          v50[2](v50, v42);
          int v43 = 1;
        }

        if (v43) {
          break;
        }
        if (v35 == (id)++v37)
        {
          id v35 = [v34 countByEnumeratingWithState:&v63 objects:v71 count:16];
          if (v35) {
            goto LABEL_26;
          }
          goto LABEL_38;
        }
      }
    }
    else
    {
LABEL_38:

      v44 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v45 = dispatch_queue_create("com.apple.transparency.auditReports", v44);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001BBB58;
      block[3] = &unk_1002BB190;
      v57 = v50;
      v58 = buf;
      dispatch_group_notify(group, v45, block);

      v34 = v57;
    }

    _Block_object_dispose(buf, 8);
  }
}

@end