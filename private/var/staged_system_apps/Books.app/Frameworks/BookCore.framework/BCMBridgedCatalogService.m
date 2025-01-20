@interface BCMBridgedCatalogService
+ (BCMBridgedCatalogService)sharedInstance;
- (BCMBridgedCatalogService)init;
- (BOOL)checkAvailabilityForStoreID:(id)a3 type:(int64_t)a4 metadata:(id)a5;
- (void)fetchMixedAssetsWithBookIds:(NSArray *)a3 audiobookIds:(NSArray *)a4 relationships:(NSArray *)a5 views:(NSArray *)a6 additionalParameters:(NSDictionary *)a7 batchSize:(int64_t)a8 metadata:(BFMRequestMetadata *)a9 completionHandler:(id)a10;
- (void)fetchMixedSeriesWithBookSeriesIds:(NSArray *)a3 audiobookSeriesIds:(NSArray *)a4 relationships:(NSArray *)a5 views:(NSArray *)a6 additionalParameters:(NSDictionary *)a7 batchSize:(int64_t)a8 metadata:(BFMRequestMetadata *)a9 completionHandler:(id)a10;
- (void)fetchResourcesWithAdamIDs:(NSArray *)a3 relationships:(NSArray *)a4 views:(NSArray *)a5 additionalParameters:(NSDictionary *)a6 batchSize:(int64_t)a7 metadata:(BFMRequestMetadata *)a8 completionHandler:(id)a9;
- (void)fetchStoreURLForAdamID:(NSString *)a3 type:(int64_t)a4 metadata:(BFMRequestMetadata *)a5 completionHandler:(id)a6;
- (void)fetchStoreURLOfUnknownTypeForAdamID:(NSString *)a3 metadata:(BFMRequestMetadata *)a4 completionHandler:(id)a5;
@end

@implementation BCMBridgedCatalogService

+ (BCMBridgedCatalogService)sharedInstance
{
  if (qword_342B80 != -1) {
    swift_once();
  }
  v2 = (void *)qword_344950;

  return (BCMBridgedCatalogService *)v2;
}

- (void)fetchStoreURLForAdamID:(NSString *)a3 type:(int64_t)a4 metadata:(BFMRequestMetadata *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_1911F8(&qword_344900);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_1F2290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_344B48;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_344B50;
  v18[5] = v17;
  v19 = a3;
  v20 = a5;
  v21 = self;
  sub_1D2630((uint64_t)v13, (uint64_t)&unk_344B58, (uint64_t)v18);
  swift_release();
}

- (void)fetchStoreURLOfUnknownTypeForAdamID:(NSString *)a3 metadata:(BFMRequestMetadata *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1911F8(&qword_344900);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1F2290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_344B28;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_344B30;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1D2630((uint64_t)v11, (uint64_t)&unk_344B38, (uint64_t)v16);
  swift_release();
}

- (BOOL)checkAvailabilityForStoreID:(id)a3 type:(int64_t)a4 metadata:(id)a5
{
  int64_t v27 = a4;
  v25 = self;
  uint64_t v6 = sub_1F1B80();
  uint64_t v28 = *(void *)(v6 - 8);
  uint64_t v29 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1F1C10();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_1F1C90();
  uint64_t v13 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_1F2190();
  uint64_t v18 = v17;
  id v19 = a5;
  v25 = v25;
  sub_1F1C80();

  if (qword_342B90 != -1) {
    swift_once();
  }
  uint64_t v20 = sub_1A1B74(v9, (uint64_t)qword_344970);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v20, v9);
  sub_1F1B90();
  v21 = sub_1D1458(v16, v18, (unint64_t)v8, (unint64_t)v15);
  uint64_t v22 = v21;
  if (v21) {

  }
  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v29);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v26);
  return v22 != 0;
}

- (BCMBridgedCatalogService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MBridgedCatalogService();
  return [(BCMBridgedCatalogService *)&v3 init];
}

- (void)fetchMixedAssetsWithBookIds:(NSArray *)a3 audiobookIds:(NSArray *)a4 relationships:(NSArray *)a5 views:(NSArray *)a6 additionalParameters:(NSDictionary *)a7 batchSize:(int64_t)a8 metadata:(BFMRequestMetadata *)a9 completionHandler:(id)a10
{
  int64_t v32 = a8;
  v33 = a3;
  uint64_t v16 = sub_1911F8(&qword_344900);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = _Block_copy(a10);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  int64_t v21 = v32;
  v20[6] = a7;
  v20[7] = v21;
  v20[8] = a9;
  v20[9] = v19;
  v20[10] = self;
  uint64_t v22 = sub_1F2290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v18, 1, 1, v22);
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_344B00;
  v23[5] = v20;
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_344B08;
  v24[5] = v23;
  v25 = v33;
  uint64_t v26 = a4;
  int64_t v27 = a5;
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  v30 = a9;
  v31 = self;
  sub_1D2630((uint64_t)v18, (uint64_t)&unk_344B10, (uint64_t)v24);
  swift_release();
}

- (void)fetchMixedSeriesWithBookSeriesIds:(NSArray *)a3 audiobookSeriesIds:(NSArray *)a4 relationships:(NSArray *)a5 views:(NSArray *)a6 additionalParameters:(NSDictionary *)a7 batchSize:(int64_t)a8 metadata:(BFMRequestMetadata *)a9 completionHandler:(id)a10
{
  int64_t v32 = a8;
  v33 = a3;
  uint64_t v16 = sub_1911F8(&qword_344900);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = _Block_copy(a10);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  int64_t v21 = v32;
  v20[6] = a7;
  v20[7] = v21;
  v20[8] = a9;
  v20[9] = v19;
  v20[10] = self;
  uint64_t v22 = sub_1F2290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v18, 1, 1, v22);
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_344AD8;
  v23[5] = v20;
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_344AE0;
  v24[5] = v23;
  v25 = v33;
  uint64_t v26 = a4;
  int64_t v27 = a5;
  uint64_t v28 = a6;
  uint64_t v29 = a7;
  v30 = a9;
  v31 = self;
  sub_1D2630((uint64_t)v18, (uint64_t)&unk_344AE8, (uint64_t)v24);
  swift_release();
}

- (void)fetchResourcesWithAdamIDs:(NSArray *)a3 relationships:(NSArray *)a4 views:(NSArray *)a5 additionalParameters:(NSDictionary *)a6 batchSize:(int64_t)a7 metadata:(BFMRequestMetadata *)a8 completionHandler:(id)a9
{
  uint64_t v16 = sub_1911F8(&qword_344900);
  __chkstk_darwin(v16 - 8);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v19 = _Block_copy(a9);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = v19;
  v20[9] = self;
  uint64_t v21 = sub_1F2290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_344A90;
  v22[5] = v20;
  v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_344750;
  v23[5] = v22;
  uint64_t v24 = a3;
  v25 = a4;
  uint64_t v26 = a5;
  int64_t v27 = a6;
  uint64_t v28 = a8;
  uint64_t v29 = self;
  sub_1D2630((uint64_t)v18, (uint64_t)&unk_344920, (uint64_t)v23);
  swift_release();
}

@end