@interface SMBFileProviderExtension
- (SMBFileProviderExtension)init;
- (id)clusterDomainItemsOrError:(id *)a3;
@end

@implementation SMBFileProviderExtension

- (SMBFileProviderExtension)init
{
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v3) {
    sub_1000034B8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  [(SMBFileProviderExtension *)self setClusterDomain:1];
  v15.receiver = self;
  v15.super_class = (Class)SMBFileProviderExtension;
  v11 = [(SMBFileProviderExtension *)&v15 init];
  if (v11)
  {
    *(void *)&v11->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_ItemClass] = objc_opt_class();
    *(void *)&v11->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_EnumeratorClass] = objc_opt_class();
    v12 = *(void **)&v11->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_connectionURL];
    *(void *)&v11->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_connectionURL] = @"machp://com.apple.filesystems.smbclientd";

    v13 = *(void **)&v11->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_providerName];
    *(void *)&v11->LiveFSFPExtensionHelper_opaque[OBJC_IVAR___LiveFSFPExtensionHelper_providerName] = @"com.apple.filesystems.smbclientd";
  }
  return v11;
}

- (id)clusterDomainItemsOrError:(id *)a3
{
  uint64_t v5 = objc_opt_new();
  uint64_t v6 = self;
  objc_sync_enter(v6);
  if ([(SMBFileProviderExtension *)v6 _hasManagerOrError:a3])
  {
    objc_sync_exit(v6);

    uint64_t v7 = [(SMBFileProviderExtension *)v6 domain];
    if (v7
      && ([(SMBFileProviderExtension *)v6 domain],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          [v8 identifier],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v7,
          v9))
    {
      uint64_t v10 = [(SMBFileProviderExtension *)v6 domain];
      v11 = [v10 identifier];

      id v12 = [v11 length];
      v13 = livefs_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000036D8((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);
      }

      v20 = [(SMBFileProviderExtension *)v6 manager];
      id v49 = 0;
      v21 = [v20 volumes:&v49];
      id v22 = v49;

      v23 = livefs_std_log();
      v24 = v23;
      if (v22)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_100003650((uint64_t)v21, (uint64_t)v22, v24);
        }

        id v25 = v22;
        v26 = livefs_std_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_1000035AC((uint64_t)a3, (uint64_t)v25, v26);
        }

        if (a3) {
          *a3 = v25;
        }
      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v51 = "-[SMBFileProviderExtension clusterDomainItemsOrError:]";
          __int16 v52 = 2112;
          v53 = v21;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: vols %@", buf, 0x16u);
        }

        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_100003338;
        v45[3] = &unk_100004168;
        id v46 = v11;
        id v48 = v12;
        id v47 = v5;
        [v21 enumerateKeysAndObjectsUsingBlock:v45];

        id v25 = v46;
      }

      id v35 = v5;
    }
    else
    {
      v36 = livefs_std_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_100003534(v36, v37, v38, v39, v40, v41, v42, v43);
      }

      *a3 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:22];
      id v35 = &__NSArray0__struct;
    }
  }
  else
  {
    BOOL v27 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v27) {
      sub_100003744(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    objc_sync_exit(v6);

    id v35 = 0;
  }

  return v35;
}

@end