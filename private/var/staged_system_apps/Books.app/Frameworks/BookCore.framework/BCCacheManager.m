@interface BCCacheManager
+ (BCCacheManager)defaultCacheManager;
+ (id)_cacheDirectoryPath;
+ (id)_oldCacheDirectoryPath;
+ (id)defaultClassDefinitionsWithProtocolHandler:(id)a3 stackDecomposer:(id)a4;
+ (id)loadCacheMetaData;
+ (id)operationsFromInterestInDescribedImages:(id)a3 comparator:(id)a4 imageRequest:(id)a5 vendedImageInterest:(id)a6;
+ (id)processURLTemplate:(id)a3 forSize:(CGSize)a4;
+ (void)clearCacheFiles;
+ (void)clearOldCacheFiles;
+ (void)initialize;
+ (void)migrateCacheAt:(id)a3;
+ (void)setDefaultCacheManager:(id)a3;
+ (void)writeCacheMetaData:(id)a3;
- (BCCacheManager)initWithClassDefinitions:(id)a3 highPriorityGeneralQueue:(id)a4 lowPriorityGeneralQueue:(id)a5 highPriorityTargetQueue:(id)a6 backgroundTargetQueue:(id)a7 delegate:(id)a8;
- (BCCacheManagingDelegate)delegate;
- (BCCacheProductProfileFetching)profileFetcher;
- (BCCacheTransforming)transformController;
- (BCSeriesStackDecomposing)seriesDecomposer;
- (BCStackManaging)stackManager;
- (BCURLSchemeHandling)protocolHandler;
- (BICDescribedImageComparator)comparator;
- (BICImageSetPersisting)imageSetPersistence;
- (BICLevelCaching)level1;
- (BICLevelCaching)level2;
- (BICLevelCaching)level3;
- (BICLevelCaching)level4;
- (BICWorkQueue)highPriorityWorkQueue;
- (BICWorkQueue)lowPriorityWorkQueue;
- (BOOL)_isGenericNeededForDescription:(id)a3 forRequest:(id)a4;
- (BOOL)_isVendedInterestBlankOrOldForRequest:(id)a3;
- (BOOL)canFetchCoverForURL:(id)a3;
- (BOOL)clearCacheOnLaunch;
- (BOOL)debugLayout;
- (BOOL)forceStats;
- (BOOL)useRamBasedDB;
- (BUCoalescingCallBlock)coalescingPreloading;
- (BUCoalescingCallBlock)coalescingPruning;
- (BUCoalescingCallBlock)coalescingVersionBump;
- (NSDictionary)cacheMetaData;
- (NSMutableArray)cgInterests;
- (NSMutableArray)genericRequestsInProcess;
- (NSMutableArray)outstandingRequests;
- (NSMutableDictionary)blankImages;
- (NSMutableSet)adamIDsToPreload;
- (NSMutableSet)versionBumpedIdentifiers;
- (NSPointerArray)vendedImageInterests;
- (OS_dispatch_queue)highPriorityTarget;
- (OS_dispatch_queue)lowPriorityTarget;
- (OS_dispatch_queue)workGenericsTarget;
- (OS_dispatch_queue)workHighPriorityTarget;
- (OS_dispatch_queue)workLowPriorityTarget;
- (double)nextDiskPruneDate;
- (double)nextRamPruneDate;
- (id)_blankCoverForDescribedImage:(id)a3;
- (id)_blankLayerForDescribedImage:(id)a3;
- (id)_extractImagesFromTemplate:(id)a3 identifier:(id)a4 initialSize:(CGSize)a5;
- (id)_fetchLayerForIdentifier:(id)a3 size:(CGSize)a4 options:(unsigned __int16)a5;
- (id)_fetchLayerForImage:(id)a3;
- (id)_findInterestForIdentifier:(id)a3;
- (id)describedImagesFromProductProfile:(id)a3;
- (id)fetchLayerForAssetID:(id)a3 size:(CGSize)a4 options:(unsigned __int16)a5;
- (id)metadataForIdentifier:(id)a3;
- (int64_t)_maxCostForMedium:(signed __int16)a3;
- (void)_addDescribedImages:(id)a3;
- (void)_addInterest:(id)a3;
- (void)_checkForGenericUpgradeForInterest:(id)a3;
- (void)_checkForQualityUpgradeForInterest:(id)a3;
- (void)_checkInterestForDescribedImages:(id)a3 forRequest:(id)a4;
- (void)_checkRestrictedContentSettings;
- (void)_checkStack:(id)a3 forInterestIn:(id)a4;
- (void)_fetchBestImagesForDescription:(id)a3 forRequest:(id)a4;
- (void)_fetchGenericForDescription:(id)a3 forRequest:(id)a4;
- (void)_fetchImage:(id)a3 forRequest:(id)a4 forInterest:(id)a5;
- (void)_fetchImagesMatchingBestDescriptions:(id)a3 forOriginalDescription:(id)a4 forRequest:(id)a5;
- (void)_fetchImagesMatchingDescription:(id)a3 forRequest:(id)a4;
- (void)_fetchImagesMatchingDescription:(id)a3 withTimeout:(int64_t)a4 forRequest:(id)a5 completion:(id)a6;
- (void)_fetchImagesMatchingDescriptionWithoutPushing:(id)a3 forRequest:(id)a4;
- (void)_fetchPrimaryImage:(id)a3 forRequest:(id)a4;
- (void)_incrementVersionForIdentifiers:(id)a3;
- (void)_makeGenericForDescription:(id)a3 forRequest:(id)a4;
- (void)_memoryWarning:(id)a3;
- (void)_performGenericUpgradeOfStackForRequest:(id)a3;
- (void)_performOperation:(id)a3;
- (void)_preloadAdamIDs:(id)a3;
- (void)_preloadBatch:(id)a3 completion:(id)a4;
- (void)_preloadCache;
- (void)_preloadOneBatch;
- (void)_pruneIfNeeded;
- (void)_pruneMediumIfNeeded:(signed __int16)a3;
- (void)_pushDescribedImages:(id)a3 forRequest:(id)a4;
- (void)_refetchInterestsForNewVersion:(id)a3;
- (void)_transformSourceDescribedImage:(id)a3 into:(id)a4 forRequest:(id)a5;
- (void)_updateVendedImageInterest:(id)a3 withDescribedImage:(id)a4 forRequest:(id)a5;
- (void)addCGImage:(CGImage *)a3 withIdentifier:(id)a4 priority:(unint64_t)a5 quality:(unsigned __int16)a6;
- (void)addDescribedImages:(id)a3;
- (void)addFilePaths:(id)a3 priority:(unint64_t)a4 quality:(unsigned __int16)a5;
- (void)addProductProfileIDs:(id)a3 priority:(unint64_t)a4;
- (void)addURLTemplate:(id)a3 forIdentifier:(id)a4;
- (void)addURLs:(id)a3 priority:(unint64_t)a4 quality:(unsigned __int16)a5 expiresAfter:(int64_t)a6;
- (void)cleanCache;
- (void)dealloc;
- (void)explicitContentRestrictedChanged;
- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 completion:(id)a5;
- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 timeOut:(double)a5 waitForNonGeneric:(BOOL)a6 completion:(id)a7;
- (void)fetchCoverForURL:(id)a3 completion:(id)a4;
- (void)fetchCoverURLsFor:(id)a3 immediately:(BOOL)a4 completion:(id)a5;
- (void)fetchDescribedImageFileURLForImage:(id)a3 completion:(id)a4;
- (void)fetchMetadataForIdentifier:(id)a3 completion:(id)a4;
- (void)imageColorForIdentifier:(id)a3 completion:(id)a4;
- (void)imageSetPersisting:(id)a3 newVersionForImageSetIdentifierss:(id)a4;
- (void)incrementVersionForIdentifier:(id)a3;
- (void)incrementVersionForIdentifiers:(id)a3;
- (void)pruneItemsWithIdentifier:(id)a3 forMedium:(signed __int16)a4;
- (void)removeDescribedImages:(id)a3;
- (void)removeURLs:(id)a3 priority:(unint64_t)a4 quality:(unsigned __int16)a5;
- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3;
- (void)setAdamIDsToPreload:(id)a3;
- (void)setBlankImages:(id)a3;
- (void)setCacheMetaData:(id)a3;
- (void)setCgInterests:(id)a3;
- (void)setClearCacheOnLaunch:(BOOL)a3;
- (void)setCoalescingPreloading:(id)a3;
- (void)setCoalescingPruning:(id)a3;
- (void)setCoalescingVersionBump:(id)a3;
- (void)setComparator:(id)a3;
- (void)setDebugLayout:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setForceStats:(BOOL)a3;
- (void)setGenericRequestsInProcess:(id)a3;
- (void)setHighPriorityTarget:(id)a3;
- (void)setHighPriorityWorkQueue:(id)a3;
- (void)setImageColor:(id)a3 forIdentifier:(id)a4;
- (void)setImageSetPersistence:(id)a3;
- (void)setLevel1:(id)a3;
- (void)setLevel2:(id)a3;
- (void)setLevel3:(id)a3;
- (void)setLevel4:(id)a3;
- (void)setLowPriorityTarget:(id)a3;
- (void)setLowPriorityWorkQueue:(id)a3;
- (void)setNextDiskPruneDate:(double)a3;
- (void)setNextRamPruneDate:(double)a3;
- (void)setOutstandingRequests:(id)a3;
- (void)setProfileFetcher:(id)a3;
- (void)setProtocolHandler:(id)a3;
- (void)setSeriesDecomposer:(id)a3;
- (void)setStackManager:(id)a3;
- (void)setTransformController:(id)a3;
- (void)setUseRamBasedDB:(BOOL)a3;
- (void)setVendedImageInterests:(id)a3;
- (void)setVersionBumpedIdentifiers:(id)a3;
- (void)setWorkGenericsTarget:(id)a3;
- (void)setWorkHighPriorityTarget:(id)a3;
- (void)setWorkLowPriorityTarget:(id)a3;
- (void)stackRenderingResultSrc:(id)a3 result:(id)a4 forRequest:(id)a5;
- (void)transformResultSrc:(id)a3 result:(id)a4 forRequest:(id)a5;
@end

@implementation BCCacheManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v5 = @"BCCacheManagerNextDiskPruneDate";
    +[NSDate timeIntervalSinceReferenceDate];
    v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v6 = v3;
    v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    [v2 registerDefaults:v4];
  }
}

+ (BCCacheManager)defaultCacheManager
{
  return (BCCacheManager *)(id)qword_345BC0;
}

+ (void)setDefaultCacheManager:(id)a3
{
}

+ (id)_oldCacheDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v3 = [v2 lastObject];
  v4 = [v3 stringByAppendingPathComponent:@"BCCoverCache-1"];

  return v4;
}

+ (id)_cacheDirectoryPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = [v2 lastObject];
  v4 = [v3 stringByAppendingPathComponent:@"BCCoverCache-1"];

  return v4;
}

+ (void)clearOldCacheFiles
{
  id v11 = +[UIApplication applicationCacheDirectory];
  v3 = +[NSFileManager defaultManager];
  v4 = [v11 stringByAppendingPathComponent:@"BCCoverCache"];
  [v3 removeItemAtPath:v4 error:0];

  CFStringRef v5 = +[NSFileManager defaultManager];
  v6 = [v11 stringByAppendingPathComponent:@"BKCoverCache"];
  [v5 removeItemAtPath:v6 error:0];

  v7 = +[NSFileManager defaultManager];
  v8 = [v11 stringByAppendingPathComponent:@"BKMappedImageCache"];
  [v7 removeItemAtPath:v8 error:0];

  v9 = [a1 _oldCacheDirectoryPath];
  v10 = +[NSFileManager defaultManager];
  [v10 removeItemAtPath:v9 error:0];
}

+ (void)clearCacheFiles
{
  id v4 = [a1 _cacheDirectoryPath];
  v2 = +[NSFileManager defaultManager];
  [v2 removeItemAtPath:v4 error:0];

  v3 = +[NSFileManager defaultManager];
  [v3 createDirectoryAtPath:v4 withIntermediateDirectories:0 attributes:0 error:0];
}

+ (id)loadCacheMetaData
{
  v2 = [a1 _cacheDirectoryPath];
  v3 = [v2 stringByAppendingPathComponent:@"BCCoverCache-Version"];

  id v4 = +[NSDictionary dictionaryWithContentsOfFile:v3];

  return v4;
}

+ (void)writeCacheMetaData:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [a1 _cacheDirectoryPath];
  id v6 = [v5 stringByAppendingPathComponent:@"BCCoverCache-Version"];

  [v4 writeToFile:v6 atomically:0];
}

+ (void)migrateCacheAt:(id)a3
{
  id v4 = [a3 stringByAppendingPathComponent:@"BCCoverCache-Version"];
  CFStringRef v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];
  id v6 = [v5 objectForKeyedSubscript:@"Version"];
  unsigned int v7 = [v6 unsignedIntValue];

  if (v7 != 8)
  {
    [a1 clearCacheFiles];
    [a1 clearOldCacheFiles];
    CFStringRef v9 = @"Version";
    v10 = &off_2E1560;
    v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

    [v8 writeToFile:v4 atomically:0];
    CFStringRef v5 = v8;
  }
}

+ (id)defaultClassDefinitionsWithProtocolHandler:(id)a3 stackDecomposer:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = +[NSMutableDictionary dictionary];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kLevelClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kL1StorgageClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kL2StorgageClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kL3StorgageClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kL4StorgageClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kPersistingClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kL1DataStoringClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kL2DataStoringClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kL3DataStoringClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kL4DataStoringClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kStackManagerClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kStackRendererClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kTransformerClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kTransformControllerClass];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kProfileFetchingClass];
  [v7 setObject:v6 forKeyedSubscript:kURLProtocolHandlerInstance];

  [v7 setObject:v5 forKeyedSubscript:kSeriesStackDecomposingInstance];
  [v7 setObject:objc_opt_class() forKeyedSubscript:kPersistentStoreClass];

  return v7;
}

+ (id)operationsFromInterestInDescribedImages:(id)a3 comparator:(id)a4 imageRequest:(id)a5 vendedImageInterest:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = +[NSMutableArray array];
  v14 = [v9 valueForKey:@"identifier"];
  v15 = +[NSSet setWithArray:v14];

  v16 = [v12 describedImageRequested];
  v17 = [v16 identifier];
  v59 = v15;
  unsigned int v18 = [v15 containsObject:v17];

  if (v18)
  {
    v19 = [v12 describedImageRequested];
    v65 = [v12 describedImageShown];
    if (([v12 needsNewVersion] & 1) != 0
      || ![v10 isMatching:v19 withCandidateImage:v65 includeQuality:0]
      || [v65 quality] <= 0x65)
    {
      unsigned __int8 v64 = [v11 persistanceOptions];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v20 = v9;
      id v21 = [v20 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (!v21) {
        goto LABEL_44;
      }
      id v57 = v9;
      v58 = v13;
      v63 = 0;
      unint64_t v66 = -1;
      uint64_t v67 = *(void *)v69;
      v62 = v19;
      id v60 = v10;
      v61 = v20;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v69 != v67) {
            objc_enumerationMutation(v20);
          }
          v23 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          +[BICCacheStats logOperation:BICCacheStatsOperationInterestCheck[0] forRequest:v11];
          id v24 = [v10 differenceFromRequest:v19 toCandidateImage:v23];
          if (v24 != (id)-1)
          {
            unint64_t v25 = (unint64_t)v24;
            id v26 = v11;
            if ((v64 & 2) != 0) {
              [v23 filePath];
            }
            else {
            v27 = [v23 image];
            }

            unsigned int v28 = [v10 isMatching:v23 withCandidateImage:v65 includeQuality:0];
            BOOL v29 = 0;
            if ([v65 isLowQuality]) {
              BOOL v29 = [v23 quality] > 0x65;
            }
            if (v25) {
              BOOL v30 = 1;
            }
            else {
              BOOL v30 = v27 == 0;
            }
            if (!v30
              && ([v23 isGeneric] & 1) == 0
              && ([v12 needsNewVersion] | v29 | v28 ^ 1) == 1)
            {
              id v11 = v26;
              +[BICCacheStats logOperation:BICCacheStatsOperationImageDelivered[0] forRequest:v26];
              if ([v65 isLowQuality] && objc_msgSend(v23, "quality") >= 0x66)
              {
                v34 = BCImageCacheLog();
                id v9 = v57;
                v35 = v58;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v73 = v23;
                  __int16 v74 = 2112;
                  id v75 = v26;
                  v36 = "BCCacheManager: Performing quality upgrade on exact interest for image=%@ for request=%@";
                  goto LABEL_40;
                }
              }
              else
              {
                v34 = BCImageCacheLog();
                id v9 = v57;
                v35 = v58;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  id v73 = v23;
                  __int16 v74 = 2112;
                  id v75 = v26;
                  v36 = "BCCacheManager: Found exact interest for image=%@ for request=%@";
LABEL_40:
                  _os_log_impl(&def_7D91C, v34, OS_LOG_TYPE_INFO, v36, buf, 0x16u);
                }
              }
              id v10 = v60;

              v37 = +[BCCacheOperation operationWithKind:1 vendedImageInterest:v12 subject:v23 request:v26];
              [v35 addObject:v37];

              v38 = v23;
              v13 = v35;
              v19 = v62;
              if ([v38 isLowQuality])
              {
                v39 = +[BCCacheOperation operationWithKind:2 vendedImageInterest:v12 request:v11];
                [v35 addObject:v39];
              }
              [v12 setNeedsNewVersion:0];

              id v21 = 0;
              v20 = v61;
LABEL_44:

              goto LABEL_45;
            }
            id v11 = v26;
            if (v25 < v66)
            {
              id v31 = v23;

              unint64_t v66 = v25;
              v63 = v31;
            }
            id v10 = v60;
            v20 = v61;
            v19 = v62;
          }
        }
        id v21 = [v20 countByEnumeratingWithState:&v68 objects:v76 count:16];
        if (v21) {
          continue;
        }
        break;
      }

      if (!v63)
      {
        id v21 = 0;
        id v9 = v57;
        v13 = v58;
        goto LABEL_45;
      }
      v32 = BCImageCacheLog();
      v13 = v58;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v73 = v63;
        __int16 v74 = 2112;
        id v75 = v19;
        _os_log_impl(&def_7D91C, v32, OS_LOG_TYPE_INFO, "BCCacheManager: Found inexact match for of image=%@ for request=%@", buf, 0x16u);
      }

      v33 = [v63 image];

      if (!v66 && (v64 & 2) != 0)
      {
        v20 = +[BCCacheOperation operationWithKind:5 subject:v11 request:v11];
        [v58 addObject:v20];
        id v9 = v57;
LABEL_33:
        id v21 = v63;
        goto LABEL_44;
      }
      if (v33)
      {
        id v21 = v63;
        id v9 = v57;
        if ([v10 isMatching:v19 withGenericImage:v63])
        {
          if ([v65 isGenericSeriesStack]) {
            unsigned int v41 = [v63 isSeriesStackWithGenerics];
          }
          else {
            unsigned int v41 = 0;
          }
          if (v65 && [v65 quality] != 1)
          {
            if ([v65 quality] == 2)
            {
              if ((([v12 needsNewVersion] | v41) & 1) == 0) {
                goto LABEL_90;
              }
            }
            else if (!v41)
            {
              goto LABEL_90;
            }
          }
          +[BICCacheStats incrementCounter:kBICCacheStatsCounterGenericsDelivered[0]];
          +[BICCacheStats logOperation:BICCacheStatsOperationGenericImageDelivered[0] forRequest:v11];
          v52 = BCImageCacheLog();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = [v20 bu_prettyDescription];
            *(_DWORD *)buf = 138412290;
            id v73 = v53;
            _os_log_impl(&def_7D91C, v52, OS_LOG_TYPE_INFO, "BCCacheManager: Found generic interest for images=%@", buf, 0xCu);
          }
          if (([v11 requestOptions] & 8) != 0
            || ([v11 primaryRequest],
                v54 = objc_claimAutoreleasedReturnValue(),
                v54,
                v54))
          {
            [v63 setRequestOptions:[v63 requestOptions] | 8];
          }
          v55 = +[BCCacheOperation operationWithKind:1 vendedImageInterest:v12 subject:v63 request:v11];
          [v58 addObject:v55];

          if (([v11 requestOptions] & 8) == 0)
          {
            v56 = [v11 primaryRequest];

            if (!v56)
            {
              v20 = +[BCCacheOperation operationWithKind:3 vendedImageInterest:v12 request:v11];
              [v58 addObject:v20];
              goto LABEL_33;
            }
          }
LABEL_90:
          id v21 = v63;
          goto LABEL_45;
        }
        if (([v11 requestOptions] & 0x10) == 0
          || (unsigned int v44 = [v19 processingOptions],
              BOOL v30 = v44 == [v63 processingOptions],
              id v21 = v63,
              !v30))
        {
          if (![v10 isTransformableMatch:v19 withCandidateImage:v21])
          {
            v20 = BCImageCacheLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v73 = v21;
              __int16 v74 = 2112;
              id v75 = v11;
              _os_log_impl(&def_7D91C, v20, OS_LOG_TYPE_INFO, "BCCacheManager: Not transformable image=%@ for request=%@", buf, 0x16u);
            }
            goto LABEL_44;
          }
          [v21 image];
          v49 = id v48 = v21;

          if (v49)
          {
            +[BICCacheStats logOperation:BICCacheStatsOperationBestMatchNeedsTransform[0] forRequest:v11];
            uint64_t v50 = +[BCCacheOperation operationWithKind:0 subject:v48 result:v19 request:v11];
            [v58 addObject:v50];
            id v21 = v48;
            v20 = v50;
            goto LABEL_44;
          }
          id v21 = v48;
LABEL_45:

          goto LABEL_46;
        }
        +[BICCacheStats logOperation:BICCacheStatsOperationImageDelivered[0] forRequest:v11];
        v45 = BCImageCacheLog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          v46 = [v20 bu_prettyDescription];
          *(_DWORD *)buf = 138412290;
          id v73 = v46;
          _os_log_impl(&def_7D91C, v45, OS_LOG_TYPE_INFO, "BCCacheManager: Found best match interest for images=%@", buf, 0xCu);
        }
        id v21 = v63;
        uint64_t v47 = +[BCCacheOperation operationWithKind:1 vendedImageInterest:v12 subject:v63 request:v11];
      }
      else
      {
        unsigned int v42 = [v65 quality];
        id v9 = v57;
        if (v42 != 1)
        {
          BOOL v43 = [v63 quality] > v42 || [v63 quality] == 0;
          BOOL v51 = [v65 isGenericSeriesStack]
             && ([v63 processingOptions] >> 5) & 1;
          if (!v43 && !v51) {
            goto LABEL_90;
          }
        }
        +[BICCacheStats logOperation:BICCacheStatsOperationBestMatchNeedsFetch[0] forRequest:v11];
        id v21 = v63;
        [v63 setPriority:[v19 priority]];
        uint64_t v47 = +[BCCacheOperation operationWithKind:4 subject:v63 request:v11];
      }
      v20 = v47;
      [v58 addObject:v47];
      goto LABEL_44;
    }
LABEL_46:
  }

  return v13;
}

- (BCCacheManager)initWithClassDefinitions:(id)a3 highPriorityGeneralQueue:(id)a4 lowPriorityGeneralQueue:(id)a5 highPriorityTargetQueue:(id)a6 backgroundTargetQueue:(id)a7 delegate:(id)a8
{
  id v14 = a3;
  id v145 = a4;
  id v15 = a5;
  id v16 = a6;
  id v146 = a7;
  id v17 = a8;
  v155.receiver = self;
  v155.super_class = (Class)BCCacheManager;
  unsigned int v18 = [(BCCacheManager *)&v155 init];
  if (v18)
  {
    v19 = v18;
    id v144 = v16;
    id v130 = v15;
    v18->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v20 = +[NSPointerArray weakObjectsPointerArray];
    vendedImageInterests = v19->_vendedImageInterests;
    v19->_vendedImageInterests = (NSPointerArray *)v20;

    uint64_t v22 = +[NSMutableArray array];
    outstandingRequests = v19->_outstandingRequests;
    v19->_outstandingRequests = (NSMutableArray *)v22;

    uint64_t v24 = +[NSMutableArray array];
    cgInterests = v19->_cgInterests;
    v19->_cgInterests = (NSMutableArray *)v24;

    uint64_t v26 = +[NSMutableArray array];
    genericRequestsInProcess = v19->_genericRequestsInProcess;
    v19->_genericRequestsInProcess = (NSMutableArray *)v26;

    uint64_t v28 = +[NSMutableDictionary dictionary];
    blankImages = v19->_blankImages;
    v19->_blankImages = (NSMutableDictionary *)v28;

    BOOL v30 = +[NSUserDefaults standardUserDefaults];
    v19->_debugLayout = [v30 BOOLForKey:@"BKLibraryImageCacheDebugLayout"];

    id v31 = +[NSUserDefaults standardUserDefaults];
    v19->_forceStats = [v31 BOOLForKey:@"BKLibraryImageCacheGatherStats"];

    v32 = +[NSUserDefaults standardUserDefaults];
    [v32 doubleForKey:@"BCCacheManagerNextDiskPruneDate"];
    v19->_nextDiskPruneDate = v33;

    +[NSDate timeIntervalSinceReferenceDate];
    v19->_nextRamPruneDate = v34 + 2.0;
    uint64_t v35 = +[NSMutableSet set];
    versionBumpedIdentifiers = v19->_versionBumpedIdentifiers;
    v19->_versionBumpedIdentifiers = (NSMutableSet *)v35;

    uint64_t v37 = +[NSMutableSet set];
    adamIDsToPreload = v19->_adamIDsToPreload;
    v19->_adamIDsToPreload = (NSMutableSet *)v37;

    id v39 = objc_alloc((Class)BUCoalescingCallBlock);
    v153[0] = _NSConcreteStackBlock;
    v153[1] = 3221225472;
    v153[2] = sub_8C37C;
    v153[3] = &unk_2C3A18;
    v40 = v19;
    v154 = v40;
    id v41 = [v39 initWithNotifyBlock:v153 blockDescription:@"CoverCacheVersionBump"];
    id v42 = v40[11];
    v40[11] = v41;

    [v40[11] setCoalescingDelay:3.0];
    [v40[11] setMaximumDelay:3.0];
    id v43 = objc_alloc((Class)BUCoalescingCallBlock);
    v151[0] = _NSConcreteStackBlock;
    v151[1] = 3221225472;
    v151[2] = sub_8C57C;
    v151[3] = &unk_2C3A18;
    unsigned int v44 = v40;
    v152 = v44;
    id v45 = [v43 initWithNotifyBlock:v151 blockDescription:@"CoverCachePruning"];
    id v46 = v44[12];
    v44[12] = v45;

    [v44[12] setCoalescingDelay:2.0];
    [v44[12] setMaximumDelay:2.0];
    id v47 = objc_alloc((Class)BUCoalescingCallBlock);
    v149[0] = _NSConcreteStackBlock;
    v149[1] = 3221225472;
    v149[2] = sub_8C5EC;
    v149[3] = &unk_2C3A18;
    id v48 = v44;
    v150 = v48;
    id v49 = [v47 initWithNotifyBlock:v149 blockDescription:@"CoverCachePreloading"];
    id v50 = v48[13];
    v48[13] = v49;

    [v48[13] setCoalescingDelay:15.0];
    objc_storeStrong(v48 + 3, a4);
    objc_storeStrong(v48 + 4, a5);
    objc_storeStrong(v48 + 5, a6);
    objc_storeStrong(v48 + 6, a7);
    BOOL v51 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v52 = dispatch_queue_attr_make_with_qos_class(v51, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v53 = dispatch_queue_create("CoverCacheGenerics", v52);
    id v54 = v48[2];
    v48[2] = v53;

    id v129 = v17;
    objc_storeWeak(v48 + 9, v17);
    uint64_t v55 = +[BICWorkQueue workQueueWithHighPriorityTargetQueue:v48[4] backgroundTargetQueue:v48[4] numConcurrentWorkItems:1];
    id v56 = v48[7];
    v48[7] = (id)v55;

    [v48[7] setIdentifier:@"CoverCacheLowPriority"];
    [v48[7] setManualCompletion:1];
    uint64_t v57 = +[BICWorkQueue workQueueWithHighPriorityTargetQueue:v48[2] backgroundTargetQueue:v48[4] numConcurrentWorkItems:1];
    id v58 = v48[8];
    v48[8] = (id)v57;

    [v48[8] setIdentifier:@"CoverCacheGenerics"];
    [v48[8] setManualCompletion:1];
    +[BICCacheStats prepare];
    v59 = +[BURestrictionsProvider sharedInstance];
    [v59 addObserver:v48];

    dispatch_time_t v60 = dispatch_time(0, 60000000000);
    v61 = v48[4];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_8C65C;
    block[3] = &unk_2C3C50;
    v62 = v48;
    v148 = v62;
    dispatch_after(v60, v61, block);
    id v63 = [v14 objectForKeyedSubscript:kPersistingClass];
    id v64 = [v14 objectForKeyedSubscript:kL1DataStoringClass];
    id v140 = [v14 objectForKeyedSubscript:kL2DataStoringClass];
    id v138 = [v14 objectForKeyedSubscript:kL3DataStoringClass];
    id v136 = [v14 objectForKeyedSubscript:kL4DataStoringClass];
    id v142 = [v14 objectForKeyedSubscript:kL1StorgageClass];
    id v135 = [v14 objectForKeyedSubscript:kL2StorgageClass];
    id v134 = [v14 objectForKeyedSubscript:kL3StorgageClass];
    id v133 = [v14 objectForKeyedSubscript:kL4StorgageClass];
    id v65 = [v14 objectForKeyedSubscript:kLevelClass];
    id v132 = [v14 objectForKeyedSubscript:kStackRendererClass];
    id v131 = [v14 objectForKeyedSubscript:kStackManagerClass];
    id v66 = [v14 objectForKeyedSubscript:kTransformerClass];
    id v67 = [v14 objectForKeyedSubscript:kTransformControllerClass];
    id v68 = [v14 objectForKeyedSubscript:kProfileFetchingClass];
    id v69 = [v14 objectForKeyedSubscript:kPersistentStoreClass];
    long long v70 = 0;
    if (!v69
      || !v63
      || !v64
      || !v140
      || !v138
      || !v136
      || !v142
      || !v135
      || !v134
      || !v133
      || !v65
      || !v132
      || !v131
      || !v66
      || !v67
      || !v68)
    {
      v79 = v145;
LABEL_104:

      id v17 = v129;
      id v15 = v130;
      id v16 = v144;
      goto LABEL_105;
    }
    long long v71 = v69;
    v126 = v67;
    v127 = v66;
    v72 = +[BCCacheManager _cacheDirectoryPath];
    id v73 = +[NSFileManager defaultManager];
    v128 = v72;
    [v73 createDirectoryAtPath:v72 withIntermediateDirectories:1 attributes:0 error:0];

    __int16 v74 = objc_alloc_init(BICDescribedImageComparator);
    comparator = v62->_comparator;
    v62->_comparator = v74;

    if ([v63 conformsToProtocol:&OBJC_PROTOCOL___BICImageSetPersisting])
    {
      if (v62->_useRamBasedDB)
      {
        v76 = [[BICMemoryPersistentStoring alloc] initWithURL:0];
        v77 = (BICImageSetPersisting *)objc_msgSend(objc_msgSend(v63, "alloc"), "initWithPersistentStore:comparator:", v76, v62->_comparator);
        imageSetPersistence = v62->_imageSetPersistence;
        v62->_imageSetPersistence = v77;
      }
      else
      {
        if (v62->_clearCacheOnLaunch)
        {
          v80 = +[NSFileManager defaultManager];
          [v80 removeItemAtPath:v72 error:0];

          v81 = +[NSFileManager defaultManager];
          [v81 createDirectoryAtPath:v72 withIntermediateDirectories:0 attributes:0 error:0];
        }
        +[BCCacheManager migrateCacheAt:v72];
        v82 = BCImageCacheLog();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v157 = v72;
          _os_log_impl(&def_7D91C, v82, OS_LOG_TYPE_INFO, "BCCacheManager: Cache is at path=%@", buf, 0xCu);
        }

        v76 = [(BCCacheManager *)v72 stringByAppendingPathComponent:@"imagesets.sqlite"];
        imageSetPersistence = +[NSURL fileURLWithPath:v76];
        id v83 = [[v71 alloc] initWithURL:imageSetPersistence];
        v84 = (BICImageSetPersisting *)objc_msgSend(objc_msgSend(v63, "alloc"), "initWithPersistentStore:comparator:", v83, v62->_comparator);
        v85 = v62->_imageSetPersistence;
        v62->_imageSetPersistence = v84;
      }
      [(BICImageSetPersisting *)v62->_imageSetPersistence setDelegate:v62];
    }
    if ([v68 conformsToProtocol:&OBJC_PROTOCOL___BCCacheProductProfileFetching])
    {
      v86 = (BCCacheProductProfileFetching *)objc_msgSend(objc_msgSend(v68, "alloc"), "init");
      profileFetcher = v62->_profileFetcher;
      v62->_profileFetcher = v86;
    }
    uint64_t v88 = [v14 objectForKeyedSubscript:kURLProtocolHandlerInstance];
    protocolHandler = v62->_protocolHandler;
    v62->_protocolHandler = (BCURLSchemeHandling *)v88;

    v90 = v65;
    if ([v64 conformsToProtocol:&OBJC_PROTOCOL___BICDataStoring])
    {
      id v91 = objc_msgSend(objc_msgSend(v64, "alloc"), "initWithCachePath:", v72);
      [v91 setIdentifier:@"L1"];
      [v91 setDelegate:v62];
      v92 = v136;
      v93 = v138;
      if (v62->_clearCacheOnLaunch) {
        [v91 _clean:&stru_2C7420];
      }
    }
    else
    {
      id v91 = 0;
      v92 = v136;
      v93 = v138;
    }
    if ([v140 conformsToProtocol:&OBJC_PROTOCOL___BICDataStoring])
    {
      id v94 = objc_msgSend(objc_msgSend(v140, "alloc"), "initWithCachePath:", v72);
      [v94 setIdentifier:@"L2"];
      [v94 setDelegate:v62];
      v137 = v94;
      if (v62->_clearCacheOnLaunch) {
        [v94 _clean:&stru_2C7440];
      }
    }
    else
    {
      v137 = 0;
    }
    if ([v93 conformsToProtocol:&OBJC_PROTOCOL___BICDataStoring])
    {
      id v95 = objc_msgSend(objc_msgSend(v93, "alloc"), "initWithCachePath:", v128);
      [v95 setIdentifier:@"L3"];
      [v95 setDelegate:v62];
      if (v62->_clearCacheOnLaunch) {
        [v95 _clean:&stru_2C7460];
      }
    }
    else
    {
      id v95 = 0;
    }
    v141 = v95;
    if ([v92 conformsToProtocol:&OBJC_PROTOCOL___BICDataStoring])
    {
      id v96 = objc_msgSend(objc_msgSend(v92, "alloc"), "initWithCachePath:", v128);
      [v96 setIdentifier:@"L4"];
      [v96 setDelegate:v62];
      v97 = v134;
      if (v62->_clearCacheOnLaunch) {
        [v96 _clean:&stru_2C7480];
      }
    }
    else
    {
      id v96 = 0;
      v97 = v134;
    }
    if ([v142 conformsToProtocol:&OBJC_PROTOCOL___BICImageSetStoring_Persistence])
    {
      id v98 = objc_msgSend(objc_msgSend(v142, "alloc"), "initWithLevelID:imageSetPersistence:comparator:dataStore:", 0, v62->_imageSetPersistence, v62->_comparator, v91);
    }
    else
    {
      if (![v142 conformsToProtocol:&OBJC_PROTOCOL___BICImageSetStoring])
      {
        v143 = 0;
LABEL_53:
        if ([v135 conformsToProtocol:&OBJC_PROTOCOL___BICImageSetStoring_Persistence])
        {
          id v99 = objc_msgSend(objc_msgSend(v135, "alloc"), "initWithLevelID:imageSetPersistence:comparator:dataStore:", 1, v62->_imageSetPersistence, v62->_comparator, v137);
        }
        else
        {
          if (![v135 conformsToProtocol:&OBJC_PROTOCOL___BICImageSetStoring])
          {
            v100 = 0;
LABEL_59:
            if ([v97 conformsToProtocol:&OBJC_PROTOCOL___BICImageSetStoring_Persistence])
            {
              id v101 = objc_msgSend(objc_msgSend(v97, "alloc"), "initWithLevelID:imageSetPersistence:comparator:dataStore:", 2, v62->_imageSetPersistence, v62->_comparator, v95);
            }
            else
            {
              if (![v97 conformsToProtocol:&OBJC_PROTOCOL___BICImageSetStoring])
              {
                v102 = 0;
LABEL_65:
                v139 = v91;
                if ([v133 conformsToProtocol:&OBJC_PROTOCOL___BICImageSetStoring_Persistence])
                {
                  id v103 = [[v133 alloc] initWithLevelID:3 imageSetPersistence:v62->_imageSetPersistence comparator:v62->_comparator dataStore:v96];
                }
                else
                {
                  if (![v133 conformsToProtocol:&OBJC_PROTOCOL___BICImageSetStoring])
                  {
                    v104 = 0;
                    goto LABEL_71;
                  }
                  id v103 = objc_msgSend(objc_msgSend(v133, "alloc"), "initWithLevelID:comparator:dataStore:", 0, v62->_comparator, v96);
                }
                v104 = v103;
                [v103 setIdentifier:@"L4"];
LABEL_71:
                if ([v90 conformsToProtocol:&OBJC_PROTOCOL___BICLevelCaching])
                {
                  v105 = (BICLevelCaching *)objc_msgSend(objc_msgSend(v90, "alloc"), "initWithLevelID:highPriorityTargetQueue:backgroundTargetQueue:imageSetStore:comparator:nextCacheLevel:", 3, v144, v146, v104, v62->_comparator, 0);
                  level4 = v62->_level4;
                  v62->_level4 = v105;

                  v107 = (BICLevelCaching *)objc_msgSend(objc_msgSend(v90, "alloc"), "initWithLevelID:highPriorityTargetQueue:backgroundTargetQueue:imageSetStore:comparator:nextCacheLevel:", 2, v144, v146, v102, v62->_comparator, v62->_level4);
                  level3 = v62->_level3;
                  v62->_level3 = v107;

                  v109 = (BICLevelCaching *)objc_msgSend(objc_msgSend(v90, "alloc"), "initWithLevelID:highPriorityTargetQueue:backgroundTargetQueue:imageSetStore:comparator:nextCacheLevel:", 1, v144, v146, v100, v62->_comparator, v62->_level3);
                  level2 = v62->_level2;
                  v62->_level2 = v109;

                  v111 = (BICLevelCaching *)objc_msgSend(objc_msgSend(v90, "alloc"), "initWithLevelID:highPriorityTargetQueue:backgroundTargetQueue:imageSetStore:comparator:nextCacheLevel:", 0, v144, v146, v143, v62->_comparator, v62->_level2);
                  level1 = v62->_level1;
                  v62->_level1 = v111;
                }
                uint64_t v113 = [v14 objectForKeyedSubscript:kSeriesStackDecomposingInstance];
                seriesDecomposer = v62->_seriesDecomposer;
                v62->_seriesDecomposer = (BCSeriesStackDecomposing *)v113;

                if ([v132 conformsToProtocol:&OBJC_PROTOCOL___BCStackRendering])
                {
                  id v115 = [[v132 alloc] init];
                  [v115 setImageRepository:v62];
                  v116 = [v14 objectForKeyedSubscript:kSeriesStackDecomposingInstance];
                  [v115 setSeriesDecomposer:v116];
                }
                else
                {
                  id v115 = 0;
                }
                if ([v131 conformsToProtocol:&OBJC_PROTOCOL___BCStackManaging])
                {
                  v117 = (BCStackManaging *)objc_msgSend(objc_msgSend(v131, "alloc"), "initWithHighPriorityTargetQueue:backgroundTargetQueue:renderer:", v144, v146, v115);
                  stackManager = v62->_stackManager;
                  v62->_stackManager = v117;

                  [(BCStackManaging *)v62->_stackManager setDelegate:v62];
                }
                if ([v127 conformsToProtocol:&OBJC_PROTOCOL___BCCacheImageTransforming]) {
                  id v119 = [[v127 alloc] init];
                }
                else {
                  id v119 = 0;
                }
                if ([v127 conformsToProtocol:&OBJC_PROTOCOL___BCCacheImageTransforming])
                {
                  v120 = (BCCacheTransforming *)objc_msgSend(objc_msgSend(v126, "alloc"), "initWithHighPriorityTargetQueue:backgroundTargetQueue:transformer:", v144, v146, v119);
                  transformController = v62->_transformController;
                  v62->_transformController = v120;

                  [(BCCacheTransforming *)v62->_transformController setDelegate:v62];
                }
                if (v62->_imageSetPersistence
                  && v139
                  && v137
                  && v141
                  && v96
                  && v143
                  && v100
                  && v102
                  && v104
                  && v62->_level1
                  && v62->_level2
                  && v62->_level3
                  && v62->_level4
                  && v115
                  && v62->_stackManager
                  && v119
                  && v62->_transformController
                  && v62->_profileFetcher)
                {
                  v122 = +[NSNotificationCenter defaultCenter];
                  [v122 addObserver:v62 selector:"_memoryWarning:" name:UIApplicationDidReceiveMemoryWarningNotification object:0];
                }
                else
                {
                  v122 = v62;
                  v62 = 0;
                }

                long long v70 = v62;
                v79 = v145;
                v62 = v128;
                goto LABEL_104;
              }
              id v101 = [[v97 alloc] initWithLevelID:0 comparator:v62->_comparator dataStore:v95];
            }
            v102 = v101;
            [v101 setIdentifier:@"L3"];
            goto LABEL_65;
          }
          id v99 = objc_msgSend(objc_msgSend(v135, "alloc"), "initWithLevelID:comparator:dataStore:", 0, v62->_comparator, v137);
        }
        v100 = v99;
        [v99 setIdentifier:@"L2"];
        goto LABEL_59;
      }
      id v98 = [[v142 alloc] initWithLevelID:0 comparator:v62->_comparator dataStore:v91];
    }
    v143 = v98;
    [v98 setIdentifier:@"L1"];
    goto LABEL_53;
  }
  long long v70 = 0;
  v79 = v145;
LABEL_105:
  uint64_t v123 = +[BCCacheManager loadCacheMetaData];
  cacheMetaData = v70->_cacheMetaData;
  v70->_cacheMetaData = (NSDictionary *)v123;

  return v70;
}

- (void)dealloc
{
  v3 = +[BURestrictionsProvider sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BCCacheManager;
  [(BCCacheManager *)&v4 dealloc];
}

- (void)_memoryWarning:(id)a3
{
  objc_super v4 = BCImageCacheLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1EBD6C();
  }

  id v5 = [(BCCacheManager *)self level1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8C7C4;
  v6[3] = &unk_2C74E8;
  v6[4] = self;
  [v5 gatherPrunableItemsForMedium:0 withCompletion:v6];
}

- (void)_checkRestrictedContentSettings
{
  v3 = +[BURestrictionsProvider sharedInstance];
  unsigned int v4 = [v3 isExplicitContentAllowed];

  id v5 = [(BCCacheManager *)self cacheMetaData];
  id v6 = [v5 objectForKeyedSubscript:@"BCCacheAllowRestrictedContent"];
  unsigned int v7 = [v6 BOOLValue];

  if (v4 != v7)
  {
    [(BCCacheManager *)self explicitContentRestrictedChanged];
  }
}

- (void)_preloadCache
{
  if (!+[BKReachability isOffline])
  {
    v3 = +[BICDescribedImage describedImageWithIdentifier:@"prioritizer", 0, CGSizeZero.width, CGSizeZero.height size processingOptions];
    [v3 setPriority:2];
    objc_initWeak(&location, self);
    unsigned int v4 = [(BCCacheManager *)self lowPriorityWorkQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_8CA20;
    v5[3] = &unk_2C7510;
    objc_copyWeak(&v6, &location);
    [v4 addWorkItemWithPriority:v3 description:@"CacheManager preload" block:v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_preloadAdamIDs:(id)a3
{
  id v4 = a3;
  id v5 = BCImageCacheLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 count]);
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "BCCacheManager: Preloading %@ asset IDs", buf, 0xCu);
  }
  if ([v4 count])
  {
    unsigned int v7 = +[BICDescribedImage describedImageWithIdentifier:@"prioritizer", 0, CGSizeZero.width, CGSizeZero.height size processingOptions];
    [v7 setPriority:2];
    objc_initWeak((id *)buf, self);
    v8 = [(BCCacheManager *)self lowPriorityWorkQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_8CD94;
    v9[3] = &unk_2C7580;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = v4;
    [v8 addWorkItemWithPriority:v7 description:@"CacheManager preload adamIDs" block:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_preloadOneBatch
{
  objc_initWeak(&location, self);
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_8C4E8;
  unint64_t v25 = sub_8C4F8;
  id v26 = 0;
  uint64_t v17 = 0;
  unsigned int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  id v12 = sub_8D394;
  v13 = &unk_2C75A8;
  id v14 = self;
  id v15 = &v21;
  id v16 = &v17;
  v3 = v11;
  os_unfair_lock_lock(&self->_accessLock);
  v12((uint64_t)v3);
  os_unfair_lock_unlock(&self->_accessLock);

  if ([(id)v22[5] count])
  {
    id v4 = BCImageCacheLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [(id)v22[5] count]);
      id v6 = +[NSNumber numberWithInteger:v18[3]];
      *(_DWORD *)buf = 138412546;
      BOOL v29 = v5;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&def_7D91C, v4, OS_LOG_TYPE_DEFAULT, "BCCacheManager: Preloading one batch of %@ asset IDs, remaining=%@", buf, 0x16u);
    }
    unsigned int v7 = +[BICDescribedImage describedImageWithIdentifier:@"prioritizer", 0, CGSizeZero.width, CGSizeZero.height size processingOptions];
    [v7 setPriority:2];
    v8 = [(BCCacheManager *)self lowPriorityWorkQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_8D49C;
    v9[3] = &unk_2C75D0;
    objc_copyWeak(&v10, &location);
    void v9[4] = &v21;
    [v8 addWorkItemWithPriority:v7 description:@"CacheManager preload one batch" block:v9];

    objc_destroyWeak(&v10);
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  objc_destroyWeak(&location);
}

- (void)_preloadBatch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = BCImageCacheLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v15 = [v6 count];
    _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_INFO, "BCCacheManager: Pre-loading a batch of %lu identifiers", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v9 = [(BCCacheManager *)self profileFetcher];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_8D760;
  v11[3] = &unk_2C7678;
  objc_copyWeak(&v13, (id *)buf);
  v11[4] = self;
  id v10 = v7;
  id v12 = v10;
  [v9 batchFetchCoverURLsFor:v6 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)addDescribedImages:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(BCCacheManager *)self workHighPriorityTarget];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_8DD70;
    v6[3] = &unk_2C3AF8;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (void)_addDescribedImages:(id)a3
{
  id v4 = a3;
  id v6 = (char *)[v4 count];
  if ((unint64_t)v6 >= 0x65)
  {
    id v7 = v6;
    uint64_t v8 = [v4 subarrayWithRange:0, 100];
    id v9 = [v4 subarrayWithRange:100, v7 - 100];

    id v10 = [(BCCacheManager *)self workHighPriorityTarget];
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    id v15 = sub_8DED4;
    id v16 = &unk_2C3AF8;
    uint64_t v17 = self;
    id v18 = v9;
    id v11 = v9;
    dispatch_async(v10, &v13);

    id v4 = (id)v8;
  }
  id v12 = [v4 objectAtIndexedSubscript:0];
  if (![v12 priority]) {
    [v12 setPriority:3];
  }
  [(BCCacheManager *)self _pushDescribedImages:v4 forRequest:v12];
}

- (void)removeDescribedImages:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(BCCacheManager *)self workHighPriorityTarget];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_8DF98;
    v6[3] = &unk_2C3AF8;
    id v7 = v4;
    uint64_t v8 = self;
    dispatch_async(v5, v6);
  }
}

- (void)addProductProfileIDs:(id)a3 priority:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(BCCacheManager *)self workHighPriorityTarget];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8E0F0;
  block[3] = &unk_2C4CB8;
  id v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)addURLs:(id)a3 priority:(unint64_t)a4 quality:(unsigned __int16)a5 expiresAfter:(int64_t)a6
{
  id v10 = a3;
  id v11 = [(BCCacheManager *)self workHighPriorityTarget];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8E36C;
  block[3] = &unk_2C76C0;
  int64_t v16 = a6;
  unint64_t v17 = a4;
  unsigned __int16 v18 = a5;
  id v14 = v10;
  id v15 = self;
  id v12 = v10;
  dispatch_async(v11, block);
}

- (void)addURLTemplate:(id)a3 forIdentifier:(id)a4
{
  if (a3)
  {
    -[BCCacheManager _extractImagesFromTemplate:identifier:initialSize:](self, "_extractImagesFromTemplate:identifier:initialSize:", a3, a4, 2048.0, 2048.0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if ([v5 count]) {
      [(BCCacheManager *)self _addDescribedImages:v5];
    }
  }
}

- (void)removeURLs:(id)a3 priority:(unint64_t)a4 quality:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v7 = a3;
  id v8 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [v7 allKeys];
  id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    double height = CGSizeZero.height;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v15 = +[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v14, 0, CGSizeZero.width, height);
        int64_t v16 = [v7 objectForKeyedSubscript:v14];
        [v15 setUrlString:v16];

        [v15 setQuality:v5];
        [v15 setPriority:a4];
        [v8 addObject:v15];
      }
      id v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  if ([v8 count]) {
    [(BCCacheManager *)self removeDescribedImages:v8];
  }
}

- (void)addFilePaths:(id)a3 priority:(unint64_t)a4 quality:(unsigned __int16)a5
{
  id v8 = a3;
  id v9 = [(BCCacheManager *)self workHighPriorityTarget];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_8E890;
  v11[3] = &unk_2C76E8;
  id v13 = self;
  unint64_t v14 = a4;
  unsigned __int16 v15 = a5;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(v9, v11);
}

- (void)addCGImage:(CGImage *)a3 withIdentifier:(id)a4 priority:(unint64_t)a5 quality:(unsigned __int16)a6
{
  id v10 = a4;
  CGImageRetain(a3);
  uint64_t v11 = [(BCCacheManager *)self workHighPriorityTarget];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8EB2C;
  block[3] = &unk_2C76C0;
  int64_t v16 = a3;
  unint64_t v17 = a5;
  unsigned __int16 v18 = a6;
  id v14 = v10;
  unsigned __int16 v15 = self;
  id v12 = v10;
  dispatch_async(v11, block);
}

- (void)cleanCache
{
  v3 = [(BCCacheManager *)self workHighPriorityTarget];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_8ECD0;
  block[3] = &unk_2C3C50;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (id)fetchLayerForAssetID:(id)a3 size:(CGSize)a4 options:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  CGSize v14 = a4;
  id v7 = a3;
  id v13 = 0;
  int v8 = ClampImageSize((uint64_t)&v14, 0, &v13);
  id v9 = v13;
  if (v8)
  {
    id v10 = BCImageCacheLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1EBDA0((uint64_t)v7, (uint64_t)v9, v10);
    }
  }
  uint64_t v11 = -[BCCacheManager _fetchLayerForIdentifier:size:options:](self, "_fetchLayerForIdentifier:size:options:", v7, v5, v14.width, v14.height);

  return v11;
}

- (id)_fetchLayerForIdentifier:(id)a3 size:(CGSize)a4 options:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  double width = a4.width;
  id v8 = a3;
  double v10 = CGSizeScaleToScreen(width);
  id v12 = +[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v8, v5, round(v10), round(v11));
  [v12 setPriority:5];
  [v12 setUnknownAspectRatio:1];
  id v13 = [(BCCacheManager *)self _fetchLayerForImage:v12];

  return v13;
}

- (id)_fetchLayerForImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BCImageCacheLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "BCCacheManager: Fetching a layer for request=%@", (uint8_t *)&v8, 0xCu);
  }

  +[BICCacheStats logOperation:BICCacheStatsOperationVendLayer[0] forRequest:v4];
  id v6 = [(BCCacheManager *)self _blankLayerForDescribedImage:v4];
  [(BCCacheManager *)self _fetchImage:v4 forRequest:v4 forInterest:v6];
  [(BCCacheManager *)self _fetchGenericForDescription:v4 forRequest:v4];

  return v6;
}

- (void)fetchDescribedImageFileURLForImage:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8F088;
  v7[3] = &unk_2C7730;
  id v8 = a4;
  id v6 = v8;
  [(BCCacheManager *)self fetchCGImageFor:a3 forRequest:a3 completion:v7];
}

- (void)_fetchImage:(id)a3 forRequest:(id)a4 forInterest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    [(BCCacheManager *)self _addInterest:v10];
  }
  double v11 = [(BCCacheManager *)self level1];
  id v12 = [v11 imageMatchingDescription:v8 forRequest:v9];

  id v13 = [v12 image];

  if (v13)
  {
    CGSize v14 = BCImageCacheLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v12;
      _os_log_impl(&def_7D91C, v14, OS_LOG_TYPE_INFO, "BCCacheManager: Exact match from RAM of image=%@", buf, 0xCu);
    }

    unint64_t v17 = v12;
    unsigned __int16 v15 = +[NSArray arrayWithObjects:&v17 count:1];
    [(BCCacheManager *)self _checkInterestForDescribedImages:v15 forRequest:v9];
  }
  else
  {
    +[BICCacheStats incrementCounter:kBICCacheStatsCounterL1Miss[0]];
    [(BCCacheManager *)self _fetchImagesMatchingDescription:v8 forRequest:v9];
  }
  int64_t v16 = [(BCCacheManager *)self coalescingPreloading];
  [v16 signalWithCompletion:&stru_2C7750];
}

- (void)_addInterest:(id)a3
{
  uint64_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  id v7 = sub_8F3A8;
  id v8 = &unk_2C3AF8;
  p_accessLock = &self->_accessLock;
  id v9 = self;
  id v10 = a3;
  id v4 = v10;
  os_unfair_lock_lock(p_accessLock);
  sub_8F3A8((uint64_t)&v5);
  os_unfair_lock_unlock(p_accessLock);
  +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", kBICCacheStatsCounterLayersVended[0], v5, v6);
}

- (void)_fetchBestImagesForDescription:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCacheManager *)self level1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_8F4DC;
  v11[3] = &unk_2C7778;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 getSortedBestMatchesOf:v10 forRequest:v9 completion:v11];
}

- (void)_fetchPrimaryImage:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[BICCacheStats logOperation:BICCacheStatsOperationBeginGenericUpgradeAttempt[0] forRequest:v7];
  objc_initWeak(&location, self);
  id v8 = [(BCCacheManager *)self level1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_8F708;
  v10[3] = &unk_2C77F0;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v11 = v9;
  id v12 = self;
  [v8 getPrimaryImageForRequest:v9 completion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_checkStack:(id)a3 forInterestIn:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v8 = BUDynamicCast();

  if (v8)
  {
    id v9 = [v8 describedImageShown];
    id v10 = [v8 describedImageRequested];
    id v11 = [(BCCacheManager *)self workHighPriorityTarget];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_8FC88;
    block[3] = &unk_2C7840;
    id v15 = v10;
    id v16 = v9;
    id v17 = v6;
    unsigned __int16 v18 = self;
    id v19 = v8;
    id v12 = v9;
    id v13 = v10;
    dispatch_async(v11, block);
  }
}

- (void)_performGenericUpgradeOfStackForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BCImageCacheLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_INFO, "BCCacheManager: Attempting to upgrade a generic series stack request=%@", buf, 0xCu);
  }

  +[BICCacheStats logOperation:BICCacheStatsOperationBeginGenericStackUpgradeAttempt[0] forRequest:v4];
  id v6 = [(BCCacheManager *)self seriesDecomposer];
  id v7 = [v4 identifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_90410;
  v9[3] = &unk_2C7558;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  [v6 assetIDsAndOptionsForBooksInSeries:v7 completion:v9];
}

- (void)_checkForGenericUpgradeForInterest:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = BUDynamicCast();

  if (v5)
  {
    id v6 = [v5 describedImageShown];
    id v7 = [v5 describedImageRequested];
    id v8 = [(BCCacheManager *)self workHighPriorityTarget];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_9070C;
    block[3] = &unk_2C48E0;
    id v12 = v7;
    id v13 = v6;
    CGSize v14 = self;
    id v9 = v6;
    id v10 = v7;
    dispatch_async(v8, block);
  }
}

- (void)_checkForQualityUpgradeForInterest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 describedImageShown];
  unsigned int v6 = [v5 isLowQuality];

  if (v6)
  {
    id v7 = [v4 describedImageRequested];
    id v8 = [(BCCacheManager *)self workHighPriorityTarget];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_90934;
    v10[3] = &unk_2C3AF8;
    id v11 = v7;
    id v12 = self;
    id v9 = v7;
    dispatch_async(v8, v10);
  }
}

- (void)_fetchImagesMatchingBestDescriptions:(id)a3 forOriginalDescription:(id)a4 forRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] && objc_msgSend(v10, "priority") != (char *)&def_7D91C + 1)
  {
    objc_initWeak(&location, self);
    id v11 = [v8 objectAtIndexedSubscript:0];
    id v12 = [(BCCacheManager *)self level1];
    id v13 = [v12 imageMatchingDescription:v11 forRequest:v10];

    if (v13)
    {
      long long v23 = v13;
      CGSize v14 = +[NSArray arrayWithObjects:&v23 count:1];
      [(BCCacheManager *)self _checkInterestForDescribedImages:v14 forRequest:v10];
    }
    else
    {
      +[BICCacheStats incrementCounter:kBICCacheStatsCounterL1Miss[0]];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_90CB8;
      v15[3] = &unk_2C7868;
      objc_copyWeak(&v21, &location);
      id v16 = v10;
      id v17 = self;
      id v18 = v9;
      id v19 = v11;
      id v20 = v8;
      [(BCCacheManager *)self _fetchImagesMatchingDescription:v19 withTimeout:30 forRequest:v16 completion:v15];

      objc_destroyWeak(&v21);
    }

    objc_destroyWeak(&location);
  }
  else if (([v10 isAlternateGeneric] & 1) == 0)
  {
    [(BCCacheManager *)self _makeGenericForDescription:v9 forRequest:v10];
  }
}

- (int64_t)_maxCostForMedium:(signed __int16)a3
{
  int64_t v3 = 0x7FFFFFFFLL;
  if (a3 == 1) {
    int64_t v3 = 1048576000;
  }
  if (a3) {
    return v3;
  }
  else {
    return 52428800;
  }
}

- (void)_pruneIfNeeded
{
  [(BCCacheManager *)self nextRamPruneDate];
  double v4 = v3;
  +[NSDate timeIntervalSinceReferenceDate];
  if (v4 <= v5)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    [(BCCacheManager *)self setNextRamPruneDate:v6 + 2.0];
    [(BCCacheManager *)self _pruneMediumIfNeeded:0];
  }
  [(BCCacheManager *)self nextDiskPruneDate];
  double v8 = v7;
  +[NSDate timeIntervalSinceReferenceDate];
  if (v8 <= v9)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    [(BCCacheManager *)self setNextDiskPruneDate:v10 + 604800.0];
    id v11 = +[NSUserDefaults standardUserDefaults];
    [(BCCacheManager *)self nextDiskPruneDate];
    [v11 setDouble:@"BCCacheManagerNextDiskPruneDate" forKey:];

    [(BCCacheManager *)self _pruneMediumIfNeeded:1];
  }
}

- (void)_pruneMediumIfNeeded:(signed __int16)a3
{
  double v5 = [(BCCacheManager *)self lowPriorityTarget];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_911E0;
  v6[3] = &unk_2C7900;
  void v6[4] = self;
  signed __int16 v7 = a3;
  dispatch_async(v5, v6);
}

- (void)pruneItemsWithIdentifier:(id)a3 forMedium:(signed __int16)a4
{
  id v6 = a3;
  signed __int16 v7 = [(BCCacheManager *)self lowPriorityTarget];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_916E0;
  block[3] = &unk_2C7978;
  void block[4] = self;
  id v10 = v6;
  signed __int16 v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)_pushDescribedImages:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    objc_initWeak(&location, self);
    if ([v6 count] == (char *)&def_7D91C + 1)
    {
      id v8 = BCImageCacheLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        double v9 = [v6 objectAtIndexedSubscript:0];
        *(_DWORD *)buf = 138412290;
        id v26 = v9;
        _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_DEFAULT, "BCCacheManager: Adding 1 image to cache: %@", buf, 0xCu);
      }
    }
    else
    {
      id v8 = BCImageCacheLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
        signed __int16 v11 = [v6 objectAtIndexedSubscript:0];
        *(_DWORD *)buf = 138412546;
        id v26 = v10;
        __int16 v27 = 2112;
        uint64_t v28 = v11;
        _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_DEFAULT, "BCCacheManager: Adding %@ images to cache, e.g. %@", buf, 0x16u);
      }
    }

    if ([v6 count] != (char *)&def_7D91C + 1
      || ([v6 objectAtIndexedSubscript:0],
          id v12 = objc_claimAutoreleasedReturnValue(),
          [v12 image],
          id v13 = objc_claimAutoreleasedReturnValue(),
          BOOL v14 = v13 == 0,
          v13,
          v12,
          v14))
    {
      char v15 = 0;
    }
    else
    {
      [(BCCacheManager *)self _checkInterestForDescribedImages:v6 forRequest:v7];
      char v15 = 1;
    }
    id v16 = [(BCCacheManager *)self level1];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_91D00;
    v19[3] = &unk_2C79A0;
    char v23 = v15;
    objc_copyWeak(&v22, &location);
    id v17 = v6;
    id v20 = v17;
    id v21 = v7;
    [v16 addDescribedImages:v17 forRequest:v21 completion:v19];

    +[BICCacheStats addToCounter:amount:](BICCacheStats, "addToCounter:amount:", kBICCacheStatsCounterImagesPushed[0], [v17 count]);
    id v18 = [(BCCacheManager *)self coalescingPruning];
    [v18 signalWithCompletion:&stru_2C79C0];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (void)_fetchImagesMatchingDescription:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCacheManager *)self workHighPriorityTarget];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_91E44;
  block[3] = &unk_2C48E0;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)_fetchImagesMatchingDescription:(id)a3 withTimeout:(int64_t)a4 forRequest:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  objc_initWeak(&location, v10);
  dispatch_time_t v13 = dispatch_time(0, 1000000000 * a4);
  id v14 = [(BCCacheManager *)self workHighPriorityTarget];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_92370;
  block[3] = &unk_2C7A10;
  void block[4] = self;
  uint64_t v28 = v31;
  objc_copyWeak(&v29, &location);
  id v15 = v12;
  id v27 = v15;
  dispatch_after(v13, v14, block);

  if (([v11 requestOptions] & 0x10) != 0)
  {
    id v16 = [v10 copy];
    [v16 setRequestOptions:2];
    id v17 = [(BCCacheManager *)self level1];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_924DC;
    v23[3] = &unk_2C7A60;
    v23[4] = self;
    unint64_t v25 = v31;
    id v24 = v15;
    [v17 fetchImagesMatchingDescription:v16 forRequest:v11 completion:v23];
  }
  +[BICCacheStats logOperation:BICCacheStatsOperationAsyncFetchExactAttempt[0] forRequest:v11];
  id v18 = [(BCCacheManager *)self level1];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_925C4;
  v20[3] = &unk_2C7A60;
  v20[4] = self;
  id v22 = v31;
  id v19 = v15;
  id v21 = v19;
  [v18 fetchImagesMatchingDescription:v10 forRequest:v11 completion:v20];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
  _Block_object_dispose(v31, 8);
}

- (void)_fetchImagesMatchingDescriptionWithoutPushing:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCacheManager *)self workHighPriorityTarget];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_92784;
  block[3] = &unk_2C48E0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (BOOL)_isGenericNeededForDescription:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = sub_8C4E8;
  id v43 = sub_8C4F8;
  id v44 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  uint64_t v35 = sub_92C0C;
  v36 = &unk_2C39F0;
  uint64_t v37 = self;
  v38 = &v39;
  id v8 = v34;
  os_unfair_lock_lock(&self->_accessLock);
  v35((uint64_t)v8);
  os_unfair_lock_unlock(&self->_accessLock);

  if ([v7 seriesStack] && (objc_msgSend(v6, "seriesStack") & 1) == 0)
  {
    id v9 = [v6 identifier];
    char v29 = 1;
  }
  else
  {
    id v9 = [v7 identifier];
    char v29 = 0;
  }
  [v6 imageSize];
  double v11 = v10;
  double v13 = v12;
  double height = CGSizeZero.height;
  if (CGSizeZero.width == v10 && height == v13)
  {
    [v7 imageSize:CGSizeZero.width height];
    double v11 = v16;
    double v13 = v17;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v18 = (id)v40[5];
  id v19 = [v18 countByEnumeratingWithState:&v30 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v31;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v18);
        }
        id v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        char v23 = [v22 identifier];
        if ([v23 isEqualToString:v9])
        {
          [v22 imageSize];
          BOOL v26 = v13 == v25 && v11 == v24;

          if (v26)
          {

            BOOL v27 = 0;
            goto LABEL_28;
          }
        }
        else
        {
        }
      }
      id v19 = [v18 countByEnumeratingWithState:&v30 objects:v45 count:16];
    }
    while (v19);
  }

  if (v29) {
    BOOL v27 = 1;
  }
  else {
    BOOL v27 = [(BCCacheManager *)self _isVendedInterestBlankOrOldForRequest:v7];
  }
LABEL_28:

  _Block_object_dispose(&v39, 8);
  return v27;
}

- (BOOL)_isVendedInterestBlankOrOldForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_8C4E8;
  uint64_t v39 = sub_8C4F8;
  id v40 = 0;
  p_accessLock = &self->_accessLock;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  long long v31 = sub_92F68;
  long long v32 = &unk_2C6758;
  long long v33 = self;
  double v34 = &v35;
  id v6 = v30;
  os_unfair_lock_lock(p_accessLock);
  v31((uint64_t)v6);
  os_unfair_lock_unlock(p_accessLock);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = (id)v36[5];
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v41 count:16];
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v9 = *(void *)v27;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(v7);
      }
      double v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      double v12 = [v11 describedImageRequested:v26];
      double v13 = [v12 identifier];
      id v14 = [v4 identifier];
      unsigned int v15 = [v13 isEqualToString:v14];

      if (v15)
      {
        double v16 = [v11 describedImageShown];
        if ([v16 quality] == 3 || objc_msgSend(v11, "needsNewVersion"))
        {
          unsigned int v17 = ([v16 processingOptions] >> 9) & 1;
          if (!v16) {
            goto LABEL_16;
          }
        }
        else
        {
          unsigned int v17 = 0;
          if (!v16) {
            goto LABEL_16;
          }
        }
        if ([v16 quality] == 1) {
          int v18 = 1;
        }
        else {
          int v18 = v17;
        }
        if (v18 != 1)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_16:
        [v4 imageSize];
        double v20 = v19;
        double v22 = v21;
        [v12 imageSize];
        if (v20 == v24 && v22 == v23)
        {

          LOBYTE(v8) = 1;
          goto LABEL_23;
        }
        goto LABEL_18;
      }
LABEL_19:
    }
    id v8 = [v7 countByEnumeratingWithState:&v26 objects:v41 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_23:

  _Block_object_dispose(&v35, 8);
  return (char)v8;
}

- (void)_fetchGenericForDescription:(id)a3 forRequest:(id)a4
{
  id v5 = a4;
  id v6 = [v5 copy];
  [v6 setProcessingOptions:[v6 processingOptions] | 0x200];
  [v6 setRequestOptions:[v6 requestOptions] | 8];
  [v5 setAlternateRequest:v6];

  [(BCCacheManager *)self _fetchImagesMatchingDescription:v6 forRequest:v6];
}

- (void)_makeGenericForDescription:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = BCImageCacheLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v6;
    _os_log_impl(&def_7D91C, v8, OS_LOG_TYPE_INFO, "BCCacheManager: Asked to make generic for image=%@", buf, 0xCu);
  }

  if ([(BCCacheManager *)self _isGenericNeededForDescription:v6 forRequest:v7])
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_93434;
    v25[3] = &unk_2C48E0;
    id v9 = v7;
    id v26 = v9;
    id v10 = v6;
    id v27 = v10;
    long long v28 = self;
    os_unfair_lock_lock(&self->_accessLock);
    sub_93434((id *)v25);
    os_unfair_lock_unlock(&self->_accessLock);
    double v11 = BCImageCacheLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v10;
      _os_log_impl(&def_7D91C, v11, OS_LOG_TYPE_INFO, "BCCacheManager: Making generic for image=%@", buf, 0xCu);
    }

    +[BICCacheStats logOperation:BICCacheStatsOperationMakingGenericQueueStart[0] forRequest:v9];
    [v10 imageSize];
    double v14 = v13;
    double v15 = v12;
    double height = CGSizeZero.height;
    if (CGSizeZero.width == v13 && height == v12)
    {
      [v9 imageSize];
      double v14 = v17;
      double v15 = v18;
    }
    if (CGSizeZero.width == v14 && height == v15)
    {
      double v19 = BCImageCacheLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&def_7D91C, v19, OS_LOG_TYPE_INFO, "BCCacheManager: _makeGenericForDescription: invalid image size", buf, 2u);
      }
    }
    else
    {
      objc_initWeak((id *)buf, self);
      kdebug_trace();
      double v20 = [(BCCacheManager *)self highPriorityWorkQueue];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_934B4;
      v21[3] = &unk_2C7B10;
      objc_copyWeak(v24, (id *)buf);
      id v22 = v9;
      id v23 = v10;
      v24[1] = *(id *)&v14;
      v24[2] = *(id *)&v15;
      [v20 addWorkItemWithPriority:v22 description:@"CacheManager make generic" block:v21];

      objc_destroyWeak(v24);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    +[BICCacheStats incrementCounter:kBICCacheStatsCounterGenericsNotCreated[0]];
  }
}

- (void)explicitContentRestrictedChanged
{
  double v3 = BCImageCacheLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, v3, OS_LOG_TYPE_INFO, "BCCacheManager: Explicit content restrictions changed", buf, 2u);
  }

  id v4 = [(BCCacheManager *)self delegate];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_9425C;
  v11[3] = &unk_2C7B38;
  void v11[4] = self;
  [v4 cacheManager:self explicitIdentifiersWithCompletion:v11];

  id v5 = +[BURestrictionsProvider sharedInstance];
  id v6 = [v5 isExplicitContentAllowed];

  id v7 = [(BCCacheManager *)self cacheMetaData];
  id v8 = [v7 mutableCopy];

  id v9 = +[NSNumber numberWithBool:v6];
  [v8 setObject:v9 forKeyedSubscript:@"BCCacheAllowRestrictedContent"];

  +[BCCacheManager writeCacheMetaData:v8];
  id v10 = [v8 copy];
  [(BCCacheManager *)self setCacheMetaData:v10];
}

- (void)incrementVersionForIdentifiers:(id)a3
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_94338;
  id v9 = &unk_2C3AF8;
  id v10 = self;
  id v11 = a3;
  id v4 = v11;
  os_unfair_lock_lock(&v10->_accessLock);
  sub_94338((uint64_t)&v6);
  os_unfair_lock_unlock(&self->_accessLock);
  id v5 = [(BCCacheManager *)self coalescingVersionBump];
  [v5 signalWithCompletion:&stru_2C7B58];
}

- (void)incrementVersionForIdentifier:(id)a3
{
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_94460;
  id v9 = &unk_2C3AF8;
  id v10 = self;
  id v11 = a3;
  id v4 = v11;
  os_unfair_lock_lock(&v10->_accessLock);
  sub_94460((uint64_t)&v6);
  os_unfair_lock_unlock(&self->_accessLock);
  id v5 = [(BCCacheManager *)self coalescingVersionBump];
  [v5 signalWithCompletion:&stru_2C7B78];
}

- (void)_incrementVersionForIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCacheManager *)self workHighPriorityTarget];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_9456C;
  v7[3] = &unk_2C3AF8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_updateVendedImageInterest:(id)a3 withDescribedImage:(id)a4 forRequest:(id)a5
{
  id v8 = a5;
  [a3 setDescribedImage:a4];
  uint64_t v7 = [v8 alternateRequest];
  [v7 setPriority:1];

  +[BICCacheStats logOperation:BICCacheStatsOperationCancelled[0] forRequest:v8];
}

- (void)_checkInterestForDescribedImages:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BCCacheManager *)self workHighPriorityTarget];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_947E8;
  block[3] = &unk_2C48E0;
  id v12 = v6;
  double v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_performOperation:(id)a3
{
  id v7 = a3;
  switch([v7 operationKind])
  {
    case 0u:
      id v4 = [v7 subject];
      id v5 = [v7 result];
      id v6 = [v7 request];
      [(BCCacheManager *)self _transformSourceDescribedImage:v4 into:v5 forRequest:v6];
      goto LABEL_4;
    case 1u:
      id v4 = [v7 vendedImageInterest];
      id v5 = [v7 subject];
      id v6 = [v7 request];
      [(BCCacheManager *)self _updateVendedImageInterest:v4 withDescribedImage:v5 forRequest:v6];
LABEL_4:

      goto LABEL_9;
    case 2u:
      id v4 = [v7 vendedImageInterest];
      [(BCCacheManager *)self _checkForQualityUpgradeForInterest:v4];
      goto LABEL_10;
    case 3u:
      id v4 = [v7 vendedImageInterest];
      [(BCCacheManager *)self _checkForGenericUpgradeForInterest:v4];
      goto LABEL_10;
    case 4u:
      id v4 = [v7 subject];
      id v5 = [v7 request];
      [(BCCacheManager *)self _fetchImagesMatchingDescription:v4 forRequest:v5];
      goto LABEL_9;
    case 5u:
      id v4 = [v7 subject];
      id v5 = [v7 request];
      [(BCCacheManager *)self _fetchImagesMatchingDescriptionWithoutPushing:v4 forRequest:v5];
LABEL_9:

LABEL_10:
      break;
    default:
      break;
  }
}

- (id)_findInterestForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = sub_8C4E8;
  id v30 = sub_8C4F8;
  id v31 = 0;
  p_accessLock = &self->_accessLock;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  id v22 = sub_95330;
  id v23 = &unk_2C6758;
  double v24 = self;
  double v25 = &v26;
  id v6 = v21;
  os_unfair_lock_lock(p_accessLock);
  v22((uint64_t)v6);
  os_unfair_lock_unlock(p_accessLock);

  id v7 = +[NSMutableArray array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)v27[5];
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v13 = [v12 describedImageRequested];
        id v14 = [v13 identifier];
        unsigned int v15 = [v14 isEqualToString:v4];

        if (v15) {
          [v7 addObject:v12];
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v17 objects:v32 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(&v26, 8);

  return v7;
}

- (void)_transformSourceDescribedImage:(id)a3 into:(id)a4 forRequest:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BCCacheManager *)self transformController];
  [v11 transformSource:v10 to:v9 forRequest:v8];
}

- (id)_blankLayerForDescribedImage:(id)a3
{
  id v4 = a3;
  id v5 = [[BCCacheVendedLayer alloc] initWithDebugLayout:[(BCCacheManager *)self debugLayout]];
  [(BCCacheVendedLayer *)v5 setDescribedImageRequested:v4];
  id v6 = [(BCCacheManager *)self _blankCoverForDescribedImage:v4];

  [(BCCacheVendedLayer *)v5 setDescribedImage:v6];

  return v5;
}

- (id)_blankCoverForDescribedImage:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 processingOptions];
  unsigned __int8 v6 = [v4 processingOptions];
  unsigned __int16 v7 = (unsigned __int16)[v4 processingOptions];
  unsigned __int8 v8 = [v4 processingOptions];
  [v4 imageSize];
  uint64_t v10 = v9;
  [v4 imageSize];
  CFStringRef v12 = @"Night";
  __int16 v13 = v5 & 0x40;
  if ((v5 & 0x40) == 0) {
    CFStringRef v12 = @"Day";
  }
  CFStringRef v14 = @"audiobookStack";
  if ((v7 & 0x800) == 0) {
    CFStringRef v14 = @"stack";
  }
  CFStringRef v15 = @"audio";
  if ((v8 & 8) == 0) {
    CFStringRef v15 = @"book";
  }
  __int16 v16 = v6 & 0x20;
  if ((v6 & 0x20) == 0) {
    CFStringRef v14 = v15;
  }
  +[NSString stringWithFormat:@"%.0f x %.0f %@ %@", v10, v11, v12, v14];
  uint64_t v56 = 0;
  uint64_t v57 = (id *)&v56;
  uint64_t v58 = 0x3032000000;
  v59 = sub_8C4E8;
  dispatch_time_t v60 = sub_8C4F8;
  id v61 = 0;
  p_accessLock = &self->_accessLock;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  BOOL v51 = sub_95B18;
  v52 = &unk_2C3AD0;
  uint64_t v55 = &v56;
  dispatch_queue_t v53 = self;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v54 = v18;
  long long v19 = v50;
  os_unfair_lock_lock(&self->_accessLock);
  v51((uint64_t)v19);
  os_unfair_lock_unlock(&self->_accessLock);

  id v20 = v57[5];
  if (v20)
  {
    id v21 = [v20 copy];
    id v22 = v57[5];
    v57[5] = v21;

    id v23 = [v4 identifier];
    [v57[5] setIdentifier:v23];
LABEL_11:

    goto LABEL_12;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    [v4 imageSize];
    double v28 = v27;
    BOOL v29 = v16 == 0;
    if ((v7 & 0x800) == 0) {
      BOOL v29 = 1;
    }
    double v30 = v27;
    if ((v8 & 8) == 0)
    {
      double v30 = v27;
      if (v29)
      {
        [v4 imageSize];
        double v30 = v31;
      }
    }
    long long v32 = CGBitmapContextCreate(0, (unint64_t)v28, (unint64_t)v30, 8uLL, vcvtd_n_u64_f64(v28, 2uLL), DeviceRGB, 1u);
    CGColorSpaceRelease(DeviceRGB);
    if (v32)
    {
      double v33 = 0.0;
      double v34 = v28;
      double v35 = v30;
      if (v16)
      {
        +[UIColor colorWithRed:243.0 / dbl_2A2250[v13 == 0] green:243.0 / dbl_2A2250[v13 == 0] blue:248.0 / dbl_2A2250[v13 == 0] alpha:1.0];
        id v36 = objc_claimAutoreleasedReturnValue();
        CGContextSetFillColorWithColor(v32, (CGColorRef)[v36 CGColor]);

        CGContextSaveGState(v32);
        double v34 = v28 * 0.85;
        double v35 = v30 * 0.85;
        +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, v30 - v30 * 0.85, v28 * 0.85, v30 * 0.85, 3.0);
        id v37 = objc_claimAutoreleasedReturnValue();
        CGContextAddPath(v32, (CGPathRef)[v37 CGPath]);
        CGContextFillPath(v32);
        CGContextRestoreGState(v32);
        double v33 = v28 - v28 * 0.85;
      }
      double v38 = 255.0;
      if (v13) {
        double v38 = 512.0;
      }
      id v39 = +[UIColor colorWithRed:243.0 / v38 green:243.0 / v38 blue:248.0 / v38 alpha:1.0];
      CGContextSetFillColorWithColor(v32, (CGColorRef)[v39 CGColor]);

      CGContextSaveGState(v32);
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v33, 0.0, v34, v35, 3.0);
      id v23 = objc_claimAutoreleasedReturnValue();
      CGContextAddPath(v32, (CGPathRef)[v23 CGPath]);
      CGContextFillPath(v32);
      CGContextRestoreGState(v32);
      Image = CGBitmapContextCreateImage(v32);
      CGContextRelease(v32);
      if (Image)
      {
        uint64_t v41 = [v4 copy];
        [v41 setProcessingOptions:(unsigned __int16)(v16 | v13)];
        id v42 = +[BICImage imageWithCGImage:Image];
        [v41 setImage:v42];

        [v41 setQuality:1];
        CGImageRelease(Image);
        objc_storeStrong(v57 + 5, v41);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        id v45 = sub_95B84;
        id v46 = &unk_2C4720;
        id v47 = self;
        id v48 = v18;
        id v49 = &v56;
        id v43 = v44;
        os_unfair_lock_lock(p_accessLock);
        v45((uint64_t)v43);
        os_unfair_lock_unlock(p_accessLock);
      }
      else
      {
        uint64_t v41 = BCImageCacheLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
          sub_1EC084();
        }
      }
    }
    else
    {
      id v23 = BCImageCacheLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_1EC004();
      }
    }
    goto LABEL_11;
  }
LABEL_12:
  +[BICCacheStats logDescribedImage:v57[5] withComment:@"BlankCover"];
  id v24 = v57[5];

  _Block_object_dispose(&v56, 8);

  return v24;
}

- (void)fetchCoverURLsFor:(id)a3 immediately:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(BCCacheManager *)self profileFetcher];
  [v10 fetchCoverURLsFor:v9 immediately:v5 completion:v8];
}

+ (id)processURLTemplate:(id)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v6 = a3;
  if ([v6 containsString:@"{w}"]
    && [v6 containsString:@"{h}"])
  {
    id v7 = [v6 mutableCopy];
    id v8 = +[NSNumber numberWithInteger:llround(width)];
    id v9 = [v8 stringValue];
    [v7 replaceOccurrencesOfString:@"{w}" withString:v9 options:2 range:[v7 length]];

    id v10 = +[NSNumber numberWithInteger:llround(height)];
    uint64_t v11 = [v10 stringValue];
    [v7 replaceOccurrencesOfString:@"{h}" withString:v11 options:2 range:[v7 length]];

    [v7 replaceOccurrencesOfString:@"{c}" withString:&stru_2CE418 options:2 range:[v7 length]];
    objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"{f}", @"jpg", 2, 0, objc_msgSend(v7, "length"));

    id v6 = v7;
  }

  return v6;
}

- (id)_extractImagesFromTemplate:(id)a3 identifier:(id)a4 initialSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[NSMutableArray array];
  int v11 = 4;
  do
  {
    if (width <= 4096.0 && height <= 4096.0)
    {
      __int16 v13 = +[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v9, 0, width, height);
      CFStringRef v14 = +[BCCacheManager processURLTemplate:forSize:](BCCacheManager, "processURLTemplate:forSize:", v8, width, height);
      [v13 setUrlString:v14];

      CFStringRef v15 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
      [v13 setExpiry:v15];

      [v13 setQuality:203];
      [v10 addObject:v13];
    }
    double width = floor(width * 0.5);
    double height = floor(height * 0.5);
    --v11;
  }
  while (v11);

  return v10;
}

- (id)describedImagesFromProductProfile:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSMutableArray array];
  id v6 = [v4 url];

  if (v6)
  {
    double v7 = (double)(unint64_t)[v4 width];
    double v8 = (double)(unint64_t)[v4 height];
    double height = CGSizeZero.height;
    if (CGSizeZero.width == v7 && height == v8)
    {
      CFStringRef v14 = [v4 url:CGSizeZero.width, height];
      int v11 = [v14 lastPathComponent];

      CFStringRef v12 = [v11 componentsSeparatedByString:@"x"];
      if ([v12 count] == (char *)&def_7D91C + 2)
      {
        __int16 v16 = [v12 objectAtIndexedSubscript:0];
        id v17 = [v16 integerValue];

        id v18 = [v12 objectAtIndexedSubscript:1];
        id v19 = [v18 integerValue];

        double v15 = (double)(uint64_t)v17;
        if ((uint64_t)v17 > 0 && (uint64_t)v19 > 0)
        {
          double v8 = (double)(uint64_t)v19;
          double v7 = (double)(uint64_t)v17;
        }
      }
      id v20 = [v4 identifier:v15];
      __int16 v13 = +[BICDescribedImage describedImageWithIdentifier:size:processingOptions:](BICDescribedImage, "describedImageWithIdentifier:size:processingOptions:", v20, 0, v7, v8);

      id v21 = [v4 url];
      [v13 setUrlString:v21];

      id v22 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
      [v13 setExpiry:v22];

      [v13 setQuality:203];
      [v5 addObject:v13];
    }
    else
    {
      int v11 = [v4 url:CGSizeZero.width, height];
      CFStringRef v12 = [v4 identifier];
      -[BCCacheManager _extractImagesFromTemplate:identifier:initialSize:](self, "_extractImagesFromTemplate:identifier:initialSize:", v11, v12, v7, v8);
      BOOL v5 = v13 = v5;
    }
  }

  return v5;
}

- (void)fetchCoverForURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BCCacheManager *)self protocolHandler];
  [v8 fetchCoverForURL:v7 completion:v6];
}

- (BOOL)canFetchCoverForURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BCCacheManager *)self protocolHandler];
  unsigned __int8 v6 = [v5 canFetchCoverForURL:v4];

  return v6;
}

- (void)transformResultSrc:(id)a3 result:(id)a4 forRequest:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = a4;
  id v9 = +[NSArray arrayWithObjects:&v10 count:1];

  -[BCCacheManager _pushDescribedImages:forRequest:](self, "_pushDescribedImages:forRequest:", v9, v7, v10);
}

- (void)stackRenderingResultSrc:(id)a3 result:(id)a4 forRequest:(id)a5
{
  if (a4)
  {
    id v10 = a4;
    id v7 = a5;
    id v8 = a4;
    id v9 = +[NSArray arrayWithObjects:&v10 count:1];

    -[BCCacheManager _pushDescribedImages:forRequest:](self, "_pushDescribedImages:forRequest:", v9, v7, v10);
  }
}

- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 completion:(id)a5
{
}

- (void)fetchCGImageFor:(id)a3 forRequest:(id)a4 timeOut:(double)a5 waitForNonGeneric:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  double v15 = BCImageCacheLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl(&def_7D91C, v15, OS_LOG_TYPE_DEFAULT, "BCCacheManager: Fetching image=%@ for request=%@", buf, 0x16u);
  }

  +[BICCacheStats incrementCounter:kBICCacheStatsCounterCGImagesVended[0]];
  [v12 setUnknownAspectRatio:1];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_96808;
  v36[3] = &unk_2C3AF8;
  v36[4] = self;
  __int16 v16 = objc_alloc_init(BCCacheCallbackInterest);
  id v37 = v16;
  os_unfair_lock_lock(&self->_accessLock);
  sub_96808((uint64_t)v36);
  os_unfair_lock_unlock(&self->_accessLock);
  [(BCCacheCallbackInterest *)v16 setDescribedImageRequested:v12];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v16);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v39 = sub_8C4E8;
  id v40 = sub_8C4F8;
  id v41 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_9685C;
  v26[3] = &unk_2C7BE0;
  objc_copyWeak(&v31, &location);
  objc_copyWeak(&v32, &from);
  BOOL v17 = !a6;
  id v18 = v13;
  BOOL v33 = v17;
  double v30 = buf;
  id v27 = v18;
  double v28 = self;
  id v19 = v14;
  id v29 = v19;
  [(BCCacheCallbackInterest *)v16 setHandler:v26];
  [(BCCacheManager *)self _fetchImage:v12 forRequest:v18 forInterest:v16];
  if (a5 > 0.0)
  {
    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    id v21 = [(BCCacheManager *)self workHighPriorityTarget];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_96DC0;
    v22[3] = &unk_2C48E0;
    id v23 = v16;
    id v24 = self;
    id v25 = v18;
    dispatch_after(v20, v21, v22);
  }
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)imageSetPersisting:(id)a3 newVersionForImageSetIdentifierss:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = BCImageCacheLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_INFO, "BCCacheManager: New version for assetID=%@", buf, 0xCu);
  }

  id v7 = [(BCCacheManager *)self workHighPriorityTarget];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_96F68;
  v9[3] = &unk_2C3AF8;
  id v10 = v5;
  int v11 = self;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)_refetchInterestsForNewVersion:(id)a3
{
  id v4 = [(BCCacheManager *)self _findInterestForIdentifier:a3];
  if ([v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          int v11 = [v10 describedImageRequested];
          +[BICCacheStats logOperation:BICCacheStatsOperationNeedNewVersion[0] forRequest:v11];
          [v10 setNeedsNewVersion:1];
          [(BCCacheManager *)self _fetchImagesMatchingDescription:v11 forRequest:v11];
          id v12 = BCImageCacheLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v18 = v11;
            _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_INFO, "BCCacheManager: Refetching New version for request=%@", buf, 0xCu);
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v7);
    }
  }
}

- (id)metadataForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BCCacheManager *)self imageSetPersistence];
  id v6 = [v5 metadataForIdentifier:v4];

  return v6;
}

- (void)fetchMetadataForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BCCacheManager *)self imageSetPersistence];
  [v8 fetchMetadataForIdentifier:v7 completion:v6];
}

- (void)imageColorForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BCCacheManager *)self imageSetPersistence];
  [v8 imageColorForIdentifier:v7 completion:v6];
}

- (void)setImageColor:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(BCCacheManager *)self imageSetPersistence];
  [v8 setImageColor:v7 forIdentifier:v6];
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
}

- (OS_dispatch_queue)workGenericsTarget
{
  return self->_workGenericsTarget;
}

- (void)setWorkGenericsTarget:(id)a3
{
}

- (OS_dispatch_queue)workHighPriorityTarget
{
  return self->_workHighPriorityTarget;
}

- (void)setWorkHighPriorityTarget:(id)a3
{
}

- (OS_dispatch_queue)workLowPriorityTarget
{
  return self->_workLowPriorityTarget;
}

- (void)setWorkLowPriorityTarget:(id)a3
{
}

- (OS_dispatch_queue)highPriorityTarget
{
  return self->_highPriorityTarget;
}

- (void)setHighPriorityTarget:(id)a3
{
}

- (OS_dispatch_queue)lowPriorityTarget
{
  return self->_lowPriorityTarget;
}

- (void)setLowPriorityTarget:(id)a3
{
}

- (BICWorkQueue)lowPriorityWorkQueue
{
  return self->_lowPriorityWorkQueue;
}

- (void)setLowPriorityWorkQueue:(id)a3
{
}

- (BICWorkQueue)highPriorityWorkQueue
{
  return self->_highPriorityWorkQueue;
}

- (void)setHighPriorityWorkQueue:(id)a3
{
}

- (BCCacheManagingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BCCacheManagingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BCSeriesStackDecomposing)seriesDecomposer
{
  return self->_seriesDecomposer;
}

- (void)setSeriesDecomposer:(id)a3
{
}

- (BUCoalescingCallBlock)coalescingVersionBump
{
  return self->_coalescingVersionBump;
}

- (void)setCoalescingVersionBump:(id)a3
{
}

- (BUCoalescingCallBlock)coalescingPruning
{
  return self->_coalescingPruning;
}

- (void)setCoalescingPruning:(id)a3
{
}

- (BUCoalescingCallBlock)coalescingPreloading
{
  return self->_coalescingPreloading;
}

- (void)setCoalescingPreloading:(id)a3
{
}

- (BICLevelCaching)level2
{
  return self->_level2;
}

- (void)setLevel2:(id)a3
{
}

- (BICLevelCaching)level3
{
  return self->_level3;
}

- (void)setLevel3:(id)a3
{
}

- (BICLevelCaching)level4
{
  return self->_level4;
}

- (void)setLevel4:(id)a3
{
}

- (NSDictionary)cacheMetaData
{
  return self->_cacheMetaData;
}

- (void)setCacheMetaData:(id)a3
{
}

- (double)nextDiskPruneDate
{
  return self->_nextDiskPruneDate;
}

- (void)setNextDiskPruneDate:(double)a3
{
  self->_nextDiskPruneDate = a3;
}

- (double)nextRamPruneDate
{
  return self->_nextRamPruneDate;
}

- (void)setNextRamPruneDate:(double)a3
{
  self->_nextRamPruneDate = a3;
}

- (BOOL)debugLayout
{
  return self->_debugLayout;
}

- (void)setDebugLayout:(BOOL)a3
{
  self->_debugLayout = a3;
}

- (BOOL)clearCacheOnLaunch
{
  return self->_clearCacheOnLaunch;
}

- (void)setClearCacheOnLaunch:(BOOL)a3
{
  self->_clearCacheOnLaunch = a3;
}

- (BOOL)useRamBasedDB
{
  return self->_useRamBasedDB;
}

- (void)setUseRamBasedDB:(BOOL)a3
{
  self->_useRamBasedDB = a3;
}

- (BOOL)forceStats
{
  return self->_forceStats;
}

- (void)setForceStats:(BOOL)a3
{
  self->_forceStats = a3;
}

- (NSMutableArray)genericRequestsInProcess
{
  return self->_genericRequestsInProcess;
}

- (void)setGenericRequestsInProcess:(id)a3
{
}

- (NSMutableArray)cgInterests
{
  return self->_cgInterests;
}

- (void)setCgInterests:(id)a3
{
}

- (NSMutableDictionary)blankImages
{
  return self->_blankImages;
}

- (void)setBlankImages:(id)a3
{
}

- (NSMutableSet)versionBumpedIdentifiers
{
  return self->_versionBumpedIdentifiers;
}

- (void)setVersionBumpedIdentifiers:(id)a3
{
}

- (NSMutableSet)adamIDsToPreload
{
  return self->_adamIDsToPreload;
}

- (void)setAdamIDsToPreload:(id)a3
{
}

- (BICLevelCaching)level1
{
  return self->_level1;
}

- (void)setLevel1:(id)a3
{
}

- (BCCacheTransforming)transformController
{
  return self->_transformController;
}

- (void)setTransformController:(id)a3
{
}

- (BCStackManaging)stackManager
{
  return self->_stackManager;
}

- (void)setStackManager:(id)a3
{
}

- (BICImageSetPersisting)imageSetPersistence
{
  return self->_imageSetPersistence;
}

- (void)setImageSetPersistence:(id)a3
{
}

- (BCCacheProductProfileFetching)profileFetcher
{
  return self->_profileFetcher;
}

- (void)setProfileFetcher:(id)a3
{
}

- (BCURLSchemeHandling)protocolHandler
{
  return self->_protocolHandler;
}

- (void)setProtocolHandler:(id)a3
{
}

- (NSPointerArray)vendedImageInterests
{
  return self->_vendedImageInterests;
}

- (void)setVendedImageInterests:(id)a3
{
}

- (NSMutableArray)outstandingRequests
{
  return self->_outstandingRequests;
}

- (void)setOutstandingRequests:(id)a3
{
}

- (BICDescribedImageComparator)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comparator, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_vendedImageInterests, 0);
  objc_storeStrong((id *)&self->_protocolHandler, 0);
  objc_storeStrong((id *)&self->_profileFetcher, 0);
  objc_storeStrong((id *)&self->_imageSetPersistence, 0);
  objc_storeStrong((id *)&self->_stackManager, 0);
  objc_storeStrong((id *)&self->_transformController, 0);
  objc_storeStrong((id *)&self->_level1, 0);
  objc_storeStrong((id *)&self->_adamIDsToPreload, 0);
  objc_storeStrong((id *)&self->_versionBumpedIdentifiers, 0);
  objc_storeStrong((id *)&self->_blankImages, 0);
  objc_storeStrong((id *)&self->_cgInterests, 0);
  objc_storeStrong((id *)&self->_genericRequestsInProcess, 0);
  objc_storeStrong((id *)&self->_cacheMetaData, 0);
  objc_storeStrong((id *)&self->_level4, 0);
  objc_storeStrong((id *)&self->_level3, 0);
  objc_storeStrong((id *)&self->_level2, 0);
  objc_storeStrong((id *)&self->_coalescingPreloading, 0);
  objc_storeStrong((id *)&self->_coalescingPruning, 0);
  objc_storeStrong((id *)&self->_coalescingVersionBump, 0);
  objc_storeStrong((id *)&self->_seriesDecomposer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_highPriorityWorkQueue, 0);
  objc_storeStrong((id *)&self->_lowPriorityWorkQueue, 0);
  objc_storeStrong((id *)&self->_lowPriorityTarget, 0);
  objc_storeStrong((id *)&self->_highPriorityTarget, 0);
  objc_storeStrong((id *)&self->_workLowPriorityTarget, 0);
  objc_storeStrong((id *)&self->_workHighPriorityTarget, 0);

  objc_storeStrong((id *)&self->_workGenericsTarget, 0);
}

@end