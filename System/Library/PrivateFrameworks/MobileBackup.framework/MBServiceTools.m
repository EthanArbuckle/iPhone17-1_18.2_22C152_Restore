@interface MBServiceTools
+ (id)toolsWithSettingsContext:(id)a3;
- (BOOL)_extractFileID:(id)a3 toPath:(id)a4 progress:(id)a5 error:(id *)a6;
- (BOOL)_extractItemFromDomainName:(id)a3 relativePath:(id)a4 toPath:(id)a5 progress:(id)a6 error:(id *)a7;
- (BOOL)addFileToDomainName:(id)a3 relativePath:(id)a4 fromPath:(id)a5 progress:(id)a6 error:(id *)a7;
- (BOOL)deleteItemFromDomainName:(id)a3 relativePath:(id)a4 error:(id *)a5;
- (BOOL)extractFileID:(id)a3 toPath:(id)a4 progress:(id)a5 error:(id *)a6;
- (BOOL)extractItemFromDomainName:(id)a3 relativePath:(id)a4 toPath:(id)a5 progress:(id)a6 error:(id *)a7;
- (MBServiceTools)initWithSettingsContext:(id)a3;
- (id)_addFileToDomainName:(id)a3 relativePath:(id)a4 fromPath:(id)a5 progress:(id)a6;
- (id)_deleteItemFromDomainName:(id)a3 relativePath:(id)a4;
- (id)account;
- (id)backupUDID;
- (unint64_t)snapshotID;
- (void)close;
- (void)dealloc;
- (void)open;
@end

@implementation MBServiceTools

+ (id)toolsWithSettingsContext:(id)a3
{
  v3 = [[MBServiceTools alloc] initWithSettingsContext:a3];
  return v3;
}

- (MBServiceTools)initWithSettingsContext:(id)a3
{
  id v5 = [a3 account];
  v8.receiver = self;
  v8.super_class = (Class)MBServiceTools;
  v6 = [(MBServiceTools *)&v8 init];
  if (v6)
  {
    v6->_settingsContext = (MBServiceSettingsContext *)a3;
    v6->_domainManager = (MBDomainManager *)objc_msgSend(objc_alloc((Class)MBDomainManager), "initWithPersona:", objc_msgSend(v5, "persona"));
    v6->_cache = -[MBServiceCache initWithPath:domainManager:]([MBServiceCache alloc], "initWithPath:domainManager:", [a3 cachePath], v6->_domainManager);
    v6->_encryptionManager = [[MBServiceEncryptionManager alloc] initWithSettingsContext:a3];
    v6->_service = [[MBService alloc] initWithAccount:v5];
    v6->_chunkStore = (MBChunkStore *)objc_msgSend(v5, "createChunkStoreWithPath:", -[MBServiceSettingsContext chunkStorePath](v6->_settingsContext, "chunkStorePath"));
  }
  return v6;
}

- (void)dealloc
{
  [(MBServiceTools *)self close];

  v3.receiver = self;
  v3.super_class = (Class)MBServiceTools;
  [(MBServiceTools *)&v3 dealloc];
}

- (id)account
{
  return [(MBServiceSettingsContext *)self->_settingsContext account];
}

- (id)backupUDID
{
  return [(MBServiceSettingsContext *)self->_settingsContext backupUDID];
}

- (unint64_t)snapshotID
{
  return [(MBServiceSettingsContext *)self->_settingsContext snapshotID];
}

- (void)open
{
  [(MBServiceCache *)self->_cache open];
  chunkStore = self->_chunkStore;
  [(MBChunkStore *)chunkStore open];
}

- (void)close
{
  [(MBServiceCache *)self->_cache close];
  [(MBChunkStore *)self->_chunkStore close];
  [(MBChunkStore *)self->_chunkStore remove];
  chunkStore = self->_chunkStore;
  [(MBChunkStore *)chunkStore destroy];
}

- (BOOL)_extractItemFromDomainName:(id)a3 relativePath:(id)a4 toPath:(id)a5 progress:(id)a6 error:(id *)a7
{
  objc_super v8 = (void (**)(id, double))a6;
  [(MBChunkStoreProgressModel *)[(MBChunkStore *)self->_chunkStore progressModel] setBlock:a6];
  [(MBChunkStoreProgressModel *)[(MBChunkStore *)self->_chunkStore progressModel] setMaxProgress:1.0];
  if (![(MBServiceTools *)self account])
  {
    if (!a7) {
      goto LABEL_120;
    }
    CFStringRef v22 = @"No account";
    uint64_t v23 = 210;
LABEL_96:
    v71 = +[MBError errorWithCode:v23 format:v22];
    LOBYTE(v14) = 0;
    *a7 = v71;
    return (char)v14;
  }
  if (![a4 length])
  {
    if (!a7) {
      goto LABEL_120;
    }
    CFStringRef v22 = @"Relative path is empty";
    uint64_t v23 = 1;
    goto LABEL_96;
  }
  id v110 = [(MBDomainManager *)self->_domainManager domainForName:a3];
  if (!v110)
  {
    if (a7)
    {
      CFStringRef v22 = @"Domain not found";
LABEL_18:
      uint64_t v23 = 4;
      goto LABEL_96;
    }
LABEL_120:
    LOBYTE(v14) = 0;
    return (char)v14;
  }
  LODWORD(v14) = [(MBServiceCache *)self->_cache refreshForBackupUDID:[(MBServiceTools *)self backupUDID] service:self->_service deleted:0 error:a7];
  if (!v14) {
    return (char)v14;
  }
  id v15 = [(MBServiceCache *)self->_cache backupForUDID:[(MBServiceTools *)self backupUDID] lastModified:0];
  if (!v15)
  {
    if (!a7) {
      goto LABEL_120;
    }
    CFStringRef v22 = @"Backup not found";
    goto LABEL_95;
  }
  v16 = v15;
  unint64_t v17 = [(MBServiceTools *)self snapshotID];
  id v18 = [v16 snapshotsCount];
  if (!v17)
  {
    if (v18)
    {
      SEL v102 = a2;
      v19 = (char *)[v16 snapshotsCount] - 1;
      id v20 = objc_msgSend(objc_msgSend(v16, "snapshots"), "lastObject");
      goto LABEL_24;
    }
    if (!a7) {
      goto LABEL_120;
    }
    CFStringRef v22 = @"Backup has no snapshots";
LABEL_95:
    uint64_t v23 = 204;
    goto LABEL_96;
  }
  SEL v102 = a2;
  if (!v18) {
    goto LABEL_89;
  }
  v19 = 0;
  while (1)
  {
    id v20 = [v16 snapshotAtIndex:v19];
    unsigned int v21 = [v20 snapshotID];
    if ((id)[(MBServiceTools *)self snapshotID] == (id)v21) {
      break;
    }
    if (++v19 >= [v16 snapshotsCount]) {
      goto LABEL_89;
    }
  }
  if (!v20)
  {
LABEL_89:
    if (!a7) {
      goto LABEL_120;
    }
    CFStringRef v22 = @"Snapshot not found";
    goto LABEL_95;
  }
LABEL_24:
  if (![v20 committed])
  {
    if (!a7) {
      goto LABEL_120;
    }
    CFStringRef v22 = @"Snapshot is not committed";
    goto LABEL_95;
  }
  v24 = MBGetDefaultLog();
  id v101 = a5;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    unsigned int v106 = [v20 snapshotID];
    +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v20 committed]);
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)v128 = v106;
    *(_WORD *)&v128[4] = 2112;
    *(void *)&v128[6] = MBStringWithDate();
    *(_WORD *)&v128[14] = 2112;
    *(void *)&v128[16] = objc_msgSend(objc_msgSend(v20, "attributes"), "deviceName");
    *(_WORD *)&v128[24] = 2112;
    *(void *)&v128[26] = objc_msgSend(objc_msgSend(v16, "attributes"), "productType");
    __int16 v129 = 2112;
    id v130 = objc_msgSend(objc_msgSend(v20, "attributes"), "buildVersion");
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Snapshot %u, %@, %@, %@, %@)", buf, 0x30u);
    id v107 = [v20 snapshotID];
    +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v20 committed]);
    uint64_t v25 = MBStringWithDate();
    id v26 = objc_msgSend(objc_msgSend(v20, "attributes"), "deviceName");
    id v92 = objc_msgSend(objc_msgSend(v16, "attributes"), "productType");
    id v93 = objc_msgSend(objc_msgSend(v20, "attributes"), "buildVersion");
    uint64_t v87 = v25;
    id v90 = v26;
    a5 = v101;
    id v84 = v107;
    _MBLog();
  }
  id v27 = +[NSMutableArray array];
  id v28 = +[NSMutableSet set];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id obj = objc_msgSend(objc_msgSend(objc_msgSend(v16, "snapshots"), "subarrayWithRange:", 0, v19 + 1), "reverseObjectEnumerator");
  id v105 = a4;
  id v97 = [obj countByEnumeratingWithState:&v119 objects:v126 count:16];
  if (v97)
  {
    uint64_t v29 = *(void *)v120;
    uint64_t v95 = *(void *)v120;
    v96 = a7;
    v94 = v8;
    v108 = v27;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v120 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v103 = v30;
        uint64_t v31 = [*(id *)(*((void *)&v119 + 1) + 8 * v30) snapshotID];
        id v32 = [(MBServiceCache *)self->_cache fileIDEnumeratorForSnapshotID:v31 backupUDID:[(MBServiceTools *)self backupUDID]];
        long long v115 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        long long v118 = 0u;
        id v33 = [v32 countByEnumeratingWithState:&v115 objects:v125 count:16];
        if (!v33) {
          goto LABEL_49;
        }
        id v34 = v33;
        uint64_t v35 = *(void *)v116;
        while (2)
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v116 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v115 + 1) + 8 * i);
            if (([v28 containsObject:v37] & 1) == 0)
            {
              id v38 = [(MBServiceCache *)self->_cache fileForID:v37 snapshotID:v31 backupUDID:[(MBServiceTools *)self backupUDID]];
              if (!v38) {
                [+[NSAssertionHandler currentHandler] handleFailureInMethod:v102 object:self file:@"MBServiceTools.m" lineNumber:155 description:@"File not found"];
              }
              if (objc_msgSend(objc_msgSend(v38, "domain"), "isEqualToDomain:", v110)
                && objc_msgSend(objc_msgSend(v38, "relativePath"), "hasPrefix:", a4))
              {
                if ([v38 encryptionKey])
                {
                  v72 = v96;
                  if (!v96) {
                    goto LABEL_120;
                  }
                  v14 = +[MBError errorWithCode:1 path:a4 format:@"Extracting protected files is unsupported"];
LABEL_101:
                  v73 = v14;
                  LOBYTE(v14) = 0;
                  id *v72 = v73;
                  return (char)v14;
                }
                if ((unint64_t)[v108 count] >= 0x64)
                {
                  v72 = v96;
                  if (!v96) {
                    goto LABEL_120;
                  }
                  v14 = +[MBError errorWithCode:1 format:@"Too many files"];
                  goto LABEL_101;
                }
                if ([v38 isRegularFile])
                {
                  v39 = [(MBChunkStore *)self->_chunkStore progressModel];
                  id v40 = [v38 size];
                  v41 = v39;
                  a4 = v105;
                  [(MBChunkStoreProgressModel *)v41 willTransferItemWithSize:v40];
                }
                [v108 addObject:v38];
                [v28 addObject:v37];
              }
            }
          }
          id v34 = [v32 countByEnumeratingWithState:&v115 objects:v125 count:16];
          if (v34) {
            continue;
          }
          break;
        }
LABEL_49:
        uint64_t v30 = v103 + 1;
        a7 = v96;
        objc_super v8 = v94;
        uint64_t v29 = v95;
        a5 = v101;
        id v27 = v108;
      }
      while ((id)(v103 + 1) != v97);
      id v97 = [obj countByEnumeratingWithState:&v119 objects:v126 count:16];
    }
    while (v97);
  }
  if (![v27 count])
  {
    if (a7)
    {
      CFStringRef v22 = @"File not found";
      goto LABEL_18;
    }
    goto LABEL_120;
  }
  [v27 sortUsingComparator:&stru_100417E10];
  v8[2](v8, 0.0);
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id v42 = [v27 countByEnumeratingWithState:&v111 objects:v124 count:16];
  if (v42)
  {
    id v43 = v42;
    uint64_t v44 = *(void *)v112;
    id v109 = v27;
    uint64_t v98 = *(void *)v112;
    while (2)
    {
      v45 = 0;
      id obja = v43;
      do
      {
        if (*(void *)v112 != v44) {
          objc_enumerationMutation(v27);
        }
        v46 = *(void **)(*((void *)&v111 + 1) + 8 * (void)v45);
        if (([v46 isDeleted] & 1) == 0)
        {
          id v47 = objc_alloc_init((Class)NSAutoreleasePool);
          id v104 = objc_msgSend(a5, "stringByAppendingString:", objc_msgSend(objc_msgSend(v46, "relativePath"), "substringFromIndex:", objc_msgSend(a4, "length")));
          v48 = MBGetDefaultLog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            id v49 = [v46 typeString];
            id v50 = [v46 relativePath];
            *(_DWORD *)buf = 138412802;
            *(void *)v128 = v49;
            *(_WORD *)&v128[8] = 2112;
            *(void *)&v128[10] = v50;
            *(_WORD *)&v128[18] = 2112;
            *(void *)&v128[20] = v104;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Extracting %@ %@ to %@", buf, 0x20u);
            id v51 = [v46 typeString];
            id v88 = [v46 relativePath];
            id v91 = v104;
            id v27 = v109;
            id v85 = v51;
            _MBLog();
          }
          if (objc_msgSend(v46, "isRegularFile", v85, v88, v91) && !objc_msgSend(v46, "size"))
          {
            v68 = MBGetDefaultLog();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
            {
              id v69 = [v46 description];
              id v70 = [v46 fileID];
              *(_DWORD *)buf = 138412546;
              *(void *)v128 = v69;
              *(_WORD *)&v128[8] = 2112;
              *(void *)&v128[10] = v70;
              _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Restoring empty regular file: %@ (%@)", buf, 0x16u);
              id v86 = [v46 description];
              id v89 = [v46 fileID];
              _MBLog();
            }
            id v61 = objc_msgSend(v46, "restoreEmptyRegularFileAtPath:settingAttributes:", v104, 1, v86, v89);
            a4 = v105;
            if (v61)
            {
LABEL_104:
              if (a7)
              {
                v74 = v61;
                *a7 = v61;
              }
              else
              {
                v74 = 0;
              }
              id v78 = v74;
              [v47 drain];
              v79 = (MBError *)v74;
              goto LABEL_119;
            }
          }
          else if ([v46 isRegularFile])
          {
            id v52 = [v46 fileID];
            v123 = +[MBSFileID fileIDWithMBFileID:v52];
            id v53 = -[MBService getFileIDs:backupUDID:snapshotID:lastModified:error:](self->_service, "getFileIDs:backupUDID:snapshotID:lastModified:error:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v123, 1), -[MBServiceTools backupUDID](self, "backupUDID"), [v46 snapshotID], 0, a7);
            if (!v53) {
              goto LABEL_106;
            }
            v54 = v53;
            if (![v53 count])
            {
              if (a7)
              {
                v76 = +[MBError errorWithCode:4 format:@"File auth token not returned by service"];
                goto LABEL_112;
              }
LABEL_117:
              v77 = 0;
LABEL_118:
              v81 = v77;
              [v47 drain];
              v79 = v77;
LABEL_119:
              v82 = v79;
              goto LABEL_120;
            }
            id v55 = objc_msgSend(objc_msgSend(v54, "lastObject"), "authToken");
            id v56 = +[MBChunkStoreBatch batch];
            v57 = +[MBChunkStoreItem chunkStoreItemWithFileID:v52 domain:v110 path:v104];
            -[MBChunkStoreItem setSignature:](v57, "setSignature:", [v46 digest]);
            -[MBChunkStoreItem setSize:](v57, "setSize:", [v46 size]);
            [(MBChunkStoreItem *)v57 setAuthToken:v55];
            [v56 addItem:v57];
            if (![(MBChunkStore *)self->_chunkStore getBatch:v56 error:a7])
            {
LABEL_106:
              if (a7) {
                id v75 = *a7;
              }
              else {
                id v75 = 0;
              }
              id v80 = v75;
              [v47 drain];
              v79 = (MBError *)v75;
              goto LABEL_119;
            }
            if ([(MBChunkStoreItem *)v57 error])
            {
              if (!a7) {
                goto LABEL_117;
              }
              v76 = [(MBChunkStoreItem *)v57 error];
LABEL_112:
              v77 = v76;
              *a7 = v76;
              goto LABEL_118;
            }
            v58 = MBGetDefaultLog();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              id v59 = [v46 description];
              id v60 = [v46 fileID];
              *(_DWORD *)buf = 138412546;
              *(void *)v128 = v59;
              *(_WORD *)&v128[8] = 2112;
              *(void *)&v128[10] = v60;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Restoring regular file: %@ (%@)", buf, 0x16u);
              id v86 = [v46 description];
              id v89 = [v46 fileID];
              _MBLog();
            }
            id v61 = objc_msgSend(v46, "restoreRegularFileAtPath:settingAttributes:", v104, 1, v86, v89);
            a4 = v105;
            a5 = v101;
            if (v61) {
              goto LABEL_104;
            }
          }
          else
          {
            a4 = v105;
            if ([v46 isDirectory])
            {
              v62 = MBGetDefaultLog();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                id v63 = [v46 description];
                id v64 = [v46 fileID];
                *(_DWORD *)buf = 138412546;
                *(void *)v128 = v63;
                *(_WORD *)&v128[8] = 2112;
                *(void *)&v128[10] = v64;
                _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Restoring directory: %@ (%@)", buf, 0x16u);
                id v86 = [v46 description];
                id v89 = [v46 fileID];
                a4 = v105;
                _MBLog();
              }
              id v61 = objc_msgSend(v46, "restoreDirectoryAtPath:settingDataProtection:settingOwnershipAndFlags:", v104, 1, 1, v86, v89);
              if (v61) {
                goto LABEL_104;
              }
            }
            else
            {
              if (([v46 isSymbolicLink] & 1) == 0) {
                [+[NSAssertionHandler currentHandler] handleFailureInMethod:v102 object:self file:@"MBServiceTools.m" lineNumber:251 description:@"Unexpected file type"];
              }
              v65 = MBGetDefaultLog();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
              {
                id v66 = [v46 description];
                id v67 = [v46 fileID];
                *(_DWORD *)buf = 138412546;
                *(void *)v128 = v66;
                *(_WORD *)&v128[8] = 2112;
                *(void *)&v128[10] = v67;
                _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Restoring symbolic link: %@ (%@)", buf, 0x16u);
                id v86 = [v46 description];
                id v89 = [v46 fileID];
                a4 = v105;
                _MBLog();
              }
              id v61 = objc_msgSend(v46, "restoreSymbolicLinkAtPath:withTarget:settingOwnershipAndFlags:", v104, objc_msgSend(v46, "target", v86, v89), 1);
              if (v61) {
                goto LABEL_104;
              }
            }
          }
          [v47 drain];
          uint64_t v44 = v98;
          id v43 = obja;
        }
        v45 = (char *)v45 + 1;
      }
      while (v43 != v45);
      id v43 = [v27 countByEnumeratingWithState:&v111 objects:v124 count:16];
      if (v43) {
        continue;
      }
      break;
    }
  }
  v8[2](v8, 1.0);
  LOBYTE(v14) = 1;
  return (char)v14;
}

- (BOOL)extractItemFromDomainName:(id)a3 relativePath:(id)a4 toPath:(id)a5 progress:(id)a6 error:(id *)a7
{
  id v28 = 0;
  id v13 = objc_alloc_init((Class)NSAutoreleasePool);
  v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v30 = a3;
    __int16 v31 = 2112;
    id v32 = a4;
    __int16 v33 = 2112;
    id v34 = [(MBServiceTools *)self backupUDID];
    __int16 v35 = 2048;
    unint64_t v36 = [(MBServiceTools *)self snapshotID];
    __int16 v37 = 2112;
    id v38 = a5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Extracting %@:%@ from backup %@ and snapshot %lu to %@", buf, 0x34u);
    id v15 = [(MBServiceTools *)self backupUDID];
    unint64_t v26 = [(MBServiceTools *)self snapshotID];
    id v27 = a5;
    id v24 = a4;
    id v25 = v15;
    id v23 = a3;
    _MBLog();
  }
  BOOL v16 = -[MBServiceTools _extractItemFromDomainName:relativePath:toPath:progress:error:](self, "_extractItemFromDomainName:relativePath:toPath:progress:error:", a3, a4, a5, a6, &v28, v23, v24, v25, v26, v27);
  unint64_t v17 = MBGetDefaultLog();
  id v18 = v17;
  if (v16)
  {
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Extract finished", buf, 2u);
  }
  else
  {
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    id v19 = +[MBError descriptionForError:v28];
    *(_DWORD *)buf = 138412290;
    id v30 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Extract failed: %@", buf, 0xCu);
    +[MBError descriptionForError:v28];
  }
  _MBLog();
LABEL_9:
  id v20 = v28;
  [v13 drain];
  id v21 = v28;
  if (a7) {
    *a7 = v28;
  }
  return v16;
}

- (BOOL)_extractFileID:(id)a3 toPath:(id)a4 progress:(id)a5 error:(id *)a6
{
  [(MBChunkStoreProgressModel *)[(MBChunkStore *)self->_chunkStore progressModel] setBlock:a5];
  [(MBChunkStoreProgressModel *)[(MBChunkStore *)self->_chunkStore progressModel] setMaxProgress:1.0];
  uint64_t v29 = self;
  if ([(MBServiceTools *)self account])
  {
    (*((void (**)(id, double))a5 + 2))(a5, 0.0);
    uint64_t v11 = 0;
    v12 = 0;
    for (i = a6; ; a6 = i)
    {
      id v13 = [(MBService *)v29->_service listFilesForBackupUDID:[(MBServiceTools *)v29 backupUDID] snapshotID:[(MBServiceTools *)v29 snapshotID] offset:v11 limit:1000 error:a6];
      if (!v13) {
        return (char)v13;
      }
      v14 = v13;
      if (![(MBError *)v13 count])
      {
        if (!v12) {
          goto LABEL_26;
        }
        goto LABEL_19;
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = [(MBError *)v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v31;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
            if (-[MBFileID isEqualToFileID:](+[MBFileID fileIDWithData:](MBFileID, "fileIDWithData:", [v19 fileID]), "isEqualToFileID:", a3))
            {
              v12 = v19;
            }
          }
          id v16 = [(MBError *)v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v16);
      }
      if ((unint64_t)[(MBError *)v14 count] <= 0x3E7) {
        break;
      }
      v11 += (uint64_t)[(MBError *)v14 count];
    }
    a6 = i;
    if (!v12)
    {
LABEL_26:
      if (!a6) {
        goto LABEL_33;
      }
      CFStringRef v20 = @"File not found";
LABEL_30:
      uint64_t v21 = 4;
      goto LABEL_31;
    }
LABEL_19:
    id v34 = +[MBSFileID fileIDWithMBFileID:a3];
    id v13 = [(MBService *)v29->_service getFileIDs:+[NSArray arrayWithObjects:&v34 count:1] backupUDID:[(MBServiceTools *)v29 backupUDID] snapshotID:[(MBServiceTools *)v29 snapshotID] lastModified:0 error:a6];
    if (!v13) {
      return (char)v13;
    }
    CFStringRef v22 = v13;
    if (![(MBError *)v13 count])
    {
      if (!a6) {
        goto LABEL_33;
      }
      CFStringRef v20 = @"File auth token not returned by service";
      goto LABEL_30;
    }
    id v23 = objc_msgSend(-[MBError lastObject](v22, "lastObject"), "authToken");
    id v24 = +[MBChunkStoreBatch batch];
    id v25 = +[MBChunkStoreItem chunkStoreItemWithFileID:a3 domain:0 path:a4];
    -[MBChunkStoreItem setSignature:](v25, "setSignature:", [v12 signature]);
    -[MBChunkStoreItem setSize:](v25, "setSize:", [v12 size]);
    [(MBChunkStoreItem *)v25 setAuthToken:v23];
    [v24 addItem:v25];
    LODWORD(v13) = [(MBChunkStore *)v29->_chunkStore getBatch:v24 error:a6];
    if (!v13) {
      return (char)v13;
    }
    if (![(MBChunkStoreItem *)v25 error])
    {
      (*((void (**)(double))a5 + 2))(1.0);
      LOBYTE(v13) = 1;
      return (char)v13;
    }
    if (!a6) {
      goto LABEL_33;
    }
    id v13 = [(MBChunkStoreItem *)v25 error];
  }
  else
  {
    if (!a6)
    {
LABEL_33:
      LOBYTE(v13) = 0;
      return (char)v13;
    }
    CFStringRef v20 = @"No account";
    uint64_t v21 = 210;
LABEL_31:
    id v13 = +[MBError errorWithCode:v21 format:v20];
  }
  unint64_t v26 = v13;
  LOBYTE(v13) = 0;
  *a6 = v26;
  return (char)v13;
}

- (BOOL)extractFileID:(id)a3 toPath:(id)a4 progress:(id)a5 error:(id *)a6
{
  id v25 = 0;
  id v11 = objc_alloc_init((Class)NSAutoreleasePool);
  v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v27 = a3;
    __int16 v28 = 2112;
    id v29 = [(MBServiceTools *)self backupUDID];
    __int16 v30 = 2048;
    unint64_t v31 = [(MBServiceTools *)self snapshotID];
    __int16 v32 = 2112;
    id v33 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Extracting %@ from backup %@ and snapshot %lu to %@", buf, 0x2Au);
    id v13 = [(MBServiceTools *)self backupUDID];
    unint64_t v23 = [(MBServiceTools *)self snapshotID];
    id v24 = a4;
    id v21 = a3;
    id v22 = v13;
    _MBLog();
  }
  BOOL v14 = -[MBServiceTools _extractFileID:toPath:progress:error:](self, "_extractFileID:toPath:progress:error:", a3, a4, a5, &v25, v21, v22, v23, v24);
  id v15 = MBGetDefaultLog();
  id v16 = v15;
  if (v14)
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Extract finished", buf, 2u);
  }
  else
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    id v17 = +[MBError descriptionForError:v25];
    *(_DWORD *)buf = 138412290;
    id v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Extract failed: %@", buf, 0xCu);
    +[MBError descriptionForError:v25];
  }
  _MBLog();
LABEL_9:
  id v18 = v25;
  [v11 drain];
  id v19 = v25;
  if (a6) {
    *a6 = v25;
  }
  return v14;
}

- (id)_addFileToDomainName:(id)a3 relativePath:(id)a4 fromPath:(id)a5 progress:(id)a6
{
  id v50 = 0;
  id v11 = +[MBFileID fileIDWithDomainName:relativePath:](MBFileID, "fileIDWithDomainName:relativePath:");
  v12 = (const char *)[a5 fileSystemRepresentation];
  [(MBChunkStoreProgressModel *)[(MBChunkStore *)self->_chunkStore progressModel] setBlock:a6];
  [(MBChunkStoreProgressModel *)[(MBChunkStore *)self->_chunkStore progressModel] setMaxProgress:1.0];
  if ([(MBServiceTools *)self account])
  {
    id v13 = [(MBDomainManager *)self->_domainManager domainForName:a3];
    if (v13)
    {
      id v14 = v13;
      if ([a4 length])
      {
        [(MBService *)self->_service setLock:+[MBSLock lockWithState:0 type:0 timeout:600] forBackupUDID:[(MBServiceTools *)self backupUDID]];
        if (![(MBServiceCache *)self->_cache refreshForBackupUDID:[(MBServiceTools *)self backupUDID] service:self->_service deleted:0 error:&v50])return v50; {
        id v15 = [(MBServiceCache *)self->_cache backupForUDID:[(MBServiceTools *)self backupUDID] lastModified:0];
        }
        if (!v15)
        {
          CFStringRef v23 = @"Backup not found";
          uint64_t v24 = 204;
          return +[MBError errorWithCode:v24 format:v23];
        }
        id v16 = v15;
        if ([v15 snapshotsCount])
        {
          id v17 = objc_msgSend(v16, "snapshotAtIndex:", (char *)objc_msgSend(v16, "snapshotsCount") - 1);
          if ([v17 committed])
          {
            id v18 = +[MBChunkStoreItem chunkStoreItemWithFileID:v11 domain:v14 path:a5];
            if ([(MBChunkStore *)self->_chunkStore registerItem:v18 error:&v50])
            {
              [(MBChunkStoreProgressModel *)[(MBChunkStore *)self->_chunkStore progressModel] willTransferItemWithSize:[(MBChunkStoreItem *)v18 size]];
              id v19 = objc_alloc_init(MBSFileAttributes);
              [(MBSFileAttributes *)v19 setProtectionClass:4];
              memset(&v49, 0, sizeof(v49));
              if (lstat(v12, &v49)) {
                return +[MBError posixErrorWithPath:a5 format:@"lstat error"];
              }
              [(MBSFileAttributes *)v19 setStat:&v49];
              id v25 = +[MBExtendedAttributes attributesForPathFSR:v12 error:&v50];
              if (v25)
              {
                [(MBSFileAttributes *)v19 addExtendedAttributesDictionary:v25];
                unint64_t v26 = objc_alloc_init(MBSFile);
                [(MBSFile *)v26 setFileID:[(MBFileID *)v11 data]];
                [(MBSFile *)v26 setDomain:a3];
                [(MBSFile *)v26 setRelativePath:a4];
                [(MBSFile *)v26 setSignature:[(MBChunkStoreItem *)v18 signature]];
                [(MBSFile *)v26 setSize:[(MBChunkStoreItem *)v18 size]];
                [(MBSFile *)v26 setAttributes:v19];
                id v27 = +[MBSSnapshot snapshot];
                [v27 setQuotaReserved:0];
                objc_msgSend(v27, "setAttributes:", +[MBSSnapshotAttributes snapshotAttributes](MBSSnapshotAttributes, "snapshotAttributes"));
                objc_msgSend(objc_msgSend(v17, "attributes"), "copyTo:", objc_msgSend(v27, "attributes"));
                objc_msgSend(objc_msgSend(v27, "attributes"), "setBackupReason:", 1);
                objc_msgSend(objc_msgSend(v27, "attributes"), "setBackupType:", 1);
                uint64_t v48 = 0;
                unsigned int v47 = 0;
                if (![(MBService *)self->_service createSnapshot:v27 backupUDID:[(MBServiceTools *)self backupUDID] lastModified:&v48 error:&v50 snapshotID:&v47])
                {
                  id v35 = [v50 code];
                  id v36 = v50;
                  CFStringRef v37 = @"Error creating snapshot";
                  return +[MBError errorWithCode:v35 error:v36 format:v37];
                }
                [v27 setLastModified:v48];
                __int16 v28 = MBGetDefaultLog();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  unsigned int v54 = v47;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Created snapshot %u", buf, 8u);
                  uint64_t v46 = v47;
                  _MBLog();
                }
                service = self->_service;
                id v52 = v26;
                __int16 v30 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v52, 1, v46);
                id v31 = [(MBServiceTools *)self backupUDID];
                id v32 = [(MBService *)service addFiles:v30 backupUDID:v31 snapshotID:v47 lastModified:0 error:&v50];
                if (!v32)
                {
                  id v35 = [v50 code];
                  id v36 = v50;
                  CFStringRef v37 = @"Error adding file";
                  return +[MBError errorWithCode:v35 error:v36 format:v37];
                }
                -[MBChunkStoreItem setAuthToken:](v18, "setAuthToken:", objc_msgSend(objc_msgSend(v32, "objectAtIndexedSubscript:", 0), "authToken"));
                id v33 = MBGetDefaultLog();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Added file to snapshot", buf, 2u);
                  _MBLog();
                }
                id v34 = +[MBChunkStoreBatch batch];
                [v34 addItem:v18];
                if (![(MBChunkStore *)self->_chunkStore putBatch:v34 error:&v50])
                {
                  id v35 = [v50 code];
                  id v36 = v50;
                  CFStringRef v37 = @"Error putting items into chunk store";
                  return +[MBError errorWithCode:v35 error:v36 format:v37];
                }
                if ([(MBChunkStoreItem *)v18 error])
                {
                  id v35 = [(NSError *)[(MBChunkStoreItem *)v18 error] code];
                  id v36 = v50;
                  CFStringRef v37 = @"Error putting item in chunk store";
                  return +[MBError errorWithCode:v35 error:v36 format:v37];
                }
                id v38 = MBGetDefaultLog();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Added file to chunk store", buf, 2u);
                  _MBLog();
                }
                v39 = objc_alloc_init(MBSFilePutReceipt);
                [(MBSFilePutReceipt *)v39 setFileID:[(MBFileID *)v11 data]];
                [(MBSFilePutReceipt *)v39 setPutReceipt:[(MBChunkStoreItem *)v18 receipt]];
                id v40 = self->_service;
                id v51 = v39;
                v41 = +[NSArray arrayWithObjects:&v51 count:1];
                id v42 = [(MBServiceTools *)self backupUDID];
                id v43 = [(MBService *)v40 commitFilePutReceipts:v41 backupUDID:v42 snapshotID:v47 lastModified:0 error:&v50];
                if (!v43)
                {
                  id v35 = [v50 code];
                  id v36 = v50;
                  CFStringRef v37 = @"Error committing file";
                  return +[MBError errorWithCode:v35 error:v36 format:v37];
                }
                if (objc_msgSend(objc_msgSend(v43, "objectAtIndexedSubscript:", 0), "result"))
                {
                  CFStringRef v23 = @"Committing file failed";
                  goto LABEL_20;
                }
                uint64_t v44 = MBGetDefaultLog();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Committed file", buf, 2u);
                  _MBLog();
                }
                objc_msgSend(-[MBService lockForBackupUDID:](self->_service, "lockForBackupUDID:", -[MBServiceTools backupUDID](self, "backupUDID")), "setState:", 2);
                if ([(MBService *)self->_service commitSnapshotForID:v47 backupUDID:[(MBServiceTools *)self backupUDID] lastModified:0 error:&v50])
                {
                  v45 = MBGetDefaultLog();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Committed snapshot", buf, 2u);
                    _MBLog();
                  }
                  return 0;
                }
              }
            }
            return v50;
          }
          CFStringRef v23 = @"Last snapshot is uncommitted (delete it to add a file)";
        }
        else
        {
          CFStringRef v23 = @"No snapshots in backup to update";
        }
LABEL_20:
        uint64_t v24 = 1;
        return +[MBError errorWithCode:v24 format:v23];
      }
      CFStringRef v21 = @"Relative path is empty";
      uint64_t v22 = 1;
    }
    else
    {
      CFStringRef v21 = @"Domain not found";
      uint64_t v22 = 4;
    }
  }
  else
  {
    CFStringRef v21 = @"No account";
    uint64_t v22 = 210;
  }
  return +[MBError errorWithCode:v22 format:v21];
}

- (BOOL)addFileToDomainName:(id)a3 relativePath:(id)a4 fromPath:(id)a5 progress:(id)a6 error:(id *)a7
{
  id v13 = objc_alloc_init((Class)NSAutoreleasePool);
  id v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v27 = a3;
    __int16 v28 = 2112;
    id v29 = a4;
    __int16 v30 = 2112;
    id v31 = [(MBServiceTools *)self backupUDID];
    __int16 v32 = 2112;
    id v33 = a5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Adding %@:%@ to backup %@ from file at %@", buf, 0x2Au);
    id v24 = [(MBServiceTools *)self backupUDID];
    id v25 = a5;
    id v22 = a3;
    id v23 = a4;
    _MBLog();
  }
  id v15 = -[MBServiceTools _addFileToDomainName:relativePath:fromPath:progress:](self, "_addFileToDomainName:relativePath:fromPath:progress:", a3, a4, a5, a6, v22, v23, v24, v25);
  id v16 = MBGetDefaultLog();
  id v17 = v16;
  if (v15)
  {
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    id v18 = +[MBError descriptionForError:v15];
    *(_DWORD *)buf = 138412290;
    id v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Add failed: %@", buf, 0xCu);
    +[MBError descriptionForError:v15];
  }
  else
  {
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Add finished", buf, 2u);
  }
  _MBLog();
LABEL_9:
  id v19 = v15;
  [v13 drain];
  id v20 = v15;
  if (a7) {
    *a7 = v15;
  }
  return v15 == 0;
}

- (id)_deleteItemFromDomainName:(id)a3 relativePath:(id)a4
{
  id v35 = 0;
  v7 = +[MBFileID fileIDWithDomainName:relativePath:](MBFileID, "fileIDWithDomainName:relativePath:");
  if ([(MBServiceTools *)self account])
  {
    if ([(MBDomainManager *)self->_domainManager domainForName:a3])
    {
      if ([a4 length])
      {
        [(MBService *)self->_service setLock:+[MBSLock lockWithState:0 type:0 timeout:600] forBackupUDID:[(MBServiceTools *)self backupUDID]];
        if (![(MBServiceCache *)self->_cache refreshForBackupUDID:[(MBServiceTools *)self backupUDID] service:self->_service deleted:0 error:&v35])return v35; {
        id v8 = [(MBServiceCache *)self->_cache backupForUDID:[(MBServiceTools *)self backupUDID] lastModified:0];
        }
        if (v8)
        {
          v9 = v8;
          if ([v8 snapshotsCount])
          {
            id v10 = objc_msgSend(v9, "snapshotAtIndex:", (char *)objc_msgSend(v9, "snapshotsCount") - 1);
            if ([v10 committed])
            {
              id v11 = objc_alloc_init(MBSFile);
              [(MBSFile *)v11 setFileID:[(MBFileID *)v7 data]];
              [(MBSFile *)v11 setDomain:a3];
              [(MBSFile *)v11 setRelativePath:a4];
              v12 = [[MBFileID alloc] initWithDomainName:@"RootDomain" relativePath:@"Library/Caches/Backup/properties.plist"];
              id v13 = -[MBServiceCache fileForID:snapshotID:backupUDID:](self->_cache, "fileForID:snapshotID:backupUDID:", v12, [v10 snapshotID], -[MBServiceTools backupUDID](self, "backupUDID"));
              if (v13)
              {
                id v14 = v13;
                id v15 = objc_alloc_init(MBSFile);
                [(MBSFile *)v15 setFileID:[(MBFileID *)v12 data]];
                [(MBSFile *)v15 setDomain:@"RootDomain"];
                [(MBSFile *)v15 setRelativePath:@"Library/Caches/Backup/properties.plist"];
                -[MBSFile setSignature:](v15, "setSignature:", [v14 digest]);
                -[MBSFile setSize:](v15, "setSize:", [v14 size]);
                [(MBSFile *)v15 setAttributes:objc_alloc_init(MBSFileAttributes)];
                memset(v34, 0, sizeof(v34));
                [v14 getStat:v34];
                [(MBSFileAttributes *)[(MBSFile *)v15 attributes] setStat:v34];
                -[MBSFileAttributes setProtectionClass:](-[MBSFile attributes](v15, "attributes"), "setProtectionClass:", [v14 protectionClass]);
                -[MBSFileAttributes addExtendedAttributesDictionary:](-[MBSFile attributes](v15, "attributes"), "addExtendedAttributesDictionary:", [v14 extendedAttributes]);
                [(MBSFile *)v15 setDuplicateFile:objc_alloc_init(MBSFileReference)];
                [(MBSFileReference *)[(MBSFile *)v15 duplicateFile] setFileID:[(MBFileID *)v12 data]];
                -[MBSFileReference setSnapshotID:](-[MBSFile duplicateFile](v15, "duplicateFile"), "setSnapshotID:", [v10 snapshotID]);
                id v16 = +[MBSSnapshot snapshot];
                [v16 setQuotaReserved:0];
                objc_msgSend(v16, "setAttributes:", +[MBSSnapshotAttributes snapshotAttributes](MBSSnapshotAttributes, "snapshotAttributes"));
                objc_msgSend(objc_msgSend(v10, "attributes"), "copyTo:", objc_msgSend(v16, "attributes"));
                objc_msgSend(objc_msgSend(v16, "attributes"), "setBackupReason:", 1);
                objc_msgSend(objc_msgSend(v16, "attributes"), "setBackupType:", 1);
                uint64_t v33 = 0;
                unsigned int v32 = 0;
                if ([(MBService *)self->_service createSnapshot:v16 backupUDID:[(MBServiceTools *)self backupUDID] lastModified:&v33 error:&v35 snapshotID:&v32])
                {
                  [v16 setLastModified:v33];
                  id v17 = MBGetDefaultLog();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 67109120;
                    unsigned int v38 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Created snapshot %u", buf, 8u);
                    uint64_t v31 = v32;
                    _MBLog();
                  }
                  v36[0] = v11;
                  v36[1] = v15;
                  id v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2, v31);
                  service = self->_service;
                  id v20 = [(MBServiceTools *)self backupUDID];
                  if ([(MBService *)service addFiles:v18 backupUDID:v20 snapshotID:v32 lastModified:0 error:&v35])
                  {
                    CFStringRef v21 = MBGetDefaultLog();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Added file to snapshot", buf, 2u);
                      _MBLog();
                    }
                    objc_msgSend(-[MBService lockForBackupUDID:](self->_service, "lockForBackupUDID:", -[MBServiceTools backupUDID](self, "backupUDID")), "setState:", 2);
                    if ([(MBService *)self->_service commitSnapshotForID:v32 backupUDID:[(MBServiceTools *)self backupUDID] lastModified:0 error:&v35])
                    {
                      id v22 = MBGetDefaultLog();
                      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Committed snapshot", buf, 2u);
                        _MBLog();
                      }
                      return 0;
                    }
                    return v35;
                  }
                  id v28 = [v35 code];
                  id v29 = v35;
                  CFStringRef v30 = @"Error adding file";
                }
                else
                {
                  id v28 = [v35 code];
                  id v29 = v35;
                  CFStringRef v30 = @"Error creating snapshot";
                }
                return +[MBError errorWithCode:v28 error:v29 format:v30];
              }
              CFStringRef v26 = @"Last snapshot doesn't contain a properties file";
            }
            else
            {
              CFStringRef v26 = @"Last snapshot is uncommitted (delete it to delete a file)";
            }
          }
          else
          {
            CFStringRef v26 = @"No snapshots in backup to delete from";
          }
          uint64_t v27 = 1;
        }
        else
        {
          CFStringRef v26 = @"Backup not found";
          uint64_t v27 = 204;
        }
        return +[MBError errorWithCode:v27 format:v26];
      }
      CFStringRef v24 = @"Relative path is empty";
      uint64_t v25 = 1;
    }
    else
    {
      CFStringRef v24 = @"Domain not found";
      uint64_t v25 = 4;
    }
  }
  else
  {
    CFStringRef v24 = @"No account";
    uint64_t v25 = 210;
  }
  return +[MBError errorWithCode:v25 format:v24];
}

- (BOOL)deleteItemFromDomainName:(id)a3 relativePath:(id)a4 error:(id *)a5
{
  id v9 = objc_alloc_init((Class)NSAutoreleasePool);
  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v22 = a3;
    __int16 v23 = 2112;
    id v24 = a4;
    __int16 v25 = 2112;
    id v26 = [(MBServiceTools *)self backupUDID];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deleting %@:%@ from backup %@", buf, 0x20u);
    id v19 = a4;
    id v20 = [(MBServiceTools *)self backupUDID];
    id v18 = a3;
    _MBLog();
  }
  id v11 = -[MBServiceTools _deleteItemFromDomainName:relativePath:](self, "_deleteItemFromDomainName:relativePath:", a3, a4, v18, v19, v20);
  v12 = MBGetDefaultLog();
  id v13 = v12;
  if (v11)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    id v14 = +[MBError descriptionForError:v11];
    *(_DWORD *)buf = 138412290;
    id v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Delete failed: %@", buf, 0xCu);
    +[MBError descriptionForError:v11];
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Delete finished", buf, 2u);
  }
  _MBLog();
LABEL_9:
  id v15 = v11;
  [v9 drain];
  id v16 = v11;
  if (a5) {
    *a5 = v11;
  }
  return v11 == 0;
}

@end