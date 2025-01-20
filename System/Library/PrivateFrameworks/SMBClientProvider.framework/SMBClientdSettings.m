@interface SMBClientdSettings
- (BOOL)load:(id *)a3;
- (BOOL)save:(id *)a3;
- (NSDictionary)servers;
- (SMBClientdSettings)init;
- (id)addShares:(id)a3 atServer:(id)a4 serverDomainName:(id *)a5 service:(id)a6;
- (id)ejectVolumeForURL:(id)a3 share:(id)a4 how:(int)a5;
- (id)findNewMountNumber:(unsigned int *)a3 error:(id *)a4;
- (id)getPasswordForIdentifier:(id)a3 error:(id *)a4;
- (id)internalAddShare:(id)a3 server:(id)a4 password:(id)a5 service:(id)a6 displayName:(id)a7 storageName:(id)a8 existingTags:(id)a9 flags:(unsigned int)a10;
- (id)removeServer:(id)a3;
- (id)storageStringForMountNumber:(unsigned int)a3;
- (void)calculateSet;
- (void)initFresh;
- (void)reconstituteWithService:(id)a3;
@end

@implementation SMBClientdSettings

- (void)initFresh
{
  v3 = (NSMutableDictionary *)objc_opt_new();
  servers = self->_servers;
  self->_servers = v3;

  self->_mountNumbers = (NSMutableSet *)objc_opt_new();
  _objc_release_x1();
}

- (SMBClientdSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)SMBClientdSettings;
  v2 = [(SMBClientdSettings *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SMBClientdSettings *)v2 initFresh];
  }
  return v3;
}

- (NSDictionary)servers
{
  id v2 = [(NSMutableDictionary *)self->_servers copy];
  return (NSDictionary *)v2;
}

- (void)calculateSet
{
  servers = self->_servers;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10003466C;
  v3[3] = &unk_10008A100;
  v3[4] = self;
  [(NSMutableDictionary *)servers enumerateKeysAndObjectsUsingBlock:v3];
}

- (BOOL)load:(id *)a3
{
  id v20 = 0;
  objc_super v5 = sub_10003486C(&v20);
  [(SMBClientdSettings *)self initFresh];
  if (!v5)
  {
    v9 = [v20 URLByAppendingPathComponent:@"settings.plist"];
    id v10 = v20;
    id v20 = v9;

    v11 = +[NSFileManager defaultManager];
    v12 = [v20 path];
    unsigned int v13 = [v11 fileExistsAtPath:v12];

    if (v13)
    {
      id v19 = 0;
      v8 = +[NSDictionary dictionaryWithContentsOfURL:v20 error:&v19];
      id v14 = v19;
      objc_super v5 = v14;
      if (v14 || !v8)
      {
        if (!a3)
        {
          BOOL v7 = 0;
          goto LABEL_12;
        }
        id v6 = v14;
        objc_super v5 = v6;
        BOOL v7 = 0;
        goto LABEL_4;
      }
      v15 = [v8 objectForKeyedSubscript:@"servers"];
      v16 = (NSMutableDictionary *)[v15 mutableCopy];
      servers = self->_servers;
      self->_servers = v16;

      [(SMBClientdSettings *)self calculateSet];
      objc_super v5 = 0;
    }
    else
    {
      objc_super v5 = 0;
      v8 = 0;
    }
    BOOL v7 = 1;
    goto LABEL_12;
  }
  if (!a3)
  {
    BOOL v7 = 0;
    v8 = 0;
    goto LABEL_12;
  }
  id v6 = v5;
  objc_super v5 = v6;
  BOOL v7 = 0;
  v8 = 0;
LABEL_4:
  *a3 = v6;
LABEL_12:

  return v7;
}

- (BOOL)save:(id *)a3
{
  id v16 = 0;
  objc_super v5 = sub_10003486C(&v16);
  if (v5)
  {
    id v6 = v5;
    if (a3)
    {
      id v6 = v5;
      BOOL v7 = 0;
      *a3 = v6;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    v8 = [v16 URLByAppendingPathComponent:@"settings.plist"];
    id v9 = v16;
    id v16 = v8;

    if ([(NSMutableDictionary *)self->_servers count])
    {
      servers = self->_servers;
      CFStringRef v17 = @"servers";
      v18 = servers;
      v11 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      id v14 = 0;
      [v11 writeToURL:v16 error:&v14];
      id v6 = v14;
      BOOL v7 = v6 == 0;
    }
    else
    {
      v12 = +[NSFileManager defaultManager];
      id v15 = 0;
      [v12 removeItemAtURL:v16 error:&v15];
      id v6 = v15;

      if (v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error deleting preference file: %@", buf, 0xCu);
      }
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (id)internalAddShare:(id)a3 server:(id)a4 password:(id)a5 service:(id)a6 displayName:(id)a7 storageName:(id)a8 existingTags:(id)a9 flags:(unsigned int)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  unsigned int v39 = 0;
  v22 = +[smbMount smbMountFromServerURL:v16 shareName:v15 password:v17 result:&v39];
  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000594BC((int *)&v39, (uint64_t)v15);
    }
    id v26 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:v39];
    goto LABEL_9;
  }
  v23 = (void *)os_transaction_create();
  [v22 setTransaction:v23];

  v24 = +[LiveFSClient interfaceForListeners];
  v25 = [v18 addVolume:v20 usingInterface:v24 connectionClass:objc_opt_class() queue:0 proxy:v22 description:v20];

  if (v25)
  {
    [v22 setTransaction:0];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000595BC();
    }
    id v26 = v25;
LABEL_9:
    id v27 = v26;
    goto LABEL_44;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v20;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "internalAddShare: addVolume returned success for share: %@ desc: %@ ", buf, 0x16u);
  }
  v28 = [@"com.apple.filesystems.smbclientd" stringByAppendingPathComponent:v20];
  v29 = v28;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v45 = 0;
  if (v21)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10003532C;
    v36[3] = &unk_10008A128;
    id v37 = v28;
    v38 = buf;
    [v21 enumerateObjectsUsingBlock:v36];
  }
  id v35 = +[LiveFSFPMountClient newClientForProvider:@"com.apple.SMBClientProvider.FileProvider"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v30 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
    *(_DWORD *)v40 = 67109378;
    *(_DWORD *)v41 = v30;
    *(_WORD *)&v41[4] = 2112;
    *(void *)&v41[6] = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "internalAddShare: Got mounter, about to try mounting. isMounted is %d for share: %@", v40, 0x12u);
  }
  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    uint64_t v32 = 130;
LABEL_29:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v40 = 138412802;
      *(void *)v41 = v20;
      *(_WORD *)&v41[8] = 2112;
      *(void *)&v41[10] = v19;
      __int16 v42 = 2112;
      id v43 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "internalAddShare: Added the volume: %@ with displayName: %@ share: %@ to livefiles local mount service, trying to register with fskitd.", v40, 0x20u);
    }
    v31 = [v35 mountVolume:v20 displayName:v19 provider:@"com.apple.SMBClientProvider.FileProvider" on:v29 how:v32];
    if (v31)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v40 = 138412802;
        *(void *)v41 = v31;
        *(_WORD *)&v41[8] = 2112;
        *(void *)&v41[10] = v20;
        __int16 v42 = 2112;
        id v43 = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "internalAddShare: mountVolume returned error %@ for volume: %@ share: %@, about to tear down", v40, 0x20u);
      }
      [v18 removeVolumeLocked:v20];
      [v22 setTransaction:0];
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v40 = 138412290;
          *(void *)v41 = v15;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "internalAddShare: Calling unmountVolume to force/forget share: %@", v40, 0xCu);
        }
        id v33 = [v35 unmountVolume:v29 how:3];
      }
    }
    else
    {
      if (a10)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v40 = 138412290;
          *(void *)v41 = v15;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "internalAddShare: try to create root node for share: %@ ", v40, 0xCu);
        }
        [v22 tryCreateRootNode];
      }
      v31 = 0;
    }
    goto LABEL_43;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v40 = 138412290;
    *(void *)v41 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "internalAddShare: Force-unmounting existing mount for share: %@", v40, 0xCu);
  }
  v31 = [v35 unmountVolume:v29 how:1];
  if (!v31)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v40 = 138412290;
      *(void *)v41 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "internalAddShare: Forced unmount returned success for share: %@", v40, 0xCu);
    }
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      uint64_t v32 = 194;
    }
    else {
      uint64_t v32 = 130;
    }
    goto LABEL_29;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005954C();
  }
  [v18 removeVolumeLocked:v20];
  [v22 setTransaction:0];
LABEL_43:
  id v27 = v31;
  _Block_object_dispose(buf, 8);

LABEL_44:
  return v27;
}

- (id)findNewMountNumber:(unsigned int *)a3 error:(id *)a4
{
  unsigned int v7 = 0;
  do
  {
    uint32_t v8 = arc4random();
    id v9 = +[NSNumber numberWithUnsignedInteger:v8];
    if ([(NSMutableSet *)self->_mountNumbers containsObject:v9])
    {

      id v9 = 0;
    }
    else
    {
      if (a3) {
        *a3 = v8;
      }
      if (a4) {
        *a4 = 0;
      }
    }
    if (v9) {
      break;
    }
  }
  while (v7++ < 9);
  if (!v9)
  {
    v11 = getNSErrorFromLiveFSErrno();
    v12 = v11;
    if (a4) {
      *a4 = v11;
    }
  }
  return v9;
}

- (id)storageStringForMountNumber:(unsigned int)a3
{
  unsigned int v9 = a3;
  v3 = +[NSCharacterSet characterSetWithCharactersInString:@"="];
  v4 = +[NSData dataWithBytes:&v9 length:4];
  objc_super v5 = [v4 base64EncodedStringWithOptions:0];
  id v6 = [v5 stringByTrimmingCharactersInSet:v3];

  unsigned int v7 = [v6 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  return v7;
}

- (id)addShares:(id)a3 atServer:(id)a4 serverDomainName:(id *)a5 service:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unsigned int v13 = [v11 scheme];
  unsigned __int8 v14 = [v13 isEqualToString:@"smb"];

  if ((v14 & 1) == 0)
  {
    a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    goto LABEL_70;
  }
  id v15 = +[NSURLComponents componentsWithURL:v11 resolvingAgainstBaseURL:1];
  id v16 = [v15 user];
  v67 = [v15 host];
  v65 = [v15 password];
  v66 = [v15 port];
  if (v67)
  {
    if (v16)
    {
      id v17 = (id *)[v16 caseInsensitiveCompare:@"GUEST"];
      if (!v17)
      {

        v65 = &stru_10008A998;
      }
      uint64_t v98 = 0;
      v99 = &v98;
      uint64_t v100 = 0x3032000000;
      v101 = sub_100036018;
      uint64_t v94 = 0;
      v95 = &v94;
      uint64_t v96 = 0x2020000000;
      int v97 = 0;
      v102 = sub_100036028;
      id v103 = 0;
      if (v66 && [v66 intValue] == 445) {
        [v15 setPort:0];
      }
      [v15 setPassword:0];
      [v15 setPath:0];
      [v15 setFragment:0];
      [v15 setQuery:0];
      v64 = [v15 URL];
      v61 = [v64 absoluteString];
      uint64_t v18 = sub_100036030(v15);
      id v19 = self;
      objc_sync_enter(v19);
      uint64_t v88 = 0;
      v89 = &v88;
      uint64_t v90 = 0x3032000000;
      v91 = sub_100036018;
      v92 = sub_100036028;
      id v93 = 0;
      v62 = (void *)v18;
      obj = (id *)&v19->super.isa;
      id v20 = [(NSMutableDictionary *)v19->_servers objectForKey:v18];
      id v21 = v20;
      if (v20)
      {
        v22 = [v20 objectForKeyedSubscript:@"user"];
        unsigned __int8 v23 = [v16 isEqualToString:v22];

        if ((v23 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_1000599A4();
          }
          a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
          id v17 = 0;
          int v28 = 0;
          goto LABEL_66;
        }
        if (!v17) {
          goto LABEL_44;
        }
        id v87 = 0;
        id v58 = +[SMBClientdKeychainUtilities getItemForIdentifier:v62 error:&v87];
        id v17 = (id *)v87;
        if (v17)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100059920();
          }
          id v24 = 0;
        }
        else
        {
          id v24 = [objc_alloc((Class)NSString) initWithData:v58 encoding:4];
        }
        v40 = v24;
        if (-[__CFString isEqualToString:](v65, "isEqualToString:"))
        {
LABEL_43:

LABEL_44:
          id v59 = [v21 objectForKeyedSubscript:@"storageName"];
LABEL_45:
          __int16 v42 = objc_opt_new();
          v82[0] = 0;
          v82[1] = v82;
          v82[2] = 0x3032000000;
          v82[3] = sub_100036018;
          v82[4] = sub_100036028;
          id v83 = 0;
          id v43 = [v21 objectForKeyedSubscript:@"shares"];
          [v42 addObjectsFromArray:v43];

          v69[0] = _NSConcreteStackBlock;
          v69[1] = 3221225472;
          v69[2] = sub_1000360C8;
          v69[3] = &unk_10008A150;
          id v57 = v42;
          id v70 = v57;
          v78 = &v88;
          id v21 = v21;
          v79 = v82;
          id v71 = v21;
          v72 = obj;
          id v73 = v64;
          v74 = v65;
          id v75 = v12;
          id v44 = v62;
          id v76 = v44;
          id v60 = v59;
          id v77 = v60;
          v80 = &v98;
          v81 = &v94;
          [v10 enumerateObjectsUsingBlock:v69];
          if (a5) {
            *a5 = v60;
          }
          if (!*((_DWORD *)v95 + 6))
          {
            char v45 = (void *)v99[5];
            if (v45)
            {
              v46 = v45;

              id v17 = v46;
            }
          }
          if (v89[5])
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v47 = v89[5];
              *(_DWORD *)buf = 138412290;
              uint64_t v105 = v47;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Saving new config %@", buf, 0xCu);
            }
            [obj[1] setObject:v89[5] forKey:v44];
            id v68 = 0;
            [obj save:&v68];
            v48 = (id *)v68;
            a5 = v48;
            if (v17) {
              v49 = v17;
            }
            else {
              v49 = v48;
            }
            v50 = v49;

            id v17 = v50;
          }

          _Block_object_dispose(v82, 8);
          int v28 = 1;
          goto LABEL_66;
        }
        v41 = [(__CFString *)v65 dataUsingEncoding:4];
        v86 = v17;
        unsigned __int8 v55 = +[SMBClientdKeychainUtilities addItem:v41 forIdentifier:v62 error:&v86];
        v56 = v86;

        if (v55)
        {
          id v17 = v56;
          goto LABEL_43;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_1000598A4();
        }
        id v17 = v56;

LABEL_65:
        int v28 = 0;
        a5 = v17;
LABEL_66:
        _Block_object_dispose(&v88, 8);

        objc_sync_exit(obj);
        if (v28) {
          a5 = v17;
        }
        _Block_object_dispose(&v94, 8);
        _Block_object_dispose(&v98, 8);

        goto LABEL_69;
      }
      LODWORD(v82[0]) = 0;
      id v85 = 0;
      v25 = [obj findNewMountNumber:v82 error:&v85];
      id v26 = v85;
      if (!v25)
      {
        BOOL v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v29) {
          sub_10005970C(v29, v30, v31, v32, v33, v34, v35, v36);
        }
        id v17 = (id *)v26;
        goto LABEL_64;
      }
      id v59 = [obj storageStringForMountNumber:LODWORD(v82[0])];
      id v27 = [v12 addVolumeCluster:v59];

      if (v27)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100059834();
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_1000597B8();
        }
        id v37 = [(__CFString *)v65 dataUsingEncoding:4];
        id v84 = 0;
        unsigned __int8 v38 = +[SMBClientdKeychainUtilities addItem:v37 forIdentifier:v62 error:&v84];
        id v39 = v84;

        if ((v38 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100059748();
          }
          id v17 = (id *)v39;

          goto LABEL_64;
        }
        id v27 = +[LiveFSFPMountClient locallyBuildFPDomain:v59 displayName:v62 provider:@"com.apple.SMBClientProvider.FileProvider" how:1];

        if (!v27)
        {
          v106[0] = @"mountNumber";
          v106[1] = @"shares";
          v107[0] = v25;
          v107[1] = &__NSArray0__struct;
          v106[2] = @"storageName";
          v106[3] = @"url";
          v107[2] = v59;
          v107[3] = v61;
          v106[4] = @"user";
          v107[4] = v16;
          id v21 = +[NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:5];
          id v52 = [v21 mutableCopy];
          v53 = (void *)v89[5];
          v89[5] = (uint64_t)v52;

          v54 = objc_opt_new();
          [(id)v89[5] setObject:v54 forKeyedSubscript:@"shares"];

          id v17 = 0;
          goto LABEL_45;
        }
      }
      id v17 = v27;

LABEL_64:
      id v21 = 0;
      goto LABEL_65;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005969C();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10005962C();
  }
  a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
LABEL_69:

LABEL_70:
  return a5;
}

- (id)removeServer:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_100036018;
  id v21 = sub_100036028;
  id v22 = 0;
  servers = v5->_servers;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100036560;
  v14[3] = &unk_10008A178;
  id v7 = v4;
  id v15 = v7;
  id v16 = &v17;
  [(NSMutableDictionary *)servers enumerateKeysAndObjectsUsingBlock:v14];
  if (v18[5])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v18[5];
      *(_DWORD *)buf = 136315394;
      id v24 = "-[SMBClientdSettings removeServer:]";
      __int16 v25 = 2112;
      uint64_t v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s Remove server entry: %@", buf, 0x16u);
    }
    [(NSMutableDictionary *)v5->_servers removeObjectForKey:v18[5]];
    id v13 = 0;
    [(SMBClientdSettings *)v5 save:&v13];
    id v9 = v13;
    if (v9)
    {
      id v10 = v9;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100059B1C();
      }
    }
    else
    {
      id v12 = 0;
      +[SMBClientdKeychainUtilities removeItemForIdentifier:v7 error:&v12];
      id v10 = v12;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100059AA0();
  }

  _Block_object_dispose(&v17, 8);
  objc_sync_exit(v5);

  return 0;
}

- (void)reconstituteWithService:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  id v20 = 0;
  [(SMBClientdSettings *)v5 load:&v20];
  id v6 = v20;
  if (v6)
  {
    id v7 = v6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100059B98();
    }
  }
  else
  {
    id v8 = +[LiveFSMountClient newClient];
    id v19 = 0;
    id v9 = [v8 allMounts:&v19];
    id v7 = v19;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100036898;
    v17[3] = &unk_10008A1A0;
    id v10 = (id)objc_opt_new();
    id v18 = v10;
    [v9 enumerateObjectsUsingBlock:v17];
    servers = v5->_servers;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100036900;
    v13[3] = &unk_10008A1F0;
    id v14 = v4;
    id v15 = v5;
    id v12 = v10;
    id v16 = v12;
    [(NSMutableDictionary *)servers enumerateKeysAndObjectsUsingBlock:v13];
  }
  objc_sync_exit(v5);
}

- (id)getPasswordForIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSURLComponents componentsWithURL:v5 resolvingAgainstBaseURL:1];
  id v7 = sub_100036030(v6);
  if (a4) {
    *a4 = 0;
  }
  id v12 = 0;
  id v8 = +[SMBClientdKeychainUtilities getItemForIdentifier:v7 error:&v12];
  id v9 = v12;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100059DF8();
      if (a4) {
        goto LABEL_6;
      }
    }
    else if (a4)
    {
LABEL_6:
      id v10 = 0;
      *a4 = v9;
      goto LABEL_10;
    }
    id v10 = 0;
  }
  else
  {
    id v10 = [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
  }
LABEL_10:

  return v10;
}

- (id)ejectVolumeForURL:(id)a3 share:(id)a4 how:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  id v9 = +[NSURLComponents componentsWithURL:a3 resolvingAgainstBaseURL:1];
  id v10 = v9;
  if (!v9)
  {
    BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v22) {
      sub_100059E70(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_16;
  }
  uint64_t v11 = sub_100036030(v9);
  if (!v11)
  {
    BOOL v30 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v30) {
      sub_100059EAC(v30, v31, v32, v33, v34, v35, v36, v37);
    }
LABEL_16:
    id v38 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    goto LABEL_30;
  }
  id v12 = (void *)v11;
  id v13 = [(NSMutableDictionary *)self->_servers objectForKey:v11];
  if (!v13)
  {
    BOOL v39 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v39) {
      sub_100059EE8(v39, v40, v41, v42, v43, v44, v45, v46);
    }
    id v38 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    goto LABEL_23;
  }
  id v14 = v13;
  id v15 = [v13 objectForKeyedSubscript:@"storageName"];
  id v16 = +[NSString stringWithFormat:@"%@%@", v15, v8];
  uint64_t v17 = [@"com.apple.filesystems.smbclientd" stringByAppendingPathComponent:v16];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10005A0BC();
  }
  id v18 = +[LiveFSMountClient newClient];
  if (!v18)
  {
    BOOL v47 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v47) {
      sub_100059F24(v47, v48, v49, v50, v51, v52, v53, v54);
    }
    id v38 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];

LABEL_23:
    goto LABEL_30;
  }
  id v19 = v18;
  id v57 = v15;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10005A040();
  }
  uint64_t v20 = [v19 unmountVolume:v17 how:v5];
  if (v20)
  {
    id v21 = (id)v20;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100059FD0();
    }
  }
  else if ((v5 & 2) != 0)
  {
    unsigned __int8 v55 = [v14 objectForKeyedSubscript:@"shares"];
    [v55 removeObject:v8];

    id v58 = 0;
    [(SMBClientdSettings *)self save:&v58];
    id v21 = v58;
    if (v21 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100059F60();
    }
  }
  else
  {
    id v21 = 0;
  }
  id v38 = v21;

LABEL_30:
  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountNumbers, 0);
  objc_storeStrong((id *)&self->_servers, 0);
}

@end