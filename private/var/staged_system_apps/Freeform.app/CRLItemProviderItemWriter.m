@interface CRLItemProviderItemWriter
- (id)createItemProviderWithCopyOfBoardItems:(id)a3 fromInteractiveCanvasController:(id)a4 outCopiedBoardItems:(id *)a5;
- (id)itemProviderWithStorage:(id)a3 selection:(id)a4 boardItems:(id)a5 styleProvider:(id)a6 inIsSmart:(BOOL)a7 pasteboardController:(id)a8;
- (void)writeContentDescription:(id)a3 toItemProvider:(id)a4 pasteboardController:(id)a5;
@end

@implementation CRLItemProviderItemWriter

- (id)createItemProviderWithCopyOfBoardItems:(id)a3 fromInteractiveCanvasController:(id)a4 outCopiedBoardItems:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v66 = v7;
  if (![v7 count])
  {
    id v72 = 0;
    goto LABEL_75;
  }
  v58 = self;
  id v72 = objc_alloc_init((Class)NSItemProvider);
  v67 = v8;
  v9 = [v8 editingCoordinator];
  v61 = [v9 boardItemFactory];

  v10 = [v8 board];
  v64 = v10;
  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CEFA8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106CAC8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CEFC8);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106CA20(v11);
    }
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLItemProviderItemWriter createItemProviderWithCopyOfBoardItems:fromInteractiveCanvasController:outCopiedBoardItems:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLItemProviderItemWriter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 36, 0, "invalid nil value for '%{public}s'", "board");

    v10 = 0;
  }
  v65 = [v10 store];
  v14 = [_TtC8Freeform19CRLPasteboardObject alloc];
  v15 = [v65 crdtContext];
  v62 = [(CRLPasteboardObject *)v14 initWithContext:v15];

  v16 = [_TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant alloc];
  v17 = [v65 crdtContext];
  v63 = [(CRLPasteboardObjectItemProviderWriteAssistant *)v16 initWithStore:v65 context:v17];

  if (!v63) {
    goto LABEL_41;
  }
  v59 = +[CRLPasteboardController boardItemsForCopyByFixingUpBoardItems:v7 boardItemFactory:v61 board:v64];
  id v70 = [v61 makeDuplicateOfBoardItems:v59];
  if (!v70)
  {

LABEL_41:
    if (qword_101719A68 != -1) {
      dispatch_once(&qword_101719A68, &stru_1014CF050);
    }
    v38 = off_10166B498;
    if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
      sub_10106C7F0(v38);
    }
    goto LABEL_45;
  }
  if (v8)
  {
    id v18 = [v7 count];
    if (v18 != [v70 count])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEFE8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106C98C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CF008);
      }
      v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106C8E4(v19);
      }
      v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLItemProviderItemWriter createItemProviderWithCopyOfBoardItems:fromInteractiveCanvasController:outCopiedBoardItems:]");
      v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLItemProviderItemWriter.m"];
      +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:56 isFatal:0 description:"Somehow didn't end up with the same number of board items"];
    }
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v22 = v7;
    id v23 = [v22 countByEnumeratingWithState:&v96 objects:v101 count:16];
    if (v23)
    {
      uint64_t v24 = 0;
      uint64_t v25 = *(void *)v97;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v97 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v96 + 1) + 8 * i);
          v28 = [v70 objectAtIndexedSubscript:(char *)i + v24];
          v29 = [v67 layoutForInfo:v27];
          long long v94 = 0u;
          long long v95 = 0u;
          long long v93 = 0u;
          v30 = [v29 parent];
          v31 = [v30 geometryInRoot];
          v32 = v31;
          if (v31)
          {
            [v31 transform];
          }
          else
          {
            long long v94 = 0u;
            long long v95 = 0u;
            long long v93 = 0u;
          }

          long long v90 = v93;
          long long v91 = v94;
          long long v92 = v95;
          [v29 transferLayoutGeometryToInfo:v28 withAdditionalTransform:&v90 assertIfInDocument:1];
        }
        id v23 = [v22 countByEnumeratingWithState:&v96 objects:v101 count:16];
        v24 += (uint64_t)i;
      }
      while (v23);
    }
  }
  [(CRLPasteboardObject *)v62 setBoardItems:v70];
  if (a5) {
    *a5 = v70;
  }
  v33 = objc_alloc_init(CRLContentDescriptionTranslator);
  v34 = [(CRLContentDescriptionTranslator *)v33 contentDescriptionForBoardItems:v7];
  v35 = [v67 canvasEditor];
  v36 = [v35 pasteboardController];
  [(CRLItemProviderItemWriter *)v58 writeContentDescription:v34 toItemProvider:v72 pasteboardController:v36];

  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_100062AAC;
  v88[3] = &unk_1014CF030;
  v37 = dispatch_semaphore_create(0);
  v89 = v37;
  [(CRLPasteboardObjectItemProviderWriteAssistant *)v63 writePasteboardObject:v62 to:v72 completionHandler:v88];
  dispatch_semaphore_wait(v37, 0xFFFFFFFFFFFFFFFFLL);

LABEL_45:
  if ([v7 count] == (id)1)
  {
    v39 = [v7 firstObject];
    v69 = [v39 promisedStringForCopy];
  }
  else
  {
    v69 = 0;
  }
  if ([v7 count] == (id)1)
  {
    id v71 = [v7 firstObject];
    v40 = [v71 customPublicTypesToPromiseWhenCopyingSingleBoardItem];
    id v41 = [v40 count];
    BOOL v60 = v41 != 0;
    if (v41)
    {
      v42 = [v71 suggestedNameWhenDraggingSingleBoardItem];
      if (v42) {
        [v72 setSuggestedName:v42];
      }
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v43 = v40;
    id v44 = [v43 countByEnumeratingWithState:&v84 objects:v100 count:16];
    if (v44)
    {
      uint64_t v45 = *(void *)v85;
      do
      {
        for (j = 0; j != v44; j = (char *)j + 1)
        {
          if (*(void *)v85 != v45) {
            objc_enumerationMutation(v43);
          }
          v47 = *(void **)(*((void *)&v84 + 1) + 8 * (void)j);
          v48 = [UTTypePlainText identifier];
          if (objc_msgSend(v47, "crl_conformsToUTI:", v48))
          {
            BOOL v49 = [v69 length] == 0;

            if (!v49) {
              continue;
            }
          }
          else
          {
          }
          v82[0] = _NSConcreteStackBlock;
          v82[1] = 3221225472;
          v82[2] = sub_100062AF8;
          v82[3] = &unk_1014CF0F8;
          v82[4] = v47;
          id v83 = v71;
          [v72 registerDataRepresentationForTypeIdentifier:v47 visibility:0 loadHandler:v82];
        }
        id v44 = [v43 countByEnumeratingWithState:&v84 objects:v100 count:16];
      }
      while (v44);
    }
  }
  else
  {
    BOOL v60 = 0;
  }
  if ([v69 length]) {
    char v50 = 1;
  }
  else {
    char v50 = v60;
  }
  if ((v50 & 1) == 0)
  {
    *(void *)&long long v93 = 0;
    *((void *)&v93 + 1) = &v93;
    long long v94 = 0x2020000000uLL;
    *(void *)&long long v90 = 0;
    *((void *)&v90 + 1) = &v90;
    *(void *)&long long v91 = 0x2020000000;
    BYTE8(v91) = 0;
    dispatch_semaphore_t v51 = dispatch_semaphore_create(0);
    v52 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100062FB4;
    block[3] = &unk_1014CF160;
    block[4] = v64;
    block[5] = v62;
    v80 = &v90;
    v81 = &v93;
    v53 = v51;
    v79 = v53;
    dispatch_async(v52, block);
    v54 = [UTTypePNG identifier];
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_100063290;
    v74[3] = &unk_1014CF188;
    v55 = v53;
    v75 = v55;
    v76 = &v93;
    v77 = &v90;
    [v72 registerDataRepresentationForTypeIdentifier:v54 visibility:0 loadHandler:v74];

    _Block_object_dispose(&v90, 8);
    _Block_object_dispose(&v93, 8);
  }
  if ([v69 length])
  {
    v56 = [UTTypeUTF8PlainText identifier];
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_1000634B4;
    v73[3] = &unk_1014CF1F0;
    v73[4] = v69;
    [v72 registerDataRepresentationForTypeIdentifier:v56 visibility:0 loadHandler:v73];
  }
  id v8 = v67;
LABEL_75:

  return v72;
}

- (id)itemProviderWithStorage:(id)a3 selection:(id)a4 boardItems:(id)a5 styleProvider:(id)a6 inIsSmart:(BOOL)a7 pasteboardController:(id)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  if ([v14 isRange])
  {
    id v17 = [v14 range];
    uint64_t v19 = v18;
    id v20 = objc_alloc_init((Class)NSItemProvider);
    if (v19)
    {
      id v43 = v17;
      id v21 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", v13, v17, v19);
      if ([v21 length])
      {
        [v16 delegate];
        id v22 = v44 = v15;
        v42 = [v22 sourceContextForPasteboardController:v16];

        id v23 = [_TtC8Freeform19CRLPasteboardObject alloc];
        uint64_t v24 = [v42 sourceContext];
        v40 = [(CRLPasteboardObject *)v23 initWithContext:v24];

        [(CRLPasteboardObject *)v40 copyTextFrom:v21];
        [(CRLPasteboardObject *)v40 setIsSmartCopyPaste:v9];
        uint64_t v25 = objc_alloc_init(CRLContentDescriptionTranslator);
        id v41 = v25;
        id v27 = [v21 range];
        if (v44) {
          v28 = v44;
        }
        else {
          v28 = &__NSArray0__struct;
        }
        v39 = -[CRLContentDescriptionTranslator contentDescriptionForTextStorage:range:boardItems:](v25, "contentDescriptionForTextStorage:range:boardItems:", v21, v27, v26, v28);
        [(CRLItemProviderItemWriter *)self writeContentDescription:v39 toItemProvider:v20 pasteboardController:v16];
        v29 = [_TtC8Freeform45CRLPasteboardObjectItemProviderWriteAssistant alloc];
        v30 = [v42 sourceStore];
        v31 = [v42 sourceContext];
        v32 = [(CRLPasteboardObjectItemProviderWriteAssistant *)v29 initWithStore:v30 context:v31];

        id v15 = v44;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_100063AA4;
        v46[3] = &unk_1014CF030;
        v33 = dispatch_semaphore_create(0);
        v47 = v33;
        [(CRLPasteboardObjectItemProviderWriteAssistant *)v32 writePasteboardObject:v40 to:v20 completionHandler:v46];
        dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
      }
      id v17 = v43;
    }
    v34 = [v13 coreTextAttributedString];
    v35 = [v34 attributedSubstringFromRange:v17, v19];

    if ([v35 length])
    {
      v36 = [UTTypeRTF identifier];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100063AAC;
      v45[3] = &unk_1014CF1F0;
      v45[4] = v35;
      [v20 registerDataRepresentationForTypeIdentifier:v36 visibility:0 loadHandler:v45];
    }
    v37 = [v13 substringWithRange:v17, v19];
    if ([v37 length]) {
      [v20 registerObject:v37 visibility:0];
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)writeContentDescription:(id)a3 toItemProvider:(id)a4 pasteboardController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  [v9 distillPasteboardContentDescription:v7 intoPasteboardStateTypes:v10];
  v11 = +[NSKeyedArchiver crl_securelyArchiveRoot:v10];
  [v8 setTeamData:v11];
}

@end