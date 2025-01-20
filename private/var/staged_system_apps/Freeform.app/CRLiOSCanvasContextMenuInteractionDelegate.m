@interface CRLiOSCanvasContextMenuInteractionDelegate
- (BOOL)currentlyDisplayingMenu;
- (CRLiOSCanvasContextMenuInteractionDelegate)initWithInteractiveCanvasController:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)p_primaryMenuConfigurationAtPoint:(CGPoint)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation CRLiOSCanvasContextMenuInteractionDelegate

- (CRLiOSCanvasContextMenuInteractionDelegate)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSCanvasContextMenuInteractionDelegate;
  v5 = [(CRLiOSCanvasContextMenuInteractionDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
  }

  return v6;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  p_interactiveCanvasController = &self->_interactiveCanvasController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  unsigned __int8 v10 = [WeakRetained currentlyScrolling];

  if (v10)
  {
    v11 = 0;
    goto LABEL_25;
  }
  id v12 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v13 = [v12 layerHost];
  v14 = [v13 asiOSCVC];

  if (objc_msgSend(v14, "i_allowCanvasInteraction:atPoint:", v7, x, y))
  {
    id v15 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    [v15 convertBoundsToUnscaledPoint:x, y];
    double v17 = v16;
    double v19 = v18;

    v20 = [v14 delegate];
    if (objc_opt_respondsToSelector())
    {
      v54 = [v20 currentDocumentMode];
      id v21 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      v22 = [v54 contextMenuConfigurationForContextMenuInteraction:v7 atPoint:v21 onInteractiveCanvasController:v17];

      if (v22)
      {
        id v23 = v22;
LABEL_22:
        v29 = v23;
        v11 = v23;
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      v54 = 0;
    }
    id v24 = [v7 menuAppearance];
    if (v24 != (id)2)
    {
      if (!v24)
      {
        int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E3C50);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10108E2F0();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014E3C70);
        }
        v26 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10108E228(v26, v25);
        }
        v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasContextMenuInteractionDelegate contextMenuInteraction:configurationForMenuAtLocation:]");
        v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasContextMenuInteractionDelegate.m"];
        +[CRLAssertionHandler handleFailureInFunction:v27 file:v28 lineNumber:80 isFatal:0 description:"Unexpected menuAppearance!"];
      }
      v29 = -[CRLiOSCanvasContextMenuInteractionDelegate p_primaryMenuConfigurationAtPoint:](self, "p_primaryMenuConfigurationAtPoint:", v17, v19);
      goto LABEL_21;
    }
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x2020000000;
    char v65 = 0;
    if (v54)
    {
      unsigned __int8 v31 = [v54 wantsAlternateContextMenuBehaviorAtPoint:v17, v19];
      *((unsigned char *)v63 + 24) = v31;
      if (v31) {
        goto LABEL_31;
      }
    }
    id v32 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v33 = [v32 editorController];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_100231568;
    v61[3] = &unk_1014E3C98;
    *(double *)&v61[5] = v17;
    *(double *)&v61[6] = v19;
    v61[4] = &v62;
    [v33 enumerateEditorsOnStackUsingBlock:v61];

    if (*((unsigned char *)v63 + 24))
    {
LABEL_31:
      _Block_object_dispose(&v62, 8);
      v29 = 0;
      goto LABEL_32;
    }
    v34 = +[CRLCanvasContextMenuPlatformObject platformObjectWithInteraction:v7];
    id v35 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    id v60 = 0;
    v53 = [v35 hitKnobAtPoint:0 inputType:&v60 returningRep:v17 v19];
    id v52 = v60;

    if (v53 && v52)
    {
      [v52 convertNaturalPointFromUnscaledCanvas:v17, v19];
      double v37 = v36;
      double v39 = v38;
      if ((objc_msgSend(v52, "wantsContextMenuAtPoint:withPlatformObject:onKnob:", v34, v53) & 1) == 0)
      {
        v29 = 0;
        char v50 = 0;
        goto LABEL_57;
      }
      [v52 handleContextMenuClickAtPoint:v34 withPlatformObject:v53 onKnob:v37];
    }
    else
    {
      id v40 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
      v41 = [v40 hitRep:v17, v19];

      if (v41)
      {
        [v41 convertNaturalPointFromUnscaledCanvas:v17, v19];
        if ((objc_msgSend(v41, "wantsContextMenuAtPoint:withPlatformObject:onKnob:", v34, 0) & 1) == 0)
        {
          v29 = 0;
          char v50 = 0;
LABEL_56:

LABEL_57:
          _Block_object_dispose(&v62, 8);
          if (v50)
          {
LABEL_21:
            id v23 = v29;
            goto LABEL_22;
          }
LABEL_32:
          v11 = 0;
          goto LABEL_23;
        }
        [v41 convertNaturalPointFromUnscaledCanvas:v17, v19];
        [v41 handleContextMenuClickAtPoint:v34];
      }
    }
    v41 = +[NSMutableArray array];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v42 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    v43 = [v42 editorController];
    v44 = [v43 currentEditors];

    id v45 = [v44 countByEnumeratingWithState:&v56 objects:v66 count:16];
    v51 = v34;
    if (v45)
    {
      uint64_t v46 = *(void *)v57;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v57 != v46) {
            objc_enumerationMutation(v44);
          }
          v48 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v48 addContextualMenuElementsToArray:v41 atPoint:v17];
          }
        }
        id v45 = [v44 countByEnumeratingWithState:&v56 objects:v66 count:16];
      }
      while (v45);
    }

    v34 = v51;
    if ([v41 count])
    {
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_1002315E4;
      v55[3] = &unk_1014DBFC0;
      v55[4] = v41;
      v49 = objc_retainBlock(v55);
      v29 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v49];
    }
    else
    {
      v29 = 0;
    }
    char v50 = 1;
    goto LABEL_56;
  }
  v11 = 0;
LABEL_24:

LABEL_25:

  return v11;
}

- (id)p_primaryMenuConfigurationAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v6 = [WeakRetained hitRep:x, y];

  if (v6)
  {
    [v6 convertNaturalPointFromUnscaledCanvas:x, y];
    id v7 = [v6 contextMenuConfigurationAtPoint:];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 menuAppearance] == (id)2)
  {
    id v8 = 0;
  }
  else
  {
    p_interactiveCanvasController = &self->_interactiveCanvasController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v11 = [WeakRetained layerHost];

    id v12 = [v11 asiOSCVC];
    v13 = [v12 delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([v13 currentDocumentMode],
          v14 = objc_claimAutoreleasedReturnValue(),
          [v14 contextMenuInteraction:v6 previewForHighlightingMenuWithConfiguration:v7],
          id v15 = objc_claimAutoreleasedReturnValue(),
          v14,
          !v15))
    {
      double v16 = [v11 canvasView];
      [v6 locationInView:v16];
      double v18 = v17;
      double v20 = v19;
      id v21 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
      [v21 convertBoundsToUnscaledPoint:v18, v20];
      double v23 = v22;
      double v25 = v24;

      id v26 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
      v27 = [v26 hitRep:v23 v25];

      if (v27)
      {
        [v27 convertNaturalPointFromUnscaledCanvas:v23, v25];
        id v15 = [v27 contextMenuPreviewForHighlightingMenuAtPoint:v7];
      }
      else
      {
        id v15 = 0;
      }
    }
    id v8 = v15;
  }

  return v8;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_didDisplayMenu) {
    goto LABEL_11;
  }
  int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E3CB8);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10108E384();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E3CD8);
  }
  id v12 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101066770(v12, v11);
  }
  v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasContextMenuInteractionDelegate contextMenuInteraction:willDisplayMenuForConfiguration:animator:]");
  v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasContextMenuInteractionDelegate.m"];
  +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:207 isFatal:0 description:"Should not be told will display when already displayed"];

  if (!self->_didDisplayMenu)
  {
LABEL_11:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    double v16 = [WeakRetained editingCoordinator];
    [v16 suspendCollaborationWithReason:@"iOSCanvasContextMenu"];

    id v17 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    double v18 = [v17 layerHost];
    double v19 = [v18 asiOSCVC];

    double v20 = [v19 delegate];
    if (objc_opt_respondsToSelector())
    {
      id v21 = [v19 canvasView];
      [v8 locationInView:v21];
      double v23 = v22;
      double v25 = v24;
      id v26 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      [v26 convertBoundsToUnscaledPoint:v23, v25];
      double v28 = v27;
      double v30 = v29;

      unsigned __int8 v31 = [v20 currentDocumentMode];
      [v31 willShowContextMenuInteraction:v8 atPoint:v28];
    }
    self->_didDisplayMenu = 1;
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_didDisplayMenu)
  {
    self->_didDisplayMenu = 0;
    p_interactiveCanvasController = &self->_interactiveCanvasController;
    id WeakRetained = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    v13 = [WeakRetained editingCoordinator];
    [v13 resumeCollaborationWithReason:@"iOSCanvasContextMenu"];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v14 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    id v15 = [v14 editorController];
    double v16 = [v15 currentEditors];

    id v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        double v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v20);
          if (objc_opt_respondsToSelector()) {
            [v21 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:v10];
          }
          double v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v18);
    }
  }
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6 = a4;
  p_interactiveCanvasController = &self->_interactiveCanvasController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  [v6 sourcePoint];
  [WeakRetained convertBoundsToUnscaledPoint:];
  double v10 = v9;
  double v12 = v11;

  v13 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  [v14 editorController];
  double v16 = [v15 currentEditors];

  id v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v25;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v21 addContextualMenuElementsToArray:v13 atPoint:v10];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v18);
  }

  long long v22 = +[UIMenu menuWithTitle:&stru_101538650 children:v13];

  return v22;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  self->_didDisplayMenu = 1;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  self->_didDisplayMenu = 0;
}

- (BOOL)currentlyDisplayingMenu
{
  return self->_didDisplayMenu;
}

- (void).cxx_destruct
{
}

@end