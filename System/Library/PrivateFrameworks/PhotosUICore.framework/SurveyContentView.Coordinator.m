@interface SurveyContentView.Coordinator
- (_TtCV12PhotosUICoreP33_AFC00BCA01978D7A3A12D1D9F0B75D8117SurveyContentView11Coordinator)init;
- (void)surveyQuestionGadget:(id)a3 presentAssetCollection:(id)a4 regionOfInterest:(id)a5;
- (void)surveyQuestionGadget:(id)a3 presentViewController:(id)a4 regionOfInterest:(id)a5;
- (void)surveyQuestionGadgetPresentOneUp:(id)a3 keyAsset:(id)a4 assetCollection:(id)a5 regionOfInterest:(id)a6;
@end

@implementation SurveyContentView.Coordinator

- (void)surveyQuestionGadgetPresentOneUp:(id)a3 keyAsset:(id)a4 assetCollection:(id)a5 regionOfInterest:(id)a6
{
  uint64_t v11 = type metadata accessor for LemonadeNavigationDestination(0);
  MEMORY[0x1F4188790](v11, v12);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = a4;
  id v16 = a3;
  id v17 = a5;
  id v27 = a6;
  v18 = self;
  sub_1A9B710C4();
  sub_1A9B710C4();
  id v19 = v17;
  sub_1AA1718F4();
  *(void *)v14 = v20;
  *((void *)v14 + 1) = v21;
  v14[16] = v22;
  v14[17] = v23 & 1;
  v14[18] = v24 & 1;
  *((void *)v14 + 3) = v25;
  swift_storeEnumTagMultiPayload();
  sub_1AA326FA8((uint64_t)v14, a6);
  sub_1AA328BD0((uint64_t)v14, type metadata accessor for LemonadeNavigationDestination);
}

- (void)surveyQuestionGadget:(id)a3 presentAssetCollection:(id)a4 regionOfInterest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  sub_1AA328C30(v9, a5);
}

- (void)surveyQuestionGadget:(id)a3 presentViewController:(id)a4 regionOfInterest:(id)a5
{
  uint64_t v9 = type metadata accessor for LemonadeNavigationDestination(0);
  MEMORY[0x1F4188790](v9, v9);
  uint64_t v11 = (id *)((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v11 = a4;
  swift_storeEnumTagMultiPayload();
  id v12 = a4;
  id v13 = a3;
  id v14 = a5;
  id v15 = self;
  sub_1AA326FA8((uint64_t)v11, a5);
  sub_1AA328BD0((uint64_t)v11, type metadata accessor for LemonadeNavigationDestination);
}

- (_TtCV12PhotosUICoreP33_AFC00BCA01978D7A3A12D1D9F0B75D8117SurveyContentView11Coordinator)init
{
  result = (_TtCV12PhotosUICoreP33_AFC00BCA01978D7A3A12D1D9F0B75D8117SurveyContentView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end