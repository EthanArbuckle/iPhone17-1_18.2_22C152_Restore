@interface BAContentData
- (BAContentData)init;
- (BAContentData)initWithContentID:(id)a3 contentType:(int64_t)a4 contentPrivateID:(id)a5 contentUserID:(id)a6 contentAcquisitionType:(int64_t)a7 contentSubType:(id)a8 contentLength:(id)a9 supplementalContentCount:(id)a10 seriesType:(int64_t)a11 productionType:(int64_t)a12 isUnified:(id)a13 contentKind:(id)a14;
@end

@implementation BAContentData

- (BAContentData)initWithContentID:(id)a3 contentType:(int64_t)a4 contentPrivateID:(id)a5 contentUserID:(id)a6 contentAcquisitionType:(int64_t)a7 contentSubType:(id)a8 contentLength:(id)a9 supplementalContentCount:(id)a10 seriesType:(int64_t)a11 productionType:(int64_t)a12 isUnified:(id)a13 contentKind:(id)a14
{
  uint64_t v15 = (uint64_t)a14;
  uint64_t v16 = sub_27DDB0();
  uint64_t v34 = v17;
  uint64_t v35 = v16;
  uint64_t v18 = sub_27DDB0();
  uint64_t v32 = v19;
  uint64_t v33 = v18;
  uint64_t v20 = sub_27DDB0();
  uint64_t v30 = v21;
  uint64_t v31 = v20;
  if (a14)
  {
    uint64_t v15 = sub_27DDB0();
    uint64_t v23 = v22;
  }
  else
  {
    uint64_t v23 = 0;
  }
  id v24 = a13;
  id v25 = a10;
  id v26 = a9;
  id v27 = a8;
  v28 = (BAContentData *)sub_E3B34(v35, v34, a4, v33, v32, v31, v30, a7, a8, a9, a10, a11, a12, a13, v15, v23);

  return v28;
}

- (BAContentData)init
{
  result = (BAContentData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end