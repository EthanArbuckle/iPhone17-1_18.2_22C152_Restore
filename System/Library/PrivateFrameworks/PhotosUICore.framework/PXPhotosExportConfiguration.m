@interface PXPhotosExportConfiguration
+ (id)configurationWithQueryItems:(id)a3 possibleContentType:(id)a4;
+ (id)containerConfigurationWithShouldIncludeLocation:(BOOL)a3;
- (BOOL)shouldExportForMail;
- (BOOL)shouldIncludeCaption;
- (BOOL)shouldIncludeLocation;
- (NSNumber)downscalingTargetDimension;
- (NSString)activityTypeForAssetExportAnalytics;
- (UTType)possibleContentType;
- (id)debugDescription;
- (id)variantToRequest:(id)a3 asset:(id)a4;
- (int64_t)encodingPolicy;
- (unint64_t)itemType;
- (void)setActivityTypeForAssetExportAnalytics:(id)a3;
@end

@implementation PXPhotosExportConfiguration

+ (id)configurationWithQueryItems:(id)a3 possibleContentType:(id)a4
{
  v40 = (objc_class *)a1;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v41 = a4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v6)
  {
    char v44 = 0;
    uint64_t v42 = 0;
    v43 = 0;
    uint64_t v45 = 0;
    uint64_t v8 = 0;
    goto LABEL_26;
  }
  uint64_t v7 = v6;
  char v44 = 0;
  uint64_t v42 = 0;
  v43 = 0;
  uint64_t v45 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v47;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v47 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
      v12 = objc_msgSend(v11, "name", v40);
      v13 = +[PXPhotosFileProviderRegister urlQueryItemItemTypeKey];
      int v14 = [v12 isEqualToString:v13];

      if (v14)
      {
        v15 = [v11 value];
        uint64_t v8 = [v15 integerValue];
      }
      else
      {
        v16 = [v11 name];
        v17 = +[PXPhotosFileProviderRegister urlQueryItemClientEncodingPolicyKey];
        int v18 = [v16 isEqualToString:v17];

        if (v18)
        {
          v15 = [v11 value];
          uint64_t v45 = [v15 integerValue];
        }
        else
        {
          v19 = [v11 name];
          v20 = +[PXPhotosFileProviderRegister urlQueryItemIncludeLocationKey];
          int v21 = [v19 isEqualToString:v20];

          if (v21)
          {
            v15 = [v11 value];
            char v44 = [v15 BOOLValue];
          }
          else
          {
            v22 = [v11 name];
            v23 = +[PXPhotosFileProviderRegister urlQueryItemIncludeCaptionKey];
            int v24 = [v22 isEqualToString:v23];

            if (v24)
            {
              v15 = [v11 value];
              BYTE4(v42) = [v15 BOOLValue];
            }
            else
            {
              v25 = [v11 name];
              v26 = +[PXPhotosFileProviderRegister urlQueryItemDownscalingTargetDimensionKey];
              int v27 = [v25 isEqualToString:v26];

              if (v27)
              {
                v15 = [v11 value];
                if ([v15 integerValue] < 1)
                {
                  uint64_t v30 = 0;
                  v29 = v43;
                }
                else
                {
                  v28 = NSNumber;
                  v29 = [v11 value];
                  uint64_t v30 = objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "integerValue"));
                }
                v43 = (void *)v30;
              }
              else
              {
                v31 = [v11 name];
                v32 = +[PXPhotosFileProviderRegister urlQueryItemVideoPresetKey];
                int v33 = [v31 isEqualToString:v32];

                if (!v33) {
                  continue;
                }
                v15 = [v11 value];
                LOBYTE(v42) = [v15 integerValue] == 1;
              }
            }
          }
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v46 objects:v50 count:16];
  }
  while (v7);
LABEL_26:
  v34 = objc_alloc_init(v40);
  v34[2] = v8;
  v34[3] = v45;
  *((unsigned char *)v34 + 8) = v44 & 1;
  *((unsigned char *)v34 + 9) = BYTE4(v42) & 1;
  v35 = (void *)v34[4];
  v34[4] = v43;
  id v36 = v43;

  *((unsigned char *)v34 + 10) = v42 & 1;
  v37 = (void *)v34[5];
  v34[5] = v41;
  id v38 = v41;

  return v34;
}

+ (id)containerConfigurationWithShouldIncludeLocation:(BOOL)a3
{
  v4 = objc_alloc_init((Class)a1);
  v4[2] = 4;
  *((unsigned char *)v4 + 8) = a3;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypeForAssetExportAnalytics, 0);
  objc_storeStrong((id *)&self->_possibleContentType, 0);
  objc_storeStrong((id *)&self->_downscalingTargetDimension, 0);
}

- (void)setActivityTypeForAssetExportAnalytics:(id)a3
{
}

- (NSString)activityTypeForAssetExportAnalytics
{
  return self->_activityTypeForAssetExportAnalytics;
}

- (UTType)possibleContentType
{
  return self->_possibleContentType;
}

- (NSNumber)downscalingTargetDimension
{
  return self->_downscalingTargetDimension;
}

- (BOOL)shouldExportForMail
{
  return self->_shouldExportForMail;
}

- (BOOL)shouldIncludeCaption
{
  return self->_shouldIncludeCaption;
}

- (BOOL)shouldIncludeLocation
{
  return self->_shouldIncludeLocation;
}

- (int64_t)encodingPolicy
{
  return self->_encodingPolicy;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (id)debugDescription
{
  v3 = NSString;
  unint64_t v4 = [(PXPhotosExportConfiguration *)self itemType];
  int64_t v5 = [(PXPhotosExportConfiguration *)self encodingPolicy];
  if ([(PXPhotosExportConfiguration *)self shouldIncludeLocation]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  uint64_t v7 = v6;
  if ([(PXPhotosExportConfiguration *)self shouldIncludeCaption]) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  uint64_t v9 = v8;
  v10 = [(PXPhotosExportConfiguration *)self downscalingTargetDimension];
  v11 = [v3 stringWithFormat:@"ItemType: %ld, EncodingPolicy: %ld, IncludeLocation: %@, IncludeCaption: %@, DownscalingTargetDimension: %@", v4, v5, v7, v9, v10];

  return v11;
}

- (id)variantToRequest:(id)a3 asset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  PXPhotosFileProviderVariantsSortedByClientEncodingPolicy([(PXPhotosExportConfiguration *)self encodingPolicy], v7);
  objc_claimAutoreleasedReturnValue();

  v6;
  PXFind();
}

uint64_t __54__PXPhotosExportConfiguration_variantToRequest_asset___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v3)
  {
    unint64_t v4 = [*(id *)(a1 + 40) possibleContentType];
    int64_t v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
    uint64_t v6 = [v4 conformsToType:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

BOOL __54__PXPhotosExportConfiguration_variantToRequest_asset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

@end