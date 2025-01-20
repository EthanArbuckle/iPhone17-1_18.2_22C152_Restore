@interface CRLGroupLayout
- (BOOL)allowsConnections;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)canInspectGeometry;
- (BOOL)descendentWrappablesContainsWrappable:(id)a3;
- (BOOL)isDraggable;
- (BOOL)providesGuidesForChildLayouts;
- (BOOL)resizeMayChangeAspectRatio;
- (BOOL)shouldBeIncludedInParentFrameForCulling;
- (BOOL)shouldDisplayGuides;
- (BOOL)shouldSnapWhileResizing;
- (BOOL)supportsFlipping;
- (BOOL)supportsParentFlipping;
- (BOOL)supportsRotation;
- (CGRect)alignmentFrame;
- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3;
- (CGRect)boundsForStandardKnobs;
- (CGRect)clipRect;
- (CGRect)computeBoundsForStandardKnobs;
- (CGRect)frameForMiniFormatterPositioning;
- (CGRect)rectInRootForCalculatingActivityLineEndpoint;
- (CGRect)rectInRootForPresentingAnnotationPopoverForSelectionPath:(id)a3;
- (CGRect)rectInRootForSelectionPath:(id)a3;
- (CGSize)minimumSize;
- (id)additionalDependenciesForChildLayout:(id)a3;
- (id)childInfosForChildLayouts;
- (id)commandForSettingAspectRatioLocked:(BOOL)a3;
- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3;
- (id)commandToFlipWithOrientation:(int)a3;
- (id)computeInfoGeometryDuringResize;
- (id)computeLayoutGeometry;
- (id)computeWrapPath;
- (id)convexHullPath;
- (id)descendentWrappables;
- (id)i_wrapPath;
- (id)layoutGeometryFromInfo;
- (id)layoutsForProvidingGuidesForChildLayouts;
- (id)p_childWrapPathsFrom:(id)a3 inDescendents:(id)a4;
- (id)p_groupItem;
- (id)p_groupedChildren;
- (id)pathForClippingConnectionLines;
- (id)reliedOnLayouts;
- (id)visibleGeometries;
- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3;
- (void)endDynamicOperation;
- (void)i_clearInvalidationCache;
- (void)invalidate;
- (void)p_createDynamicCopies;
- (void)p_destroyDynamicCopies;
- (void)processChangedProperty:(unint64_t)a3;
- (void)setDynamicGeometry:(id)a3;
- (void)takeFreeTransformFromTracker:(id)a3;
- (void)takeRotationFromTracker:(id)a3;
- (void)takeSizeFromTracker:(id)a3;
- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5;
- (void)updateChildrenFromInfo;
- (void)updateLayoutGeometryInPreparationForPartitioning;
@end

@implementation CRLGroupLayout

- (id)convexHullPath
{
  [(CRLGroupLayout *)self boundsForStandardKnobs];

  return +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");
}

- (id)p_groupItem
{
  v3 = (objc_class *)objc_opt_class();
  v4 = [(CRLCanvasLayout *)self info];
  v5 = sub_10024715C(v3, v4);

  return v5;
}

- (id)visibleGeometries
{
  v3 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  v4 = [(CRLCanvasAbstractLayout *)self geometry];
  v5 = v4;
  if (v4)
  {
    [v4 transform];
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v6 = [(CRLCanvasAbstractLayout *)self children];
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v24 + 1) + 8 * i) visibleGeometries];
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v31 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
              v19[0] = v28;
              v19[1] = v29;
              v19[2] = v30;
              v17 = [v16 geometryByTransformingBy:v19];
              [v3 addObject:v17];
            }
            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v31 count:16];
          }
          while (v13);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v8);
  }

  return v3;
}

- (id)childInfosForChildLayouts
{
  v80.receiver = self;
  v80.super_class = (Class)CRLGroupLayout;
  v3 = [(CRLCanvasLayout *)&v80 childInfosForChildLayouts];
  v4 = [(CRLCanvasLayout *)self layoutController];
  v5 = [v4 canvas];
  v6 = [v5 canvasController];
  id v7 = [v6 additionalChildInfosForLayout:self];

  if ([v7 count])
  {
    uint64_t v8 = [v3 arrayByAddingObjectsFromArray:v7];

    v3 = (void *)v8;
  }
  uint64_t v9 = [(CRLGroupLayout *)self p_groupItem];
  v10 = [v9 childItems];
  v11 = [v3 arrayByAddingObjectsFromArray:v10];

  id v12 = [(CRLGroupLayout *)self p_groupItem];
  id v13 = v11;
  id v59 = v13;
  if (([v12 isFreehandDrawing] & 1) == 0)
  {
    long long v78 = 0u;
    long long v79 = 0u;
    long long v77 = 0u;
    v54 = v7;
    v55 = v12;
    if (v12) {
      [v12 transformInRoot];
    }
    else {
      memset(v76, 0, sizeof(v76));
    }
    +[CRLCounterRotateInfo counterTransformForTransformInRoot:v76];
    long long v73 = v77;
    long long v74 = v78;
    long long v75 = v79;
    long long v14 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v72[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v72[1] = v14;
    v72[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    BOOL v15 = sub_100064134(&v73, v72);
    v16 = +[NSMutableArray array];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v53 = v13;
    id v17 = v13;
    v58 = v17;
    id v59 = v16;
    id v60 = [v17 countByEnumeratingWithState:&v68 objects:v82 count:16];
    if (v60)
    {
      uint64_t v18 = *(void *)v69;
      int v19 = !v15;
      uint64_t v57 = *(void *)v69;
      int v56 = !v15;
      do
      {
        long long v20 = 0;
        do
        {
          if (*(void *)v69 != v18) {
            objc_enumerationMutation(v17);
          }
          long long v21 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v20);
          uint64_t v22 = objc_opt_class();
          long long v23 = sub_1002469D0(v22, v21);
          long long v24 = v23;
          if (!v23
            || ![v23 wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent])
          {
LABEL_32:
            [v16 addObject:v21, v53];
            goto LABEL_33;
          }
          unsigned int v25 = [v24 supportsParentRotation];
          if ((v25 | v19))
          {
            if (v25) {
              goto LABEL_32;
            }
          }
          else
          {
            v39 = [v24 geometry];
            v40 = v39;
            if (v39) {
              [v39 transform];
            }
            else {
              memset(v67, 0, sizeof(v67));
            }
            BOOL v41 = sub_10007F7EC((double *)v67);

            if (!v41) {
              goto LABEL_32;
            }
          }
          long long v26 = [(CRLCanvasLayout *)self layoutController];
          long long v27 = [v26 layoutsForInfo:v24];

          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v28 = v27;
          id v29 = [v28 countByEnumeratingWithState:&v63 objects:v81 count:16];
          if (v29)
          {
            id v30 = v29;
            uint64_t v31 = *(void *)v64;
LABEL_18:
            uint64_t v32 = 0;
            while (1)
            {
              if (*(void *)v64 != v31) {
                objc_enumerationMutation(v28);
              }
              v33 = *(void **)(*((void *)&v63 + 1) + 8 * v32);
              v34 = [v33 parent];
              v35 = [v34 parent];

              if (v35 == self) {
                break;
              }
              v36 = [v33 parent];

              if (v36 == self) {
                goto LABEL_25;
              }
              if (v30 == (id)++v32)
              {
                id v30 = [v28 countByEnumeratingWithState:&v63 objects:v81 count:16];
                if (v30) {
                  goto LABEL_18;
                }
                goto LABEL_25;
              }
            }
            uint64_t v42 = objc_opt_class();
            v43 = [v33 parent];
            sub_1002469D0(v42, v43);
            v38 = (CRLCounterRotateInfo *)objc_claimAutoreleasedReturnValue();

            if (!v38) {
              goto LABEL_26;
            }
            v44 = (objc_class *)objc_opt_class();
            v45 = [(CRLCounterRotateInfo *)v38 info];
            v46 = sub_10024715C(v44, v45);

            id v17 = v58;
            v16 = v59;
            uint64_t v18 = v57;
            if (v46) {
              [v46 counterTransform];
            }
            else {
              memset(v62, 0, sizeof(v62));
            }
            long long v73 = v77;
            long long v74 = v78;
            long long v75 = v79;
            int v19 = v56;
            if (!sub_100064134(v62, &v73))
            {
              v61[0] = v77;
              v61[1] = v78;
              v61[2] = v79;
              [v46 setCounterTransform:v61];
              [(CRLCounterRotateInfo *)v38 invalidateFrame];
            }
            [v59 addObject:v46];
          }
          else
          {
LABEL_25:

LABEL_26:
            v37 = [CRLCounterRotateInfo alloc];
            long long v73 = v77;
            long long v74 = v78;
            long long v75 = v79;
            v38 = [(CRLCounterRotateInfo *)v37 initWithChildInfo:v24 parentGroup:v55 counterTransform:&v73];
            v16 = v59;
            [v59 addObject:v38];
            uint64_t v18 = v57;
            id v17 = v58;
            int v19 = v56;
          }

LABEL_33:
          long long v20 = (char *)v20 + 1;
        }
        while (v20 != v60);
        id v47 = [v17 countByEnumeratingWithState:&v68 objects:v82 count:16];
        id v60 = v47;
      }
      while (v47);
    }

    id v48 = [v16 count];
    id v7 = v54;
    id v12 = v55;
    if (v48 != [v17 count])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E66F0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101092884();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6710);
      }
      v49 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v49);
      }
      v50 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupLayout childInfosForChildLayouts]", v53);
      v51 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m"];
      +[CRLAssertionHandler handleFailureInFunction:v50 file:v51 lineNumber:133 isFatal:0 description:"should have same number of children!"];
    }
    id v13 = v53;
  }

  return v59;
}

- (BOOL)canInspectGeometry
{
  v3 = [(CRLCanvasLayout *)self layoutController];
  v4 = [v3 canvas];
  v5 = [v4 canvasController];

  if ([(CRLCanvasLayout *)self isInTopLevelContainerForEditing]) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = [v5 hasSelectedInfosInMultipleContainers];
  }

  return v6;
}

- (id)layoutGeometryFromInfo
{
  v2 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v5 = [(CRLCanvasLayout *)self info];
    unsigned __int8 v6 = [v5 geometry];

    if (![v6 widthValid] || (objc_msgSend(v6, "heightValid") & 1) == 0)
    {
      unsigned int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6730);
      }
      uint64_t v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        long long v21 = v8;
        unsigned int v27 = [v6 widthValid];
        unsigned int v26 = [v6 heightValid];
        id v29 = [(CRLGroupLayout *)self p_groupItem];
        id v28 = [v29 childItems];
        id v25 = [v28 count];
        uint64_t v22 = NSStringFromCGRect(*(CGRect *)((char *)&self->_dynamicLayoutGeometry + 2));
        long long v23 = (objc_class *)objc_opt_class();
        long long v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 67111426;
        unsigned int v31 = v7;
        __int16 v32 = 2082;
        v33 = "-[CRLGroupLayout layoutGeometryFromInfo]";
        __int16 v34 = 2082;
        v35 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m";
        __int16 v36 = 1024;
        int v37 = 156;
        __int16 v38 = 1024;
        unsigned int v39 = v27;
        __int16 v40 = 1024;
        unsigned int v41 = v26;
        __int16 v42 = 2048;
        id v43 = v25;
        __int16 v44 = 2114;
        v45 = v22;
        __int16 v46 = 2114;
        id v47 = v24;
        __int16 v48 = 2114;
        v49 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid info geom! wV: %d hV: %d. numChildren: %zi boundsForStandardKnobs %{public}@ %{public}@ geom: %{public}@", buf, 0x56u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E6750);
      }
      uint64_t v9 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v9);
      }
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupLayout layoutGeometryFromInfo]");
      v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m"];
      unsigned int v12 = [v6 widthValid];
      unsigned int v13 = [v6 heightValid];
      long long v14 = [(CRLGroupLayout *)self p_groupItem];
      BOOL v15 = [v14 childItems];
      id v16 = [v15 count];
      id v17 = NSStringFromCGRect(*(CGRect *)((char *)&self->_dynamicLayoutGeometry + 2));
      uint64_t v18 = (objc_class *)objc_opt_class();
      int v19 = NSStringFromClass(v18);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 156, 0, "Invalid info geom! wV: %d hV: %d. numChildren: %zi boundsForStandardKnobs %{public}@ %{public}@ geom: %{public}@", v12, v13, v16, v17, v19, v6);
    }
    v3 = [[CRLCanvasLayoutGeometry alloc] initWithInfoGeometry:v6];
  }

  return v3;
}

- (id)reliedOnLayouts
{
  v2 = [(CRLGroupLayout *)self p_groupedChildren];
  v3 = [v2 set];

  return v3;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  v5 = self;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (CGRect)computeBoundsForStandardKnobs
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unsigned __int8 v6 = [(CRLGroupLayout *)self p_groupedChildren];
  id v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v10);
        uint64_t v12 = objc_opt_class();
        unsigned int v13 = sub_1002469D0(v12, v11);
        long long v14 = v13;
        if (!v13
          || (objc_msgSend(v13, "p_groupItem"),
              BOOL v15 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v16 = [v15 isEffectivelyEmpty],
              v15,
              (v16 & 1) == 0))
        {
          id v17 = [v11 pureGeometry];
          [v17 frame];
          v34.origin.CGFloat x = x;
          v34.origin.CGFloat y = y;
          v34.size.CGFloat width = width;
          v34.size.CGFloat height = height;
          CGRect v31 = CGRectUnion(v30, v34);
          CGFloat x = v31.origin.x;
          CGFloat y = v31.origin.y;
          CGFloat width = v31.size.width;
          CGFloat height = v31.size.height;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  if (CGRectIsNull(v32))
  {
    +[CRLGroupItem unscaledSizeForEmptyGroups];
    CGFloat x = sub_100064070();
    CGFloat y = v18;
    CGFloat width = v19;
    CGFloat height = v20;
  }
  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (id)computeLayoutGeometry
{
  v3 = (CRLCanvasLayoutGeometry **)((char *)&self->_dynamicLayoutGeometry + 2);
  [(CRLGroupLayout *)self computeBoundsForStandardKnobs];
  void *v3 = v4;
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;

  return [(CRLGroupLayout *)self layoutGeometryFromInfo];
}

- (CGRect)rectInRootForSelectionPath:(id)a3
{
  v3 = [(CRLCanvasLayout *)self pureGeometryInRoot];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)processChangedProperty:(unint64_t)a3
{
  if (a3 == 7)
  {
    double v5 = [(CRLCanvasLayout *)self info];
    unsigned __int8 v6 = [v5 isFreehandDrawing];

    if (v6) {
      goto LABEL_14;
    }
    double v7 = [(CRLCanvasLayout *)self info];
    double v8 = [v7 geometry];
    double v9 = v8;
    if (v8) {
      [v8 transform];
    }
    else {
      memset(v18, 0, sizeof(v18));
    }
    double v10 = sub_10007F7C8((double *)v18);
    double v11 = [(CRLCanvasAbstractLayout *)self geometry];
    double v12 = v11;
    if (v11) {
      [v11 transform];
    }
    else {
      memset(v17, 0, sizeof(v17));
    }
    double v13 = sub_10007F7C8((double *)v17);
    if (v10 == v13)
    {

      goto LABEL_14;
    }
    double v14 = fabs(v13 * 0.000000999999997);
    double v15 = vabdd_f64(v10, v13);

    if (v15 < v14) {
      goto LABEL_14;
    }
    goto LABEL_3;
  }
  if (a3 == 4) {
LABEL_3:
  }
    [(CRLCanvasLayout *)self invalidateChildren];
LABEL_14:
  v16.receiver = self;
  v16.super_class = (Class)CRLGroupLayout;
  [(CRLCanvasLayout *)&v16 processChangedProperty:a3];
}

- (CGRect)boundsForStandardKnobs
{
  double v2 = *(double *)((char *)&self->_dynamicLayoutGeometry + 2);
  double v3 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.x + 2);
  double v4 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.y + 2);
  double v5 = *(double *)((char *)&self->_boundsForStandardKnobs.size.width + 2);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)frameForMiniFormatterPositioning
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  memset(&v41, 0, sizeof(v41));
  [(CRLCanvasAbstractLayout *)self transform];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  double v7 = [(CRLCanvasAbstractLayout *)self children];
  id v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v11);
        uint64_t v13 = objc_opt_class();
        double v14 = [v12 info];
        double v15 = sub_1002469D0(v13, v14);

        if (!v15 || ([v15 isEffectivelyEmpty] & 1) == 0)
        {
          [v12 frameForMiniFormatterPositioning];
          CGAffineTransform v36 = v41;
          CGRect v44 = CGRectApplyAffineTransform(v43, &v36);
          v50.origin.CGFloat x = x;
          v50.origin.CGFloat y = y;
          v50.size.CGFloat width = width;
          v50.size.CGFloat height = height;
          CGRect v45 = CGRectUnion(v44, v50);
          CGFloat x = v45.origin.x;
          CGFloat y = v45.origin.y;
          CGFloat width = v45.size.width;
          CGFloat height = v45.size.height;
        }

        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v9);
  }

  [(CRLGroupLayout *)self boundsForStandardKnobs];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  [(CRLCanvasAbstractLayout *)self transform];
  v46.origin.CGFloat x = v17;
  v46.origin.CGFloat y = v19;
  v46.size.CGFloat width = v21;
  v46.size.CGFloat height = v23;
  CGRect v51 = CGRectApplyAffineTransform(v46, &v35);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  CGRect v48 = CGRectUnion(v47, v51);
  CGFloat v24 = v48.origin.x;
  CGFloat v25 = v48.origin.y;
  CGFloat v26 = v48.size.width;
  CGFloat v27 = v48.size.height;
  if (CGRectIsNull(v48))
  {
    +[CRLGroupItem unscaledSizeForEmptyGroups];
    CGFloat v24 = sub_100064070();
    CGFloat v25 = v28;
    CGFloat v26 = v29;
    CGFloat v27 = v30;
  }
  double v31 = v24;
  double v32 = v25;
  double v33 = v26;
  double v34 = v27;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (CGRect)clipRect
{
  double v2 = *(double *)((char *)&self->_dynamicLayoutGeometry + 2);
  double v3 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.x + 2);
  double v4 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.y + 2);
  double v5 = *(double *)((char *)&self->_boundsForStandardKnobs.size.width + 2);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)updateLayoutGeometryInPreparationForPartitioning
{
  double v3 = [(CRLGroupLayout *)self p_groupItem];
  unsigned __int8 v4 = [v3 isEffectivelyEmpty];

  if ((v4 & 1) == 0)
  {
    double v5 = [(CRLGroupLayout *)self p_groupedChildren];
    unsigned __int8 v6 = [v5 array];
    double v7 = [v6 arrayByAddingObject:self];
    id v8 = +[NSSet setWithArray:v7];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v56;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v56 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v55 + 1) + 8 * i) invalidateFrame];
        }
        id v11 = [v9 countByEnumeratingWithState:&v55 objects:v61 count:16];
      }
      while (v11);
    }

    double v14 = [(CRLCanvasLayout *)self layoutController];
    [v14 validateLayoutWithDependencies:self];

    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    CGFloat v19 = [(CRLGroupLayout *)self p_groupedChildren];
    id v20 = [v19 countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v52;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v52 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * (void)j) frameForCulling];
          v64.origin.double x = x;
          v64.origin.double y = y;
          v64.size.double width = width;
          v64.size.double height = height;
          CGRect v63 = CGRectUnion(v62, v64);
          double x = v63.origin.x;
          double y = v63.origin.y;
          double width = v63.size.width;
          double height = v63.size.height;
        }
        id v21 = [v19 countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v21);
    }

    double v24 = fmax(width, 1.0);
    double v25 = fmax(height, 1.0);
    CGFloat v26 = [(CRLCanvasAbstractLayout *)self geometry];
    [v26 size];
    double v28 = v27;
    double v30 = v29;

    double v31 = fmax(v28, 1.0);
    double v32 = fmax(v30, 1.0);
    memset(&v50, 0, sizeof(v50));
    CGAffineTransformMakeScale(&v50, v24 / v31, v25 / v32);
    CGAffineTransformMakeTranslation(&t2, x / v31, y / v32);
    CGAffineTransform t1 = v50;
    CGAffineTransformConcat(&v49, &t1, &t2);
    CGAffineTransform v50 = v49;
    double v33 = [(CRLCanvasAbstractLayout *)self geometry];
    double v34 = v33;
    if (v33) {
      [v33 fullTransform];
    }
    else {
      memset(&v45, 0, sizeof(v45));
    }
    CGAffineTransform v49 = v50;
    CGAffineTransformConcat(&v46, &v49, &v45);
    CGAffineTransform v35 = +[CRLCanvasLayoutGeometry geometryFromFullTransform:&v46];
    [(CRLCanvasAbstractLayout *)self setGeometry:v35];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    CGAffineTransform v36 = [(CRLCanvasAbstractLayout *)self children];
    id v37 = [v36 countByEnumeratingWithState:&v41 objects:v59 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v42;
      do
      {
        for (k = 0; k != v38; k = (char *)k + 1)
        {
          if (*(void *)v42 != v39) {
            objc_enumerationMutation(v36);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * (void)k) offsetGeometryBy:sub_1000646A4(x, y, -1.0)];
        }
        id v38 = [v36 countByEnumeratingWithState:&v41 objects:v59 count:16];
      }
      while (v38);
    }
  }
}

- (CGRect)alignmentFrame
{
  double v2 = (CGFloat *)((char *)&self->_dynamicLayoutGeometry + 2);
  [(CRLCanvasAbstractLayout *)self transform];
  v4.origin.double x = *v2;
  v4.origin.double y = v2[1];
  v4.size.double width = v2[2];
  v4.size.double height = v2[3];
  return CGRectApplyAffineTransform(v4, &v3);
}

- (CGRect)baseFrameForFrameForCullingWithAdditionalTransform:(CGAffineTransform *)a3
{
  CGRect v4 = [(CRLCanvasLayout *)self pureGeometry];
  [v4 frame];
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v14.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v14.c = v5;
  *(_OWORD *)&v14.tCGFloat x = *(_OWORD *)&a3->tx;
  CGRect v16 = CGRectApplyAffineTransform(v15, &v14);
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;

  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (BOOL)shouldBeIncludedInParentFrameForCulling
{
  double v2 = [(CRLGroupLayout *)self p_groupItem];
  char v3 = [v2 isEffectivelyEmpty] ^ 1;

  return v3;
}

- (CGRect)rectInRootForPresentingAnnotationPopoverForSelectionPath:(id)a3
{
  [(CRLGroupLayout *)self boundsForStandardKnobs];

  -[CRLCanvasAbstractLayout rectInRoot:](self, "rectInRoot:");
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (void)beginDynamicOperationWithRealTimeCommands:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CRLGroupLayout *)self resizeMayChangeAspectRatio]) {
    int v5 = 1;
  }
  else {
    int v5 = 2;
  }
  *(_DWORD *)((char *)&self->_cachedGroupedChildren + 6) = v5;
  [(CRLGroupLayout *)self p_createDynamicCopies];
  v6.receiver = self;
  v6.super_class = (Class)CRLGroupLayout;
  [(CRLCanvasLayout *)&v6 beginDynamicOperationWithRealTimeCommands:v3];
}

- (id)computeInfoGeometryDuringResize
{
  double v2 = [(CRLCanvasAbstractLayout *)self geometry];
  BOOL v3 = [v2 infoGeometry];

  return v3;
}

- (void)takeRotationFromTracker:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLGroupLayout;
  [(CRLCanvasLayout *)&v11 takeRotationFromTracker:v4];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  if (v4) {
    [v4 rotateTransform];
  }
  int v5 = [(CRLCanvasLayout *)self originalGeometry];
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  objc_super v6 = [v5 geometryByTransformingBy:v7];

  [(CRLGroupLayout *)self setDynamicGeometry:v6];
  [(CRLCanvasLayout *)self invalidatePosition];
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  double v2 = [(CRLCanvasLayout *)self info];
  unsigned __int8 v3 = [v2 canAspectRatioLockBeChangedByUser];

  return v3;
}

- (BOOL)resizeMayChangeAspectRatio
{
  int v2 = *(_DWORD *)((char *)&self->_cachedGroupedChildren + 6);
  if (!v2)
  {
    int v5 = [(CRLCanvasLayout *)self info];
    if (([v5 aspectRatioLocked] & 1) != 0
      || ![v5 canAspectRatioLockBeChangedByUser])
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      objc_super v6 = [v5 allNestedChildrenItemsIncludingGroups];
      id v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v26;
LABEL_7:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v25 + 1) + 8 * v10) aspectRatioLocked]) {
            goto LABEL_30;
          }
          if (v8 == (id)++v10)
          {
            id v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
            if (v8) {
              goto LABEL_7;
            }
            break;
          }
        }
      }

      if (([v5 isFreehandDrawing] & 1) == 0)
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        objc_super v6 = [(CRLGroupLayout *)self p_groupedChildren];
        id v11 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (!v11)
        {
LABEL_31:

          goto LABEL_32;
        }
        uint64_t v12 = *(void *)v22;
LABEL_18:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v6);
          }
          CGAffineTransform v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
          CGRect v15 = [v14 info];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            break;
          }
          CGFloat v17 = [v14 info];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v18 = [v14 info];
            unsigned __int8 v19 = [v18 isFreehandDrawing];

            if ((v19 & 1) == 0 && ![v14 resizeMayChangeAspectRatio]) {
              break;
            }
          }
          else
          {
          }
          if (v11 == (id)++v13)
          {
            id v11 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              goto LABEL_18;
            }
            goto LABEL_31;
          }
        }
LABEL_30:
        LOBYTE(v11) = 1;
        goto LABEL_31;
      }
      LOBYTE(v11) = 0;
    }
LABEL_32:
    char v3 = v11 ^ 1;

    return v3;
  }
  return v2 == 1;
}

- (id)commandForSettingAspectRatioLocked:(BOOL)a3
{
  v34.receiver = self;
  v34.super_class = (Class)CRLGroupLayout;
  int v5 = -[CRLCanvasLayout commandForSettingAspectRatioLocked:](&v34, "commandForSettingAspectRatioLocked:");
  uint64_t v6 = objc_opt_class();
  id v7 = [(CRLCanvasLayout *)self info];
  id v8 = sub_1002469D0(v6, v7);

  uint64_t v9 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  [(CRLCommandGroup *)v9 addCommand:v5];
  if (!a3)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v10 = [v8 allNestedChildrenItemsIncludingGroups];
    id v11 = [v10 countByEnumeratingWithState:&v30 objects:v43 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = &off_101667000;
      uint64_t v14 = *(void *)v31;
      double v29 = v10;
      do
      {
        CGRect v15 = 0;
        do
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v10);
          }
          CGRect v16 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v15);
          if (v16 != v8)
          {
            CGFloat v17 = (objc_class *)objc_opt_class();
            double v18 = sub_10024715C(v17, v16);
            if ([v18 aspectRatioLocked])
            {
              if (([v18 canAspectRatioLockBeChangedByUser] & 1) == 0)
              {
                unsigned __int8 v19 = v9;
                unsigned int v20 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014E6770);
                }
                long long v21 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109890;
                  unsigned int v36 = v20;
                  __int16 v37 = 2082;
                  id v38 = "-[CRLGroupLayout commandForSettingAspectRatioLocked:]";
                  __int16 v39 = 2082;
                  long long v40 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m";
                  __int16 v41 = 1024;
                  int v42 = 411;
                  _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Able to change aspect ratio of a group with children whose aspect ratio cannot be changed by the user!", buf, 0x22u);
                }
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014E6790);
                }
                long long v22 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                {
                  long long v26 = v22;
                  long long v27 = +[CRLAssertionHandler packedBacktraceString];
                  *(_DWORD *)buf = 67109378;
                  unsigned int v36 = v20;
                  __int16 v37 = 2114;
                  id v38 = v27;
                  _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                }
                long long v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupLayout commandForSettingAspectRatioLocked:]");
                long long v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m"];
                +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:411 isFatal:0 description:"Able to change aspect ratio of a group with children whose aspect ratio cannot be changed by the user!"];

                uint64_t v9 = v19;
                uint64_t v10 = v29;
                uint64_t v13 = &off_101667000;
              }
              id v25 = [objc_alloc((Class)(v13 + 415)) initWithBoardItem:v18 aspectRatioLocked:0];
              [(CRLCommandGroup *)v9 addCommand:v25];
            }
          }
          CGRect v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        id v12 = [v10 countByEnumeratingWithState:&v30 objects:v43 count:16];
      }
      while (v12);
    }
  }

  return v9;
}

- (BOOL)shouldSnapWhileResizing
{
  [(CRLCanvasAbstractLayout *)self transformInRoot];
  char v3 = [(CRLCanvasLayout *)self pureGeometry];
  [v3 size];
  BOOL v6 = sub_10007F8A0(&v8, v4, v5);

  return v6;
}

- (void)takeSizeFromTracker:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRLGroupLayout;
  [(CRLCanvasLayout *)&v20 takeSizeFromTracker:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  if (v4) {
    [v4 transformForLayout:self];
  }
  double v5 = [(CRLCanvasLayout *)self originalGeometry];
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  BOOL v6 = [v5 geometryByTransformingBy:v16];

  [(CRLGroupLayout *)self setDynamicGeometry:v6];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [(CRLGroupLayout *)self p_groupedChildren];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) takeSizeFromTracker:v4];
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v21 count:16];
    }
    while (v9);
  }

  [(CRLCanvasLayout *)self invalidateFrame];
  [(CRLCanvasLayout *)self invalidateChildren];
}

- (CGSize)minimumSize
{
  double v3 = *(double *)((char *)&self->_boundsForStandardKnobs.size.width + 2);
  double v38 = *(double *)((char *)&self->_boundsForStandardKnobs.origin.y + 2);
  unsigned __int8 v4 = [(CRLGroupLayout *)self resizeMayChangeAspectRatio];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  double v5 = [(CRLGroupLayout *)self p_groupedChildren];
  id v6 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v41;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        [v12 minimumSize];
        double v14 = v13;
        double v16 = v15;
        if ((v4 & 1) == 0)
        {
          long long v17 = [v12 pureGeometry];
          [v17 size];
          sub_100066FC4(v14, v16, v18, v19);
        }
        double v20 = sub_100064070();
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        long long v27 = [v12 pureGeometry];
        long long v28 = v27;
        if (v27) {
          [v27 transform];
        }
        else {
          memset(&v39, 0, sizeof(v39));
        }
        v46.origin.CGFloat x = v20;
        v46.origin.CGFloat y = v22;
        v46.size.double width = v24;
        v46.size.double height = v26;
        CGRect v47 = CGRectApplyAffineTransform(v46, &v39);
        double width = v47.size.width;
        double height = v47.size.height;

        long long v31 = [v12 pureGeometry];
        [v31 frame];
        double v33 = v32;
        double v35 = v34;

        if (v33 > 1.0e-11) {
          double v10 = fmax(v10, width / v33);
        }
        if (v35 > 1.0e-11) {
          double v9 = fmax(v9, height / v35);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
    double v10 = 0.0;
  }

  double v36 = v38 * v10;
  double v37 = v3 * v9;
  result.double height = v37;
  result.double width = v36;
  return result;
}

- (void)takeFreeTransformFromTracker:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRLGroupLayout;
  [(CRLCanvasLayout *)&v20 takeFreeTransformFromTracker:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  if (v4) {
    [v4 freeTransformForLayout:self];
  }
  double v5 = [(CRLCanvasLayout *)self originalGeometry];
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  id v6 = [v5 geometryByTransformingBy:v16];

  [(CRLGroupLayout *)self setDynamicGeometry:v6];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [(CRLGroupLayout *)self p_groupedChildren];
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) takeFreeTransformFromTracker:v4];
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v21 count:16];
    }
    while (v9);
  }

  if ([v4 isResizing])
  {
    [(CRLCanvasLayout *)self invalidateFrame];
    [(CRLCanvasLayout *)self invalidateChildren];
  }
}

- (void)endDynamicOperation
{
  *(_DWORD *)((char *)&self->_cachedGroupedChildren + 6) = 0;
  [(CRLGroupLayout *)self p_destroyDynamicCopies];
  v3.receiver = self;
  v3.super_class = (Class)CRLGroupLayout;
  [(CRLCanvasLayout *)&v3 endDynamicOperation];
}

- (void)i_clearInvalidationCache
{
  v3.receiver = self;
  v3.super_class = (Class)CRLGroupLayout;
  [(CRLCanvasLayout *)&v3 i_clearInvalidationCache];
  BYTE2(self->_cachedGroupedChildren) = 0;
}

- (void)invalidate
{
  if (!BYTE2(self->_cachedGroupedChildren))
  {
    BYTE2(self->_cachedGroupedChildren) = [(CRLCanvasLayout *)self layoutState] != 0;
    v5.receiver = self;
    v5.super_class = (Class)CRLGroupLayout;
    [(CRLCanvasLayout *)&v5 invalidate];
    if ([(CRLCanvasLayout *)self layoutState] != 2)
    {
      objc_super v3 = *(void **)((char *)&self->_boundsForStandardKnobs.size.height + 2);
      *(CGFloat *)((char *)&self->_boundsForStandardKnobs.size.height + 2) = 0.0;

      id v4 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
      *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2) = 0;
    }
    [(CRLCanvasLayout *)self invalidatePositionWithoutSideEffects];
    [(CRLCanvasLayout *)self invalidateSizeWithoutSideEffects];
    [(CRLCanvasLayout *)self invalidateCacheForMagnets];
  }
}

- (void)updateChildrenFromInfo
{
  v4.receiver = self;
  v4.super_class = (Class)CRLGroupLayout;
  [(CRLCanvasLayout *)&v4 updateChildrenFromInfo];
  objc_super v3 = *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2);
  *(CRLBezierPath **)((char *)&self->_cachedPathForClippingConnectionLines + 2) = 0;
}

- (BOOL)isDraggable
{
  return 1;
}

- (BOOL)shouldDisplayGuides
{
  objc_super v3 = [(CRLGroupLayout *)self p_groupItem];
  unsigned __int8 v4 = [v3 isEffectivelyEmpty];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLGroupLayout;
  return [(CRLCanvasLayout *)&v6 shouldDisplayGuides];
}

- (BOOL)providesGuidesForChildLayouts
{
  return 1;
}

- (id)layoutsForProvidingGuidesForChildLayouts
{
  int v2 = [(CRLGroupLayout *)self p_groupedChildren];
  objc_super v3 = [v2 array];

  return v3;
}

- (BOOL)allowsConnections
{
  int v2 = [(CRLCanvasLayout *)self info];
  objc_super v3 = [v2 childInfos];
  if ([v3 count]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v2 isFreehandDrawing];
  }

  return v4;
}

- (BOOL)supportsRotation
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v2 = [(CRLCanvasAbstractLayout *)self children];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = objc_opt_class();
        id v9 = [v7 info];
        uint64_t v10 = sub_1002469D0(v8, v9);

        LODWORD(v9) = [v10 supportsParentRotation];
        if (!v9)
        {
          BOOL v11 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)supportsFlipping
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v2 = [(CRLCanvasAbstractLayout *)self children];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v9 + 1) + 8 * i) supportsParentFlipping])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)supportsParentFlipping
{
  v14.receiver = self;
  v14.super_class = (Class)CRLGroupLayout;
  if (![(CRLCanvasLayout *)&v14 supportsParentFlipping]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(CRLGroupLayout *)self p_groupedChildren];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v10 + 1) + 8 * i) supportsParentFlipping])
        {
          BOOL v8 = 0;
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (id)commandToFlipWithOrientation:(int)a3
{
  [(CRLGroupLayout *)self boundsForStandardKnobs];
  if (a3)
  {
    CGFloat MidY = CGRectGetMidY(*(CGRect *)&v5);
    double v10 = MidY + MidY;
    double v11 = 1.0;
    double v12 = -1.0;
    double v13 = 0.0;
  }
  else
  {
    CGFloat MidX = CGRectGetMidX(*(CGRect *)&v5);
    double v13 = MidX + MidX;
    double v11 = -1.0;
    double v12 = 1.0;
    double v10 = 0.0;
  }
  long long v33 = 0uLL;
  long long v15 = [(CRLCanvasAbstractLayout *)self geometry];
  long long v16 = v15;
  if (v15) {
    [v15 transform];
  }
  else {
    memset(v31, 0, sizeof(v31));
  }
  double v27 = v11;
  long long v28 = v33;
  *(double *)&long long v29 = v12;
  *((double *)&v29 + 1) = v13;
  double v30 = v10;
  sub_10007FBA4(&v27, v31, &v32);
  CGFloat a = v32.a;
  long long v33 = *(_OWORD *)&v32.b;
  long long v26 = *(_OWORD *)&v32.d;
  tCGFloat y = v32.ty;

  long long v19 = [(CRLCanvasLayout *)self info];
  objc_super v20 = [v19 geometry];
  double v27 = a;
  long long v28 = v33;
  long long v29 = v26;
  double v30 = ty;
  double v21 = [v20 geometryByAppendingTransform:&v27];

  CGFloat v22 = [_TtC8Freeform25CRLCommandSetInfoGeometry alloc];
  double v23 = [(CRLGroupLayout *)self boardItem];
  CGFloat v24 = [(CRLCommandSetInfoGeometry *)v22 initWithBoardItem:v23 geometry:v21];

  return v24;
}

- (id)p_childWrapPathsFrom:(id)a3 inDescendents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v37;
    id v27 = v8;
    id v28 = v6;
    uint64_t v26 = *(void *)v37;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v37 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v14 = objc_opt_class();
        long long v15 = sub_1002469D0(v14, v13);
        if (v15)
        {
          if (![v6 containsObject:v15]) {
            goto LABEL_25;
          }
          long long v16 = [v13 i_wrapPath];
          id v17 = [v16 copy];

          if (v13) {
            [v13 transform];
          }
          else {
            memset(v35, 0, sizeof(v35));
          }
          [v17 transformUsingAffineTransform:v35, v26, v27, v28];
          [v7 addObject:v17];
        }
        else
        {
          if (![v13 conformsToProtocol:&OBJC_PROTOCOL___CRLCanvasWrappableParent]) {
            goto LABEL_25;
          }
          long long v18 = [v13 children];
          long long v19 = [(CRLGroupLayout *)self p_childWrapPathsFrom:v18 inDescendents:v6];

          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v17 = v19;
          id v20 = [v17 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v32;
            do
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(void *)v32 != v22) {
                  objc_enumerationMutation(v17);
                }
                id v24 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) copy:v26, v27, v28];
                if (v13) {
                  [v13 transform];
                }
                else {
                  memset(v30, 0, sizeof(v30));
                }
                [v24 transformUsingAffineTransform:v30];
                [v7 addObject:v24];
              }
              id v21 = [v17 countByEnumeratingWithState:&v31 objects:v40 count:16];
            }
            while (v21);
          }

          id v8 = v27;
          id v6 = v28;
          uint64_t v11 = v26;
        }

LABEL_25:
      }
      id v10 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)computeWrapPath
{
  id v3 = [(CRLGroupLayout *)self descendentWrappables];
  id v4 = [objc_alloc((Class)NSHashTable) initWithOptions:512 capacity:[v3 count]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObject:*(void *)(*((void *)&v14 + 1) + 8 * i) v14];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v10 = [(CRLCanvasAbstractLayout *)self children];
  uint64_t v11 = [(CRLGroupLayout *)self p_childWrapPathsFrom:v10 inDescendents:v4];

  double v12 = +[CRLBezierPath uniteBezierPaths:v11];

  return v12;
}

- (id)i_wrapPath
{
  if (!*(void *)((char *)&self->_boundsForStandardKnobs.size.height + 2))
  {
    id v3 = [(CRLCanvasAbstractLayout *)self children];
    if ([v3 count])
    {
      id v4 = [(CRLGroupLayout *)self p_groupItem];
      unsigned __int8 v5 = [v4 isEffectivelyEmpty];

      if ((v5 & 1) == 0)
      {
        uint64_t v6 = [(CRLGroupLayout *)self computeWrapPath];
LABEL_7:
        id v7 = *(void **)((char *)&self->_boundsForStandardKnobs.size.height + 2);
        *(void *)((char *)&self->_boundsForStandardKnobs.size.height + 2) = v6;

        goto LABEL_8;
      }
    }
    else
    {
    }
    [(CRLGroupLayout *)self boundsForStandardKnobs];
    uint64_t v6 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:");
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v8 = *(void **)((char *)&self->_boundsForStandardKnobs.size.height + 2);

  return v8;
}

- (id)pathForClippingConnectionLines
{
  id v3 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
  if (!v3)
  {
    id v4 = [(CRLGroupLayout *)self i_wrapPath];
    unsigned __int8 v5 = +[CRLBezierPath exteriorOfBezierPath:v4];
    uint64_t v6 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
    *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2) = v5;

    id v3 = *(CRLBezierPath **)((char *)&self->_cachedWrapPath + 2);
  }

  return v3;
}

- (CGRect)rectInRootForCalculatingActivityLineEndpoint
{
  [(CRLGroupLayout *)self boundsForStandardKnobs];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  uint64_t v11 = [(CRLCanvasAbstractLayout *)self geometryInRoot];
  double v12 = v11;
  if (v11) {
    [v11 transform];
  }
  else {
    memset(&v21, 0, sizeof(v21));
  }
  v22.origin.CGFloat x = v4;
  v22.origin.CGFloat y = v6;
  v22.size.CGFloat width = v8;
  v22.size.CGFloat height = v10;
  CGRect v23 = CGRectApplyAffineTransform(v22, &v21);
  CGFloat x = v23.origin.x;
  CGFloat y = v23.origin.y;
  CGFloat width = v23.size.width;
  CGFloat height = v23.size.height;

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)transferLayoutGeometryToInfo:(id)a3 withAdditionalTransform:(CGAffineTransform *)a4 assertIfInDocument:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CRLGroupLayout;
  long long v9 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v26.CGFloat a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v26.c = v9;
  *(_OWORD *)&v26.tCGFloat x = *(_OWORD *)&a4->tx;
  [(CRLCanvasLayout *)&v27 transferLayoutGeometryToInfo:v8 withAdditionalTransform:&v26 assertIfInDocument:v5];
  CGFloat v10 = [(CRLGroupLayout *)self p_groupItem];
  uint64_t v11 = [v10 childItems];

  uint64_t v12 = objc_opt_class();
  double v13 = sub_1002469D0(v12, v8);
  memset(&v26, 0, sizeof(v26));
  [(CRLGroupLayout *)self boundsForStandardKnobs];
  CGFloat v15 = -v14;
  [(CRLGroupLayout *)self boundsForStandardKnobs];
  CGAffineTransformMakeTranslation(&v26, v15, -v16);
  double v17 = (char *)[v11 count];
  if (v17)
  {
    double v18 = v17;
    for (i = 0; i != v18; ++i)
    {
      double v20 = [(CRLCanvasLayout *)self layoutController];
      CGAffineTransform v21 = [v11 objectAtIndexedSubscript:i];
      CGRect v22 = [v20 layoutForInfo:v21];

      CGRect v23 = [v13 childItems];
      id v24 = [v23 objectAtIndexedSubscript:i];
      CGAffineTransform v25 = v26;
      [v22 transferLayoutGeometryToInfo:v24 withAdditionalTransform:&v25 assertIfInDocument:v5];
    }
  }
}

- (id)commandToClampModelToLayoutSizeWithAdditionalTransform:(CGAffineTransform *)a3
{
  BOOL v5 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  long long v6 = *(_OWORD *)((char *)&self->_boundsForStandardKnobs.origin.y + 2);
  long long v31 = *(_OWORD *)((char *)&self->_dynamicLayoutGeometry + 2);
  long long v32 = v6;
  *(CGPoint *)((char *)&self->_dynamicLayoutGeometry + 2) = CGPointZero;
  v30.receiver = self;
  v30.super_class = (Class)CRLGroupLayout;
  long long v7 = *(_OWORD *)&a3->c;
  long long v27 = *(_OWORD *)&a3->a;
  long long v28 = v7;
  long long v29 = *(_OWORD *)&a3->tx;
  id v8 = [(CRLCanvasLayout *)&v30 commandToClampModelToLayoutSizeWithAdditionalTransform:&v27];
  long long v9 = v32;
  *(_OWORD *)((char *)&self->_dynamicLayoutGeometry + 2) = v31;
  *(_OWORD *)((char *)&self->_boundsForStandardKnobs.origin.y + 2) = v9;
  if (v8) {
    [(CRLCommandGroup *)v5 addCommand:v8];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  CGFloat v10 = [(CRLGroupLayout *)self p_groupedChildren];
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
    long long v21 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v22 = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v20 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v10);
        }
        CGFloat v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v27 = v22;
        long long v28 = v21;
        long long v29 = v20;
        double v16 = [v15 commandToClampModelToLayoutSizeWithAdditionalTransform:&v27 v20, v21, v22];
        if (v16) {
          [(CRLCommandGroup *)v5 addCommand:v16];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v12);
  }

  if ([(CRLCommandGroup *)v5 isEmpty]) {
    double v17 = 0;
  }
  else {
    double v17 = v5;
  }
  double v18 = v17;

  return v18;
}

- (id)descendentWrappables
{
  id v3 = objc_alloc((Class)NSMutableArray);
  CGFloat v4 = [(CRLCanvasAbstractLayout *)self children];
  id v5 = [v3 initWithCapacity:[v4 count]];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v6 = [(CRLCanvasAbstractLayout *)self children];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 conformsToProtocol:&OBJC_PROTOCOL___CRLCanvasWrappable]) {
          [v5 addObject:v11];
        }
        if ([v11 conformsToProtocol:&OBJC_PROTOCOL___CRLCanvasWrappableParent])
        {
          id v12 = [v11 descendentWrappables];
          [v5 addObjectsFromArray:v12];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)descendentWrappablesContainsWrappable:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parent];

  if (v5 == self)
  {
    unsigned __int8 v16 = 1;
  }
  else
  {
    uint64_t v6 = objc_opt_class();
    id v7 = sub_1002469D0(v6, v4);
    id v8 = [(CRLCanvasAbstractLayout *)self childLayoutContainingPossibleDescendentLayout:v7];
    long long v15 = sub_100246AC8(v8, 1, v9, v10, v11, v12, v13, v14, (uint64_t)&OBJC_PROTOCOL___CRLCanvasWrappableParent);

    if (v15) {
      unsigned __int8 v16 = [v15 descendentWrappablesContainsWrappable:v4];
    }
    else {
      unsigned __int8 v16 = 0;
    }
  }
  return v16;
}

- (void)p_createDynamicCopies
{
  if (*(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E67B0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101092924();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E67D0);
    }
    id v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupLayout p_createDynamicCopies]");
    id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 773, 0, "expected nil value for '%{public}s'", "_dynamicLayoutGeometry");
  }
  uint64_t v6 = [(CRLCanvasAbstractLayout *)self geometry];
  id v7 = (CRLCanvasInfoGeometry *)[v6 copy];
  id v8 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2) = v7;
}

- (void)setDynamicGeometry:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLGroupLayout;
  id v4 = a3;
  [(CRLCanvasLayout *)&v7 setDynamicGeometry:v4];
  id v5 = [v4 copy];

  uint64_t v6 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2) = v5;
}

- (void)p_destroyDynamicCopies
{
  id v3 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E67F0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010929D4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6810);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupLayout p_destroyDynamicCopies]");
    uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupLayout.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 783, 0, "invalid nil value for '%{public}s'", "_dynamicLayoutGeometry");

    id v3 = *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2);
  }
  *(CRLCanvasInfoGeometry **)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2) = 0;
}

- (id)p_groupedChildren
{
  int v2 = [(CRLCanvasAbstractLayout *)self children];
  id v3 = +[NSOrderedSet orderedSetWithArray:v2];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_cachedPathForClippingConnectionLines + 2), 0);
  objc_storeStrong((id *)((char *)&self->_cachedWrapPath + 2), 0);
  objc_storeStrong((id *)((char *)&self->_boundsForStandardKnobs.size.height + 2), 0);

  objc_storeStrong((id *)((char *)&self->super.mInfoGeometryBeforeDynamicOperation + 2), 0);
}

@end