@interface CRLPasteboardItemSource
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
- (CRLPasteboard)pasteboard;
- (CRLPasteboardController)pasteboardController;
- (CRLPasteboardItemSource)init;
- (CRLPasteboardItemSource)initWithPasteboard:(id)a3 pasteboardController:(id)a4;
- (id)cancellationHandler;
- (id)loadImportedImagesForAssetOwner:(id)a3 compatibilityAlertPresenter:(id)a4 withHandler:(id)a5;
- (id)loadImportedRichTextStringWithHandler:(id)a3;
- (id)loadImportedTextStringWithHandler:(id)a3;
- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 WithLoadHandler:(id)a4;
- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 maximumStringLength:(unint64_t)a4 WithLoadHandler:(id)a5;
- (id)loadProvidersForNativeBoardItemsWithBoardItemFactory:(id)a3 loadHandler:(id)a4;
- (id)loadTextStorageUsingBoardItemFactory:(id)a3 forTargetContext:(id)a4 targetStorage:(id)a5 loadHandler:(id)a6;
- (unint64_t)itemCount;
- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3;
- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3 skipFileURLs:(BOOL)a4;
- (void)setCancellationHandler:(id)a3;
@end

@implementation CRLPasteboardItemSource

- (CRLPasteboardItemSource)initWithPasteboard:(id)a3 pasteboardController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRLPasteboardItemSource;
  v9 = [(CRLPasteboardItemSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_pbController, v8);
    objc_storeStrong((id *)&v10->_pasteboard, a3);
  }

  return v10;
}

- (CRLPasteboardItemSource)init
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101500E10);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    unsigned int v12 = v2;
    __int16 v13 = 2082;
    v14 = "-[CRLPasteboardItemSource init]";
    __int16 v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPasteboardItemSource.m";
    __int16 v17 = 1024;
    int v18 = 48;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_101500E30);
  }
  v4 = off_10166B4A0;
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
  id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardItemSource init]");
  id v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPasteboardItemSource.m"];
  +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:48 isFatal:0 description:"Do not call method"];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[CRLPasteboardItemSource init]");
  id v10 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (unint64_t)itemCount
{
  return [(CRLPasteboard *)self->_pasteboard numberOfItems];
}

- (BOOL)canLoadItemsOfClass:(Class)a3
{
  v4 = [(CRLPasteboardItemSource *)self pasteboard];
  LOBYTE(a3) = [v4 canLoadItemsOfClass:a3];

  return (char)a3;
}

- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3 skipFileURLs:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(CRLPasteboardItemSource *)self pasteboardController];
  id v8 = [(CRLPasteboardItemSource *)self pasteboard];
  id v9 = [v7 preferredImportableDataTypeOnPasteboard:v8 detectImportableURLsInText:v5 skipFileURLs:v4];

  return (unint64_t)v9;
}

- (unint64_t)preferredImportableDataTypeDetectingImportableURLsInText:(BOOL)a3
{
  return [(CRLPasteboardItemSource *)self preferredImportableDataTypeDetectingImportableURLsInText:a3 skipFileURLs:0];
}

- (BOOL)hasImportableImages
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  BOOL v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasImportableImagesOnPasteboard:v4 skipFileURLs:0];

  return v5;
}

- (BOOL)hasImportableBoardItemsDetectingImportableURLsInText:(BOOL)a3 skipFileURLs:(BOOL)a4
{
  uint64_t v4 = a4;
  BOOL v5 = a3;
  id v7 = [(CRLPasteboardItemSource *)self pasteboardController];
  id v8 = [(CRLPasteboardItemSource *)self pasteboard];
  LOBYTE(v4) = [v7 hasImportableBoardItemsOnPasteboard:v8 detectImportableURLsInText:v5 skipFileURLs:v4];

  return v4;
}

- (BOOL)hasImportableBoardItemsDetectingImportableURLsInText:(BOOL)a3
{
  return [(CRLPasteboardItemSource *)self hasImportableBoardItemsDetectingImportableURLsInText:a3 skipFileURLs:0];
}

- (BOOL)hasImportableText
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasImportablePlainTextOnPasteboard:v4];

  return v5;
}

- (BOOL)hasImportableRichText
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasImportableRichTextOnPasteboard:v4];

  return v5;
}

- (id)loadImportedRichTextStringWithHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void))a3;
  unsigned __int8 v9 = 0;
  unsigned __int8 v5 = [(CRLPasteboardItemSource *)self pasteboardController];
  v6 = [(CRLPasteboardItemSource *)self pasteboard];
  id v7 = [v5 importedRichTextStringFromPasteboard:v6 smartPaste:&v9];

  if (v4) {
    v4[2](v4, v7, v9);
  }

  return 0;
}

- (id)loadImportedTextStringWithHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void))a3;
  unsigned __int8 v9 = 0;
  unsigned __int8 v5 = [(CRLPasteboardItemSource *)self pasteboardController];
  v6 = [(CRLPasteboardItemSource *)self pasteboard];
  id v7 = [v5 importedTextStringFromPasteboard:v6 smartPaste:&v9];

  if (v4) {
    v4[2](v4, v7, v9);
  }

  return 0;
}

- (BOOL)hasNativeTypes
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasNativeTypesOnPasteboard:v4];

  return v5;
}

- (BOOL)hasNativeBoardItems
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasNativeBoardItemsOnPasteboard:v4];

  return v5;
}

- (BOOL)canProduceBoardItems
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500E50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BE7E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500E70);
    }
    uint64_t v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    unsigned __int8 v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardItemSource canProduceBoardItems]");
    v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPasteboardItemSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 139, 0, "invalid nil value for '%{public}s'", "self.pasteboardController");
  }
  id v7 = [(CRLPasteboardItemSource *)self pasteboardController];
  id v8 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v9 = [v7 canProduceBoardItemsFromPasteboard:v8];

  return v9;
}

- (BOOL)hasSingleNativeImageBoardItem
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasSingleNativeImageBoardItemOnPasteboard:v4];

  return v5;
}

- (BOOL)hasSingleNativeMovieBoardItem
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasSingleNativeMovieBoardItemOnPasteboard:v4];

  return v5;
}

- (BOOL)hasOnlyNativeFreehandDrawingBoardItems
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasOnlyNativeFreehandDrawingBoardItemsOnPasteboard:v4];

  return v5;
}

- (BOOL)hasNativeFreehandDrawingBoardItems
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasNativeFreehandDrawingBoardItemsOnPasteboard:v4];

  return v5;
}

- (BOOL)hasOnlyNativeTextBoxItems
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasOnlyNativeTextBoxItemsOnPasteboard:v4];

  return v5;
}

- (BOOL)hasNativeTextStorages
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasTextStoragesOnPasteboard:v4];

  return v5;
}

- (BOOL)hasNativeText
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasNativeTextOnPasteboard:v4];

  return v5;
}

- (BOOL)hasNativeBoardItemsContainingText
{
  v3 = [(CRLPasteboardItemSource *)self pasteboardController];
  uint64_t v4 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned __int8 v5 = [v3 hasNativeBoardItemsContainingTextOnPasteboard:v4];

  return v5;
}

- (id)loadTextStorageUsingBoardItemFactory:(id)a3 forTargetContext:(id)a4 targetStorage:(id)a5 loadHandler:(id)a6
{
  id v8 = (void (**)(id, void *, void))a6;
  unsigned __int8 v14 = 0;
  id v9 = a5;
  id v10 = [(CRLPasteboardItemSource *)self pasteboardController];
  v11 = [(CRLPasteboardItemSource *)self pasteboard];
  unsigned int v12 = [v10 textStorageFromPasteboard:v11 forTargetStorage:v9 smartPaste:&v14];

  if (v8) {
    v8[2](v8, v12, v14);
  }

  return 0;
}

- (id)loadProvidersForNativeBoardItemsWithBoardItemFactory:(id)a3 loadHandler:(id)a4
{
  unsigned __int8 v5 = (void (**)(id, void *, void *))a4;
  v6 = [(CRLPasteboardItemSource *)self pasteboardController];
  id v7 = [(CRLPasteboardItemSource *)self pasteboard];
  id v8 = [v6 providersForBoardItemsFromPasteboard:v7];

  if (v5) {
    v5[2](v5, v8, &__NSArray0__struct);
  }

  return 0;
}

- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 WithLoadHandler:(id)a4
{
  unsigned __int8 v5 = (void (**)(id, void *))a4;
  v6 = [(CRLPasteboardItemSource *)self pasteboardController];
  id v7 = [(CRLPasteboardItemSource *)self pasteboard];
  id v8 = [v6 providersForBoardItemsImportedFromPasteboard:v7];

  if (v5) {
    v5[2](v5, v8);
  }

  return 0;
}

- (id)loadProvidersForImportedBoardItemsUsingBoardItemFactory:(id)a3 maximumStringLength:(unint64_t)a4 WithLoadHandler:(id)a5
{
  v6 = (void (**)(id, void *))a5;
  id v7 = [(CRLPasteboardItemSource *)self pasteboardController];
  id v8 = [(CRLPasteboardItemSource *)self pasteboard];
  id v9 = [v7 providersForBoardItemsImportedFromPasteboard:v8];

  if (v6) {
    v6[2](v6, v9);
  }

  return 0;
}

- (id)loadImportedImagesForAssetOwner:(id)a3 compatibilityAlertPresenter:(id)a4 withHandler:(id)a5
{
  id v52 = a3;
  id v51 = a4;
  id v48 = a5;
  id v8 = &off_1014C1000;
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500E90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BE928();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500EB0);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardItemSource loadImportedImagesForAssetOwner:compatibilityAlertPresenter:withHandler:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPasteboardItemSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:232 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  uint64_t v55 = +[CRLIngestionTypes supportedImageTypes];
  dispatch_group_t v12 = dispatch_group_create();
  __int16 v13 = +[NSMutableArray array];
  unsigned __int8 v14 = +[NSMutableArray array];
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_1004ED724;
  v67[3] = &unk_101500F18;
  id v47 = v13;
  id v68 = v47;
  id v45 = v14;
  id v69 = v45;
  dispatch_group_t group = v12;
  dispatch_group_t v70 = group;
  v49 = objc_retainBlock(v67);
  if ((id)[(CRLPasteboard *)self->_pasteboard numberOfItems] != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500F38);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BE894();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101500F58);
    }
    __int16 v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPasteboardItemSource loadImportedImagesForAssetOwner:compatibilityAlertPresenter:withHandler:]", v45);
    __int16 v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPasteboardItemSource.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:255 isFatal:0 description:"More than one item detected on the pasteboard for image fill. Currently only single items are supported."];
  }
  int v18 = (void *)v55;
  if ([(CRLPasteboard *)self->_pasteboard numberOfItems] >= 1)
  {
    uint64_t v19 = 0;
    v20 = UTTypeURL;
    v21 = &off_1014C1000;
    v54 = self;
    do
    {
      uint64_t v53 = v19;
      v57 = +[NSIndexSet indexSetWithIndex:v19];
      v22 = -[CRLPasteboard pasteboardTypesForItemSet:](self->_pasteboard, "pasteboardTypesForItemSet:");
      v23 = [v22 firstObject];

      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id obj = v23;
      id v24 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v64;
        while (2)
        {
          v27 = 0;
          id v56 = v25;
          do
          {
            if (*(void *)v64 != v26) {
              objc_enumerationMutation(obj);
            }
            v28 = *(void **)(*((void *)&v63 + 1) + 8 * (void)v27);
            v29 = [(__objc2_class *)v21[321] typeWithIdentifier:v28];
            if (objc_msgSend(v28, "crl_conformsToAnyUTI:", v18))
            {
              dispatch_group_enter(group);
              v39 = [(CRLPasteboard *)self->_pasteboard dataForPasteboardType:v28 inItemSet:v57];
              v35 = [v39 firstObject];

              v32 = [[CRLImageFillProvider alloc] initWithData:v35 type:v28];
              [(CRLImageFillProvider *)v32 provideImageDataForAssetOwner:v52 compatibilityAlertPresenter:v51 completionHandler:v49];
LABEL_44:

              goto LABEL_45;
            }
            if ([v29 conformsToType:v20])
            {
              v30 = v20;
              v31 = [(CRLPasteboard *)self->_pasteboard dataForPasteboardType:v28 inItemSet:v57];
              v32 = [v31 firstObject];

              if (v32)
              {
                v33 = (CRLImageFillProvider *)[objc_alloc(v8[107]) initWithData:v32 encoding:4];
                if (v33)
                {
                  v34 = +[NSURL URLWithString:v33];
                  if (v34)
                  {
                    v35 = v34;
                    if ([(CRLImageFillProvider *)v34 isFileURL])
                    {
                      v36 = [(CRLImageFillProvider *)v35 crl_fileTypeIdentifierHandlingFileCoordinationPromises];
                    }
                    else
                    {
                      v36 = 0;
                    }
                    v37 = [v36 identifier];
                    unsigned int v38 = [v37 crl_conformsToAnyUTI:v55];

                    if (v38)
                    {
                      dispatch_group_enter(group);
                      +[CRLImageFillProvider makeCompatibleImageFillDataFromURL:v35 forAssetOwner:v52 modalOperationPresenter:v51 compatibilityAlertPresenter:v51 completionHandler:v49];

                      self = v54;
                      int v18 = (void *)v55;
                      id v8 = &off_1014C1000;
                      v20 = v30;
                      v21 = &off_1014C1000;
                      goto LABEL_44;
                    }

                    v33 = v32;
                    v32 = v35;
                    self = v54;
                    int v18 = (void *)v55;
                    id v8 = &off_1014C1000;
                  }
                }
              }
              else
              {
                v33 = 0;
              }

              v20 = v30;
              v21 = &off_1014C1000;
              id v25 = v56;
            }

            v27 = (char *)v27 + 1;
          }
          while (v25 != v27);
          id v25 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }
LABEL_45:

      uint64_t v19 = v53 + 1;
    }
    while (v53 + 1 < [(CRLPasteboard *)self->_pasteboard numberOfItems]);
  }
  v40 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004ED9D8;
  block[3] = &unk_1014D7D28;
  id v60 = v47;
  id v61 = v46;
  id v62 = v48;
  id v41 = v46;
  id v42 = v47;
  id v43 = v48;
  dispatch_group_notify(group, v40, block);

  return 0;
}

- (CRLPasteboard)pasteboard
{
  return self->_pasteboard;
}

- (CRLPasteboardController)pasteboardController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pbController);

  return (CRLPasteboardController *)WeakRetained;
}

- (id)cancellationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCancellationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationHandler, 0);
  objc_storeStrong((id *)&self->_pasteboard, 0);

  objc_destroyWeak((id *)&self->_pbController);
}

@end