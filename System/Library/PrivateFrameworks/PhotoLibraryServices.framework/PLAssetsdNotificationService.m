@interface PLAssetsdNotificationService
- (void)noteGoingToExpireCMMsAlertWithCMMUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6;
- (void)noteInterestingMemoryAlertViewedWithUUID:(id)a3;
- (void)noteInterestingMemoryAlertWithMemoryUUID:(id)a3 notificationDeliveryDate:(id)a4;
- (void)notePhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3;
- (void)notePhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3;
- (void)noteReadyToViewMomentShareWithUUID:(id)a3;
- (void)noteSharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3;
- (void)notifyEndOfInterestForUnrenderedCinematicVideoItems;
- (void)notifyStartOfInterestForUnrenderedCinematicVideoItems;
- (void)reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3;
- (void)respondToPhotoStreamInvitationWithAlbumCloudGUID:(id)a3 acceptInvitation:(BOOL)a4;
- (void)userViewedNotificationWithAlbumCloudGUID:(id)a3;
@end

@implementation PLAssetsdNotificationService

- (void)noteSharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: noteSharedLibrarySuggestionsWithNotificationDeliveryDate:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  v5 = +[PLNotificationManager sharedManager];
  [v5 postNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:v3];

  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    v6 = PLRequestGetLog();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)notifyEndOfInterestForUnrenderedCinematicVideoItems
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  *(_OWORD *)sel = 0u;
  long long v7 = 0u;
  int v2 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v7) = v2;
  if (v2)
  {
    *((void *)&v7 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: notifyEndOfInterestForUnrenderedCinematicVideoItems", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v7 + 1), (os_activity_scope_state_t)((char *)&v9 + 8));
  }
  id v3 = +[PLNotificationManager sharedManager];
  [v3 removeNotificationForInterestInUnrenderedCinematicVideoItems];

  if (v8) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v9 + 8));
  }
  if ((void)v9)
  {
    int v4 = PLRequestGetLog();
    v5 = v4;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v12 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v5, OS_SIGNPOST_INTERVAL_END, v9, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)notifyStartOfInterestForUnrenderedCinematicVideoItems
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  *(_OWORD *)sel = 0u;
  long long v7 = 0u;
  int v2 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v7) = v2;
  if (v2)
  {
    *((void *)&v7 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: notifyStartOfInterestForUnrenderedCinematicVideoItems", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v7 + 1), (os_activity_scope_state_t)((char *)&v9 + 8));
  }
  id v3 = +[PLNotificationManager sharedManager];
  [v3 postNotificationForInterestInUnrenderedCinematicVideoItems];

  if (v8) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v9 + 8));
  }
  if ((void)v9)
  {
    int v4 = PLRequestGetLog();
    v5 = v4;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v12 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v5, OS_SIGNPOST_INTERVAL_END, v9, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)notePhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3
{
  id v3 = a3;
  id v4 = +[PLNotificationManager sharedManager];
  [v4 postNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:v3];
}

- (void)notePhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3
{
  id v3 = a3;
  id v4 = +[PLNotificationManager sharedManager];
  [v4 postNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:v3];
}

- (void)noteReadyToViewMomentShareWithUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  *(_OWORD *)sel = 0u;
  long long v11 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((void *)&v11 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: noteReadyToViewMomentShareWithUUID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  id v6 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdNotificationService noteReadyToViewMomentShareWithUUID:]", (void)v11);
  long long v7 = +[PLNotificationManager sharedManager];
  [v7 postNotificationForReadyToViewMomentShareWithUUID:v4 photoLibrary:v6];

  if (v12) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  }
  if ((void)v13)
  {
    char v8 = PLRequestGetLog();
    long long v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)noteGoingToExpireCMMsAlertWithCMMUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v20 = 0u;
  *(_OWORD *)sel = 0u;
  long long v18 = 0u;
  int v13 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v18) = v13;
  if (v13)
  {
    *((void *)&v18 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: noteGoingToExpireCMMsAlertWithCMMUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v18 + 1), (os_activity_scope_state_t)((char *)&v20 + 8));
  }
  v14 = +[PLNotificationManager sharedManager];
  [v14 postNotificationForExpiringCMMsWithUUIDs:v9 thumbnailImageData:v10 notificationTitle:v11 notificationSubtitle:v12];

  if (v19) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v20 + 8));
  }
  if ((void)v20)
  {
    uint64_t v15 = PLRequestGetLog();
    v16 = v15;
    if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v23 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  int v5 = +[PLNotificationManager sharedManager];
  [v5 reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:v3];

  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    id v6 = PLRequestGetLog();
    long long v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)respondToPhotoStreamInvitationWithAlbumCloudGUID:(id)a3 acceptInvitation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  *(_OWORD *)sel = 0u;
  long long v11 = 0u;
  int v6 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v11) = v6;
  if (v6)
  {
    *((void *)&v11 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: respondToPhotoStreamInvitationWithAlbumCloudGUID:acceptInvitation:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  long long v7 = +[PLNotificationManager sharedManager];
  [v7 sendResponse:v4 toPhotoStreamInvitationForAlbumWithCloudGUID:v5];

  if (v12) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  }
  if ((void)v13)
  {
    char v8 = PLRequestGetLog();
    long long v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)noteInterestingMemoryAlertViewedWithUUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: noteInterestingMemoryAlertViewedWithUUID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  id v5 = +[PLNotificationManager sharedManager];
  [v5 removeNotificationForInterestingMemoryWithUUID:v3];

  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    int v6 = PLRequestGetLog();
    long long v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)noteInterestingMemoryAlertWithMemoryUUID:(id)a3 notificationDeliveryDate:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v14 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v14) = v8;
  if (v8)
  {
    *((void *)&v14 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: noteInterestingMemoryAlertWithMemoryUUID:notificationDeliveryDate:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  id v9 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdNotificationService noteInterestingMemoryAlertWithMemoryUUID:notificationDeliveryDate:]", (void)v14);
  char v10 = +[PLNotificationManager sharedManager];
  [v10 postNotificationForInterestingMemoryWithMemoryUUID:v6 library:v9 notificationDeliveryDate:v7];

  if (v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if ((void)v16)
  {
    long long v11 = PLRequestGetLog();
    char v12 = v11;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      char v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)userViewedNotificationWithAlbumCloudGUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: userViewedNotificationWithAlbumCloudGUID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  id v5 = +[PLNotificationManager sharedManager];
  [v5 userViewedNotificationWithAlbumCloudGUID:v3];

  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    id v6 = PLRequestGetLog();
    id v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      long long v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

@end