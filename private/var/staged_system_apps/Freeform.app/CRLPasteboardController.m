@interface CRLPasteboardController
+ (BOOL)p_isURLTypeExcludingFileURL:(id)a3;
+ (BOOL)p_pasteboardHasPlainAndRichHyperlink:(id)a3;
+ (NSURL)pasteboardCacheDirectory;
+ (id)additionalBoardItemsForCopyImaging:(id)a3 icc:(id)a4 invertedObjectUUIDMap:(id)a5;
+ (id)boardItemsForCopyByFixingUpBoardItems:(id)a3 boardItemFactory:(id)a4 board:(id)a5;
+ (id)descriptionsForBoardItemsOnPasteboardObject:(id)a3;
+ (id)detectedImportableURLForPasteboardString:(id)a3 canTrimWhitespace:(BOOL)a4;
+ (id)pFilteredPasteboardTypesForPasteboard:(id)a3 types:(id)a4;
+ (id)p_boardItemsForCopyByFixingUpBoardItems:(id)a3 boardItemFactory:(id)a4 board:(id)a5 UUIDRemappingBlock:(id)a6;
+ (id)p_cacheDirectoryName;
+ (id)p_movePublicURLBeforePlainTextIfNeededInTypes:(id)a3;
+ (id)promisedUTIsForPasteboard:(id)a3;
+ (id)providersForBoardItemsAndTextWithBoardItemFactory:(id)a3 keepHighlights:(BOOL)a4 fromPasteboardObject:(id)a5 descriptionsForBoardItems:(id)a6 validGeometries:(BOOL *)a7;
+ (id)readPasteboardBoardItemsForTargetStorage:(id)a3 fromPasteboardObject:(id)a4 descriptionsForBoardItems:(id)a5;
+ (void)cacheWithBoardItems:(id)a3;
+ (void)clearPasteboardCacheDirectory;
- (BOOL)canProduceBoardItemsFromPasteboard:(id)a3;
- (BOOL)containsStylesRelevantTo:(id)a3 on:(id)a4;
- (BOOL)hasImportableBoardItemsOnPasteboard:(id)a3 detectImportableURLsInText:(BOOL)a4 skipFileURLs:(BOOL)a5;
- (BOOL)hasImportableImagesOnPasteboard:(id)a3 skipFileURLs:(BOOL)a4;
- (BOOL)hasImportablePlainTextOnPasteboard:(id)a3;
- (BOOL)hasImportableRichTextOnPasteboard:(id)a3;
- (BOOL)hasNativeBoardItemsContainingTextOnPasteboard:(id)a3;
- (BOOL)hasNativeBoardItemsOnPasteboard:(id)a3;
- (BOOL)hasNativeFreehandDrawingBoardItemsOnPasteboard:(id)a3;
- (BOOL)hasNativeTextOnPasteboard:(id)a3;
- (BOOL)hasNativeTypesOnPasteboard:(id)a3;
- (BOOL)hasOnlyNativeFreehandDrawingBoardItemsOnPasteboard:(id)a3;
- (BOOL)hasOnlyNativeTextBoxBoardItemsOnPasteboard:(id)a3;
- (BOOL)hasOnlyNativeTextBoxItemsOnPasteboard:(id)a3;
- (BOOL)hasSingleNativeImageBoardItemOnPasteboard:(id)a3;
- (BOOL)hasSingleNativeMovieBoardItemOnPasteboard:(id)a3;
- (BOOL)hasTextStoragesOnPasteboard:(id)a3;
- (BOOL)pImageForBoardItems:(id)a3 imageData:(id *)a4 dataType:(id *)a5 dataName:(id *)a6;
- (BOOL)p_shouldKeepHighlights;
- (CRLPasteboardController)init;
- (CRLPasteboardController)initWithDelegate:(id)a3;
- (CRLPasteboardControllerDelegate)delegate;
- (id)asyncProvidersForBoardItemsFromPasteboard:(id)a3;
- (id)commandsToPasteStyleTo:(id)a3 from:(id)a4;
- (id)commandsToPasteTextStyleTo:(id)a3 in:(_NSRange)a4 from:(id)a5;
- (id)descriptionForPasteboard:(id)a3;
- (id)descriptionsForBoardItemsOnPasteboard:(id)a3;
- (id)importedRichTextStringFromPasteboard:(id)a3 smartPaste:(BOOL *)a4;
- (id)importedTextStringFromPasteboard:(id)a3 smartPaste:(BOOL *)a4;
- (id)ingestibleItemSourceForPasteboard:(id)a3;
- (id)newCopyAssistantWithPasteboard:(id)a3;
- (id)newDragAssistant;
- (id)newReadAssistantWithPasteboard:(id)a3;
- (id)p_board;
- (id)p_boardItemFactory;
- (id)p_detectedImportableURLOnPasteboard:(id)a3 type:(id)a4 fallbackBoardItemProvider:(id *)a5;
- (id)p_importableFileURLFromPasteboard:(id)a3 itemIndex:(unint64_t)a4 itemType:(id)a5;
- (id)p_importableURLFromPasteboard:(id)a3 itemIndex:(unint64_t)a4 itemType:(id)a5;
- (id)p_newImportableBoardItemProviderFromPasteboard:(id)a3 itemIndex:(unint64_t)a4 itemType:(id)a5;
- (id)p_providersForBoardItemsAndTextFromPasteboardReadAssistant:(id)a3 pasteboard:(id)a4 validGeometries:(BOOL *)a5;
- (id)pasteboardObjectFromAssistant:(id)a3 boardItems:(id)a4;
- (id)pasteboardObjectFromAssistant:(id)a3 textStorage:(id)a4 smartCopy:(BOOL)a5;
- (id)pasteboardPromise:(id)a3 propertyListForType:(id)a4;
- (id)providersForBoardItemsForTargetStorage:(id)a3 fromPasteboard:(id)a4;
- (id)providersForBoardItemsFromImportedRichTextFromPasteboard:(id)a3;
- (id)providersForBoardItemsFromImportedRichTextFromPasteboard:(id)a3 maximumStringLength:(unint64_t)a4;
- (id)providersForBoardItemsFromImportedTextFromPasteboard:(id)a3;
- (id)providersForBoardItemsFromImportedTextFromPasteboard:(id)a3 maximumStringLength:(unint64_t)a4;
- (id)providersForBoardItemsFromPasteboard:(id)a3;
- (id)providersForBoardItemsImportedFromPasteboard:(id)a3;
- (id)providersForNativeBoardItemsAndTextFromPasteboard:(id)a3 validGeometries:(BOOL *)a4;
- (id)providersForNativeBoardItemsFromPasteboard:(id)a3;
- (id)publicTypesForBoardItems:(id)a3 asPDF:(BOOL)a4;
- (id)textStorageFromPasteboard:(id)a3 forTargetStorage:(id)a4 smartPaste:(BOOL *)a5;
- (int64_t)p_integerFromPasteboardStateTypePrefix:(id)a3 pasteboard:(id)a4;
- (unint64_t)boardItemStyleKindsOnPasteboard:(id)a3;
- (unint64_t)preferredImportableDataTypeOnPasteboard:(id)a3 detectImportableURLsInText:(BOOL)a4;
- (unint64_t)preferredImportableDataTypeOnPasteboard:(id)a3 detectImportableURLsInText:(BOOL)a4 skipFileURLs:(BOOL)a5;
- (void)copyBoardItems:(id)a3 toPasteboard:(id)a4 asPDF:(BOOL)a5 writeAssistant:(id)a6 nativeOnly:(BOOL)a7 icc:(id)a8;
- (void)copyStyleFromItem:(id)a3 to:(id)a4;
- (void)copyTextStorage:(id)a3 selection:(id)a4 toPasteboard:(id)a5 smartCopy:(BOOL)a6 writeAssistant:(id)a7 nativeOnly:(BOOL)a8;
- (void)copyUninsertedFreehandDrawingItems:(id)a3 toPasteboard:(id)a4;
- (void)distillPasteboardContentDescription:(id)a3 intoPasteboardStateTypes:(id)a4;
- (void)pImageInfosWithReadLock:(id *)a3;
@end

@implementation CRLPasteboardController

- (CRLPasteboardController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLPasteboardController;
  v5 = [(CRLPasteboardController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (CRLPasteboardController)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D5280);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLPasteboardController init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m";
    __int16 v17 = 1024;
    int v18 = 87;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D52A0);
  }
  id v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v12 = v2;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController init]");
  objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:87 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLPasteboardController init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)p_board
{
  v3 = [(CRLPasteboardController *)self delegate];
  id v4 = [v3 boardForPasteboardController:self];

  return v4;
}

- (id)p_boardItemFactory
{
  v3 = [(CRLPasteboardController *)self delegate];
  id v4 = [v3 boardItemFactoryForPasteboardController:self];

  return v4;
}

+ (id)p_cacheDirectoryName
{
  return @"copy";
}

+ (NSURL)pasteboardCacheDirectory
{
  unsigned int v2 = +[NSFileManager defaultManager];
  id v17 = 0;
  v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v17];
  id v4 = v17;

  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5300);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107801C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5320);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v6);
    }
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController pasteboardCacheDirectory]");
    objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v7, v8, 116, 0, "Unable to create cache directory: %@", v4 file lineNumber isFatal description];
    id v10 = v3;
    goto LABEL_26;
  }
  v9 = [objc_opt_class() p_cacheDirectoryName];
  id v10 = [v3 URLByAppendingPathComponent:v9];

  v11 = +[NSFileManager defaultManager];
  unsigned __int8 v12 = [v11 crl_directoryExistsAt:v10];

  if ((v12 & 1) == 0)
  {
    __int16 v13 = +[NSFileManager defaultManager];
    id v16 = 0;
    [v13 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v16];
    id v4 = v16;

    if (v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D52C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101077F94();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D52E0);
      }
      v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController pasteboardCacheDirectory]");
      objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v7, v8, 112, 0, "Unable to create cache directory: %@", v4 file lineNumber isFatal description];
LABEL_26:
    }
  }

  return (NSURL *)v10;
}

+ (void)clearPasteboardCacheDirectory
{
  unsigned int v2 = &off_1014C1000;
  v3 = +[NSFileManager defaultManager];
  id v39 = 0;
  id v4 = [v3 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:&v39];
  id v5 = v39;

  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D53C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107812C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D53E0);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    objc_super v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController clearPasteboardCacheDirectory]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8, v9, 145, 0, "Unable to create cache directory: %@", v5 file lineNumber isFatal description];
    v11 = v4;
    goto LABEL_45;
  }
  id v10 = [objc_opt_class() p_cacheDirectoryName];
  v11 = [v4 URLByAppendingPathComponent:v10];

  unsigned __int8 v12 = +[NSFileManager defaultManager];
  unsigned int v13 = [v12 crl_directoryExistsAt:v11];

  if (v13)
  {
    v14 = +[NSFileManager defaultManager];
    id v38 = 0;
    objc_super v8 = [v14 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:0 options:1 error:&v38];
    id v5 = v38;

    if (v5)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5380);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010780A4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D53A0);
      }
      __int16 v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v15);
      }
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController clearPasteboardCacheDirectory]");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v9, v16, 141, 0, "Unable to get contents of copy cache directory: %@", v5 file lineNumber isFatal description];
    }
    else
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v9 = v8;
      id v17 = [v9 countByEnumeratingWithState:&v34 objects:v50 count:16];
      if (v17)
      {
        id v18 = v17;
        v32 = v11;
        id v5 = 0;
        uint64_t v19 = *(void *)v35;
        do
        {
          v20 = 0;
          v21 = v5;
          do
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v9);
            }
            uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 8 * (void)v20);
            v23 = [(__objc2_class *)v2[61] defaultManager];
            id v33 = v21;
            [v23 removeItemAtURL:v22 error:&v33];
            id v5 = v33;

            if (v5)
            {
              v24 = v2;
              unsigned int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014D5340);
              }
              v26 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                unsigned int v41 = v25;
                __int16 v42 = 2082;
                v43 = "+[CRLPasteboardController clearPasteboardCacheDirectory]";
                __int16 v44 = 2082;
                v45 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m";
                __int16 v46 = 1024;
                int v47 = 137;
                __int16 v48 = 2112;
                id v49 = v5;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unable to remove item in copy cache directory: %@", buf, 0x2Cu);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014D5360);
              }
              v27 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                v30 = v27;
                v31 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)buf = 67109378;
                unsigned int v41 = v25;
                __int16 v42 = 2114;
                v43 = v31;
                _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController clearPasteboardCacheDirectory]");
              v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
              +[CRLAssertionHandler handleFailureInFunction:v28, v29, 137, 0, "Unable to remove item in copy cache directory: %@", v5 file lineNumber isFatal description];

              unsigned int v2 = v24;
            }
            v20 = (char *)v20 + 1;
            v21 = v5;
          }
          while (v18 != v20);
          id v18 = [v9 countByEnumeratingWithState:&v34 objects:v50 count:16];
        }
        while (v18);
        objc_super v8 = v9;
        v11 = v32;
      }
      else
      {
        id v5 = 0;
        objc_super v8 = v9;
      }
    }
LABEL_45:
  }
}

- (id)ingestibleItemSourceForPasteboard:(id)a3
{
  id v4 = a3;
  id v5 = [[CRLPasteboardItemSource alloc] initWithPasteboard:v4 pasteboardController:self];

  return v5;
}

- (id)newCopyAssistantWithPasteboard:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLPasteboardController *)self delegate];
  BOOL v6 = [v5 sourceContextForPasteboardController:self];

  v7 = [[CRLPasteboardCopyAssistant alloc] initWithPasteboard:v4 sourceContext:v6];
  [(CRLPasteboardWriteAssistant *)v7 setDelegate:self];

  return v7;
}

- (id)newDragAssistant
{
  v3 = [(CRLPasteboardController *)self delegate];
  id v4 = [v3 sourceContextForPasteboardController:self];

  id v5 = [(CRLPasteboardWriteAssistant *)[CRLDraggingAssistant alloc] initWithContext:v4];
  [(CRLPasteboardWriteAssistant *)v5 setDelegate:self];

  return v5;
}

- (id)newReadAssistantWithPasteboard:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLPasteboardController *)self p_board];
  BOOL v6 = [v5 store];
  v7 = [_TtC8Freeform32CRLPasteboardObjectReadAssistant alloc];
  objc_super v8 = [v6 crdtContext];
  id v9 = [(CRLPasteboardObjectReadAssistant *)v7 initWithPasteboard:v4 store:v6 context:v8];

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1000EFD80;
  v29 = sub_1000EFD90;
  id v30 = 0;
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_1000EFD98;
  uint64_t v22 = &unk_1014D5408;
  v24 = &v25;
  id v10 = dispatch_semaphore_create(0);
  v23 = v10;
  [(CRLPasteboardObjectReadAssistant *)v9 readPasteboardObjectWithCompletionHandler:&v19];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (v26[5])
  {
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014D5428);
    }
    v11 = off_10166B498;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      [v26[5] domain:v19, v20, v21, v22];
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = [(id)v26[5] code];
      uint64_t v18 = v26[5];
      *(_DWORD *)buf = 138544130;
      id v32 = v15;
      __int16 v33 = 2114;
      id v34 = v16;
      __int16 v35 = 2048;
      id v36 = v17;
      __int16 v37 = 2112;
      uint64_t v38 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_ERROR, "Failed to deserialize from pasteboard. error=errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x2Au);
    }
    unsigned __int8 v12 = 0;
  }
  else
  {
    unsigned __int8 v12 = v9;
  }

  _Block_object_dispose(&v25, 8);
  return v12;
}

- (id)pasteboardObjectFromAssistant:(id)a3 boardItems:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 pasteboardObject];
  v7 = v6;
  if (v6) {
    [v6 setBoardItems:v5];
  }

  return v7;
}

- (id)pasteboardObjectFromAssistant:(id)a3 textStorage:(id)a4 smartCopy:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  objc_super v8 = [a3 pasteboardObject];
  id v9 = v8;
  if (v8)
  {
    if (v7)
    {
      [v8 copyTextFrom:v7];
      [v9 setIsSmartCopyPaste:v5];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5448);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010781B4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5468);
      }
      id v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v10);
      }
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController pasteboardObjectFromAssistant:textStorage:smartCopy:]");
      unsigned __int8 v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 226, 0, "invalid nil value for '%{public}s'", "inWPStorage");
    }
  }

  return v9;
}

- (id)publicTypesForBoardItems:(id)a3 asPDF:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[NSMutableArray array];
  if ([v6 count] == (id)1)
  {
    objc_super v8 = [v6 firstObject];
    id v9 = [v8 customPublicTypesToPromiseWhenCopyingSingleBoardItem];
    [v7 addObjectsFromArray:v9];

    if (![v7 count])
    {

      if (v4) {
        goto LABEL_5;
      }
LABEL_7:
      v11 = 0;
      goto LABEL_8;
    }
    unsigned __int8 v10 = [v8 wantsStandardPublicTypesInAdditionToCustomTypesToPromiseWhenCopyingSingleBoardItem];

    if ((v10 & 1) == 0) {
      goto LABEL_11;
    }
  }
  if (!v4) {
    goto LABEL_7;
  }
LABEL_5:
  v11 = [UTTypePDF identifier];
LABEL_8:
  id v16 = v11;
  unsigned int v12 = [(CRLPasteboardController *)self pImageForBoardItems:v6 imageData:0 dataType:&v16 dataName:0];
  id v13 = v16;

  if (v12) {
    [v7 addObject:v13];
  }

LABEL_11:
  id v14 = [v7 copy];

  return v14;
}

- (BOOL)hasNativeBoardItemsOnPasteboard:(id)a3
{
  CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasNativeBoardItems";
  id v3 = a3;
  BOOL v4 = +[NSArray arrayWithObjects:&v7 count:1];
  unsigned __int8 v5 = [v3 containsPasteboardTypes:v4, v7];

  return v5;
}

- (BOOL)hasSingleNativeImageBoardItemOnPasteboard:(id)a3
{
  CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasSingleNativeImageBoardItem";
  id v3 = a3;
  BOOL v4 = +[NSArray arrayWithObjects:&v7 count:1];
  unsigned __int8 v5 = [v3 containsPasteboardTypes:v4, v7];

  return v5;
}

- (BOOL)hasSingleNativeMovieBoardItemOnPasteboard:(id)a3
{
  CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasSingleNativeMovieBoardItem";
  id v3 = a3;
  BOOL v4 = +[NSArray arrayWithObjects:&v7 count:1];
  unsigned __int8 v5 = [v3 containsPasteboardTypes:v4, v7];

  return v5;
}

- (BOOL)hasOnlyNativeFreehandDrawingBoardItemsOnPasteboard:(id)a3
{
  CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasOnlyFreehandDrawingBoardItems";
  id v3 = a3;
  BOOL v4 = +[NSArray arrayWithObjects:&v7 count:1];
  unsigned __int8 v5 = [v3 containsPasteboardTypes:v4, v7];

  return v5;
}

- (BOOL)hasNativeFreehandDrawingBoardItemsOnPasteboard:(id)a3
{
  CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasFreehandDrawingBoardItems";
  id v3 = a3;
  BOOL v4 = +[NSArray arrayWithObjects:&v7 count:1];
  unsigned __int8 v5 = [v3 containsPasteboardTypes:v4, v7];

  return v5;
}

- (BOOL)hasOnlyNativeTextBoxBoardItemsOnPasteboard:(id)a3
{
  CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasOnlyNativeTextBoxItems";
  id v3 = a3;
  BOOL v4 = +[NSArray arrayWithObjects:&v7 count:1];
  unsigned __int8 v5 = [v3 containsPasteboardTypes:v4, v7];

  return v5;
}

- (unint64_t)boardItemStyleKindsOnPasteboard:(id)a3
{
  unint64_t result = [(CRLPasteboardController *)self p_integerFromPasteboardStateTypePrefix:@"com.apple.freeform.pasteboardState.styleClass-" pasteboard:a3];
  if ((result & 0x8000000000000000) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5488);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107824C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D54A8);
    }
    BOOL v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    unsigned __int8 v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController boardItemStyleKindsOnPasteboard:]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:300 isFatal:0 description:"Out-of-bounds type assignment was clamped to min"];

    return 0;
  }
  return result;
}

- (BOOL)hasOnlyNativeTextBoxItemsOnPasteboard:(id)a3
{
  CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasOnlyNativeTextBoxItems";
  id v3 = a3;
  BOOL v4 = +[NSArray arrayWithObjects:&v7 count:1];
  unsigned __int8 v5 = [v3 containsPasteboardTypes:v4, v7];

  return v5;
}

- (id)providersForBoardItemsFromPasteboard:(id)a3
{
  return [(CRLPasteboardController *)self providersForBoardItemsForTargetStorage:0 fromPasteboard:a3];
}

- (id)providersForNativeBoardItemsAndTextFromPasteboard:(id)a3 validGeometries:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [(CRLPasteboardController *)self newReadAssistantWithPasteboard:v6];
  if (v7)
  {
    objc_super v8 = [(CRLPasteboardController *)self p_providersForBoardItemsAndTextFromPasteboardReadAssistant:v7 pasteboard:v6 validGeometries:a4];
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (id)providersForNativeBoardItemsFromPasteboard:(id)a3
{
  id v4 = [(CRLPasteboardController *)self newReadAssistantWithPasteboard:a3];
  unsigned __int8 v5 = v4;
  if (v4)
  {
    id v6 = [v4 pasteboardObject];
    if (v6)
    {
      id v7 = [(id)objc_opt_class() descriptionsForBoardItemsOnPasteboardObject:v6];
      objc_super v8 = [v6 boardItems];
      id v9 = +[CRLIngestibleBoardItemAndDescription ingestibleBoardItemAndDescriptionWithBoardItems:v8 descriptions:v7];

      if ([v9 count])
      {
        unsigned __int8 v10 = [CRLBoardItemProviderFactory alloc];
        v11 = [(CRLPasteboardController *)self p_boardItemFactory];
        unsigned int v12 = [(CRLBoardItemProviderFactory *)v10 initWithBoardItemFactory:v11];

        id v13 = [(CRLBoardItemProviderFactory *)v12 styleMappingProvidersForPasteboardBoardItems:v9];
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)providersForBoardItemsForTargetStorage:(id)a3 fromPasteboard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRLPasteboardController *)self newReadAssistantWithPasteboard:v7];
  id v9 = v8;
  if (v8)
  {
    unsigned __int8 v10 = [v8 pasteboardObject];
    if (v10)
    {
      v11 = [(CRLPasteboardController *)self descriptionsForBoardItemsOnPasteboard:v7];
      unsigned int v12 = [(id)objc_opt_class() readPasteboardBoardItemsForTargetStorage:v6 fromPasteboardObject:v10 descriptionsForBoardItems:v11];
      if ([v12 count])
      {
        id v13 = [CRLBoardItemProviderFactory alloc];
        id v14 = [(CRLPasteboardController *)self p_boardItemFactory];
        id v15 = [(CRLBoardItemProviderFactory *)v13 initWithBoardItemFactory:v14];

        id v16 = [(CRLBoardItemProviderFactory *)v15 styleMappingProvidersForPasteboardBoardItems:v12];
      }
      else
      {
        id v16 = &__NSArray0__struct;
      }
    }
    else
    {
      id v16 = &__NSArray0__struct;
    }
  }
  else
  {
    id v16 = &__NSArray0__struct;
  }

  return v16;
}

+ (id)descriptionsForBoardItemsOnPasteboardObject:(id)a3
{
  id v3 = a3;
  id v4 = [v3 boardItems];
  unsigned __int8 v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  id v6 = [v3 boardItems];
  id v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      [v5 addObject:&__NSDictionary0__struct];
      ++v8;
      id v9 = [v3 boardItems];
      id v10 = [v9 count];
    }
    while (v8 < (unint64_t)v10);
  }

  return v5;
}

+ (id)boardItemsForCopyByFixingUpBoardItems:(id)a3 boardItemFactory:(id)a4 board:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_opt_class() p_boardItemsForCopyByFixingUpBoardItems:v9 boardItemFactory:v8 board:v7 UUIDRemappingBlock:0];

  return v10;
}

+ (id)p_boardItemsForCopyByFixingUpBoardItems:(id)a3 boardItemFactory:(id)a4 board:(id)a5 UUIDRemappingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  v11 = [a4 makeDuplicateOfBoardItems:v9 UUIDRemappingBlock:a6];
  unsigned int v12 = (char *)[v9 count];
  if ([v11 count] == v12)
  {
    id v13 = v11;
    if (v12)
    {
      for (i = 0; i != v12; ++i)
      {
        uint64_t v15 = objc_opt_class();
        id v16 = [v9 objectAtIndexedSubscript:i];
        id v17 = sub_1002469D0(v15, v16);

        if (v17)
        {
          uint64_t v18 = (objc_class *)objc_opt_class();
          uint64_t v19 = [v11 objectAtIndexedSubscript:i];
          uint64_t v20 = sub_10024715C(v18, v19);

          if (v20) {
            +[CRLConnectionLineAdjustmentHelper transferLaidOutInfoGeometryAndPathSourceFrom:v17 to:v20 withBoardItemOwner:v10];
          }
        }
      }
      id v13 = v11;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D54C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010782DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D54E8);
    }
    v21 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v21);
    }
    uint64_t v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController p_boardItemsForCopyByFixingUpBoardItems:boardItemFactory:board:UUIDRemappingBlock:]");
    v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v22 file:v23 lineNumber:399 isFatal:0 description:"Unable to duplicate items for fixing up."];

    id v13 = v9;
  }
  id v24 = v13;

  return v24;
}

+ (id)additionalBoardItemsForCopyImaging:(id)a3 icc:(id)a4 invertedObjectUUIDMap:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    id v9 = [a3 crl_arrayOfObjectsPassingTest:&stru_1014D5528];
    id v10 = objc_alloc_init((Class)NSMutableArray);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v31 objects:v45 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v15);
          id v17 = [v7 repForInfo:v16];
          if (!v17)
          {
            uint64_t v18 = [v16 id];
            uint64_t v19 = [v8 objectForKeyedSubscript:v18];

            if (!v19) {
              goto LABEL_10;
            }
            uint64_t v20 = [v7 board];
            v21 = [v20 getBoardItemForUUID:v19];

            id v17 = [v7 repForInfo:v21];

            if (!v17)
            {
LABEL_10:
              unsigned int v22 = +[CRLAssertionHandler _atomicIncrementAssertCount];
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014D5548);
              }
              v23 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67110146;
                unsigned int v36 = v22;
                __int16 v37 = 2082;
                uint64_t v38 = "+[CRLPasteboardController additionalBoardItemsForCopyImaging:icc:invertedObjectUUIDMap:]";
                __int16 v39 = 2082;
                v40 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m";
                __int16 v41 = 1024;
                int v42 = 436;
                __int16 v43 = 2082;
                __int16 v44 = "rep";
                _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
              }
              if (qword_101719A70 != -1) {
                dispatch_once(&qword_101719A70, &stru_1014D5568);
              }
              id v24 = off_10166B4A0;
              if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
              {
                v28 = v24;
                v29 = +[CRLAssertionHandler packedBacktraceString];
                *(_DWORD *)buf = 67109378;
                unsigned int v36 = v22;
                __int16 v37 = 2114;
                uint64_t v38 = v29;
                _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
              }
              uint64_t v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLPasteboardController additionalBoardItemsForCopyImaging:icc:invertedObjectUUIDMap:]");
              v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 436, 0, "invalid nil value for '%{public}s'", "rep");

              id v17 = 0;
            }
          }
          uint64_t v27 = [v17 createAdditionalBoardItemsForCopyImaging];
          [v10 addObjectsFromArray:v27];

          uint64_t v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v31 objects:v45 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v10 = &__NSArray0__struct;
  }

  return v10;
}

- (BOOL)p_shouldKeepHighlights
{
  return 1;
}

- (id)p_providersForBoardItemsAndTextFromPasteboardReadAssistant:(id)a3 pasteboard:(id)a4 validGeometries:(BOOL *)a5
{
  id v7 = [a3 pasteboardObject];
  if (v7)
  {
    BOOL v8 = [(CRLPasteboardController *)self p_shouldKeepHighlights];
    id v9 = [(id)objc_opt_class() descriptionsForBoardItemsOnPasteboardObject:v7];
    id v10 = objc_opt_class();
    id v11 = [(CRLPasteboardController *)self p_boardItemFactory];
    id v12 = [v10 providersForBoardItemsAndTextWithBoardItemFactory:v11 keepHighlights:v8 fromPasteboardObject:v7 descriptionsForBoardItems:v9 validGeometries:a5];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)readPasteboardBoardItemsForTargetStorage:(id)a3 fromPasteboardObject:(id)a4 descriptionsForBoardItems:(id)a5
{
  id v6 = a5;
  id v7 = [a4 boardItems];
  BOOL v8 = +[CRLIngestibleBoardItemAndDescription ingestibleBoardItemAndDescriptionWithBoardItems:v7 descriptions:v6];

  return v8;
}

- (BOOL)canProduceBoardItemsFromPasteboard:(id)a3
{
  id v4 = a3;
  if ([(CRLPasteboardController *)self hasNativeBoardItemsOnPasteboard:v4]
    || [(CRLPasteboardController *)self hasNativeTextOnPasteboard:v4]
    || [(CRLPasteboardController *)self hasImportableRichTextOnPasteboard:v4]
    || [(CRLPasteboardController *)self hasImportablePlainTextOnPasteboard:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = [(CRLPasteboardController *)self hasImportableBoardItemsOnPasteboard:v4 detectImportableURLsInText:1 skipFileURLs:0];
  }

  return v5;
}

- (BOOL)hasImportableBoardItemsOnPasteboard:(id)a3 detectImportableURLsInText:(BOOL)a4 skipFileURLs:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([(CRLPasteboardController *)self hasImportableImagesOnPasteboard:v8 skipFileURLs:v5])
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    BOOL v37 = v5;
    uint64_t v38 = self;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v10 = [v8 pasteboardTypes];
    id v11 = [v10 countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v52;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v52 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          id v16 = +[UTType typeWithIdentifier:v15];
          if ((objc_msgSend(v15, "crl_isPasteboardStateType") & 1) == 0)
          {
            id v17 = +[CRLIngestionTypes supportedMovieUTTypes];
            unsigned __int8 v18 = [v16 crl_conformsToAnyUTType:v17];

            if ((v18 & 1) != 0
              || +[CRLIngestionTypes isValidFileType:v16])
            {

              goto LABEL_25;
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v51 objects:v58 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v19 = [v8 URLs];
    id v9 = [v19 count];

    if (v9)
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      uint64_t v20 = [v8 URLs];
      id v9 = [v20 countByEnumeratingWithState:&v47 objects:v57 count:16];
      v21 = v38;
      if (v9)
      {
        uint64_t v22 = *(void *)v48;
        while (2)
        {
          for (j = 0; j != v9; j = (char *)j + 1)
          {
            if (*(void *)v48 != v22) {
              objc_enumerationMutation(v20);
            }
            id v24 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
            if (([v24 isFileURL] & 1) == 0
              && +[CRLURLBoardItemProvider canInitWithURL:v24])
            {
              LOBYTE(v9) = 1;
              goto LABEL_30;
            }
          }
          id v9 = [v20 countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_30:
    }
    else
    {
      v21 = v38;
    }
    if ((v9 & 1) == 0 && !v37)
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v26 = [v8 URLs];
      id v27 = [v26 countByEnumeratingWithState:&v43 objects:v56 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v44;
        while (2)
        {
          for (k = 0; k != v28; k = (char *)k + 1)
          {
            if (*(void *)v44 != v29) {
              objc_enumerationMutation(v26);
            }
            long long v31 = *(void **)(*((void *)&v43 + 1) + 8 * (void)k);
            if ([v31 isFileURL]
              && +[CRLURLBoardItemProvider canInitWithURL:v31])
            {
              LOBYTE(v9) = 1;
              goto LABEL_44;
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v43 objects:v56 count:16];
          if (v28) {
            continue;
          }
          break;
        }
      }
      LOBYTE(v9) = 0;
LABEL_44:
    }
    if ((v9 & 1) == 0 && v6)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v10 = [v8 pasteboardTypes];
      id v32 = [v10 countByEnumeratingWithState:&v39 objects:v55 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v40;
LABEL_49:
        uint64_t v35 = 0;
        while (1)
        {
          if (*(void *)v40 != v34) {
            objc_enumerationMutation(v10);
          }
          unsigned int v36 = [(CRLPasteboardController *)v21 p_detectedImportableURLOnPasteboard:v8 type:*(void *)(*((void *)&v39 + 1) + 8 * v35) fallbackBoardItemProvider:0];

          if (v36) {
            break;
          }
          if (v33 == (id)++v35)
          {
            id v33 = [v10 countByEnumeratingWithState:&v39 objects:v55 count:16];
            if (v33) {
              goto LABEL_49;
            }
            goto LABEL_55;
          }
        }
LABEL_25:
        LOBYTE(v9) = 1;
      }
      else
      {
LABEL_55:
        LOBYTE(v9) = 0;
      }
    }
  }

  return (char)v9;
}

- (BOOL)hasImportableImagesOnPasteboard:(id)a3 skipFileURLs:(BOOL)a4
{
  id v5 = a3;
  BOOL v6 = +[CRLIngestionTypes supportedImageUTTypes];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [v5 pasteboardTypes];
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = +[UTType typeWithIdentifier:*(void *)(*((void *)&v25 + 1) + 8 * v11)];
      unsigned __int8 v13 = [v12 crl_conformsToAnyUTType:v6];

      if (v13) {
        goto LABEL_21;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (!a4)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [v5 URLs];
    id v14 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (!v14)
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v15 = *(void *)v22;
LABEL_13:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v22 != v15) {
        objc_enumerationMutation(v7);
      }
      id v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
      if ([v17 isFileURL])
      {
        unsigned __int8 v18 = [v17 crl_fileTypeIdentifierHandlingFileCoordinationPromises];
        unsigned __int8 v19 = [v18 crl_conformsToAnyUTType:v6];

        if (v19) {
          break;
        }
      }
      if (v14 == (id)++v16)
      {
        id v14 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v14) {
          goto LABEL_13;
        }
        goto LABEL_22;
      }
    }
LABEL_21:
    LOBYTE(v14) = 1;
    goto LABEL_22;
  }
  LOBYTE(v14) = 0;
LABEL_23:

  return (char)v14;
}

- (id)asyncProvidersForBoardItemsFromPasteboard:(id)a3
{
  id v4 = a3;
  if ([(CRLPasteboardController *)self hasNativeBoardItemsOnPasteboard:v4])
  {
    id v5 = [(CRLPasteboardController *)self providersForNativeBoardItemsFromPasteboard:v4];
    BOOL v6 = +[NSMutableArray array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v12 conformsToProtocol:&OBJC_PROTOCOL___CRLIngestibleItemImportableBoardItemProvider])[v6 addObject:v12]; {
        }
          }
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
  else
  {
    switch([(CRLPasteboardController *)self preferredImportableDataTypeOnPasteboard:v4 detectImportableURLsInText:1])
    {
      case 1uLL:
        uint64_t v13 = [(CRLPasteboardController *)self providersForBoardItemsFromImportedRichTextFromPasteboard:v4];
        goto LABEL_26;
      case 2uLL:
        goto LABEL_24;
      case 3uLL:
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5588);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10107836C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D55A8);
        }
        id v14 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v14);
        }
        uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController asyncProvidersForBoardItemsFromPasteboard:]");
        uint64_t v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:624 isFatal:0 description:"should not ask for async providers for preferred type file promise!"];

LABEL_24:
        uint64_t v13 = [(CRLPasteboardController *)self providersForBoardItemsImportedFromPasteboard:v4];
        goto LABEL_26;
      case 4uLL:
        uint64_t v13 = [(CRLPasteboardController *)self providersForBoardItemsFromImportedTextFromPasteboard:v4];
LABEL_26:
        BOOL v6 = (void *)v13;
        break;
      default:
        BOOL v6 = 0;
        break;
    }
  }

  return v6;
}

- (id)providersForBoardItemsImportedFromPasteboard:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 numberOfItems];
  if (v5 < 1)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v6 = v5;
    id v7 = 0;
    for (uint64_t i = 0; i != v6; ++i)
    {
      id v9 = [objc_alloc((Class)NSIndexSet) initWithIndex:i];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = [v4 pasteboardTypesForItemSet:v9];
      id v12 = [v11 firstObject];
      uint64_t v13 = [v10 pFilteredPasteboardTypesForPasteboard:v4 types:v12];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = v13;
      id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15)
      {
        id v16 = v15;
        long long v23 = v7;
        uint64_t v17 = v6;
        uint64_t v18 = *(void *)v25;
        while (2)
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(void *)v25 != v18) {
              objc_enumerationMutation(v14);
            }
            id v20 = [(CRLPasteboardController *)self p_newImportableBoardItemProviderFromPasteboard:v4 itemIndex:i itemType:*(void *)(*((void *)&v24 + 1) + 8 * (void)j)];
            if (v20)
            {
              long long v21 = v20;
              uint64_t v6 = v17;
              id v7 = v23;
              if (!v23)
              {
                id v7 = +[NSMutableArray arrayWithCapacity:v6];
              }
              [v7 addObject:v21];

              goto LABEL_15;
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v16) {
            continue;
          }
          break;
        }
        uint64_t v6 = v17;
        id v7 = v23;
      }
LABEL_15:
    }
  }

  return v7;
}

- (id)p_newImportableBoardItemProviderFromPasteboard:(id)a3 itemIndex:(unint64_t)a4 itemType:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = +[NSIndexSet indexSetWithIndex:a4];
  uint64_t v11 = +[UTType typeWithIdentifier:v9];
  if ([v11 conformsToType:UTTypeFileURL])
  {
    id v12 = [(CRLPasteboardController *)self p_importableFileURLFromPasteboard:v8 itemIndex:a4 itemType:v9];
    if (v12)
    {
      uint64_t v13 = [CRLBoardItemProviderFactory alloc];
      id v14 = [(CRLPasteboardController *)self p_boardItemFactory];
      id v15 = [(CRLBoardItemProviderFactory *)v13 initWithBoardItemFactory:v14];

      long long v28 = v12;
      id v16 = +[NSArray arrayWithObjects:&v28 count:1];
      uint64_t v17 = [(CRLBoardItemProviderFactory *)v15 providersForBoardItemsFromURLs:v16];
      if ([v17 count])
      {
        uint64_t v18 = [v17 objectAtIndexedSubscript:0];
      }
      else
      {
        uint64_t v18 = 0;
      }

      goto LABEL_15;
    }
LABEL_20:
    uint64_t v18 = 0;
    goto LABEL_21;
  }
  if ([v11 conformsToType:UTTypeURL])
  {
    uint64_t v19 = [(CRLPasteboardController *)self p_importableURLFromPasteboard:v8 itemIndex:a4 itemType:v9];
  }
  else
  {
    id v20 = [v8 importableRichTextTypes];
    if ([v20 containsObject:v9])
    {
    }
    else
    {
      unsigned __int8 v21 = +[CRLIngestionTypes isValidPlainTextUTI:v9];

      if ((v21 & 1) == 0)
      {
        if (!+[CRLInfoImporterBoardItemProvider canInitWithType:v9])
        {
          uint64_t v18 = 0;
          goto LABEL_22;
        }
        long long v24 = [v8 dataForPasteboardType:v9 inItemSet:v10];
        id v12 = [v24 firstObject];

        if (v12 && [v12 length])
        {
          long long v25 = [CRLInfoImporterBoardItemProvider alloc];
          long long v26 = [(CRLPasteboardController *)self p_boardItemFactory];
          uint64_t v18 = [(CRLInfoImporterBoardItemProvider *)v25 initWithData:v12 type:v9 boardItemFactory:v26];

          goto LABEL_21;
        }
        goto LABEL_20;
      }
    }
    uint64_t v19 = [(CRLPasteboardController *)self p_detectedImportableURLOnPasteboard:v8 type:v9 fallbackBoardItemProvider:0];
  }
  id v12 = (void *)v19;
  if (!v19) {
    goto LABEL_20;
  }
  long long v22 = [CRLBoardItemProviderFactory alloc];
  long long v23 = [(CRLPasteboardController *)self p_boardItemFactory];
  id v15 = [(CRLBoardItemProviderFactory *)v22 initWithBoardItemFactory:v23];

  uint64_t v18 = [(CRLBoardItemProviderFactory *)v15 providerForBoardItemFromDetectedImportableURL:v12 fallbackBoardItemProvider:0];
LABEL_15:

LABEL_21:
LABEL_22:

  return v18;
}

- (id)providersForBoardItemsFromImportedTextFromPasteboard:(id)a3
{
  return [(CRLPasteboardController *)self providersForBoardItemsFromImportedTextFromPasteboard:a3 maximumStringLength:25600];
}

- (id)providersForBoardItemsFromImportedTextFromPasteboard:(id)a3 maximumStringLength:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [CRLBoardItemProviderFactory alloc];
  id v8 = [(CRLPasteboardController *)self p_boardItemFactory];
  id v9 = [(CRLBoardItemProviderFactory *)v7 initWithBoardItemFactory:v8];

  uint64_t v10 = [(CRLPasteboardController *)self importedTextStringFromPasteboard:v6 smartPaste:0];

  if ((unint64_t)[v10 length] <= a4)
  {
    if ([v10 length])
    {
      uint64_t v18 = [(CRLBoardItemProviderFactory *)v9 providersForBoardItemsFromImportedText:v10];
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  else
  {
    uint64_t v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"Pasted Text" value:0 table:0];

    id v20 = 0;
    uint64_t v13 = [v10 crl_writeToFileUsingName:v12 error:&v20];
    id v14 = v20;
    if (v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D55C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010783FC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D55E8);
      }
      id v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v15);
      }
      id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController providersForBoardItemsFromImportedTextFromPasteboard:maximumStringLength:]");
      uint64_t v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v16, v17, 734, 0, "Failed to create a temporary file for oversize string: %@", v14 file lineNumber isFatal description];

      uint64_t v18 = 0;
    }
    else
    {
      unsigned __int8 v21 = v13;
      id v16 = +[NSArray arrayWithObjects:&v21 count:1];
      uint64_t v18 = [(CRLBoardItemProviderFactory *)v9 providersForBoardItemsFromURLs:v16];
    }
  }

  return v18;
}

- (id)providersForBoardItemsFromImportedRichTextFromPasteboard:(id)a3
{
  return [(CRLPasteboardController *)self providersForBoardItemsFromImportedRichTextFromPasteboard:a3 maximumStringLength:25600];
}

- (id)providersForBoardItemsFromImportedRichTextFromPasteboard:(id)a3 maximumStringLength:(unint64_t)a4
{
  id v6 = [(CRLPasteboardController *)self importedRichTextStringFromPasteboard:a3 smartPaste:0];
  id v7 = [CRLBoardItemProviderFactory alloc];
  id v8 = [(CRLPasteboardController *)self p_boardItemFactory];
  id v9 = [(CRLBoardItemProviderFactory *)v7 initWithBoardItemFactory:v8];

  uint64_t v10 = [v6 string];
  id v11 = [v10 length];

  if ((unint64_t)v11 <= a4)
  {
    if ([v6 length])
    {
      uint64_t v19 = [(CRLBoardItemProviderFactory *)v9 providersForBoardItemsFromImportedRichText:v6];
    }
    else
    {
      uint64_t v19 = 0;
    }
  }
  else
  {
    id v12 = +[NSBundle mainBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"Pasted Text" value:0 table:0];

    id v21 = 0;
    id v14 = [v6 crl_writeToFileUsingName:v13 type:0 error:&v21];
    id v15 = v21;
    if (v15)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5608);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101078484();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5628);
      }
      id v16 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v16);
      }
      uint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController providersForBoardItemsFromImportedRichTextFromPasteboard:maximumStringLength:]");
      uint64_t v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v17, v18, 761, 0, "Failed to create a temporary file for oversize string: %@", v15 file lineNumber isFatal description];

      uint64_t v19 = 0;
    }
    else
    {
      long long v22 = v14;
      uint64_t v17 = +[NSArray arrayWithObjects:&v22 count:1];
      uint64_t v19 = [(CRLBoardItemProviderFactory *)v9 providersForBoardItemsFromURLs:v17];
    }
  }

  return v19;
}

- (id)p_importableURLFromPasteboard:(id)a3 itemIndex:(unint64_t)a4 itemType:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 URLs];
  if ([v9 count])
  {
    if ((unint64_t)[v9 count] <= a4)
    {
      unsigned int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5648);
      }
      id v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = v11;
        *(_DWORD *)buf = 67110402;
        unsigned int v20 = v10;
        __int16 v21 = 2082;
        long long v22 = "-[CRLPasteboardController p_importableURLFromPasteboard:itemIndex:itemType:]";
        __int16 v23 = 2082;
        long long v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m";
        __int16 v25 = 1024;
        int v26 = 811;
        __int16 v27 = 2048;
        unint64_t v28 = a4;
        __int16 v29 = 2048;
        id v30 = [v9 count];
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid URL index %tu: only %tu URLs on pasteboard", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5668);
      }
      id v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      uint64_t v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController p_importableURLFromPasteboard:itemIndex:itemType:]");
      id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 811, 0, "Invalid URL index %tu: only %tu URLs on pasteboard", a4, [v9 count]);
    }
    if ((unint64_t)[v9 count] <= a4)
    {
      id v15 = 0;
    }
    else
    {
      id v15 = [v9 objectAtIndexedSubscript:a4];
    }
  }
  else
  {
    id v16 = [v7 dataForPasteboardType:v8];
    if (v16)
    {
      id v15 = +[NSURL URLWithDataRepresentation:v16 relativeToURL:0];
    }
    else
    {
      id v15 = 0;
    }
  }

  return v15;
}

- (id)p_importableFileURLFromPasteboard:(id)a3 itemIndex:(unint64_t)a4 itemType:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[NSIndexSet indexSetWithIndex:a4];
  unsigned int v10 = +[UTType typeWithIdentifier:v8];
  if ([v10 conformsToType:UTTypeURL])
  {
    id v11 = +[NSURL crl_URLWithStringDataOnPasteboard:v7 itemSet:v9 pasteboardType:v8];
    if (v11
      && +[CRLURLBoardItemProvider canInitWithURL:v11])
    {
      id v11 = v11;
      id v12 = v11;
      goto LABEL_7;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v12 = 0;
LABEL_7:

  return v12;
}

- (id)p_detectedImportableURLOnPasteboard:(id)a3 type:(id)a4 fallbackBoardItemProvider:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = [v8 importableRichTextTypes];
  unsigned int v11 = [v10 containsObject:v9];

  if (v11)
  {
    id v12 = [(CRLPasteboardController *)self importedRichTextStringFromPasteboard:v8 smartPaste:0];
    id v13 = [v12 length];
    if (v13)
    {
      long long v28 = xmmword_101176F48;
      id v14 = [v12 attribute:NSLinkAttributeName atIndex:0 effectiveRange:&v28];
      if (v14 && v28 == __PAIR128__((unint64_t)v13, 0))
      {
        uint64_t v15 = objc_opt_class();
        sub_1002469D0(v15, v14);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
LABEL_15:

          goto LABEL_17;
        }
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = sub_1002469D0(v16, v14);
        if (!v17)
        {
          id v13 = 0;
          goto LABEL_14;
        }
        uint64_t v18 = objc_opt_class();
        uint64_t v19 = v17;
        uint64_t v20 = 0;
      }
      else
      {
        uint64_t v21 = objc_opt_class();
        uint64_t v17 = [v12 string];
        uint64_t v18 = (void *)v21;
        uint64_t v19 = v17;
        uint64_t v20 = 1;
      }
      id v13 = [v18 detectedImportableURLForPasteboardString:v19 canTrimWhitespace:v20];
LABEL_14:

      goto LABEL_15;
    }
  }
  else
  {
    if (!+[CRLIngestionTypes isValidPlainTextUTI:v9])
    {
      id v13 = 0;
LABEL_22:
      long long v22 = 0;
      goto LABEL_38;
    }
    id v12 = [(CRLPasteboardController *)self importedTextStringFromPasteboard:v8 smartPaste:0];
    if (v12)
    {
      id v13 = [(id)objc_opt_class() detectedImportableURLForPasteboardString:v12 canTrimWhitespace:1];
    }
    else
    {
      id v13 = 0;
    }
  }
LABEL_17:

  if (!v13
    || !+[CRLURLBoardItemProvider canInitWithURL:v13])
  {
    goto LABEL_22;
  }
  id v13 = v13;
  if (a5)
  {
    if (v11) {
      [(CRLPasteboardController *)self providersForBoardItemsFromImportedRichTextFromPasteboard:v8];
    }
    else {
    __int16 v23 = [(CRLPasteboardController *)self providersForBoardItemsFromImportedTextFromPasteboard:v8];
    }
    if ([v23 count])
    {
      if ([v23 count] != (id)1)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5688);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10107850C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D56A8);
        }
        long long v24 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v24);
        }
        __int16 v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController p_detectedImportableURLOnPasteboard:type:fallbackBoardItemProvider:]");
        int v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:941 isFatal:0 description:"There should be only one rich or plain text board item provider when there is text on the pasteboard"];
      }
      *a5 = [v23 objectAtIndexedSubscript:0];
    }
  }
  long long v22 = v13;
LABEL_38:

  return v22;
}

+ (id)detectedImportableURLForPasteboardString:(id)a3 canTrimWhitespace:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    id v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v6 = [v5 stringByTrimmingCharactersInSet:v7];
  }
  id v8 = (char *)[v6 length];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = +[CRLURLBoardItemProvider supportedRemoteURLSchemes];
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    id v20 = v5;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (v8 >= (char *)[v14 length] + 1)
        {
          uint64_t v15 = [v6 substringToIndex:];
          uint64_t v16 = [(id)v15 lowercaseString];

          uint64_t v17 = [v14 stringByAppendingString:@":"];
          LOBYTE(v15) = [v16 isEqualToString:v17];

          if (v15)
          {
            uint64_t v18 = +[NSURL URLWithString:v6];

            goto LABEL_15;
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    uint64_t v18 = 0;
LABEL_15:
    id v5 = v20;
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (void)copyBoardItems:(id)a3 toPasteboard:(id)a4 asPDF:(BOOL)a5 writeAssistant:(id)a6 nativeOnly:(BOOL)a7 icc:(id)a8
{
  BOOL v38 = a7;
  BOOL v10 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id obj = a8;
  if (v10 && v38)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D56C8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010788DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D56E8);
    }
    uint64_t v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107882C(v16);
    }
    uint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController copyBoardItems:toPasteboard:asPDF:writeAssistant:nativeOnly:icc:]");
    uint64_t v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:980 isFatal:0 description:"asPDF is ignored when nativeOnly is specified"];
  }
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5708);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101078794();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5728);
    }
    uint64_t v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010786E4(v19);
    }
    id v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController copyBoardItems:toPasteboard:asPDF:writeAssistant:nativeOnly:icc:]");
    long long v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 982, 0, "invalid nil value for '%{public}s'", "inPasteboard");
  }
  [(id)objc_opt_class() clearPasteboardCacheDirectory];
  objc_storeWeak((id *)&self->_icc, obj);
  long long v23 = v22;
  if (v15)
  {
    BOOL v37 = v10;
    long long v24 = v22;
    __int16 v25 = v14;
    int v26 = objc_alloc_init(CRLContentDescriptionTranslator);
    __int16 v27 = [(CRLContentDescriptionTranslator *)v26 contentDescriptionForBoardItems:v13];
    uint64_t v41 = 0;
    long long v42 = &v41;
    uint64_t v43 = 0x3032000000;
    long long v44 = sub_1000EFD80;
    long long v45 = sub_1000EFD90;
    id v46 = 0;
    long long v28 = objc_opt_class();
    __int16 v29 = [(CRLPasteboardController *)self p_boardItemFactory];
    id v30 = [(CRLPasteboardController *)self p_board];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000F3EE0;
    v40[3] = &unk_1014D5790;
    v40[4] = &v41;
    uint64_t v31 = [v28 p_boardItemsForCopyByFixingUpBoardItems:v13 boardItemFactory:v29 board:v30 UUIDRemappingBlock:v40];

    objc_storeStrong((id *)&self->_invertedObjectUUIDMap, (id)v42[5]);
    id v32 = [(CRLPasteboardController *)self pasteboardObjectFromAssistant:v15 boardItems:v31];

    if (v32)
    {
      [v15 setContentDescription:v27];
      if (!v38)
      {
        id v33 = [(CRLPasteboardController *)self publicTypesForBoardItems:v31 asPDF:v37];
        [v15 setDataProvider:self forTypes:v33];
        if (v37) {
          [v15 setExcludeNativeData:1];
        }
        [(id)objc_opt_class() cacheWithBoardItems:v31];
      }
      uint64_t v34 = objc_opt_class();
      uint64_t v35 = sub_1002469D0(v34, v15);
      [v35 copyToPasteboard];
    }
    _Block_object_dispose(&v41, 8);

    id v13 = (id)v31;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5748);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107864C();
    }
    long long v24 = v23;
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5768);
    }
    __int16 v25 = v14;
    unsigned int v36 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107859C(v36);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController copyBoardItems:toPasteboard:asPDF:writeAssistant:nativeOnly:icc:]");
    int v26 = (CRLContentDescriptionTranslator *)objc_claimAutoreleasedReturnValue();
    __int16 v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 1003, 0, "invalid nil value for '%{public}s'", "writeAssistant");
  }
}

- (void)copyUninsertedFreehandDrawingItems:(id)a3 toPasteboard:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([v12 count])
  {
    id v7 = [(CRLPasteboardController *)self newCopyAssistantWithPasteboard:v6];
    id v8 = objc_alloc_init(CRLContentDescriptionTranslator);
    id v9 = [(CRLContentDescriptionTranslator *)v8 contentDescriptionForBoardItems:v12];
    BOOL v10 = [(CRLPasteboardController *)self pasteboardObjectFromAssistant:v7 boardItems:v12];

    if (v10)
    {
      [v7 setContentDescription:v9];
      id v11 = [(CRLPasteboardController *)self publicTypesForBoardItems:v12 asPDF:0];
      [v7 setDataProvider:self forTypes:v11];
      [v7 copyToPasteboard];
    }
  }
}

- (BOOL)hasImportablePlainTextOnPasteboard:(id)a3
{
  id v3 = a3;
  if ([v3 containsImportableTextTypes])
  {
    BOOL v4 = 1;
  }
  else
  {
    [v3 pasteboardTypes];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v11 = +[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", v10, (void)v13);
          if (([v11 conformsToType:UTTypePlainText] & 1) != 0
            || +[CRLPasteboardController p_isURLTypeExcludingFileURL:v10])
          {

            BOOL v4 = 1;
            goto LABEL_15;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        BOOL v4 = 0;
        if (v7) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
LABEL_15:
  }
  return v4;
}

- (BOOL)hasImportableRichTextOnPasteboard:(id)a3
{
  return _[a3 containsImportableRichTextTypes];
}

- (id)importedRichTextStringFromPasteboard:(id)a3 smartPaste:(BOOL *)a4
{
  id v5 = a3;
  id v6 = [v5 richTextStrings];
  id v7 = [v6 firstObject];

  if ([v7 length])
  {
    uint64_t v8 = +[CRLWPStorageSanitizer filterText:v7 removingAttachments:0];

    id v7 = (void *)v8;
  }
  if (a4)
  {
    if (v7) {
      unsigned __int8 v9 = [v5 isSmartCopy];
    }
    else {
      unsigned __int8 v9 = 0;
    }
    *a4 = v9;
  }

  return v7;
}

- (id)importedTextStringFromPasteboard:(id)a3 smartPaste:(BOOL *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4) {
    *a4 = 0;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = [v5 pasteboardTypes];
  id v8 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v40;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v40 != v10) {
        objc_enumerationMutation(v7);
      }
      if (+[CRLPasteboardController p_isURLTypeExcludingFileURL:*(void *)(*((void *)&v39 + 1) + 8 * v11)])
      {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_32;
      }
    }
    id v30 = a4;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = [v6 URLs];
    id v13 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v13)
    {
      id v14 = v13;
      id v7 = 0;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v35 + 1) + 8 * i) absoluteString];
          if ([v17 length])
          {
            if (v7)
            {
              uint64_t v18 = [v7 stringByAppendingFormat:@"%C%@", 10, v17];

              id v7 = (id)v18;
            }
            else
            {
              id v7 = v17;
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v14);
    }
    else
    {
      id v7 = 0;
    }

    if (![v7 length])
    {
      a4 = v30;
      goto LABEL_32;
    }
    uint64_t v19 = [v7 crl_stringByFixingBrokenSurrogatePairs];
    id v20 = [v19 crlwp_stringByNormalizingParagraphBreaks];
    id v21 = +[CRLWPStorageSanitizer filterText:v20];

    a4 = v30;
    if (v30 && [v21 length]) {
      BOOL *v30 = 1;
    }

    if (v21)
    {
LABEL_45:
      if (!a4) {
        goto LABEL_49;
      }
      goto LABEL_46;
    }
  }
  else
  {
LABEL_32:
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v22 = [v6 strings];
  id v21 = [v22 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (!v21)
  {
LABEL_44:

    goto LABEL_45;
  }
  uint64_t v23 = *(void *)v32;
LABEL_35:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v32 != v23) {
      objc_enumerationMutation(v22);
    }
    __int16 v25 = *(void **)(*((void *)&v31 + 1) + 8 * v24);
    if ([v25 length]) {
      break;
    }
    if (v21 == (id)++v24)
    {
      id v21 = [v22 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v21) {
        goto LABEL_35;
      }
      goto LABEL_44;
    }
  }
  id v26 = v25;

  if (v26)
  {
    __int16 v27 = [v26 crl_stringByFixingBrokenSurrogatePairs];
    long long v28 = [v27 crlwp_stringByNormalizingParagraphBreaks];
    id v21 = +[CRLWPStorageSanitizer filterText:v28];

    long long v22 = v26;
    goto LABEL_44;
  }
  id v21 = 0;
  if (a4)
  {
LABEL_46:
    if (v21 && [v6 isSmartCopy]) {
      *a4 = 1;
    }
  }
LABEL_49:

  return v21;
}

- (BOOL)hasTextStoragesOnPasteboard:(id)a3
{
  CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasTextStoragesAttachmentsNotAllowed";
  id v3 = a3;
  BOOL v4 = +[NSArray arrayWithObjects:&v7 count:1];
  unsigned __int8 v5 = [v3 containsPasteboardTypes:v4, v7];

  return v5;
}

- (BOOL)hasNativeTextOnPasteboard:(id)a3
{
  CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasNativeText";
  id v3 = a3;
  BOOL v4 = +[NSArray arrayWithObjects:&v7 count:1];
  unsigned __int8 v5 = [v3 containsPasteboardTypes:v4, v7];

  return v5;
}

- (BOOL)hasNativeBoardItemsContainingTextOnPasteboard:(id)a3
{
  CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasNativeBoardItemsContainingText";
  id v3 = a3;
  BOOL v4 = +[NSArray arrayWithObjects:&v7 count:1];
  unsigned __int8 v5 = [v3 containsPasteboardTypes:v4, v7];

  return v5;
}

- (void)copyTextStorage:(id)a3 selection:(id)a4 toPasteboard:(id)a5 smartCopy:(BOOL)a6 writeAssistant:(id)a7 nativeOnly:(BOOL)a8
{
  uint64_t v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (v17)
  {
    id v18 = v17;
    id v19 = 0;
  }
  else
  {
    id v18 = [(CRLPasteboardController *)self newCopyAssistantWithPasteboard:v16];
    id v19 = v18;
    if (!v18) {
      goto LABEL_42;
    }
  }
  BOOL v58 = a8;
  if (v15)
  {
    id v20 = [v15 visualRangesArray];
  }
  else
  {
    id v21 = [v14 range];
    uint64_t v23 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v21, v22);
    v83 = v23;
    id v20 = +[NSArray arrayWithObjects:&v83 count:1];
  }
  v63 = self;
  v64 = v18;
  id v60 = v16;
  v61 = v20;
  unsigned int v59 = v10;
  v62 = v19;
  if ((unint64_t)[v20 count] < 2)
  {
    id v27 = v14;
    id v24 = [v20 objectAtIndexedSubscript:0];
    uint64_t v40 = (uint64_t)[v24 rangeValue];
    uint64_t v42 = v45;
  }
  else
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v24 = v20;
    id v25 = [v24 countByEnumeratingWithState:&v66 objects:v82 count:16];
    if (v25)
    {
      id v26 = v25;
      id v57 = v15;
      id v27 = 0;
      uint64_t v28 = *(void *)v67;
      id v65 = v14;
      while (1)
      {
        __int16 v29 = 0;
        do
        {
          if (*(void *)v67 != v28) {
            objc_enumerationMutation(v24);
          }
          id v30 = [*(id *)(*((void *)&v66 + 1) + 8 * (void)v29) rangeValue];
          id v32 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", v14, v30, v31);
          if (v32)
          {
            if (v27) {
              goto LABEL_15;
            }
          }
          else
          {
            unsigned int v34 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D57B0);
            }
            long long v35 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              unsigned int v73 = v34;
              __int16 v74 = 2082;
              v75 = "-[CRLPasteboardController copyTextStorage:selection:toPasteboard:smartCopy:writeAssistant:nativeOnly:]";
              __int16 v76 = 2082;
              v77 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m";
              __int16 v78 = 1024;
              int v79 = 1225;
              __int16 v80 = 2082;
              v81 = "innerStorage";
              _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D57D0);
            }
            id v36 = v24;
            long long v37 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              uint64_t v43 = v37;
              long long v44 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              unsigned int v73 = v34;
              __int16 v74 = 2114;
              v75 = v44;
              _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            long long v38 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController copyTextStorage:selection:toPasteboard:smartCopy:writeAssistant:nativeOnly:]");
            long long v39 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v38, v39, 1225, 0, "invalid nil value for '%{public}s'", "innerStorage");

            id v24 = v36;
            id v14 = v65;
            if (v27)
            {
LABEL_15:
              [v27 replaceCharactersIn:[v27 length] withStorage:0 v32];
              id v33 = v27;
              goto LABEL_26;
            }
          }
          id v33 = v32;
          id v27 = v33;
LABEL_26:
          uint64_t v40 = (uint64_t)[v33 range];
          uint64_t v42 = v41;

          __int16 v29 = (char *)v29 + 1;
        }
        while (v26 != v29);
        id v26 = [v24 countByEnumeratingWithState:&v66 objects:v82 count:16];
        if (!v26)
        {
          id v15 = v57;
          id v16 = v60;
          uint64_t v10 = v59;
          goto LABEL_31;
        }
      }
    }
    id v27 = 0;
    uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v42 = 0;
  }
LABEL_31:

  if (v27) {
    id v46 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", v27, v40, v42);
  }
  else {
    id v46 = 0;
  }
  long long v47 = [(CRLPasteboardController *)v63 pasteboardObjectFromAssistant:v64 textStorage:v46 smartCopy:v10];
  if (v47)
  {
    long long v48 = objc_alloc_init(CRLContentDescriptionTranslator);
    long long v49 = -[CRLContentDescriptionTranslator contentDescriptionForTextStorage:range:boardItems:](v48, "contentDescriptionForTextStorage:range:boardItems:", v46, v40, v42, &__NSArray0__struct);
    [v64 setContentDescription:v49];

    long long v50 = v64;
    if (!v58)
    {
      long long v51 = [UTTypeRTF identifier];
      v71 = v51;
      long long v52 = +[NSArray arrayWithObjects:&v71 count:1];
      [v64 setDataProvider:v63 forTypes:v52];

      long long v53 = [UTTypeUTF8PlainText identifier];
      v70 = v53;
      long long v50 = v64;
      long long v54 = +[NSArray arrayWithObjects:&v70 count:1];
      [v64 setDataProvider:v63 forTypes:v54];
    }
    v55 = v62;
    if (!v62)
    {
      uint64_t v56 = objc_opt_class();
      v55 = sub_1002469D0(v56, v50);
    }
    [v55 copyToPasteboardIsSmartCopy:v59];

    id v16 = v60;
  }
  else
  {
    long long v50 = v64;
    v55 = v62;
  }

LABEL_42:
}

- (id)textStorageFromPasteboard:(id)a3 forTargetStorage:(id)a4 smartPaste:(BOOL *)a5
{
  id v7 = -[CRLPasteboardController newReadAssistantWithPasteboard:](self, "newReadAssistantWithPasteboard:", a3, a4);
  id v8 = v7;
  if (!v7)
  {
    id v14 = 0;
    goto LABEL_15;
  }
  id v9 = [v7 pasteboardObject];
  uint64_t v10 = v9;
  if (v9)
  {
    if (a5) {
      *a5 = [v9 isSmartCopyPaste];
    }
    if ([v10 hasNativeText])
    {
      uint64_t v11 = [(CRLPasteboardController *)self delegate];
      id v12 = [v11 boardItemFactoryForPasteboardController:self];

      id v13 = [v10 makeTextboxFromCopiedTextWith:v12];
      id v14 = [v13 textStorage];

LABEL_13:
      goto LABEL_14;
    }
    id v15 = [v10 boardItems];
    id v16 = [v15 count];

    if (v16 == (id)1)
    {
      uint64_t v17 = objc_opt_class();
      id v18 = [v10 boardItems];
      id v19 = [v18 firstObject];
      id v12 = sub_1002469D0(v17, v19);

      if (v12)
      {
        id v14 = [v12 textStorage];
      }
      else
      {
        id v14 = 0;
      }
      goto LABEL_13;
    }
  }
  id v14 = 0;
LABEL_14:

LABEL_15:

  return v14;
}

- (unint64_t)preferredImportableDataTypeOnPasteboard:(id)a3 detectImportableURLsInText:(BOOL)a4
{
  return [(CRLPasteboardController *)self preferredImportableDataTypeOnPasteboard:a3 detectImportableURLsInText:a4 skipFileURLs:0];
}

- (unint64_t)preferredImportableDataTypeOnPasteboard:(id)a3 detectImportableURLsInText:(BOOL)a4 skipFileURLs:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  if ([(CRLPasteboardController *)self hasImportableBoardItemsOnPasteboard:v8 detectImportableURLsInText:v6 skipFileURLs:v5])
  {
    unint64_t v9 = 2;
  }
  else if ([(CRLPasteboardController *)self hasImportableRichTextOnPasteboard:v8])
  {
    unint64_t v9 = 1;
  }
  else if ([(CRLPasteboardController *)self hasImportablePlainTextOnPasteboard:v8])
  {
    unint64_t v9 = 4;
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)promisedUTIsForPasteboard:(id)a3
{
  return 0;
}

- (BOOL)hasNativeTypesOnPasteboard:(id)a3
{
  return [a3 containsNativePasteboardTypes];
}

- (id)descriptionForPasteboard:(id)a3
{
  id v4 = a3;
  id v5 = +[CRLPasteboard generalPasteboard];

  if (v5 == v4)
  {
    id v9 = [v4 changeCount];
    if (v9 != self->_cachedGeneralDescriptionChangeCount)
    {
      int64_t v12 = (int64_t)v9;
      id v7 = +[CRLPasteboardObjectReadAssistant contentDescriptionFrom:v4];
      objc_storeStrong((id *)&self->_cachedGeneralDescription, v7);
      self->_cachedGeneralDescriptionChangeCount = v12;
      goto LABEL_14;
    }
    cachedGeneralDescription = self->_cachedGeneralDescription;
    goto LABEL_10;
  }
  id v6 = +[CRLPasteboard stylePasteboard];

  if (v6 == v4)
  {
    id v11 = [v4 changeCount];
    if (v11 != self->_cachedStyleDescriptionChangeCount)
    {
      int64_t v13 = (int64_t)v11;
      id v7 = +[CRLPasteboardObjectReadAssistant contentDescriptionFrom:v4];
      objc_storeStrong((id *)&self->_cachedStyleDescription, v7);
      self->_cachedStyleDescriptionChangeCount = v13;
      goto LABEL_14;
    }
    cachedGeneralDescription = self->_cachedStyleDescription;
LABEL_10:
    id v7 = cachedGeneralDescription;
    goto LABEL_14;
  }
  id v7 = +[CRLPasteboardObjectReadAssistant contentDescriptionFrom:v4];
  if (!v7)
  {
    if ([v4 containsImportableTextTypes])
    {
      CFStringRef v19 = @"hasText";
      id v20 = &__kCFBooleanTrue;
      id v8 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      CFStringRef v17 = @"text";
      id v18 = v8;
      id v7 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    }
    else
    {
      id v7 = 0;
    }
  }
LABEL_14:
  if (v7) {
    id v14 = v7;
  }
  else {
    id v14 = (NSDictionary *)&__NSDictionary0__struct;
  }
  id v15 = v14;

  return v15;
}

- (id)descriptionsForBoardItemsOnPasteboard:(id)a3
{
  id v3 = [(CRLPasteboardController *)self descriptionForPasteboard:a3];
  id v4 = +[CRLContentDescriptionTranslator descriptionsForBoardItemsInContentDescription:v3];

  return v4;
}

- (id)pasteboardPromise:(id)a3 propertyListForType:(id)a4
{
  id v6 = a4;
  id v7 = [a3 promisedPasteboardObject];
  id v8 = [v7 boardItems];
  id v9 = [v8 count];

  if (v9 == (id)1)
  {
    uint64_t v10 = +[UTType typeWithIdentifier:v6];
    if (!v10) {
      goto LABEL_8;
    }
    id v11 = [v7 boardItems];
    int64_t v12 = [v11 crl_anyObject];
    id v13 = [v12 promisedDataForPublicType:v10];

    if (v13)
    {

      goto LABEL_43;
    }
    if ([v10 conformsToType:UTTypePlainText])
    {
      id v14 = [v7 boardItems];
      id v15 = [v14 crl_anyObject];
      id v13 = [v15 promisedStringForCopy];

      if (v13) {
        goto LABEL_43;
      }
    }
    else
    {
LABEL_8:
    }
  }
  if ([v7 hasNativeText])
  {
    id v16 = [(CRLPasteboardController *)self delegate];
    CFStringRef v17 = [v16 boardItemFactoryForPasteboardController:self];

    id v18 = [v7 makeTextboxFromCopiedTextWith:v17];
    if (v18)
    {
      CFStringRef v19 = [UTTypeUTF8PlainText identifier];
      unsigned int v20 = [v6 isEqualToString:v19];

      if (v20)
      {
        id v21 = [v18 text];
        uint64_t v22 = [v21 string];

        id v13 = [v22 dataUsingEncoding:4 allowLossyConversion:1];
        goto LABEL_25;
      }
      uint64_t v23 = [UTTypeRTF identifier];
      unsigned int v24 = [v6 isEqualToString:v23];

      if (v24)
      {
        id v25 = [v18 text];
        uint64_t v22 = [v25 coreTextAttributedString];

        id v26 = [v22 length];
        NSAttributedStringDocumentAttributeKey v53 = NSDocumentTypeDocumentAttribute;
        NSAttributedStringDocumentType v54 = NSRTFTextDocumentType;
        id v27 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        id v52 = 0;
        [v22 dataFromRange:0 documentAttributes:v26 error:&v52];
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        id v28 = v52;

        if (v28)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          long long v49 = v22;
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D57F0);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010789F4();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D5810);
          }
          __int16 v29 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10106590C(v29);
          }
          id v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController pasteboardPromise:propertyListForType:]");
          uint64_t v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
          +[CRLAssertionHandler handleFailureInFunction:v30, v31, 1572, 0, "Error creating rich text string: %@", v28 file lineNumber isFatal description];

          uint64_t v22 = v49;
        }

LABEL_25:
        if (v13) {
          goto LABEL_43;
        }
        goto LABEL_28;
      }
    }
  }
LABEL_28:
  id v32 = [UTTypePNG identifier];
  unsigned int v33 = [v6 isEqualToString:v32];

  if (v33)
  {
    id v34 = v6;
    long long v35 = objc_opt_class();
    id v36 = [v7 boardItems];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    long long v38 = [v35 additionalBoardItemsForCopyImaging:v36 icc:WeakRetained invertedObjectUUIDMap:self->_invertedObjectUUIDMap];

    invertedObjectUUIDMap = self->_invertedObjectUUIDMap;
    self->_invertedObjectUUIDMap = 0;

    uint64_t v40 = [v7 boardItems];
    uint64_t v41 = [v40 arrayByAddingObjectsFromArray:v38];

    id v50 = v34;
    id v51 = 0;
    unsigned int v42 = [(CRLPasteboardController *)self pImageForBoardItems:v41 imageData:&v51 dataType:&v50 dataName:0];
    id v43 = v51;
    id v44 = v50;

    id v13 = 0;
    if (v42)
    {
      if ([v44 isEqualToString:v34]) {
        id v13 = v43;
      }
      else {
        id v13 = 0;
      }
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5830);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107896C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D5850);
    }
    uint64_t v45 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v45);
    }
    id v46 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController pasteboardPromise:propertyListForType:]");
    long long v47 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v46, v47, 1594, 0, "Request for property list for unsupported pasteboard type %@", v6 file lineNumber isFatal description];

    id v13 = 0;
  }
LABEL_43:

  return v13;
}

- (void)distillPasteboardContentDescription:(id)a3 intoPasteboardStateTypes:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = objc_opt_class();
  if ([v6 hasNativeBoardItemsInContentDescription:v10]) {
    [v5 addObject:@"com.apple.freeform.pasteboardState.hasNativeBoardItems"];
  }
  if ([v6 hasTextStoragesInContentDescription:v10]) {
    [v5 addObject:@"com.apple.freeform.pasteboardState.hasTextStoragesAttachmentsNotAllowed"];
  }
  if ([v6 hasNativeTextInContentDescription:v10]) {
    [v5 addObject:@"com.apple.freeform.pasteboardState.hasNativeText"];
  }
  if ([v6 hasNativeBoardItemsContainingTextInContentDescription:v10]) {
    [v5 addObject:@"com.apple.freeform.pasteboardState.hasNativeBoardItemsContainingText"];
  }
  if ([v6 hasSingleNativeImageBoardItemInContentDescription:v10])
  {
    CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasSingleNativeImageBoardItem";
  }
  else
  {
    if (![v6 hasSingleNativeMovieBoardItemInContentDescription:v10]) {
      goto LABEL_14;
    }
    CFStringRef v7 = @"com.apple.freeform.pasteboardState.hasSingleNativeMovieBoardItem";
  }
  [v5 addObject:v7];
LABEL_14:
  if ([v6 hasOnlyFreehandDrawingBoardItemsInContentDescription:v10]) {
    [v5 addObject:@"com.apple.freeform.pasteboardState.hasOnlyFreehandDrawingBoardItems"];
  }
  if ([v6 hasAnyFreehandDrawingBoardItemsInContentDescription:v10]) {
    [v5 addObject:@"com.apple.freeform.pasteboardState.hasFreehandDrawingBoardItems"];
  }
  if ([v6 hasOnlyNativeTextBoxBoardItemsInContentDescription:v10]) {
    [v5 addObject:@"com.apple.freeform.pasteboardState.hasOnlyNativeTextBoxItems"];
  }
  if ([v6 hasNativeTypesInContentDescription:v10]) {
    [v5 addObject:@"com.apple.freeform.pasteboardState.hasNativeTypes"];
  }
  id v8 = [v6 stringToPrefixForStyleCopyingTypeFromDescription:v10];
  if (v8)
  {
    id v9 = [@"com.apple.freeform.pasteboardState.styleClass-" stringByAppendingString:v8];
    [v5 addObject:v9];
  }
}

+ (BOOL)p_isURLTypeExcludingFileURL:(id)a3
{
  id v3 = +[UTType typeWithIdentifier:a3];
  if ([v3 conformsToType:UTTypeURL]) {
    unsigned int v4 = [v3 conformsToType:UTTypeFileURL] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)pImageForBoardItems:(id)a3 imageData:(id *)a4 dataType:(id *)a5 dataName:(id *)a6
{
  id v10 = a3;
  id v11 = [v10 count];
  id v12 = v11;
  if (a5)
  {
    id v13 = [UTTypePDF identifier];
    unsigned __int8 v14 = [v13 isEqual:*a5];

    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
    if (v11)
    {
LABEL_3:
      [(CRLPasteboardController *)self p_board];
      *(_OWORD *)image = 0u;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v26 = v15;
      id v27 = v10;
      long long v28 = v14;
      image[0] = 0;
      LOBYTE(image[1]) = 0;
      [(CRLPasteboardController *)self pImageInfosWithReadLock:&v26];
      id v16 = *((id *)&v28 + 1);
      CFStringRef v17 = v16;
      if (v16)
      {
        if (a4) {
          *a4 = v16;
        }
        if (a5)
        {
          [UTTypePDF identifier:v26];
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (a6) {
          *a6 = @"CopiedImage.pdf";
        }
        id v18 = image[0];
        if (!image[0]) {
          goto LABEL_26;
        }
      }
      else
      {
        id v18 = image[0];
        if (!image[0])
        {
          BOOL v19 = 0;
          goto LABEL_27;
        }
        if (a5)
        {
          [UTTypePNG identifier:v26];
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (a6) {
          *a6 = @"CopiedImage.png";
        }
        if (a4)
        {
          unsigned int v20 = +[NSMutableDictionary dictionary];
          if (LOBYTE(image[1]))
          {
            id v21 = +[NSNumber numberWithDouble:144.0];
            [v20 setObject:v21 forKeyedSubscript:kCGImagePropertyDPIWidth];

            uint64_t v22 = +[NSNumber numberWithDouble:144.0];
            [v20 setObject:v22 forKeyedSubscript:kCGImagePropertyDPIHeight];
          }
          uint64_t v23 = sub_10047EBD0(v18, v20);
          unsigned int v24 = v23;
          if (v23) {
            *a4 = v23;
          }
        }
      }
      CGImageRelease(v18);
LABEL_26:
      BOOL v19 = 1;
LABEL_27:

      goto LABEL_28;
    }
  }
  BOOL v19 = 0;
LABEL_28:

  return v19;
}

- (void)pImageInfosWithReadLock:(id *)a3
{
  unsigned int v4 = [[CRLCanvasImager alloc] initWithBoard:a3->var0];
  id v5 = v4;
  if (v4)
  {
    [(CRLCanvasImager *)v4 setInfos:a3->var1];
    if (a3->var2)
    {
      id v6 = [(CRLCanvasImager *)v5 pdfData];
      id var3 = a3->var3;
      a3->id var3 = v6;
    }
    if (!a3->var3)
    {
      if ([a3->var1 count] != (id)1) {
        goto LABEL_17;
      }
      id v8 = [a3->var1 objectAtIndexedSubscript:0];
      [v8 viewScaleToUseWhenRasterizingSingleBoardItemForCopy];
      double v10 = v9;

      if (v10 < 0.0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5870);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_101078A7C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D5890);
        }
        id v11 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v11);
        }
        id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController pImageInfosWithReadLock:]");
        id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:1790 isFatal:0 description:"requestedViewScale should never be negative."];
      }
      if (v10 > 0.0)
      {
        [(CRLCanvasImager *)v5 setViewScale:v10];
        BOOL v14 = 0;
      }
      else
      {
LABEL_17:
        [(CRLCanvasImager *)v5 setContentsScale:2.0];
        BOOL v14 = 1;
      }
      a3->var5 = v14;
      [(CRLCanvasImager *)v5 setMaximumImagePixelSize:sub_100454A70()];
      a3->var4 = [(CRLCanvasImager *)v5 newImage];
    }
  }
}

- (int64_t)p_integerFromPasteboardStateTypePrefix:(id)a3 pasteboard:(id)a4
{
  id v5 = a3;
  int64_t v23 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [a4 pasteboardTypes];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
      if ([v11 hasPrefix:v5]) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = [objc_alloc((Class)NSScanner) initWithString:v11];
    [v13 scanString:v5 intoString:0];
    if ([v13 scanInteger:&v23])
    {
      if ([v13 isAtEnd])
      {
LABEL_31:

        int64_t v12 = v23;
        goto LABEL_32;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D58F0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101078B0C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D5910);
      }
      BOOL v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v14);
      }
      id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController p_integerFromPasteboardStateTypePrefix:pasteboard:]");
      id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v15, v16, 1827, 0, "Expected scanner to be at end from pasteboard state type \"%@\".", v11 file lineNumber isFatal description];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D58B0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101078B94();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D58D0);
      }
      CFStringRef v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v17);
      }
      id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardController p_integerFromPasteboardStateTypePrefix:pasteboard:]");
      id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPasteboardController.m"];
      +[CRLAssertionHandler handleFailureInFunction:v15, v16, 1825, 0, "Expected scanner to read integer from pasteboard state type \"%@\".", v11 file lineNumber isFatal description];
    }

    goto LABEL_31;
  }
LABEL_9:

  int64_t v12 = 0;
LABEL_32:

  return v12;
}

+ (id)pFilteredPasteboardTypesForPasteboard:(id)a3 types:(id)a4
{
  unsigned int v4 = [a4 crl_arrayOfObjectsPassingTest:&stru_1014D5950];
  id v5 = [objc_opt_class() p_movePublicURLBeforePlainTextIfNeededInTypes:v4];

  return v5;
}

+ (BOOL)p_pasteboardHasPlainAndRichHyperlink:(id)a3
{
  id v3 = [a3 pasteboardTypes];
  unsigned int v4 = [UTTypeURL identifier];
  id v5 = [v3 indexOfObject:v4];

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = [v3 indexOfObject:@"public.url-name"];
    BOOL v6 = 0;
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = v7;
      if (v5 < v7)
      {
        uint64_t v9 = [UTTypeRTF identifier];
        id v10 = [v3 indexOfObject:v9];

        BOOL v6 = v10 != (id)0x7FFFFFFFFFFFFFFFLL && v8 < v10;
      }
    }
  }

  return v6;
}

+ (id)p_movePublicURLBeforePlainTextIfNeededInTypes:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [UTTypeURL identifier];
  id v5 = [v3 indexOfObject:v4];

  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v6 = [UTTypeUTF8PlainText identifier];
    id v7 = [v3 indexOfObject:v6];

    id v8 = [v3 indexOfObject:@"public.url-name"];
    id v9 = v7 >= v8 ? v8 : v7;
    if (v7 != (id)0x7FFFFFFFFFFFFFFFLL && v5 > v9)
    {
      id v11 = [v3 mutableCopy];
      int64_t v12 = [v3 objectAtIndexedSubscript:v5];
      [v11 removeObjectAtIndex:v5];
      [v11 insertObject:v12 atIndex:v9];

      id v3 = v11;
    }
  }

  return v3;
}

- (CRLPasteboardControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRLPasteboardControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_invertedObjectUUIDMap, 0);
  objc_destroyWeak((id *)&self->_icc);
  objc_storeStrong((id *)&self->_cachedStyleDescription, 0);

  objc_storeStrong((id *)&self->_cachedGeneralDescription, 0);
}

- (void)copyStyleFromItem:(id)a3 to:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100897CB0((uint64_t)v8, (uint64_t)v6);

  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v8);
}

- (BOOL)containsStylesRelevantTo:(id)a3 on:(id)a4
{
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  id v8 = self;
  char v9 = sub_100897EA8(v6, (uint64_t)v7);

  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (id)commandsToPasteStyleTo:(id)a3 from:(id)a4
{
  type metadata accessor for CRLStyledItem();
  sub_10089B5CC();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  id v8 = self;
  sub_10089817C(v6, (uint64_t)v7);

  swift_bridgeObjectRelease();
  type metadata accessor for CRLCommand();
  v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (id)commandsToPasteTextStyleTo:(id)a3 in:(_NSRange)a4 from:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSArray v9 = (char *)a3;
  id v10 = a5;
  id v11 = self;
  sub_10089A0A0(v9, location, length, (uint64_t)v10);

  type metadata accessor for CRLCommand();
  v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

+ (id)providersForBoardItemsAndTextWithBoardItemFactory:(id)a3 keepHighlights:(BOOL)a4 fromPasteboardObject:(id)a5 descriptionsForBoardItems:(id)a6 validGeometries:(BOOL *)a7
{
  BOOL v9 = a4;
  sub_1005057FC(&qword_1016850E0);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a5;
  sub_10089AC9C((uint64_t)v12, v9, (uint64_t)v13, v11, a7);

  swift_bridgeObjectRelease();
  sub_1005057FC(&qword_1016850E8);
  v14.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v14.super.isa;
}

+ (void)cacheWithBoardItems:(id)a3
{
  type metadata accessor for CRLBoardItem(0);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10089B07C(v3);

  swift_bridgeObjectRelease();
}

@end