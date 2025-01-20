@interface KTEnrollmentSignatureSupport
+ (BOOL)validateSignatures:(id)a3 error:(id *)a4;
+ (id)enrollementLoggingKeys:(id)a3;
+ (void)updateClientData:(id)a3 deps:(id)a4 complete:(id)a5;
@end

@implementation KTEnrollmentSignatureSupport

+ (void)updateClientData:(id)a3 deps:(id)a4 complete:(id)a5
{
  id v106 = a3;
  id v7 = a4;
  id v95 = a5;
  uint64_t v132 = 0;
  v133 = &v132;
  uint64_t v134 = 0x3032000000;
  v135 = sub_1001B08CC;
  v136 = sub_1001B08DC;
  id v137 = 0;
  uint64_t v126 = 0;
  v127 = &v126;
  uint64_t v128 = 0x3032000000;
  v129 = sub_1001B08CC;
  v130 = sub_1001B08DC;
  id v131 = 0;
  uint64_t v122 = 0;
  v123 = &v122;
  uint64_t v124 = 0x2020000000;
  char v125 = 0;
  v105 = v7;
  v8 = [v7 accountOperations];
  v9 = (id *)(v127 + 5);
  id obj = (id)v127[5];
  v96 = [v8 primaryAccount:&obj];
  objc_storeStrong(v9, obj);

  if (!v96)
  {
    if (qword_10032EF90 != -1) {
      dispatch_once(&qword_10032EF90, &stru_1002C5778);
    }
    v56 = qword_10032EF98;
    if (os_log_type_enabled((os_log_t)qword_10032EF98, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "TransparencyAccount no account", buf, 2u);
    }
    v57 = +[NSDictionary dictionary];
    (*((void (**)(id, void *, void, void, uint64_t))v95 + 2))(v95, v57, 0, 0, v127[5]);
    goto LABEL_89;
  }
  v10 = [v7 accountOperations];
  id v93 = [v10 accountLevel:v96];

  if (v93 != (id)4)
  {
    if (qword_10032EF90 != -1) {
      dispatch_once(&qword_10032EF90, &stru_1002C5798);
    }
    v11 = qword_10032EF98;
    if (os_log_type_enabled((os_log_t)qword_10032EF98, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v141) = v93;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "TransparencyAccount level not HSA2: %d", buf, 8u);
    }
  }
  uint64_t v12 = [v96 aa_altDSID];
  if (!v12)
  {
    if (qword_10032EF90 != -1) {
      dispatch_once(&qword_10032EF90, &stru_1002C57B8);
    }
    v13 = qword_10032EF98;
    if (os_log_type_enabled((os_log_t)qword_10032EF98, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Can't get AltDSID", buf, 2u);
    }
  }
  uint64_t v14 = [v96 aa_personID];
  if (!v14)
  {
    if (qword_10032EF90 != -1) {
      dispatch_once(&qword_10032EF90, &stru_1002C57D8);
    }
    v15 = qword_10032EF98;
    if (os_log_type_enabled((os_log_t)qword_10032EF98, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Can't get DSID", buf, 2u);
    }
  }
  v103 = (void *)v14;
  v104 = (void *)v12;
  v16 = [v106 requests];
  v94 = [v16 allKeys];

  if (![v94 count])
  {
    v58 = +[NSDictionary dictionary];
    (*((void (**)(id, void *, void, void, void))v95 + 2))(v95, v58, 0, 0, 0);
    goto LABEL_88;
  }
  v17 = [v105 smDataStore];
  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472;
  v120[2] = sub_1001B09F4;
  v120[3] = &unk_1002C5800;
  v120[4] = &v132;
  [v17 fetchDeviceSignature:v94 complete:v120];

  v97 = +[NSMutableSet set];
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  v18 = [(id)v133[5] allValues];
  id v19 = [v18 countByEnumeratingWithState:&v116 objects:v146 count:16];
  if (!v19)
  {
    char v100 = 0;
    goto LABEL_62;
  }
  char v100 = 0;
  uint64_t v20 = *(void *)v117;
  id v101 = v18;
  do
  {
    v21 = 0;
    do
    {
      if (*(void *)v117 != v20) {
        objc_enumerationMutation(v101);
      }
      v22 = *(void **)(*((void *)&v116 + 1) + 8 * (void)v21);
      v23 = [v106 requests];
      uint64_t v24 = [v22 application];
      v25 = [v23 objectForKeyedSubscript:v24];

      v26 = [v22 tbsKTIDSRegistrationData];
      v27 = [v25 tbsKTIDSRegistrationData];
      LOBYTE(v24) = [v26 isEqual:v27];

      if ((v24 & 1) == 0)
      {
        v37 = [v105 logger];
        v38 = [v22 application];
        v39 = +[NSString stringWithFormat:@"TBS-%@-%@", @"u", v38];
        [v37 incrementIntegerPropertyForKey:v39];

        if (qword_10032EF90 != -1) {
          dispatch_once(&qword_10032EF90, &stru_1002C5820);
        }
        v35 = (id)qword_10032EF98;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v40 = [v22 application];
          v41 = [v22 tbsKTIDSRegistrationData];
          [v41 kt_hexString];
          id v42 = (id)objc_claimAutoreleasedReturnValue();
          v43 = [v25 tbsKTIDSRegistrationData];
          v44 = [v43 kt_hexString];
          *(_DWORD *)buf = 138412802;
          v141 = v40;
          __int16 v142 = 2112;
          id v143 = v42;
          __int16 v144 = 2112;
          v145 = v44;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "TBS changed since last update: %@, old %@, new %@", buf, 0x20u);
        }
        char v100 = 1;
        goto LABEL_51;
      }
      v28 = [v22 pushToken];
      v29 = [v25 pushToken];
      unsigned __int8 v30 = [v28 isEqual:v29];

      if ((v30 & 1) == 0)
      {
        v45 = [v105 logger];
        v46 = [v22 application];
        v47 = +[NSString stringWithFormat:@"TBS-%@-%@", @"h", v46];
        [v45 incrementIntegerPropertyForKey:v47];

        if (qword_10032EF90 != -1) {
          dispatch_once(&qword_10032EF90, &stru_1002C5840);
        }
        v35 = (id)qword_10032EF98;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v48 = [v22 application];
          *(_DWORD *)buf = 138412290;
          v141 = v48;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Pushtoken changed since last update: %@", buf, 0xCu);
        }
        goto LABEL_51;
      }
      v31 = [v22 altDSID];
      v32 = v31;
      if (v31 && v104)
      {
        v33 = [v22 altDSID];
        unsigned __int8 v34 = [v104 isEqual:v33];

        if ((v34 & 1) == 0)
        {
          if (qword_10032EF90 != -1) {
            dispatch_once(&qword_10032EF90, &stru_1002C5860);
          }
          v35 = (id)qword_10032EF98;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = [v22 application];
            *(_DWORD *)buf = 138412290;
            v141 = v36;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "TBS have different DSID: %@", buf, 0xCu);
          }
          goto LABEL_51;
        }
      }
      else
      {
      }
      v49 = [v22 dsid];
      BOOL v50 = v49 == 0;

      if (v50)
      {
        if (qword_10032EF90 != -1) {
          dispatch_once(&qword_10032EF90, &stru_1002C5880);
        }
        v51 = (id)qword_10032EF98;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          v52 = [v22 application];
          *(_DWORD *)buf = 138412290;
          v141 = v52;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "TBS missing dsid, adding in: %@", buf, 0xCu);
        }
        [v22 setDsid:v103];
      }
      v53 = [v22 signature];
      if (v53)
      {
        v54 = [v22 publicKey];
        BOOL v55 = v54 == 0;

        if (!v55)
        {
          v35 = [v22 application];
          [v97 addObject:v35];
LABEL_51:
        }
      }

      v21 = (char *)v21 + 1;
    }
    while (v19 != v21);
    v18 = v101;
    id v19 = [v101 countByEnumeratingWithState:&v116 objects:v146 count:16];
  }
  while (v19);
LABEL_62:

  v59 = +[NSMutableSet setWithArray:v94];
  [v59 minusSet:v97];
  v98 = v59;
  v99 = objc_alloc_init(KDeviceSet);
  if ([v59 count])
  {
    id v102 = +[NSMutableArray array];
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v60 = v59;
    id v61 = [v60 countByEnumeratingWithState:&v112 objects:v139 count:16];
    if (v61)
    {
      uint64_t v62 = *(void *)v113;
      do
      {
        for (i = 0; i != v61; i = (char *)i + 1)
        {
          if (*(void *)v113 != v62) {
            objc_enumerationMutation(v60);
          }
          uint64_t v64 = *(void *)(*((void *)&v112 + 1) + 8 * i);
          v65 = [v106 requests];
          v66 = [v65 objectForKeyedSubscript:v64];

          id v67 = objc_alloc((Class)TransparencyIDSRegistrationData);
          v68 = [v66 tbsKTIDSRegistrationData];
          id v69 = [v67 initWithApplication:v64 registrationData:v68];

          v70 = [v66 pushToken];
          [v69 setPushToken:v70];

          [v69 setAltDSID:v104];
          [v69 setDsid:v103];
          [v102 addObject:v69];
          [(id)v133[5] setObject:v69 forKeyedSubscript:v64];
          v71 = [v66 pushToken];
          if (v71)
          {
            v72 = [v66 tbsKTIDSRegistrationData];
            BOOL v73 = v72 == 0;

            if (!v73)
            {
              v74 = [v66 pushToken];
              v75 = [v66 tbsKTIDSRegistrationData];
              id v76 = [(KDeviceSet *)v99 addDevice:v74 registationData:v75 app:v64];
            }
          }
        }
        id v61 = [v60 countByEnumeratingWithState:&v112 objects:v139 count:16];
      }
      while (v61);
    }

    v77 = [v105 smDataStore];
    v111[0] = _NSConcreteStackBlock;
    v111[1] = 3221225472;
    v111[2] = sub_1001B0B64;
    v111[3] = &unk_1002C58A8;
    v111[4] = &v126;
    v111[5] = &v122;
    [v77 storeDeviceSignature:v102 complete:v111];

    v78 = [v105 cloudRecords];

    if (v78)
    {
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      v79 = [(KDeviceSet *)v99 devices];
      v80 = [v79 allObjects];

      id v81 = [v80 countByEnumeratingWithState:&v107 objects:v138 count:16];
      if (v81)
      {
        uint64_t v82 = *(void *)v108;
        do
        {
          for (j = 0; j != v81; j = (char *)j + 1)
          {
            if (*(void *)v108 != v82) {
              objc_enumerationMutation(v80);
            }
            v84 = *(void **)(*((void *)&v107 + 1) + 8 * (void)j);
            v85 = [v105 cloudRecords];
            v86 = [v84 pushToken];
            v87 = [v84 registrationData];
            v88 = [v84 apps];
            v89 = [v88 allObjects];
            [v85 updateSelfCloudDeviceWithPushToken:v86 tbsRegistrationData:v87 applications:v89];
          }
          id v81 = [v80 countByEnumeratingWithState:&v107 objects:v138 count:16];
        }
        while (v81);
      }

      if (v93 == (id)4)
      {
        v90 = [[KTPendingFlag alloc] initWithFlag:@"CloudKitOutgoing" conditions:2 delayInSeconds:5.0];
        v91 = [v105 flagHandler];
        [v91 handlePendingFlag:v90];
      }
    }
  }
  if (v93 == (id)4) {
    v92 = (void *)v133[5];
  }
  else {
    v92 = &__NSDictionary0__struct;
  }
  (*((void (**)(id, void *, void, void, uint64_t))v95 + 2))(v95, v92, *((unsigned __int8 *)v123 + 24), v100 & 1, v127[5]);

  v58 = v97;
LABEL_88:

  v57 = v104;
LABEL_89:

  _Block_object_dispose(&v122, 8);
  _Block_object_dispose(&v126, 8);

  _Block_object_dispose(&v132, 8);
}

+ (id)enrollementLoggingKeys:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [&off_1002DA5A0 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(&off_1002DA5A0);
        }
        v9 = +[NSString stringWithFormat:@"TBS-%@-%@", *(void *)(*((void *)&v11 + 1) + 8 * i), v3];
        [v4 addObject:v9];
      }
      id v6 = [&off_1002DA5A0 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (BOOL)validateSignatures:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_1001B08CC;
  id v19 = sub_1001B08DC;
  id v20 = 0;
  id v6 = [v5 smDataStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001B0E9C;
  v11[3] = &unk_1002C58D0;
  long long v13 = &v15;
  long long v14 = &v21;
  id v7 = v5;
  id v12 = v7;
  [v6 fetchDeviceSignature:0 complete:v11];

  if (a4)
  {
    v8 = (void *)v16[5];
    if (v8) {
      *a4 = v8;
    }
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

@end