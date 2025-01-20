@interface SPApplicationIndexer
+ (id)attributeSetForApp;
+ (id)sharedIndexer;
- (NSMutableSet)pendingUpdates;
- (SPApplicationIndexer)init;
- (id)_updateItem:(id)a3 forIdentifier:(id)a4 withLaunchCounts:(id)a5 requiresLocalizationInfo:(BOOL)a6;
- (int)changedToken;
- (void)_updateAppMetadata:(id)a3 appsRequiringLocalization:(id)a4 activity:(id)a5 completion:(id)a6;
- (void)addDefaultBundleInformationForURL:(id)a3 attrSet:(id)a4 altNames:(id)a5 namesOnly:(BOOL)a6 withApp:(id)a7 enName:(id)a8;
- (void)dealloc;
- (void)setPendingUpdates:(id)a3;
- (void)start;
- (void)updateApplicationInformationForExistingItems:(id)a3 reimportItems:(id)a4 newItems:(id)a5 countItems:(id)a6 updateCountItems:(id)a7 clean:(BOOL)a8 activity:(id)a9 completion:(id)a10;
- (void)updateApplicationMetadata:(id)a3 appsRequiringLocalization:(id)a4 activity:(id)a5 completion:(id)a6;
- (void)updateApplications:(id)a3 appBundleArray:(id)a4 clean:(BOOL)a5 activity:(id)a6;
- (void)updateShortcuts:(id)a3;
@end

@implementation SPApplicationIndexer

+ (id)sharedIndexer
{
  if (qword_1000A8E28 != -1) {
    dispatch_once(&qword_1000A8E28, &stru_100092AF8);
  }
  v2 = (void *)qword_1000A8E10;

  return v2;
}

+ (id)attributeSetForApp
{
  if (qword_1000A8E50 != -1) {
    dispatch_once(&qword_1000A8E50, &stru_100092B18);
  }
  id v2 = objc_alloc((Class)CSSearchableItemAttributeSet);
  id v3 = [v2 initWithItemContentType:SPUTIAppType];
  v4 = v3;
  if (qword_1000A8E48) {
    objc_msgSend(v3, "setKind:");
  }

  return v4;
}

- (SPApplicationIndexer)init
{
  v10.receiver = self;
  v10.super_class = (Class)SPApplicationIndexer;
  id v2 = [(SPApplicationIndexer *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    v4 = qword_1000A8E30;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001F518;
    handler[3] = &unk_100092B40;
    v5 = v2;
    v9 = v5;
    notify_register_dispatch("com.apple.searchd.applications.changed", &v3->_changedToken, v4, handler);
    v7 = v5;
    SPSetAppUpdateBlock();
  }
  return v3;
}

- (void)dealloc
{
  notify_cancel(self->_changedToken);
  v3.receiver = self;
  v3.super_class = (Class)SPApplicationIndexer;
  [(SPApplicationIndexer *)&v3 dealloc];
}

- (void)start
{
}

- (void)addDefaultBundleInformationForURL:(id)a3 attrSet:(id)a4 altNames:(id)a5 namesOnly:(BOOL)a6 withApp:(id)a7 enName:(id)a8
{
  id v13 = a3;
  id v106 = a4;
  id v14 = a5;
  id v103 = a7;
  id v15 = a8;
  v102 = v13;
  bundle = (__CFBundle *)_CFBundleCreateUnique();
  if (!bundle) {
    goto LABEL_160;
  }
  if (v15 && ![v15 length])
  {

    id v15 = 0;
  }
  id v104 = v15;
  if (a6)
  {
    v16 = 0;
    goto LABEL_47;
  }
  CFArrayRef v17 = CFBundleCopyBundleLocalizations(bundle);
  id v18 = [(__CFArray *)v17 count];
  if (v18)
  {
    v19 = +[NSMutableArray arrayWithCapacity:v18];
    long long v151 = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    CFArrayRef v20 = v17;
    id v21 = [(__CFArray *)v20 countByEnumeratingWithState:&v149 objects:v160 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v150;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v150 != v22) {
            objc_enumerationMutation(v20);
          }
          v24 = *(__CFString **)(*((void *)&v149 + 1) + 8 * i);
          CanonicalLanguageIdentifierFromString = (__CFString *)CFLocaleCreateCanonicalLanguageIdentifierFromString(kCFAllocatorDefault, v24);
          if (!CanonicalLanguageIdentifierFromString) {
            CanonicalLanguageIdentifierFromString = v24;
          }
          [v19 addObject:CanonicalLanguageIdentifierFromString];
        }
        id v21 = [(__CFArray *)v20 countByEnumeratingWithState:&v149 objects:v160 count:16];
      }
      while (v21);
    }

    if ([v19 count]) {
      [v106 setLanguages:v19];
    }
    if (v104) {
      goto LABEL_40;
    }
    uint64_t v143 = 0;
    v144 = &v143;
    uint64_t v145 = 0x3032000000;
    v146 = sub_100020818;
    v147 = sub_100020828;
    id v148 = 0;
    uint64_t v137 = 0;
    v138 = &v137;
    uint64_t v139 = 0x3032000000;
    v140 = sub_100020818;
    v141 = sub_100020828;
    id v142 = 0;
    v26 = [v102 path];
    v132[0] = _NSConcreteStackBlock;
    v132[1] = 3221225472;
    v133 = sub_100020830;
    v134 = &unk_100092BB8;
    v135 = &v137;
    v136 = &v143;
    v27 = v132;
    id v28 = v26;
    v29 = (const char *)[v28 fileSystemRepresentation];
    v30 = v29;
    if (v29)
    {
      memset(&v153, 0, sizeof(v153));
      if (stat(v29, &v153) != -1 && (v153.st_mode & 0xF000) == 0x4000)
      {
        bzero(buf, 0x400uLL);
        size_t v31 = strlen(v30);
        __strcpy_chk();
        if (buf[v31 - 1] != 47) {
          *(_WORD *)&buf[v31++] = 47;
        }
        v133((uint64_t)v27, (const char *)buf, v31);
      }
    }

    Mutable = CFSetCreateMutable(kCFAllocatorDefault, 2, &kCFTypeSetCallBacks);
    v33 = Mutable;
    if (!Mutable) {
      goto LABEL_37;
    }
    CFStringRef v34 = (const __CFString *)_kCFBundleDisplayNameKey;
    CFSetAddValue(Mutable, _kCFBundleDisplayNameKey);
    CFSetAddValue(v33, kCFBundleNameKey);
    FilteredLocalizedInfoPlist = (void *)_CFBundleCreateFilteredLocalizedInfoPlist();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [FilteredLocalizedInfoPlist count])
    {
      v36 = [FilteredLocalizedInfoPlist objectForKeyedSubscript:v34];
      if (v36)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_36;
        }
        v37 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          logb = v37;
          id v92 = [(id)objc_opt_class() description];
          uint64_t v93 = [v102 path];
          *(_DWORD *)buf = 138413314;
          CFStringRef v162 = v34;
          __int16 v163 = 2112;
          id v164 = v92;
          __int16 v165 = 2112;
          v166 = v36;
          __int16 v167 = 2112;
          uint64_t v168 = v93;
          __int16 v169 = 2112;
          CFStringRef v170 = @"en";
          v94 = (void *)v93;
          _os_log_error_impl((void *)&_mh_execute_header, logb, OS_LOG_TYPE_ERROR, "%@ invalid type %@ %@ %@ %@", buf, 0x34u);

          v37 = logb;
        }
      }
      if (!v138[5])
      {
        v36 = [FilteredLocalizedInfoPlist objectForKeyedSubscript:kCFBundleNameKey];
        if (!v36 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
LABEL_36:
          CFRelease(v33);

          v38 = v36;
          if (v36)
          {
LABEL_39:
            id v104 = v38;

            _Block_object_dispose(&v137, 8);
            _Block_object_dispose(&v143, 8);

LABEL_40:
            goto LABEL_41;
          }
LABEL_37:
          v38 = (void *)v138[5];
          v36 = 0;
          if (!v38) {
            v38 = (void *)v144[5];
          }
          goto LABEL_39;
        }
        v91 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
        {
          id v95 = [(id)objc_opt_class() description];
          uint64_t v96 = [v102 path];
          *(_DWORD *)buf = 138413314;
          CFStringRef v162 = kCFBundleNameKey;
          __int16 v163 = 2112;
          id v164 = v95;
          __int16 v165 = 2112;
          v166 = v36;
          __int16 v167 = 2112;
          uint64_t v168 = v96;
          __int16 v169 = 2112;
          CFStringRef v170 = @"en";
          v97 = (void *)v96;
          _os_log_error_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_ERROR, "%@ invalid type %@ %@ %@ %@", buf, 0x34u);
        }
      }
    }
    v36 = 0;
    goto LABEL_36;
  }
LABEL_41:
  uint64_t v39 = MDItemKeywords;
  v40 = CFBundleGetValueForInfoDictionaryKey(bundle, MDItemKeywords);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v40;
    v40 = [v41 componentsJoinedByString:@","];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = v40;
    [v106 setAttribute:v16 forKey:v39];
  }
  else
  {
    v16 = 0;
  }

LABEL_47:
  v42 = [v106 displayName];
  if ([v42 length] || !v104)
  {
    id v44 = v42;
    if (!v42)
    {
      v99 = 0;
      goto LABEL_54;
    }
  }
  else
  {
    id v43 = v104;

    id v44 = v43;
  }
  v99 = v44;
  v45 = (void *)_MDStringCopyAbbreviations();
  if ([v45 count]) {
    [v14 addObjectsFromArray:v45];
  }

LABEL_54:
  v46 = [v103 longDisplayName];
  id v131 = 0;
  unsigned int v47 = [v102 getResourceValue:&v131 forKey:NSURLParentDirectoryURLKey error:0];
  id v48 = v131;
  v98 = v48;
  if (v47)
  {
    v49 = +[NSURL URLWithString:@"iTunesMetadata.plist" relativeToURL:v48];
    if (v49)
    {
      v105 = +[NSDictionary dictionaryWithContentsOfURL:v49];
    }
    else
    {
      v105 = 0;
    }
  }
  else
  {
    v105 = 0;
  }
  if ([v46 length] || !v105)
  {
    v51 = v46;
  }
  else
  {
    uint64_t v50 = [v105 objectForKeyedSubscript:@"itemName"];

    v51 = (void *)v50;
  }
  v100 = v51;
  if ([v51 length])
  {
    [v14 addObject:v100];
    v52 = [v103 longDisplayName];
    [v106 setTitle:v52];
  }
  if (v104) {
    [v14 addObject:v104];
  }
  if (v105)
  {
    os_log_t log = [v105 objectForKeyedSubscript:@"nameTranscriptions"];
    if (log)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [log allKeys];
        long long v129 = 0u;
        long long v130 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        id v53 = (id)objc_claimAutoreleasedReturnValue();
        id v54 = [v53 countByEnumeratingWithState:&v127 objects:v159 count:16];
        if (v54)
        {
          uint64_t v55 = *(void *)v128;
          do
          {
            for (j = 0; j != v54; j = (char *)j + 1)
            {
              if (*(void *)v128 != v55) {
                objc_enumerationMutation(v53);
              }
              v57 = [log objectForKey:*(void *)(*((void *)&v127 + 1) + 8 * (void)j)];
              long long v125 = 0u;
              long long v126 = 0u;
              long long v123 = 0u;
              long long v124 = 0u;
              id v58 = v57;
              id v59 = [v58 countByEnumeratingWithState:&v123 objects:v158 count:16];
              if (v59)
              {
                uint64_t v60 = *(void *)v124;
                do
                {
                  for (k = 0; k != v59; k = (char *)k + 1)
                  {
                    if (*(void *)v124 != v60) {
                      objc_enumerationMutation(v58);
                    }
                    [v14 addObject:*(void *)(*((void *)&v123 + 1) + 8 * (void)k)];
                  }
                  id v59 = [v58 countByEnumeratingWithState:&v123 objects:v158 count:16];
                }
                while (v59);
              }
            }
            id v54 = [v53 countByEnumeratingWithState:&v127 objects:v159 count:16];
          }
          while (v54);
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v121 = 0u;
          long long v122 = 0u;
          long long v119 = 0u;
          long long v120 = 0u;
          v62 = log;
          id v63 = [v62 countByEnumeratingWithState:&v119 objects:v157 count:16];
          if (v63)
          {
            uint64_t v64 = *(void *)v120;
            do
            {
              for (m = 0; m != v63; m = (char *)m + 1)
              {
                if (*(void *)v120 != v64) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v66 = *(void *)(*((void *)&v119 + 1) + 8 * (void)m);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v14 addObject:v66];
                }
              }
              id v63 = [v62 countByEnumeratingWithState:&v119 objects:v157 count:16];
            }
            while (v63);
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v14 addObject:log];
          }
        }
      }
    }
  }
  CFBundleGetValueForInfoDictionaryKey(bundle, @"CFBundleAlternateNames");
  os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (!loga)
  {
    CFBundleGetValueForInfoDictionaryKey(bundle, @"kMDItemAlternateNames");
    os_log_t loga = (os_log_t)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    v67 = loga;
    id v68 = [v67 countByEnumeratingWithState:&v115 objects:v156 count:16];
    if (v68)
    {
      uint64_t v69 = *(void *)v116;
      do
      {
        for (n = 0; n != v68; n = (char *)n + 1)
        {
          if (*(void *)v116 != v69) {
            objc_enumerationMutation(v67);
          }
          v71 = (__CFString *)*(id *)(*((void *)&v115 + 1) + 8 * (void)n);

          objc_opt_class();
          v16 = v71;
          if (objc_opt_isKindOfClass())
          {
            v72 = CFBundleGetValueForInfoDictionaryKey(bundle, v71);
            v73 = v72;
            if (v72 && [v72 length])
            {
              [v14 addObject:v73];
            }
            else if ([(__CFString *)v71 length])
            {
              [v14 addObject:v71];
            }
          }
        }
        id v68 = [v67 countByEnumeratingWithState:&v115 objects:v156 count:16];
      }
      while (v68);
    }

    v16 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v74 = loga;

      if ([v74 length]) {
        [v14 addObject:v74];
      }
      v67 = 0;
      v16 = (__CFString *)v74;
    }
    else
    {
      v67 = 0;
    }
  }
  v101 = CFBundleGetValueForInfoDictionaryKey(bundle, @"INAlternativeAppNames");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v75 = v101;

    long long v113 = 0u;
    long long v114 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    v67 = v75;
    id v76 = [v67 countByEnumeratingWithState:&v111 objects:v155 count:16];
    if (v76)
    {
      uint64_t v77 = *(void *)v112;
      do
      {
        for (ii = 0; ii != v76; ii = (char *)ii + 1)
        {
          if (*(void *)v112 != v77) {
            objc_enumerationMutation(v67);
          }
          v79 = *(void **)(*((void *)&v111 + 1) + 8 * (void)ii);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v80 = [v79 objectForKeyedSubscript:@"INAlternativeAppName"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v81 = CFBundleGetValueForInfoDictionaryKey(bundle, v80);
              if (v81) {
                [v14 addObject:v81];
              }
              else {
                [v14 addObject:v80];
              }
            }
          }
        }
        id v76 = [v67 countByEnumeratingWithState:&v111 objects:v155 count:16];
      }
      while (v76);
    }
  }
  v82 = CFBundleGetValueForInfoDictionaryKey(bundle, @"CFBundleSpokenName");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v83 = v82;

    [v14 addObjectsFromArray:v83];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v84 = v82;

      [v14 addObject:v84];
      v83 = v67;
      v16 = v84;
    }
    else
    {
      v83 = v67;
    }
  }
  uint64_t v85 = CFBundleGetValueForInfoDictionaryKey(bundle, @"SBMatchingApplicationGenres");
  v86 = (void *)v85;
  if (v105 && !v85)
  {
    v86 = [v105 objectForKeyedSubscript:@"genre"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v87 = v86;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v88 = 0;
      goto LABEL_154;
    }
    v154 = v86;
    id v87 = +[NSArray arrayWithObjects:&v154 count:1];
  }
  v88 = v87;
LABEL_154:

  if ([v88 count])
  {
    v89 = (void *)_MDBundleUtilsCopyLocalizedApplicationCategories();
    if (v89)
    {
      [v106 setAttribute:v89 forKey:@"kMDItemAppStoreCategory"];
    }
    else
    {
      v90 = [v88 componentsJoinedByString:@","];
      [v106 setAttribute:v90 forKey:@"kMDItemAppStoreCategory"];
    }
  }
  CFRelease(bundle);

  id v15 = v104;
LABEL_160:
}

- (id)_updateItem:(id)a3 forIdentifier:(id)a4 withLaunchCounts:(id)a5 requiresLocalizationInfo:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  uint64_t v137 = (__CFString *)a4;
  id v10 = a5;
  group = dispatch_group_create();
  qos_class_t v11 = qos_class_self();
  v12 = dispatch_queue_attr_make_with_qos_class(0, v11, 0);
  dispatch_queue_t v133 = dispatch_queue_create("clip queue", v12);

  v136 = v9;
  v138 = v10;
  if (!v6)
  {
    id v142 = 0;
    v16 = 0;
    id v139 = 0;
    id v18 = 0;
    if (![v10 count]) {
      goto LABEL_173;
    }
LABEL_166:
    id v139 = +[SPApplicationIndexer attributeSetForApp];
    goto LABEL_167;
  }
  if ([v9 isAppClip])
  {
    id v13 = +[SPApplicationIndexer attributeSetForApp];
    dispatch_group_enter(group);
    id v14 = +[CPSWebClipStore sharedStore];
    v176[0] = _NSConcreteStackBlock;
    v176[1] = 3221225472;
    v176[2] = sub_1000222F0;
    v176[3] = &unk_100092BE0;
    id v177 = v9;
    id v139 = v13;
    id v178 = v139;
    id v15 = group;
    v179 = v15;
    v180 = v137;
    [v14 getAppClipWithIdentifier:v180 receiveOnQueue:v133 completionHandler:v176];

    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    id v142 = 0;
    v16 = 0;
    CFArrayRef v17 = v177;
    goto LABEL_164;
  }
  id v19 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v137 allowPlaceholder:1 error:0];
  if (!v19) {
    id v19 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifierOfSystemPlaceholder:v137 error:0];
  }
  id v126 = v19;
  v132 = [v19 URL];
  v134 = +[NSMutableArray array];
  uint64_t v170 = 0;
  v171 = &v170;
  uint64_t v172 = 0x3032000000;
  v173 = sub_100020818;
  v174 = sub_100020828;
  id v175 = 0;
  uint64_t v164 = 0;
  __int16 v165 = &v164;
  uint64_t v166 = 0x3032000000;
  __int16 v167 = sub_100020818;
  uint64_t v168 = sub_100020828;
  id v169 = 0;
  CFArrayRef v20 = SPLogForSPLogCategoryDefault();
  os_log_type_t v21 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v20, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v187 = v137;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "processing update %@", buf, 0xCu);
  }

  uint64_t v22 = [v132 path];
  v159[0] = _NSConcreteStackBlock;
  v159[1] = 3221225472;
  v160 = sub_1000224BC;
  v161 = &unk_100092BB8;
  CFStringRef v162 = &v164;
  __int16 v163 = &v170;
  v23 = v159;
  id v24 = v22;
  v25 = (const char *)[v24 fileSystemRepresentation];
  v26 = v25;
  if (v25)
  {
    v27 = opendir(v25);
    if (v27)
    {
      bzero(buf, 0x400uLL);
      size_t v28 = strlen(v26);
      __strcpy_chk();
      if (buf[v28 - 1] != 47) {
        *(_WORD *)&buf[v28++] = 47;
      }
      v160((uint64_t)v23, (const char *)buf, v28);
      buf[v28] = 0;
      closedir(v27);
    }
  }

  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    Mutable = CFSetCreateMutable(kCFAllocatorDefault, 4, &kCFTypeSetCallBacks);
    size_t v31 = Mutable;
    cf = Unique;
    if (Mutable)
    {
      CFStringRef v129 = (const __CFString *)_kCFBundleDisplayNameKey;
      CFSetAddValue(Mutable, _kCFBundleDisplayNameKey);
      CFSetAddValue(v31, kCFBundleNameKey);
      uint64_t v125 = MDItemKeywords;
      CFSetAddValue(v31, MDItemKeywords);
      CFSetAddValue(v31, @"MDItemKeywords");
      CFArrayRef v32 = CFBundleCopyBundleLocalizations(Unique);
      CFArrayRef v33 = v32;
      if (v32)
      {
        CFIndex Count = CFArrayGetCount(v32);
        if (Count >= 1)
        {
          CFIndex v140 = Count;
          CFIndex v36 = 0;
          long long v127 = 0;
          id v142 = 0;
          *(void *)&long long v35 = 138413314;
          long long v124 = v35;
          while (1)
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v33, v36);
            CanonicalLanguageIdentifierFromString = (__CFString *)CFLocaleCreateCanonicalLanguageIdentifierFromString(kCFAllocatorDefault, ValueAtIndex);
            if (!CanonicalLanguageIdentifierFromString) {
              CanonicalLanguageIdentifierFromString = (__CFString *)CFRetain(ValueAtIndex);
            }
            if (CFStringCompare(CanonicalLanguageIdentifierFromString, @"base", 1uLL) == kCFCompareEqualTo)
            {
              CFRelease(CanonicalLanguageIdentifierFromString);
              CanonicalLanguageIdentifierFromString = &stru_100094088;
            }
            if (CFEqual(CanonicalLanguageIdentifierFromString, @"ko-KR"))
            {
              CFRelease(CanonicalLanguageIdentifierFromString);
              CanonicalLanguageIdentifierFromString = @"ko";
            }
            uint64_t v39 = CanonicalLanguageIdentifierFromString;
            [v134 addObject:v39];
            FilteredLocalizedInfoPlist = (void *)_CFBundleCreateFilteredLocalizedInfoPlist();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || ![FilteredLocalizedInfoPlist count]) {
              goto LABEL_63;
            }
            id v41 = [FilteredLocalizedInfoPlist objectForKeyedSubscript:v129];
            if (!v41) {
              goto LABEL_37;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              break;
            }
            if (([(id)v165[5] isEqualToString:v41] & 1) == 0)
            {
              v42 = v127;
              if (!v127) {
                v42 = objc_opt_new();
              }
              goto LABEL_33;
            }
LABEL_39:
            id v44 = objc_msgSend(FilteredLocalizedInfoPlist, "objectForKeyedSubscript:", v125, v124);
            v45 = v44;
            if (v44)
            {
              id v46 = v44;
            }
            else
            {
              id v46 = [FilteredLocalizedInfoPlist objectForKeyedSubscript:@"MDItemKeywords"];
            }
            unsigned int v47 = +[NSMutableSet set];
            id v48 = [(__CFString *)v39 caseInsensitiveCompare:@"ko"];
            if (v41 && !v48)
            {
              ConsonantsStringForKorean = (void *)createConsonantsStringForKorean();
              uint64_t v50 = ConsonantsStringForKorean;
              if (ConsonantsStringForKorean && [ConsonantsStringForKorean length]) {
                [v47 addObject:v50];
              }
              v51 = (void *)createConsonantsStringForKorean();
              v52 = v51;
              if (v51 && [v51 length]) {
                [v47 addObject:v52];
              }
            }
            if (v46)
            {
              id v53 = +[NSMutableArray array];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v53 addObjectsFromArray:v46];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v54 = [v46 componentsSeparatedByString:@","];
                  [v53 addObjectsFromArray:v54];
                }
              }
              v157[0] = _NSConcreteStackBlock;
              v157[1] = 3221225472;
              v157[2] = sub_100022824;
              v157[3] = &unk_100092C08;
              id v158 = v47;
              [v53 enumerateObjectsUsingBlock:v157];
            }
            uint64_t v55 = [v47 allObjects];
            v56 = [v55 componentsJoinedByString:@","];

            if (!v142) {
              id v142 = objc_opt_new();
            }
            if (v56 && [v56 length]) {
              [v142 setObject:v56 forKeyedSubscript:v39];
            }

LABEL_63:
            CFRelease(v39);

            if (v140 == ++v36) {
              goto LABEL_78;
            }
          }
          id v43 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            id v58 = [(id)objc_opt_class() description];
            id v59 = [v132 path];
            *(_DWORD *)buf = v124;
            CFStringRef v187 = v129;
            __int16 v188 = 2112;
            id v189 = v58;
            __int16 v190 = 2112;
            v191 = v41;
            __int16 v192 = 2112;
            v193 = v59;
            __int16 v194 = 2112;
            v195 = v39;
            _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@ invalid type %@ %@ %@ %@", buf, 0x34u);
          }
LABEL_37:
          if (v165[5]) {
            goto LABEL_38;
          }
          id v41 = [FilteredLocalizedInfoPlist objectForKeyedSubscript:kCFBundleNameKey];
          if (!v41) {
            goto LABEL_39;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v57 = SPLogForSPLogCategoryDefault();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              id v60 = [(id)objc_opt_class() description];
              v61 = [v132 path];
              *(_DWORD *)buf = v124;
              CFStringRef v187 = kCFBundleNameKey;
              __int16 v188 = 2112;
              id v189 = v60;
              __int16 v190 = 2112;
              v191 = v41;
              __int16 v192 = 2112;
              v193 = v61;
              __int16 v194 = 2112;
              v195 = v39;
              _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%@ invalid type %@ %@ %@ %@", buf, 0x34u);
            }
LABEL_38:
            id v41 = 0;
            goto LABEL_39;
          }
          if ([(id)v171[5] isEqualToString:v41]) {
            goto LABEL_39;
          }
          v42 = v127;
          if (!v127) {
            v42 = objc_opt_new();
          }
LABEL_33:
          long long v127 = v42;
          objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, v39, v124);
          goto LABEL_39;
        }
        id v142 = 0;
        long long v127 = 0;
LABEL_78:
        CFRelease(v33);
        CFArrayRef v33 = (const __CFArray *)v127;
      }
      else
      {
        id v142 = 0;
      }
      CFRelease(v31);
    }
    else
    {
      id v142 = 0;
      CFArrayRef v33 = 0;
    }
    CFRelease(cf);
  }
  else
  {
    id v142 = 0;
    CFArrayRef v33 = 0;
  }
  id v139 = +[SPApplicationIndexer attributeSetForApp];
  if ([v136 isWebClip]) {
    [v139 setIsWebClip:&off_100098B10];
  }
  long long v130 = SSAllLocalizedExtraApplicationKeywords();
  if (v130)
  {
    if (!v142)
    {
      id v142 = +[NSMutableDictionary dictionary];
    }
    CFArrayRef v128 = v33;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    id v62 = v130;
    id v63 = [v62 countByEnumeratingWithState:&v153 objects:v185 count:16];
    if (v63)
    {
      uint64_t v64 = *(void *)v154;
      do
      {
        for (i = 0; i != v63; i = (char *)i + 1)
        {
          if (*(void *)v154 != v64) {
            objc_enumerationMutation(v62);
          }
          uint64_t v66 = *(void *)(*((void *)&v153 + 1) + 8 * i);
          v67 = [v142 objectForKeyedSubscript:v66];
          id v68 = [v62 objectForKeyedSubscript:v66];
          uint64_t v69 = +[NSMutableSet set];
          if (v67 && [v67 length])
          {
            v70 = [v67 componentsSeparatedByString:@","];
            [v69 addObjectsFromArray:v70];
          }
          if (v68 && [v68 length])
          {
            v71 = [v68 componentsSeparatedByString:@","];
            v72 = +[NSMutableArray arrayWithArray:v71];

            v151[0] = _NSConcreteStackBlock;
            v151[1] = 3221225472;
            v151[2] = sub_1000228D4;
            v151[3] = &unk_100092C08;
            id v152 = v69;
            [v72 enumerateObjectsUsingBlock:v151];
          }
          if (v69 && [v69 count])
          {
            v73 = [v69 allObjects];
            v74 = [v73 componentsJoinedByString:@","];
            [v142 setObject:v74 forKeyedSubscript:v66];
          }
        }
        id v63 = [v62 countByEnumeratingWithState:&v153 objects:v185 count:16];
      }
      while (v63);
    }

    CFArrayRef v33 = v128;
  }
  id v75 = [v134 count];
  id v76 = v75;
  if (!v75) {
    goto LABEL_124;
  }
  if (v75 != (id)1) {
    [v134 sortUsingComparator:&stru_100092C48];
  }
  [v139 setLanguages:v134];
  id v77 = [(__CFArray *)v33 count];
  id v78 = v77;
  if (!v77) {
    goto LABEL_124;
  }
  if (v77 == v76) {
    goto LABEL_121;
  }
  v79 = (void *)v165[5];
  if (v79)
  {
    id v80 = v79;
    goto LABEL_111;
  }
  id v80 = (id)v171[5];
  id v76 = v78;
  if (!v80)
  {
LABEL_121:
    id v88 = [objc_alloc((Class)CSLocalizedString) initWithLocalizedStrings:v33];
    [v139 setDisplayName:v88];
    if ((unint64_t)v76 < 2)
    {
      v16 = 0;
    }
    else
    {
      v89 = [(__CFArray *)v33 objectForKeyedSubscript:@"en"];
      if (v89)
      {
        v16 = +[NSMutableSet set];
        [(SPApplicationIndexer *)self addDefaultBundleInformationForURL:v132 attrSet:v139 altNames:v16 namesOnly:1 withApp:v136 enName:v89];
        [v16 addObject:v89];
      }
      else
      {
        v16 = 0;
      }
    }
    goto LABEL_129;
  }
LABEL_111:
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  id v81 = v134;
  id v82 = [v81 countByEnumeratingWithState:&v147 objects:v184 count:16];
  if (v82)
  {
    uint64_t v83 = *(void *)v148;
    do
    {
      for (j = 0; j != v82; j = (char *)j + 1)
      {
        if (*(void *)v148 != v83) {
          objc_enumerationMutation(v81);
        }
        uint64_t v85 = *(void *)(*((void *)&v147 + 1) + 8 * (void)j);
        v86 = [(__CFArray *)v33 objectForKeyedSubscript:v85];
        BOOL v87 = v86 == 0;

        if (v87) {
          [(__CFArray *)v33 setObject:v80 forKeyedSubscript:v85];
        }
      }
      id v82 = [v81 countByEnumeratingWithState:&v147 objects:v184 count:16];
    }
    while (v82);
  }

  id v76 = [(__CFArray *)v33 count];
  if (v76) {
    goto LABEL_121;
  }
LABEL_124:
  v16 = 0;
LABEL_129:
  v90 = [v139 alternateNames];
  v91 = +[NSMutableSet setWithArray:v90];

  id v92 = [v139 displayName];

  if (v92)
  {
    uint64_t v93 = [v139 displayName];
    [v91 addObject:v93];
  }
  else if (v165[5] || v171[5])
  {
    objc_msgSend(v91, "addObject:");
  }
  v94 = SSBuildExtraApplicationAlternateNames();

  id v95 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  if (v94 && [v94 count])
  {
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    id v96 = v94;
    v97 = (char *)[v96 countByEnumeratingWithState:&v143 objects:v183 count:16];
    if (v97)
    {
      uint64_t v98 = *(void *)v144;
      do
      {
        for (k = 0; k != v97; ++k)
        {
          if (*(void *)v144 != v98) {
            objc_enumerationMutation(v96);
          }
          CFStringRef v100 = (const __CFString *)createConsonantsStringForKorean();
          CFStringRef v101 = v100;
          if (v100)
          {
            if (CFStringGetLength(v100))
            {
              CFSetAddValue(v95, v101);
              CFStringRef v102 = (const __CFString *)createConsonantsStringForKorean();
              CFStringRef v103 = v102;
              if (v102)
              {
                if (CFStringGetLength(v102)) {
                  CFSetAddValue(v95, v103);
                }
                CFRelease(v103);
              }
            }
            CFRelease(v101);
          }
        }
        v97 = (char *)[v96 countByEnumeratingWithState:&v143 objects:v183 count:16];
      }
      while (v97);
    }
  }
  if (v95)
  {
    if (CFSetGetCount(v95))
    {
      if (!v142)
      {
        id v142 = +[NSMutableDictionary dictionary];
      }
      id v104 = +[NSMutableSet setWithSet:v95];
      v105 = [v142 objectForKeyedSubscript:@"ko"];
      id v106 = v105;
      if (v105 && [v105 length])
      {
        v107 = [v106 componentsSeparatedByString:@","];
        [v104 addObjectsFromArray:v107];
      }
      v108 = [v104 allObjects];
      v109 = [v108 componentsJoinedByString:@","];
      [v142 setObject:v109 forKeyedSubscript:@"ko"];
    }
    CFRelease(v95);
  }
  if (v142 && [v142 count])
  {
    id v110 = [objc_alloc((Class)CSLocalizedString) initWithLocalizedStrings:v142];
    [v139 setAttribute:v110 forKey:MDItemKeywords];
  }
  _Block_object_dispose(&v164, 8);

  _Block_object_dispose(&v170, 8);
  CFArrayRef v17 = v126;
LABEL_164:

  long long v111 = +[NSNumber numberWithInteger:qword_1000A8E40];
  [v139 setAttribute:v111 forKey:off_1000A8888];

  if (![v138 count]) {
    goto LABEL_168;
  }
  if (!v139) {
    goto LABEL_166;
  }
LABEL_167:
  v181[0] = MDItemRankingLaunchCountDay;
  long long v112 = [v138 objectAtIndexedSubscript:0];
  v182[0] = v112;
  v181[1] = MDItemRankingLaunchCountLast7Days;
  long long v113 = [v138 objectAtIndexedSubscript:1];
  v182[1] = v113;
  v181[2] = MDItemRankingLaunchCountLast30Days;
  long long v114 = [v138 objectAtIndexedSubscript:2];
  v182[2] = v114;
  v181[3] = MDItemRankingLaunchCountOld;
  long long v115 = [v138 objectAtIndexedSubscript:3];
  v182[3] = v115;
  v181[4] = MDItemApplicationLastLaunchedDate;
  id v116 = objc_alloc((Class)NSDate);
  long long v117 = [v138 objectAtIndexedSubscript:4];
  [v117 doubleValue];
  id v118 = objc_msgSend(v116, "initWithTimeIntervalSinceReferenceDate:");
  v182[4] = v118;
  long long v119 = +[NSDictionary dictionaryWithObjects:v182 forKeys:v181 count:5];

  [v139 addAttributesFromDictionary:v119];
LABEL_168:
  if (v139)
  {
    long long v120 = SPLogForSPLogCategoryDefault();
    os_log_type_t v121 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v120, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v187 = v137;
      _os_log_impl((void *)&_mh_execute_header, v120, v121, "processed update %@", buf, 0xCu);
    }

    id v18 = [objc_alloc((Class)CSSearchableItem) initWithUniqueIdentifier:v137 domainIdentifier:0 attributeSet:v139];
    [v18 setIsUpdate:1];
  }
  else
  {
    id v139 = 0;
    id v18 = 0;
  }
LABEL_173:
  id v122 = v18;

  return v122;
}

- (void)_updateAppMetadata:(id)a3 appsRequiringLocalization:(id)a4 activity:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v68 = a4;
  qos_class_t v11 = (_xpc_activity_s *)a5;
  v12 = (void (**)(void))a6;
  v67 = SPFastApplicationsGet();
  if (qword_1000A8E60 != -1) {
    dispatch_once(&qword_1000A8E60, &stru_100092C68);
  }
  if ([v10 count] || objc_msgSend(v68, "count"))
  {
    id v13 = [v10 allKeys];
    id v14 = [v13 arrayByAddingObjectsFromArray:v68];

    unint64_t v15 = (unint64_t)[v14 count];
    unint64_t v16 = v15 >> 6;
    if ((v15 & 0x3F) != 0) {
      ++v16;
    }
    unint64_t v61 = v16;
    if (v16)
    {
      uint64_t v17 = 0;
      uint64_t v60 = SPApplicationBundleIdGeneralApplication;
      id v18 = &MDItemInstantMessageAddresses_ptr;
      id v63 = v14;
      uint64_t v64 = v12;
      unint64_t v59 = v15;
      do
      {
        uint64_t v62 = v17;
        uint64_t v19 = (v17 << 6);
        if (v15 - v19 >= 0x40) {
          uint64_t v20 = 64;
        }
        else {
          uint64_t v20 = v15 - v19;
        }
        os_log_type_t v21 = objc_msgSend(v14, "subarrayWithRange:", v19, v20);
        uint64_t v66 = objc_msgSend(v18[161], "arrayWithCapacity:", objc_msgSend(v21, "count"));
        v65 = objc_msgSend(v18[161], "arrayWithCapacity:", objc_msgSend(v21, "count"));
        if (!self->_pendingUpdates)
        {
          uint64_t v22 = +[NSMutableSet set];
          pendingUpdates = self->_pendingUpdates;
          self->_pendingUpdates = v22;
        }
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v24 = v21;
        id v25 = [v24 countByEnumeratingWithState:&v77 objects:v81 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v78;
          while (2)
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v78 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(NSObject **)(*((void *)&v77 + 1) + 8 * i);
              if (v11 && xpc_activity_should_defer(v11))
              {
                uint64_t v55 = SPLogForSPLogCategoryDefault();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v83 = v29;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "*warn* Deferring activity to update application metadata for %@ and more", buf, 0xCu);
                }

                xpc_activity_set_state(v11, 3);
                v12 = v64;
                v64[2](v64);

                id v14 = v63;
                goto LABEL_49;
              }
              if (([(NSMutableSet *)self->_pendingUpdates containsObject:v29] & 1) == 0)
              {
                [(NSMutableSet *)self->_pendingUpdates addObject:v29];
                v30 = [v67 objectForKey:v29];
                id v31 = v10;
                CFArrayRef v32 = [v10 objectForKey:v29];
                CFArrayRef v33 = -[SPApplicationIndexer _updateItem:forIdentifier:withLaunchCounts:requiresLocalizationInfo:](self, "_updateItem:forIdentifier:withLaunchCounts:requiresLocalizationInfo:", v30, v29, v32, [v68 containsObject:v29]);

                if (v33)
                {
                  if ([v30 isAppClip]) {
                    CFStringRef v34 = v65;
                  }
                  else {
                    CFStringRef v34 = v66;
                  }
                  [v34 addObject:v33];
                }

                id v10 = v31;
              }
            }
            id v26 = [v24 countByEnumeratingWithState:&v77 objects:v81 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }

        [v10 removeObjectsForKeys:v24];
        long long v35 = dispatch_group_create();
        v12 = v64;
        if ([v66 count])
        {
          CFIndex v36 = SPLogForSPLogCategoryDefault();
          os_log_type_t v37 = gSPLogInfoAsDefault ^ 1;
          if (os_log_type_enabled(v36, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
          {
            unsigned int v38 = [v66 count];
            *(_DWORD *)buf = 67109120;
            LODWORD(v83) = v38;
            _os_log_impl((void *)&_mh_execute_header, v36, v37, "Updating applications %d updates", buf, 8u);
          }

          dispatch_group_enter(v35);
          uint64_t v39 = SPLogForSPLogCategoryDefault();
          os_log_type_t v40 = gSPLogInfoAsDefault ^ 1;
          if (os_log_type_enabled(v39, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v83 = v35;
            _os_log_impl((void *)&_mh_execute_header, v39, v40, "Enter group %p", buf, 0xCu);
          }

          id v41 = +[SPCoreSpotlightIndexer sharedInstance];
          v73[0] = _NSConcreteStackBlock;
          v73[1] = 3221225472;
          v73[2] = sub_10002326C;
          v73[3] = &unk_100092C90;
          id v42 = v66;
          id v74 = v42;
          id v75 = self;
          id v76 = v35;
          [v41 indexSearchableItems:v42 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:NSFileProtectionCompleteUntilFirstUserAuthentication forBundleID:v60 options:0 completionHandler:v73];
        }
        id v43 = v65;
        if ([v65 count])
        {
          id v44 = SPLogForSPLogCategoryDefault();
          os_log_type_t v45 = gSPLogInfoAsDefault ^ 1;
          if (os_log_type_enabled(v44, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
          {
            unsigned int v46 = [v65 count];
            *(_DWORD *)buf = 67109120;
            LODWORD(v83) = v46;
            _os_log_impl((void *)&_mh_execute_header, v44, v45, "Updating applications %d updates", buf, 8u);
          }

          dispatch_group_enter(v35);
          unsigned int v47 = SPLogForSPLogCategoryDefault();
          os_log_type_t v48 = gSPLogInfoAsDefault ^ 1;
          if (os_log_type_enabled(v47, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v83 = v35;
            _os_log_impl((void *)&_mh_execute_header, v47, v48, "Enter group %p", buf, 0xCu);
          }

          v49 = +[SPCoreSpotlightIndexer sharedInstance];
          v69[0] = _NSConcreteStackBlock;
          v69[1] = 3221225472;
          v69[2] = sub_100023510;
          v69[3] = &unk_100092C90;
          id v50 = v65;
          id v70 = v50;
          v71 = self;
          v72 = v35;
          id v51 = v50;
          id v43 = v65;
          [v49 indexSearchableItems:v51 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:NSFileProtectionCompleteUntilFirstUserAuthentication forBundleID:v60 options:0 completionHandler:v69];
        }
        dispatch_group_wait(v35, 0xFFFFFFFFFFFFFFFFLL);

        uint64_t v17 = v62 + 1;
        id v14 = v63;
        unint64_t v15 = v59;
        id v18 = &MDItemInstantMessageAddresses_ptr;
      }
      while (v62 + 1 != v61);
    }
    v52 = SPLogForSPLogCategoryDefault();
    os_log_type_t v53 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v52, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      id v54 = objc_retainBlock(v12);
      *(_DWORD *)buf = 134217984;
      uint64_t v83 = v54;
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "2.7 call completion %p", buf, 0xCu);
    }
    v12[2](v12);
LABEL_49:
  }
  else
  {
    v56 = SPLogForSPLogCategoryDefault();
    os_log_type_t v57 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v56, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      id v58 = objc_retainBlock(v12);
      *(_DWORD *)buf = 134217984;
      uint64_t v83 = v58;
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "2.8 call completion %p", buf, 0xCu);
    }
    v12[2](v12);
  }
}

- (void)updateApplicationMetadata:(id)a3 appsRequiringLocalization:(id)a4 activity:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v16 = a5;
  id v17 = a6;
  unint64_t v15 = v10;
  id v11 = v16;
  id v12 = v10;
  id v13 = v9;
  id v14 = v17;
  tracing_dispatch_async();
}

- (void)updateApplicationInformationForExistingItems:(id)a3 reimportItems:(id)a4 newItems:(id)a5 countItems:(id)a6 updateCountItems:(id)a7 clean:(BOOL)a8 activity:(id)a9 completion:(id)a10
{
  id v14 = a3;
  id v143 = a4;
  id v140 = a5;
  id v155 = a6;
  id v15 = a7;
  id v16 = (_xpc_activity_s *)a9;
  id v17 = (void (**)(void))a10;
  if (qword_1000A8E70 != -1) {
    dispatch_once(&qword_1000A8E70, &stru_100092CD8);
  }
  id v139 = v17;
  id v18 = SPFastApplicationsGet();
  BOOL v19 = a8;
  if (![v18 count])
  {
    id v122 = SPLogForSPLogCategoryDefault();
    os_log_type_t v123 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v122, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      long long v124 = objc_retainBlock(v139);
      *(_DWORD *)buf = 134217984;
      *(void *)CFStringRef v187 = v124;
      _os_log_impl((void *)&_mh_execute_header, v122, v123, "2.1 call completion %p", buf, 0xCu);
    }
    os_log_type_t v121 = v139;
    v139[2](v139);
    goto LABEL_141;
  }
  dispatch_queue_t v133 = v15;
  long long v145 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v18 count]);
  long long v148 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v18 count]);
  long long v146 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v14 count]);
  uint64_t v20 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v18 count]);
  os_log_type_t v21 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v14 count]);
  uint64_t v22 = +[NSLocale currentLocale];
  long long v154 = [v22 objectForKey:NSLocaleLanguageCode];

  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  id obj = [v18 allValues];
  id v23 = [obj countByEnumeratingWithState:&v177 objects:v188 count:16];
  id v149 = v14;
  long long v150 = v20;
  long long v147 = v16;
  v160 = v18;
  id v152 = v21;
  if (!v23) {
    goto LABEL_100;
  }
  id v24 = v23;
  uint64_t v156 = *(void *)v178;
  uint64_t v138 = MDItemRankingLaunchCountDay;
  uint64_t v137 = MDItemRankingLaunchCountLast7Days;
  uint64_t v135 = MDItemRankingLaunchCountOld;
  uint64_t v136 = MDItemRankingLaunchCountLast30Days;
  uint64_t v134 = MDItemApplicationLastLaunchedDate;
  uint64_t v141 = MDItemRelatedAppBundleIdentifier;
  uint64_t v142 = MDItemIsWebClip;
  do
  {
    id v25 = 0;
    id v151 = v24;
    do
    {
      if (*(void *)v178 != v156) {
        objc_enumerationMutation(obj);
      }
      id v26 = *(void **)(*((void *)&v177 + 1) + 8 * (void)v25);
      if (v16 && xpc_activity_should_defer(v16))
      {
        uint64_t v125 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)CFStringRef v187 = v26;
          _os_log_impl((void *)&_mh_execute_header, v125, OS_LOG_TYPE_DEFAULT, "*warn* Deferring activity to update application information for %@ and more", buf, 0xCu);
        }

        xpc_activity_set_state(v16, 3);
        os_log_type_t v121 = v139;
        v139[2](v139);
        id v15 = v133;
LABEL_138:
        long long v120 = v145;
        goto LABEL_139;
      }
      context = v27;
      size_t v28 = [v26 displayIdentifier];
      v161 = [v14 objectForKeyedSubscript:v28];
      CFStringRef v162 = [v26 displayName];
      if (v19
        || !v161
        || [v161 compare:v162]
        || ([v143 containsObject:v28] & 1) != 0
        || [v140 containsObject:v28])
      {
        id v29 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v28 allowPlaceholder:1 error:0];
        if (([v29 isLaunchProhibited] & 1) == 0)
        {
          v157 = [v29 URL];
          v30 = +[SPApplicationIndexer attributeSetForApp];
          [v30 setDisplayName:v162];
          if (v162)
          {
            if (([v26 isWebClip] & 1) != 0
              || ([v26 isAppClip] & 1) != 0)
            {
              goto LABEL_24;
            }
            id v31 = [v29 applicationState];
            if ([v31 isPlaceholder]) {
              goto LABEL_23;
            }
            CFArrayRef v32 = [v29 applicationState];
            if ([v32 isInstalled])
            {

LABEL_23:
LABEL_24:
              CFArrayRef v33 = +[SPCorrectionHandler sharedHandler];
              id v176 = 0;
              CFStringRef v34 = [v33 getCorrections:v162 forLanguage:v154 version:&v176];
              id v35 = v176;

              if (v34) {
                [v30 setAttribute:v34 forKey:off_1000A8870[0]];
              }
              CFIndex v36 = +[SPCorrectionHandler sharedHandler];
              os_log_type_t v37 = [v36 versionForLanguage:v154];
              unsigned int v38 = [v35 isEqualToString:v37];

              if (v38)
              {
                [v30 setAttribute:v154 forKey:off_1000A8880[0]];
                [v30 setAttribute:v35 forKey:off_1000A8878[0]];
              }

              id v14 = v149;
              uint64_t v20 = v150;
LABEL_34:
              id v44 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v28 allowPlaceholder:0 error:0];

              os_log_type_t v45 = SPLogForSPLogCategoryDefault();
              os_log_type_t v46 = gSPLogInfoAsDefault ^ 1;
              BOOL v47 = os_log_type_enabled(v45, (os_log_type_t)(gSPLogInfoAsDefault ^ 1));
              if (v44)
              {
                if (v47)
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)CFStringRef v187 = v28;
                  _os_log_impl((void *)&_mh_execute_header, v45, v46, "setting isPlaceholder to NO for %@", buf, 0xCu);
                }

                [v30 setIsPlaceholder:&__kCFBooleanFalse];
              }
              else
              {
                if (v47)
                {
                  os_log_type_t v48 = [v29 applicationState];
                  unsigned int v49 = [v48 isPlaceholder];
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)CFStringRef v187 = v49;
                  *(_WORD *)&v187[4] = 2112;
                  *(void *)&v187[6] = v28;
                  _os_log_impl((void *)&_mh_execute_header, v45, v46, "setting isPlaceholder to %d for %@", buf, 0x12u);
                }
                id v50 = [v29 applicationState];
                id v51 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v50 isPlaceholder]);
                [v30 setIsPlaceholder:v51];
              }
              v52 = [v29 registrationDate];
              [v30 setContentCreationDate:v52];

              [v30 setAttribute:&off_100098B28 forKey:off_1000A8868[0]];
              os_log_type_t v53 = +[NSMutableSet set];
              id v54 = [v29 iTunesMetadata];
              uint64_t v55 = [v54 artistName];

              if (v55
                || (uint64_t v55 = @"Apple Inc.", [v28 hasPrefix:@"com.apple."]))
              {
                [v30 setVendorName:v55];
              }
              if (v157)
              {
                [(SPApplicationIndexer *)self addDefaultBundleInformationForURL:v157 attrSet:v30 altNames:v53 namesOnly:0 withApp:v26 enName:0];
                id v56 = [v30 displayName];
                os_log_type_t v57 = (unsigned __int8 *)[v56 cStringUsingEncoding:4];

                id v58 = [v30 languages];
                if ((unint64_t)[v58 count] > 1) {
                  goto LABEL_46;
                }
                if (((char)*v57 & 0x80000000) == 0) {
                  goto LABEL_92;
                }
                unint64_t v83 = *v57;
                if ((~(v83 >> 4) & 0xC) != 0) {
                  goto LABEL_92;
                }
                uint64_t v84 = byte_10007498D[v83 >> 4];
                unsigned int v85 = v83 & byte_100074988[v84];
                uint64_t v84 = v84 <= 2 ? 2 : v84;
                uint64_t v86 = v84 - 1;
                BOOL v87 = (char *)(v57 + 1);
                do
                {
                  unsigned int v88 = v85;
                  char v89 = *v87++;
                  unsigned int v85 = v89 & 0x3F | (v85 << 6);
                  --v86;
                }
                while (v86);
                if (v85 >> 8 >= 0x11
                  && ((v88 & 0x3FFFFFC) == 0x44 || ((v88 << 6) - 11904) >> 7 < 0x197 || v85 - 65376 < 0x50))
                {
LABEL_46:
                }
                else
                {
LABEL_92:
                  char HasExtraInformation = SSApplicationHasExtraInformation();

                  if ((HasExtraInformation & 1) == 0)
                  {
LABEL_49:
                    unint64_t v59 = SSBuildExtraApplicationAlternateNames();

                    if ([v59 count])
                    {
                      uint64_t v60 = [v59 allObjects];
                      [v30 setAlternateNames:v60];
                    }
                    if (qword_1000A8E20) {
                      [v30 setValue:qword_1000A8E20 forCustomKey:qword_1000A8E18];
                    }
                    if ([v155 count])
                    {
                      unint64_t v61 = [v155 objectForKey:v28];

                      if (v61)
                      {
                        uint64_t v62 = [v155 objectForKey:v28];
                        id v63 = objc_opt_new();
                        uint64_t v64 = [v62 objectAtIndexedSubscript:0];

                        if (v64)
                        {
                          v65 = [v62 objectAtIndexedSubscript:0];
                          [v63 setObject:v65 forKeyedSubscript:v138];
                        }
                        uint64_t v66 = [v62 objectAtIndexedSubscript:1];

                        if (v66)
                        {
                          v67 = [v62 objectAtIndexedSubscript:1];
                          [v63 setObject:v67 forKeyedSubscript:v137];
                        }
                        id v68 = [v62 objectAtIndexedSubscript:2];

                        if (v68)
                        {
                          uint64_t v69 = [v62 objectAtIndexedSubscript:2];
                          [v63 setObject:v69 forKeyedSubscript:v136];
                        }
                        id v70 = [v62 objectAtIndexedSubscript:3];

                        if (v70)
                        {
                          v71 = [v62 objectAtIndexedSubscript:3];
                          [v63 setObject:v71 forKeyedSubscript:v135];
                        }
                        v72 = [v62 objectAtIndexedSubscript:4];

                        if (v72)
                        {
                          id v73 = objc_alloc((Class)NSDate);
                          id v74 = [v62 objectAtIndexedSubscript:4];
                          [v74 doubleValue];
                          id v75 = objc_msgSend(v73, "initWithTimeIntervalSinceReferenceDate:");
                          [v63 setObject:v75 forKeyedSubscript:v134];
                        }
                        [v30 addAttributesFromDictionary:v63];

                        id v14 = v149;
                        uint64_t v20 = v150;
                      }
                    }
                    if ([v26 isWebClip])
                    {
                      uint64_t v184 = v142;
                      v185 = &__kCFBooleanTrue;
                      id v76 = +[NSDictionary dictionaryWithObjects:&v185 forKeys:&v184 count:1];
                      [v30 addAttributesFromDictionary:v76];
                    }
                    if ([v26 isAppClip])
                    {
                      uint64_t v182 = v141;
                      long long v77 = [v26 appBundleIdentifier];
                      v183 = v77;
                      long long v78 = +[NSDictionary dictionaryWithObjects:&v183 forKeys:&v182 count:1];
                      [v30 addAttributesFromDictionary:v78];
                    }
                    long long v79 = SPLogForSPLogCategoryDefault();
                    os_log_type_t v80 = gSPLogInfoAsDefault ^ 1;
                    if (os_log_type_enabled(v79, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)CFStringRef v187 = v28;
                      _os_log_impl((void *)&_mh_execute_header, v79, v80, "adding app %@", buf, 0xCu);
                    }

                    id v81 = [objc_alloc((Class)CSSearchableItem) initWithUniqueIdentifier:v28 domainIdentifier:0 attributeSet:v30];
                    if ([v26 isAppClip]) {
                      id v82 = v20;
                    }
                    else {
                      id v82 = v148;
                    }
                    [v82 addObject:v81];

                    id v16 = v147;
LABEL_76:
                    os_log_type_t v21 = v152;
                    goto LABEL_77;
                  }
                }
              }
              else if (![v26 isAppClip])
              {
                goto LABEL_49;
              }
              [v145 addObject:v28];
              goto LABEL_49;
            }
            uint64_t v39 = [v29 applicationState];
            unsigned __int8 v132 = [v39 isValid];

            id v16 = v147;
            if (v132) {
              goto LABEL_24;
            }
          }
          os_log_type_t v40 = [v29 applicationState];
          unsigned __int8 v41 = [v40 isValid];

          id v42 = SPLogForSPLogCategoryDefault();
          BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
          if (v41)
          {
            if (v43)
            {
              *(_DWORD *)buf = 138412290;
              *(void *)CFStringRef v187 = v29;
              _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "missing name for app %@", buf, 0xCu);
            }

            getpid();
            SimulateCrash();
            goto LABEL_34;
          }
          if (v43)
          {
            *(_DWORD *)buf = 138412290;
            *(void *)CFStringRef v187 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Skipping invalid app %@", buf, 0xCu);
          }

          if (![v26 isAppClip])
          {
            [v146 addObject:v28];
            goto LABEL_76;
          }
          os_log_type_t v21 = v152;
          [v152 addObject:v28];
LABEL_77:

          BOOL v19 = a8;
          id v24 = v151;
        }

        id v18 = v160;
      }

      id v25 = (char *)v25 + 1;
    }
    while (v25 != v24);
    id v91 = [obj countByEnumeratingWithState:&v177 objects:v188 count:16];
    id v24 = v91;
  }
  while (v91);
LABEL_100:

  id obj = +[SDAppUninstallMonitor applicationsExcludedFromUninstall];
  if (!v19)
  {
    long long v175 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    long long v172 = 0u;
    id v92 = v14;
    id v93 = [v92 countByEnumeratingWithState:&v172 objects:v181 count:16];
    if (!v93) {
      goto LABEL_122;
    }
    id v94 = v93;
    uint64_t v95 = *(void *)v173;
    while (1)
    {
      id v96 = 0;
      do
      {
        if (*(void *)v173 != v95) {
          objc_enumerationMutation(v92);
        }
        uint64_t v97 = *(void *)(*((void *)&v172 + 1) + 8 * (void)v96);
        uint64_t v98 = [v18 objectForKey:v97];

        if (!v98)
        {
          if ([obj containsObject:v97])
          {
            v99 = SPLogForSPLogCategoryDefault();
            os_log_type_t v100 = gSPLogInfoAsDefault ^ 1;
            if (os_log_type_enabled(v99, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)CFStringRef v187 = v97;
              CFStringRef v101 = v99;
              os_log_type_t v102 = v100;
              CFStringRef v103 = "Skipped app %@ since it's excluded from uninstall";
              goto LABEL_113;
            }
            goto LABEL_114;
          }
          id v104 = +[LSBundleRecord bundleRecordWithBundleIdentifier:v97 allowPlaceholder:1 error:0];
          v105 = [v104 URL];

          v99 = SPLogForSPLogCategoryDefault();
          os_log_type_t v106 = gSPLogInfoAsDefault ^ 1;
          BOOL v107 = os_log_type_enabled(v99, (os_log_type_t)(gSPLogInfoAsDefault ^ 1));
          if (v105)
          {
            if (v107)
            {
              *(_DWORD *)buf = 138412290;
              *(void *)CFStringRef v187 = v97;
              os_log_type_t v102 = v106;
              CFStringRef v101 = v99;
              CFStringRef v103 = "Skipped app %@ since it still has a URL";
LABEL_113:
              _os_log_impl((void *)&_mh_execute_header, v101, v102, v103, buf, 0xCu);
            }
LABEL_114:
          }
          else
          {
            if (v107)
            {
              *(_DWORD *)buf = 138412290;
              *(void *)CFStringRef v187 = v97;
              _os_log_impl((void *)&_mh_execute_header, v99, v106, "deleting app %@", buf, 0xCu);
            }

            [v146 addObject:v97];
          }
          id v18 = v160;
        }
        id v96 = (char *)v96 + 1;
      }
      while (v94 != v96);
      id v108 = [v92 countByEnumeratingWithState:&v172 objects:v181 count:16];
      id v94 = v108;
      if (!v108)
      {
LABEL_122:

        id v14 = v149;
        uint64_t v20 = v150;
        id v16 = v147;
        os_log_type_t v21 = v152;
        break;
      }
    }
  }
  if ([v148 count]
    || [v146 count]
    || [v20 count]
    || [v21 count])
  {
    v109 = SPLogForSPLogCategoryDefault();
    os_log_type_t v110 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v109, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      unsigned int v111 = [v148 count];
      unsigned int v112 = [v146 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)CFStringRef v187 = v111;
      *(_WORD *)&v187[4] = 1024;
      *(_DWORD *)&v187[6] = v112;
      _os_log_impl((void *)&_mh_execute_header, v109, v110, "Indexing applications %d adds %d deletes", buf, 0xEu);
    }

    long long v113 = SPLogForSPLogCategoryDefault();
    os_log_type_t v114 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v113, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      long long v115 = objc_retainBlock(v139);
      *(_DWORD *)buf = 134217984;
      *(void *)CFStringRef v187 = v115;
      _os_log_impl((void *)&_mh_execute_header, v113, v114, "2.4 call indexSearchableItems completion %p", buf, 0xCu);
    }
    id v116 = +[SPCoreSpotlightIndexer sharedInstance];
    uint64_t v163 = SPApplicationBundleIdGeneralApplication;
    v164[0] = _NSConcreteStackBlock;
    v164[1] = 3221225472;
    v164[2] = sub_100024EA0;
    v164[3] = &unk_100092D28;
    id v165 = v20;
    long long v117 = v152;
    id v166 = v152;
    id v167 = v145;
    id v168 = v133;
    v171 = v139;
    id v169 = self;
    uint64_t v170 = v16;
    id v118 = v148;
    long long v119 = v146;
    long long v120 = v145;
    id v15 = v133;
    [v116 indexSearchableItems:v148 deleteSearchableItemsWithIdentifiers:v146 clientState:0 protectionClass:NSFileProtectionCompleteUntilFirstUserAuthentication forBundleID:v163 options:0 completionHandler:v164];

    os_log_type_t v121 = v139;
    uint64_t v20 = v150;
  }
  else
  {
    id v15 = v133;
    if (![v133 count] && !objc_msgSend(v145, "count"))
    {
      CFStringRef v129 = SPLogForSPLogCategoryDefault();
      os_log_type_t v130 = gSPLogInfoAsDefault ^ 1;
      if (os_log_type_enabled(v129, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
      {
        id v131 = objc_retainBlock(v139);
        *(_DWORD *)buf = 134217984;
        *(void *)CFStringRef v187 = v131;
        _os_log_impl((void *)&_mh_execute_header, v129, v130, "2.3 call completion %p", buf, 0xCu);
      }
      os_log_type_t v121 = v139;
      v139[2](v139);
      goto LABEL_138;
    }
    id v126 = SPLogForSPLogCategoryDefault();
    os_log_type_t v127 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v126, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      CFArrayRef v128 = objc_retainBlock(v139);
      *(_DWORD *)buf = 134217984;
      *(void *)CFStringRef v187 = v128;
      _os_log_impl((void *)&_mh_execute_header, v126, v127, "2.4 call updateApplicationMetadata completion %p", buf, 0xCu);
    }
    long long v120 = v145;
    os_log_type_t v121 = v139;
    [(SPApplicationIndexer *)self updateApplicationMetadata:v133 appsRequiringLocalization:v145 activity:v16 completion:v139];
LABEL_139:
    id v118 = v148;
    long long v119 = v146;
    long long v117 = v152;
  }

LABEL_141:
}

- (void)updateShortcuts:(id)a3
{
  objc_super v3 = a3;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100020818;
  v30[4] = sub_100020828;
  id v31 = 0;
  id v31 = (id)objc_opt_new();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100020818;
  v28[4] = sub_100020828;
  id v29 = 0;
  id v29 = (id)objc_opt_new();
  v4 = dispatch_group_create();
  v5 = SPLogForSPLogCategoryDefault();
  os_log_type_t v6 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v5, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "[TopHitAppShortcuts] updateShortcuts start", buf, 2u);
  }

  v7 = objc_opt_new();
  [v7 setInternal:1];
  [v7 setLowPriority:0];
  uint64_t v35 = MDItemRelatedAppBundleIdentifier;
  v8 = +[NSArray arrayWithObjects:&v35 count:1];
  [v7 setFetchAttributes:v8];

  NSFileProtectionType v34 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  id v9 = +[NSArray arrayWithObjects:&v34 count:1];
  [v7 setProtectionClasses:v9];

  [v7 setBundleIDs:&off_100099128];
  [v7 setAttribute:1];
  id v10 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:@"com_apple_shortcuts_runnable_is_app_shortcut_top_hit=1" context:v7];
  if (v10)
  {
    dispatch_group_enter(v4);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10002571C;
    v26[3] = &unk_100092D50;
    v26[4] = v30;
    [v10 setFoundAttributesHandler:v26];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100025790;
    v24[3] = &unk_100091E18;
    id v25 = v4;
    [v10 setCompletionHandler:v24];
  }
  [v10 start];

  if (v10)
  {
    id v11 = objc_opt_new();
    [v11 setInternal:1];
    [v11 setLowPriority:0];
    [v11 setFetchAttributes:&off_100099140];
    NSFileProtectionType v33 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    id v12 = +[NSArray arrayWithObjects:&v33 count:1];
    [v11 setProtectionClasses:v12];

    uint64_t v32 = SPApplicationBundleIdGeneralApplication;
    id v13 = +[NSArray arrayWithObjects:&v32 count:1];
    [v11 setBundleIDs:v13];

    id v14 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:@"_kMDItemHasTopHitAppShortcuts=1" context:v11];
    if (v14)
    {
      dispatch_group_enter(v4);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1000257FC;
      v23[3] = &unk_100091DF0;
      v23[4] = v28;
      [v14 setFoundItemsHandler:v23];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100025914;
      v21[3] = &unk_100091E18;
      uint64_t v22 = v4;
      [v14 setCompletionHandler:v21];
      [v14 start];
    }
  }
  if (v3) {
    dispatch_group_enter(v3);
  }
  id v15 = qword_1000A8E30;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025980;
  block[3] = &unk_100092DA0;
  BOOL v19 = v28;
  uint64_t v20 = v30;
  id v18 = v3;
  id v16 = v3;
  dispatch_group_notify(v4, v15, block);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
}

- (void)updateApplications:(id)a3 appBundleArray:(id)a4 clean:(BOOL)a5 activity:(id)a6
{
  v8 = a3;
  id v9 = a4;
  id v38 = a6;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = sub_100020818;
  v68[4] = sub_100020828;
  id v69 = 0;
  os_log_type_t v37 = v9;
  if (v9)
  {
    id v10 = +[NSMutableSet setWithArray:v9];
  }
  else
  {
    id v10 = 0;
  }
  id v69 = v10;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = sub_100020818;
  v66[4] = sub_100020828;
  id v67 = 0;
  id v67 = (id)objc_opt_new();
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = sub_100020818;
  v64[4] = sub_100020828;
  id v65 = 0;
  id v65 = (id)objc_opt_new();
  uint64_t v58 = 0;
  unint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000;
  unint64_t v61 = sub_100020818;
  uint64_t v62 = sub_100020828;
  id v63 = 0;
  id v11 = +[NSLocale currentLocale];
  id v63 = [v11 objectForKey:NSLocaleLanguageCode];

  uint64_t v40 = SSExtraApplicationVersion();
  id v12 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [ (id) v59[5] UTF8String];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v40;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating apps with language %s and extras version %ld", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v74 = sub_100020818;
  id v75 = sub_100020828;
  id v76 = 0;
  id v76 = +[NSMutableArray array];
  id v14 = SPFastApplicationsGetNoBuild();
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_1000276A8;
  v70[3] = &unk_100092E40;
  v70[4] = buf;
  [v14 enumerateKeysAndObjectsUsingBlock:v70];
  id v15 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  id v16 = SPLogForSPLogCategoryDefault();
  os_log_type_t v17 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v16, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Checking for existing applications", buf, 2u);
  }

  id v18 = objc_opt_new();
  [v18 setInternal:1];
  [v18 setLowPriority:0];
  v72[0] = MDItemUniqueIdentifier;
  v72[1] = MDItemDisplayName;
  v72[2] = off_1000A8868[0];
  v72[3] = off_1000A8860[0];
  v72[4] = off_1000A8878[0];
  v72[5] = off_1000A8880[0];
  v72[6] = MDItemRankingLaunchCountDay;
  v72[7] = MDItemRankingLaunchCountLast7Days;
  v72[8] = MDItemRankingLaunchCountLast30Days;
  v72[9] = MDItemRankingLaunchCountOld;
  v72[10] = MDItemApplicationLastLaunchedDate;
  v72[11] = off_1000A8888;
  v72[12] = MDItemIsPlaceholder;
  BOOL v19 = +[NSArray arrayWithObjects:v72 count:13];
  [v18 setFetchAttributes:v19];

  NSFileProtectionType v71 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  uint64_t v20 = +[NSArray arrayWithObjects:&v71 count:1];
  [v18 setProtectionClasses:v20];

  os_log_type_t v21 = +[SPApplicationMetadataUpdater sharedInstance];
  uint64_t v22 = [v21 appMetadata];

  id v23 = objc_opt_new();
  id v24 = objc_opt_new();
  id v25 = [v18 fetchAttributes];
  id v26 = [v25 count];

  id v42 = +[SPCoreSpotlightIndexer sharedInstance];
  uint64_t v27 = SPLogForSPLogCategoryDefault();
  os_log_type_t v28 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v27, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "2 Enter group %p", buf, 0xCu);
  }

  if (v8) {
    dispatch_group_enter(v8);
  }
  id v29 = +[NSString stringWithFormat:@"%@=%@", MDItemContentType, SPUTIAppType];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100026998;
  v43[3] = &unk_100092E18;
  id v55 = v26;
  id v51 = v66;
  v52 = v68;
  id v30 = v22;
  id v44 = v30;
  id v31 = v23;
  id v45 = v31;
  id v32 = v24;
  id v46 = v32;
  os_log_type_t v53 = &v58;
  id v33 = v15;
  uint64_t v56 = v40;
  id v47 = v33;
  id v54 = v64;
  NSFileProtectionType v34 = v8;
  os_log_type_t v48 = v34;
  unsigned int v49 = self;
  BOOL v57 = a5;
  id v35 = v38;
  id v50 = v35;
  CFIndex v36 = [v42 startQuery:v29 withContext:v18 handler:v43];

  if (v8)
  {
    [(SPApplicationIndexer *)self updateShortcuts:v34];
    if (!v36) {
      dispatch_group_leave(v34);
    }
  }

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);
}

- (int)changedToken
{
  return self->_changedToken;
}

- (NSMutableSet)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end