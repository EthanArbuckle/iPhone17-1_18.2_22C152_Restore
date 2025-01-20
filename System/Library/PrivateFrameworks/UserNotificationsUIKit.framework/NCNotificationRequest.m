@interface NCNotificationRequest
@end

@implementation NCNotificationRequest

void __141__NCNotificationRequest_Bulletin___notificationRequestForBulletin_observer_sectionInfo_feed_playLightsAndSirens_hasPlayLightsAndSirens_uuid___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, int a5)
{
  id v27 = a2;
  v9 = _iconRecipeForBulletinAndSectionInfo(*(void **)(a1 + 32), *(void **)(a1 + 40), a3);
  if (a5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v9);
  }
  v10 = [v9 imagesForIconFormat:a3];
  if (v10) {
    [v27 addObjectsFromArray:v10];
  }
  if ([*(id *)(a1 + 32) hasSubordinateIcon])
  {
    id v11 = *(id *)(a1 + 40);
    v12 = [v11 sectionID];
    v13 = [v11 icon];
    int v14 = _sectionIdentifierIconDenyListContains(v12, v13, a4);

    if (v14)
    {
      v15 = 0;
    }
    else
    {
      v16 = [v11 icon];

      if (v16)
      {
        [v11 icon];
        v17 = uint64_t v26 = a4;
        v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
        [v18 scale];
        v19 = +[NCNotificationIconRecipe iconRecipeForSectionIcon:scale:](NCNotificationIconRecipe, "iconRecipeForSectionIcon:scale:", v17);

        a4 = v26;
      }
      else
      {
        v19 = 0;
      }
      v15 = [v11 sectionID];
      if (v19)
      {
LABEL_22:

        if (a5) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v19);
        }
        v25 = [v19 imagesForIconFormat:a4];
        if (v25) {
          [v27 addObjectsFromArray:v25];
        }

        goto LABEL_27;
      }
    }
    if (NCApplicationIdentifierIsValid(v15))
    {
      v19 = +[NCNotificationIconRecipe iconRecipeForApplicationIdentifier:v15];
    }
    else
    {
      v19 = 0;
    }
    if (v19) {
      int v20 = 0;
    }
    else {
      int v20 = v14;
    }
    if (v20 == 1)
    {
      v21 = [v11 icon];

      if (v21)
      {
        v22 = [v11 icon];
        [MEMORY[0x1E4FB1BA8] mainScreen];
        v24 = uint64_t v23 = a4;
        [v24 scale];
        v19 = +[NCNotificationIconRecipe iconRecipeForSectionIcon:scale:](NCNotificationIconRecipe, "iconRecipeForSectionIcon:scale:", v22);

        a4 = v23;
      }
      else
      {
        v19 = 0;
      }
    }
    goto LABEL_22;
  }
LABEL_27:
}

void __59__NCNotificationRequest_NCUIAdditions__requesterIdentifier__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v0 = [v2 bundleIdentifier];
  v1 = (void *)requesterIdentifier___requesterIdentifier_0;
  requesterIdentifier___requesterIdentifier_0 = v0;
}

@end