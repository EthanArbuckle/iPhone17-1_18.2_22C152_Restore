@interface PGMemoryFeatureSpecification
- (BOOL)combineFeatureNodes;
- (NSSet)typeSpecificIdentifiers;
- (PGGraphFeatureNodeCollection)featureNodes;
- (PGMemoryFeatureSpecification)initWithFeatureType:(int64_t)a3 typeSpecificIdentifiers:(id)a4 combineFeatureNodes:(BOOL)a5 graph:(id)a6 loggingConnection:(id)a7;
- (id)featureNodesInGraph:(id)a3;
- (int64_t)featureType;
@end

@implementation PGMemoryFeatureSpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNodes, 0);
  objc_storeStrong((id *)&self->_typeSpecificIdentifiers, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

- (BOOL)combineFeatureNodes
{
  return self->_combineFeatureNodes;
}

- (PGGraphFeatureNodeCollection)featureNodes
{
  return self->_featureNodes;
}

- (NSSet)typeSpecificIdentifiers
{
  return self->_typeSpecificIdentifiers;
}

- (int64_t)featureType
{
  return self->_featureType;
}

- (id)featureNodesInGraph:(id)a3
{
  id v4 = a3;
  switch(self->_featureType)
  {
    case 1:
      v5 = PGGraphMonthDayNodeCollection;
      goto LABEL_62;
    case 2:
      typeSpecificIdentifiers = self->_typeSpecificIdentifiers;
      if (!typeSpecificIdentifiers) {
        goto LABEL_61;
      }
      if ([(NSSet *)typeSpecificIdentifiers count] == 1)
      {
        v7 = [(NSSet *)self->_typeSpecificIdentifiers anyObject];
        v8 = +[PGGraphSeasonNodeCollection seasonNodesForSeasonName:v7 inGraph:v4];
        v9 = [v8 featureNodeCollection];

        goto LABEL_65;
      }
      v28 = self->_typeSpecificIdentifiers;
      if (!v28 || [(NSSet *)v28 count] < 2)
      {
LABEL_61:
        v5 = PGGraphSeasonNodeCollection;
        goto LABEL_62;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      *(_WORD *)buf = 0;
      v26 = "[PGMemoryFeatureSpecification] Only one seasonName should be defined in the PGFeatureTypeSeason typeSpecificIdentifier.";
      v27 = buf;
      goto LABEL_59;
    case 3:
      v5 = PGGraphAreaNodeCollection;
      goto LABEL_62;
    case 4:
      v10 = self->_typeSpecificIdentifiers;
      v11 = PGGraphROINodeCollection;
      if (!v10) {
        goto LABEL_33;
      }
      v12 = [(NSSet *)v10 allObjects];
      v13 = +[PGGraphROINodeCollection roiNodesForLabels:v12 inGraph:v4];
      goto LABEL_41;
    case 5:
      v14 = self->_typeSpecificIdentifiers;
      v11 = PGGraphPOINodeCollection;
      if (!v14) {
        goto LABEL_33;
      }
      v12 = [(NSSet *)v14 allObjects];
      v13 = +[PGGraphPOINodeCollection poiNodesForLabels:v12 inGraph:v4];
      goto LABEL_41;
    case 6:
      v5 = PGGraphLocationDistrictNodeCollection;
      goto LABEL_62;
    case 7:
      v5 = PGGraphAddressNodeCollection;
      goto LABEL_62;
    case 8:
      v5 = PGGraphLocationCityNodeCollection;
      goto LABEL_62;
    case 9:
      v5 = PGGraphLocationStateNodeCollection;
      goto LABEL_62;
    case 0xALL:
      v5 = PGGraphLocationCountryNodeCollection;
      goto LABEL_62;
    case 0xBLL:
      v15 = +[PGGraphHomeWorkNodeCollection homeNodesInGraph:v4];
      goto LABEL_63;
    case 0xCLL:
      v15 = +[PGGraphHomeWorkNodeCollection workNodesInGraph:v4];
      goto LABEL_63;
    case 0xDLL:
      v5 = PGGraphFrequentLocationNodeCollection;
      goto LABEL_62;
    case 0xELL:
      v5 = PGGraphSocialGroupNodeCollection;
      goto LABEL_62;
    case 0xFLL:
      v15 = +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:v4];
      goto LABEL_63;
    case 0x10:
      v15 = +[PGGraphPersonNodeCollection personNodesInAgeCategories:&unk_1F28D3E70 includingMe:0 inGraph:v4];
      goto LABEL_63;
    case 0x11:
      v5 = PGGraphPetNodeCollection;
      goto LABEL_62;
    case 0x12:
      v16 = self->_typeSpecificIdentifiers;
      if (v16)
      {
        v15 = +[PGGraphSceneNodeCollection sceneNodesForSceneNames:v16 inGraph:v4];
        goto LABEL_63;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      __int16 v35 = 0;
      v26 = "[PGMemoryFeatureSpecification] No sceneNames specified for PGFeatureTypeScene.";
      v27 = (uint8_t *)&v35;
      goto LABEL_59;
    case 0x13:
      v17 = self->_typeSpecificIdentifiers;
      if (v17)
      {
        v12 = [(NSSet *)v17 allObjects];
        v13 = +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneNames:v12 inGraph:v4];
        goto LABEL_41;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      __int16 v34 = 0;
      v26 = "[PGMemoryFeatureSpecification] No sceneFeatureNodeLabels specified for PGFeatureTypeSceneFeature";
      v27 = (uint8_t *)&v34;
      goto LABEL_59;
    case 0x14:
      v18 = self->_typeSpecificIdentifiers;
      v5 = PGGraphAudioFeatureNodeCollection;
      if (!v18) {
        goto LABEL_62;
      }
      v15 = +[PGGraphAudioFeatureNodeCollection audioFeatureNodesForLabels:v18 inGraph:v4];
      goto LABEL_63;
    case 0x15:
      v19 = self->_typeSpecificIdentifiers;
      if (v19)
      {
        v12 = [(NSSet *)v19 allObjects];
        v13 = +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:v12 inGraph:v4];
        goto LABEL_41;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      __int16 v33 = 0;
      v26 = "[PGMemoryFeatureSpecification] No meaningLabels specified for PGFeatureTypeMeaning.";
      v27 = (uint8_t *)&v33;
      goto LABEL_59;
    case 0x16:
      v20 = self->_typeSpecificIdentifiers;
      v11 = PGGraphHolidayNodeCollection;
      if (v20)
      {
        v12 = [(NSSet *)v20 allObjects];
        v13 = +[PGGraphHolidayNodeCollection holidayNodesWithNames:v12 inGraph:v4];
        goto LABEL_41;
      }
LABEL_33:
      v5 = v11;
LABEL_62:
      v15 = [(__objc2_class *)v5 nodesInGraph:v4];
      goto LABEL_63;
    case 0x17:
      v21 = self->_typeSpecificIdentifiers;
      if (v21)
      {
        v15 = +[PGGraphPersonActivityMeaningNodeCollection personActivityMeaningNodesForActivityLabels:v21 inGraph:v4];
        goto LABEL_63;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      __int16 v32 = 0;
      v26 = "[PGMemoryFeatureSpecification] No activityLabels specified for PGFeatureTypePersonActivityMeaning.";
      v27 = (uint8_t *)&v32;
      goto LABEL_59;
    case 0x18:
      v22 = self->_typeSpecificIdentifiers;
      if (v22)
      {
        v12 = +[PGGraphBusinessCategoryNodeCollection businessCategoryNodesForCategories:v22 inGraph:v4];
        v13 = [v12 businessNodes];
LABEL_41:
        v24 = v13;
        v9 = [v13 featureNodeCollection];

        goto LABEL_64;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR)) {
        goto LABEL_60;
      }
      __int16 v31 = 0;
      v26 = "[PGMemoryFeatureSpecification] No businessCategories specified for PGFeatureTypeBusiness.";
      v27 = (uint8_t *)&v31;
      goto LABEL_59;
    case 0x19:
      v23 = self->_typeSpecificIdentifiers;
      if (v23)
      {
        v15 = +[PGGraphPublicEventNodeCollection publicEventNodesWithCategories:v23 inGraph:v4];
LABEL_63:
        v12 = v15;
        v9 = [v15 featureNodeCollection];
LABEL_64:
      }
      else
      {
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        {
          __int16 v30 = 0;
          v26 = "[PGMemoryFeatureSpecification] No publicEventCategories specified for PGFeatureTypePublicEvent.";
          v27 = (uint8_t *)&v30;
LABEL_59:
          _os_log_error_impl(&dword_1D1805000, loggingConnection, OS_LOG_TYPE_ERROR, v26, v27, 2u);
        }
LABEL_60:
        v9 = 0;
      }
LABEL_65:

      return v9;
    case 0x1ALL:
      v12 = +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:v4];
      v13 = [v12 highlightGroupNodes];
      goto LABEL_41;
    case 0x1BLL:
      v5 = PGGraphMeNodeCollection;
      goto LABEL_62;
    default:
      goto LABEL_60;
  }
}

- (PGMemoryFeatureSpecification)initWithFeatureType:(int64_t)a3 typeSpecificIdentifiers:(id)a4 combineFeatureNodes:(BOOL)a5 graph:(id)a6 loggingConnection:(id)a7
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PGMemoryFeatureSpecification;
  v16 = [(PGMemoryFeatureSpecification *)&v21 init];
  v17 = v16;
  if (v16)
  {
    v16->_featureType = a3;
    objc_storeStrong((id *)&v16->_typeSpecificIdentifiers, a4);
    v17->_combineFeatureNodes = a5;
    objc_storeStrong((id *)&v17->_loggingConnection, a7);
    uint64_t v18 = [(PGMemoryFeatureSpecification *)v17 featureNodesInGraph:v14];
    featureNodes = v17->_featureNodes;
    v17->_featureNodes = (PGGraphFeatureNodeCollection *)v18;
  }
  return v17;
}

@end