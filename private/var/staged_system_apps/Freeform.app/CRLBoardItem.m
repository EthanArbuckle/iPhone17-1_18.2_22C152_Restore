@interface CRLBoardItem
- (BOOL)allowedToBeDragAndDropped;
- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock;
- (BOOL)aspectRatioLocked;
- (BOOL)canAdjustHeightInInspector;
- (BOOL)canAdjustPositionInInspector;
- (BOOL)canAdjustWidthInInspector;
- (BOOL)canBeGrouped;
- (BOOL)canCopyData;
- (BOOL)crl_isEqualValue:(id)a3;
- (BOOL)enableDefaultFloatingEffect;
- (BOOL)excludedFromMultiselectResizeInfo;
- (BOOL)isAllowedInFreehandDrawings;
- (BOOL)isInBoard;
- (BOOL)isLockable;
- (BOOL)isPreviewable;
- (BOOL)isSelectable;
- (BOOL)isShareable;
- (BOOL)isSupported;
- (BOOL)isTransactableEqualValue:(id)a3;
- (BOOL)locked;
- (BOOL)needsDownload;
- (BOOL)placeHolderDataNeedsDownload;
- (BOOL)requiresAdditionalBoardItemsForCopyImaging;
- (BOOL)shouldBeDeletedWhenEndEditing;
- (BOOL)shouldBeIgnoredWhenCopying;
- (BOOL)supportsParentRotation;
- (BOOL)supportsResize;
- (BOOL)wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent;
- (BOOL)wantsStandardPublicTypesInAdditionToCustomTypesToPromiseWhenCopyingSingleBoardItem;
- (CGAffineTransform)computeFullTransform;
- (CGAffineTransform)computeLayoutFullTransform;
- (CGAffineTransform)fullTransformInRoot;
- (CGAffineTransform)transformInRoot;
- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 dynamicallyDraggedLayout:(id)a4;
- (CGPoint)centerForReplacingWithNewItem;
- (CGRect)visibleBoundsForPositioning;
- (CRLCanvasInfoGeometry)geometry;
- (CRLShadow)shadow;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)additionalBoardItemsForUUIDBookkeepingForTemporaryCanvases;
- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem;
- (NSArray)stringContentForSearch;
- (NSString)accessibilityDescription;
- (NSString)localizedAccessibilityDescriptionPlaceholder;
- (NSString)localizedName;
- (NSString)previewTooltip;
- (NSString)suggestedNameWhenDraggingSingleBoardItem;
- (NSURL)hyperlinkURL;
- (NSUUID)id;
- (NSUUID)parentUUID;
- (_TtC8Freeform12CRLBoardItem)init;
- (_TtC8Freeform12CRLBoardItem)parentItem;
- (_TtC8Freeform12CRLGroupItem)containingGroup;
- (_TtC8Freeform16CRLContainerItem)parentContainerItem;
- (_TtC8Freeform8CRLBoard)parentBoard;
- (double)viewScaleToUseWhenRasterizingSingleBoardItemForCopy;
- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3;
- (id)promisedDataForPublicType:(id)a3;
- (id)promisedStringForCopy;
- (int64_t)compareUsingUUIDTo:(id)a3;
- (void)crl_onBoard:(id)a3 moveItemToPosition:(CGPoint)a4 size:(CGSize)a5;
- (void)p_onBoard:(id)a3 setPositionerCalculatedSize:(CGSize)a4;
- (void)setAccessibilityDescription:(id)a3;
- (void)setAspectRatioLocked:(BOOL)a3;
- (void)setGeometry:(id)a3;
- (void)setHyperlinkURL:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)setParentInfo:(id)a3;
- (void)setShadow:(id)a3;
- (void)takePropertiesFromReplacedBoardItem:(id)a3;
- (void)updateGeometryToReplaceBoardItem:(id)a3;
- (void)withTemporaryLayoutPerform:(id)a3;
@end

@implementation CRLBoardItem

- (CGRect)visibleBoundsForPositioning
{
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x4010000000;
  v20 = "";
  long long v21 = 0u;
  long long v22 = 0u;
  v3 = [(CRLBoardItem *)self geometry];
  [v3 boundsBeforeRotation];
  *(void *)&long long v21 = v4;
  *((void *)&v21 + 1) = v5;
  *(void *)&long long v22 = v6;
  *((void *)&v22 + 1) = v7;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10045E604;
  v16[3] = &unk_1014D60A8;
  v16[4] = &v17;
  [(CRLBoardItem *)self withTemporaryLayoutPerform:v16];
  double v8 = v18[4];
  double v9 = v18[5];
  double v10 = v18[6];
  double v11 = v18[7];
  _Block_object_dispose(&v17, 8);
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)p_onBoard:(id)a3 setPositionerCalculatedSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v7 = [(CRLBoardItem *)self geometry];
  id v10 = [v7 mutableCopy];

  if (width < 0.0 && (fabs(width) < 0.001 || width == 0.0)) {
    double width = 0.0;
  }
  if (height < 0.0 && (fabs(height) < 0.001 || height == 0.0)) {
    double height = 0.0;
  }
  [v10 setSize:width, height];
  [(CRLBoardItem *)self setGeometry:v10];
}

- (void)crl_onBoard:(id)a3 moveItemToPosition:(CGPoint)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  [(CRLBoardItem *)self visibleBoundsForPositioning];
  if (v11 != width || v12 != height)
  {
    double v14 = v12;
    if (v11 <= 0.0)
    {
      double v15 = 0.0;
      if (width != 0.0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FB500);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B51F0();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FB520);
        }
        v16 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010690A0(v16);
        }
        uint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]");
        v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"];
        +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:56 isFatal:0 description:"Desired size is an impossible multiple of current size."];
      }
    }
    else
    {
      double v15 = width / v11;
    }
    if (v14 <= 0.0)
    {
      double v19 = 0.0;
      if (height != 0.0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FB540);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B5168();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FB560);
        }
        v20 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010690A0(v20);
        }
        long long v21 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]");
        long long v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"];
        +[CRLAssertionHandler handleFailureInFunction:v21 file:v22 lineNumber:62 isFatal:0 description:"Desired size is an impossible multiple of current size."];
      }
    }
    else
    {
      double v19 = height / v14;
    }
    memset(&v42, 0, sizeof(v42));
    CGAffineTransformMakeScale(&v42, v15, v19);
    memset(&v41, 0, sizeof(v41));
    v23 = [(CRLBoardItem *)self geometry];
    [v23 angle];
    CGAffineTransformMakeRotation(&v40, v24 * 0.0174532925);
    CGAffineTransform v39 = v42;
    sub_10007FC38(&v39, &v40, &v41);

    v25 = [(CRLBoardItem *)self geometry];
    [v25 size];
    double v28 = v26 * v41.c + v41.a * v27;
    double v29 = v26 * v41.d + v41.b * v27;

    -[CRLBoardItem p_onBoard:setPositionerCalculatedSize:](self, "p_onBoard:setPositionerCalculatedSize:", v10, v28, v29);
  }
  [(CRLBoardItem *)self visibleBoundsForPositioning];
  if (v30 != x || v31 != y)
  {
    double v33 = v30;
    v34 = [(CRLBoardItem *)self geometry];
    id v35 = [v34 mutableCopy];

    double v36 = sub_100064680(x, y, v33);
    [v35 position];
    [v35 setPosition:sub_100064698(v37, v38, v36)];
    [(CRLBoardItem *)self setGeometry:v35];
  }
}

- (_TtC8Freeform12CRLGroupItem)containingGroup
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    type metadata accessor for CRLGroupItem();
    id v5 = (id)swift_dynamicCastClass();
    if (!v5)
    {
      uint64_t v6 = self;
      id v5 = [v4 containingGroup];
    }
  }
  else
  {
    id v5 = 0;
  }

  return (_TtC8Freeform12CRLGroupItem *)v5;
}

- (_TtC8Freeform16CRLContainerItem)parentContainerItem
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v3 = Strong;
    type metadata accessor for CRLContainerItem(0);
    uint64_t Strong = (void *)swift_dynamicCastClass();
    if (!Strong)
    {

      uint64_t Strong = 0;
    }
  }

  return (_TtC8Freeform16CRLContainerItem *)Strong;
}

- (NSUUID)id
{
  CGRect result = (NSUUID *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8Freeform12CRLBoardItem)parentItem
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtC8Freeform12CRLBoardItem *)Strong;
}

- (int64_t)compareUsingUUIDTo:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  double v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v11);
  double v13 = (char *)&v23 - v12;
  double v14 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  double v15 = a3;
  v16 = self;
  v14();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  v18 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  uint64_t v19 = v18(v13, v5);
  (*(void (**)(uint64_t))((swift_isaMask & *v15) + 0x88))(v19);
  Class v20 = UUID._bridgeToObjectiveC()().super.isa;
  v18(v9, v5);
  id v21 = [(objc_class *)isa crl_compare:v20];

  return (int64_t)v21;
}

- (NSUUID)parentUUID
{
  CGRect result = (NSUUID *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSString)localizedName
{
  return (NSString *)sub_10088E064(self, (uint64_t)a2, (void (*)(uint64_t, void))sub_10088BE6C);
}

- (NSString)localizedAccessibilityDescriptionPlaceholder
{
  return (NSString *)sub_10088E064(self, (uint64_t)a2, (void (*)(uint64_t, void))sub_10088C380);
}

- (CRLCanvasInfoGeometry)geometry
{
  CGRect result = (CRLCanvasInfoGeometry *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)setGeometry:(id)a3
{
}

- (BOOL)locked
{
  BOOL result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)setLocked:(BOOL)a3
{
}

- (BOOL)canBeGrouped
{
  BOOL result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)aspectRatioLocked
{
  BOOL result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)setAspectRatioLocked:(BOOL)a3
{
}

- (NSString)accessibilityDescription
{
  BOOL result = (NSString *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (CRLShadow)shadow
{
  BOOL result = (CRLShadow *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)setShadow:(id)a3
{
}

- (BOOL)enableDefaultFloatingEffect
{
  BOOL result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSURL)hyperlinkURL
{
  uint64_t v3 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem_hyperlinkURL;
  swift_beginAccess();
  sub_100522E9C((uint64_t)v7, (uint64_t)v6, &qword_101672E90);
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    URL._bridgeToObjectiveC()(v10);
    uint64_t v11 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return (NSURL *)v11;
}

- (void)setHyperlinkURL:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  uint64_t v11 = (char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem_hyperlinkURL;
  swift_beginAccess();
  uint64_t v12 = self;
  sub_1006063BC((uint64_t)v8, (uint64_t)v11, &qword_101672E90);
  swift_endAccess();
}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  v2.super.Class isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (NSString)suggestedNameWhenDraggingSingleBoardItem
{
  NSArray v2 = self;
  sub_1008862B4();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)wantsStandardPublicTypesInAdditionToCustomTypesToPromiseWhenCopyingSingleBoardItem
{
  return 0;
}

- (id)promisedDataForPublicType:(id)a3
{
  uint64_t v5 = type metadata accessor for UTType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  uint64_t v11 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return 0;
}

- (id)promisedStringForCopy
{
  return 0;
}

- (BOOL)shouldBeIgnoredWhenCopying
{
  NSArray v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xF8);
  uint64_t v3 = self;
  if (v2()) {
    char v4 = 1;
  }
  else {
    char v4 = (*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v3->super.isa) + 0x1D8))();
  }

  return v4 & 1;
}

- (BOOL)canCopyData
{
  NSArray v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x1D8);
  uint64_t v3 = self;
  LOBYTE(v2) = v2();

  return (v2 & 1) == 0;
}

- (BOOL)needsDownload
{
  return 0;
}

- (BOOL)placeHolderDataNeedsDownload
{
  return 1;
}

- (void)takePropertiesFromReplacedBoardItem:(id)a3
{
  char v4 = *(void (**)(id))((swift_isaMask & (uint64_t)self->super.isa) + 0x200);
  id v5 = a3;
  uint64_t v6 = self;
  v4(v5);
}

- (void)updateGeometryToReplaceBoardItem:(id)a3
{
  char v4 = a3;
  id v5 = self;
  sub_100887B70(v4);
}

- (CGPoint)centerForReplacingWithNewItem
{
  NSArray v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  uint64_t v3 = self;
  char v4 = (void *)v2();
  [v4 center];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 dynamicallyDraggedLayout:(id)a4
{
  double v4 = 0.0;
  double v5 = 0.0;
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (void)setParentInfo:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  sub_100887EF8((uint64_t)a3);
}

- (BOOL)isSelectable
{
  BOOL result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isPreviewable
{
  return 0;
}

- (NSString)previewTooltip
{
  return (NSString *)0;
}

- (BOOL)isShareable
{
  return 0;
}

- (Class)layoutClass
{
  sub_10050BF48(0, (unint64_t *)&qword_101690720);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  sub_10050BF48(0, (unint64_t *)&qword_101678790);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  sub_10050BF48(0, (unint64_t *)&qword_101678BC0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)withTemporaryLayoutPerform:(id)a3
{
  double v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  double v6 = self;
  sub_100888194((uint64_t)sub_100895C4C, v5);

  swift_release();
}

- (BOOL)excludedFromMultiselectResizeInfo
{
  return 0;
}

- (BOOL)supportsResize
{
  return 1;
}

- (BOOL)supportsParentRotation
{
  return 1;
}

- (BOOL)isLockable
{
  NSArray v2 = self;
  uint64_t v3 = [(CRLBoardItem *)v2 containingGroup];

  if (v3) {
  return v3 == 0;
  }
}

- (BOOL)allowedToBeDragAndDropped
{
  v1 = *(uint64_t (**)(void))((swift_isaMask & *a1) + 0xF8);
  NSArray v2 = a1;
  LOBYTE(v1) = v1();

  return (v1 & 1) == 0;
}

- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock
{
  NSArray v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xE0);
  uint64_t v3 = self;
  double v4 = (void *)v2();
  [v4 transform];
  long long v8 = v11;
  long long v9 = v10;
  long long v7 = v12;

  long long v10 = v9;
  long long v11 = v8;
  long long v12 = v7;
  if (sub_10007F910((double *)&v10, 0.0001))
  {
    if ((*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v3->super.isa) + 0x118))()) {
      char v5 = (*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v3->super.isa) + 0x290))();
    }
    else {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

- (BOOL)isAllowedInFreehandDrawings
{
  return 0;
}

- (CGAffineTransform)computeFullTransform
{
  sub_10088F82C(self, (void (*)(_OWORD *__return_ptr))sub_10088830C, retstr);
  return result;
}

- (CGAffineTransform)computeLayoutFullTransform
{
  char v5 = (void *)swift_allocObject();
  v5[2] = 0x3FF0000000000000;
  v5[3] = 0;
  v5[4] = 0;
  v5[6] = 0;
  v5[7] = 0;
  v5[5] = 0x3FF0000000000000;
  double v6 = self;
  swift_retain();
  sub_100888194((uint64_t)sub_100895C0C, (uint64_t)v5);
  swift_release();
  swift_beginAccess();
  long long v10 = *((_OWORD *)v5 + 2);
  long long v11 = *((_OWORD *)v5 + 1);
  CGFloat v7 = *((double *)v5 + 6);
  CGFloat v8 = *((double *)v5 + 7);

  BOOL result = (CGAffineTransform *)swift_release();
  *(_OWORD *)&retstr->a = v11;
  *(_OWORD *)&retstr->c = v10;
  retstr->tdouble x = v7;
  retstr->tdouble y = v8;
  return result;
}

- (CGAffineTransform)transformInRoot
{
  sub_10088F82C(self, (void (*)(_OWORD *__return_ptr))sub_100888470, retstr);
  return result;
}

- (CGAffineTransform)fullTransformInRoot
{
  sub_10088F82C(self, (void (*)(_OWORD *__return_ptr))sub_1008885D8, retstr);
  return result;
}

- (BOOL)wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent
{
  return 0;
}

- (NSArray)additionalBoardItemsForUUIDBookkeepingForTemporaryCanvases
{
  type metadata accessor for CRLBoardItem(0);
  v2.super.Class isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (double)viewScaleToUseWhenRasterizingSingleBoardItemForCopy
{
  return 0.0;
}

- (BOOL)requiresAdditionalBoardItemsForCopyImaging
{
  return 0;
}

- (_TtC8Freeform8CRLBoard)parentBoard
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    double v4 = Strong;
    char v5 = *(uint64_t (**)(void))((swift_isaMask & *Strong) + 0x2E8);
    double v6 = self;
    CGFloat v7 = (void *)v5();
  }
  else
  {
    CGFloat v7 = 0;
  }

  return (_TtC8Freeform8CRLBoard *)v7;
}

- (BOOL)isInBoard
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    double v4 = Strong;
    char v5 = *(uint64_t (**)(void))((swift_isaMask & *Strong) + 0x2F0);
    double v6 = self;
    char v7 = v5();
  }
  else
  {
    char v7 = 0;
  }
  return v7 & 1;
}

- (BOOL)isTransactableEqualValue:(id)a3
{
  if (a3)
  {
    double v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    char v5 = self;
  }
  char v6 = (*(uint64_t (**)(_OWORD *))((swift_isaMask & (uint64_t)self->super.isa) + 0x370))(v8);

  sub_100522F00((uint64_t)v8, &qword_101672BF0);
  return v6 & 1;
}

- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3
{
  id result = (id)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isSupported
{
  BOOL result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSArray)stringContentForSearch
{
  BOOL result = (NSArray *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)crl_isEqualValue:(id)a3
{
  if (a3)
  {
    uint64_t v3 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    double v4 = self;
  }
  BOOL result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8Freeform12CRLBoardItem)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLBoardItem_transactionContext) = 0;
  swift_unknownObjectWeakInit();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8Freeform12CRLBoardItem_hyperlinkURL;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLBoardItem(0);
  return [(CRLBoardItem *)&v6 init];
}

- (void).cxx_destruct
{
}

- (BOOL)shouldBeDeletedWhenEndEditing
{
  return 0;
}

- (BOOL)canAdjustPositionInInspector
{
  return 1;
}

- (BOOL)canAdjustWidthInInspector
{
  return sub_100DE8B5C(self, (uint64_t)a2, (SEL *)&selRef_widthValid);
}

- (BOOL)canAdjustHeightInInspector
{
  return sub_100DE8B5C(self, (uint64_t)a2, (SEL *)&selRef_heightValid);
}

@end