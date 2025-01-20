@interface CRLGroupItem
+ (CGSize)unscaledSizeForEmptyGroups;
+ (id)groupGeometryFromChildrenInfos:(id)a3;
+ (id)groupGeometryFromChildrenInfos:(id)a3 currentlyLaidOutWithLayoutController:(id)a4;
- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)containsUnknownContent;
- (BOOL)isEffectivelyEmpty;
- (BOOL)isFreehandDrawing;
- (BOOL)isNonGroupedChild:(id)a3;
- (BOOL)isSelectable;
- (BOOL)makeChildGeometriesRelativeAndComputeOwnAbsoluteGeometryAndReturnError:(id *)a3;
- (BOOL)requiresAdditionalBoardItemsForCopyImaging;
- (BOOL)shouldBeIgnoredWhenCopying;
- (BOOL)supportsParentRotation;
- (BOOL)wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)additionalBoardItemsForUUIDBookkeepingForTemporaryCanvases;
- (NSArray)allNestedChildrenItemsExcludingGroups;
- (NSArray)allNestedChildrenItemsIncludingGroups;
- (NSArray)allNestedNonGroupChildItemsTreatingFreehandDrawingAsLeafNode;
- (id)groupedGeometryForChildItem:(id)a3;
- (id)ungroupedGeometryForChildItem:(id)a3;
- (void)crl_onBoard:(id)a3 moveItemToPosition:(CGPoint)a4 size:(CGSize)a5;
- (void)prepareBoardItemForConnectorModeDuplication;
@end

@implementation CRLGroupItem

- (void)crl_onBoard:(id)a3 moveItemToPosition:(CGPoint)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  [(CRLGroupItem *)self allNestedChildrenItemsIncludingGroups];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [v11 countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v61;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v61 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = [*(id *)(*((void *)&v60 + 1) + 8 * i) geometry];
        if (![v15 widthValid] || (objc_msgSend(v15, "heightValid") & 1) == 0)
        {

          [(CRLBoardItem *)self visibleBoundsForPositioning];
          goto LABEL_65;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v60 objects:v67 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  [(CRLBoardItem *)self visibleBoundsForPositioning];
  double v18 = v16;
  double v19 = v17;
  if (v16 != width || v17 != height)
  {
    if (v16 <= 0.0)
    {
      double v20 = 0.0;
      if (width != 0.0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FB600);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B5620();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FB620);
        }
        v21 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B5570(v21);
        }
        v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]");
        v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"];
        +[CRLAssertionHandler handleFailureInFunction:v22 file:v23 lineNumber:195 isFatal:0 description:"Desired size is an impossible multiple of current size."];
      }
    }
    else
    {
      double v20 = width / v16;
    }
    if (v19 <= 0.0)
    {
      double v24 = 0.0;
      if (height != 0.0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FB640);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B54E8();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FB660);
        }
        v25 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B5438(v25);
        }
        v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]");
        v27 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"];
        +[CRLAssertionHandler handleFailureInFunction:v26 file:v27 lineNumber:201 isFatal:0 description:"Desired size is an impossible multiple of current size."];
      }
    }
    else
    {
      double v24 = height / v19;
    }
    if (v20 == 0.0)
    {
      double v20 = v24;
    }
    else if (v24 == 0.0)
    {
      double v24 = v20;
    }
    if (v24 != v20 && vabdd_f64(v24, v20) >= 0.00999999978)
    {
      unsigned int v28 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FB680);
      }
      v29 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&buf[4] = v28;
        *(_WORD *)v66 = 2082;
        *(void *)&v66[2] = "-[CRLGroupItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]";
        *(_WORD *)&v66[10] = 2082;
        *(void *)&v66[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m";
        *(_WORD *)&v66[20] = 1024;
        *(_DWORD *)&v66[22] = 208;
        *(_WORD *)&v66[26] = 2048;
        *(double *)&v66[28] = v24;
        *(_WORD *)&v66[36] = 2048;
        *(double *)&v66[38] = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d group resize is off-scale (%f vs %f)", buf, 0x36u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FB6A0);
      }
      v30 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B5388(v30);
      }
      v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]");
      v32 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 208, 0, "group resize is off-scale (%f vs %f)", *(void *)&v24, *(void *)&v20);
    }
    *(void *)buf = 0;
    *(void *)v66 = buf;
    *(void *)&v66[8] = 0x3010000000;
    *(void *)&v66[16] = "";
    *(CGSize *)&v66[24] = CGSizeZero;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10045FCB8;
    v59[3] = &unk_1014D60A8;
    v59[4] = buf;
    [(CRLBoardItem *)self withTemporaryLayoutPerform:v59];
    double v33 = *(double *)(*(void *)v66 + 32);
    double v34 = *(double *)(*(void *)v66 + 40);
    if (height < v34 || (double v34 = height, width < v33))
    {
      double v35 = v34 / v19;
      if (width >= v33) {
        double v33 = width;
      }
      double v24 = fmax(v35, v33 / v18);
      double v20 = v24;
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v36 = [(CRLGroupItem *)self childrenToPosition];
    id v37 = [v36 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v56;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v56 != v38) {
            objc_enumerationMutation(v36);
          }
          v40 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
          uint64_t v41 = objc_opt_class();
          v42 = sub_1002469D0(v41, v40);
          [v42 visibleBoundsForPositioning];
          [v42 crl_onBoard:v10 moveItemToPosition:v20 * v43 size:v20 * v45];
        }
        id v37 = [v36 countByEnumeratingWithState:&v55 objects:v64 count:16];
      }
      while (v37);
    }

    _Block_object_dispose(buf, 8);
  }
LABEL_65:
  [(CRLBoardItem *)self visibleBoundsForPositioning];
  double v49 = v48;
  if (v48 != x || v47 != y)
  {
    v50 = [(CRLBoardItemBase *)self geometry];
    id v51 = [v50 mutableCopy];

    double v52 = sub_100064680(x, y, v49);
    [v51 position];
    [v51 setPosition:sub_100064698(v53, v54, v52)];
    [(CRLBoardItemBase *)self setGeometry:v51];
  }
}

- (BOOL)isSelectable
{
  v2 = self;
  if (sub_1005436E8())
  {

    char v3 = 0;
  }
  else
  {
    char v4 = sub_100543860();

    char v3 = v4 ^ 1;
  }
  return v3 & 1;
}

- (Class)layoutClass
{
  sub_10050BF48(0, &qword_101673078);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  sub_10050BF48(0, &qword_101673070);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  sub_10050BF48(0, &qword_101673068);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)prepareBoardItemForConnectorModeDuplication
{
  uint64_t v3 = OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems;
  char v4 = *(double **)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8Freeform16CRLContainerItem__cachedOrderedItems);
  v5 = self;
  if (!v4)
  {
    sub_100846AB0();
    char v4 = *(double **)((char *)&self->super.super.super.super.isa + v3);
  }
  if (v4) {
    unint64_t v6 = (unint64_t)v4;
  }
  else {
    unint64_t v6 = (unint64_t)_swiftEmptyArrayStorage;
  }
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v7) {
      goto LABEL_15;
    }
  }
  if (v7 < 1)
  {
    __break(1u);
    return;
  }
  for (uint64_t i = 0; i != v7; ++i)
  {
    if ((v6 & 0xC000000000000001) != 0) {
      v9 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      v9 = *(id *)(v6 + 8 * i + 32);
    }
    id v10 = v9;
    (*(void (**)(void))((swift_isaMask & *v9) + 0x178))();
  }
LABEL_15:

  swift_bridgeObjectRelease();
}

- (BOOL)isFreehandDrawing
{
  return 0;
}

- (BOOL)isNonGroupedChild:(id)a3
{
  return 0;
}

- (NSArray)allNestedChildrenItemsIncludingGroups
{
  return (NSArray *)sub_100543450(self, (uint64_t)a2, (void (*)(void))sub_1005430E4);
}

- (NSArray)allNestedChildrenItemsExcludingGroups
{
  return (NSArray *)sub_100543450(self, (uint64_t)a2, (void (*)(void))sub_100543298);
}

- (NSArray)allNestedNonGroupChildItemsTreatingFreehandDrawingAsLeafNode
{
  return (NSArray *)sub_100543450(self, (uint64_t)a2, (void (*)(void))sub_1005434BC);
}

- (BOOL)isEffectivelyEmpty
{
  v2 = self;
  char v3 = sub_1005436E8();

  return v3 & 1;
}

- (BOOL)containsUnknownContent
{
  v2 = self;
  char v3 = sub_100543860();

  return v3 & 1;
}

- (BOOL)requiresAdditionalBoardItemsForCopyImaging
{
  v2 = self;
  char v3 = sub_100543A64();

  return v3 & 1;
}

- (BOOL)shouldBeIgnoredWhenCopying
{
  v2 = self;
  char v3 = sub_100543C18();

  return v3 & 1;
}

+ (CGSize)unscaledSizeForEmptyGroups
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)supportsParentRotation
{
  double v2 = self;
  char v3 = sub_100543DE4();

  return v3 & 1;
}

- (BOOL)wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent
{
  return 0;
}

+ (id)groupGeometryFromChildrenInfos:(id)a3
{
  type metadata accessor for CRLBoardItem(0);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  char v4 = (void *)sub_100544014(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (id)groupGeometryFromChildrenInfos:(id)a3 currentlyLaidOutWithLayoutController:(id)a4
{
  type metadata accessor for CRLBoardItem(0);
  unint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = a4;
  id v7 = sub_1005459DC(v5, v6);

  swift_bridgeObjectRelease();

  return v7;
}

- (id)groupedGeometryForChildItem:(id)a3
{
  char v4 = *(uint64_t (**)(void))((*(void *)a3 & swift_isaMask) + 0xE0);
  id v5 = a3;
  id v6 = self;
  id v7 = (void *)v4();
  v8 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&v6->super.super.super.super.isa
                                                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                         + 288);
  uint64_t v9 = swift_retain();
  id v10 = (void *)v8(v9);
  swift_release();
  id v11 = [v7 geometryRelativeToGeometry:v10];

  return v11;
}

- (id)ungroupedGeometryForChildItem:(id)a3
{
  char v4 = a3;
  id v5 = self;
  id v6 = sub_1005445BC(v4);

  return v6;
}

- (BOOL)makeChildGeometriesRelativeAndComputeOwnAbsoluteGeometryAndReturnError:(id *)a3
{
  unint64_t v3 = self;
  sub_100544BBC();

  return 1;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  double v2 = self;
  char v3 = sub_100545048();

  return v3 & 1;
}

- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock
{
  double v2 = self;
  char v3 = sub_100545264();

  return v3 & 1;
}

- (NSArray)additionalBoardItemsForUUIDBookkeepingForTemporaryCanvases
{
  double v2 = self;
  char v3 = sub_1005430E4();
  sub_1006E0C70((unint64_t)v3);

  type metadata accessor for CRLBoardItem(0);
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

@end