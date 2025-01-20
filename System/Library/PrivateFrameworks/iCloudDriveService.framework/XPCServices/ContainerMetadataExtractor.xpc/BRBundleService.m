@interface BRBundleService
- (id)_findURLForBundleID:(id)a3;
- (void)_extractMetadataForContainerID:(id)a3 bundleID:(id)a4 minimumBundleVersion:(id)a5 reply:(id)a6;
- (void)extractMetadataForContainerID:(id)a3 bundleID:(id)a4 minimumBundleVersion:(id)a5 reply:(id)a6;
@end

@implementation BRBundleService

- (void)_extractMetadataForContainerID:(id)a3 bundleID:(id)a4 minimumBundleVersion:(id)a5 reply:(id)a6
{
  id v10 = a3;
  v11 = (BRBundleService *)a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    brc_bread_crumbs();
    v20 = (BRBundleService *)objc_claimAutoreleasedReturnValue();
    v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] can't extract container metadata with no container ID%@", buf, 0xCu);
    }

    v22 = brc_bread_crumbs();
    v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100002D18();
    }

    CFStringRef v18 = @"containerID";
    goto LABEL_13;
  }
  if ([v10 isEqualToString:BRUbiquitousDefaultContainerID])
  {
    brc_bread_crumbs();
    v14 = (BRBundleService *)objc_claimAutoreleasedReturnValue();
    v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] can't extract metadata for the default container; nobody should specify this container in its Info.plist%@",
        buf,
        0xCu);
    }

    v16 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v44 = +[NSError brc_errorInvalidParameter:@"containerID" value:v10];
      *(_DWORD *)buf = 138413314;
      v58 = self;
      __int16 v59 = 2112;
      id v60 = 0;
      __int16 v61 = 2112;
      id v62 = 0;
      __int16 v63 = 2112;
      v64 = v44;
      __int16 v65 = 2112;
      v66 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }
    CFStringRef v18 = @"containerID";
    id v19 = v10;
    goto LABEL_14;
  }
  if (([v10 isEqualToString:BRPassbookContainerID] & 1) != 0
    || [v10 isEqualToString:@"com.apple.TextInput"])
  {
    v25 = brc_bread_crumbs();
    v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      sub_100002DC0((uint64_t)self, (uint64_t)v25, v26);
    }

    (*((void (**)(id, void *, void, void))v13 + 2))(v13, &__NSDictionary0__struct, 0, 0);
    goto LABEL_20;
  }
  if (!v11)
  {
    brc_bread_crumbs();
    v40 = (BRBundleService *)objc_claimAutoreleasedReturnValue();
    v41 = brc_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v40;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "[WARNING] can't extract container metadata with no bundle ID%@", buf, 0xCu);
    }

    v42 = brc_bread_crumbs();
    v43 = brc_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      sub_100002E68();
    }

    CFStringRef v18 = @"bundleID";
LABEL_13:
    id v19 = 0;
LABEL_14:
    v24 = +[NSError brc_errorInvalidParameter:v18 value:v19];
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v24);

    goto LABEL_20;
  }
  v27 = [(BRBundleService *)self _findURLForBundleID:v11];
  if (v27 && (uint64_t Unique = _CFBundleCreateUnique()) != 0)
  {
    v29 = (const void *)Unique;
    id v31 = [objc_alloc((Class)BRMangledID) initWithAppLibraryName:v10];
    id v56 = 0;
    v53 = +[BRContainer propertiesForMangledID:v31 usingBundle:v29 minimumBundleVersion:v12 bundleIcons:&v56];
    id v32 = v56;

    CFRelease(v29);
    v55 = v27;
    v54 = +[LSApplicationProxy applicationProxyForBundleURL:v27];
    v33 = [v54 sdkVersion];
    id v34 = [v33 compare:@"8.0" options:64];

    if (v34 == (id)-1)
    {
      objc_opt_class();
      v45 = v53;
      if (objc_opt_isKindOfClass()) {
        id v46 = v53;
      }
      else {
        id v46 = [v53 mutableCopy];
      }
      v35 = v46;
      objc_msgSend(v46, "setObject:forKeyedSubscript:", BRUbiquitousContainerSupportedFolderOne, BRContainerSupportedFolderLevels, v53);
    }
    else
    {
      v35 = v53;
    }
    v47 = brc_bread_crumbs();
    v48 = brc_default_log();
    v27 = v55;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      v50 = v35;
      id v51 = [v35 count];
      id v52 = [v32 count];
      *(_DWORD *)buf = 138413058;
      v58 = self;
      __int16 v59 = 2048;
      id v60 = v51;
      v35 = v50;
      v27 = v55;
      __int16 v61 = 2048;
      id v62 = v52;
      __int16 v63 = 2112;
      v64 = v47;
      _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%ld properties, %ld bundleIcons, nil)%@", buf, 0x2Au);
    }

    (*((void (**)(id, void *, id, void))v13 + 2))(v13, v35, v32, 0);
  }
  else
  {
    v36 = brc_bread_crumbs();
    v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v58 = v11;
      __int16 v59 = 2112;
      id v60 = v27;
      __int16 v61 = 2112;
      id v62 = v36;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] can't create CFBundle (bundleID: %@, bundleURL: %@)%@", buf, 0x20u);
    }

    v38 = brc_bread_crumbs();
    v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      v49 = +[NSError brc_errorInvalidParameter:@"bundleID" value:v11];
      *(_DWORD *)buf = 138413314;
      v58 = self;
      __int16 v59 = 2112;
      id v60 = 0;
      __int16 v61 = 2112;
      id v62 = 0;
      __int16 v63 = 2112;
      v64 = v49;
      __int16 v65 = 2112;
      v66 = v38;
      _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@, %@)%@", buf, 0x34u);
    }
    id v32 = +[NSError brc_errorInvalidParameter:@"bundleID" value:v11];
    (*((void (**)(id, void, void, id))v13 + 2))(v13, 0, 0, v32);
  }

LABEL_20:
}

- (void)extractMetadataForContainerID:(id)a3 bundleID:(id)a4 minimumBundleVersion:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  memset(v26, 0, sizeof(v26));
  sub_100001D28(0, (uint64_t)"-[BRBundleService extractMetadataForContainerID:bundleID:minimumBundleVersion:reply:]", 160, v26);
  v14 = brc_bread_crumbs();
  v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219522;
    uint64_t v28 = v26[0];
    __int16 v29 = 2112;
    v30 = self;
    __int16 v31 = 2080;
    id v32 = "-[BRBundleService extractMetadataForContainerID:bundleID:minimumBundleVersion:reply:]";
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2112;
    id v36 = v11;
    __int16 v37 = 2112;
    id v38 = v12;
    __int16 v39 = 2112;
    v40 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: %s %@, %@, %@%@", buf, 0x48u);
  }

  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042B8);
  }
  v16 = qword_1000087A0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100002AC8;
  v21[3] = &unk_1000042E0;
  v21[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(v16, v21);

  sub_100001EFC(v26);
}

- (id)_findURLForBundleID:(id)a3
{
  v3 = +[LSApplicationProxy applicationProxyForIdentifier:a3];
  v4 = [v3 bundleURL];

  return v4;
}

@end