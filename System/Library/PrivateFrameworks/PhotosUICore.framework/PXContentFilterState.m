@interface PXContentFilterState
+ (id)defaultAllPhotosFilterStateForPhotoLibrary:(id)a3;
+ (id)defaultFilterStateForContainerCollection:(id)a3 photoLibrary:(id)a4;
+ (id)defaultFilterStateForPhotoLibrary:(id)a3;
- (BOOL)edited;
- (BOOL)favorite;
- (BOOL)hasRules;
- (BOOL)image;
- (BOOL)includeOthersInSocialGroupAssets;
- (BOOL)includeScreenshots;
- (BOOL)includeSharedWithYou;
- (BOOL)isContentFilterActive:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)live;
- (BOOL)portrait;
- (BOOL)saved;
- (BOOL)shouldExcludeScreenshots;
- (BOOL)showOnlyReceivedICloudLinks;
- (BOOL)showOnlyScreenshots;
- (BOOL)showOnlySentICloudLinks;
- (BOOL)showOnlySharedWithYou;
- (BOOL)unsaved;
- (BOOL)video;
- (NSArray)keywords;
- (NSArray)uuids;
- (NSString)localizedDescription;
- (NSString)localizedFooterDescription;
- (PHPhotoLibrary)photoLibrary;
- (PXContentFilterState)init;
- (PXContentFilterState)initWithPhotoLibrary:(id)a3;
- (PXContentSyndicationConfigurationProvider)contentSyndicationConfigurationProvider;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)predicateForUseCase:(unint64_t)a3;
- (int64_t)ruleCount;
- (unint64_t)hash;
- (void)_checkDataSourceType:(id)a3;
- (void)setEdited:(BOOL)a3;
- (void)setFavorite:(BOOL)a3;
- (void)setImage:(BOOL)a3;
- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3;
- (void)setIncludeScreenshots:(BOOL)a3;
- (void)setIncludeSharedWithYou:(BOOL)a3;
- (void)setKeywords:(id)a3;
- (void)setLive:(BOOL)a3;
- (void)setPortrait:(BOOL)a3;
- (void)setSaved:(BOOL)a3;
- (void)setShowOnlyReceivedICloudLinks:(BOOL)a3;
- (void)setShowOnlyScreenshots:(BOOL)a3;
- (void)setShowOnlySentICloudLinks:(BOOL)a3;
- (void)setShowOnlySharedWithYou:(BOOL)a3;
- (void)setUnsaved:(BOOL)a3;
- (void)setUuids:(id)a3;
- (void)setVideo:(BOOL)a3;
@end

@implementation PXContentFilterState

+ (id)defaultAllPhotosFilterStateForPhotoLibrary:(id)a3
{
  v3 = [a1 defaultFilterStateForPhotoLibrary:a3];
  v4 = +[PXUserDefaults standardUserDefaults];
  v5 = [v4 includeScreenshots];
  objc_msgSend(v3, "setIncludeScreenshots:", objc_msgSend(v5, "BOOLValue"));

  return v3;
}

+ (id)defaultFilterStateForPhotoLibrary:(id)a3
{
  return (id)[a1 defaultFilterStateForContainerCollection:0 photoLibrary:a3];
}

+ (id)defaultFilterStateForContainerCollection:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[PXUserDefaults standardUserDefaults];
  v8 = [[PXContentFilterState alloc] initWithPhotoLibrary:v6];

  if (objc_msgSend(v5, "px_isAllPhotosSmartAlbum"))
  {
    v9 = [v7 includeScreenshots];
    -[PXContentFilterState setIncludeScreenshots:](v8, "setIncludeScreenshots:", [v9 BOOLValue]);
  }
  else
  {
    [(PXContentFilterState *)v8 setIncludeScreenshots:1];
  }
  if (objc_msgSend(v5, "px_isContentSyndicationAlbum"))
  {
    [(PXContentFilterState *)v8 setIncludeSharedWithYou:1];
  }
  else
  {
    v10 = [v7 includeSharedWithYou];
    -[PXContentFilterState setIncludeSharedWithYou:](v8, "setIncludeSharedWithYou:", [v10 BOOLValue]);
  }
  return v8;
}

- (BOOL)isContentFilterActive:(int64_t)a3
{
  LOBYTE(v3) = 0;
  switch(a3)
  {
    case 1:
      LOBYTE(v3) = [(PXContentFilterState *)self hash] == 0;
      return v3;
    case 2:
      return ![(PXContentFilterState *)self shouldExcludeScreenshots];
    case 3:
      return [(PXContentFilterState *)self includeSharedWithYou];
    case 4:
      return [(PXContentFilterState *)self saved];
    case 5:
      return [(PXContentFilterState *)self unsaved];
    case 7:
      return [(PXContentFilterState *)self image];
    case 8:
      return [(PXContentFilterState *)self video];
    case 9:
      return [(PXContentFilterState *)self edited];
    case 10:
      return [(PXContentFilterState *)self favorite];
    case 11:
      return [(PXContentFilterState *)self live];
    case 12:
      return [(PXContentFilterState *)self portrait];
    case 13:
      return [(PXContentFilterState *)self showOnlyScreenshots];
    case 14:
      return [(PXContentFilterState *)self showOnlySharedWithYou];
    case 18:
      return [(PXContentFilterState *)self showOnlySentICloudLinks];
    case 19:
      return [(PXContentFilterState *)self showOnlyReceivedICloudLinks];
    case 20:
      return [(PXContentFilterState *)self includeOthersInSocialGroupAssets];
    default:
      return v3;
  }
}

- (BOOL)shouldExcludeScreenshots
{
  if ([(PXContentFilterState *)self showOnlyScreenshots]) {
    return 0;
  }
  else {
    return ![(PXContentFilterState *)self includeScreenshots];
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXContentFilterState *)a3;
  if (v4 == self)
  {
    LOBYTE(v18) = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v18) = 0;
    goto LABEL_19;
  }
  id v5 = v4;
  BOOL v6 = [(PXContentFilterState *)self includeScreenshots];
  if (v6 == [(PXContentFilterState *)v5 includeScreenshots])
  {
    BOOL v7 = [(PXContentFilterState *)self includeSharedWithYou];
    if (v7 == [(PXContentFilterState *)v5 includeSharedWithYou])
    {
      BOOL v8 = [(PXContentFilterState *)self saved];
      if (v8 == [(PXContentFilterState *)v5 saved])
      {
        BOOL v9 = [(PXContentFilterState *)self unsaved];
        if (v9 == [(PXContentFilterState *)v5 unsaved])
        {
          BOOL v10 = [(PXContentFilterState *)self favorite];
          if (v10 == [(PXContentFilterState *)v5 favorite])
          {
            BOOL v11 = [(PXContentFilterState *)self edited];
            if (v11 == [(PXContentFilterState *)v5 edited])
            {
              BOOL v12 = [(PXContentFilterState *)self image];
              if (v12 == [(PXContentFilterState *)v5 image])
              {
                BOOL v13 = [(PXContentFilterState *)self video];
                if (v13 == [(PXContentFilterState *)v5 video])
                {
                  BOOL v14 = [(PXContentFilterState *)self live];
                  if (v14 == [(PXContentFilterState *)v5 live])
                  {
                    BOOL v15 = [(PXContentFilterState *)self portrait];
                    if (v15 == [(PXContentFilterState *)v5 portrait])
                    {
                      BOOL v16 = [(PXContentFilterState *)self showOnlyScreenshots];
                      if (v16 == [(PXContentFilterState *)v5 showOnlyScreenshots])
                      {
                        BOOL v17 = [(PXContentFilterState *)self showOnlySharedWithYou];
                        if (v17 == [(PXContentFilterState *)v5 showOnlySharedWithYou])
                        {
                          id v20 = [(PXContentFilterState *)self keywords];
                          id v21 = [(PXContentFilterState *)v5 keywords];
                          v29 = v20;
                          if (v20 == v21)
                          {
                          }
                          else
                          {
                            int v22 = [v20 isEqual:v21];

                            if (!v22)
                            {
                              LOBYTE(v18) = 0;
LABEL_32:

                              goto LABEL_16;
                            }
                          }
                          id v23 = [(PXContentFilterState *)self uuids];
                          id v24 = [(PXContentFilterState *)v5 uuids];
                          if (v23 == v24)
                          {
                          }
                          else
                          {
                            int v25 = [v23 isEqual:v24];

                            if (!v25) {
                              goto LABEL_30;
                            }
                          }
                          BOOL v26 = [(PXContentFilterState *)self showOnlySentICloudLinks];
                          if (v26 == [(PXContentFilterState *)v5 showOnlySentICloudLinks])
                          {
                            BOOL v27 = [(PXContentFilterState *)self showOnlyReceivedICloudLinks];
                            if (v27 == [(PXContentFilterState *)v5 showOnlyReceivedICloudLinks])
                            {
                              BOOL v28 = [(PXContentFilterState *)self includeOthersInSocialGroupAssets];
                              BOOL v18 = v28 ^ [(PXContentFilterState *)v5 includeOthersInSocialGroupAssets] ^ 1;
                              goto LABEL_31;
                            }
                          }
LABEL_30:
                          LOBYTE(v18) = 0;
LABEL_31:

                          goto LABEL_32;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  LOBYTE(v18) = 0;
LABEL_16:

LABEL_19:
  return v18;
}

- (int64_t)ruleCount
{
  LODWORD(v3) = [(PXContentFilterState *)self saved];
  BOOL v4 = [(PXContentFilterState *)self unsaved];
  uint64_t v5 = 1;
  if (v3) {
    uint64_t v5 = 2;
  }
  if (v4) {
    uint64_t v3 = v5;
  }
  else {
    uint64_t v3 = v3;
  }
  uint64_t v6 = v3 + [(PXContentFilterState *)self favorite];
  uint64_t v7 = v6 + [(PXContentFilterState *)self edited];
  uint64_t v8 = v7 + [(PXContentFilterState *)self image];
  uint64_t v9 = v8 + [(PXContentFilterState *)self video];
  uint64_t v10 = v9 + [(PXContentFilterState *)self live];
  uint64_t v11 = v10 + [(PXContentFilterState *)self portrait];
  uint64_t v12 = v11 + [(PXContentFilterState *)self showOnlyScreenshots];
  uint64_t v13 = v12 + [(PXContentFilterState *)self showOnlySharedWithYou];
  BOOL v14 = [(PXContentFilterState *)self keywords];
  uint64_t v15 = [v14 count];

  BOOL v16 = [(PXContentFilterState *)self uuids];
  uint64_t v17 = v13 + v15 + [v16 count];

  uint64_t v18 = v17 + [(PXContentFilterState *)self showOnlySentICloudLinks];
  uint64_t v19 = v18 + [(PXContentFilterState *)self showOnlyReceivedICloudLinks];
  return v19 + [(PXContentFilterState *)self includeOthersInSocialGroupAssets];
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(PXContentFilterState *)self photoLibrary];
  uint64_t v6 = (void *)[v4 initWithPhotoLibrary:v5];

  objc_msgSend(v6, "setIncludeScreenshots:", -[PXContentFilterState includeScreenshots](self, "includeScreenshots"));
  objc_msgSend(v6, "setIncludeSharedWithYou:", -[PXContentFilterState includeSharedWithYou](self, "includeSharedWithYou"));
  objc_msgSend(v6, "setSaved:", -[PXContentFilterState saved](self, "saved"));
  objc_msgSend(v6, "setUnsaved:", -[PXContentFilterState unsaved](self, "unsaved"));
  objc_msgSend(v6, "setFavorite:", -[PXContentFilterState favorite](self, "favorite"));
  objc_msgSend(v6, "setEdited:", -[PXContentFilterState edited](self, "edited"));
  objc_msgSend(v6, "setImage:", -[PXContentFilterState image](self, "image"));
  objc_msgSend(v6, "setVideo:", -[PXContentFilterState video](self, "video"));
  objc_msgSend(v6, "setLive:", -[PXContentFilterState live](self, "live"));
  objc_msgSend(v6, "setPortrait:", -[PXContentFilterState portrait](self, "portrait"));
  objc_msgSend(v6, "setShowOnlyScreenshots:", -[PXContentFilterState showOnlyScreenshots](self, "showOnlyScreenshots"));
  objc_msgSend(v6, "setShowOnlySharedWithYou:", -[PXContentFilterState showOnlySharedWithYou](self, "showOnlySharedWithYou"));
  uint64_t v7 = [(PXContentFilterState *)self keywords];
  [v6 setKeywords:v7];

  uint64_t v8 = [(PXContentFilterState *)self uuids];
  [v6 setUuids:v8];

  objc_msgSend(v6, "setShowOnlySentICloudLinks:", -[PXContentFilterState showOnlySentICloudLinks](self, "showOnlySentICloudLinks"));
  objc_msgSend(v6, "setShowOnlyReceivedICloudLinks:", -[PXContentFilterState showOnlyReceivedICloudLinks](self, "showOnlyReceivedICloudLinks"));
  objc_msgSend(v6, "setIncludeOthersInSocialGroupAssets:", -[PXContentFilterState includeOthersInSocialGroupAssets](self, "includeOthersInSocialGroupAssets"));
  return v6;
}

- (BOOL)showOnlyScreenshots
{
  return self->_showOnlyScreenshots;
}

- (BOOL)video
{
  return self->_video;
}

- (BOOL)image
{
  return self->_image;
}

- (BOOL)favorite
{
  return self->_favorite;
}

- (BOOL)edited
{
  return self->_edited;
}

- (NSArray)uuids
{
  return self->_uuids;
}

- (BOOL)portrait
{
  return self->_portrait;
}

- (BOOL)live
{
  return self->_live;
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (BOOL)unsaved
{
  return self->_unsaved;
}

- (BOOL)showOnlySharedWithYou
{
  return self->_showOnlySharedWithYou;
}

- (BOOL)showOnlySentICloudLinks
{
  return self->_showOnlySentICloudLinks;
}

- (BOOL)showOnlyReceivedICloudLinks
{
  return self->_showOnlyReceivedICloudLinks;
}

- (BOOL)saved
{
  return self->_saved;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (BOOL)includeScreenshots
{
  return self->_includeScreenshots;
}

- (BOOL)includeSharedWithYou
{
  return self->_includeSharedWithYou;
}

- (void)setIncludeScreenshots:(BOOL)a3
{
  self->_includeScreenshots = a3;
}

- (void)setIncludeSharedWithYou:(BOOL)a3
{
  self->_includeSharedWithYou = a3;
}

- (PXContentFilterState)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXContentFilterState;
  uint64_t v6 = [(PXContentFilterState *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    if (v5)
    {
      uint64_t v8 = +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:v7->_photoLibrary];
      contentSyndicationConfigurationProvider = v7->_contentSyndicationConfigurationProvider;
      v7->_contentSyndicationConfigurationProvider = (PXContentSyndicationConfigurationProvider *)v8;
    }
  }

  return v7;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (void)setUuids:(id)a3
{
}

- (void)setUnsaved:(BOOL)a3
{
  self->_unsaved = a3;
}

- (void)setShowOnlySharedWithYou:(BOOL)a3
{
  self->_showOnlySharedWithYou = a3;
}

- (void)setShowOnlySentICloudLinks:(BOOL)a3
{
  self->_showOnlySentICloudLinks = a3;
}

- (void)setShowOnlyScreenshots:(BOOL)a3
{
  self->_showOnlyScreenshots = a3;
}

- (void)setShowOnlyReceivedICloudLinks:(BOOL)a3
{
  self->_showOnlyReceivedICloudLinks = a3;
}

- (void)setSaved:(BOOL)a3
{
  self->_saved = a3;
}

- (void)setPortrait:(BOOL)a3
{
  self->_portrait = a3;
}

- (void)setLive:(BOOL)a3
{
  self->_live = a3;
}

- (void)setKeywords:(id)a3
{
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  self->_includeOthersInSocialGroupAssets = a3;
}

- (void)setImage:(BOOL)a3
{
  self->_image = a3;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (void)setEdited:(BOOL)a3
{
  self->_edited = a3;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PXContentFilterState *)self saved];
  BOOL v4 = [(PXContentFilterState *)self unsaved];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | v3;
  if ([(PXContentFilterState *)self favorite]) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 0;
  }
  BOOL v8 = [(PXContentFilterState *)self edited];
  uint64_t v9 = 8;
  if (!v8) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v6 | v7 | v9;
  if ([(PXContentFilterState *)self image]) {
    uint64_t v11 = 16;
  }
  else {
    uint64_t v11 = 0;
  }
  BOOL v12 = [(PXContentFilterState *)self video];
  uint64_t v13 = 32;
  if (!v12) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v11 | v13;
  BOOL v15 = [(PXContentFilterState *)self live];
  uint64_t v16 = 64;
  if (!v15) {
    uint64_t v16 = 0;
  }
  uint64_t v17 = v10 | v14 | v16;
  if ([(PXContentFilterState *)self portrait]) {
    uint64_t v18 = 128;
  }
  else {
    uint64_t v18 = 0;
  }
  BOOL v19 = [(PXContentFilterState *)self showOnlyScreenshots];
  uint64_t v20 = 256;
  if (!v19) {
    uint64_t v20 = 0;
  }
  uint64_t v21 = v18 ^ v20;
  BOOL v22 = [(PXContentFilterState *)self showOnlySharedWithYou];
  uint64_t v23 = 512;
  if (!v22) {
    uint64_t v23 = 0;
  }
  uint64_t v24 = v17 ^ v21 ^ v23;
  int v25 = [(PXContentFilterState *)self keywords];
  uint64_t v26 = v24 ^ ([v25 hash] << 10);

  BOOL v27 = [(PXContentFilterState *)self uuids];
  uint64_t v28 = v26 ^ ([v27 hash] << 11);

  if ([(PXContentFilterState *)self showOnlySentICloudLinks]) {
    uint64_t v29 = 4096;
  }
  else {
    uint64_t v29 = 0;
  }
  BOOL v30 = [(PXContentFilterState *)self showOnlyReceivedICloudLinks];
  uint64_t v31 = 0x2000;
  if (!v30) {
    uint64_t v31 = 0;
  }
  uint64_t v32 = v29 ^ v31;
  BOOL v33 = [(PXContentFilterState *)self includeOthersInSocialGroupAssets];
  uint64_t v34 = 0x4000;
  if (!v33) {
    uint64_t v34 = 0;
  }
  return v28 ^ v32 ^ v34;
}

- (BOOL)hasRules
{
  return [(PXContentFilterState *)self ruleCount] > 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuids, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_contentSyndicationConfigurationProvider, 0);
}

- (id)predicateForUseCase:(unint64_t)a3
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PXContentFilterState *)self shouldExcludeScreenshots])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == NO", @"isDetectedScreenshot");
    [v5 addObject:v6];
  }
  contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
  if (!contentSyndicationConfigurationProvider
    || ![(PXContentSyndicationConfigurationProvider *)contentSyndicationConfigurationProvider contentSyndicationIsAvailable])
  {
    goto LABEL_18;
  }
  if ([(PXContentFilterState *)self includeSharedWithYou])
  {
    if (![(PXContentFilterState *)self showOnlySharedWithYou]) {
      goto LABEL_10;
    }
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __44__PXContentFilterState_predicateForUseCase___block_invoke;
    v52[3] = &unk_1E5DB2E48;
    v52[4] = self;
    id v53 = v5;
    [(PXContentFilterState *)self _checkDataSourceType:v52];
    BOOL v8 = v53;
  }
  else
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __44__PXContentFilterState_predicateForUseCase___block_invoke_2;
    v50[3] = &unk_1E5DB2E70;
    id v51 = v5;
    [(PXContentFilterState *)self _checkDataSourceType:v50];
    BOOL v8 = v51;
  }

LABEL_10:
  if ([(PXContentFilterState *)self saved] && [(PXContentFilterState *)self unsaved])
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(syndicationState & %d) != 0 OR (syndicationState & %d) == 0", 2, 2);
  }
  else if ([(PXContentFilterState *)self saved])
  {
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(syndicationState & %d) != 0", 2, v45);
  }
  else
  {
    if (![(PXContentFilterState *)self unsaved]) {
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(syndicationState & %d) == 0", 2, v45);
  uint64_t v9 = };
  [v5 addObject:v9];

LABEL_18:
  if ([(PXContentFilterState *)self favorite])
  {
    if (a3 == 1)
    {
      uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(favorite) == YES"];
      [v5 addObject:v10];

      if (![(PXContentFilterState *)self edited]) {
        goto LABEL_28;
      }
      goto LABEL_25;
    }
    uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"favorite == YES"];
    [v5 addObject:v11];
  }
  if ([(PXContentFilterState *)self edited])
  {
    if (a3 != 1)
    {
      uint64_t v12 = [MEMORY[0x1E4F8A950] predicateForAdjustedAssetsWithKeyPathToAsset:0];
      goto LABEL_27;
    }
LABEL_25:
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) > %d", @"adjustmentsState", 0);
LABEL_27:
    uint64_t v13 = (void *)v12;
    [v5 addObject:v12];
  }
LABEL_28:
  if (![(PXContentFilterState *)self image]
    && ![(PXContentFilterState *)self video]
    && ![(PXContentFilterState *)self live]
    && ![(PXContentFilterState *)self portrait])
  {
    int v25 = 0;
    BOOL v27 = 0;
    if (![(PXContentFilterState *)self showOnlyScreenshots]) {
      goto LABEL_63;
    }
    goto LABEL_55;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PXContentFilterState *)self image])
  {
    if (a3 == 1)
    {
      BOOL v15 = @"noindex:(kind) == %d";
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(kind) == %d", 0);
      [v14 addObject:v16];

      if (![(PXContentFilterState *)self video])
      {
        if ([(PXContentFilterState *)self live])
        {
          uint64_t v17 = (void *)MEMORY[0x1E4F28F60];
LABEL_45:
          uint64_t v20 = objc_msgSend(v17, "predicateWithFormat:", @"noindex:(kindSubtype) == %d", 2);
          [v14 addObject:v20];

          if (![(PXContentFilterState *)self portrait]) {
            goto LABEL_53;
          }
          uint64_t v21 = @"noindex:(%K & %d) != 0";
          goto LABEL_52;
        }
        goto LABEL_48;
      }
      goto LABEL_42;
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 0);
    [v14 addObject:v18];
  }
  if (![(PXContentFilterState *)self video]) {
    goto LABEL_43;
  }
  if (a3 == 1) {
    BOOL v15 = @"noindex:(kind) == %d";
  }
  else {
    BOOL v15 = @"kind == %d";
  }
LABEL_42:
  BOOL v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v15, 1);
  [v14 addObject:v19];

LABEL_43:
  if ([(PXContentFilterState *)self live])
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28F60];
    if (a3 == 1) {
      goto LABEL_45;
    }
    BOOL v22 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kindSubtype == %d", 2);
    [v14 addObject:v22];
  }
LABEL_48:
  if (![(PXContentFilterState *)self portrait]) {
    goto LABEL_53;
  }
  if (a3 == 1) {
    uint64_t v21 = @"noindex:(%K & %d) != 0";
  }
  else {
    uint64_t v21 = @"(%K & %d) != 0";
  }
LABEL_52:
  uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v21, @"additionalAttributes.unmanagedAdjustment.adjustmentRenderTypes", 2);
  [v14 addObject:v23];

LABEL_53:
  uint64_t v24 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v14];

  if ([(PXContentFilterState *)self showOnlyScreenshots])
  {
    int v25 = (void *)v24;
LABEL_55:
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == YES", @"isDetectedScreenshot");
    BOOL v27 = (void *)v26;
    if (v25 && v26)
    {
      uint64_t v28 = (void *)MEMORY[0x1E4F28BA0];
      v55[0] = v25;
      v55[1] = v26;
      uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
      BOOL v30 = [v28 andPredicateWithSubpredicates:v29];

      [v5 addObject:v30];
      goto LABEL_63;
    }
    if (v25)
    {
      uint64_t v24 = (uint64_t)v25;
      goto LABEL_62;
    }
    if (v26) {
      [v5 addObject:v26];
    }
    int v25 = 0;
    goto LABEL_63;
  }
  BOOL v27 = 0;
  int v25 = 0;
  if (v24)
  {
LABEL_62:
    [v5 addObject:v24];
    int v25 = (void *)v24;
  }
LABEL_63:
  uint64_t v31 = [(PXContentFilterState *)self uuids];

  if (v31)
  {
    uint64_t v32 = (void *)MEMORY[0x1E4F28F60];
    BOOL v33 = [(PXContentFilterState *)self uuids];
    uint64_t v34 = [v32 predicateWithFormat:@"uuid in %@", v33];
    [v5 addObject:v34];
  }
  v35 = [(PXContentFilterState *)self keywords];

  if (v35)
  {
    v36 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"packedBadgeAttributes&0x01 == 1"];
    [v5 addObject:v36];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v37 = [(PXContentFilterState *)self keywords];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v47 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN additionalAttributes.keywords.title", *(void *)(*((void *)&v46 + 1) + 8 * i)];
          [v5 addObject:v42];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v39);
    }
  }
  if ([v5 count])
  {
    v43 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v5];
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

- (PXContentSyndicationConfigurationProvider)contentSyndicationConfigurationProvider
{
  return self->_contentSyndicationConfigurationProvider;
}

- (NSString)localizedFooterDescription
{
  uint64_t v3 = [(PXContentFilterState *)self ruleCount];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
  if (v3 >= 1)
  {
    contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
    if (contentSyndicationConfigurationProvider
      && [(PXContentSyndicationConfigurationProvider *)contentSyndicationConfigurationProvider contentSyndicationIsAvailable])
    {
      if ([(PXContentFilterState *)self saved])
      {
        uint64_t v6 = PXLocalizedStringFromTable(@"PXContentFilterMenu_SavedItemsOnly", @"PhotosUICore");
        [v4 addObject:v6];
      }
      if ([(PXContentFilterState *)self unsaved])
      {
        uint64_t v7 = PXLocalizedStringFromTable(@"PXContentFilterMenu_UnsavedItemsOnly", @"PhotosUICore");
        [v4 addObject:v7];
      }
    }
    if ([(PXContentFilterState *)self favorite])
    {
      BOOL v8 = PXLocalizedStringFromTable(@"PXContentFilterMenu_Favorite", @"PhotosUICore");
      [v4 addObject:v8];
    }
    if ([(PXContentFilterState *)self edited])
    {
      uint64_t v9 = PXLocalizedStringFromTable(@"PXContentFilterMenu_Edited", @"PhotosUICore");
      [v4 addObject:v9];
    }
    if ([(PXContentFilterState *)self image])
    {
      uint64_t v10 = PXLocalizedStringFromTable(@"PXContentFilterMenu_Photos", @"PhotosUICore");
      [v4 addObject:v10];
    }
    if ([(PXContentFilterState *)self video])
    {
      uint64_t v11 = PXLocalizedStringFromTable(@"PXContentFilterMenu_Videos", @"PhotosUICore");
      [v4 addObject:v11];
    }
    if ([(PXContentFilterState *)self live])
    {
      uint64_t v12 = PXLocalizedStringFromTable(@"PXContentFilterMenu_Live", @"PhotosUICore");
      [v4 addObject:v12];
    }
    if ([(PXContentFilterState *)self portrait])
    {
      uint64_t v13 = PXLocalizedStringFromTable(@"PXContentFilterMenu_Portrait", @"PhotosUICore");
      [v4 addObject:v13];
    }
    if ([(PXContentFilterState *)self showOnlyScreenshots])
    {
      id v14 = PXLocalizedStringFromTable(@"PXContentFilterMenu_Screenshots", @"PhotosUICore");
      [v4 addObject:v14];
    }
    if ([(PXContentFilterState *)self showOnlySharedWithYou])
    {
      BOOL v15 = PXLocalizedStringFromTable(@"PXContentFilterMenu_SharedWithYou", @"PhotosUICore");
      [v4 addObject:v15];
    }
    uint64_t v16 = [(PXContentFilterState *)self keywords];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      uint64_t v18 = [(PXContentFilterState *)self keywords];
      BOOL v19 = [v18 firstObject];
      [v4 addObject:v19];
    }
    uint64_t v20 = [(PXContentFilterState *)self uuids];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      BOOL v22 = PXLocalizedStringFromTable(@"PXContentFilterMenu_Selected", @"PhotosUICore");
      [v4 addObject:v22];
    }
    if ([(PXContentFilterState *)self showOnlySentICloudLinks])
    {
      uint64_t v23 = PXContentFilterTitleForItemTag(18);
      [v4 addObject:v23];
    }
    if ([(PXContentFilterState *)self showOnlyReceivedICloudLinks])
    {
      uint64_t v24 = PXContentFilterTitleForItemTag(19);
      [v4 addObject:v24];
    }
    if ([(PXContentFilterState *)self includeOthersInSocialGroupAssets])
    {
      int v25 = PXContentFilterTitleForItemTag(20);
      [v4 addObject:v25];
    }
  }
  uint64_t v26 = PXLocalizedStringFromTable(@"PXFilterListSeparator", @"PhotosUICore");
  BOOL v27 = [v4 componentsJoinedByString:v26];

  return (NSString *)v27;
}

- (NSString)localizedDescription
{
  int64_t v3 = [(PXContentFilterState *)self ruleCount];
  if (v3 != 1)
  {
    if (v3) {
      BOOL v4 = @"PXContentFilterTitleFilteringMany";
    }
    else {
      BOOL v4 = @"PXContentFilterTitleFilteringOff";
    }
    goto LABEL_27;
  }
  contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
  if (contentSyndicationConfigurationProvider
    && [(PXContentSyndicationConfigurationProvider *)contentSyndicationConfigurationProvider contentSyndicationIsAvailable])
  {
    if ([(PXContentFilterState *)self saved])
    {
      BOOL v4 = @"PXContentFilterMenu_SavedItemsOnly";
LABEL_27:
      uint64_t v6 = PXLocalizedStringFromTable(v4, @"PhotosUICore");
LABEL_28:
      uint64_t v7 = (__CFString *)v6;
      goto LABEL_29;
    }
    if ([(PXContentFilterState *)self unsaved])
    {
      BOOL v4 = @"PXContentFilterMenu_UnsavedItemsOnly";
      goto LABEL_27;
    }
  }
  if ([(PXContentFilterState *)self favorite])
  {
    BOOL v4 = @"PXContentFilterMenu_Favorite";
    goto LABEL_27;
  }
  if ([(PXContentFilterState *)self edited])
  {
    BOOL v4 = @"PXContentFilterMenu_Edited";
    goto LABEL_27;
  }
  if ([(PXContentFilterState *)self image])
  {
    BOOL v4 = @"PXContentFilterMenu_Photos";
    goto LABEL_27;
  }
  if ([(PXContentFilterState *)self video])
  {
    BOOL v4 = @"PXContentFilterMenu_Videos";
    goto LABEL_27;
  }
  if ([(PXContentFilterState *)self live])
  {
    BOOL v4 = @"PXContentFilterMenu_Live";
    goto LABEL_27;
  }
  if ([(PXContentFilterState *)self portrait])
  {
    BOOL v4 = @"PXContentFilterMenu_Portrait";
    goto LABEL_27;
  }
  if ([(PXContentFilterState *)self showOnlyScreenshots])
  {
    BOOL v4 = @"PXContentFilterMenu_Screenshots";
    goto LABEL_27;
  }
  if ([(PXContentFilterState *)self showOnlySharedWithYou])
  {
    BOOL v4 = @"PXContentFilterMenu_SharedWithYou";
    goto LABEL_27;
  }
  uint64_t v9 = [(PXContentFilterState *)self keywords];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [(PXContentFilterState *)self keywords];
    uint64_t v7 = [v11 firstObject];

    goto LABEL_29;
  }
  uint64_t v12 = [(PXContentFilterState *)self uuids];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    BOOL v4 = @"PXContentFilterMenu_Selected";
    goto LABEL_27;
  }
  if ([(PXContentFilterState *)self showOnlySentICloudLinks])
  {
    uint64_t v14 = 18;
LABEL_42:
    uint64_t v6 = PXContentFilterTitleForItemTag(v14);
    goto LABEL_28;
  }
  if ([(PXContentFilterState *)self showOnlyReceivedICloudLinks])
  {
    uint64_t v14 = 19;
    goto LABEL_42;
  }
  if ([(PXContentFilterState *)self includeOthersInSocialGroupAssets])
  {
    uint64_t v14 = 20;
    goto LABEL_42;
  }
  uint64_t v7 = &stru_1F00B0030;
LABEL_29:
  return (NSString *)v7;
}

void __44__PXContentFilterState_predicateForUseCase___block_invoke(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(*(void *)(a1 + 32) + 8) dataSourceType] & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F8BA10];
    uint64_t v5 = a2;
  }
  else
  {
    uint64_t v6 = +[PXLemonadeSettings sharedInstance];
    int v7 = [v6 sharedWithYouOnlyFilterIncludesUnsaved];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"additionalAttributes.syndicationIdentifier != nil"];
      goto LABEL_7;
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F8BA10];
    uint64_t v5 = [MEMORY[0x1E4F8BA10] maskForGuestAsset];
    BOOL v4 = v9;
  }
  uint64_t v8 = [v4 predicateForIncludeMask:v5 useIndex:0];
LABEL_7:
  id v10 = (id)v8;
  [*(id *)(a1 + 40) addObject:v8];
}

void __44__PXContentFilterState_predicateForUseCase___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F8BA10] predicateForExcludeMask:a2 useIndex:0];
  [*(id *)(a1 + 32) addObject:v3];
}

- (void)_checkDataSourceType:(id)a3
{
  BOOL v4 = (void (**)(id, void))a3;
  contentSyndicationConfigurationProvider = self->_contentSyndicationConfigurationProvider;
  if (contentSyndicationConfigurationProvider)
  {
    uint64_t v9 = v4;
    uint64_t v6 = [(PXContentSyndicationConfigurationProvider *)contentSyndicationConfigurationProvider dataSourceType];
    BOOL v4 = v9;
    if ((unint64_t)(v6 - 5) <= 0xFFFFFFFFFFFFFFFCLL)
    {
      uint64_t v7 = 0;
      switch(v6)
      {
        case 0:
        case 1:
        case 5:
          uint64_t v8 = objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset", v9);
          goto LABEL_7;
        case 6:
          uint64_t v8 = objc_msgSend(MEMORY[0x1E4F8BA10], "maskForMomentSharedAsset", v9);
          goto LABEL_7;
        case 7:
          uint64_t v8 = objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCloudSharedAsset", v9);
LABEL_7:
          BOOL v4 = v9;
          uint64_t v7 = v8;
          break;
        default:
          break;
      }
      if (v4)
      {
        v4[2](v4, v7);
        BOOL v4 = v9;
      }
    }
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PXContentSyndicationConfigurationProvider *)self->_contentSyndicationConfigurationProvider contentSyndicationIsAvailable])
  {
    if ([(PXContentFilterState *)self includeSharedWithYou]) {
      [v3 addObject:@"include items shared with you"];
    }
    if ([(PXContentFilterState *)self saved]) {
      [v3 addObject:@"saved items"];
    }
    if ([(PXContentFilterState *)self unsaved]) {
      [v3 addObject:@"unsaved items"];
    }
    if ([(PXContentFilterState *)self showOnlySharedWithYou]) {
      [v3 addObject:@"sharedWithYou"];
    }
  }
  if ([(PXContentFilterState *)self includeScreenshots]) {
    [v3 addObject:@"include screenshots"];
  }
  if ([(PXContentFilterState *)self favorite]) {
    [v3 addObject:@"favorited"];
  }
  if ([(PXContentFilterState *)self edited]) {
    [v3 addObject:@"edited"];
  }
  if ([(PXContentFilterState *)self image]) {
    [v3 addObject:@"image"];
  }
  if ([(PXContentFilterState *)self video]) {
    [v3 addObject:@"video"];
  }
  if ([(PXContentFilterState *)self live]) {
    [v3 addObject:@"live"];
  }
  if ([(PXContentFilterState *)self portrait]) {
    [v3 addObject:@"portrait"];
  }
  if ([(PXContentFilterState *)self showOnlyScreenshots]) {
    [v3 addObject:@"screenshot"];
  }
  BOOL v4 = [(PXContentFilterState *)self keywords];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = [(PXContentFilterState *)self keywords];
    uint64_t v8 = [v6 stringWithFormat:@"keywords: %@", v7];
    [v3 addObject:v8];
  }
  uint64_t v9 = [(PXContentFilterState *)self uuids];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = [(PXContentFilterState *)self uuids];
    uint64_t v13 = [v11 stringWithFormat:@"uuids: %@", v12];
    [v3 addObject:v13];
  }
  if ([(PXContentFilterState *)self showOnlySentICloudLinks]) {
    [v3 addObject:@"showOnlySentICloudLinks"];
  }
  if ([(PXContentFilterState *)self showOnlyReceivedICloudLinks]) {
    [v3 addObject:@"showOnlyReceivedICloudLinks"];
  }
  if ([(PXContentFilterState *)self includeOthersInSocialGroupAssets]) {
    [v3 addObject:@"includeOthersInSocialGroupAssets"];
  }
  uint64_t v14 = NSString;
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = [v3 componentsJoinedByString:@", "];
  uint64_t v17 = [v14 stringWithFormat:@"<%@: filter criteria: [%@]>", v15, v16];

  return v17;
}

- (PXContentFilterState)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXContentFilterState.m", 39, @"%s is not available as initializer", "-[PXContentFilterState init]");

  abort();
}

@end