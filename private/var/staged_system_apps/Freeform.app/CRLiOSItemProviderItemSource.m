@interface CRLiOSItemProviderItemSource
- (BOOL)canLoadItemsOfClass:(Class)a3;
- (BOOL)canProduceBoardItems;
- (BOOL)hasImportableBoardItemsDetectingImportableURLsInText:(BOOL)a3;
- (BOOL)hasImportableBoardItemsDetectingImportableURLsInText:(BOOL)a3 skipFileURLs:(BOOL)a4;
- (BOOL)hasImportableImages;
- (BOOL)hasImportableRichText;
- (BOOL)hasImportableText;
- (BOOL)hasNativeBoardItems;
- (BOOL)hasNativeBoardItemsContainingText;
- (BOOL)hasNativeFreehandDrawingBoardItems;
- (BOOL)hasNativeText;
- (BOOL)hasNativeTextStorages;
- (BOOL)hasNativeTypes;
- (BOOL)hasOnlyNativeFreehandDrawingBoardItems;
- (BOOL)hasOnlyNativeTextBoxItems;
- (BOOL)hasSingleNativeImageBoardItem;
- (BOOL)hasSingleNativeMovieBoardItem;
- (BOOL)hasTeamDataType:(id)a3;
- (BOOL)p_containsAnyUTIFromList:(id)a3;
- (BOOL)p_shouldKeepHighlights;
- (CRLiOSItemProviderItemSource)init;
- (CRLiOSItemProviderItemSource)initWithItemProviders:(id)a3;
- (Class)contentDescriptionTranslatorClass;
- (NSString)defaultTextFileName;
- (id)cancellationHandler;
- (id)loadImportedImagesForAssetOwner:(id)a3 compatibilityAlertPresenter:(id)a4 withHandler:(id)a5;
- (id)loadImportedRichTextStringWithHandler:(id)a3;
- (id)loadImportedTextStringWithHandler:(id)a3;
- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 WithLoadHandler:(id)a4;
- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 maximumStringLength:(unint64_t)a4 WithLoadHandler:(id)a5;
- (id)loadProvidersForNativeBoardItemsWithBoardItemFactory:(id)a3 loadHandler:(id)a4;
- (id)loadTextStorageUsingBoardItemFactory:(id)a3 forTargetContext:(id)a4 targetStorage:(id)a5 loadHandler:(id)a6;
- (id)p_progressWithChildren:(id)a3;
- (id)p_sourceMetadata;
- (id)p_unrecognizedTypeErrorForItemProvider:(id)a3;
- (id)richTextBoardItemProvidersFor:(id)a3 factory:(id)a4 uti:(id)a5 maximumCharacterLimit:(int64_t)a6 completion:(id)a7;
- (unint64_t)itemCount;
- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3;
- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3 skipFileURLs:(BOOL)a4;
- (void)setCancellationHandler:(id)a3;
@end

@implementation CRLiOSItemProviderItemSource

- (CRLiOSItemProviderItemSource)initWithItemProviders:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4800);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108F8C4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4820);
    }
    v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v5);
    }
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource initWithItemProviders:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:50 isFatal:0 description:"Should create item source with at least one item provider!"];
  }
  v41.receiver = self;
  v41.super_class = (Class)CRLiOSItemProviderItemSource;
  v8 = [(CRLiOSItemProviderItemSource *)&v41 init];
  if (v8)
  {
    v9 = (NSArray *)[v4 copy];
    itemProviders = v8->_itemProviders;
    v8->_itemProviders = v9;

    v11 = +[NSMutableOrderedSet orderedSet];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v12 = v8->_itemProviders;
    id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v38;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v37 + 1) + 8 * i) registeredTypeIdentifiers:v37];
          [v11 addObjectsFromArray:v17];
        }
        id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v14);
    }

    v18 = (NSOrderedSet *)[v11 copy];
    supportedUTIs = v8->_supportedUTIs;
    v8->_supportedUTIs = v18;

    v20 = objc_alloc_init(CRLOnce);
    oncePreferredImportableDataType = v8->_oncePreferredImportableDataType;
    v8->_oncePreferredImportableDataType = v20;

    v22 = objc_alloc_init(CRLOnce);
    onceHasImportableImages = v8->_onceHasImportableImages;
    v8->_onceHasImportableImages = v22;

    v24 = objc_alloc_init(CRLOnce);
    onceHasImportableDrawables = v8->_onceHasImportableDrawables;
    v8->_onceHasImportableDrawables = v24;

    v26 = objc_alloc_init(CRLOnce);
    onceHasImportableText = v8->_onceHasImportableText;
    v8->_onceHasImportableText = v26;

    v28 = objc_alloc_init(CRLOnce);
    onceHasImportableRichText = v8->_onceHasImportableRichText;
    v8->_onceHasImportableRichText = v28;

    v30 = objc_alloc_init(CRLOnce);
    onceHasNativeTypes = v8->_onceHasNativeTypes;
    v8->_onceHasNativeTypes = v30;

    v32 = objc_alloc_init(CRLOnce);
    onceSourceMetadata = v8->_onceSourceMetadata;
    v8->_onceSourceMetadata = v32;

    dispatch_queue_t v34 = dispatch_queue_create("com.apple.freeform.itemProviderItemSourceClassDictionary", 0);
    lockingQueueForClassDictionary = v8->_lockingQueueForClassDictionary;
    v8->_lockingQueueForClassDictionary = (OS_dispatch_queue *)v34;
  }
  return v8;
}

- (CRLiOSItemProviderItemSource)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E4840);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    id v14 = "-[CRLiOSItemProviderItemSource init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m";
    __int16 v17 = 1024;
    int v18 = 72;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E4860);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource init]");
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:72 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLiOSItemProviderItemSource init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (Class)contentDescriptionTranslatorClass
{
  return (Class)objc_opt_class();
}

- (BOOL)p_containsAnyUTIFromList:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_supportedUTIs;
  id v6 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "crl_conformsToAnyUTI:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [(NSOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (id)p_progressWithChildren:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init((Class)NSProgress);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v5);
          }
          long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v8 += (uint64_t)[v11 totalUnitCount];
          [v4 addChild:v11 withPendingUnitCount:[v11 totalUnitCount]];
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      uint64_t v8 = 0;
    }

    [v4 setTotalUnitCount:v8];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)p_unrecognizedTypeErrorForItemProvider:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"The data is not a recognized type." value:0 table:0];

  id v6 = [v3 suggestedName];
  id v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"The data “%@” couldn’t be inserted." value:0 table:0];
    long long v10 = [v3 suggestedName];
    uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);

    id v5 = (void *)v11;
  }
  v15[0] = NSLocalizedDescriptionKey;
  v15[1] = @"CRLBoardItemImporterErrorMediaTypeKey";
  v16[0] = v5;
  v16[1] = &off_10155D988;
  long long v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  long long v13 = +[NSError errorWithDomain:@"com.apple.freeform.CRLErrorDomainInfoImporter" code:103 userInfo:v12];

  return v13;
}

- (unint64_t)itemCount
{
  return [(NSArray *)self->_itemProviders count];
}

- (BOOL)canLoadItemsOfClass:(Class)a3
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if ([(objc_class *)a3 conformsToProtocol:&OBJC_PROTOCOL___NSItemProviderReading])
  {
    lockingQueueForClassDictionary = self->_lockingQueueForClassDictionary;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100240664;
    block[3] = &unk_1014E4888;
    block[4] = self;
    block[5] = &v9;
    block[6] = a3;
    dispatch_sync(lockingQueueForClassDictionary, block);
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3 skipFileURLs:(BOOL)a4
{
  oncePreferredImportableDataType = self->_oncePreferredImportableDataType;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002408AC;
  v7[3] = &unk_1014CBBB0;
  v7[4] = self;
  -[CRLOnce performBlockOnce:](oncePreferredImportableDataType, "performBlockOnce:", v7, a4);
  return self->_preferredImportableDataType;
}

- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3
{
  return [(CRLiOSItemProviderItemSource *)self preferredImportableDataTypeDetectingImportableURLsInText:a3 skipFileURLs:0];
}

- (BOOL)hasImportableImages
{
  onceHasImportableImages = self->_onceHasImportableImages;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100240AC8;
  v5[3] = &unk_1014CBBB0;
  v5[4] = self;
  [(CRLOnce *)onceHasImportableImages performBlockOnce:v5];
  return self->_hasImportableImages;
}

- (id)loadImportedImagesForAssetOwner:(id)a3 compatibilityAlertPresenter:(id)a4 withHandler:(id)a5
{
  id v48 = a3;
  id v47 = a4;
  id v41 = a5;
  v42 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_itemProviders count]];
  uint64_t v8 = +[CRLIngestionTypes supportedImageTypes];
  group = dispatch_group_create();
  v45 = +[NSMutableDictionary dictionary];
  v50 = +[NSMutableDictionary dictionary];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v43 = self;
  obj = self->_itemProviders;
  id v9 = [(NSArray *)obj countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0;
    uint64_t v49 = *(void *)v67;
    do
    {
      char v12 = 0;
      do
      {
        if (*(void *)v67 != v49) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v12);
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v14 = [v13 registeredTypeIdentifiers];
        id v15 = [v14 countByEnumeratingWithState:&v62 objects:v73 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v63;
          while (2)
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v63 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v62 + 1) + 8 * i);
              if (objc_msgSend(v19, "crl_conformsToAnyUTI:", v8))
              {
                dispatch_group_enter(group);
                v55[0] = _NSConcreteStackBlock;
                v55[1] = 3221225472;
                v55[2] = sub_1002412A8;
                v55[3] = &unk_1014E49A0;
                v55[4] = v19;
                id v56 = v48;
                id v57 = v47;
                id v58 = v45;
                uint64_t v61 = v11;
                id v59 = v50;
                v60 = group;
                v22 = [v13 loadDataRepresentationForTypeIdentifier:v19 completionHandler:v55];
                if (v22)
                {
                  [v42 addObject:v22];
                }
                else
                {
                  unsigned int v23 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E49C0);
                  }
                  v24 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67110146;
                    *(_DWORD *)v71 = v23;
                    *(_WORD *)&v71[4] = 2082;
                    *(void *)&v71[6] = "-[CRLiOSItemProviderItemSource loadImportedImagesForAssetOwner:compatibilityAle"
                                         "rtPresenter:withHandler:]";
                    *(_WORD *)&v71[14] = 2082;
                    *(void *)&v71[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m";
                    *(_WORD *)&v71[24] = 1024;
                    *(_DWORD *)&v71[26] = 230;
                    LOWORD(v72[0]) = 2112;
                    *(void *)((char *)v72 + 2) = v19;
                    _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d No progress provided for UTI %@", buf, 0x2Cu);
                  }
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E49E0);
                  }
                  v25 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                  {
                    v33 = v25;
                    dispatch_queue_t v34 = +[CRLAssertionHandler packedBacktraceString];
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v71 = v23;
                    *(_WORD *)&v71[4] = 2114;
                    *(void *)&v71[6] = v34;
                    _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                  }
                  v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadImportedImagesForAssetOwner:compatibilityAlertPresenter:withHandler:]");
                  v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"];
                  +[CRLAssertionHandler handleFailureInFunction:v26, v27, 230, 0, "No progress provided for UTI %@", v19 file lineNumber isFatal description];
                }
                goto LABEL_31;
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v62 objects:v73 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }

        long long v14 = [(CRLiOSItemProviderItemSource *)v43 p_unrecognizedTypeErrorForItemProvider:v13];
        if (qword_101719A68 != -1) {
          dispatch_once(&qword_101719A68, &stru_1014E4A00);
        }
        v20 = off_10166B498;
        if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR))
        {
          v28 = v20;
          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          v31 = [v14 domain];
          id v32 = [v14 code];
          *(_DWORD *)buf = 138544130;
          *(void *)v71 = v30;
          *(_WORD *)&v71[8] = 2114;
          *(void *)&v71[10] = v31;
          *(_WORD *)&v71[18] = 2048;
          *(void *)&v71[20] = v32;
          *(_WORD *)&v71[28] = 2112;
          v72[0] = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Error loading image data. Error: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x2Au);
        }
        v21 = +[NSNumber numberWithUnsignedInteger:v11];
        [v50 setObject:v14 forKey:v21];

LABEL_31:
        ++v11;
        char v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v10 = [(NSArray *)obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    }
    while (v10);
  }

  v35 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100241A98;
  block[3] = &unk_1014D3990;
  id v52 = v45;
  id v53 = v50;
  id v54 = v41;
  id v36 = v41;
  id v37 = v50;
  id v38 = v45;
  dispatch_group_notify(group, v35, block);

  long long v39 = [(CRLiOSItemProviderItemSource *)v43 p_progressWithChildren:v42];

  return v39;
}

- (BOOL)hasImportableBoardItemsDetectingImportableURLsInText:(BOOL)a3 skipFileURLs:(BOOL)a4
{
  onceHasImportableDrawables = self->_onceHasImportableDrawables;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100241D74;
  v7[3] = &unk_1014CBBB0;
  v7[4] = self;
  -[CRLOnce performBlockOnce:](onceHasImportableDrawables, "performBlockOnce:", v7, a4);
  return self->_hasImportableDrawables;
}

- (BOOL)hasImportableBoardItemsDetectingImportableURLsInText:(BOOL)a3
{
  return [(CRLiOSItemProviderItemSource *)self hasImportableBoardItemsDetectingImportableURLsInText:a3 skipFileURLs:0];
}

- (BOOL)hasImportableText
{
  onceHasImportableText = self->_onceHasImportableText;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100241F14;
  v5[3] = &unk_1014CBBB0;
  v5[4] = self;
  [(CRLOnce *)onceHasImportableText performBlockOnce:v5];
  return self->_hasImportableText;
}

- (BOOL)hasImportableRichText
{
  onceHasImportableRichText = self->_onceHasImportableRichText;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002420AC;
  v5[3] = &unk_1014CBBB0;
  v5[4] = self;
  [(CRLOnce *)onceHasImportableRichText performBlockOnce:v5];
  return self->_hasImportableRichText;
}

- (id)loadImportedRichTextStringWithHandler:(id)a3
{
  id v4 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v5 = self->_itemProviders;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v37;
    v26 = v5;
    v27 = v4;
    uint64_t v24 = *(void *)v37;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v9);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v25 = v10;
        uint64_t v11 = [v10 registeredTypeIdentifiers];
        id v12 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v33;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v33 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              uint64_t v17 = +[CRLIngestionTypes supportedRichTextTypes];
              unsigned int v18 = [v16 crl_conformsToAnyUTI:v17];

              if (v18)
              {
                v20 = [UTTypeRTFD identifier];
                unsigned int v21 = [v16 isEqualToString:v20];

                if (v21)
                {
                  v30[0] = _NSConcreteStackBlock;
                  v30[1] = 3221225472;
                  v30[2] = sub_100242430;
                  v30[3] = &unk_1014E4A88;
                  id v4 = v27;
                  id v31 = v27;
                  v19 = [v25 loadFileRepresentationForTypeIdentifier:v16 completionHandler:v30];
                  v22 = v31;
                }
                else
                {
                  v28[0] = _NSConcreteStackBlock;
                  v28[1] = 3221225472;
                  v28[2] = sub_1002427E8;
                  v28[3] = &unk_1014E4B10;
                  v28[4] = v16;
                  id v4 = v27;
                  id v29 = v27;
                  v19 = [v25 loadDataRepresentationForTypeIdentifier:v16 completionHandler:v28];
                  v22 = v29;
                }

                id v5 = v26;
                goto LABEL_22;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        id v9 = (char *)v9 + 1;
        id v5 = v26;
        id v4 = v27;
        uint64_t v8 = v24;
      }
      while (v9 != v7);
      id v7 = [(NSArray *)v26 countByEnumeratingWithState:&v36 objects:v41 count:16];
      v19 = 0;
    }
    while (v7);
  }
  else
  {
    v19 = 0;
  }
LABEL_22:

  return v19;
}

- (id)loadImportedTextStringWithHandler:(id)a3
{
  id v18 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_itemProviders;
  id v4 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = [v8 registeredTypeIdentifiers];
        id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v22;
LABEL_8:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
            if (+[CRLIngestionTypes isValidPlainTextUTI:v14]) {
              break;
            }
            if (v11 == (id)++v13)
            {
              id v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v11) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_100242D80;
          v19[3] = &unk_1014E4B10;
          v19[4] = v14;
          id v20 = v18;
          id v15 = [v8 loadDataRepresentationForTypeIdentifier:v14 completionHandler:v19];

          if (v15) {
            goto LABEL_19;
          }
        }
        else
        {
LABEL_14:
        }
      }
      id v5 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }
  id v15 = 0;
LABEL_19:

  return v15;
}

- (id)p_sourceMetadata
{
  onceSourceMetadata = self->_onceSourceMetadata;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002431A8;
  v5[3] = &unk_1014CBBB0;
  v5[4] = self;
  [(CRLOnce *)onceSourceMetadata performBlockOnce:v5];
  return self->_sourceMetadata;
}

- (BOOL)hasNativeTypes
{
  onceHasNativeTypes = self->_onceHasNativeTypes;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100243460;
  v5[3] = &unk_1014CBBB0;
  v5[4] = self;
  [(CRLOnce *)onceHasNativeTypes performBlockOnce:v5];
  return self->_hasNativeTypes;
}

- (BOOL)hasNativeBoardItems
{
  unsigned int v2 = [(CRLiOSItemProviderItemSource *)self p_sourceMetadata];
  unsigned __int8 v3 = [v2 containsObject:@"com.apple.freeform.pasteboardState.hasNativeBoardItems"];

  return v3;
}

- (BOOL)canProduceBoardItems
{
  if ([(CRLiOSItemProviderItemSource *)self hasNativeBoardItems]
    || [(CRLiOSItemProviderItemSource *)self hasNativeTextStorages]
    || [(CRLiOSItemProviderItemSource *)self hasImportableRichText]
    || [(CRLiOSItemProviderItemSource *)self hasImportableText])
  {
    return 1;
  }

  return [(CRLiOSItemProviderItemSource *)self hasImportableBoardItemsDetectingImportableURLsInText:1];
}

- (BOOL)hasSingleNativeImageBoardItem
{
  return [(CRLiOSItemProviderItemSource *)self hasTeamDataType:@"com.apple.freeform.pasteboardState.hasSingleNativeImageBoardItem"];
}

- (BOOL)hasSingleNativeMovieBoardItem
{
  return [(CRLiOSItemProviderItemSource *)self hasTeamDataType:@"com.apple.freeform.pasteboardState.hasSingleNativeMovieBoardItem"];
}

- (BOOL)hasOnlyNativeFreehandDrawingBoardItems
{
  return [(CRLiOSItemProviderItemSource *)self hasTeamDataType:@"com.apple.freeform.pasteboardState.hasOnlyFreehandDrawingBoardItems"];
}

- (BOOL)hasNativeFreehandDrawingBoardItems
{
  return [(CRLiOSItemProviderItemSource *)self hasTeamDataType:@"com.apple.freeform.pasteboardState.hasFreehandDrawingBoardItems"];
}

- (BOOL)hasOnlyNativeTextBoxItems
{
  return [(CRLiOSItemProviderItemSource *)self hasTeamDataType:@"com.apple.freeform.pasteboardState.hasOnlyNativeTextBoxItems"];
}

- (BOOL)hasNativeTextStorages
{
  return [(CRLiOSItemProviderItemSource *)self hasTeamDataType:@"com.apple.freeform.pasteboardState.hasTextStoragesAttachmentsNotAllowed"];
}

- (BOOL)hasNativeText
{
  return [(CRLiOSItemProviderItemSource *)self hasTeamDataType:@"com.apple.freeform.pasteboardState.hasNativeText"];
}

- (BOOL)hasNativeBoardItemsContainingText
{
  return [(CRLiOSItemProviderItemSource *)self hasTeamDataType:@"com.apple.freeform.pasteboardState.hasNativeBoardItemsContainingText"];
}

- (BOOL)p_shouldKeepHighlights
{
  return 1;
}

- (id)loadProvidersForNativeBoardItemsWithBoardItemFactory:(id)a3 loadHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((id)[(NSArray *)self->_itemProviders count] != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4BD0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101090194();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4BF0);
    }
    uint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadProvidersForNativeBoardItemsWithBoardItemFactory:loadHandler:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:519 isFatal:0 description:"Unexpected number of item providers!"];
  }
  id v11 = [_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant alloc];
  uint64_t v12 = [v6 store];
  uint64_t v13 = [v6 store];
  uint64_t v14 = [v13 crdtContext];
  id v15 = [(CRLPasteboardObjectItemProviderReadAssistant *)v11 initWithStore:v12 context:v14];

  id v16 = [(NSArray *)self->_itemProviders firstObject];
  long long v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  long long v26 = sub_100243A8C;
  long long v27 = &unk_1014E4C78;
  long long v28 = self;
  id v17 = v6;
  id v29 = v17;
  id v18 = v7;
  id v30 = v18;
  v19 = [(CRLPasteboardObjectItemProviderReadAssistant *)v15 readPasteboardObjectFrom:v16 completion:&v24];

  if (!v19)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4C98);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010900FC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4CB8);
    }
    id v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v20);
    }
    long long v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadProvidersForNativeBoardItemsWithBoardItemFactory:loadHandler:]");
    long long v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 546, 0, "invalid nil value for '%{public}s'", "progress", v24, v25, v26, v27, v28, v29);
  }

  return v19;
}

- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 maximumStringLength:(unint64_t)a4 WithLoadHandler:(id)a5
{
  id v66 = a3;
  id v63 = a5;
  v77 = self;
  long long v68 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_itemProviders count]];
  long long v67 = dispatch_group_create();
  v128[0] = 0;
  v128[1] = v128;
  v128[2] = 0x3032000000;
  v128[3] = sub_100244DBC;
  v128[4] = sub_100244DCC;
  id v129 = +[NSMutableArray array];
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  obj = self->_itemProviders;
  id v7 = [(NSArray *)obj countByEnumeratingWithState:&v124 objects:v134 count:16];
  if (v7)
  {
    uint64_t v65 = *(void *)v125;
    do
    {
      uint64_t v8 = 0;
      id v69 = v7;
      do
      {
        if (*(void *)v125 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v70 = v8;
        id v9 = *(void **)(*((void *)&v124 + 1) + 8 * v8);
        uint64_t v120 = 0;
        v121 = &v120;
        uint64_t v122 = 0x2020000000;
        char v123 = 0;
        uint64_t v116 = 0;
        v117 = &v116;
        uint64_t v118 = 0x2020000000;
        char v119 = 0;
        v107[0] = _NSConcreteStackBlock;
        v107[1] = 3221225472;
        v107[2] = sub_100244DD4;
        v107[3] = &unk_1014E4DE8;
        v113 = &v120;
        id v10 = v67;
        v108 = v10;
        v79 = v9;
        v109 = v9;
        v114 = v128;
        unint64_t v115 = a4;
        id v76 = v66;
        id v110 = v76;
        v111 = v77;
        id v11 = v68;
        id v112 = v11;
        v78 = objc_retainBlock(v107);
        v101[0] = _NSConcreteStackBlock;
        v101[1] = 3221225472;
        v101[2] = sub_100245720;
        v101[3] = &unk_1014E4F18;
        v105 = &v120;
        dispatch_group_t group = v10;
        dispatch_group_t v102 = group;
        v103 = v9;
        v106 = v128;
        id v72 = v11;
        id v104 = v72;
        v71 = objc_retainBlock(v101);
        long long v99 = 0u;
        long long v100 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        uint64_t v12 = [v9 registeredTypeIdentifiers];
        id v13 = [v12 countByEnumeratingWithState:&v97 objects:v133 count:16];
        if (!v13)
        {
LABEL_57:

          int v52 = *((unsigned __int8 *)v121 + 24);
          goto LABEL_58;
        }
        char v14 = 0;
        char v73 = 0;
        uint64_t v80 = *(void *)v98;
        do
        {
          id v15 = 0;
          do
          {
            if (*(void *)v98 != v80) {
              objc_enumerationMutation(v12);
            }
            id v16 = *(void **)(*((void *)&v97 + 1) + 8 * (void)v15);
            id v17 = sub_100030728();
            id v18 = [v17 identifier];
            unsigned __int8 v19 = [v16 isEqualToString:v18];

            v14 |= v19;
            if (+[CRLIngestionTypes isValidPlainTextUTI:v16])
            {
              if ([v16 isEqualToString:@"public.file-url"])
              {
                uint64_t v20 = [v79 registeredTypeIdentifiers];
                long long v21 = +[NSSet setWithArray:v20];

                long long v22 = +[CRLIngestionTypes highEfficiencyImageTypes];
                long long v23 = +[NSSet setWithArray:v22];
                LOBYTE(v20) = [v21 intersectsSet:v23];

                if (v20) {
                  goto LABEL_39;
                }
              }
              long long v24 = [UTTypeURL identifier];
              unsigned int v25 = [v16 isEqualToString:v24];

              if (v25)
              {
                char v73 = 1;
                if (v14) {
                  goto LABEL_55;
                }
                char v14 = 0;
              }
              else
              {
                ((void (*)(void *, void *))v78[2])(v78, v16);
              }
            }
            else
            {
              long long v26 = +[CRLIngestionTypes supportedRichTextTypes];
              unsigned int v27 = [v16 crl_conformsToAnyUTI:v26];

              if (v27)
              {
                *((unsigned char *)v121 + 24) = 1;
                dispatch_group_enter(group);
                v94[0] = _NSConcreteStackBlock;
                v94[1] = 3221225472;
                v94[2] = sub_100245EF8;
                v94[3] = &unk_1014E4F40;
                v96 = v128;
                v95 = group;
                long long v28 = [(CRLiOSItemProviderItemSource *)v77 richTextBoardItemProvidersFor:v79 factory:v76 uti:v16 maximumCharacterLimit:a4 completion:v94];
                if (v28)
                {
                  [v72 addObject:v28];
                }
                else
                {
                  unsigned int v37 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E4F60);
                  }
                  long long v38 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67110146;
                    *(_DWORD *)v131 = v37;
                    *(_WORD *)&v131[4] = 2082;
                    *(void *)&v131[6] = "-[CRLiOSItemProviderItemSource loadProvidersForImportedBoardItemsUsingBoardIte"
                                          "mFactory:maximumStringLength:WithLoadHandler:]";
                    *(_WORD *)&v131[14] = 2082;
                    *(void *)&v131[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m";
                    *(_WORD *)&v131[24] = 1024;
                    *(_DWORD *)&v131[26] = 683;
                    LOWORD(v132[0]) = 2112;
                    *(void *)((char *)v132 + 2) = v16;
                    _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d No progress provided for UTI %@", buf, 0x2Cu);
                  }
                  if (qword_101719A70 != -1) {
                    dispatch_once(&qword_101719A70, &stru_1014E4F80);
                  }
                  long long v39 = off_10166B4A0;
                  if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v49 = +[CRLAssertionHandler packedBacktraceString];
                    *(_DWORD *)buf = 67109378;
                    *(_DWORD *)v131 = v37;
                    *(_WORD *)&v131[4] = 2114;
                    *(void *)&v131[6] = v49;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v39, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                  }
                  long long v40 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadProvidersForImportedBoardItemsUsingBoardItemFactory:maximumStringLength:WithLoadHandler:]");
                  id v41 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"];
                  +[CRLAssertionHandler handleFailureInFunction:v40, v41, 683, 0, "No progress provided for UTI %@", v16 file lineNumber isFatal description];
                }
              }
              else
              {
                id v29 = sub_100032520();
                id v30 = [v29 identifier];
                int v31 = [v16 isEqualToString:v30];

                if (v31)
                {
                  char v14 = 1;
                }
                else if (+[CRLInfoImporterBoardItemProvider canInitWithType:v16])
                {
                  long long v32 = [UTTypeVCard identifier];
                  if ([v16 isEqualToString:v32])
                  {
                    long long v33 = [v79 registeredTypeIdentifiers];
                    long long v34 = sub_100032520();
                    long long v35 = [v34 identifier];
                    unsigned __int8 v36 = [v33 containsObject:v35];

                    if (v36) {
                      goto LABEL_39;
                    }
                  }
                  else
                  {
                  }
                  *((unsigned char *)v121 + 24) = 1;
                  dispatch_group_enter(group);
                  v89[0] = _NSConcreteStackBlock;
                  v89[1] = 3221225472;
                  v89[2] = sub_100245FC8;
                  v89[3] = &unk_1014E4FC8;
                  v92 = &v116;
                  v89[4] = v16;
                  id v90 = v76;
                  v93 = v128;
                  v42 = group;
                  v91 = v42;
                  v43 = [v79 loadFileRepresentationForTypeIdentifier:v16 completionHandler:v89];
                  v84[0] = _NSConcreteStackBlock;
                  v84[1] = 3221225472;
                  v84[2] = sub_100246104;
                  v84[3] = &unk_1014E4FF0;
                  v87 = &v120;
                  v88 = &v116;
                  v85 = v42;
                  v86 = v77;
                  [v43 setCancellationHandler:v84];
                  if (v43)
                  {
                    [v72 addObject:v43];
                  }
                  else
                  {
                    unsigned int v44 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                    if (qword_101719A70 != -1) {
                      dispatch_once(&qword_101719A70, &stru_1014E5010);
                    }
                    v45 = off_10166B4A0;
                    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67110146;
                      *(_DWORD *)v131 = v44;
                      *(_WORD *)&v131[4] = 2082;
                      *(void *)&v131[6] = "-[CRLiOSItemProviderItemSource loadProvidersForImportedBoardItemsUsingBoardI"
                                            "temFactory:maximumStringLength:WithLoadHandler:]";
                      *(_WORD *)&v131[14] = 2082;
                      *(void *)&v131[16] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProv"
                                             "iderItemSource.m";
                      *(_WORD *)&v131[24] = 1024;
                      *(_DWORD *)&v131[26] = 720;
                      LOWORD(v132[0]) = 2112;
                      *(void *)((char *)v132 + 2) = v16;
                      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d No progress provided for UTI %@", buf, 0x2Cu);
                    }
                    if (qword_101719A70 != -1) {
                      dispatch_once(&qword_101719A70, &stru_1014E5030);
                    }
                    v46 = off_10166B4A0;
                    if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
                    {
                      v50 = +[CRLAssertionHandler packedBacktraceString];
                      *(_DWORD *)buf = 67109378;
                      *(_DWORD *)v131 = v44;
                      *(_WORD *)&v131[4] = 2114;
                      *(void *)&v131[6] = v50;
                      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v46, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                    }
                    id v47 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadProvidersForImportedBoardItemsUsingBoardItemFactory:maximumStringLength:WithLoadHandler:]");
                    id v48 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"];
                    +[CRLAssertionHandler handleFailureInFunction:v47, v48, 720, 0, "No progress provided for UTI %@", v16 file lineNumber isFatal description];
                  }
                }
              }
            }
            if (*((unsigned char *)v121 + 24) || *((unsigned char *)v117 + 24)) {
              goto LABEL_55;
            }
LABEL_39:
            id v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v51 = [v12 countByEnumeratingWithState:&v97 objects:v133 count:16];
          id v13 = v51;
        }
        while (v51);
LABEL_55:

        int v52 = *((unsigned __int8 *)v121 + 24);
        if (((*((unsigned char *)v121 + 24) == 0) & v73) == 1)
        {
          uint64_t v12 = [UTTypeURL identifier];
          ((void (*)(void *, void *))v71[2])(v71, v12);
          goto LABEL_57;
        }
LABEL_58:
        if (!v52 && !*((unsigned char *)v117 + 24))
        {
          id v53 = [(CRLiOSItemProviderItemSource *)v77 p_unrecognizedTypeErrorForItemProvider:v79];
          if (qword_101719A68 != -1) {
            dispatch_once(&qword_101719A68, &stru_1014E5050);
          }
          id v54 = off_10166B498;
          if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_ERROR))
          {
            v55 = (objc_class *)objc_opt_class();
            NSStringFromClass(v55);
            id v56 = (id)objc_claimAutoreleasedReturnValue();
            id v57 = [v53 domain];
            id v58 = [v53 code];
            *(_DWORD *)buf = 138544130;
            *(void *)v131 = v56;
            *(_WORD *)&v131[8] = 2114;
            *(void *)&v131[10] = v57;
            *(_WORD *)&v131[18] = 2048;
            *(void *)&v131[20] = v58;
            *(_WORD *)&v131[28] = 2112;
            v132[0] = v53;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v54, OS_LOG_TYPE_ERROR, "Error loading importable data. Error: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x2Au);
          }
        }

        _Block_object_dispose(&v116, 8);
        _Block_object_dispose(&v120, 8);
        uint64_t v8 = v70 + 1;
      }
      while ((id)(v70 + 1) != v69);
      id v7 = [(NSArray *)obj countByEnumeratingWithState:&v124 objects:v134 count:16];
    }
    while (v7);
  }

  id v59 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100246274;
  block[3] = &unk_1014D8148;
  id v60 = v63;
  id v82 = v60;
  v83 = v128;
  dispatch_group_notify(v67, v59, block);

  uint64_t v61 = [(CRLiOSItemProviderItemSource *)v77 p_progressWithChildren:v68];

  _Block_object_dispose(v128, 8);

  return v61;
}

- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 WithLoadHandler:(id)a4
{
  return [(CRLiOSItemProviderItemSource *)self loadProvidersForImportedBoardItemsUsingBoardItemFactory:a3 maximumStringLength:25600 WithLoadHandler:a4];
}

- (id)loadTextStorageUsingBoardItemFactory:(id)a3 forTargetContext:(id)a4 targetStorage:(id)a5 loadHandler:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  itemProviders = self->_itemProviders;
  id v12 = a4;
  if ((id)[(NSArray *)itemProviders count] != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5070);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101090980();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5090);
    }
    id v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    char v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSItemProviderItemSource loadTextStorageUsingBoardItemFactory:forTargetContext:targetStorage:loadHandler:]");
    id v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSItemProviderItemSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:752 isFatal:0 description:"Unexpected number of item providers!"];
  }
  id v16 = [(NSArray *)self->_itemProviders firstObject];
  id v17 = [_TtC8Freeform44CRLPasteboardObjectItemProviderReadAssistant alloc];
  id v18 = [v12 sourceStore];
  unsigned __int8 v19 = [v12 sourceStore];

  uint64_t v20 = [v19 crdtContext];
  long long v21 = [(CRLPasteboardObjectItemProviderReadAssistant *)v17 initWithStore:v18 context:v20];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100246614;
  v26[3] = &unk_1014E50D8;
  id v27 = v9;
  id v28 = v10;
  id v22 = v10;
  id v23 = v9;
  long long v24 = [(CRLPasteboardObjectItemProviderReadAssistant *)v21 readPasteboardObjectFrom:v16 completion:v26];

  return v24;
}

- (BOOL)hasTeamDataType:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(CRLiOSItemProviderItemSource *)self p_sourceMetadata];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v9 isEqualToString:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_12;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v6;
}

- (id)cancellationHandler
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setCancellationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_classCanBeLoadedCache, 0);
  objc_storeStrong((id *)&self->_lockingQueueForClassDictionary, 0);
  objc_storeStrong((id *)&self->_sourceMetadata, 0);
  objc_storeStrong((id *)&self->_onceSourceMetadata, 0);
  objc_storeStrong((id *)&self->_onceHasNativeTypes, 0);
  objc_storeStrong((id *)&self->_onceHasImportableRichText, 0);
  objc_storeStrong((id *)&self->_onceHasImportableText, 0);
  objc_storeStrong((id *)&self->_onceHasImportableDrawables, 0);
  objc_storeStrong((id *)&self->_onceHasImportableImages, 0);
  objc_storeStrong((id *)&self->_oncePreferredImportableDataType, 0);
  objc_storeStrong((id *)&self->_supportedUTIs, 0);

  objc_storeStrong((id *)&self->_itemProviders, 0);
}

- (NSString)defaultTextFileName
{
  unsigned __int8 v3 = self;
  id v4 = self;
  id v5 = [v3 mainBundle];
  NSString v6 = String._bridgeToObjectiveC()();
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v5 localizedStringForKey:v6 value:v7 table:0];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (id)richTextBoardItemProvidersFor:(id)a3 factory:(id)a4 uti:(id)a5 maximumCharacterLimit:(int64_t)a6 completion:(id)a7
{
  long long v11 = _Block_copy(a7);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  _Block_copy(v11);
  id v15 = a3;
  id v16 = a4;
  id v17 = self;
  id v18 = (void *)sub_1005F9BC0((uint64_t)v15, (uint64_t)v16, v12, v14, a6, (uint64_t)v17, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_bridgeObjectRelease();

  return v18;
}

@end