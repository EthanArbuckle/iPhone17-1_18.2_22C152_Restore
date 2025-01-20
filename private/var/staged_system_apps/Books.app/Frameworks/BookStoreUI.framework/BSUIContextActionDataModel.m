@interface BSUIContextActionDataModel
- (BCTransaction)transaction;
- (BCTransactionProviding)transactionProvider;
- (BOOL)isAnODPRecommendation;
- (BOOL)shouldReportFigaro;
- (BOOL)supportsSuggestionContextMenu;
- (BSUIContextActionDataModel)init;
- (BSUIContextActionDataModel)initWithAssetModel:(id)a3 sourceView:(id)a4;
- (BSUIContextActionDataModel)initWithAssetModels:(id)a3;
- (NSString)presentationRefID;
- (NSString)presentationRefInstance;
- (NSString)presentationUID;
- (NSValue)sourcePoint;
- (UIBarButtonItem)sourceBarButtonItem;
- (id)originatingLocation;
- (void)setIsAnODPRecommendation:(BOOL)a3;
- (void)setODPAnalyticsWithAttributes:(id)a3;
- (void)setOriginatingLocation:(id)a3;
- (void)setPresentationRefID:(id)a3;
- (void)setPresentationRefInstance:(id)a3;
- (void)setPresentationUID:(id)a3;
- (void)setShouldReportFigaro:(BOOL)a3;
- (void)setSourceBarButtonItem:(id)a3;
- (void)setSourcePoint:(id)a3;
- (void)setSupportsSuggestionContextMenu:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setTransactionProvider:(id)a3;
@end

@implementation BSUIContextActionDataModel

- (id)originatingLocation
{
  v2 = (char *)self + OBJC_IVAR___BSUIContextActionDataModel_originatingLocation;
  swift_beginAccess();
  sub_7AE4C((uint64_t)v2, (uint64_t)v12);
  uint64_t v3 = v13;
  if (v13)
  {
    v4 = sub_71044(v12, v13);
    uint64_t v5 = *(void *)(v3 - 8);
    __n128 v6 = __chkstk_darwin(v4);
    v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
    (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
    v9 = (void *)sub_2E5000();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    _s11BookStoreUI5ShelfV20HeaderComponentModelVwxx_0((uint64_t)v12);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setOriginatingLocation:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2E4B80();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    uint64_t v5 = self;
  }
  __n128 v6 = (char *)self + OBJC_IVAR___BSUIContextActionDataModel_originatingLocation;
  swift_beginAccess();
  sub_CB9B0((uint64_t)v7, (uint64_t)v6);
  swift_endAccess();
}

- (NSString)presentationRefID
{
  return (NSString *)sub_19CF5C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_presentationRefID);
}

- (void)setPresentationRefID:(id)a3
{
}

- (NSString)presentationRefInstance
{
  return (NSString *)sub_19CF5C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_presentationRefInstance);
}

- (void)setPresentationRefInstance:(id)a3
{
}

- (NSString)presentationUID
{
  return (NSString *)sub_19CF5C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_presentationUID);
}

- (void)setPresentationUID:(id)a3
{
}

- (BOOL)shouldReportFigaro
{
  v2 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_shouldReportFigaro;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldReportFigaro:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_shouldReportFigaro;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isAnODPRecommendation
{
  v2 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_isAnODPRecommendation;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAnODPRecommendation:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_isAnODPRecommendation;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)supportsSuggestionContextMenu
{
  v2 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_supportsSuggestionContextMenu;
  swift_beginAccess();
  return *v2;
}

- (void)setSupportsSuggestionContextMenu:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___BSUIContextActionDataModel_supportsSuggestionContextMenu;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (UIBarButtonItem)sourceBarButtonItem
{
  return (UIBarButtonItem *)sub_19D760((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_sourceBarButtonItem);
}

- (void)setSourceBarButtonItem:(id)a3
{
}

- (NSValue)sourcePoint
{
  return (NSValue *)sub_19D760((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BSUIContextActionDataModel_sourcePoint);
}

- (void)setSourcePoint:(id)a3
{
}

- (BCTransaction)transaction
{
  return (BCTransaction *)sub_19DA10();
}

- (void)setTransaction:(id)a3
{
}

- (BCTransactionProviding)transactionProvider
{
  return (BCTransactionProviding *)sub_19DA10();
}

- (void)setTransactionProvider:(id)a3
{
}

- (BSUIContextActionDataModel)initWithAssetModels:(id)a3
{
  type metadata accessor for ContextActionDataModel.Asset();
  uint64_t v3 = sub_2E4640();
  return (BSUIContextActionDataModel *)ContextActionDataModel.init(assets:)(v3);
}

- (BSUIContextActionDataModel)initWithAssetModel:(id)a3 sourceView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (BSUIContextActionDataModel *)ContextActionDataModel.init(asset:sourceView:)((uint64_t)v5, (uint64_t)a4);
}

- (void)setODPAnalyticsWithAttributes:(id)a3
{
  uint64_t v4 = sub_2E4350();
  id v5 = self;
  sub_19E25C(v4);

  swift_bridgeObjectRelease();
}

- (BSUIContextActionDataModel)init
{
  result = (BSUIContextActionDataModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19FE40(*(void **)((char *)&self->super.isa + OBJC_IVAR___BSUIContextActionDataModel_initType), *(void **)&self->initType[OBJC_IVAR___BSUIContextActionDataModel_initType], self->initType[OBJC_IVAR___BSUIContextActionDataModel_initType + 8]);
  sub_662B4((uint64_t)self + OBJC_IVAR___BSUIContextActionDataModel_originatingLocation, &qword_3C78D0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___BSUIContextActionDataModel_analyticsAttributes;

  sub_1A05F4((uint64_t)v3);
}

@end