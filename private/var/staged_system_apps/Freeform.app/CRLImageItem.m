@interface CRLImageItem
+ (void)adjustIncomingWithNewImageGeometry:(id)a3 newMaskGeometry:(id)a4 newImageData:(id)a5 targetImageGeometry:(id)a6 targetMaskGeometry:(id)a7 assetOwner:(id)a8;
- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)isBackgroundRemoved;
- (BOOL)isGEnerativePlaygroundImageItem;
- (BOOL)isOriginalAspectRatio;
- (BOOL)isPDF;
- (BOOL)isPreviewable;
- (BOOL)isSelectable;
- (BOOL)isShareable;
- (BOOL)isSpatial;
- (BOOL)maskCanBeReset;
- (BOOL)maskMatchesImageGeometryWithIgnoreRoundedCorners:(BOOL)a3;
- (BOOL)needsDownload;
- (BOOL)placeHolderDataNeedsDownload;
- (BOOL)shouldCacheBackingAssetOnCopy;
- (BOOL)shouldDisplayAsSpatial;
- (CGPoint)centerForReplacingWithNewItem;
- (CGSize)mediaRawPixelSize;
- (CRLBezierPath)tracedPath;
- (CRLCanvasInfoGeometry)geometryWithMask;
- (CRLMaskInfo)maskInfo;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSString)previewTooltip;
- (_TtC8Freeform8CRLAsset)_imageAssetAsData;
- (_TtC8Freeform8CRLAsset)_thumbnailAssetAsData;
- (_TtC8Freeform8CRLAsset)imageAssetPayload;
- (_TtC8Freeform8CRLAsset)thumbnailAssetPayload;
- (double)viewScaleToUseWhenRasterizingSingleBoardItemForCopy;
- (float)roundedCornerAmount;
- (id)commandToResetMask;
- (id)commandToSetRoundedCornersEnabled:(BOOL)a3;
- (id)defaultMaskInfo;
- (id)generativePlaygroundStringsFor:(id)a3;
- (id)maskInfoForCornerRadius:(float)a3;
- (void)crl_onBoard:(id)a3 moveItemToPosition:(CGPoint)a4 size:(CGSize)a5;
- (void)scaleDownSizeToFitWithinSize:(CGSize)a3 board:(id)a4;
- (void)setAssetMediaWithMedia:(id)a3 thumbnailData:(id)a4;
- (void)setIsBackgroundRemoved:(BOOL)a3;
- (void)setMaskInfo:(id)a3;
- (void)set_imageAssetAsData:(id)a3;
- (void)set_thumbnailAssetAsData:(id)a3;
- (void)takePropertiesFromReplacedBoardItem:(id)a3;
- (void)updateGeometryToReplaceBoardItem:(id)a3;
@end

@implementation CRLImageItem

- (void)crl_onBoard:(id)a3 moveItemToPosition:(CGPoint)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  v11 = [(CRLImageItem *)self maskInfo];
  if (v11)
  {
    [(CRLBoardItem *)self visibleBoundsForPositioning];
    if (v12 != width || v13 != height)
    {
      double v15 = v13;
      if (v12 <= 0.0)
      {
        double v16 = 0.0;
        if (width != 0.0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FB580);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010B5300();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FB5A0);
          }
          v17 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010690A0(v17);
          }
          v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]");
          v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"];
          +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:122 isFatal:0 description:"Desired size is an impossible multiple of current size."];
        }
      }
      else
      {
        double v16 = width / v12;
      }
      if (v15 <= 0.0)
      {
        double v20 = 0.0;
        if (height != 0.0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FB5C0);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010B5278();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FB5E0);
          }
          v21 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010690A0(v21);
          }
          v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLImageItem(CRLBoardItemPositionerPrivate) crl_onBoard:moveItemToPosition:size:]");
          v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLBoardItem+CanvasPositioning.m"];
          +[CRLAssertionHandler handleFailureInFunction:v22 file:v23 lineNumber:128 isFatal:0 description:"Desired size is an impossible multiple of current size."];
        }
      }
      else
      {
        double v20 = height / v15;
      }
      v24 = [v11 geometry];
      id v25 = [v24 mutableCopy];

      v26 = [v11 geometry];
      [v26 size];
      double v28 = v16 * v27;
      v29 = [v11 geometry];
      [v29 size];
      [v25 setSize:v28, v20 * v30];

      v31 = [v11 geometry];
      [v31 position];
      double v33 = v16 * v32;
      v34 = [v11 geometry];
      [v34 position];
      [v25 setPosition:v33, v20 * v35];

      [v11 setGeometry:v25];
      v36 = [(CRLBoardItemBase *)self geometry];
      id v37 = [v36 mutableCopy];

      v38 = [(CRLBoardItemBase *)self geometry];
      [v38 size];
      double v40 = v16 * v39;
      v41 = [(CRLBoardItemBase *)self geometry];
      [v41 size];
      [v37 setSize:v40, v20 * v42];

      [(CRLBoardItemBase *)self setGeometry:v37];
    }
    [(CRLBoardItem *)self visibleBoundsForPositioning];
    double v45 = v44;
    if (v44 != x || v43 != y)
    {
      v46 = [(CRLBoardItemBase *)self geometry];
      id v47 = [v46 mutableCopy];

      double v48 = sub_100064680(x, y, v45);
      [v47 position];
      [v47 setPosition:sub_100064698(v49, v50, v48)];
      [(CRLBoardItemBase *)self setGeometry:v47];
    }
  }
  else
  {
    v51.receiver = self;
    v51.super_class = (Class)_TtC8Freeform12CRLImageItem;
    -[CRLBoardItem crl_onBoard:moveItemToPosition:size:](&v51, "crl_onBoard:moveItemToPosition:size:", v10, x, y, width, height);
  }
}

- (_TtC8Freeform8CRLAsset)_imageAssetAsData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform12CRLImageItem__imageAssetAsData));
}

- (void)set_imageAssetAsData:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform12CRLImageItem__imageAssetAsData);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Freeform12CRLImageItem__imageAssetAsData) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform8CRLAsset)imageAssetPayload
{
  v2 = self;
  id v3 = sub_100A2CEC8();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (_TtC8Freeform8CRLAsset)_thumbnailAssetAsData
{
  return (_TtC8Freeform8CRLAsset *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                           + OBJC_IVAR____TtC8Freeform12CRLImageItem__thumbnailAssetAsData));
}

- (void)set_thumbnailAssetAsData:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform12CRLImageItem__thumbnailAssetAsData);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8Freeform12CRLImageItem__thumbnailAssetAsData) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform8CRLAsset)thumbnailAssetPayload
{
  v2 = self;
  id v3 = sub_100A2D5E4();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (CGSize)mediaRawPixelSize
{
  v2 = self;
  id v3 = sub_100A2CEC8();
  id v4 = [self sharedPool];
  id v5 = [v4 providerForAsset:v3 shouldValidate:1];

  [v5 naturalSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)setAssetMediaWithMedia:(id)a3 thumbnailData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_100A2E25C((uint64_t)v6, (uint64_t)a4);
}

- (CRLBezierPath)tracedPath
{
  v2 = self;
  id v3 = sub_100A2EC84();

  return (CRLBezierPath *)v3;
}

- (CRLMaskInfo)maskInfo
{
  v2 = self;
  id v3 = (CRLMaskInfo *)(id)sub_100A3653C();

  return v3;
}

- (void)setMaskInfo:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_100A36B4C(a3);
}

- (id)defaultMaskInfo
{
  v2 = self;
  id v3 = sub_100A2EE7C();

  return v3;
}

- (BOOL)maskCanBeReset
{
  v2 = self;
  char v3 = sub_100A2F154();

  return v3 & 1;
}

- (BOOL)isBackgroundRemoved
{
  v2 = self;
  char v3 = sub_100A2F50C();

  return v3 & 1;
}

- (void)setIsBackgroundRemoved:(BOOL)a3
{
  id v4 = self;
  sub_100A2F690(a3);
}

- (BOOL)isSpatial
{
  v2 = self;
  unsigned __int8 v3 = sub_100A2FA20();

  return v3 & 1;
}

- (BOOL)isOriginalAspectRatio
{
  v2 = self;
  BOOL v3 = sub_100A2FBC0();

  return v3;
}

- (BOOL)shouldDisplayAsSpatial
{
  v2 = self;
  BOOL v3 = sub_100A2FED8();

  return v3;
}

- (id)commandToResetMask
{
  v2 = self;
  id v3 = sub_100A30184();

  return v3;
}

- (BOOL)maskMatchesImageGeometryWithIgnoreRoundedCorners:(BOOL)a3
{
  id v4 = self;
  BOOL v5 = sub_100A30774(a3);

  return v5;
}

- (CRLCanvasInfoGeometry)geometryWithMask
{
  v2 = self;
  id v3 = sub_100A309D0();

  return (CRLCanvasInfoGeometry *)v3;
}

- (BOOL)isPDF
{
  uint64_t v3 = type metadata accessor for UTType();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v8 = self;
  id v9 = sub_100A2BFA0();
  if (v9)
  {
    double v10 = v9;
    static UTType.pdf.getter();
    UTType.identifier.getter();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    unsigned __int8 v12 = [v10 hasRepresentationConformingToTypeIdentifier:v11 fileOptions:0];
  }
  else
  {

    return 0;
  }
  return v12;
}

- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock
{
  v2 = self;
  char v3 = sub_100A31450();

  return v3 & 1;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  v2 = self;
  char v3 = sub_100A31788();

  return v3 & 1;
}

- (void)takePropertiesFromReplacedBoardItem:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = self;
  sub_100A31A44(v4);
}

- (BOOL)isSelectable
{
  return 1;
}

- (BOOL)isPreviewable
{
  return 1;
}

- (NSString)previewTooltip
{
  sub_100A37254();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (BOOL)isShareable
{
  return 1;
}

- (Class)layoutClass
{
  sub_10050BF48(0, &qword_10168C918);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  sub_10050BF48(0, &qword_10168C910);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  sub_10050BF48(0, &qword_10168C908);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)scaleDownSizeToFitWithinSize:(CGSize)a3 board:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = self;
  sub_100A31E88((uint64_t)v7, width, height);
}

+ (void)adjustIncomingWithNewImageGeometry:(id)a3 newMaskGeometry:(id)a4 newImageData:(id)a5 targetImageGeometry:(id)a6 targetMaskGeometry:(id)a7 assetOwner:(id)a8
{
  swift_getObjCClassMetadata();
  swift_getObjectType();
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  swift_unknownObjectRetain();
  sub_100A36150(v14, v15, (uint64_t)v16, v17, a7, (uint64_t)a8);

  swift_unknownObjectRelease();
}

- (float)roundedCornerAmount
{
  uint64_t v2 = self;
  float v3 = sub_100A32280();

  return v3;
}

- (id)commandToSetRoundedCornersEnabled:(BOOL)a3
{
  uint64_t v4 = self;
  id v5 = sub_100A32338(a3);

  return v5;
}

- (id)maskInfoForCornerRadius:(float)a3
{
  uint64_t v4 = self;
  id v5 = sub_100A3252C(a3);

  return v5;
}

- (BOOL)needsDownload
{
  uint64_t v3 = self;
  uint64_t v4 = self;
  id v5 = [(id)v3 standardUserDefaults];
  LOBYTE(v3) = [v5 BOOLForKey:@"CRLImageItemsRequireAssetDownloadForSendCopyUserDefault"];

  if (v3) {
    char v6 = 1;
  }
  else {
    char v6 = sub_1008864EC();
  }

  return v6 & 1;
}

- (void)updateGeometryToReplaceBoardItem:(id)a3
{
  uint64_t v4 = a3;
  id v5 = self;
  sub_100A3295C(v4);
}

- (CGPoint)centerForReplacingWithNewItem
{
  uint64_t v2 = self;
  double v3 = sub_100A33170();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (BOOL)placeHolderDataNeedsDownload
{
  uint64_t v2 = self;
  double v3 = sub_100A2D5E4();
  if (v3)
  {
    double v4 = v3;
    double v5 = &v3[OBJC_IVAR____TtC8Freeform8CRLAsset_storage];
    uint64_t v6 = *((void *)v5 + 3);
    uint64_t v7 = *((void *)v5 + 4);
    sub_10050F848(v5, v6);
    char v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 64))(v6, v7);

    uint64_t v2 = (_TtC8Freeform12CRLImageItem *)v4;
  }
  else
  {
    char v8 = 1;
  }

  return v8 & 1;
}

- (double)viewScaleToUseWhenRasterizingSingleBoardItemForCopy
{
  uint64_t v2 = self;
  double v3 = sub_100A333A4();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform12CRLImageItem__imageAssetAsData));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform12CRLImageItem__thumbnailAssetAsData));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Freeform12CRLImageItem__maskInfo);
}

- (BOOL)shouldCacheBackingAssetOnCopy
{
  return 0;
}

- (BOOL)isGEnerativePlaygroundImageItem
{
  return 1;
}

- (id)generativePlaygroundStringsFor:(id)a3
{
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return v3.super.isa;
}

@end