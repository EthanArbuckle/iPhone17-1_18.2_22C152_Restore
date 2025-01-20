@interface PXUpNextSettings
+ (PXUpNextSettings)sharedInstance;
+ (id)_enabledCondition;
+ (id)_featureSliderForFeature:(id)a3 valueKeyPath:(id)a4;
+ (id)_upNextVectorSliderSections;
+ (id)settingsControllerModule;
- (BOOL)enableCustomVectors;
- (BOOL)forceFallbackMemories;
- (BOOL)overrideMemoriesResult;
- (NSArray)featureWeightVectors;
- (NSArray)vector0;
- (NSArray)vector1;
- (NSArray)vector2;
- (NSArray)vector3;
- (NSArray)vector4;
- (float)dateWeight0;
- (float)dateWeight1;
- (float)dateWeight2;
- (float)dateWeight3;
- (float)dateWeight4;
- (float)locationWeight0;
- (float)locationWeight1;
- (float)locationWeight2;
- (float)locationWeight3;
- (float)locationWeight4;
- (float)meaningWeight0;
- (float)meaningWeight1;
- (float)meaningWeight2;
- (float)meaningWeight3;
- (float)meaningWeight4;
- (float)memoryFeatureWeight0;
- (float)memoryFeatureWeight1;
- (float)memoryFeatureWeight2;
- (float)memoryFeatureWeight3;
- (float)memoryFeatureWeight4;
- (float)personWeight0;
- (float)personWeight1;
- (float)personWeight2;
- (float)personWeight3;
- (float)personWeight4;
- (float)sceneWeight0;
- (float)sceneWeight1;
- (float)sceneWeight2;
- (float)sceneWeight3;
- (float)sceneWeight4;
- (float)tripWeight0;
- (float)tripWeight1;
- (float)tripWeight2;
- (float)tripWeight3;
- (float)tripWeight4;
- (id)_featureWeightVectorsFromCurationMode:(unint64_t)a3;
- (id)_mostRelevantFeatureWeightVectors;
- (id)_varietyFeatureWeightVectors;
- (id)_weightArrayWithWeightForPerson:(float)a3 scene:(float)a4 location:(float)a5 date:(float)a6 meaning:(float)a7 memoryFeature:(float)a8 trip:(float)a9;
- (id)parentSettings;
- (unint64_t)curationMode;
- (void)_updateSettingsVectors:(id)a3;
- (void)didChangeValueForKey:(id)a3;
- (void)performPostSaveActions;
- (void)setCurationMode:(unint64_t)a3;
- (void)setDateWeight0:(float)a3;
- (void)setDateWeight1:(float)a3;
- (void)setDateWeight2:(float)a3;
- (void)setDateWeight3:(float)a3;
- (void)setDateWeight4:(float)a3;
- (void)setDefaultValues;
- (void)setEnableCustomVectors:(BOOL)a3;
- (void)setFeatureWeightVectors:(id)a3;
- (void)setForceFallbackMemories:(BOOL)a3;
- (void)setLocationWeight0:(float)a3;
- (void)setLocationWeight1:(float)a3;
- (void)setLocationWeight2:(float)a3;
- (void)setLocationWeight3:(float)a3;
- (void)setLocationWeight4:(float)a3;
- (void)setMeaningWeight0:(float)a3;
- (void)setMeaningWeight1:(float)a3;
- (void)setMeaningWeight2:(float)a3;
- (void)setMeaningWeight3:(float)a3;
- (void)setMeaningWeight4:(float)a3;
- (void)setMemoryFeatureWeight0:(float)a3;
- (void)setMemoryFeatureWeight1:(float)a3;
- (void)setMemoryFeatureWeight2:(float)a3;
- (void)setMemoryFeatureWeight3:(float)a3;
- (void)setMemoryFeatureWeight4:(float)a3;
- (void)setOverrideMemoriesResult:(BOOL)a3;
- (void)setPersonWeight0:(float)a3;
- (void)setPersonWeight1:(float)a3;
- (void)setPersonWeight2:(float)a3;
- (void)setPersonWeight3:(float)a3;
- (void)setPersonWeight4:(float)a3;
- (void)setSceneWeight0:(float)a3;
- (void)setSceneWeight1:(float)a3;
- (void)setSceneWeight2:(float)a3;
- (void)setSceneWeight3:(float)a3;
- (void)setSceneWeight4:(float)a3;
- (void)setTripWeight0:(float)a3;
- (void)setTripWeight1:(float)a3;
- (void)setTripWeight2:(float)a3;
- (void)setTripWeight3:(float)a3;
- (void)setTripWeight4:(float)a3;
- (void)setVector0:(id)a3;
- (void)setVector1:(id)a3;
- (void)setVector2:(id)a3;
- (void)setVector3:(id)a3;
- (void)setVector4:(id)a3;
@end

@implementation PXUpNextSettings

- (void)setDefaultValues
{
  v4.receiver = self;
  v4.super_class = (Class)PXUpNextSettings;
  [(PTSettings *)&v4 setDefaultValues];
  [(PXUpNextSettings *)self setForceFallbackMemories:0];
  [(PXUpNextSettings *)self setEnableCustomVectors:0];
  [(PXUpNextSettings *)self setOverrideMemoriesResult:0];
  [(PXUpNextSettings *)self setCurationMode:0];
  v3 = [(PXUpNextSettings *)self _featureWeightVectorsFromCurationMode:[(PXUpNextSettings *)self curationMode]];
  [(PXUpNextSettings *)self _updateSettingsVectors:v3];
}

- (void)setOverrideMemoriesResult:(BOOL)a3
{
  self->_overrideMemoriesResult = a3;
}

- (void)setForceFallbackMemories:(BOOL)a3
{
  self->_forceFallbackMemories = a3;
}

- (void)setEnableCustomVectors:(BOOL)a3
{
  self->_enableCustomVectors = a3;
}

- (void)setCurationMode:(unint64_t)a3
{
  self->_curationMode = a3;
}

- (unint64_t)curationMode
{
  return self->_curationMode;
}

- (void)_updateSettingsVectors:(id)a3
{
  v86[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectAtIndexedSubscript:0];
  [(PXUpNextSettings *)self setVector0:v5];

  v6 = [(PXUpNextSettings *)self vector0];
  v7 = [v6 objectAtIndexedSubscript:0];
  [v7 floatValue];
  -[PXUpNextSettings setPersonWeight0:](self, "setPersonWeight0:");

  v8 = [(PXUpNextSettings *)self vector0];
  v9 = [v8 objectAtIndexedSubscript:1];
  [v9 floatValue];
  -[PXUpNextSettings setSceneWeight0:](self, "setSceneWeight0:");

  v10 = [(PXUpNextSettings *)self vector0];
  v11 = [v10 objectAtIndexedSubscript:2];
  [v11 floatValue];
  -[PXUpNextSettings setLocationWeight0:](self, "setLocationWeight0:");

  v12 = [(PXUpNextSettings *)self vector0];
  v13 = [v12 objectAtIndexedSubscript:3];
  [v13 floatValue];
  -[PXUpNextSettings setDateWeight0:](self, "setDateWeight0:");

  v14 = [(PXUpNextSettings *)self vector0];
  v15 = [v14 objectAtIndexedSubscript:4];
  [v15 floatValue];
  -[PXUpNextSettings setMeaningWeight0:](self, "setMeaningWeight0:");

  v16 = [(PXUpNextSettings *)self vector0];
  v17 = [v16 objectAtIndexedSubscript:5];
  [v17 floatValue];
  -[PXUpNextSettings setMemoryFeatureWeight0:](self, "setMemoryFeatureWeight0:");

  v18 = [(PXUpNextSettings *)self vector0];
  v19 = [v18 objectAtIndexedSubscript:6];
  [v19 floatValue];
  -[PXUpNextSettings setTripWeight0:](self, "setTripWeight0:");

  v20 = [v4 objectAtIndexedSubscript:1];
  [(PXUpNextSettings *)self setVector1:v20];

  v21 = [(PXUpNextSettings *)self vector1];
  v22 = [v21 objectAtIndexedSubscript:0];
  [v22 floatValue];
  -[PXUpNextSettings setPersonWeight1:](self, "setPersonWeight1:");

  v23 = [(PXUpNextSettings *)self vector1];
  v24 = [v23 objectAtIndexedSubscript:1];
  [v24 floatValue];
  -[PXUpNextSettings setSceneWeight1:](self, "setSceneWeight1:");

  v25 = [(PXUpNextSettings *)self vector1];
  v26 = [v25 objectAtIndexedSubscript:2];
  [v26 floatValue];
  -[PXUpNextSettings setLocationWeight1:](self, "setLocationWeight1:");

  v27 = [(PXUpNextSettings *)self vector1];
  v28 = [v27 objectAtIndexedSubscript:3];
  [v28 floatValue];
  -[PXUpNextSettings setDateWeight1:](self, "setDateWeight1:");

  v29 = [(PXUpNextSettings *)self vector1];
  v30 = [v29 objectAtIndexedSubscript:4];
  [v30 floatValue];
  -[PXUpNextSettings setMeaningWeight1:](self, "setMeaningWeight1:");

  v31 = [(PXUpNextSettings *)self vector1];
  v32 = [v31 objectAtIndexedSubscript:5];
  [v32 floatValue];
  -[PXUpNextSettings setMemoryFeatureWeight1:](self, "setMemoryFeatureWeight1:");

  v33 = [(PXUpNextSettings *)self vector1];
  v34 = [v33 objectAtIndexedSubscript:6];
  [v34 floatValue];
  -[PXUpNextSettings setTripWeight1:](self, "setTripWeight1:");

  v35 = [v4 objectAtIndexedSubscript:2];
  [(PXUpNextSettings *)self setVector2:v35];

  v36 = [(PXUpNextSettings *)self vector2];
  v37 = [v36 objectAtIndexedSubscript:0];
  [v37 floatValue];
  -[PXUpNextSettings setPersonWeight2:](self, "setPersonWeight2:");

  v38 = [(PXUpNextSettings *)self vector2];
  v39 = [v38 objectAtIndexedSubscript:1];
  [v39 floatValue];
  -[PXUpNextSettings setSceneWeight2:](self, "setSceneWeight2:");

  v40 = [(PXUpNextSettings *)self vector2];
  v41 = [v40 objectAtIndexedSubscript:2];
  [v41 floatValue];
  -[PXUpNextSettings setLocationWeight2:](self, "setLocationWeight2:");

  v42 = [(PXUpNextSettings *)self vector2];
  v43 = [v42 objectAtIndexedSubscript:3];
  [v43 floatValue];
  -[PXUpNextSettings setDateWeight2:](self, "setDateWeight2:");

  v44 = [(PXUpNextSettings *)self vector2];
  v45 = [v44 objectAtIndexedSubscript:4];
  [v45 floatValue];
  -[PXUpNextSettings setMeaningWeight2:](self, "setMeaningWeight2:");

  v46 = [(PXUpNextSettings *)self vector2];
  v47 = [v46 objectAtIndexedSubscript:5];
  [v47 floatValue];
  -[PXUpNextSettings setMemoryFeatureWeight2:](self, "setMemoryFeatureWeight2:");

  v48 = [(PXUpNextSettings *)self vector2];
  v49 = [v48 objectAtIndexedSubscript:6];
  [v49 floatValue];
  -[PXUpNextSettings setTripWeight2:](self, "setTripWeight2:");

  v50 = [v4 objectAtIndexedSubscript:3];
  [(PXUpNextSettings *)self setVector3:v50];

  v51 = [(PXUpNextSettings *)self vector3];
  v52 = [v51 objectAtIndexedSubscript:0];
  [v52 floatValue];
  -[PXUpNextSettings setPersonWeight3:](self, "setPersonWeight3:");

  v53 = [(PXUpNextSettings *)self vector3];
  v54 = [v53 objectAtIndexedSubscript:1];
  [v54 floatValue];
  -[PXUpNextSettings setSceneWeight3:](self, "setSceneWeight3:");

  v55 = [(PXUpNextSettings *)self vector3];
  v56 = [v55 objectAtIndexedSubscript:2];
  [v56 floatValue];
  -[PXUpNextSettings setLocationWeight3:](self, "setLocationWeight3:");

  v57 = [(PXUpNextSettings *)self vector3];
  v58 = [v57 objectAtIndexedSubscript:3];
  [v58 floatValue];
  -[PXUpNextSettings setDateWeight3:](self, "setDateWeight3:");

  v59 = [(PXUpNextSettings *)self vector3];
  v60 = [v59 objectAtIndexedSubscript:4];
  [v60 floatValue];
  -[PXUpNextSettings setMeaningWeight3:](self, "setMeaningWeight3:");

  v61 = [(PXUpNextSettings *)self vector3];
  v62 = [v61 objectAtIndexedSubscript:5];
  [v62 floatValue];
  -[PXUpNextSettings setMemoryFeatureWeight3:](self, "setMemoryFeatureWeight3:");

  v63 = [(PXUpNextSettings *)self vector3];
  v64 = [v63 objectAtIndexedSubscript:6];
  [v64 floatValue];
  -[PXUpNextSettings setTripWeight3:](self, "setTripWeight3:");

  v65 = [v4 objectAtIndexedSubscript:4];

  [(PXUpNextSettings *)self setVector4:v65];
  v66 = [(PXUpNextSettings *)self vector4];
  v67 = [v66 objectAtIndexedSubscript:0];
  [v67 floatValue];
  -[PXUpNextSettings setPersonWeight4:](self, "setPersonWeight4:");

  v68 = [(PXUpNextSettings *)self vector4];
  v69 = [v68 objectAtIndexedSubscript:1];
  [v69 floatValue];
  -[PXUpNextSettings setSceneWeight4:](self, "setSceneWeight4:");

  v70 = [(PXUpNextSettings *)self vector4];
  v71 = [v70 objectAtIndexedSubscript:2];
  [v71 floatValue];
  -[PXUpNextSettings setLocationWeight4:](self, "setLocationWeight4:");

  v72 = [(PXUpNextSettings *)self vector4];
  v73 = [v72 objectAtIndexedSubscript:3];
  [v73 floatValue];
  -[PXUpNextSettings setDateWeight4:](self, "setDateWeight4:");

  v74 = [(PXUpNextSettings *)self vector4];
  v75 = [v74 objectAtIndexedSubscript:4];
  [v75 floatValue];
  -[PXUpNextSettings setMeaningWeight4:](self, "setMeaningWeight4:");

  v76 = [(PXUpNextSettings *)self vector4];
  v77 = [v76 objectAtIndexedSubscript:5];
  [v77 floatValue];
  -[PXUpNextSettings setMemoryFeatureWeight4:](self, "setMemoryFeatureWeight4:");

  v78 = [(PXUpNextSettings *)self vector4];
  v79 = [v78 objectAtIndexedSubscript:6];
  [v79 floatValue];
  -[PXUpNextSettings setTripWeight4:](self, "setTripWeight4:");

  v80 = [(PXUpNextSettings *)self vector0];
  v81 = [(PXUpNextSettings *)self vector1];
  v86[1] = v81;
  v82 = [(PXUpNextSettings *)self vector2];
  v86[2] = v82;
  v83 = [(PXUpNextSettings *)self vector3];
  v86[3] = v83;
  v84 = [(PXUpNextSettings *)self vector4];
  v86[4] = v84;
  v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:5];
  [(PXUpNextSettings *)self setFeatureWeightVectors:v85];
}

- (NSArray)vector4
{
  return self->_vector4;
}

- (NSArray)vector3
{
  return self->_vector3;
}

- (NSArray)vector2
{
  return self->_vector2;
}

- (NSArray)vector1
{
  return self->_vector1;
}

- (NSArray)vector0
{
  return self->_vector0;
}

- (void)setVector4:(id)a3
{
}

- (void)setVector3:(id)a3
{
}

- (void)setVector2:(id)a3
{
}

- (void)setVector1:(id)a3
{
}

- (void)setVector0:(id)a3
{
}

- (void)setTripWeight4:(float)a3
{
  self->_tripWeight4 = a3;
}

- (void)setTripWeight3:(float)a3
{
  self->_tripWeight3 = a3;
}

- (void)setTripWeight2:(float)a3
{
  self->_tripWeight2 = a3;
}

- (void)setTripWeight1:(float)a3
{
  self->_tripWeight1 = a3;
}

- (void)setTripWeight0:(float)a3
{
  self->_tripWeight0 = a3;
}

- (void)setSceneWeight4:(float)a3
{
  self->_sceneWeight4 = a3;
}

- (void)setSceneWeight3:(float)a3
{
  self->_sceneWeight3 = a3;
}

- (void)setSceneWeight2:(float)a3
{
  self->_sceneWeight2 = a3;
}

- (void)setSceneWeight1:(float)a3
{
  self->_sceneWeight1 = a3;
}

- (void)setSceneWeight0:(float)a3
{
  self->_sceneWeight0 = a3;
}

- (void)setPersonWeight4:(float)a3
{
  self->_personWeight4 = a3;
}

- (void)setPersonWeight3:(float)a3
{
  self->_personWeight3 = a3;
}

- (void)setPersonWeight2:(float)a3
{
  self->_personWeight2 = a3;
}

- (void)setPersonWeight1:(float)a3
{
  self->_personWeight1 = a3;
}

- (void)setPersonWeight0:(float)a3
{
  self->_personWeight0 = a3;
}

- (void)setMemoryFeatureWeight4:(float)a3
{
  self->_memoryFeatureWeight4 = a3;
}

- (void)setMemoryFeatureWeight3:(float)a3
{
  self->_memoryFeatureWeight3 = a3;
}

- (void)setMemoryFeatureWeight2:(float)a3
{
  self->_memoryFeatureWeight2 = a3;
}

- (void)setMemoryFeatureWeight1:(float)a3
{
  self->_memoryFeatureWeight1 = a3;
}

- (void)setMemoryFeatureWeight0:(float)a3
{
  self->_memoryFeatureWeight0 = a3;
}

- (void)setMeaningWeight4:(float)a3
{
  self->_meaningWeight4 = a3;
}

- (void)setMeaningWeight3:(float)a3
{
  self->_meaningWeight3 = a3;
}

- (void)setMeaningWeight2:(float)a3
{
  self->_meaningWeight2 = a3;
}

- (void)setMeaningWeight1:(float)a3
{
  self->_meaningWeight1 = a3;
}

- (void)setMeaningWeight0:(float)a3
{
  self->_meaningWeight0 = a3;
}

- (void)setLocationWeight4:(float)a3
{
  self->_locationWeight4 = a3;
}

- (void)setLocationWeight3:(float)a3
{
  self->_locationWeight3 = a3;
}

- (void)setLocationWeight2:(float)a3
{
  self->_locationWeight2 = a3;
}

- (void)setLocationWeight1:(float)a3
{
  self->_locationWeight1 = a3;
}

- (void)setLocationWeight0:(float)a3
{
  self->_locationWeight0 = a3;
}

- (void)setFeatureWeightVectors:(id)a3
{
}

- (void)setDateWeight4:(float)a3
{
  self->_dateWeight4 = a3;
}

- (void)setDateWeight3:(float)a3
{
  self->_dateWeight3 = a3;
}

- (void)setDateWeight2:(float)a3
{
  self->_dateWeight2 = a3;
}

- (void)setDateWeight1:(float)a3
{
  self->_dateWeight1 = a3;
}

- (void)setDateWeight0:(float)a3
{
  self->_dateWeight0 = a3;
}

- (id)_featureWeightVectorsFromCurationMode:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = [(PXUpNextSettings *)self _mostRelevantFeatureWeightVectors];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    v3 = [(PXUpNextSettings *)self _varietyFeatureWeightVectors];
  }
  a2 = v3;
LABEL_6:
  return (id)(id)a2;
}

- (id)_varietyFeatureWeightVectors
{
  v36[5] = *MEMORY[0x1E4F143B8];
  LODWORD(v2) = 10.0;
  LODWORD(v3) = 10.0;
  LODWORD(v4) = 10.0;
  LODWORD(v5) = 20.0;
  LODWORD(v6) = 10.0;
  LODWORD(v7) = 20.0;
  LODWORD(v8) = 10.0;
  v10 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v2 scene:v3 location:v4 date:v5 meaning:v6 memoryFeature:v7 trip:v8];
  LODWORD(v11) = 5.0;
  LODWORD(v12) = 10.0;
  LODWORD(v13) = -15.0;
  LODWORD(v14) = 1.0;
  LODWORD(v15) = 5.0;
  v16 = -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v11, v12, v13, v14, v15, 0.0, 0.0, v10);
  v36[1] = v16;
  LODWORD(v17) = -15.0;
  LODWORD(v18) = 5.0;
  LODWORD(v19) = 5.0;
  LODWORD(v20) = 5.0;
  LODWORD(v21) = 2.5;
  v22 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v17 scene:v18 location:v19 date:v20 meaning:v21 memoryFeature:0.0 trip:0.0];
  v36[2] = v22;
  LODWORD(v23) = 20.0;
  LODWORD(v24) = 10.0;
  LODWORD(v25) = 1.0;
  LODWORD(v26) = 5.0;
  v27 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v23 scene:v24 location:0.0 date:v25 meaning:v26 memoryFeature:0.0 trip:0.0];
  v36[3] = v27;
  LODWORD(v28) = 5.0;
  LODWORD(v29) = 5.0;
  LODWORD(v30) = 5.0;
  LODWORD(v31) = -20.0;
  LODWORD(v32) = 2.5;
  v33 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v28 scene:v29 location:v30 date:v31 meaning:v32 memoryFeature:0.0 trip:0.0];
  v36[4] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:5];

  return v34;
}

- (id)_weightArrayWithWeightForPerson:(float)a3 scene:(float)a4 location:(float)a5 date:(float)a6 meaning:(float)a7 memoryFeature:(float)a8 trip:(float)a9
{
  v30[7] = *MEMORY[0x1E4F143B8];
  double v15 = objc_msgSend(NSNumber, "numberWithFloat:");
  *(float *)&double v16 = a4;
  double v17 = objc_msgSend(NSNumber, "numberWithFloat:", v16, v15);
  v30[1] = v17;
  *(float *)&double v18 = a5;
  double v19 = [NSNumber numberWithFloat:v18];
  v30[2] = v19;
  *(float *)&double v20 = a6;
  double v21 = [NSNumber numberWithFloat:v20];
  v30[3] = v21;
  *(float *)&double v22 = a7;
  double v23 = [NSNumber numberWithFloat:v22];
  v30[4] = v23;
  *(float *)&double v24 = a8;
  double v25 = [NSNumber numberWithFloat:v24];
  v30[5] = v25;
  *(float *)&double v26 = a9;
  v27 = [NSNumber numberWithFloat:v26];
  v30[6] = v27;
  double v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:7];

  return v28;
}

+ (id)_enabledCondition
{
  double v2 = (void *)MEMORY[0x1E4F28F60];
  double v3 = NSStringFromSelector(sel_enableCustomVectors);
  double v4 = objc_msgSend(v2, "predicateWithFormat:", @"%K != 0", v3);

  return v4;
}

+ (id)_featureSliderForFeature:(id)a3 valueKeyPath:(id)a4
{
  double v4 = [MEMORY[0x1E4F941D8] rowWithTitle:a3 valueKeyPath:a4];
  double v5 = [v4 minValue:-20.0 maxValue:20.0];
  double v6 = objc_msgSend(v5, "px_increment:", 0.1);

  return v6;
}

+ (id)_upNextVectorSliderSections
{
  v47[8] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v4 = v3;
  if (*MEMORY[0x1E4F8B140])
  {
    uint64_t v5 = 0;
    uint64_t v24 = *MEMORY[0x1E4F8B140];
    double v25 = v3;
    do
    {
      double v6 = objc_msgSend(NSString, "stringWithFormat:", @"personWeight%lu", v5);
      double v7 = objc_msgSend(NSString, "stringWithFormat:", @"sceneWeight%lu", v5);
      double v8 = objc_msgSend(NSString, "stringWithFormat:", @"locationWeight%lu", v5);
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"dateWeight%lu", v5);
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"meaningWeight%lu", v5);
      double v11 = objc_msgSend(NSString, "stringWithFormat:", @"memoryFeatureWeight%lu", v5);
      double v12 = objc_msgSend(NSString, "stringWithFormat:", @"tripWeight%lu", v5);
      double v30 = (void *)MEMORY[0x1E4F940F8];
      double v13 = (void *)MEMORY[0x1E4F94190];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __51__PXUpNextSettings_UI___upNextVectorSliderSections__block_invoke;
      v39[3] = &unk_1E5DBAA58;
      id v40 = v6;
      id v41 = v7;
      id v42 = v8;
      id v43 = v9;
      id v44 = v10;
      id v45 = v11;
      id v46 = v12;
      id v38 = v12;
      id v37 = v11;
      id v32 = v10;
      id v33 = v9;
      id v34 = v8;
      id v35 = v7;
      id v36 = v6;
      double v14 = [v13 actionWithHandler:v39];
      double v31 = [v30 rowWithTitle:@"Zero All Weights (Vector can't be all 0s)" action:v14];

      double v26 = objc_msgSend(NSString, "stringWithFormat:", @"Feature Weight Vector %lu", v5);
      double v15 = (void *)MEMORY[0x1E4F94160];
      v47[0] = v31;
      double v29 = [a1 _featureSliderForFeature:@"Person" valueKeyPath:v36];
      v47[1] = v29;
      double v28 = [a1 _featureSliderForFeature:@"Scene" valueKeyPath:v35];
      v47[2] = v28;
      v27 = [a1 _featureSliderForFeature:@"Location" valueKeyPath:v34];
      v47[3] = v27;
      double v16 = [a1 _featureSliderForFeature:@"Date" valueKeyPath:v33];
      v47[4] = v16;
      double v17 = [a1 _featureSliderForFeature:@"Meaning" valueKeyPath:v32];
      v47[5] = v17;
      double v18 = [a1 _featureSliderForFeature:@"Memory Feature" valueKeyPath:v37];
      v47[6] = v18;
      double v19 = [a1 _featureSliderForFeature:@"Trip" valueKeyPath:v38];
      v47[7] = v19;
      double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:8];
      double v21 = [a1 _enabledCondition];
      double v22 = [v15 sectionWithRows:v20 title:v26 condition:v21];

      double v4 = v25;
      [v25 addObject:v22];

      ++v5;
    }
    while (v24 != v5);
  }
  return v4;
}

uint64_t __51__PXUpNextSettings_UI___upNextVectorSliderSections__block_invoke(void *a1)
{
  double v2 = +[PXUpNextSettings sharedInstance];
  [v2 setValue:&unk_1F02DA2B0 forKeyPath:a1[4]];
  [v2 setValue:&unk_1F02DA2B0 forKeyPath:a1[5]];
  [v2 setValue:&unk_1F02DA2B0 forKeyPath:a1[6]];
  [v2 setValue:&unk_1F02DA2B0 forKeyPath:a1[7]];
  [v2 setValue:&unk_1F02DA2B0 forKeyPath:a1[8]];
  [v2 setValue:&unk_1F02DA2B0 forKeyPath:a1[9]];
  [v2 setValue:&unk_1F02DA2B0 forKeyPath:a1[10]];
  [v2 performPostSaveActions];

  return 1;
}

+ (id)settingsControllerModule
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v4 = [MEMORY[0x1E4F94108] rowWithTitle:@"Curation Mode" valueKeyPath:@"curationMode"];
  uint64_t v5 = [v4 possibleValues:&unk_1F02D43C0 titles:&unk_1F02D43D8];

  double v6 = [a1 _enabledCondition];
  [v5 setCondition:v6];

  double v7 = (void *)MEMORY[0x1E4F94160];
  double v8 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force Fallback Memories" valueKeyPath:@"forceFallbackMemories"];
  v17[0] = v8;
  v9 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Override Memories Result" valueKeyPath:@"overrideMemoriesResult"];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Custom Vector" valueKeyPath:@"enableCustomVectors"];
  v17[2] = v10;
  v17[3] = v5;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  double v12 = [v7 sectionWithRows:v11 title:@"General"];

  [v3 addObject:v12];
  double v13 = [a1 _upNextVectorSliderSections];
  [v3 addObjectsFromArray:v13];

  double v14 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  [v3 addObject:v14];
  double v15 = [MEMORY[0x1E4F94160] moduleWithTitle:@"Up Next" contents:v3];

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector4, 0);
  objc_storeStrong((id *)&self->_vector3, 0);
  objc_storeStrong((id *)&self->_vector2, 0);
  objc_storeStrong((id *)&self->_vector1, 0);
  objc_storeStrong((id *)&self->_vector0, 0);
  objc_storeStrong((id *)&self->_featureWeightVectors, 0);
}

- (float)tripWeight4
{
  return self->_tripWeight4;
}

- (float)memoryFeatureWeight4
{
  return self->_memoryFeatureWeight4;
}

- (float)meaningWeight4
{
  return self->_meaningWeight4;
}

- (float)dateWeight4
{
  return self->_dateWeight4;
}

- (float)locationWeight4
{
  return self->_locationWeight4;
}

- (float)sceneWeight4
{
  return self->_sceneWeight4;
}

- (float)personWeight4
{
  return self->_personWeight4;
}

- (float)tripWeight3
{
  return self->_tripWeight3;
}

- (float)memoryFeatureWeight3
{
  return self->_memoryFeatureWeight3;
}

- (float)meaningWeight3
{
  return self->_meaningWeight3;
}

- (float)dateWeight3
{
  return self->_dateWeight3;
}

- (float)locationWeight3
{
  return self->_locationWeight3;
}

- (float)sceneWeight3
{
  return self->_sceneWeight3;
}

- (float)personWeight3
{
  return self->_personWeight3;
}

- (float)tripWeight2
{
  return self->_tripWeight2;
}

- (float)memoryFeatureWeight2
{
  return self->_memoryFeatureWeight2;
}

- (float)meaningWeight2
{
  return self->_meaningWeight2;
}

- (float)dateWeight2
{
  return self->_dateWeight2;
}

- (float)locationWeight2
{
  return self->_locationWeight2;
}

- (float)sceneWeight2
{
  return self->_sceneWeight2;
}

- (float)personWeight2
{
  return self->_personWeight2;
}

- (float)tripWeight1
{
  return self->_tripWeight1;
}

- (float)memoryFeatureWeight1
{
  return self->_memoryFeatureWeight1;
}

- (float)meaningWeight1
{
  return self->_meaningWeight1;
}

- (float)dateWeight1
{
  return self->_dateWeight1;
}

- (float)locationWeight1
{
  return self->_locationWeight1;
}

- (float)sceneWeight1
{
  return self->_sceneWeight1;
}

- (float)personWeight1
{
  return self->_personWeight1;
}

- (float)tripWeight0
{
  return self->_tripWeight0;
}

- (float)memoryFeatureWeight0
{
  return self->_memoryFeatureWeight0;
}

- (float)meaningWeight0
{
  return self->_meaningWeight0;
}

- (float)dateWeight0
{
  return self->_dateWeight0;
}

- (float)locationWeight0
{
  return self->_locationWeight0;
}

- (float)sceneWeight0
{
  return self->_sceneWeight0;
}

- (float)personWeight0
{
  return self->_personWeight0;
}

- (NSArray)featureWeightVectors
{
  return self->_featureWeightVectors;
}

- (BOOL)overrideMemoriesResult
{
  return self->_overrideMemoriesResult;
}

- (BOOL)enableCustomVectors
{
  return self->_enableCustomVectors;
}

- (BOOL)forceFallbackMemories
{
  return self->_forceFallbackMemories;
}

- (id)_mostRelevantFeatureWeightVectors
{
  v45[5] = *MEMORY[0x1E4F143B8];
  LODWORD(v2) = 10.0;
  LODWORD(v3) = 10.0;
  LODWORD(v4) = 10.0;
  LODWORD(v5) = 1.0;
  LODWORD(v6) = 10.0;
  LODWORD(v7) = 10.0;
  LODWORD(v8) = 10.0;
  v10 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v2 scene:v3 location:v4 date:v5 meaning:v6 memoryFeature:v7 trip:v8];
  LODWORD(v11) = 10.0;
  LODWORD(v12) = 10.0;
  LODWORD(v13) = 10.0;
  LODWORD(v14) = 1.0;
  LODWORD(v15) = 10.0;
  LODWORD(v16) = 10.0;
  LODWORD(v17) = 10.0;
  double v18 = -[PXUpNextSettings _weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:](self, "_weightArrayWithWeightForPerson:scene:location:date:meaning:memoryFeature:trip:", v11, v12, v13, v14, v15, v16, v17, v10);
  v45[1] = v18;
  LODWORD(v19) = 10.0;
  LODWORD(v20) = 10.0;
  LODWORD(v21) = 10.0;
  LODWORD(v22) = 1.0;
  LODWORD(v23) = 10.0;
  LODWORD(v24) = 10.0;
  LODWORD(v25) = 10.0;
  double v26 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v19 scene:v20 location:v21 date:v22 meaning:v23 memoryFeature:v24 trip:v25];
  v45[2] = v26;
  LODWORD(v27) = 10.0;
  LODWORD(v28) = 10.0;
  LODWORD(v29) = 10.0;
  LODWORD(v30) = 1.0;
  LODWORD(v31) = 10.0;
  LODWORD(v32) = 10.0;
  LODWORD(v33) = 10.0;
  id v34 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v27 scene:v28 location:v29 date:v30 meaning:v31 memoryFeature:v32 trip:v33];
  v45[3] = v34;
  LODWORD(v35) = 10.0;
  LODWORD(v36) = 10.0;
  LODWORD(v37) = 10.0;
  LODWORD(v38) = 1.0;
  LODWORD(v39) = 10.0;
  LODWORD(v40) = 10.0;
  LODWORD(v41) = 10.0;
  id v42 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v35 scene:v36 location:v37 date:v38 meaning:v39 memoryFeature:v40 trip:v41];
  v45[4] = v42;
  id v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:5];

  return v43;
}

- (void)didChangeValueForKey:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXUpNextSettings;
  [(PXUpNextSettings *)&v12 didChangeValueForKey:v4];
  NSStringFromSelector(sel_enableCustomVectors);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {

    goto LABEL_7;
  }
  double v6 = v5;
  int v7 = [v4 isEqualToString:v5];

  if (v7)
  {
LABEL_7:
    [(PXUpNextSettings *)self performPostSaveActions];
    goto LABEL_10;
  }
  NSStringFromSelector(sel_curationMode);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v4)
  {
  }
  else
  {
    v9 = v8;
    int v10 = [v4 isEqualToString:v8];

    if (!v10) {
      goto LABEL_10;
    }
  }
  double v11 = [(PXUpNextSettings *)self _featureWeightVectorsFromCurationMode:[(PXUpNextSettings *)self curationMode]];
  [(PXUpNextSettings *)self _updateSettingsVectors:v11];
  [(PXUpNextSettings *)self performPostSaveActions];

LABEL_10:
}

- (void)performPostSaveActions
{
  v124[5] = *MEMORY[0x1E4F143B8];
  v123.receiver = self;
  v123.super_class = (Class)PXUpNextSettings;
  [(PXSettings *)&v123 performPostSaveActions];
  double v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v4 = *MEMORY[0x1E4F283E0];
  id v5 = [v3 persistentDomainForName:*MEMORY[0x1E4F283E0]];
  double v6 = (void *)[v5 mutableCopy];

  if ([(PXUpNextSettings *)self enableCustomVectors])
  {
    [(PXUpNextSettings *)self personWeight0];
    int v8 = v7;
    [(PXUpNextSettings *)self sceneWeight0];
    int v10 = v9;
    [(PXUpNextSettings *)self locationWeight0];
    int v12 = v11;
    [(PXUpNextSettings *)self dateWeight0];
    int v14 = v13;
    [(PXUpNextSettings *)self meaningWeight0];
    int v16 = v15;
    [(PXUpNextSettings *)self memoryFeatureWeight0];
    int v18 = v17;
    [(PXUpNextSettings *)self tripWeight0];
    LODWORD(v20) = v19;
    LODWORD(v21) = v8;
    LODWORD(v22) = v10;
    LODWORD(v23) = v12;
    LODWORD(v24) = v14;
    LODWORD(v25) = v16;
    LODWORD(v26) = v18;
    double v27 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v21 scene:v22 location:v23 date:v24 meaning:v25 memoryFeature:v26 trip:v20];
    [(PXUpNextSettings *)self setVector0:v27];

    double v28 = [(PXUpNextSettings *)self vector0];
    [v6 setObject:v28 forKey:*MEMORY[0x1E4F8B148]];

    [(PXUpNextSettings *)self personWeight1];
    int v30 = v29;
    [(PXUpNextSettings *)self sceneWeight1];
    int v32 = v31;
    [(PXUpNextSettings *)self locationWeight1];
    int v34 = v33;
    [(PXUpNextSettings *)self dateWeight1];
    int v36 = v35;
    [(PXUpNextSettings *)self meaningWeight1];
    int v38 = v37;
    [(PXUpNextSettings *)self memoryFeatureWeight1];
    int v40 = v39;
    [(PXUpNextSettings *)self tripWeight1];
    LODWORD(v42) = v41;
    LODWORD(v43) = v30;
    LODWORD(v44) = v32;
    LODWORD(v45) = v34;
    LODWORD(v46) = v36;
    LODWORD(v47) = v38;
    LODWORD(v48) = v40;
    v49 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v43 scene:v44 location:v45 date:v46 meaning:v47 memoryFeature:v48 trip:v42];
    [(PXUpNextSettings *)self setVector1:v49];

    v50 = [(PXUpNextSettings *)self vector1];
    [v6 setObject:v50 forKey:*MEMORY[0x1E4F8B150]];

    [(PXUpNextSettings *)self personWeight2];
    int v52 = v51;
    [(PXUpNextSettings *)self sceneWeight2];
    int v54 = v53;
    [(PXUpNextSettings *)self locationWeight2];
    int v56 = v55;
    [(PXUpNextSettings *)self dateWeight2];
    int v58 = v57;
    [(PXUpNextSettings *)self meaningWeight2];
    int v60 = v59;
    [(PXUpNextSettings *)self memoryFeatureWeight2];
    int v62 = v61;
    [(PXUpNextSettings *)self tripWeight2];
    LODWORD(v64) = v63;
    LODWORD(v65) = v52;
    LODWORD(v66) = v54;
    LODWORD(v67) = v56;
    LODWORD(v68) = v58;
    LODWORD(v69) = v60;
    LODWORD(v70) = v62;
    v71 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v65 scene:v66 location:v67 date:v68 meaning:v69 memoryFeature:v70 trip:v64];
    [(PXUpNextSettings *)self setVector2:v71];

    v72 = [(PXUpNextSettings *)self vector2];
    [v6 setObject:v72 forKey:*MEMORY[0x1E4F8B158]];

    [(PXUpNextSettings *)self personWeight3];
    int v74 = v73;
    [(PXUpNextSettings *)self sceneWeight3];
    int v76 = v75;
    [(PXUpNextSettings *)self locationWeight3];
    int v78 = v77;
    [(PXUpNextSettings *)self dateWeight3];
    int v80 = v79;
    [(PXUpNextSettings *)self meaningWeight3];
    int v82 = v81;
    [(PXUpNextSettings *)self memoryFeatureWeight3];
    int v84 = v83;
    [(PXUpNextSettings *)self tripWeight3];
    LODWORD(v86) = v85;
    LODWORD(v87) = v74;
    LODWORD(v88) = v76;
    LODWORD(v89) = v78;
    LODWORD(v90) = v80;
    LODWORD(v91) = v82;
    LODWORD(v92) = v84;
    v93 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v87 scene:v88 location:v89 date:v90 meaning:v91 memoryFeature:v92 trip:v86];
    [(PXUpNextSettings *)self setVector3:v93];

    v94 = [(PXUpNextSettings *)self vector3];
    [v6 setObject:v94 forKey:*MEMORY[0x1E4F8B160]];

    [(PXUpNextSettings *)self personWeight4];
    int v96 = v95;
    [(PXUpNextSettings *)self sceneWeight4];
    int v98 = v97;
    [(PXUpNextSettings *)self locationWeight4];
    int v100 = v99;
    [(PXUpNextSettings *)self dateWeight4];
    int v102 = v101;
    [(PXUpNextSettings *)self meaningWeight4];
    int v104 = v103;
    [(PXUpNextSettings *)self memoryFeatureWeight4];
    int v106 = v105;
    [(PXUpNextSettings *)self tripWeight4];
    LODWORD(v108) = v107;
    LODWORD(v109) = v96;
    LODWORD(v110) = v98;
    LODWORD(v111) = v100;
    LODWORD(v112) = v102;
    LODWORD(v113) = v104;
    LODWORD(v114) = v106;
    v115 = [(PXUpNextSettings *)self _weightArrayWithWeightForPerson:v109 scene:v110 location:v111 date:v112 meaning:v113 memoryFeature:v114 trip:v108];
    [(PXUpNextSettings *)self setVector4:v115];

    v116 = [(PXUpNextSettings *)self vector4];
    [v6 setObject:v116 forKey:*MEMORY[0x1E4F8B168]];

    v117 = [(PXUpNextSettings *)self vector0];
    v124[0] = v117;
    v118 = [(PXUpNextSettings *)self vector1];
    v124[1] = v118;
    v119 = [(PXUpNextSettings *)self vector2];
    v124[2] = v119;
    v120 = [(PXUpNextSettings *)self vector3];
    v124[3] = v120;
    v121 = [(PXUpNextSettings *)self vector4];
    v124[4] = v121;
    v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:5];
    [(PXUpNextSettings *)self setFeatureWeightVectors:v122];
  }
  else
  {
    [v6 removeObjectForKey:*MEMORY[0x1E4F8B148]];
    [v6 removeObjectForKey:*MEMORY[0x1E4F8B150]];
    [v6 removeObjectForKey:*MEMORY[0x1E4F8B158]];
    [v6 removeObjectForKey:*MEMORY[0x1E4F8B160]];
    [v6 removeObjectForKey:*MEMORY[0x1E4F8B168]];
  }
  [v3 setPersistentDomain:v6 forName:v4];
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXUpNextSettings)sharedInstance
{
  if (sharedInstance_onceToken_189878 != -1) {
    dispatch_once(&sharedInstance_onceToken_189878, &__block_literal_global_189879);
  }
  double v2 = (void *)sharedInstance_sharedInstance_189880;
  return (PXUpNextSettings *)v2;
}

void __34__PXUpNextSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 upNextSettings];
  v1 = (void *)sharedInstance_sharedInstance_189880;
  sharedInstance_sharedInstance_189880 = v0;
}

@end