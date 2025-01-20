@interface CKShare(UI)
+ (id)ic_fallbackThumbnail;
+ (uint64_t)ic_cacheThumbnailsForObject:()UI;
+ (void)ic_updateThumbnailsForObject:()UI share:completion:;
- (void)ic_updateFromObject:()UI;
- (void)ic_updateFromObject:()UI generateThumbnails:;
- (void)ic_updateThumbnailsFromObject:()UI completion:;
@end

@implementation CKShare(UI)

+ (id)ic_fallbackThumbnail
{
  if (ic_fallbackThumbnail_onceToken != -1) {
    dispatch_once(&ic_fallbackThumbnail_onceToken, &__block_literal_global_122);
  }
  v0 = (void *)ic_fallbackThumbnail_thumbnail;
  return v0;
}

- (void)ic_updateFromObject:()UI
{
  id v30 = a3;
  v4 = [v30 shareType];
  [a1 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F19DD0]];

  v5 = [v30 shareTitle];
  [a1 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F19DC8]];

  v6 = objc_msgSend((id)objc_opt_class(), "ic_fallbackThumbnail");
  v7 = objc_msgSend(v6, "ic_PNGData");
  [a1 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F19DC0]];

  v8 = [v30 recordType];
  [a1 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F831D0]];

  v9 = [v30 recordID];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1A348]);
    v11 = [v30 recordID];
    v12 = (void *)[v10 initWithRecordID:v11 action:0];
    [a1 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F831C8]];
  }
  else
  {
    [a1 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F831C8]];
  }

  objc_opt_class();
  v13 = ICDynamicCast();
  v14 = (void *)MEMORY[0x1E4F19DB8];
  if (v13)
  {
    v15 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared Note" value:@"Shared Note" table:0 allowSiri:1];
    [a1 setObject:v15 forKeyedSubscript:*v14];

    v16 = [v13 snippet];
    v17 = [a1 encryptedValues];
    [v17 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F831E8]];

    v18 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v13, "attachmentContentInfoType"));
    [a1 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F831E0]];

    v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "attachmentContentInfoCount"));
    [a1 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F831D8]];
  }
  objc_opt_class();
  v20 = ICDynamicCast();
  if (v20)
  {
    v21 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared Folder" value:@"Shared Folder" table:0 allowSiri:1];
    [a1 setObject:v21 forKeyedSubscript:*v14];

    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "visibleNotesCount"));
    [a1 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F831A8]];

    v23 = NSNumber;
    v24 = [v20 visibleNotesIncludingChildFolders];
    v25 = objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
    [a1 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F831B0]];

    v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v20, "visibleNoteContainerChildrenCount"));
    [a1 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F831F0]];

    v27 = NSNumber;
    v28 = [v20 recursiveVisibleSubfolders];
    v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
    [a1 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F831F8]];
  }
}

- (void)ic_updateThumbnailsFromObject:()UI completion:
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend((id)objc_opt_class(), "ic_updateThumbnailsForObject:share:completion:", v7, a1, v6);
}

- (void)ic_updateFromObject:()UI generateThumbnails:
{
  id v6 = a3;
  objc_msgSend(a1, "ic_updateFromObject:");
  if (a4) {
    objc_msgSend(a1, "ic_updateThumbnailsFromObject:completion:", v6, 0);
  }
}

+ (uint64_t)ic_cacheThumbnailsForObject:()UI
{
  return objc_msgSend(a1, "ic_updateThumbnailsForObject:share:completion:", a3, 0, 0);
}

+ (void)ic_updateThumbnailsForObject:()UI share:completion:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F83298] appearanceInfoWithType:0];
  v11 = [MEMORY[0x1E4F83298] appearanceInfoWithType:1];
  v12 = dispatch_group_create();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__29;
  v36[4] = __Block_byref_object_dispose__29;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__29;
  v34[4] = __Block_byref_object_dispose__29;
  id v35 = 0;
  objc_opt_class();
  v13 = ICDynamicCast();
  v14 = &off_1B0B98000;
  if (v13)
  {
    id v22 = v7;
    dispatch_group_enter(v12);
    id v15 = [[ICThumbnailConfiguration alloc] initForShareThumbnailWithNote:v13 appearanceInfo:v10];
    v16 = +[ICThumbnailService sharedThumbnailService];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke;
    v31[3] = &unk_1E5FDB4C0;
    v33 = v36;
    v17 = v12;
    v32 = v17;
    [v16 thumbnailWithConfiguration:v15 completion:v31];

    dispatch_group_enter(v17);
    id v18 = [[ICThumbnailConfiguration alloc] initForShareThumbnailWithNote:v13 appearanceInfo:v11];
    v19 = +[ICThumbnailService sharedThumbnailService];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke_2;
    v28[3] = &unk_1E5FDB4C0;
    id v30 = v34;
    v29 = v17;
    [v19 thumbnailWithConfiguration:v18 completion:v28];

    id v7 = v22;
    v14 = &off_1B0B98000;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *((void *)v14 + 232);
  block[2] = __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke_3;
  block[3] = &unk_1E5FDB4E8;
  v26 = v36;
  v27 = v34;
  id v24 = v8;
  id v25 = v9;
  id v20 = v9;
  id v21 = v8;
  dispatch_group_notify(v12, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
}

@end