@interface CRLMovieItem
+ (CGSize)defaultAudioItemSize;
+ (CGSize)defaultVideoItemSizeWithOriginalSize:(CGSize)a3;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)isAnimatedImage;
- (BOOL)isAudioOnly;
- (BOOL)isLooping;
- (BOOL)isPreviewable;
- (BOOL)isSelectable;
- (BOOL)isShareable;
- (BOOL)isSpatial;
- (BOOL)placeHolderDataNeedsDownload;
- (BOOL)shouldCacheBackingAssetOnCopy;
- (BOOL)supportsTogglingLooping;
- (BOOL)supportsTogglingShadowAndRoundedCorners;
- (BOOL)wantsStandardPublicTypesInAdditionToCustomTypesToPromiseWhenCopyingSingleBoardItem;
- (CGSize)mediaRawPixelSize;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem;
- (NSString)creator;
- (NSString)localizedAccessibilityDescriptionPlaceholder;
- (NSString)localizedName;
- (NSString)previewTooltip;
- (NSString)title;
- (_TtC8Freeform8CRLAsset)movieAssetPayload;
- (_TtC8Freeform8CRLAsset)posterImageAssetPayload;
- (double)endTime;
- (double)posterTime;
- (double)startTime;
- (float)cornerRadius;
- (float)roundedCornerAmount;
- (float)volume;
- (id)commandToSetLoopingEnabled:(BOOL)a3;
- (id)commandToSetRoundedCornersEnabled:(BOOL)a3;
- (id)generateEmptyPosterImage;
- (id)makeAVAssetAndReturnError:(id *)a3;
- (id)makeAVAssetWithOptionsWithOptions:(id)a3 error:(id *)a4;
- (id)promisedDataForPublicType:(id)a3;
- (id)synchronouslyGenerateDefaultPosterImage;
- (id)synchronouslyGenerateDefaultPosterImageForAnimatedImage;
- (void)setAssetMediaWithMovieData:(id)a3 posterImageData:(id)a4 posterTime:(double)a5 startTime:(double)a6 endTime:(double)a7 isAudioOnly:(BOOL)a8 title:(id)a9 creator:(id)a10 isLooping:(BOOL)a11;
- (void)setCornerRadius:(float)a3;
- (void)setCreator:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setIsAudioOnly:(BOOL)a3;
- (void)setIsLooping:(BOOL)a3;
- (void)setPosterImageData:(id)a3;
- (void)setPosterTime:(double)a3;
- (void)setStartTime:(double)a3;
- (void)setTitle:(id)a3;
- (void)setVolume:(float)a3;
- (void)takePropertiesFromReplacedBoardItem:(id)a3;
@end

@implementation CRLMovieItem

- (double)startTime
{
  uint64_t v3 = type metadata accessor for CRLMovieItemAssetData(0);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v8 = self;
  swift_retain();
  sub_1005057FC(&qword_1016A4070);
  CRRegister.wrappedValue.getter();
  double v9 = *(double *)&v7[*(int *)(v4 + 36)];
  swift_endAccess();
  sub_100BF5964((uint64_t)v7, type metadata accessor for CRLMovieItemAssetData);

  swift_release();
  return v9;
}

- (void)setStartTime:(double)a3
{
  uint64_t v4 = self;
  sub_100BE8C34(a3);
}

- (double)endTime
{
  uint64_t v3 = type metadata accessor for CRLMovieItemAssetData(0);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v8 = self;
  swift_retain();
  sub_1005057FC(&qword_1016A4070);
  CRRegister.wrappedValue.getter();
  double v9 = *(double *)&v7[*(int *)(v4 + 40)];
  swift_endAccess();
  sub_100BF5964((uint64_t)v7, type metadata accessor for CRLMovieItemAssetData);

  swift_release();
  return v9;
}

- (void)setEndTime:(double)a3
{
  uint64_t v4 = self;
  sub_100BE9288(a3);
}

- (BOOL)isAudioOnly
{
  uint64_t v3 = type metadata accessor for CRLMovieItemAssetData(0);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v8 = self;
  swift_retain();
  sub_1005057FC(&qword_1016A4070);
  CRRegister.wrappedValue.getter();
  LOBYTE(self) = v7[*(int *)(v4 + 44)];
  swift_endAccess();
  sub_100BF5964((uint64_t)v7, type metadata accessor for CRLMovieItemAssetData);

  swift_release();
  return (char)self;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100BE98D0(a3);
}

- (BOOL)isLooping
{
  v2 = self;
  char v3 = sub_100BE9C60();

  return v3 & 1;
}

- (void)setIsLooping:(BOOL)a3
{
  uint64_t v4 = self;
  sub_100BE9DE4(a3);
}

- (BOOL)isSpatial
{
  v2 = self;
  char v3 = sub_100BEA174();

  return v3 & 1;
}

- (double)posterTime
{
  uint64_t v3 = type metadata accessor for CRLMovieItemAssetData(0);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v8 = self;
  swift_retain();
  sub_1005057FC(&qword_1016A4070);
  CRRegister.wrappedValue.getter();
  double v9 = *(double *)&v7[*(int *)(v4 + 32)];
  swift_endAccess();
  sub_100BF5964((uint64_t)v7, type metadata accessor for CRLMovieItemAssetData);

  swift_release();
  return v9;
}

- (void)setPosterTime:(double)a3
{
  uint64_t v4 = self;
  sub_100BEA4EC(a3);
}

- (float)volume
{
  swift_beginAccess();
  type metadata accessor for CRLMovieItemCRDTData(0);
  uint64_t v3 = self;
  swift_retain();
  sub_1005057FC(&qword_101673480);
  CRRegister.wrappedValue.getter();
  swift_endAccess();

  swift_release();
  float result = 1.0;
  if (!v6) {
    return v5;
  }
  return result;
}

- (void)setVolume:(float)a3
{
  uint64_t v3 = self;
  sub_100BEA9A0();
}

- (float)cornerRadius
{
  swift_beginAccess();
  type metadata accessor for CRLMovieItemCRDTData(0);
  uint64_t v3 = self;
  swift_retain();
  sub_1005057FC(&qword_101672430);
  CRRegister.wrappedValue.getter();
  swift_endAccess();

  swift_release();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)setCornerRadius:(float)a3
{
  uint64_t v4 = self;
  sub_100BEAD30(a3);
}

- (NSString)title
{
  uint64_t v3 = type metadata accessor for CRLMovieItemAssetData(0);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v8 = self;
  swift_retain();
  sub_1005057FC(&qword_1016A4070);
  CRRegister.wrappedValue.getter();
  swift_endAccess();
  swift_release();
  uint64_t v9 = *(void *)&v7[*(int *)(v4 + 48) + 8];
  swift_bridgeObjectRetain();
  sub_100BF5964((uint64_t)v7, type metadata accessor for CRLMovieItemAssetData);

  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return (NSString *)v10;
}

- (void)setTitle:(id)a3
{
}

- (NSString)creator
{
  uint64_t v3 = type metadata accessor for CRLMovieItemAssetData(0);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v8 = self;
  swift_retain();
  sub_1005057FC(&qword_1016A4070);
  CRRegister.wrappedValue.getter();
  swift_endAccess();
  swift_release();
  uint64_t v9 = *(void *)&v7[*(int *)(v4 + 52) + 8];
  swift_bridgeObjectRetain();
  sub_100BF5964((uint64_t)v7, type metadata accessor for CRLMovieItemAssetData);

  if (v9)
  {
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v10 = 0;
  }

  return (NSString *)v10;
}

- (void)setCreator:(id)a3
{
}

- (_TtC8Freeform8CRLAsset)movieAssetPayload
{
  v2 = self;
  uint64_t v3 = sub_100BEBBB0();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (_TtC8Freeform8CRLAsset)posterImageAssetPayload
{
  v2 = self;
  uint64_t v3 = sub_100BEC274();

  return (_TtC8Freeform8CRLAsset *)v3;
}

- (CGSize)mediaRawPixelSize
{
  v2 = self;
  uint64_t v3 = sub_100BEC274();
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = [self sharedPool];
    id v6 = [v5 providerForAsset:v4 shouldValidate:1];

    [v6 naturalSize];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {

    double v8 = 0.0;
    double v10 = 0.0;
  }
  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (NSString)localizedName
{
  return (NSString *)sub_100BECC0C(self, (uint64_t)a2, (void (*)(void))sub_100BEC9E4);
}

- (NSString)localizedAccessibilityDescriptionPlaceholder
{
  return (NSString *)sub_100BECC0C(self, (uint64_t)a2, (void (*)(void))sub_100BECC7C);
}

- (void)setPosterImageData:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_100BED3C8(a3);
}

- (void)setAssetMediaWithMovieData:(id)a3 posterImageData:(id)a4 posterTime:(double)a5 startTime:(double)a6 endTime:(double)a7 isAudioOnly:(BOOL)a8 title:(id)a9 creator:(id)a10 isLooping:(BOOL)a11
{
  BOOL v27 = a11;
  id v11 = a10;
  BOOL v12 = a8;
  if (a9)
  {
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v21 = v20;
    if (v11)
    {
LABEL_3:
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      id v11 = v23;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v21 = 0;
    if (a10) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = 0;
LABEL_6:
  id v24 = a3;
  id v25 = a4;
  v26 = self;
  sub_100BED800(a3, a4, v12, v19, v21, v22, (uint64_t)v11, v27, a5, a6, a7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)supportsTogglingLooping
{
  return 1;
}

- (float)roundedCornerAmount
{
  swift_beginAccess();
  type metadata accessor for CRLMovieItemCRDTData(0);
  uint64_t v3 = self;
  swift_retain();
  sub_1005057FC(&qword_101672430);
  CRRegister.wrappedValue.getter();
  swift_endAccess();

  swift_release();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)commandToSetRoundedCornersEnabled:(BOOL)a3
{
  uint64_t v4 = self;
  id v5 = sub_100BEE824(a3);

  return v5;
}

- (id)commandToSetLoopingEnabled:(BOOL)a3
{
  uint64_t v4 = self;
  id v5 = sub_100BEEA08(a3);

  return v5;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  return 0;
}

- (void)takePropertiesFromReplacedBoardItem:(id)a3
{
  uint64_t v4 = a3;
  id v5 = self;
  sub_100BEEBDC(v4);
}

- (BOOL)placeHolderDataNeedsDownload
{
  v2 = self;
  BOOL v3 = sub_100BEEFC0();

  return v3;
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
  v2 = self;
  sub_100BEF1D8();
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

- (BOOL)isShareable
{
  return 1;
}

- (Class)layoutClass
{
  v2 = self;
  sub_100BEF440();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  v2 = self;
  uint64_t v3 = sub_100BEF5F8();

  if (!v3) {
    return 0;
  }

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  sub_10050BF48(0, &qword_1016974B8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (id)makeAVAssetAndReturnError:(id *)a3
{
  uint64_t v3 = self;
  uint64_t v4 = sub_100BEBBB0();
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  uint64_t v6 = *(void *)&v4[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 32];
  sub_10050F848(&v4[OBJC_IVAR____TtC8Freeform8CRLAsset_storage], v5);
  double v7 = (void *)(*(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 56))(_swiftEmptyDictionarySingleton, v5, v6);

  return v7;
}

- (id)makeAVAssetWithOptionsWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = self;
  double v7 = sub_100BEBBB0();
  uint64_t v8 = *(void *)&v7[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 24];
  uint64_t v9 = *(void *)&v7[OBJC_IVAR____TtC8Freeform8CRLAsset_storage + 32];
  sub_10050F848(&v7[OBJC_IVAR____TtC8Freeform8CRLAsset_storage], v8);
  double v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, v8, v9);
  swift_bridgeObjectRelease();

  return v10;
}

- (id)generateEmptyPosterImage
{
  v2 = self;
  id v3 = sub_100BF31A8();

  return v3;
}

- (BOOL)isAnimatedImage
{
  v2 = self;
  unsigned __int8 v3 = sub_100BF34BC();

  return v3 & 1;
}

- (id)synchronouslyGenerateDefaultPosterImageForAnimatedImage
{
  v2 = self;
  id v3 = sub_100BF3740();

  return v3;
}

- (id)synchronouslyGenerateDefaultPosterImage
{
  v2 = self;
  id v3 = sub_100BF39E0();

  return v3;
}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  v2 = self;
  sub_100BF4318();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (id)promisedDataForPublicType:(id)a3
{
  uint64_t v5 = type metadata accessor for UTType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = a3;
  id v11 = self;
  static UTType._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v12 = sub_100BE7AF0((uint64_t)v9);
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

- (BOOL)wantsStandardPublicTypesInAdditionToCustomTypesToPromiseWhenCopyingSingleBoardItem
{
  return 1;
}

- (BOOL)supportsTogglingShadowAndRoundedCorners
{
  uint64_t v2 = type metadata accessor for CRLMovieItemAssetData(0);
  uint64_t v3 = v2 - 8;
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  id v7 = a1;
  swift_retain();
  sub_1005057FC(&qword_1016A4070);
  CRRegister.wrappedValue.getter();
  LOBYTE(a1) = v6[*(int *)(v3 + 44)];
  swift_endAccess();
  sub_100BF5964((uint64_t)v6, type metadata accessor for CRLMovieItemAssetData);

  swift_release();
  return (a1 & 1) == 0;
}

+ (CGSize)defaultAudioItemSize
{
  if (qword_10166FC98 != -1) {
    swift_once();
  }
  double v3 = *((double *)&xmmword_1016973F0 + 1);
  double v2 = *(double *)&xmmword_1016973F0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultVideoItemSizeWithOriginalSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (qword_10166FCA0 != -1) {
    swift_once();
  }
  long long v5 = xmmword_101697400;

  double v6 = sub_100067234(width, height, *(double *)&v5, *((double *)&v5 + 1));
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform12CRLMovieItem__movieAssetAsData));
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform12CRLMovieItem__posterImageAssetAsData);
}

- (BOOL)shouldCacheBackingAssetOnCopy
{
  return 1;
}

@end