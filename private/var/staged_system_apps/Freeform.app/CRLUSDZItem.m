@interface CRLUSDZItem
+ (BOOL)isSupported;
- (BOOL)aspectRatioLocked;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)canBeGrouped;
- (BOOL)enableDefaultFloatingEffect;
- (BOOL)isPreviewable;
- (BOOL)isSelectable;
- (BOOL)isShareable;
- (BOOL)placeHolderDataNeedsDownload;
- (BOOL)shouldCacheBackingAssetOnCopy;
- (CRLBezierPath)tracedPath;
- (CRLImageProvider)validatedPosterImageProvider;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem;
- (_TtC8Freeform8CRLAsset)posterAssetPayload;
- (id)computeInfoGeometryForFittingIn:(CGRect)a3;
- (id)promisedDataForPublicType:(id)a3;
- (void)scaleDownSizeToFitWithinSize:(CGSize)a3 board:(id)a4;
- (void)setAspectRatioLocked:(BOOL)a3;
@end

@implementation CRLUSDZItem

+ (BOOL)isSupported
{
  return sub_1002094C4(0x2000000000000uLL);
}

- (BOOL)enableDefaultFloatingEffect
{
  return 0;
}

- (CRLBezierPath)tracedPath
{
  v2 = self;
  id v3 = sub_10072E57C();

  return (CRLBezierPath *)v3;
}

- (CRLImageProvider)validatedPosterImageProvider
{
  v2 = self;
  id v3 = (_TtC8Freeform11CRLUSDZItem *)sub_10072E910();
  if (v3)
  {
    v4 = v3;
    id v5 = [self sharedPool];
    id v6 = [v5 providerForAsset:v4 shouldValidate:1];

    v2 = v4;
  }
  else
  {
    id v6 = 0;
  }

  return (CRLImageProvider *)v6;
}

- (_TtC8Freeform8CRLAsset)posterAssetPayload
{
  v2 = self;
  id v3 = sub_10072E910();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (id)computeInfoGeometryForFittingIn:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  id v8 = sub_10072ED64(x, y, width, height);

  return v8;
}

- (BOOL)canBeGrouped
{
  v7 = &type metadata for CRLFeatureFlags;
  unint64_t v8 = sub_1005396A8();
  v6[0] = 21;
  id v3 = self;
  char v4 = isFeatureEnabled(_:)();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v6);

  return (v4 & 1) == 0;
}

- (BOOL)isSelectable
{
  return 1;
}

- (BOOL)isPreviewable
{
  return 1;
}

- (BOOL)isShareable
{
  return 1;
}

- (Class)layoutClass
{
  type metadata accessor for CRLUSDZLayout();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  type metadata accessor for CRLUSDZRep(0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  type metadata accessor for CRLUSDZEditor();

  return (Class)swift_getObjCClassFromMetadata();
}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  v2 = self;
  sub_100732000();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (id)promisedDataForPublicType:(id)a3
{
  uint64_t v5 = type metadata accessor for UTType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  v11 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v12 = sub_100BE6C18((uint64_t)v9);
  unint64_t v14 = v13;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  if (v14 >> 60 == 15)
  {
    Class isa = 0;
  }
  else
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100514260(v12, v14);
  }

  return isa;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (BOOL)aspectRatioLocked
{
  return 1;
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  NSArray v3 = self;
  sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"aspectRatioLocked", 17, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZItem.swift", 82, 2, 269, (uint64_t)"Should not try to set aspectRatioLocked of an item which returns false from canAspectRatioLockBeChangedByUser.", 110, 2u, (uint64_t)_swiftEmptyArrayStorage);
  sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"aspectRatioLocked", 17, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUSDZItem.swift", 82, 2, 269);
}

- (BOOL)placeHolderDataNeedsDownload
{
  v2 = self;
  NSArray v3 = (_TtC8Freeform11CRLUSDZItem *)sub_10072E910();
  if (v3)
  {
    char v4 = v3;
    uint64_t v5 = (char *)v3 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage;
    uint64_t v6 = *((void *)v5 + 3);
    uint64_t v7 = *((void *)v5 + 4);
    sub_10050F848(v5, v6);
    char v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 64))(v6, v7);

    v2 = v4;
  }
  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

- (void).cxx_destruct
{
}

- (BOOL)shouldCacheBackingAssetOnCopy
{
  return 1;
}

- (void)scaleDownSizeToFitWithinSize:(CGSize)a3 board:(id)a4
{
  id v5 = a4;
  uint64_t v6 = self;
  sub_1007332F0();
}

@end