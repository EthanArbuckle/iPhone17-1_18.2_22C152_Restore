@interface NSAttributedString(PXLocalization)
+ (id)px_localizedAttributedStringForCommentWithCommenterFullName:()PXLocalization text:defaultTextAttributes:emphasizedTextAttributes:;
+ (id)px_localizedAttributedStringForInvitationResponseReceivedWithInviteeFullName:()PXLocalization sharedAlbumName:accepted:defaultTextAttributes:posterTextAttributes:albumTextAttributes:;
+ (id)px_localizedAttributedStringForInvitationResponseReceivedWithInviteeFullName:()PXLocalization streamName:accepted:defaultTextAttributes:emphasizedTextAttributes:streamNameAttributes:;
+ (id)px_localizedAttributedStringForLikesFromUser:()PXLocalization orPersonFullName:photoCount:videoCount:streamName:defaultTextAttributes:emphasizedTextAttributes:italicizedTextAttributes:;
+ (id)px_localizedAttributedStringForLikesFromUser:()PXLocalization otherPeopleFullNames:isVideo:defaultTextAttributes:emphasizedTextAttributes:;
+ (id)px_localizedAttributedStringForLikesWithLikerCount:()PXLocalization isVideo:defaultTextAttributes:emphasizedTextAttributes:;
+ (id)px_localizedAttributedStringForPostAttributionOfAssetWithDisplayType:()PXLocalization postedByUserOrSubjectWithFullName:atDate:nameAttributes:dateAttributes:;
+ (id)px_localizedAttributedStringForPostWithSubjectFullName:()PXLocalization photoCount:videoCount:defaultTextAttributes:emphasizedTextAttributes:;
+ (id)px_localizedAttributedStringForUserCommentWithText:()PXLocalization defaultTextAttributes:emphasizedTextAttributes:;
+ (id)px_localizedAttributedStringForUserCreatingStreamWithName:()PXLocalization defaultTextAttributes:emphasizedTextAttributes:;
+ (id)px_localizedAttributedStringForUserInvitedToStreamWithName:()PXLocalization inviterName:defaultTextAttributes:emphasizedTextAttributes:;
+ (id)px_localizedAttributedStringForUserJoiningSharedAlbumWithName:()PXLocalization defaultTextAttributes:posterTextAttributes:albumTextAttributes:;
+ (id)px_localizedAttributedStringForUserJoiningStreamWithName:()PXLocalization defaultTextAttributes:emphasizedTextAttributes:;
+ (id)px_localizedAttributedStringForUserPostWithCountsSet:()PXLocalization subjectName:captionText:defaultTextAttributes:posterTextAttributes:captionTextAttributes:;
+ (id)px_localizedAttributedStringForUserPostWithPhotoCount:()PXLocalization videoCount:defaultTextAttributes:emphasizedTextAttributes:;
+ (uint64_t)px_localizedAttributedStringForUserPostWithCountsSet:()PXLocalization defaultTextAttributes:subjectName:;
+ (uint64_t)px_localizedAttributedStringForUserPostWithCountsSet:()PXLocalization subjectName:defaultTextAttributes:posterTextAttributes:;
@end

@implementation NSAttributedString(PXLocalization)

+ (id)px_localizedAttributedStringForUserInvitedToStreamWithName:()PXLocalization inviterName:defaultTextAttributes:emphasizedTextAttributes:
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a5;
  v11 = a4;
  v12 = a3;
  PXLocalizedStringFromTable(@"CLOUD_FEED_INBOX_INVITATION_PHRASE_FORMAT", @"PhotosUICore");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v12) {
    v15 = v12;
  }
  else {
    v15 = &stru_1F00B0030;
  }
  v16 = (void *)[v14 initWithString:v15 attributes:v9];

  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v11) {
    v18 = v11;
  }
  else {
    v18 = &stru_1F00B0030;
  }
  v19 = (void *)[v17 initWithString:v18 attributes:v9];

  v20 = (void *)MEMORY[0x1E4F28B18];
  if (v13) {
    v21 = v13;
  }
  else {
    v21 = &stru_1F00B0030;
  }
  v25[0] = v19;
  v25[1] = v16;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v23 = objc_msgSend(v20, "px_stringWithFormat:defaultAttributes:arguments:", v21, v10, v22);

  return v23;
}

+ (id)px_localizedAttributedStringForPostAttributionOfAssetWithDisplayType:()PXLocalization postedByUserOrSubjectWithFullName:atDate:nameAttributes:dateAttributes:
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v36 = v13;
  switch(a3)
  {
    case 0:
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a2 object:a1 file:@"PXLocalization.m" lineNumber:1026 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      id v17 = v16;
      if (v13)
      {
        v18 = @"PHOTO_POSTED_BY_SOMEONE";
        goto LABEL_16;
      }
      v22 = @"PHOTO_POSTED_BY_YOU";
      goto LABEL_24;
    case 2:
      id v17 = v16;
      if (v13)
      {
        v18 = @"VIDEO_POSTED_BY_SOMEONE";
        goto LABEL_16;
      }
      v22 = @"VIDEO_POSTED_BY_YOU";
      goto LABEL_24;
    case 3:
      id v17 = v16;
      if (v13)
      {
        v18 = @"BOUNCE_POSTED_BY_SOMEONE";
        goto LABEL_16;
      }
      v22 = @"BOUNCE_POSTED_BY_YOU";
      goto LABEL_24;
    case 4:
      id v17 = v16;
      if (v13)
      {
        v18 = @"LOOP_POSTED_BY_SOMEONE";
        goto LABEL_16;
      }
      v22 = @"LOOP_POSTED_BY_YOU";
      goto LABEL_24;
    case 5:
      id v17 = v16;
      if (v13)
      {
        v18 = @"LONGEXP_POSTED_BY_SOMEONE";
        goto LABEL_16;
      }
      v22 = @"LONGEXP_POSTED_BY_YOU";
      goto LABEL_24;
    case 6:
      id v17 = v16;
      if (v13)
      {
        v18 = @"GIF_POSTED_BY_SOMEONE";
LABEL_16:
        v20 = PXLocalizedStringFromTable(v18, @"PhotosUICore");
LABEL_17:
        PXStringWithValidatedFormat();
        id v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = @"GIF_POSTED_BY_YOU";
LABEL_24:
        v19 = PXLocalizedStringFromTable(v22, @"PhotosUICore");
LABEL_25:
        id v21 = v19;
        v20 = v21;
      }
      v23 = v21;
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v21 attributes:v15];
      uint64_t v25 = PLRelativePrettyDateForDate();
      v26 = v14;
      v27 = (void *)v25;
      v28 = &stru_1F00B0030;
      if (v25) {
        v28 = (__CFString *)v25;
      }
      v29 = v28;

      v30 = (void *)MEMORY[0x1E4F28B18];
      v31 = PXLocalizedStringFromTable(@"POSTED_BY_ON_DATE", @"PhotosUICore");
      v37[0] = v24;
      v37[1] = v29;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
      v33 = objc_msgSend(v30, "px_stringWithFormat:defaultAttributes:arguments:", v31, v17, v32);

      return v33;
    default:
      id v17 = v16;
      v19 = 0;
      v20 = 0;
      if (!v13) {
        goto LABEL_25;
      }
      goto LABEL_17;
  }
}

+ (id)px_localizedAttributedStringForUserPostWithCountsSet:()PXLocalization subjectName:captionText:defaultTextAttributes:posterTextAttributes:captionTextAttributes:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v45 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  uint64_t v18 = [v13 count];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v19 = v13;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    id v22 = v14;
    id v23 = v17;
    id v24 = v16;
    id v25 = v15;
    v26 = 0;
    uint64_t v27 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v47 != v27) {
          objc_enumerationMutation(v19);
        }
        v26 += [v19 countForObject:*(void *)(*((void *)&v46 + 1) + 8 * i)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v21);
    id v15 = v25;
    id v16 = v24;
    id v17 = v23;
    id v14 = v22;
  }
  else
  {
    v26 = 0;
  }

  if (v18 == 1)
  {
    v29 = [v19 anyObject];
    uint64_t v30 = [v29 integerValue];

    v31 = v45;
    switch(v30)
    {
      case 0:
        v32 = @"ICLOUD_SOMEONE_SHARED_ITEM";
        v33 = @"ICLOUD_YOU_SHARED_ITEM";
        goto LABEL_24;
      case 1:
        v32 = @"ICLOUD_SOMEONE_SHARED_PHOTO";
        v33 = @"ICLOUD_YOU_SHARED_PHOTO";
        goto LABEL_24;
      case 2:
        v32 = @"ICLOUD_SOMEONE_SHARED_VIDEO";
        v33 = @"ICLOUD_YOU_SHARED_VIDEO";
        goto LABEL_24;
      case 3:
        v32 = @"ICLOUD_SOMEONE_SHARED_BOUNCE";
        v33 = @"ICLOUD_YOU_SHARED_BOUNCE";
        goto LABEL_24;
      case 4:
        v32 = @"ICLOUD_SOMEONE_SHARED_LOOP";
        v33 = @"ICLOUD_YOU_SHARED_LOOP";
        goto LABEL_24;
      case 5:
        v32 = @"ICLOUD_SOMEONE_SHARED_LONGEXP";
        v33 = @"ICLOUD_YOU_SHARED_LONGEXP";
        goto LABEL_24;
      case 6:
        v32 = @"ICLOUD_SOMEONE_SHARED_GIF";
        v33 = @"ICLOUD_YOU_SHARED_GIF";
LABEL_24:
        if (!v14) {
          v32 = v33;
        }
        goto LABEL_26;
      default:
        v34 = 0;
        if (v45) {
          goto LABEL_27;
        }
        goto LABEL_28;
    }
  }
  v32 = @"ICLOUD_SOMEONE_SHARED_ITEM";
  if (!v14) {
    v32 = @"ICLOUD_YOU_SHARED_ITEM";
  }
  v31 = v45;
LABEL_26:
  v34 = v32;
  if (v31)
  {
LABEL_27:
    uint64_t v35 = [NSString stringWithFormat:@"%@_CAPTION", v34];

    v34 = (__CFString *)v35;
  }
LABEL_28:
  v36 = PXLocalizedStringFromTable(v34, @"PhotosUICore");
  v37 = v36;
  if (v14)
  {
    v38 = objc_msgSend(v14, "px_stringConvertedToHTMLString");
    v44 = v38;
    if (v31) {
      v39 = @"%@ %d %@";
    }
    else {
      v39 = @"%@ %d";
    }
    v41 = PXLocalizedStringWithValidatedFormat(v37, v39);
  }
  else
  {
    v44 = v26;
    if (v31) {
      v40 = @"%d %@";
    }
    else {
      v40 = @"%d";
    }
    v41 = PXLocalizedStringWithValidatedFormat(v36, v40);
    v38 = v37;
  }

  v42 = objc_msgSend(MEMORY[0x1E4F28B18], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", v41, v15, v16, v17, v44);

  return v42;
}

+ (uint64_t)px_localizedAttributedStringForUserPostWithCountsSet:()PXLocalization subjectName:defaultTextAttributes:posterTextAttributes:
{
  return objc_msgSend(MEMORY[0x1E4F28B18], "px_localizedAttributedStringForUserPostWithCountsSet:subjectName:captionText:defaultTextAttributes:posterTextAttributes:captionTextAttributes:", a3, a4, 0, a5, a6, 0);
}

+ (uint64_t)px_localizedAttributedStringForUserPostWithCountsSet:()PXLocalization defaultTextAttributes:subjectName:
{
  return objc_msgSend(MEMORY[0x1E4F28B18], "px_localizedAttributedStringForUserPostWithCountsSet:subjectName:defaultTextAttributes:posterTextAttributes:", a3, a5, a4, 0);
}

+ (id)px_localizedAttributedStringForUserCreatingStreamWithName:()PXLocalization defaultTextAttributes:emphasizedTextAttributes:
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  PXLocalizedStringFromTable(@"CLOUD_FEED_YOU_CREATED_STREAM_NAMED_PHRASE_FORMAT", @"PhotosUICore");
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(@"CLOUD_FEED_YOU_CREATED_STREAM_NAMED_SUBJECT", @"PhotosUICore");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = &stru_1F00B0030;
  }
  id v14 = (void *)[v12 initWithString:v13 attributes:v7];

  id v15 = (void *)MEMORY[0x1E4F28B18];
  if (v10) {
    id v16 = v10;
  }
  else {
    id v16 = &stru_1F00B0030;
  }
  if (v9) {
    id v17 = v9;
  }
  else {
    id v17 = &stru_1F00B0030;
  }
  v21[0] = v14;
  v21[1] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v19 = objc_msgSend(v15, "px_stringWithFormat:defaultAttributes:arguments:", v16, v8, v18);

  return v19;
}

+ (id)px_localizedAttributedStringForInvitationResponseReceivedWithInviteeFullName:()PXLocalization sharedAlbumName:accepted:defaultTextAttributes:posterTextAttributes:albumTextAttributes:
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v13 = (objc_class *)MEMORY[0x1E4F28B18];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  uint64_t v18 = a3;
  id v19 = [v13 alloc];
  if (v18) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = &stru_1F00B0030;
  }
  uint64_t v21 = (void *)[v19 initWithString:v20 attributes:v15];

  if (a5) {
    id v22 = @"CLOUD_FEED_SOMEONE_JOINED_STREAM_NAMED_PHRASE_FORMAT";
  }
  else {
    id v22 = @"CLOUD_FEED_SOMEONE_DECLINED_TO_JOIN_STREAM_NAMED_PHRASE_FORMAT";
  }
  id v23 = PXLocalizedStringFromTable(v22, @"PhotosUICore");
  id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v17) {
    id v25 = v17;
  }
  else {
    id v25 = &stru_1F00B0030;
  }
  v26 = (__CFString *)[v24 initWithString:v25 attributes:v14];

  uint64_t v27 = (void *)MEMORY[0x1E4F28B18];
  if (v26) {
    v28 = v26;
  }
  else {
    v28 = &stru_1F00B0030;
  }
  v32[0] = v21;
  v32[1] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  uint64_t v30 = objc_msgSend(v27, "px_stringWithFormat:defaultAttributes:arguments:", v23, v16, v29);

  return v30;
}

+ (id)px_localizedAttributedStringForInvitationResponseReceivedWithInviteeFullName:()PXLocalization streamName:accepted:defaultTextAttributes:emphasizedTextAttributes:streamNameAttributes:
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v13 = (objc_class *)MEMORY[0x1E4F28B18];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  uint64_t v18 = a3;
  id v19 = [v13 alloc];
  if (v18) {
    uint64_t v20 = v18;
  }
  else {
    uint64_t v20 = &stru_1F00B0030;
  }
  uint64_t v21 = (void *)[v19 initWithString:v20 attributes:v15];

  id v22 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v17) {
    id v23 = v17;
  }
  else {
    id v23 = &stru_1F00B0030;
  }
  id v24 = (void *)[v22 initWithString:v23 attributes:v14];

  if (a5) {
    id v25 = @"CLOUD_FEED_SOMEONE_JOINED_STREAM_NAMED_PHRASE_FORMAT";
  }
  else {
    id v25 = @"CLOUD_FEED_SOMEONE_DECLINED_TO_JOIN_STREAM_NAMED_PHRASE_FORMAT";
  }
  v26 = PXLocalizedStringFromTable(v25, @"PhotosUICore");
  uint64_t v27 = (void *)MEMORY[0x1E4F28B18];
  v31[0] = v21;
  v31[1] = v24;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  v29 = objc_msgSend(v27, "px_stringWithFormat:defaultAttributes:arguments:", v26, v16, v28);

  return v29;
}

+ (id)px_localizedAttributedStringForUserJoiningSharedAlbumWithName:()PXLocalization defaultTextAttributes:posterTextAttributes:albumTextAttributes:
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  PXLocalizedStringFromTable(@"CLOUD_FEED_YOU_JOINED_STREAM_NAMED_PHRASE_FORMAT", @"PhotosUICore");
  id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(@"CLOUD_FEED_YOU_JOINED_STREAM_NAMED_SUBJECT", @"PhotosUICore");
  id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = &stru_1F00B0030;
  }
  id v17 = (void *)[v15 initWithString:v16 attributes:v10];

  id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v12) {
    id v19 = v12;
  }
  else {
    id v19 = &stru_1F00B0030;
  }
  uint64_t v20 = (__CFString *)[v18 initWithString:v19 attributes:v9];

  uint64_t v21 = (void *)MEMORY[0x1E4F28B18];
  if (v13) {
    id v22 = v13;
  }
  else {
    id v22 = &stru_1F00B0030;
  }
  if (v20) {
    id v23 = v20;
  }
  else {
    id v23 = &stru_1F00B0030;
  }
  v27[0] = v17;
  v27[1] = v23;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  id v25 = objc_msgSend(v21, "px_stringWithFormat:defaultAttributes:arguments:", v22, v11, v24);

  return v25;
}

+ (id)px_localizedAttributedStringForUserJoiningStreamWithName:()PXLocalization defaultTextAttributes:emphasizedTextAttributes:
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  PXLocalizedStringFromTable(@"CLOUD_FEED_YOU_JOINED_STREAM_NAMED_PHRASE_FORMAT", @"PhotosUICore");
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(@"CLOUD_FEED_YOU_JOINED_STREAM_NAMED_SUBJECT", @"PhotosUICore");
  id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = &stru_1F00B0030;
  }
  id v14 = (void *)[v12 initWithString:v13 attributes:v7];

  id v15 = (void *)MEMORY[0x1E4F28B18];
  if (v10) {
    id v16 = v10;
  }
  else {
    id v16 = &stru_1F00B0030;
  }
  if (v9) {
    id v17 = v9;
  }
  else {
    id v17 = &stru_1F00B0030;
  }
  v21[0] = v14;
  v21[1] = v17;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v19 = objc_msgSend(v15, "px_stringWithFormat:defaultAttributes:arguments:", v16, v8, v18);

  return v19;
}

+ (id)px_localizedAttributedStringForLikesWithLikerCount:()PXLocalization isVideo:defaultTextAttributes:emphasizedTextAttributes:
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a5;
  if (a4) {
    id v11 = @"CLOUD_FEED_MANY_PEOPLE_LIKED_THIS_VIDEO_PHRASE_FORMAT";
  }
  else {
    id v11 = @"CLOUD_FEED_MANY_PEOPLE_LIKED_THIS_PHOTO_PHRASE_FORMAT";
  }
  if (a4) {
    id v12 = @"CLOUD_FEED_MANY_PEOPLE_LIKED_THIS_VIDEO_SUBJECT";
  }
  else {
    id v12 = @"CLOUD_FEED_MANY_PEOPLE_LIKED_THIS_PHOTO_SUBJECT";
  }
  PXLocalizedStringFromTable(v11, @"PhotosUICore");
  id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v14 = PXLocalizedStringFromTable(v12, @"PhotosUICore");
  id v15 = PXLocalizedStringFromInteger(a3);
  id v16 = PXStringWithValidatedFormat();
  id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B18]), "initWithString:attributes:", v16, v9, v15);

  id v18 = (void *)MEMORY[0x1E4F28B18];
  if (v13) {
    id v19 = v13;
  }
  else {
    id v19 = &stru_1F00B0030;
  }
  v23[0] = v17;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  uint64_t v21 = objc_msgSend(v18, "px_stringWithFormat:defaultAttributes:arguments:", v19, v10, v20);

  return v21;
}

+ (id)px_localizedAttributedStringForLikesFromUser:()PXLocalization orPersonFullName:photoCount:videoCount:streamName:defaultTextAttributes:emphasizedTextAttributes:italicizedTextAttributes:
{
  id v15 = a4;
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  uint64_t v19 = objc_msgSend(a7, "px_stringConvertedToHTMLString");
  uint64_t v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = (__CFString *)v19;
  }
  else {
    uint64_t v21 = &stru_1F00B0030;
  }
  id v22 = v21;

  id v23 = (__CFString *)(a6 + a5);
  BOOL v24 = a5 > 0;
  BOOL v25 = a5 == 0;
  if (a6) {
    BOOL v24 = 0;
  }
  if (a6 <= 0) {
    BOOL v25 = 0;
  }
  if (a3)
  {
    if (v25) {
      v26 = @"CLOUD_FEED_YOU_LIKED_THESE_N_VIDEOS_IN_STREAM_NAMED_HTML_FORMAT";
    }
    else {
      v26 = @"CLOUD_FEED_YOU_LIKED_THESE_N_ITEMS_IN_STREAM_NAMED_HTML_FORMAT";
    }
    if (v24) {
      uint64_t v27 = @"CLOUD_FEED_YOU_LIKED_THESE_N_PHOTOS_IN_STREAM_NAMED_HTML_FORMAT";
    }
    else {
      uint64_t v27 = v26;
    }
    v28 = PXLocalizedStringFromTable(v27, @"PhotosUICore");
    v37 = v23;
    v38 = v22;
    v29 = PXLocalizedStringWithValidatedFormat(v28, @"%lu %@");
  }
  else
  {
    if (v25) {
      uint64_t v30 = @"CLOUD_FEED_SOMEONE_LIKED_THESE_N_VIDEOS_IN_STREAM_NAMED_HTML_FORMAT";
    }
    else {
      uint64_t v30 = @"CLOUD_FEED_SOMEONE_LIKED_THESE_N_ITEMS_IN_STREAM_NAMED_HTML_FORMAT";
    }
    if (v24) {
      v31 = @"CLOUD_FEED_SOMEONE_LIKED_THESE_N_PHOTOS_IN_STREAM_NAMED_HTML_FORMAT";
    }
    else {
      v31 = v30;
    }
    v28 = PXLocalizedStringFromTable(v31, @"PhotosUICore");
    uint64_t v32 = objc_msgSend(v15, "px_stringConvertedToHTMLString");
    v33 = (void *)v32;
    if (v32) {
      v34 = (__CFString *)v32;
    }
    else {
      v34 = &stru_1F00B0030;
    }
    v38 = v23;
    v37 = v34;
    v29 = PXLocalizedStringWithValidatedFormat(v28, @"%@ %lu %@");
  }
  uint64_t v35 = objc_msgSend(MEMORY[0x1E4F28B18], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", v29, v18, v17, v16, v37, v38);

  return v35;
}

+ (id)px_localizedAttributedStringForLikesFromUser:()PXLocalization otherPeopleFullNames:isVideo:defaultTextAttributes:emphasizedTextAttributes:
{
  v120[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = [v11 count];
  if (a3)
  {
    if (v14 != 2)
    {
      uint64_t v15 = v14 - 1;
      if (v14 == 1)
      {
        if (a5) {
          v72 = @"CLOUD_FEED_YOU_AND_ONE_PERSON_LIKED_THIS_VIDEO_PHRASE_FORMAT";
        }
        else {
          v72 = @"CLOUD_FEED_YOU_AND_ONE_PERSON_LIKED_THIS_PHOTO_PHRASE_FORMAT";
        }
        if (a5) {
          v73 = @"CLOUD_FEED_YOU_AND_ONE_PERSON_LIKED_THIS_VIDEO_YOU_SUBJECT";
        }
        else {
          v73 = @"CLOUD_FEED_YOU_AND_ONE_PERSON_LIKED_THIS_PHOTO_YOU_SUBJECT";
        }
        PXLocalizedStringFromTable(v72, @"PhotosUICore");
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v73, @"PhotosUICore");
        uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v74 = objc_alloc(MEMORY[0x1E4F28B18]);
        id v75 = v12;
        if (v19) {
          v76 = v19;
        }
        else {
          v76 = &stru_1F00B0030;
        }
        BOOL v24 = (__CFString *)[v74 initWithString:v76 attributes:v13];
        id v77 = objc_alloc(MEMORY[0x1E4F28B18]);
        v78 = [v11 objectAtIndex:0];
        v26 = (void *)[v77 initWithString:v78 attributes:v13];

        v79 = (void *)MEMORY[0x1E4F28B18];
        if (v18) {
          v80 = v18;
        }
        else {
          v80 = &stru_1F00B0030;
        }
        v119[0] = v24;
        v119[1] = v26;
        v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
        uint64_t v27 = objc_msgSend(v79, "px_stringWithFormat:defaultAttributes:arguments:", v80, v75, v81);

        id v12 = v75;
LABEL_74:

        goto LABEL_96;
      }
      if (!v14)
      {
        if (a5) {
          id v16 = @"CLOUD_FEED_YOU_LIKED_THIS_VIDEO_PHRASE_FORMAT";
        }
        else {
          id v16 = @"CLOUD_FEED_YOU_LIKED_THIS_PHOTO_PHRASE_FORMAT";
        }
        if (a5) {
          id v17 = @"CLOUD_FEED_YOU_LIKED_THIS_VIDEO_SUBJECT";
        }
        else {
          id v17 = @"CLOUD_FEED_YOU_LIKED_THIS_PHOTO_SUBJECT";
        }
        PXLocalizedStringFromTable(v16, @"PhotosUICore");
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v17, @"PhotosUICore");
        uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v21 = &stru_1F00B0030;
        if (v19) {
          id v22 = v19;
        }
        else {
          id v22 = &stru_1F00B0030;
        }
        uint64_t v23 = [v20 initWithString:v22 attributes:v13];
        BOOL v24 = (__CFString *)v23;
        BOOL v25 = (void *)MEMORY[0x1E4F28B18];
        if (v18) {
          uint64_t v21 = v18;
        }
        v120[0] = v23;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:1];
        uint64_t v27 = objc_msgSend(v25, "px_stringWithFormat:defaultAttributes:arguments:", v21, v12, v26);
        goto LABEL_74;
      }
      if (v14 >= 3)
      {
        if (a5) {
          v82 = @"CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_VIDEO_PHRASE_FORMAT";
        }
        else {
          v82 = @"CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_PHOTO_PHRASE_FORMAT";
        }
        if (a5) {
          v83 = @"CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_VIDEO_YOU_SUBJECT";
        }
        else {
          v83 = @"CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_PHOTO_YOU_SUBJECT";
        }
        if (a5) {
          v84 = @"CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_VIDEO_LIST_SEPARATOR";
        }
        else {
          v84 = @"CLOUD_FEED_YOU_AND_MORE_PERSONS_LIKED_THIS_PHOTO_LIST_SEPARATOR";
        }
        PXLocalizedStringFromTable(v82, @"PhotosUICore");
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v83, @"PhotosUICore");
        uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v84, @"PhotosUICore");
        BOOL v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        id v85 = objc_alloc(MEMORY[0x1E4F28B18]);
        if (v19) {
          v86 = v19;
        }
        else {
          v86 = &stru_1F00B0030;
        }
        uint64_t v102 = [v85 initWithString:v86 attributes:v13];
        id v105 = v12;
        v87 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1F00B0030];
        id v88 = objc_alloc(MEMORY[0x1E4F28B18]);
        if (v24) {
          v89 = v24;
        }
        else {
          v89 = &stru_1F00B0030;
        }
        v90 = (void *)[v88 initWithString:v89 attributes:v105];
        v91 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v15);
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __159__NSAttributedString_PXLocalization__px_localizedAttributedStringForLikesFromUser_otherPeopleFullNames_isVideo_defaultTextAttributes_emphasizedTextAttributes___block_invoke;
        v110[3] = &unk_1E5DD2E68;
        id v111 = v87;
        id v112 = v90;
        id v92 = v13;
        id v113 = v92;
        id v101 = v90;
        id v93 = v87;
        [v11 enumerateObjectsAtIndexes:v91 options:0 usingBlock:v110];

        id v94 = objc_alloc(MEMORY[0x1E4F28B18]);
        v95 = [v11 lastObject];
        v96 = (void *)[v94 initWithString:v95 attributes:v92];

        v97 = (void *)MEMORY[0x1E4F28B18];
        if (v18) {
          v98 = v18;
        }
        else {
          v98 = &stru_1F00B0030;
        }
        v117[0] = v102;
        v117[1] = v93;
        v117[2] = v96;
        v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:3];
        uint64_t v27 = objc_msgSend(v97, "px_stringWithFormat:defaultAttributes:arguments:", v98, v105, v99);

        v57 = (void *)v102;
        id v12 = v105;
LABEL_95:

        goto LABEL_96;
      }
      goto LABEL_100;
    }
    if (a5) {
      v58 = @"CLOUD_FEED_YOU_AND_TWO_PERSONS_LIKED_THIS_VIDEO_PHRASE_FORMAT";
    }
    else {
      v58 = @"CLOUD_FEED_YOU_AND_TWO_PERSONS_LIKED_THIS_PHOTO_PHRASE_FORMAT";
    }
    if (a5) {
      v59 = @"CLOUD_FEED_YOU_AND_TWO_PERSONS_LIKED_THIS_VIDEO_YOU_SUBJECT";
    }
    else {
      v59 = @"CLOUD_FEED_YOU_AND_TWO_PERSONS_LIKED_THIS_PHOTO_YOU_SUBJECT";
    }
    PXLocalizedStringFromTable(v58, @"PhotosUICore");
    id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v59, @"PhotosUICore");
    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v60 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (v19) {
      v61 = v19;
    }
    else {
      v61 = &stru_1F00B0030;
    }
    BOOL v24 = (__CFString *)[v60 initWithString:v61 attributes:v13];
    id v62 = objc_alloc(MEMORY[0x1E4F28B18]);
    v63 = [v11 objectAtIndex:0];
    v41 = (void *)[v62 initWithString:v63 attributes:v13];

    id v64 = objc_alloc(MEMORY[0x1E4F28B18]);
    v65 = [v11 objectAtIndex:1];
    uint64_t v66 = [v64 initWithString:v65 attributes:v13];
    id v104 = v13;
    id v67 = v12;
    v68 = (void *)v66;

    v69 = (void *)MEMORY[0x1E4F28B18];
    if (v18) {
      v70 = v18;
    }
    else {
      v70 = &stru_1F00B0030;
    }
    v118[0] = v24;
    v118[1] = v41;
    v118[2] = v68;
    v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:3];
    uint64_t v27 = objc_msgSend(v69, "px_stringWithFormat:defaultAttributes:arguments:", v70, v67, v71);

    id v12 = v67;
    id v13 = v104;
LABEL_60:

LABEL_96:
    goto LABEL_97;
  }
  if (v14 == 2)
  {
    if (a5) {
      v34 = @"CLOUD_FEED_TWO_PERSONS_LIKED_THIS_VIDEO_PHRASE_FORMAT";
    }
    else {
      v34 = @"CLOUD_FEED_TWO_PERSONS_LIKED_THIS_PHOTO_PHRASE_FORMAT";
    }
    PXLocalizedStringFromTable(v34, @"PhotosUICore");
    id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v35 = objc_alloc(MEMORY[0x1E4F28B18]);
    v36 = [v11 objectAtIndex:0];
    uint64_t v19 = (__CFString *)[v35 initWithString:v36 attributes:v13];

    id v37 = objc_alloc(MEMORY[0x1E4F28B18]);
    v38 = [v11 objectAtIndex:1];
    BOOL v24 = (__CFString *)[v37 initWithString:v38 attributes:v13];

    v39 = (void *)MEMORY[0x1E4F28B18];
    if (v18) {
      v40 = v18;
    }
    else {
      v40 = &stru_1F00B0030;
    }
    v115[0] = v19;
    v115[1] = v24;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:2];
    uint64_t v27 = objc_msgSend(v39, "px_stringWithFormat:defaultAttributes:arguments:", v40, v12, v41);
    goto LABEL_60;
  }
  uint64_t v28 = v14 - 1;
  if (v14 == 1)
  {
    if (a5) {
      v29 = @"CLOUD_FEED_SOMEONE_LIKED_THIS_VIDEO_PHRASE_FORMAT";
    }
    else {
      v29 = @"CLOUD_FEED_SOMEONE_LIKED_THIS_PHOTO_PHRASE_FORMAT";
    }
    PXLocalizedStringFromTable(v29, @"PhotosUICore");
    id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v30 = objc_alloc(MEMORY[0x1E4F28B18]);
    v31 = [v11 firstObject];
    uint64_t v19 = (__CFString *)[v30 initWithString:v31 attributes:v13];

    uint64_t v32 = (void *)MEMORY[0x1E4F28B18];
    if (v18) {
      v33 = v18;
    }
    else {
      v33 = &stru_1F00B0030;
    }
    v116 = v19;
    BOOL v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
    uint64_t v27 = objc_msgSend(v32, "px_stringWithFormat:defaultAttributes:arguments:", v33, v12, v24);
    goto LABEL_96;
  }
  if (v14 >= 3)
  {
    if (a5) {
      v42 = @"CLOUD_FEED_MORE_PERSONS_LIKED_THIS_VIDEO_PHRASE_FORMAT";
    }
    else {
      v42 = @"CLOUD_FEED_MORE_PERSONS_LIKED_THIS_PHOTO_PHRASE_FORMAT";
    }
    if (a5) {
      v43 = @"CLOUD_FEED_MORE_PERSONS_LIKED_THIS_VIDEO_LIST_SEPARATOR";
    }
    else {
      v43 = @"CLOUD_FEED_MORE_PERSONS_LIKED_THIS_PHOTO_LIST_SEPARATOR";
    }
    PXLocalizedStringFromTable(v42, @"PhotosUICore");
    id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v43, @"PhotosUICore");
    uint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E48]), "initWithString:");
    id v45 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (v19) {
      long long v46 = v19;
    }
    else {
      long long v46 = &stru_1F00B0030;
    }
    long long v47 = (void *)[v45 initWithString:v46 attributes:v12];
    objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v28);
    v49 = id v48 = v12;
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __159__NSAttributedString_PXLocalization__px_localizedAttributedStringForLikesFromUser_otherPeopleFullNames_isVideo_defaultTextAttributes_emphasizedTextAttributes___block_invoke_2;
    v106[3] = &unk_1E5DD2E68;
    id v107 = v44;
    id v108 = v47;
    id v50 = v13;
    id v109 = v50;
    id v103 = v47;
    BOOL v24 = v44;
    [v11 enumerateObjectsAtIndexes:v49 options:0 usingBlock:v106];

    id v51 = objc_alloc(MEMORY[0x1E4F28B18]);
    v52 = [v11 lastObject];
    v53 = (void *)[v51 initWithString:v52 attributes:v50];

    v54 = (void *)MEMORY[0x1E4F28B18];
    if (v18) {
      v55 = v18;
    }
    else {
      v55 = &stru_1F00B0030;
    }
    v114[0] = v24;
    v114[1] = v53;
    v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:2];
    uint64_t v27 = objc_msgSend(v54, "px_stringWithFormat:defaultAttributes:arguments:", v55, v48, v56);

    id v12 = v48;
    v57 = v103;
    goto LABEL_95;
  }
LABEL_100:
  uint64_t v27 = 0;
LABEL_97:

  return v27;
}

+ (id)px_localizedAttributedStringForCommentWithCommenterFullName:()PXLocalization text:defaultTextAttributes:emphasizedTextAttributes:
{
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1E4F28B88];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  uint64_t v14 = [v10 whitespaceAndNewlineCharacterSet];
  uint64_t v15 = [v9 stringByTrimmingCharactersInSet:v14];

  if (![(__CFString *)v15 length])
  {
    id v16 = (__CFString *)v9;

    uint64_t v15 = v16;
  }
  id v17 = PXLocalizedStringFromTable(@"CLOUD_FEED_SOMEONE_SAID_SOMETHING_PHRASE_FORMAT", @"PhotosUICore");
  id v18 = v17;
  uint64_t v19 = &stru_1F00B0030;
  if (v13) {
    id v20 = v13;
  }
  else {
    id v20 = &stru_1F00B0030;
  }
  if (v15) {
    uint64_t v19 = v15;
  }
  BOOL v24 = v20;
  BOOL v25 = v19;
  uint64_t v21 = PXLocalizedStringWithValidatedFormat(v17, @"%@ %@");

  id v22 = objc_msgSend(MEMORY[0x1E4F28B18], "px_attributedStringWithHTMLString:defaultAttributes:emphasizedAttributes:italicizedAttributes:", v21, v12, v11, 0, v24, v25);

  return v22;
}

+ (id)px_localizedAttributedStringForUserCommentWithText:()PXLocalization defaultTextAttributes:emphasizedTextAttributes:
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F28B88];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 whitespaceAndNewlineCharacterSet];
  id v12 = [v7 stringByTrimmingCharactersInSet:v11];

  if (![(__CFString *)v12 length])
  {
    id v13 = (__CFString *)v7;

    id v12 = v13;
  }
  if ([(__CFString *)v12 px_endsWithFullStopOrEquivalentPunctuationMark])uint64_t v14 = @"CLOUD_FEED_YOU_SAID_SOMETHING_WITH_FULL_STOP_PHRASE_FORMAT"; {
  else
  }
    uint64_t v14 = @"CLOUD_FEED_YOU_SAID_SOMETHING_PHRASE_FORMAT";
  PXLocalizedStringFromTable(v14, @"PhotosUICore");
  uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(@"CLOUD_FEED_YOU_SAID_SOMETHING_SUBJECT", @"PhotosUICore");
  id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = &stru_1F00B0030;
  }
  uint64_t v19 = (void *)[v17 initWithString:v18 attributes:v9];

  id v20 = (void *)MEMORY[0x1E4F28B18];
  if (v15) {
    uint64_t v21 = v15;
  }
  else {
    uint64_t v21 = &stru_1F00B0030;
  }
  if (v12) {
    id v22 = v12;
  }
  else {
    id v22 = &stru_1F00B0030;
  }
  v26[0] = v19;
  v26[1] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  BOOL v24 = objc_msgSend(v20, "px_stringWithFormat:defaultAttributes:arguments:", v21, v10, v23);

  return v24;
}

+ (id)px_localizedAttributedStringForPostWithSubjectFullName:()PXLocalization photoCount:videoCount:defaultTextAttributes:emphasizedTextAttributes:
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  if (a4 != 1 || a5)
  {
    if (a4 || a5 != 1)
    {
      if (a4 < 2 || a5)
      {
        if (a5 > 1 && a4 == 0) {
          uint64_t v14 = @"CLOUD_FEED_SOMEONE_POSTED_N_VIDEOS_PHRASE_FORMAT";
        }
        else {
          uint64_t v14 = @"CLOUD_FEED_SOMEONE_POSTED_N_ITEMS_PHRASE_FORMAT";
        }
      }
      else
      {
        uint64_t v14 = @"CLOUD_FEED_SOMEONE_POSTED_N_PHOTOS_PHRASE_FORMAT";
      }
    }
    else
    {
      uint64_t v14 = @"CLOUD_FEED_SOMEONE_POSTED_1_VIDEO_PHRASE_FORMAT";
    }
  }
  else
  {
    uint64_t v14 = @"CLOUD_FEED_SOMEONE_POSTED_1_PHOTO_PHRASE_FORMAT";
  }
  PXLocalizedStringFromTable(v14, @"PhotosUICore");
  id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v11) {
    id v18 = v11;
  }
  else {
    id v18 = &stru_1F00B0030;
  }
  uint64_t v19 = (void *)[v17 initWithString:v18 attributes:v13];
  uint64_t v20 = PXLocalizedStringFromInteger(a5 + a4);
  uint64_t v21 = (void *)v20;
  id v22 = (void *)MEMORY[0x1E4F28B18];
  if (v16) {
    uint64_t v23 = v16;
  }
  else {
    uint64_t v23 = &stru_1F00B0030;
  }
  v27[0] = v19;
  v27[1] = v20;
  BOOL v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  BOOL v25 = objc_msgSend(v22, "px_stringWithFormat:defaultAttributes:arguments:", v23, v12, v24);

  return v25;
}

+ (id)px_localizedAttributedStringForUserPostWithPhotoCount:()PXLocalization videoCount:defaultTextAttributes:emphasizedTextAttributes:
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if (a3 != 1 || a4)
  {
    if (a3 || a4 != 1)
    {
      if (a3 < 2 || a4)
      {
        BOOL v13 = a3 == 0;
        BOOL v14 = a4 > 1;
        if (v13 && v14) {
          id v12 = @"CLOUD_FEED_YOU_POSTED_N_VIDEOS_PHRASE_FORMAT";
        }
        else {
          id v12 = @"CLOUD_FEED_YOU_POSTED_N_ITEMS_PHRASE_FORMAT";
        }
        if (v13 && v14) {
          id v11 = @"CLOUD_FEED_YOU_POSTED_N_VIDEOS_SUBJECT";
        }
        else {
          id v11 = @"CLOUD_FEED_YOU_POSTED_N_ITEMS_SUBJECT";
        }
      }
      else
      {
        id v11 = @"CLOUD_FEED_YOU_POSTED_N_PHOTOS_SUBJECT";
        id v12 = @"CLOUD_FEED_YOU_POSTED_N_PHOTOS_PHRASE_FORMAT";
      }
    }
    else
    {
      id v11 = @"CLOUD_FEED_YOU_POSTED_1_VIDEO_SUBJECT";
      id v12 = @"CLOUD_FEED_YOU_POSTED_1_VIDEO_PHRASE_FORMAT";
    }
  }
  else
  {
    id v11 = @"CLOUD_FEED_YOU_POSTED_1_PHOTO_SUBJECT";
    id v12 = @"CLOUD_FEED_YOU_POSTED_1_PHOTO_PHRASE_FORMAT";
  }
  PXLocalizedStringFromTable(v12, @"PhotosUICore");
  uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v11, @"PhotosUICore");
  id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v17 = objc_alloc(MEMORY[0x1E4F28B18]);
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = &stru_1F00B0030;
  }
  uint64_t v19 = (void *)[v17 initWithString:v18 attributes:v10];
  uint64_t v20 = PXLocalizedStringFromInteger(a4 + a3);
  uint64_t v21 = (void *)v20;
  id v22 = (void *)MEMORY[0x1E4F28B18];
  if (v15) {
    uint64_t v23 = v15;
  }
  else {
    uint64_t v23 = &stru_1F00B0030;
  }
  v27[0] = v19;
  v27[1] = v20;
  BOOL v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  BOOL v25 = objc_msgSend(v22, "px_stringWithFormat:defaultAttributes:arguments:", v23, v9, v24);

  return v25;
}

@end