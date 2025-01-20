@interface BALinkData
- (BALinkData)init;
- (BALinkData)initWithPreviousSectionID:(id)a3 previousSectionName:(id)a4 previousContentID:(id)a5 linkActionType:(int64_t)a6 previousSeriesID:(id)a7 previousGenreID:(id)a8 previousCollectionID:(id)a9 previousAuthorID:(id)a10 previousFlowcaseID:(id)a11 previousBrickID:(id)a12;
@end

@implementation BALinkData

- (BALinkData)initWithPreviousSectionID:(id)a3 previousSectionName:(id)a4 previousContentID:(id)a5 linkActionType:(int64_t)a6 previousSeriesID:(id)a7 previousGenreID:(id)a8 previousCollectionID:(id)a9 previousAuthorID:(id)a10 previousFlowcaseID:(id)a11 previousBrickID:(id)a12
{
  uint64_t v16 = sub_27DDB0();
  uint64_t v51 = v17;
  uint64_t v52 = v16;
  if (a4)
  {
    uint64_t v50 = sub_27DDB0();
    uint64_t v49 = v18;
  }
  else
  {
    uint64_t v50 = 0;
    uint64_t v49 = 0;
  }
  if (a5)
  {
    uint64_t v19 = sub_27DDB0();
    uint64_t v47 = v20;
    uint64_t v48 = v19;
    if (a7)
    {
LABEL_6:
      uint64_t v21 = sub_27DDB0();
      uint64_t v45 = v22;
      uint64_t v46 = v21;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    if (a7) {
      goto LABEL_6;
    }
  }
  uint64_t v45 = 0;
  uint64_t v46 = 0;
LABEL_9:
  id v23 = a12;
  id v24 = a11;
  id v25 = a10;
  id v26 = a9;
  id v27 = a8;
  if (v27)
  {
    v28 = v27;
    uint64_t v44 = sub_27DDB0();
    uint64_t v30 = v29;

    if (v26) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v44 = 0;
    uint64_t v30 = 0;
    if (v26)
    {
LABEL_11:
      uint64_t v31 = sub_27DDB0();
      uint64_t v33 = v32;

      if (v25) {
        goto LABEL_12;
      }
      goto LABEL_17;
    }
  }
  uint64_t v31 = 0;
  uint64_t v33 = 0;
  if (v25)
  {
LABEL_12:
    uint64_t v34 = sub_27DDB0();
    uint64_t v36 = v35;

    if (v24) {
      goto LABEL_13;
    }
LABEL_18:
    uint64_t v37 = 0;
    uint64_t v39 = 0;
    if (v23) {
      goto LABEL_14;
    }
LABEL_19:
    uint64_t v40 = 0;
    uint64_t v42 = 0;
    return (BALinkData *)BridgedLinkData.init(previousSectionID:previousSectionName:previousContentID:linkActionType:previousSeriesID:previousGenreID:previousCollectionID:previousAuthorID:previousFlowcaseID:previousBrickID:)(v52, v51, v50, v49, v48, v47, a6, v46, v45, v44, v30, v31, v33, v34, v36, v37, v39, v40, v42);
  }
LABEL_17:
  uint64_t v34 = 0;
  uint64_t v36 = 0;
  if (!v24) {
    goto LABEL_18;
  }
LABEL_13:
  uint64_t v37 = sub_27DDB0();
  uint64_t v39 = v38;

  if (!v23) {
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v40 = sub_27DDB0();
  uint64_t v42 = v41;

  return (BALinkData *)BridgedLinkData.init(previousSectionID:previousSectionName:previousContentID:linkActionType:previousSeriesID:previousGenreID:previousCollectionID:previousAuthorID:previousFlowcaseID:previousBrickID:)(v52, v51, v50, v49, v48, v47, a6, v46, v45, v44, v30, v31, v33, v34, v36, v37, v39, v40, v42);
}

- (BALinkData)init
{
  result = (BALinkData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end