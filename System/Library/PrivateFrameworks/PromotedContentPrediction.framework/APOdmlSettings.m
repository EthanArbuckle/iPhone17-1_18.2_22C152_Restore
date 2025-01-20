@interface APOdmlSettings
+ (void)prewarmModelWithPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4;
- (APOdmlSettings)initWithPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4;
- (NSString)experimentID;
- (NSString)odmlNamespace;
- (NSString)treatmentID;
- (id)serverRequestDictionary;
- (int)deploymentID;
- (int)odmlVersion;
- (unint64_t)assetManagerType;
- (unint64_t)placementType;
@end

@implementation APOdmlSettings

- (APOdmlSettings)initWithPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)APOdmlSettings;
  v8 = [(APOdmlSettings *)&v15 init];
  if (v8)
  {
    id v9 = (id)objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, v6, v7);
    objc_msgSend_prewarmModelWithPlacementType_assetManagerType_(APOdmlSettings, v10, a3, a4);
    id v13 = (id)objc_msgSend_sharedInstance(APOdmlAllowList, v11, v12);
    v8->_assetManagerType = a4;
    v8->_placementType = a3;
  }
  return v8;
}

+ (void)prewarmModelWithPlacementType:(unint64_t)a3 assetManagerType:(unint64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1BBC45D84;
  v4[3] = &unk_1E624A9D0;
  v4[4] = a3;
  v4[5] = a4;
  if (qword_1EB9F9890 != -1) {
    dispatch_once(&qword_1EB9F9890, v4);
  }
}

- (int)deploymentID
{
  v4 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  uint64_t v7 = objc_msgSend_placementType(self, v5, v6);
  uint64_t v10 = objc_msgSend_assetManagerType(self, v8, v9);
  uint64_t v12 = objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  LODWORD(v7) = objc_msgSend_deploymentID(v12, v13, v14);

  return v7;
}

- (NSString)experimentID
{
  v4 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  uint64_t v7 = objc_msgSend_placementType(self, v5, v6);
  uint64_t v10 = objc_msgSend_assetManagerType(self, v8, v9);
  uint64_t v12 = objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  objc_super v15 = objc_msgSend_experimentID(v12, v13, v14);

  return (NSString *)v15;
}

- (NSString)treatmentID
{
  v4 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  uint64_t v7 = objc_msgSend_placementType(self, v5, v6);
  uint64_t v10 = objc_msgSend_assetManagerType(self, v8, v9);
  uint64_t v12 = objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  objc_super v15 = objc_msgSend_treatmentID(v12, v13, v14);

  return (NSString *)v15;
}

- (NSString)odmlNamespace
{
  v4 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  uint64_t v7 = objc_msgSend_placementType(self, v5, v6);
  uint64_t v10 = objc_msgSend_assetManagerType(self, v8, v9);
  uint64_t v12 = objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  objc_super v15 = objc_msgSend_odmlNamespace(v12, v13, v14);

  return (NSString *)v15;
}

- (int)odmlVersion
{
  v4 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, v2);
  uint64_t v7 = objc_msgSend_placementType(self, v5, v6);
  uint64_t v10 = objc_msgSend_assetManagerType(self, v8, v9);
  uint64_t v12 = objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  LODWORD(v7) = objc_msgSend_odmlVersion(v12, v13, v14);

  return v7;
}

- (id)serverRequestDictionary
{
  v26[6] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_experimentID(self, a2, v2);
  if (v4) {
    uint64_t v7 = (__CFString *)v4;
  }
  else {
    uint64_t v7 = &stru_1F14FE8B8;
  }
  uint64_t v8 = objc_msgSend_treatmentID(self, v5, v6);
  if (v8) {
    v11 = (__CFString *)v8;
  }
  else {
    v11 = &stru_1F14FE8B8;
  }
  v25[0] = @"supportedODMLVersion";
  uint64_t v12 = NSNumber;
  uint64_t v13 = objc_msgSend_odmlVersion(self, v9, v10);
  objc_super v15 = objc_msgSend_numberWithInt_(v12, v14, v13);
  v26[0] = v15;
  v26[1] = v7;
  v25[1] = @"experimentID";
  v25[2] = @"treatmentID";
  v26[2] = v11;
  v25[3] = @"deploymentID";
  v16 = NSNumber;
  uint64_t v19 = objc_msgSend_deploymentID(self, v17, v18);
  v21 = objc_msgSend_numberWithInt_(v16, v20, v19);
  v26[3] = v21;
  v26[4] = MEMORY[0x1E4F1CC28];
  v25[4] = @"inAllocation";
  v25[5] = @"clientExclusive";
  v26[5] = MEMORY[0x1E4F1CC28];
  v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v22, (uint64_t)v26, v25, 6);

  return v23;
}

- (unint64_t)assetManagerType
{
  return self->_assetManagerType;
}

- (unint64_t)placementType
{
  return self->_placementType;
}

@end