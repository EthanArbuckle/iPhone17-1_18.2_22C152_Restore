@interface PurchaseDownloadsTransaction
- (BOOL)_addPlaceholderDownloadForPurchase:(id)a3 clientIdentifier:(id)a4;
- (BOOL)_cancelDownloadForPurchaseIdentifier:(int64_t)a3;
- (BOOL)_insertPurchases:(id)a3 forClient:(id)a4 orderIdentifier:(double)a5 orderSpacing:(double)a6;
- (BOOL)addPurchases:(id)a3 forClient:(id)a4;
- (BOOL)cancelPurchaseWithIdentifier:(int64_t)a3 applyingProperties:(id)a4;
- (BOOL)deletePurchaseWithIdentifier:(int64_t)a3;
- (BOOL)insertPurchases:(id)a3 afterPurchaseWithIdentifier:(int64_t)a4 forClient:(id)a5;
- (BOOL)movePurchasesWithIdentifiers:(id)a3 afterPurchaseWithIdentifier:(int64_t)a4;
- (BOOL)replaceDownloadsInQuery:(id)a3 withStoreDownloads:(id)a4 accountID:(id)a5;
- (BOOL)resetPurchasedAutoUpdateForStoreItemID:(id)a3;
- (double)_maxOrderIdentifier;
- (id)_addEntityForPurchase:(id)a3 managerIdentifier:(int64_t)a4 orderIdentifier:(double)a5;
- (id)existingDownloadForPurchase:(id)a3;
- (id)replacePurchase:(id)a3 withDownloadQueueResponse:(id)a4;
- (id)replacePurchase:(id)a3 withDownloadQueueResponse:(id)a4 withClientIdentifier:(id)a5;
- (int64_t)_nextBatchIdentifier;
- (void)_getInsertOrderID:(double *)a3 nextOrderID:(double *)a4 afterPurchaseID:(int64_t)a5;
@end

@implementation PurchaseDownloadsTransaction

- (BOOL)addPurchases:(id)a3 forClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PurchaseDownloadsTransaction *)self _maxOrderIdentifier];
  LOBYTE(self) = -[PurchaseDownloadsTransaction _insertPurchases:forClient:orderIdentifier:orderSpacing:](self, "_insertPurchases:forClient:orderIdentifier:orderSpacing:", v7, v6);

  return (char)self;
}

- (BOOL)cancelPurchaseWithIdentifier:(int64_t)a3 applyingProperties:(id)a4
{
  id v6 = a4;
  if ([(PurchaseDownloadsTransaction *)self _cancelDownloadForPurchaseIdentifier:a3])
  {
    id v7 = [PurchaseEntity alloc];
    v8 = [(DownloadsSession *)self database];
    v9 = [(PurchaseEntity *)v7 initWithPersistentID:a3 inDatabase:v8];

    if ([v6 count])
    {
      id v10 = [v6 mutableCopy];
      v11 = +[NSNumber numberWithInteger:2];
      [v10 setObject:v11 forKey:@"state"];

      unsigned __int8 v12 = [(PurchaseEntity *)v9 setValuesWithDictionary:v10];
    }
    else
    {
      id v10 = +[NSNumber numberWithInteger:2];
      unsigned __int8 v12 = [(PurchaseEntity *)v9 setValue:v10 forProperty:@"state"];
    }
    BOOL v13 = v12;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)deletePurchaseWithIdentifier:(int64_t)a3
{
  BOOL v5 = -[PurchaseDownloadsTransaction _cancelDownloadForPurchaseIdentifier:](self, "_cancelDownloadForPurchaseIdentifier:");
  if (v5)
  {
    id v6 = [PurchaseEntity alloc];
    id v7 = [(DownloadsSession *)self database];
    v8 = [(PurchaseEntity *)v6 initWithPersistentID:a3 inDatabase:v7];

    LOBYTE(v7) = [(PurchaseEntity *)v8 deleteFromDatabase];
    LOBYTE(v5) = (_BYTE)v7;
  }
  return v5;
}

- (id)existingDownloadForPurchase:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10019E4EC;
  v19 = sub_10019E4FC;
  id v20 = 0;
  BOOL v5 = [v4 valueForDownloadProperty:SSDownloadPropertyStoreItemIdentifier];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 longLongValue];
    if (v7)
    {
      v8 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"store_item_id" equalToLongLong:v7];
      v9 = [(DownloadsSession *)self database];
      id v10 = +[Download queryWithDatabase:v9 predicate:v8];

      v21[0] = @"IFNULL(download_state.phase, \"SSDownloadPhaseWaiting\")";
      v21[1] = @"kind";
      v21[2] = @"is_purchase";
      v21[3] = @"purchase_id";
      v11 = +[NSArray arrayWithObjects:v21 count:4];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10019E504;
      v14[3] = &unk_1003A8DC0;
      v14[4] = self;
      v14[5] = &v15;
      [v10 enumerateMemoryEntitiesWithProperties:v11 usingBlock:v14];
    }
  }
  id v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v12;
}

- (BOOL)insertPurchases:(id)a3 afterPurchaseWithIdentifier:(int64_t)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v14 = 0.0;
  double v15 = 0.0;
  [(PurchaseDownloadsTransaction *)self _getInsertOrderID:&v15 nextOrderID:&v14 afterPurchaseID:a4];
  if (v14 <= 0.0)
  {
    double v11 = 100.0;
  }
  else
  {
    double v10 = vabdd_f64(v14, v15);
    double v11 = v10 / (double)((unint64_t)[v8 count] + 1);
  }
  BOOL v12 = [(PurchaseDownloadsTransaction *)self _insertPurchases:v8 forClient:v9 orderIdentifier:v15 orderSpacing:v11];

  return v12;
}

- (BOOL)movePurchasesWithIdentifiers:(id)a3 afterPurchaseWithIdentifier:(int64_t)a4
{
  id v6 = a3;
  double v25 = 0.0;
  double v26 = 0.0;
  [(PurchaseDownloadsTransaction *)self _getInsertOrderID:&v26 nextOrderID:&v25 afterPurchaseID:a4];
  if (v25 <= 0.0)
  {
    double v8 = 100.0;
  }
  else
  {
    double v7 = vabdd_f64(v25, v26);
    double v8 = v7 / (double)((unint64_t)[v6 count] + 1);
  }
  id v9 = [(DownloadsSession *)self database];
  double v10 = v26;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        double v10 = v8 + v10;
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v17 = [PurchaseEntity alloc];
        v18 = -[PurchaseEntity initWithPersistentID:inDatabase:](v17, "initWithPersistentID:inDatabase:", objc_msgSend(v16, "longLongValue", (void)v21), v9);
        v19 = +[NSNumber numberWithDouble:v10];
        [(PurchaseEntity *)v18 setValue:v19 forProperty:@"order_id"];
      }
      id v13 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v13);
  }

  return 1;
}

- (BOOL)resetPurchasedAutoUpdateForStoreItemID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SSSQLiteQueryDescriptor);
  [v5 setEntityClass:objc_opt_class()];
  [v5 setLimitCount:1];
  CFStringRef v20 = @"auto_update_time";
  id v6 = +[NSArray arrayWithObjects:&v20 count:1];
  [v5 setOrderingProperties:v6];

  uint64_t v19 = SSSQLiteOrderDescending;
  double v7 = +[NSArray arrayWithObjects:&v19 count:1];
  [v5 setOrderingDirections:v7];

  double v8 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_private" equalToValue:&__kCFBooleanTrue];
  id v9 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_automatic" equalToValue:&off_1003C94B0];
  double v10 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"store_item_id" equalToValue:v4];

  v18[0] = v8;
  v18[1] = v9;
  v18[2] = v10;
  id v11 = +[NSArray arrayWithObjects:v18 count:3];
  id v12 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v11];
  [v5 setPredicate:v12];

  id v13 = objc_alloc((Class)SSSQLiteQuery);
  uint64_t v14 = [(DownloadsSession *)self database];
  id v15 = [v13 initWithDatabase:v14 descriptor:v5];

  id v16 = [v15 copyEntityIdentifiers];
  LOBYTE(self) = [(DownloadsTransaction *)self resetDownloadsWithIdentifiers:v16 isUserInitiated:0];

  return (char)self;
}

- (BOOL)replaceDownloadsInQuery:(id)a3 withStoreDownloads:(id)a4 accountID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 1;
  v30 = v7;
  id v10 = [v7 copyEntityIdentifiers];
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10019F084;
  v32[3] = &unk_1003A8DE8;
  id v14 = v9;
  id v33 = v14;
  v34 = self;
  id v15 = v12;
  id v35 = v15;
  id v16 = v13;
  id v36 = v16;
  v39 = &v40;
  id v17 = v11;
  id v37 = v17;
  id v18 = v10;
  id v38 = v18;
  [v8 enumerateObjectsUsingBlock:v32];
  if (*((unsigned char *)v41 + 24) && [v18 count])
  {
    uint64_t v19 = +[SSLogConfig sharedDaemonConfig];
    if (!v19)
    {
      uint64_t v19 = +[SSLogConfig sharedConfig];
    }
    unsigned int v20 = [v19 shouldLog];
    unsigned int v21 = [v19 shouldLogToDisk];
    long long v22 = [v19 OSLogObject];
    long long v23 = v22;
    if (v21) {
      v20 |= 2u;
    }
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      v20 &= 2u;
    }
    if (v20)
    {
      id v24 = (id)objc_opt_class();
      id v25 = [v18 count];
      int v44 = 138412546;
      id v45 = v24;
      __int16 v46 = 2048;
      id v47 = v25;
      LODWORD(v29) = 22;
      double v26 = (void *)_os_log_send_and_compose_impl();

      if (!v26)
      {
LABEL_13:

        [(DownloadsTransaction *)self finishDownloadsWithIdentifiers:v18 finalPhase:SSDownloadPhaseCanceled];
        goto LABEL_14;
      }
      long long v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v26, 4, &v44, v29);
      free(v26);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
  if (*((unsigned char *)v41 + 24) && [v15 count]) {
    +[AppStoreUtility sendSoftwareDownloads:v15 withReason:@"download queue request"];
  }
  if (*((unsigned char *)v41 + 24) && [v16 count]) {
    +[BookAssetDaemonUtility sendBookStoreDownloads:v16 withReason:@"download queue request"];
  }
  BOOL v27 = *((unsigned char *)v41 + 24) != 0;

  _Block_object_dispose(&v40, 8);
  return v27;
}

- (id)replacePurchase:(id)a3 withDownloadQueueResponse:(id)a4
{
  return [(PurchaseDownloadsTransaction *)self replacePurchase:a3 withDownloadQueueResponse:a4 withClientIdentifier:@"com.apple.itunesstored"];
}

- (id)replacePurchase:(id)a3 withDownloadQueueResponse:(id)a4 withClientIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v130 = a5;
  id v9 = +[NSMutableOrderedSet orderedSet];
  id v10 = [v8 downloads];
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v137 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  id v134 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  if ([v10 count] == (id)1)
  {
    id v12 = [v7 valueForDownloadProperty:SSDownloadPropertyKind];
    if (v12 && !SSDownloadKindIsMediaKind())
    {
      v150 = 0;
    }
    else
    {
      v150 = [v7 buyParameters];
    }
  }
  else
  {
    v150 = 0;
  }
  id v13 = +[ApplicationWorkspace defaultWorkspace];
  unsigned int v143 = [v13 isMultiUser];

  id v14 = [(DownloadsSession *)self placeholderDownloadForPurchase:v7];
  v132 = v14;
  if (v14) {
    id v131 = [v14 persistentID];
  }
  else {
    id v131 = 0;
  }
  id v15 = [v7 downloadPolicy];
  id v16 = &syslog_ptr;
  if (v15)
  {
    id v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17)
    {
      id v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    unsigned int v20 = [v17 OSLogObject];
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
      v19 &= 2u;
    }
    if (!v19)
    {

      v138 = 0;
      goto LABEL_38;
    }
    id v21 = (id)objc_opt_class();
    int v164 = 138412546;
    id v165 = v21;
    __int16 v166 = 2112;
    id v167 = v15;
    LODWORD(v127) = 22;
    v125 = &v164;
    long long v22 = (void *)_os_log_send_and_compose_impl();

    if (v22)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, &v164, v127);
      long long v23 = (int *)objc_claimAutoreleasedReturnValue();
      free(v22);
      v125 = v23;
      SSFileLog();
    }
    v138 = 0;
  }
  else
  {
    v138 = [v7 networkConstraints];
    if (!v138)
    {
      v138 = 0;
      goto LABEL_39;
    }
    id v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17)
    {
      id v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v24 = [v17 shouldLog];
    if ([v17 shouldLogToDisk]) {
      int v25 = v24 | 2;
    }
    else {
      int v25 = v24;
    }
    double v26 = [v17 OSLogObject];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
      v25 &= 2u;
    }
    if (!v25)
    {

      goto LABEL_38;
    }
    id v27 = (id)objc_opt_class();
    int v164 = 138412546;
    id v165 = v27;
    __int16 v166 = 2112;
    id v167 = v138;
    LODWORD(v127) = 22;
    v125 = &v164;
    v28 = (void *)_os_log_send_and_compose_impl();

    if (v28)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v28, 4, &v164, v127);
      uint64_t v29 = (int *)objc_claimAutoreleasedReturnValue();
      free(v28);
      v125 = v29;
      SSFileLog();
    }
  }
  id v16 = &syslog_ptr;
LABEL_38:

LABEL_39:
  v30 = objc_msgSend(v7, "requestProperties", v125);
  v31 = [v30 URLBagKey];
  unsigned int v32 = [v31 isEqualToString:@"subDownload"];

  id v33 = &off_1003C94B0;
  unsigned int v142 = v32;
  if (!v32) {
    id v33 = 0;
  }
  v136 = v33;
  v145 = [v7 valueForDownloadProperty:SSDownloadPropertyEnableExtensions];
  v144 = [v8 userIdentifier];
  v146 = [v7 filteredAssetTypes];
  v149 = [v7 valueForDownloadProperty:SSDownloadPropertyShouldCancelIfDuplicate];
  v34 = [v16[405] sharedDaemonConfig];
  if (!v34)
  {
    v34 = [v16[405] sharedConfig];
  }
  v133 = v11;
  id v129 = v8;
  unsigned int v35 = [v34 shouldLog];
  if ([v34 shouldLogToDisk]) {
    int v36 = v35 | 2;
  }
  else {
    int v36 = v35;
  }
  id v37 = [v34 OSLogObject];
  if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
    v36 &= 2u;
  }
  if (!v36) {
    goto LABEL_51;
  }
  id v38 = (id)objc_opt_class();
  id v39 = [v132 persistentID];
  id v40 = [v10 count];
  int v164 = 138413058;
  id v165 = v38;
  __int16 v166 = 2048;
  id v167 = v39;
  __int16 v168 = 2048;
  id v169 = v40;
  __int16 v170 = 2112;
  v171 = v146;
  LODWORD(v127) = 42;
  v126 = &v164;
  v41 = (void *)_os_log_send_and_compose_impl();

  if (v41)
  {
    id v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v164, v127);
    free(v41);
    v126 = (int *)v37;
    SSFileLog();
LABEL_51:
  }
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id obj = v10;
  id v147 = [obj countByEnumeratingWithState:&v158 objects:v163 count:16];
  if (!v147)
  {
    int v108 = 1;
LABEL_155:
    v109 = v129;
    v110 = v133;
    goto LABEL_158;
  }
  id v128 = v7;
  uint64_t v139 = *(void *)v159;
  uint64_t v135 = SSDownloadPhaseCanceled;
  v140 = v15;
  v141 = v9;
LABEL_54:
  uint64_t v42 = 0;
  while (1)
  {
    if (*(void *)v159 != v139) {
      objc_enumerationMutation(obj);
    }
    char v43 = *(void **)(*((void *)&v158 + 1) + 8 * (void)v42);
    int v44 = [[Download alloc] initWithStoreDownload:v43];
    id v45 = +[NSNumber numberWithBool:0];
    [(Download *)v44 setValue:v45 forProperty:@"is_purchase"];

    __int16 v46 = +[NSNumber numberWithBool:1];
    [(Download *)v44 setValue:v46 forProperty:@"is_from_store"];

    id v47 = +[NSNumber numberWithBool:v143];
    [(Download *)v44 setValue:v47 forProperty:@"is_shared"];

    if (v15)
    {
      [(Download *)v44 setDownloadPolicy:v15];
      v48 = v145;
    }
    else
    {
      v48 = v145;
      if (v138) {
        [(Download *)v44 unionNetworkConstraints:v138];
      }
    }
    if (v144) {
      [(Download *)v44 setValue:v144 forProperty:@"store_account_id"];
    }
    if (v48) {
      [(Download *)v44 setValue:v48 forProperty:@"enable_extensions"];
    }
    if (v150)
    {
      v49 = [(Download *)v44 valueForProperty:@"store_redownload_parameters"];

      if (!v49) {
        [(Download *)v44 setValue:v150 forProperty:@"store_redownload_parameters"];
      }
    }
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    id v50 = v146;
    id v51 = [v50 countByEnumeratingWithState:&v154 objects:v162 count:16];
    if (v51)
    {
      id v52 = v51;
      uint64_t v53 = *(void *)v155;
      do
      {
        for (i = 0; i != v52; i = (char *)i + 1)
        {
          if (*(void *)v155 != v53) {
            objc_enumerationMutation(v50);
          }
          -[Download removeAssetsWithAssetType:](v44, "removeAssetsWithAssetType:", *(void *)(*((void *)&v154 + 1) + 8 * i), v126);
        }
        id v52 = [v50 countByEnumeratingWithState:&v154 objects:v162 count:16];
      }
      while (v52);
    }

    if (v149)
    {
      v55 = [(Download *)v44 valueForProperty:@"cancel_if_duplicate"];

      if (!v55) {
        [(Download *)v44 setValue:v149 forProperty:@"cancel_if_duplicate"];
      }
    }
    if (v142)
    {
      v56 = [(Download *)v44 assets];
      v152[0] = _NSConcreteStackBlock;
      v152[1] = 3221225472;
      v152[2] = sub_1001A13D8;
      v152[3] = &unk_1003A8E10;
      id v153 = v136;
      [v56 enumerateObjectsUsingBlock:v152];
    }
    v57 = -[DownloadsSession downloadForStoreDownload:](self, "downloadForStoreDownload:", v43, v126);
    v58 = [v43 kind];
    int IsSoftwareKind = SSDownloadKindIsSoftwareKind();

    if (!IsSoftwareKind) {
      break;
    }
    [v137 addObject:v44];
    if (v57)
    {
      v60 = +[SSLogConfig sharedDaemonConfig];
      if (!v60)
      {
        v60 = +[SSLogConfig sharedConfig];
      }
      unsigned int v61 = [v60 shouldLog];
      if ([v60 shouldLogToDisk]) {
        int v62 = v61 | 2;
      }
      else {
        int v62 = v61;
      }
      v63 = [v60 OSLogObject];
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO)) {
        int v64 = v62;
      }
      else {
        int v64 = v62 & 2;
      }
      if (v64)
      {
        v65 = objc_opt_class();
        id v66 = v65;
        id v67 = [v57 persistentID];
        int v164 = 138412546;
        id v165 = v65;
        __int16 v166 = 2048;
        id v167 = v67;
        LODWORD(v127) = 22;
        v126 = &v164;
        v68 = (void *)_os_log_send_and_compose_impl();

        if (v68)
        {
          v63 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v68, 4, &v164, v127);
          free(v68);
          v126 = (int *)v63;
          SSFileLog();
          goto LABEL_93;
        }
      }
      else
      {
LABEL_93:
      }
      -[DownloadsTransaction finishDownloadWithID:finalPhase:](self, "finishDownloadWithID:finalPhase:", [v57 persistentID], v135);

      v57 = 0;
    }
LABEL_97:
    id v71 = 0;
    int v72 = 1;
LABEL_98:
    id v73 = [objc_alloc((Class)NSNumber) initWithLongLong:v71];
    v74 = [v43 kind];
    v75 = +[ScratchManager directoryPathForDownloadID:v71 kind:v74 createIfNeeded:1];
    v76 = [v75 stringByAppendingPathComponent:@"iTunesMetadata.plist"];

    [v43 writeToFile:v76 options:0 error:0];
    v77 = [v43 kind];
    LODWORD(v74) = SSDownloadKindIsSoftwareKind();

    if (v74)
    {
      v78 = [v43 bundleIdentifier];
      if (v78) {
        int v79 = v72;
      }
      else {
        int v79 = 0;
      }
      if (v79 == 1) {
        [v133 setObject:v73 forKey:v78];
      }
    }
    id v9 = v141;
    objc_msgSend(v141, "addObject:", v73, v126);

    uint64_t v42 = (char *)v42 + 1;
    id v15 = v140;
    if (v42 == v147)
    {
      id v107 = [obj countByEnumeratingWithState:&v158 objects:v163 count:16];
      id v147 = v107;
      if (!v107)
      {
        int v108 = 1;
        id v7 = v128;
        goto LABEL_155;
      }
      goto LABEL_54;
    }
  }
  v69 = [v43 kind];
  int IsBookToShimKind = SSDownloadKindIsBookToShimKind();

  if (IsBookToShimKind)
  {
    [v134 addObject:v44];
    goto LABEL_97;
  }
  if (v57)
  {
    v80 = +[SSLogConfig sharedDaemonConfig];
    if (!v80)
    {
      v80 = +[SSLogConfig sharedConfig];
    }
    unsigned int v81 = [v80 shouldLog];
    if ([v80 shouldLogToDisk]) {
      v81 |= 2u;
    }
    v82 = [v80 OSLogObject];
    if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO)) {
      int v83 = v81;
    }
    else {
      int v83 = v81 & 2;
    }
    if (v83)
    {
      id v84 = (id)objc_opt_class();
      id v85 = [v57 persistentID];
      int v164 = 138412546;
      id v165 = v84;
      __int16 v166 = 2048;
      id v167 = v85;
      LODWORD(v127) = 22;
      v126 = &v164;
      v86 = (void *)_os_log_send_and_compose_impl();

      if (v86)
      {
        v82 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v86, 4, &v164, v127);
        free(v86);
        v126 = (int *)v82;
        SSFileLog();
        goto LABEL_118;
      }
    }
    else
    {
LABEL_118:
    }
    unsigned __int8 v87 = -[DownloadsTransaction updateDownloadEntityWithIdentifier:withDownload:](self, "updateDownloadEntityWithIdentifier:withDownload:", [v57 persistentID], v44);
    id v88 = [v57 persistentID];
    if ((v87 & 1) == 0) {
      goto LABEL_157;
    }
    id v71 = v88;
    int v72 = 0;
    goto LABEL_98;
  }
  id v89 = [obj count];
  uint64_t v90 = +[SSLogConfig sharedDaemonConfig];
  v91 = (void *)v90;
  if (v89 == (id)1 && v132)
  {
    if (!v90)
    {
      v91 = +[SSLogConfig sharedConfig];
    }
    unsigned int v92 = [v91 shouldLog];
    if ([v91 shouldLogToDisk]) {
      v92 |= 2u;
    }
    v93 = [v91 OSLogObject];
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO)) {
      int v94 = v92;
    }
    else {
      int v94 = v92 & 2;
    }
    if (v94)
    {
      id v95 = (id)objc_opt_class();
      id v96 = [v132 persistentID];
      int v164 = 138412546;
      id v165 = v95;
      __int16 v166 = 2048;
      id v167 = v96;
      LODWORD(v127) = 22;
      v126 = &v164;
      v97 = (void *)_os_log_send_and_compose_impl();

      if (v97)
      {
        v93 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v97, 4, &v164, v127);
        free(v97);
        v126 = (int *)v93;
        SSFileLog();
        goto LABEL_133;
      }
    }
    else
    {
LABEL_133:
    }
    unsigned __int8 v98 = -[DownloadsTransaction updateDownloadEntityWithIdentifier:withDownload:](self, "updateDownloadEntityWithIdentifier:withDownload:", [v132 persistentID], v44);
    id v71 = [v132 persistentID];

    v132 = 0;
    if ((v98 & 1) == 0) {
      goto LABEL_157;
    }
    int v72 = 1;
    v57 = 0;
    goto LABEL_98;
  }
  if (!v90)
  {
    v91 = +[SSLogConfig sharedConfig];
  }
  unsigned int v99 = [v91 shouldLog];
  if ([v91 shouldLogToDisk]) {
    v99 |= 2u;
  }
  v100 = [v91 OSLogObject];
  if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO)) {
    int v101 = v99;
  }
  else {
    int v101 = v99 & 2;
  }
  if (v101)
  {
    id v102 = (id)objc_opt_class();
    int v164 = 138412290;
    id v165 = v102;
    LODWORD(v127) = 12;
    v126 = &v164;
    v103 = (void *)_os_log_send_and_compose_impl();

    if (v103)
    {
      v100 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v103, 4, &v164, v127);
      free(v103);
      v126 = (int *)v100;
      SSFileLog();
      goto LABEL_146;
    }
  }
  else
  {
LABEL_146:
  }
  v104 = +[NSArray arrayWithObject:v44];
  if (v131) {
    -[DownloadsTransaction insertDownloads:afterDownloadWithID:](self, "insertDownloads:afterDownloadWithID:", v104);
  }
  else {
  v105 = [(DownloadsTransaction *)self addDownloads:v104];
  }

  if ([v105 count] == (id)1)
  {
    v106 = [v105 objectAtIndex:0];
    id v71 = [v106 longLongValue];

    v57 = 0;
    int v72 = 1;
    id v131 = v71;
    goto LABEL_98;
  }

LABEL_157:
  int v108 = 0;
  id v7 = v128;
  v109 = v129;
  v110 = v133;
  id v15 = v140;
  id v9 = v141;
LABEL_158:

  if ([v109 triggeredQueueCheck]) {
    BOOL v111 = [obj count] != 0;
  }
  else {
    BOOL v111 = 1;
  }
  if ((v108 & v111) == 1 && v132)
  {
    v112 = +[SSLogConfig sharedDaemonConfig];
    if (!v112)
    {
      v112 = +[SSLogConfig sharedConfig];
    }
    unsigned int v113 = objc_msgSend(v112, "shouldLog", v126);
    if ([v112 shouldLogToDisk]) {
      int v114 = v113 | 2;
    }
    else {
      int v114 = v113;
    }
    v115 = [v112 OSLogObject];
    if (!os_log_type_enabled(v115, OS_LOG_TYPE_INFO)) {
      v114 &= 2u;
    }
    if (v114)
    {
      id v116 = (id)objc_opt_class();
      id v117 = [v132 persistentID];
      int v164 = 138412546;
      id v165 = v116;
      __int16 v166 = 2048;
      id v167 = v117;
      LODWORD(v127) = 22;
      v126 = &v164;
      v118 = (void *)_os_log_send_and_compose_impl();

      if (v118)
      {
        v115 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v118, 4, &v164, v127);
        free(v118);
        v126 = (int *)v115;
        SSFileLog();
        goto LABEL_173;
      }
    }
    else
    {
LABEL_173:
    }
    id v119 = [v132 persistentID];
    if (![(DownloadsTransaction *)self finishDownloadWithID:v119 finalPhase:SSDownloadPhaseCanceled])
    {
LABEL_175:

      id v9 = 0;
      goto LABEL_184;
    }
  }
  else if (!v108)
  {
    goto LABEL_175;
  }
  if (objc_msgSend(v110, "count", v126)) {
    [(DownloadsTransaction *)self reconcileSoftwareDownloads:v110 fromITunesStore:1];
  }
  if ([v137 count])
  {
    +[AppStoreUtility sendSoftwareDownloads:v137 withReason:@"purchase response" forClientID:v130];
    v120 = [v109 clusterMappings];
    id v121 = [v120 count];

    if (v121)
    {
      v122 = [v109 clusterMappings];
      +[AppStoreUtility sendClusterMappings:v122];
    }
  }
  if ([v134 count]) {
    +[BookAssetDaemonUtility sendBookDownloads:v134 withReason:@"purchase response"];
  }
LABEL_184:
  id v123 = v9;

  return v123;
}

- (id)_addEntityForPurchase:(id)a3 managerIdentifier:(int64_t)a4 orderIdentifier:(double)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v8, "uniqueIdentifier"));
  [v9 setObject:v10 forKey:SSSQLEntityPropertyPersistentID];
  id v11 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", objc_msgSend(v8, "batchIdentifier"));

  [v9 setObject:v11 forKey:@"batch_id"];
  id v12 = [objc_alloc((Class)NSNumber) initWithLongLong:a4];

  [v9 setObject:v12 forKey:@"client_id"];
  id v13 = [v8 databaseEncoding];

  if (v13) {
    [v9 setObject:v13 forKey:@"encoded_data"];
  }
  id v14 = [objc_alloc((Class)NSNumber) initWithDouble:a5];

  [v9 setObject:v14 forKey:@"order_id"];
  id v15 = [PurchaseEntity alloc];
  id v16 = [(DownloadsSession *)self database];
  id v17 = [(PurchaseEntity *)v15 initWithPropertyValues:v9 inDatabase:v16];

  return v17;
}

- (BOOL)_addPlaceholderDownloadForPurchase:(id)a3 clientIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 downloadProperties];
  id v9 = +[DownloadEntity copyDatabaseDictionaryToSetClientDictionary:v8];

  id v10 = +[NSNumber numberWithBool:1];
  [v9 setObject:v10 forKey:@"is_purchase"];

  id v11 = +[NSNumber numberWithBool:1];
  [v9 setObject:v11 forKey:@"is_from_store"];

  id v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v6 uniqueIdentifier]);
  [v9 setObject:v12 forKey:@"purchase_id"];

  if (v7) {
    [v9 setObject:v7 forKey:@"client_id"];
  }
  uint64_t v13 = SSSQLEntityPropertyPersistentID;
  id v14 = [v9 objectForKey:SSSQLEntityPropertyPersistentID];
  id v15 = [v6 placeholderDownloadIdentifier];
  if (v15 && !v14)
  {
    id v14 = [objc_alloc((Class)NSNumber) initWithLongLong:v15];
    [v9 setObject:v14 forKey:v13];
  }
  id v16 = objc_alloc_init(Download);
  if (v14) {
    id v17 = [v14 longLongValue];
  }
  else {
    id v17 = 0;
  }
  [(Download *)v16 setDatabaseID:v17];
  [(Download *)v16 setValuesWithDictionary:v9];
  unsigned int v18 = +[NSArray arrayWithObject:v16];
  int v19 = [(DownloadsTransaction *)self addDownloads:v18];

  LOBYTE(v18) = [v19 count] == (id)1;
  return (char)v18;
}

- (BOOL)_cancelDownloadForPurchaseIdentifier:(int64_t)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  id v5 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_purchase" equalToLongLong:1];
  id v6 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"purchase_id" equalToLongLong:a3];
  v17[0] = v5;
  v17[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v17 count:2];
  id v8 = +[SSSQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  id v9 = [(DownloadsSession *)self database];
  id v10 = +[DownloadEntity queryWithDatabase:v9 predicate:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A1A50;
  v12[3] = &unk_1003A5508;
  v12[4] = self;
  v12[5] = &v13;
  [v10 enumeratePersistentIDsUsingBlock:v12];
  LOBYTE(self) = *((unsigned char *)v14 + 24) != 0;

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

- (void)_getInsertOrderID:(double *)a3 nextOrderID:(double *)a4 afterPurchaseID:(int64_t)a5
{
  id v8 = [(DownloadsSession *)self database];
  uint64_t v21 = 0;
  long long v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  if (a5)
  {
    id v9 = [[PurchaseEntity alloc] initWithPersistentID:a5 inDatabase:v8];
    id v10 = [(PurchaseEntity *)v9 valueForProperty:@"order_id"];
    id v11 = v10;
    if (v10)
    {
      [v10 doubleValue];
      uint64_t v13 = v12;
      id v14 = objc_alloc_init((Class)SSSQLiteQueryDescriptor);
      [v14 setEntityClass:objc_opt_class()];
      [v14 setLimitCount:1];
      CFStringRef v26 = @"order_id";
      uint64_t v15 = +[NSArray arrayWithObjects:&v26 count:1];
      [v14 setOrderingProperties:v15];

      char v16 = +[SSSQLiteComparisonPredicate predicateWithProperty:@"order_id" value:v11 comparisonType:5];
      [v14 setPredicate:v16];

      id v17 = [objc_alloc((Class)SSSQLiteQuery) initWithDatabase:v8 descriptor:v14];
      int v25 = @"order_id";
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1001A1D90;
      v20[3] = &unk_1003A3358;
      v20[4] = &v21;
      [v17 enumeratePersistentIDsAndProperties:&v25 count:1 usingBlock:v20];
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else
  {
    unsigned int v18 = +[PurchaseEntity minValueForProperty:@"order_id" predicate:0 database:v8];
    id v9 = v18;
    uint64_t v13 = 0;
    uint64_t v19 = 0;
    if (v18) {
      [(PurchaseEntity *)v18 doubleValue];
    }
    *((void *)v22 + 3) = v19;
  }

  if (a3) {
    *(void *)a3 = v13;
  }
  if (a4) {
    *a4 = v22[3];
  }
  _Block_object_dispose(&v21, 8);
}

- (BOOL)_insertPurchases:(id)a3 forClient:(id)a4 orderIdentifier:(double)a5 orderSpacing:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  int64_t v12 = [(PurchaseDownloadsTransaction *)self _nextBatchIdentifier];
  uint64_t v13 = [v11 clientIdentifier];
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  *(double *)&v23[3] = a5 + a6;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001A1F64;
  v16[3] = &unk_1003A8E38;
  int64_t v20 = v12;
  id v21 = [v11 uniqueIdentifier];
  v16[4] = self;
  unsigned int v18 = v23;
  uint64_t v19 = &v24;
  id v14 = v13;
  id v17 = v14;
  double v22 = a6;
  [v10 enumerateObjectsUsingBlock:v16];
  LOBYTE(v12) = *((unsigned char *)v25 + 24);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (double)_maxOrderIdentifier
{
  v2 = [(DownloadsSession *)self database];
  v3 = +[PurchaseEntity maxValueForProperty:@"order_id" predicate:0 database:v2];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (int64_t)_nextBatchIdentifier
{
  v2 = [(DownloadsSession *)self database];
  v3 = +[PurchaseEntity maxValueForProperty:@"batch_id" predicate:0 database:v2];

  if (v3) {
    double v4 = (char *)[v3 longLongValue] + 1;
  }
  else {
    double v4 = 0;
  }

  return (int64_t)v4;
}

@end