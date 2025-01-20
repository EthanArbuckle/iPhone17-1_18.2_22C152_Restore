@interface CRLiOSCanvasPointerInteractionDelegate
- (CRLiOSCanvasPointerInteractionDelegate)initWithInteractiveCanvasController:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
@end

@implementation CRLiOSCanvasPointerInteractionDelegate

- (CRLiOSCanvasPointerInteractionDelegate)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSCanvasPointerInteractionDelegate;
  v5 = [(CRLiOSCanvasPointerInteractionDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_icc, v4);
  }

  return v6;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v12 = [WeakRetained layerHost];
  v13 = [v12 asiOSCVC];

  [v9 location];
  if ((objc_msgSend(v13, "i_allowCanvasInteraction:atPoint:", v8) & 1) == 0)
  {
    lastCursor = self->_lastCursor;
    self->_lastCursor = 0;

    id v33 = 0;
    goto LABEL_41;
  }
  v106 = +[CRLCursorPlatformObject cursorPlatformObjectWithPointerRegionRequest:v9];
  id v14 = objc_loadWeakRetained((id *)&self->_icc);
  [v9 location];
  [v14 convertBoundsToUnscaledPoint:];
  double v16 = v15;
  double v18 = v17;

  if (([v13 currentlyTrackingIndirectPointerTouch] & 1) == 0)
  {
    lastCursorUpdatingSource = self->_lastCursorUpdatingSource;
    self->_lastCursorUpdatingSource = 0;

    id v35 = objc_loadWeakRetained((id *)&self->_icc);
    id v111 = 0;
    v36 = [v35 hitKnobAtPoint:0 inputType:&v111 returningRep:v16 v18];
    id v37 = v111;

    p_info = (__objc2_class_ro **)(CRLCounterRotateLayout + 32);
    v104 = v36;
    v105 = v37;
    if (v36
      && (objc_msgSend(v37, "convertNaturalPointFromUnscaledCanvas:", v16, v18),
          objc_msgSend(v37, "cursorAtPoint:forKnob:withCursorPlatformObject:", v36, v106),
          (uint64_t v39 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v40 = (void *)v39;
      id v41 = v36;
      id v42 = v40;
      sub_100246AC8(v37, 1, v43, v44, v45, v46, v47, v48, (uint64_t)&OBJC_PROTOCOL___CRLiOSCursorUpdatingSource);
      v49 = (CRLiOSCursorUpdatingSource *)objc_claimAutoreleasedReturnValue();
      v50 = self->_lastCursorUpdatingSource;
      self->_lastCursorUpdatingSource = v49;

      v51 = v42;
    }
    else
    {
      v52 = [v13 delegate];
      if (objc_opt_respondsToSelector())
      {
        v53 = [v52 currentDocumentMode];
        v51 = [v53 cursorAtPoint:v106 withCursorPlatformObject:v16, v18];

        if (v51)
        {
          id v41 = 0;
LABEL_33:
          v81 = [p_info + 356 defaultCursor];
          if (v51 == v81) {
            v82 = 0;
          }
          else {
            v82 = v51;
          }
          p_lastCursor = &self->_lastCursor;
          objc_storeStrong((id *)&self->_lastCursor, v82);

          v84 = self->_lastCursor;
          if (v84)
          {
            v85 = [(CRLCursor *)v84 identifierSuffix];
            v86 = +[NSString stringWithFormat:@"%p-%@", v41, v85];

            [(CRLCursor *)*p_lastCursor activeScaledRect];
            +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v86);
            id v33 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v33 = 0;
          }

          goto LABEL_40;
        }
      }
      else
      {
      }
      id v101 = v8;
      v103 = v13;
      id v100 = v10;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      id v54 = objc_loadWeakRetained((id *)&self->_icc);
      v55 = [v54 editorController];
      v56 = [v55 currentEditors];
      id v42 = [v56 reverseObjectEnumerator];

      id v57 = [v42 countByEnumeratingWithState:&v107 objects:v112 count:16];
      if (v57)
      {
        id v58 = v57;
        uint64_t v59 = *(void *)v108;
        while (2)
        {
          for (i = 0; i != v58; i = (char *)i + 1)
          {
            if (*(void *)v108 != v59) {
              objc_enumerationMutation(v42);
            }
            v61 = *(void **)(*((void *)&v107 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              uint64_t v62 = [v61 cursorAtPoint:v106 withCursorPlatformObject:v16, v18];
              if (v62)
              {
                v51 = (void *)v62;
                id v41 = v61;
                sub_100246AC8(v41, 1, v73, v74, v75, v76, v77, v78, (uint64_t)&OBJC_PROTOCOL___CRLiOSCursorUpdatingSource);
                v79 = (CRLiOSCursorUpdatingSource *)objc_claimAutoreleasedReturnValue();
                v80 = self->_lastCursorUpdatingSource;
                self->_lastCursorUpdatingSource = v79;

                id v10 = v100;
                id v8 = v101;
                v13 = v103;
                goto LABEL_31;
              }
            }
          }
          id v58 = [v42 countByEnumeratingWithState:&v107 objects:v112 count:16];
          if (v58) {
            continue;
          }
          break;
        }
      }

      id v63 = objc_loadWeakRetained((id *)&self->_icc);
      v64 = [v63 hitRep:1 withPrecision:v16, v18];

      [v64 convertNaturalPointFromUnscaledCanvas:v16, v18];
      v51 = [v64 cursorAtPoint:0 forKnob:v106];
      if (!v51)
      {
        id v41 = 0;
        v105 = v64;
        id v10 = v100;
        id v8 = v101;
        v13 = v103;
        goto LABEL_32;
      }
      p_info = CRLCounterRotateLayout.info;
      v65 = +[CRLCursor defaultCursor];

      id v10 = v100;
      id v8 = v101;
      v13 = v103;
      if (v51 == v65)
      {
        id v41 = 0;
        v105 = v64;
        goto LABEL_33;
      }
      id v41 = v64;
      sub_100246AC8(v41, 1, v66, v67, v68, v69, v70, v71, (uint64_t)&OBJC_PROTOCOL___CRLiOSCursorUpdatingSource);
      v72 = (CRLiOSCursorUpdatingSource *)objc_claimAutoreleasedReturnValue();
      id v42 = self->_lastCursorUpdatingSource;
      self->_lastCursorUpdatingSource = v72;
      v105 = v41;
    }
LABEL_31:

LABEL_32:
    p_info = CRLCounterRotateLayout.info;
    goto LABEL_33;
  }
  if (self->_lastCursor)
  {
    p_lastCursorUpdatingSource = (void **)&self->_lastCursorUpdatingSource;
    v19 = self->_lastCursorUpdatingSource;
    if (v19
      && [(CRLiOSCursorUpdatingSource *)v19 wantsOpportunityToUpdateCursorDuringDrag])
    {
      v102 = v13;
      uint64_t v21 = objc_opt_class();
      v22 = sub_1002469D0(v21, *p_lastCursorUpdatingSource);
      v29 = sub_100246AC8(*p_lastCursorUpdatingSource, 1, v23, v24, v25, v26, v27, v28, (uint64_t)&OBJC_PROTOCOL___CRLEditor);
      v30 = v29;
      if (v22)
      {
        [v22 convertNaturalPointFromUnscaledCanvas:v16, v18];
        [v22 cursorAtPoint:0 forKnob:v106];
        v31 = (CRLCursor *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v29)
        {
          int v94 = +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D8560);
          }
          v95 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_10107C5D4((uint64_t *)&self->_lastCursorUpdatingSource, v94, v95);
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014D8580);
          }
          v96 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010668E0(v96);
          }
          v97 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasPointerInteractionDelegate pointerInteraction:regionForRequest:defaultRegion:]");
          v98 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasPointerInteractionDelegate.m"];
          +[CRLAssertionHandler handleFailureInFunction:v97, v98, 126, 0, "Unexpected lastCursorUpdatingSource type! %@", *p_lastCursorUpdatingSource file lineNumber isFatal description];

          goto LABEL_47;
        }
        [v29 cursorAtPoint:v106 withCursorPlatformObject:v16, v18];
        v31 = (CRLCursor *)objc_claimAutoreleasedReturnValue();
      }
      v88 = self->_lastCursor;
      self->_lastCursor = v31;

LABEL_47:
      v89 = self->_lastCursor;
      if (v89)
      {
        id v90 = v10;
        v91 = self->_lastCursorUpdatingSource;
        v92 = [(CRLCursor *)v89 identifierSuffix];
        v99 = v91;
        id v10 = v90;
        v93 = +[NSString stringWithFormat:@"%p-%@", v99, v92];

        [(CRLCursor *)self->_lastCursor activeScaledRect];
        +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v93);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v33 = 0;
      }

      v13 = v102;
      goto LABEL_40;
    }
    id v33 = v10;
    [(CRLCursor *)self->_lastCursor setConstrainedAxes:0];
  }
  else
  {
    id v33 = 0;
  }
LABEL_40:

LABEL_41:

  return v33;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v5 = [(CRLCursor *)self->_lastCursor effect];

  if (v5)
  {
    v6 = [(CRLCursor *)self->_lastCursor effect];
    uint64_t v7 = +[UIPointerStyle styleWithEffect:v6 shape:0];
LABEL_5:
    id v9 = (void *)v7;

    goto LABEL_6;
  }
  id v8 = [(CRLCursor *)self->_lastCursor shape];

  if (v8)
  {
    v6 = [(CRLCursor *)self->_lastCursor shape];
    uint64_t v7 = +[UIPointerStyle styleWithShape:v6 constrainedAxes:[(CRLCursor *)self->_lastCursor constrainedAxes]];
    goto LABEL_5;
  }
  int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D85A0);
  }
  v12 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10107C694(v11, v12);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D85C0);
  }
  v13 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010668E0(v13);
  }
  id v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasPointerInteractionDelegate pointerInteraction:styleForRegion:]");
  double v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasPointerInteractionDelegate.m"];
  +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:152 isFatal:0 description:"Invalid cursor without any data!"];

  id v9 = 0;
LABEL_6:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCursorUpdatingSource, 0);
  objc_storeStrong((id *)&self->_lastCursor, 0);

  objc_destroyWeak((id *)&self->_icc);
}

@end