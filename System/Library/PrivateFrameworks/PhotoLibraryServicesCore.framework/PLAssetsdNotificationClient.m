@interface PLAssetsdNotificationClient
- (void)asyncNotifyEndOfInterestForUnrenderedCinematicVideoItems;
- (void)asyncNotifyExpiringMomentShareWithUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6;
- (void)asyncNotifyInterestingMemoryNotificationForColletionID:(id)a3 notificationDeliveryDate:(id)a4;
- (void)asyncNotifyInterestingMemoryNotificationViewedForColletionID:(id)a3;
- (void)asyncNotifyPhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3;
- (void)asyncNotifyPhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3;
- (void)asyncNotifyReadyToViewMomentShareWithUUID:(id)a3;
- (void)asyncNotifyReportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3;
- (void)asyncNotifyResponseToPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3 acceptInvitation:(BOOL)a4;
- (void)asyncNotifySharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3;
- (void)asyncNotifyStartOfInterestForUnrenderedCinematicVideoItems;
- (void)asyncNotifyUserViewedNotificationWithAlbumCloudGUID:(id)a3;
@end

@implementation PLAssetsdNotificationClient

- (void)asyncNotifySharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: asyncNotifySharedLibrarySuggestionsWithNotificationDeliveryDate:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v13 = [v12 _unboostingRemoteObjectProxy];

  [v13 noteSharedLibrarySuggestionsWithNotificationDeliveryDate:v5];
  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v8)
  {
    v14 = PLRequestGetLog();
    v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asyncNotifyEndOfInterestForUnrenderedCinematicVideoItems
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: asyncNotifyEndOfInterestForUnrenderedCinematicVideoItems", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  id v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  v7 = v5;
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v11 = [v10 _unboostingRemoteObjectProxy];

  [v11 notifyEndOfInterestForUnrenderedCinematicVideoItems];
  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    v12 = PLRequestGetLog();
    v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v14 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asyncNotifyStartOfInterestForUnrenderedCinematicVideoItems
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: asyncNotifyStartOfInterestForUnrenderedCinematicVideoItems", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  id v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  v7 = v5;
  os_signpost_id_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v11 = [v10 _unboostingRemoteObjectProxy];

  [v11 notifyStartOfInterestForUnrenderedCinematicVideoItems];
  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    v12 = PLRequestGetLog();
    v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v14 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asyncNotifyPhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3
{
  id v4 = a3;
  id v6 = [(PLAssetsdBaseClient *)self proxyFactory];
  id v5 = [v6 _unboostingRemoteObjectProxy];
  [v5 notePhotosChallengeNewQuestionsWithNotificationDeliveryDate:v4];
}

- (void)asyncNotifyPhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3
{
  id v4 = a3;
  id v6 = [(PLAssetsdBaseClient *)self proxyFactory];
  id v5 = [v6 _unboostingRemoteObjectProxy];
  [v5 notePhotosChallengeSubmissionWithNotificationDeliveryDate:v4];
}

- (void)asyncNotifyReadyToViewMomentShareWithUUID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: asyncNotifyReadyToViewMomentShareWithUUID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v13 = [v12 _unboostingRemoteObjectProxy];
  [v13 noteReadyToViewMomentShareWithUUID:v5];

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v8)
  {
    v14 = PLRequestGetLog();
    long long v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      long long v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asyncNotifyExpiringMomentShareWithUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  BOOL v15 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v15;
  if (v15)
  {
    *((void *)&v26 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: asyncNotifyExpiringMomentShareWithUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v26 + 1), (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  long long v16 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v17 = os_signpost_id_generate(v16);
  long long v18 = v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v30 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  v21 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v22 = [v21 _unboostingRemoteObjectProxy];
  [v22 noteGoingToExpireCMMsAlertWithCMMUUIDs:v11 thumbnailImageData:v12 notificationTitle:v13 notificationSubtitle:v14];

  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if (v17)
  {
    v23 = PLRequestGetLog();
    v24 = v23;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v25 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v30 = v25;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v24, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asyncNotifyReportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: asyncNotifyReportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  id v13 = [v12 _unboostingRemoteObjectProxy];
  [v13 reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:v5];

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v8)
  {
    id v14 = PLRequestGetLog();
    BOOL v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      long long v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asyncNotifyInterestingMemoryNotificationViewedForColletionID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: asyncNotifyInterestingMemoryNotificationViewedForColletionID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  id v13 = [v12 _unboostingRemoteObjectProxy];
  [v13 noteInterestingMemoryAlertViewedWithUUID:v5];

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v8)
  {
    id v14 = PLRequestGetLog();
    BOOL v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      long long v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asyncNotifyInterestingMemoryNotificationForColletionID:(id)a3 notificationDeliveryDate:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v20) = v9;
  if (v9)
  {
    *((void *)&v20 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: asyncNotifyInterestingMemoryNotificationForColletionID:notificationDeliveryDate:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v20 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  v10 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  id v12 = v10;
  id v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v24 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  BOOL v15 = [(PLAssetsdBaseClient *)self proxyFactory];
  long long v16 = [v15 _unboostingRemoteObjectProxy];
  [v16 noteInterestingMemoryAlertWithMemoryUUID:v7 notificationDeliveryDate:v8];

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if (v11)
  {
    long long v17 = PLRequestGetLog();
    long long v18 = v17;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      v19 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v24 = v19;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asyncNotifyResponseToPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3 acceptInvitation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v20 = 0u;
  *(_OWORD *)sel = 0u;
  long long v19 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v19) = v8;
  if (v8)
  {
    *((void *)&v19 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: asyncNotifyResponseToPhotoStreamInvitationForAlbumWithCloudGUID:acceptInvitation:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v20 + 8));
  }
  BOOL v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  os_signpost_id_t v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v23 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  BOOL v15 = [v14 _unboostingRemoteObjectProxy];
  [v15 respondToPhotoStreamInvitationWithAlbumCloudGUID:v7 acceptInvitation:v4];

  if ((_BYTE)v19) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v20 + 8));
  }
  if (v10)
  {
    long long v16 = PLRequestGetLog();
    long long v17 = v16;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      long long v18 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v23 = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asyncNotifyUserViewedNotificationWithAlbumCloudGUID:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: asyncNotifyUserViewedNotificationWithAlbumCloudGUID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  id v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  BOOL v9 = v7;
  os_signpost_id_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    long long v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  id v13 = [v12 _unboostingRemoteObjectProxy];
  [v13 userViewedNotificationWithAlbumCloudGUID:v5];

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v8)
  {
    id v14 = PLRequestGetLog();
    BOOL v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      long long v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      long long v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

@end