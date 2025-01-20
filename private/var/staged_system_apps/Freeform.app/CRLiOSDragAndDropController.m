@interface CRLiOSDragAndDropController
- (BOOL)canCreateBoardItemsFromDragInfo:(id)a3;
- (BOOL)insertBoardItemsForDragInfo:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5;
- (BOOL)shouldCleanupAfterSuccessfulDragOperation;
- (id)nativeProvidersForDynamicDragInsertionWithDragInfo:(id)a3;
- (void)cleanupEndOfDragOperation;
- (void)dealloc;
- (void)p_transitionToItemPromiseState:(unint64_t)a3;
@end

@implementation CRLiOSDragAndDropController

- (void)dealloc
{
  if (self->_itemPromiseState != 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE880);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106BB3C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CE8A0);
    }
    v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:38 isFatal:0 description:"Did not properly clean up drag and drop!"];
  }
  ignoringUserInteractionWrapper = self->_ignoringUserInteractionWrapper;
  if (ignoringUserInteractionWrapper) {
    [(CRLiOSWindowIgnoreUserInteractionSafeWrapper *)ignoringUserInteractionWrapper endIgnoringUserInteractionSafely];
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSDragAndDropController;
  [(CRLDragAndDropController *)&v7 dealloc];
}

- (id)nativeProvidersForDynamicDragInsertionWithDragInfo:(id)a3
{
  return 0;
}

- (BOOL)canCreateBoardItemsFromDragInfo:(id)a3
{
  v3 = [a3 itemSource];
  unsigned __int8 v4 = [v3 canProduceBoardItems];

  return v4;
}

- (BOOL)shouldCleanupAfterSuccessfulDragOperation
{
  if (self->_itemPromiseState == 2) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSDragAndDropController;
  return [(CRLDragAndDropController *)&v3 shouldCleanupAfterSuccessfulDragOperation];
}

- (BOOL)insertBoardItemsForDragInfo:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v9 = a5;
  v10 = [a3 itemSource];
  v11 = [(CRLDragAndDropController *)self interactiveCanvasController];
  v12 = [v11 editingCoordinator];
  v13 = [v12 followCoordinator];
  [v13 endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:1];

  v14 = [(CRLDragAndDropController *)self interactiveCanvasController];
  v15 = [v14 layerHost];
  v16 = [v15 asiOSCVC];

  v17 = [v16 delegate];
  v18 = [v17 currentDocumentMode];

  if ([v18 wantsToEndForDragAndDropInteractions])
  {
    v19 = [v18 boardViewController];
    v20 = [v19 documentModeController];
    [v20 resetToDefaultModeAnimated:1];
  }
  if ([v10 hasNativeBoardItems])
  {
    v21 = [(CRLDragAndDropController *)self interactiveCanvasController];
    v22 = [v21 editingCoordinator];
    v23 = [v22 boardItemFactory];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_10005B2D0;
    v57[3] = &unk_1014CE910;
    v57[4] = self;
    CGFloat v59 = x;
    CGFloat v60 = y;
    id v58 = v9;
    v24 = [v10 loadProvidersForNativeBoardItemsWithBoardItemFactory:v23 loadHandler:v57];

    if (!v24)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CE930);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106BBC4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CE950);
      }
      v25 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v25);
      }
      v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController insertBoardItemsForDragInfo:atPoint:onRep:]");
      v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 94, 0, "invalid nil value for '%{public}s'", "progress");
    }
  }
  else
  {
    v47 = v9;
    unsigned int v28 = [v10 hasNativeTextStorages];
    v29 = [(CRLDragAndDropController *)self interactiveCanvasController];
    v30 = [v29 editingCoordinator];
    v31 = [v30 boardItemFactory];
    if (v28)
    {

      v32 = [(CRLDragAndDropController *)self interactiveCanvasController];
      v33 = [v32 canvasEditor];
      v34 = [v33 pasteboardController];

      v35 = [v34 delegate];
      v36 = [v35 sourceContextForPasteboardController:v34];

      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10005B5C8;
      v53[3] = &unk_1014CE978;
      CGFloat v55 = x;
      CGFloat v56 = y;
      v53[4] = v31;
      v53[5] = self;
      id v54 = v47;
      v37 = [v10 loadTextStorageUsingBoardItemFactory:v31 forTargetContext:v36 targetStorage:0 loadHandler:v53];
      if (!v37)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        v46 = v36;
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CE998);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106BC60();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CE9B8);
        }
        v38 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v38);
        }
        v39 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController insertBoardItemsForDragInfo:atPoint:onRep:]");
        v40 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v39, v40, 123, 0, "invalid nil value for '%{public}s'", "progress");

        v36 = v46;
      }
    }
    else
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10005B864;
      v49[3] = &unk_1014CEA08;
      v49[4] = self;
      CGFloat v51 = x;
      CGFloat v52 = y;
      id v50 = v47;
      v41 = [v10 loadProvidersForImportedBoardItemsUsingBoardItemFactory:v31 WithLoadHandler:v49];

      if (!v41)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CEA28);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106BCFC();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CEA48);
        }
        v42 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v42);
        }
        v43 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController insertBoardItemsForDragInfo:atPoint:onRep:]");
        v44 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v43, v44, 155, 0, "invalid nil value for '%{public}s'", "progress");
      }
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10005BB70;
      v48[3] = &unk_1014CBBB0;
      v48[4] = self;
      [v10 setCancellationHandler:v48];
    }
    id v9 = v47;
  }
  [(CRLiOSDragAndDropController *)self p_transitionToItemPromiseState:1];

  return 1;
}

- (void)cleanupEndOfDragOperation
{
  if (qword_101719CF0 != -1) {
    dispatch_once(&qword_101719CF0, &stru_1014CEA68);
  }
  objc_super v3 = off_10166DB68;
  if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t itemPromiseState = self->_itemPromiseState;
    *(_DWORD *)buf = 134217984;
    unint64_t v10 = itemPromiseState;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "cleanupEndOfDragOperation called. item promise state %zi", buf, 0xCu);
  }
  unint64_t v5 = self->_itemPromiseState;
  if (v5 <= 3 && v5 != 1)
  {
    if (qword_101719CF0 != -1) {
      dispatch_once(&qword_101719CF0, &stru_1014CEA88);
    }
    objc_super v7 = off_10166DB68;
    if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "actually cleaning up mac DnD infrastructure", buf, 2u);
    }
    [(CRLiOSDragAndDropController *)self p_transitionToItemPromiseState:4];
    v8.receiver = self;
    v8.super_class = (Class)CRLiOSDragAndDropController;
    [(CRLDragAndDropController *)&v8 cleanupEndOfDragOperation];
  }
}

- (void)p_transitionToItemPromiseState:(unint64_t)a3
{
  if (qword_101719CF0 != -1) {
    dispatch_once(&qword_101719CF0, &stru_1014CEAA8);
  }
  unint64_t v5 = off_10166DB68;
  if (os_log_type_enabled((os_log_t)off_10166DB68, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t itemPromiseState = self->_itemPromiseState;
    int v30 = 134218240;
    unint64_t v31 = itemPromiseState;
    __int16 v32 = 2048;
    unint64_t v33 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "transitioning item promise state from %zi to %zi", (uint8_t *)&v30, 0x16u);
  }
  if (self->_itemPromiseState == 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CEAC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106BFFC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CEAE8);
    }
    objc_super v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    objc_super v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController p_transitionToItemPromiseState:]");
    id v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:190 isFatal:0 description:"Should not transition to a new state after we have completed a drag."];
  }
  switch(a3)
  {
    case 0uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEB08);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106BDDC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEB28);
      }
      unint64_t v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v10);
      }
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController p_transitionToItemPromiseState:]");
      v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"];
      v13 = "Should never transition to state None. That's only for starting!";
      v14 = v11;
      v15 = v12;
      uint64_t v16 = 193;
      goto LABEL_46;
    case 1uLL:
      if (self->_itemPromiseState)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CEB48);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106BEEC();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CEB68);
        }
        v17 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v17);
        }
        v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController p_transitionToItemPromiseState:]");
        v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:199 isFatal:0 description:"Should only begin waiting for promises from state None."];
      }
      v11 = [(CRLDragAndDropController *)self interactiveCanvasController];
      v20 = [v11 layerHost];
      v21 = [v20 asiOSCVC];
      v22 = [v21 crl_windowWrapper];
      v23 = (CRLiOSWindowIgnoreUserInteractionSafeWrapper *)[v22 newWrapperBeginningIgnoringUserInteractionSafely];
      ignoringUserInteractionWrapper = self->_ignoringUserInteractionWrapper;
      self->_ignoringUserInteractionWrapper = v23;

      break;
    case 2uLL:
      if (self->_itemPromiseState == 1) {
        goto LABEL_60;
      }
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEB88);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106BF74();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014CEBA8);
      }
      v25 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v25);
      }
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController p_transitionToItemPromiseState:]");
      v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"];
      v13 = "Should only receive promises from state Waiting.";
      v14 = v11;
      v15 = v12;
      uint64_t v16 = 205;
LABEL_46:
      +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:v16 isFatal:0 description:v13];

      break;
    case 4uLL:
      if (self->_itemPromiseState == 1)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CEBC8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106BE64();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014CEBE8);
        }
        v26 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v26);
        }
        v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController p_transitionToItemPromiseState:]");
        unsigned int v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"];
        +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:209 isFatal:0 description:"Should only receive promises from state Waiting."];
      }
      v29 = self->_ignoringUserInteractionWrapper;
      if (!v29) {
        goto LABEL_60;
      }
      [(CRLiOSWindowIgnoreUserInteractionSafeWrapper *)v29 endIgnoringUserInteractionSafely];
      v11 = self->_ignoringUserInteractionWrapper;
      self->_ignoringUserInteractionWrapper = 0;
      break;
    default:
      goto LABEL_60;
  }

LABEL_60:
  self->_unint64_t itemPromiseState = a3;
}

- (void).cxx_destruct
{
}

@end