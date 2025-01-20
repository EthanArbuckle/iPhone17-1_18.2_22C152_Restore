@interface PXSearchSettings(UI)
+ (__CFString)_formatIndexingStatusAlertMessageForRemainingCount:()UI isPaused:elapsedTimeSincePause:;
+ (id)settingsControllerModule;
@end

@implementation PXSearchSettings(UI)

+ (__CFString)_formatIndexingStatusAlertMessageForRemainingCount:()UI isPaused:elapsedTimeSincePause:
{
  if (a4)
  {
    if (a5)
    {
      if (a1 < 1.0) {
        a1 = 1.0;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"Indexing has been paused for %.0f minute(s).\nRemaining objects count: %ld", *(void *)&a1, a4);
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Remaining objects count: %ld", a4, v8);
    }
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = @"Indexing complete";
  }
  return v6;
}

+ (id)settingsControllerModule
{
  v62[6] = *MEMORY[0x1E4F143B8];
  v50 = (void *)MEMORY[0x1E4F94160];
  v46 = [MEMORY[0x1E4F94158] rowWithTitle:@"Override Matched Text" valueKeyPath:@"overrideMatchedQueryText"];
  v62[0] = v46;
  v1 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Force Indexing Footer" valueKeyPath:@"forceIndexingFooter"];
  v62[1] = v1;
  v2 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Indexing Banner Theshold" valueKeyPath:@"indexingBannerPercentageThreshold"];
  v3 = [v2 minValue:1.0 maxValue:100.0];
  v4 = objc_msgSend(v3, "px_increment:", 1.0);
  v62[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Indexing Paused Title" valueKeyPath:@"forceIndexingPausedTitle"];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"forceIndexingFooter == YES"];
  v7 = [v5 condition:v6];
  v62[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Autocorrect" valueKeyPath:@"enableAutoCorrect"];
  v62[4] = v8;
  v9 = objc_msgSend(MEMORY[0x1E4F941F0], "px_rowWithTitle:valueKeyPath:condition:", @"Disable Top Asset Curation", @"disableTopAssetCuration", 0);
  v62[5] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:6];
  v51 = [v50 sectionWithRows:v10 title:0];

  v11 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  v12 = [v11 assetsdClient];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke;
  aBlock[3] = &unk_1E5F2C8C0;
  id v13 = v12;
  id v58 = v13;
  uint64_t v59 = a1;
  v14 = _Block_copy(aBlock);
  v15 = (void *)MEMORY[0x1E4F940F8];
  v16 = (void *)MEMORY[0x1E4F94190];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_6;
  v54[3] = &unk_1E5F2BC28;
  id v55 = v13;
  id v17 = v14;
  id v56 = v17;
  id v49 = v13;
  v18 = [v16 actionWithHandler:v54];
  v45 = [v15 rowWithTitle:@"Rebuild Search Index" action:v18];

  v19 = (void *)MEMORY[0x1E4F940F8];
  v20 = (void *)MEMORY[0x1E4F94190];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __48__PXSearchSettings_UI__settingsControllerModule__block_invoke_105;
  v52[3] = &unk_1E5F2BC50;
  id v53 = v17;
  id v47 = v17;
  v21 = [v20 actionWithHandler:v52];
  v22 = [v19 rowWithTitle:@"Search Index Status" action:v21];

  v23 = (void *)MEMORY[0x1E4F94160];
  v61[0] = v45;
  v61[1] = v22;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  v25 = [v23 sectionWithRows:v24 title:@"Index"];

  v26 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Embedding Search" valueKeyPath:@"enableEmbeddingSearch"];
  v27 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Min Similarity" valueKeyPath:@"embeddingVectorDistanceThreshold"];
  v28 = [v27 minValue:-1.0 maxValue:0.9];
  v29 = objc_msgSend(v28, "px_increment:", 0.1);
  v30 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"enableEmbeddingSearch == YES"];
  v31 = [v29 condition:v30];

  v32 = (void *)MEMORY[0x1E4F94108];
  v33 = NSStringFromSelector(sel_queryDepersonalizationType);
  v34 = [v32 rowWithTitle:@"Query Depersonalization" valueKeyPath:v33];
  v35 = [v34 possibleValues:&unk_1F078B5E8 titles:&unk_1F078B600];
  v36 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"enableEmbeddingSearch == YES"];
  v37 = [v35 condition:v36];

  v38 = (void *)MEMORY[0x1E4F94160];
  v60[0] = v26;
  v60[1] = v31;
  v60[2] = v37;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
  v40 = [v38 sectionWithRows:v39 title:@"⚠️ Embedding Prototype ⚠️"];

  v41 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v42 addObject:v51];
  [v42 addObject:v25];
  [v42 addObject:v40];
  [v42 addObject:v41];
  v43 = [MEMORY[0x1E4F94160] moduleWithTitle:@"Search" contents:v42];

  return v43;
}

@end