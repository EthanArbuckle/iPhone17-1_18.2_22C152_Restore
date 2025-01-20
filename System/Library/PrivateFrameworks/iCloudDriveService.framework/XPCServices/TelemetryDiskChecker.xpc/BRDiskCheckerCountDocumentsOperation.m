@interface BRDiskCheckerCountDocumentsOperation
- (BRDiskCheckerCountDocumentsOperation)initWithFileURL:(id)a3;
- (id)countFolderShareItemsCompletionBlock;
- (unsigned)_getRecursiveChildItemCountAtURL:(id)a3 keysToFetch:(id)a4 filteringPredicate:(id)a5 outError:(id *)a6;
- (void)main;
- (void)setCountFolderShareItemsCompletionBlock:(id)a3;
@end

@implementation BRDiskCheckerCountDocumentsOperation

- (BRDiskCheckerCountDocumentsOperation)initWithFileURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRDiskCheckerCountDocumentsOperation;
  v6 = [(BRDiskCheckerCountDocumentsOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rootURL, a3);
  }

  return v7;
}

- (unsigned)_getRecursiveChildItemCountAtURL:(id)a3 keysToFetch:(id)a4 filteringPredicate:(id)a5 outError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  v55 = (uint64_t (**)(id, void *))a5;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = sub_100008934;
  v73 = sub_100008944;
  id v74 = 0;
  v11 = +[NSFileManager defaultManager];
  v63 = _NSConcreteStackBlock;
  uint64_t v64 = 3221225472;
  v65 = sub_10000894C;
  v66 = &unk_100010668;
  id v67 = v9;
  v68 = &v69;
  id v52 = v67;
  v53 = v11;
  v57 = v10;
  v12 = objc_msgSend(v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
  if (a6) {
    *a6 = (id) v70[5];
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v59 objects:v81 count:16];
  if (!v14)
  {
    unsigned int v54 = 0;
    goto LABEL_43;
  }
  unsigned int v54 = 0;
  uint64_t v56 = *(void *)v60;
  do
  {
    v15 = 0;
    do
    {
      if (*(void *)v60 != v56) {
        objc_enumerationMutation(v13);
      }
      v16 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v15);
      id v58 = 0;
      v17 = [v16 resourceValuesForKeys:v57 error:&v58];
      id v18 = v58;
      if (!v17)
      {
        v19 = brc_bread_crumbs();
        v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = [v16 path];
          v22 = objc_msgSend(v21, "fp_obfuscatedPath");
          *(_DWORD *)buf = 138412802;
          v76 = v22;
          __int16 v77 = 2112;
          id v78 = v18;
          __int16 v79 = 2112;
          v80 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't get resource values at %@ - %@%@", buf, 0x20u);
        }
      }
      if (objc_msgSend(v16, "br_wouldBeExcludedFromSync"))
      {
        v23 = brc_bread_crumbs();
        v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v42 = [v16 path];
          v43 = objc_msgSend(v42, "fp_obfuscatedPath");
          *(_DWORD *)buf = 138412546;
          v76 = v43;
          __int16 v77 = 2112;
          id v78 = v23;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] not counting item at url %@ because it's excluded from sync%@", buf, 0x16u);
        }
        v25 = [v17 objectForKeyedSubscript:NSURLIsDirectoryKey];
        if (([v25 BOOLValue] & 1) == 0)
        {
LABEL_32:
          v36 = [v17 objectForKeyedSubscript:NSURLIsPackageKey];
          unsigned __int8 v37 = [v36 BOOLValue];

          if ((v37 & 1) == 0) {
            goto LABEL_34;
          }
          goto LABEL_33;
        }
LABEL_21:

LABEL_33:
        [v13 skipDescendants];
        goto LABEL_34;
      }
      v26 = [v17 objectForKeyedSubscript:NSURLUbiquitousSharedItemCurrentUserRoleKey];
      unsigned int v27 = [v26 isEqualToString:NSURLUbiquitousSharedItemRoleParticipant];

      if (v27)
      {
        v28 = brc_bread_crumbs();
        v29 = brc_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          v44 = [v16 path];
          v45 = objc_msgSend(v44, "fp_obfuscatedPath");
          *(_DWORD *)buf = 138412546;
          v76 = v45;
          __int16 v77 = 2112;
          id v78 = v28;
          _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] not counting item at url %@ because it is shared to me%@", buf, 0x16u);
        }
        v25 = [v17 objectForKeyedSubscript:NSURLIsDirectoryKey];
        if (([v25 BOOLValue] & 1) == 0) {
          goto LABEL_32;
        }
        goto LABEL_21;
      }
      v30 = [v17 objectForKeyedSubscript:NSURLIsPackageKey];
      if ([v30 BOOLValue]) {
        goto LABEL_25;
      }
      v31 = [v17 objectForKeyedSubscript:NSURLIsRegularFileKey];
      if ([v31 BOOLValue])
      {

LABEL_25:
        goto LABEL_26;
      }
      v38 = [v17 objectForKeyedSubscript:NSURLIsSymbolicLinkKey];
      unsigned __int8 v39 = [v38 BOOLValue];

      if ((v39 & 1) == 0)
      {
        v40 = brc_bread_crumbs();
        v41 = brc_default_log();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          v48 = [v16 path];
          v49 = objc_msgSend(v48, "fp_obfuscatedPath");
          *(_DWORD *)buf = 138412546;
          v76 = v49;
          __int16 v77 = 2112;
          id v78 = v40;
          _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] not counting item at url %@ because it's not a file, package, or symlink%@", buf, 0x16u);
        }
        goto LABEL_34;
      }
LABEL_26:
      if (v55 && (v55[2](v55, v16) & 1) == 0) {
        goto LABEL_33;
      }
      v32 = brc_bread_crumbs();
      v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v46 = [v16 path];
        v47 = objc_msgSend(v46, "fp_obfuscatedPath");
        *(_DWORD *)buf = 138412546;
        v76 = v47;
        __int16 v77 = 2112;
        id v78 = v32;
        _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] counting item at url %@%@", buf, 0x16u);
      }
      v34 = [v17 objectForKeyedSubscript:NSURLIsPackageKey];
      unsigned int v35 = [v34 BOOLValue];

      ++v54;
      if (v35) {
        goto LABEL_33;
      }
LABEL_34:

      v15 = (char *)v15 + 1;
    }
    while (v14 != v15);
    id v50 = [v13 countByEnumeratingWithState:&v59 objects:v81 count:16];
    id v14 = v50;
  }
  while (v50);
LABEL_43:

  _Block_object_dispose(&v69, 8);
  return v54;
}

- (void)main
{
  v3 = self->_rootURL;
  id v20 = 0;
  id v19 = 0;
  unsigned __int8 v4 = [(NSURL *)v3 getResourceValue:&v20 forKey:NSURLUbiquitousItemIsSharedKey error:&v19];
  id v5 = v20;
  id v6 = v19;
  if ((v4 & 1) == 0)
  {
    v7 = brc_bread_crumbs();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      v16 = [(NSURL *)v3 path];
      v17 = objc_msgSend(v16, "fp_obfuscatedPath");
      *(_DWORD *)buf = 138412802;
      v22 = v17;
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2112;
      v26 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, (os_log_type_t)0x90u, "[ERROR] Failed to determine if the root at %@ is shared - %@%@", buf, 0x20u);
    }
  }
  unsigned __int8 v9 = [v5 BOOLValue];
  id v10 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", NSURLIsPackageKey, NSURLIsRegularFileKey, NSURLIsSymbolicLinkKey, 0);
  v11 = v10;
  if ((v9 & 1) == 0) {
    [v10 addObject:NSURLUbiquitousSharedItemCurrentUserRoleKey];
  }
  id v18 = v6;
  uint64_t v12 = [(BRDiskCheckerCountDocumentsOperation *)self _getRecursiveChildItemCountAtURL:v3 keysToFetch:v11 filteringPredicate:0 outError:&v18];
  id v13 = v18;

  countFolderShareItemsCompletionBlock = (void (**)(id, void *, id))self->_countFolderShareItemsCompletionBlock;
  if (countFolderShareItemsCompletionBlock)
  {
    v15 = +[NSNumber numberWithUnsignedInt:v12];
    countFolderShareItemsCompletionBlock[2](countFolderShareItemsCompletionBlock, v15, v13);
  }
}

- (id)countFolderShareItemsCompletionBlock
{
  return self->_countFolderShareItemsCompletionBlock;
}

- (void)setCountFolderShareItemsCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_countFolderShareItemsCompletionBlock, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
}

@end